package org.whispersystems.contactdiscovery.resources;

import io.dropwizard.testing.junit.ResourceTestRule;

import org.apache.commons.lang3.tuple.Pair;
import org.glassfish.jersey.test.grizzly.GrizzlyWebTestContainerFactory;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.whispersystems.contactdiscovery.directory.DirectoryManager;
import org.whispersystems.contactdiscovery.directory.InvalidAddressException;
import org.whispersystems.contactdiscovery.entities.DirectoryReconciliationRequest;
import org.whispersystems.contactdiscovery.entities.DirectoryReconciliationResponse;
import org.whispersystems.contactdiscovery.mappers.NoSuchEnclaveExceptionMapper;
import org.whispersystems.contactdiscovery.util.AuthHelper;
import org.whispersystems.contactdiscovery.util.SystemMapper;
import org.whispersystems.dropwizard.simpleauth.AuthValueFactoryProvider;

import javax.ws.rs.client.Entity;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import com.google.common.collect.Streams;

import java.util.List;
import java.util.Optional;
import java.util.UUID;
import java.util.stream.Collectors;

import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.*;

public class DirectoryManagementResourceTest {

  private final DirectoryManager directoryManager = mock(DirectoryManager.class);

  private final UUID validUuid = UUID.fromString("1447ea61-f636-42b2-b6d2-97aa73760a60");

  @Rule
  public final ResourceTestRule resources = ResourceTestRule.builder()
                                                            .addProvider(AuthHelper.getAuthFilter())
                                                            .addProvider(new AuthValueFactoryProvider.Binder())
                                                            .setMapper(SystemMapper.getMapper())
                                                            .setTestContainerFactory(new GrizzlyWebTestContainerFactory())
                                                            .addProvider(new NoSuchEnclaveExceptionMapper())
                                                            .addResource(new DirectoryManagementResource(directoryManager))
                                                            .build();

  @Before
  public void setup() throws Exception {
    when(directoryManager.reconcile(any(), any(), any())).thenReturn(true);
  }

  @Test
  public void testDirectoryReconcileAll() throws Exception {
    List<UUID>   uuids     = List.of(validUuid);
    List<String> addresses = List.of("+14151111111");

    List<Pair<UUID, String>> users = Streams.zip(uuids.stream(), addresses.stream(), Pair::of)
                                            .collect(Collectors.toList());

    DirectoryReconciliationRequest  reconciliationRequest  = new DirectoryReconciliationRequest(null, null, uuids, addresses);
    DirectoryReconciliationResponse reconciliationResponse = resources.getJerseyTest()
                                                                      .target("/v1/directory/reconcile")
                                                                      .request(MediaType.APPLICATION_JSON_TYPE)
                                                                      .header("Authorization", AuthHelper.getAuthHeader(AuthHelper.VALID_NUMBER, AuthHelper.VALID_TOKEN))
                                                                      .put(Entity.json(reconciliationRequest), DirectoryReconciliationResponse.class);

    assertEquals(DirectoryReconciliationResponse.Status.OK, reconciliationResponse.getStatus());
    verify(directoryManager, times(1)).reconcile(eq(Optional.empty()), eq(Optional.empty()), eq(users));
  }

  @Test
        public void testDirectoryReconcilePart() throws Exception {
    List<UUID>   uuids     = List.of(validUuid);
    List<String> addresses = List.of("+14151111111");

    List<Pair<UUID, String>> users = Streams.zip(uuids.stream(), addresses.stream(), Pair::of)
                                            .collect(Collectors.toList());

    DirectoryReconciliationRequest  requestOne  = new DirectoryReconciliationRequest(null, validUuid, uuids, addresses);
    DirectoryReconciliationRequest  requestTwo  = new DirectoryReconciliationRequest(validUuid, null, null, null);
    DirectoryReconciliationResponse responseOne = resources.getJerseyTest()
                                                           .target("/v1/directory/reconcile")
                                                           .request(MediaType.APPLICATION_JSON_TYPE)
                                                           .header("Authorization", AuthHelper.getAuthHeader(AuthHelper.VALID_NUMBER, AuthHelper.VALID_TOKEN))
                                                           .put(Entity.json(requestOne), DirectoryReconciliationResponse.class);

    DirectoryReconciliationResponse responseTwo = resources.getJerseyTest()
                                                           .target("/v1/directory/reconcile")
                                                           .request(MediaType.APPLICATION_JSON_TYPE)
                                                           .header("Authorization", AuthHelper.getAuthHeader(AuthHelper.VALID_NUMBER, AuthHelper.VALID_TOKEN))
                                                           .put(Entity.json(requestTwo), DirectoryReconciliationResponse.class);

    assertEquals(DirectoryReconciliationResponse.Status.OK, responseOne.getStatus());
    assertEquals(DirectoryReconciliationResponse.Status.OK, responseTwo.getStatus());

    verify(directoryManager, times(1)).reconcile(eq(Optional.empty()), eq(Optional.of(validUuid)), eq(users));
    verify(directoryManager, times(1)).reconcile(eq(Optional.of(validUuid)), eq(Optional.empty()), eq(List.of()));
  }

  @Test
  public void testDirectoryReconcileMissing() throws Exception {
    when(directoryManager.reconcile(any(), any(), any())).thenReturn(false);

    DirectoryReconciliationRequest  request  = new DirectoryReconciliationRequest(null, null, List.of(), List.of());
    DirectoryReconciliationResponse response = resources.getJerseyTest()
                                                        .target("/v1/directory/reconcile")
                                                        .request(MediaType.APPLICATION_JSON_TYPE)
                                                        .header("Authorization", AuthHelper.getAuthHeader("signal", AuthHelper.VALID_SERVER_TOKEN))
                                                        .put(Entity.json(request), DirectoryReconciliationResponse.class);

    assertEquals(DirectoryReconciliationResponse.Status.MISSING, response.getStatus());
  }

}

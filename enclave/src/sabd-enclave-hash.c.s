	.file	"sabd-enclave-hash.c"
# GNU C11 (Debian 8.3.0-6) version 8.3.0 (x86_64-linux-gnu)
#	compiled by GNU C version 8.3.0, GMP version 6.1.2, MPFR version 4.0.2, MPC version 1.1.0, isl version isl-0.20-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -I include -I include/bearssl
# -I build/linux-sgx-sgx_2.6-g991bd53a76a5/common/inc
# -I build/linux-sgx-sgx_2.6-g991bd53a76a5/common/inc/tlibc
# -imultiarch x86_64-linux-gnu -D _DEFAULT_SOURCE src/sabd-enclave-hash.c
# -m64 -march=skylake -auxbase-strip src/sabd-enclave-hash.c.s -ggdb -ggdb0
# -O2 -Wall -Werror=all -Wextra -Wno-unused-parameter
# -Wno-missing-field-initializers -std=c11 -fstack-protector
# -fvisibility=hidden -fPIC -fno-builtin -ffreestanding -fverbose-asm
# options enabled:  -fPIC -faggressive-loop-optimizations -falign-labels
# -fasynchronous-unwind-tables -fauto-inc-dec -fbranch-count-reg
# -fcaller-saves -fchkp-check-incomplete-type -fchkp-check-read
# -fchkp-check-write -fchkp-instrument-calls -fchkp-narrow-bounds
# -fchkp-optimize -fchkp-store-bounds -fchkp-use-static-bounds
# -fchkp-use-static-const-bounds -fchkp-use-wrappers -fcode-hoisting
# -fcombine-stack-adjustments -fcommon -fcompare-elim -fcprop-registers
# -fcrossjumping -fcse-follow-jumps -fdefer-pop
# -fdelete-null-pointer-checks -fdevirtualize -fdevirtualize-speculatively
# -fdwarf2-cfi-asm -fearly-inlining -feliminate-unused-debug-types
# -fexpensive-optimizations -fforward-propagate -ffp-int-builtin-inexact
# -ffunction-cse -fgcse -fgcse-lm -fgnu-runtime -fgnu-unique
# -fguess-branch-probability -fhoist-adjacent-loads -fident -fif-conversion
# -fif-conversion2 -findirect-inlining -finline -finline-atomics
# -finline-functions-called-once -finline-small-functions -fipa-bit-cp
# -fipa-cp -fipa-icf -fipa-icf-functions -fipa-icf-variables -fipa-profile
# -fipa-pure-const -fipa-ra -fipa-reference -fipa-sra -fipa-vrp
# -fira-hoist-pressure -fira-share-save-slots -fira-share-spill-slots
# -fisolate-erroneous-paths-dereference -fivopts -fkeep-static-consts
# -fleading-underscore -flifetime-dse -flra-remat -flto-odr-type-merging
# -fmath-errno -fmerge-constants -fmerge-debug-strings
# -fmove-loop-invariants -fomit-frame-pointer -foptimize-sibling-calls
# -foptimize-strlen -fpartial-inlining -fpeephole -fpeephole2 -fplt
# -fprefetch-loop-arrays -free -freg-struct-return -freorder-blocks
# -freorder-blocks-and-partition -freorder-functions -frerun-cse-after-loop
# -fsched-critical-path-heuristic -fsched-dep-count-heuristic
# -fsched-group-heuristic -fsched-interblock -fsched-last-insn-heuristic
# -fsched-rank-heuristic -fsched-spec -fsched-spec-insn-heuristic
# -fsched-stalled-insns-dep -fschedule-fusion -fschedule-insns2
# -fsemantic-interposition -fshow-column -fshrink-wrap
# -fshrink-wrap-separate -fsigned-zeros -fsplit-ivs-in-unroller
# -fsplit-wide-types -fssa-backprop -fssa-phiopt -fstack-protector
# -fstdarg-opt -fstore-merging -fstrict-aliasing
# -fstrict-volatile-bitfields -fsync-libcalls -fthread-jumps
# -ftoplevel-reorder -ftrapping-math -ftree-bit-ccp -ftree-builtin-call-dce
# -ftree-ccp -ftree-ch -ftree-coalesce-vars -ftree-copy-prop -ftree-cselim
# -ftree-dce -ftree-dominator-opts -ftree-dse -ftree-forwprop -ftree-fre
# -ftree-loop-if-convert -ftree-loop-im -ftree-loop-ivcanon
# -ftree-loop-optimize -ftree-parallelize-loops= -ftree-phiprop -ftree-pre
# -ftree-pta -ftree-reassoc -ftree-scev-cprop -ftree-sink -ftree-slsr
# -ftree-sra -ftree-switch-conversion -ftree-tail-merge -ftree-ter
# -ftree-vrp -funit-at-a-time -funwind-tables -fverbose-asm
# -fzero-initialized-in-bss -m128bit-long-double -m64 -m80387 -madx -maes
# -malign-stringops -mavx -mavx2 -mbmi -mbmi2 -mclflushopt -mcx16 -mf16c
# -mfancy-math-387 -mfma -mfp-ret-in-387 -mfsgsbase -mfxsr -mglibc -mhle
# -mieee-fp -mlong-double-80 -mlzcnt -mmmx -mmovbe -mpclmul -mpopcnt
# -mprfchw -mpush-args -mrdrnd -mrdseed -mred-zone -msahf -msgx -msse
# -msse2 -msse3 -msse4 -msse4.1 -msse4.2 -mssse3 -mstv
# -mtls-direct-seg-refs -mvzeroupper -mxsave -mxsavec -mxsaveopt -mxsaves

	.text
	.p2align 4,,15
	.globl	sabd_lookup_hash
	.hidden	sabd_lookup_hash
	.type	sabd_lookup_hash, @function
sabd_lookup_hash:
.LFB5440:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%r15	#
	pushq	%r14	#
	pushq	%r13	#
	pushq	%r12	#
	pushq	%rbx	#
	andq	$-32, %rsp	#,
	subq	$256, %rsp	#,
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
# src/sabd-enclave-hash.c:184:   uint32_t hash_table_order = likely(ab_phone_count > 1)? _bit_scan_reverse(ab_phone_count - 1) + 1 : 0;
	cmpl	$1, %r8d	#, ab_phone_count
	jbe	.L49	#,
# src/sabd-enclave-hash.c:184:   uint32_t hash_table_order = likely(ab_phone_count > 1)? _bit_scan_reverse(ab_phone_count - 1) + 1 : 0;
	leal	-1(%r8), %r12d	#, tmp743
# /usr/lib/gcc/x86_64-linux-gnu/8/include/ia32intrin.h:41:   return __builtin_ia32_bsrsi (__X);
	bsrl	%r12d, %r12d	# tmp743, tmp742
# src/sabd-enclave-hash.c:184:   uint32_t hash_table_order = likely(ab_phone_count > 1)? _bit_scan_reverse(ab_phone_count - 1) + 1 : 0;
	incl	%r12d	# iftmp.0_105
# src/sabd-enclave-hash.c:190:   if (unlikely(hash_table_order > SABD_MAX_HASH_TABLE_ORDER)) {
	cmpl	$13, %r12d	#, iftmp.0_105
	ja	.L32	#,
	movl	$1, %eax	#, tmp745
	shlx	%r12d, %eax, %eax	# iftmp.0_105, tmp745, _1208
	movl	%eax, 64(%rsp)	# _1208, %sfp
	movl	$16, %eax	#, tmp748
	shlx	%r12d, %eax, %eax	# iftmp.0_105, tmp748, tmp749
	salq	$3, %rax	#, _1213
	movq	%rax, 96(%rsp)	# _1213, %sfp
	movl	$4, %ebx	#, tmp746
	shlx	%r12d, %ebx, %ebx	# iftmp.0_105, tmp746,
.L4:
	movq	%rsi, 72(%rsp)	# in_uuids, %sfp
# src/sabd-enclave-hash.c:202:   phone_t *hashed_ab_phones = memalign(SABD_CACHE_LINE_SIZE, hashed_ab_phones_size);
	movq	96(%rsp), %rsi	# %sfp,
	movq	%rdi, 80(%rsp)	# in_phones, %sfp
	movl	$64, %edi	#,
	movq	%r9, 56(%rsp)	# in_ab_phones_result, %sfp
	movl	%r8d, %r15d	# ab_phone_count, ab_phone_count
	movq	%rcx, 224(%rsp)	# ab_phones, %sfp
	movq	%rdx, 120(%rsp)	# in_phone_count, %sfp
	call	memalign@PLT	#
	movq	%rax, %r13	#, hashed_ab_phones
# src/sabd-enclave-hash.c:203:   if (unlikely(hashed_ab_phones == NULL)) {
	testq	%rax, %rax	# hashed_ab_phones
	je	.L33	#,
# src/sabd-enclave-hash.c:208:   size_t in_hashed_ab_phones_result_size = hash_table_block_count * sizeof(sabd_lookup_hashed_ab_phones_result_t);
	salq	$6, %rbx	#, in_hashed_ab_phones_result_size
# src/sabd-enclave-hash.c:209:   volatile sabd_lookup_hashed_ab_phones_result_t *in_hashed_ab_phones_result = memalign(SABD_CACHE_LINE_SIZE, in_hashed_ab_phones_result_size);
	movq	%rbx, %rsi	# in_hashed_ab_phones_result_size,
	movl	$64, %edi	#,
	call	memalign@PLT	#
	movq	%rax, %r14	#, in_hashed_ab_phones_result
# src/sabd-enclave-hash.c:213:   if (unlikely(in_hashed_ab_phones_result == NULL)) {
	testq	%rax, %rax	# in_hashed_ab_phones_result
	je	.L50	#,
# src/sabd-enclave-hash.c:217:   memset_s(in_hashed_ab_phones_result, in_hashed_ab_phones_result_size, 0, in_hashed_ab_phones_result_size);
	movq	%rbx, %rcx	# in_hashed_ab_phones_result_size,
	movq	%rbx, %rsi	# in_hashed_ab_phones_result_size,
	xorl	%edx, %edx	#
	movq	%rax, %rdi	# in_hashed_ab_phones_result,
	call	memset_s@PLT	#
# src/sabd-enclave-hash.c:220:   size_t in_ab_phones_result_size = ab_phone_count * sizeof(in_ab_phones_result[0]);
	movl	%r15d, %esi	# ab_phone_count, ab_phone_count
# src/sabd-enclave-hash.c:220:   size_t in_ab_phones_result_size = ab_phone_count * sizeof(in_ab_phones_result[0]);
	salq	$4, %rsi	#, in_ab_phones_result_size
# src/sabd-enclave-hash.c:221:   memset_s(in_ab_phones_result, in_ab_phones_result_size, UINT8_MAX, in_ab_phones_result_size);
	movq	56(%rsp), %rdi	# %sfp,
	movq	%rsi, %rcx	# in_ab_phones_result_size,
	movl	$255, %edx	#,
	call	memset_s@PLT	#
# src/sabd-enclave-hash.c:224:   memset_s(hashed_ab_phones, hashed_ab_phones_size, 0, hashed_ab_phones_size);
	movq	96(%rsp), %rsi	# %sfp, _1213
	movq	%r13, %rdi	# hashed_ab_phones,
	movq	%rsi, %rcx	# _1213,
	xorl	%edx, %edx	#
	call	memset_s@PLT	#
	movq	224(%rsp), %rax	# %sfp, ab_phones
	leal	-1(%r15), %edi	#, _927
# src/sabd-enclave-hash.c:102:   return _mm_cvtsi128_si32(hash) & ((1 << hash_table_order) - 1);
	movl	$1, %ebx	#, tmp752
	shlx	%r12d, %ebx, %ebx	# iftmp.0_105, tmp752, _371
	movq	%rdi, 48(%rsp)	# _927, %sfp
	leaq	8(%rax,%rdi,8), %r12	#, _914
	leaq	240(%rsp), %rdi	#, tmp1205
	movq	%rax, 40(%rsp)	# ab_phones, %sfp
# src/sabd-enclave-hash.c:102:   return _mm_cvtsi128_si32(hash) & ((1 << hash_table_order) - 1);
	movl	$128, 68(%rsp)	#, %sfp
	movq	%rdi, 112(%rsp)	# tmp1205, %sfp
	movq	%r14, 88(%rsp)	# in_hashed_ab_phones_result, %sfp
	movl	64(%rsp), %r14d	# %sfp, _1208
	movq	%r13, %r8	# hashed_ab_phones, hashed_ab_phones
	decl	%ebx	# _768
	movq	%rax, %r13	# ab_phones, ab_phones
.L6:
	movq	112(%rsp), %rsi	# %sfp, tmp1205
# src/sabd-enclave-hash.c:184:   uint32_t hash_table_order = likely(ab_phone_count > 1)? _bit_scan_reverse(ab_phone_count - 1) + 1 : 0;
	movl	$10, %ecx	#, ivtmp_1186
# /usr/lib/gcc/x86_64-linux-gnu/8/include/immintrin.h:237:   return __builtin_ia32_rdrand64_step (__P);
	movl	$1, %edx	#, tmp758
.L8:
	rdrand	%rax	# tmp757
	movq	%rax, (%rsi)	# tmp757,
	cmovc	%edx, %eax	# tmp757,, tmp758, _316
# src/sabd-enclave-hash.c:234:       if (likely(_rdrand64_step(&hash_salt_64[0])) && likely(_rdrand64_step(&hash_salt_64[1]))) {
	testl	%eax, %eax	# _316
	je	.L11	#,
# /usr/lib/gcc/x86_64-linux-gnu/8/include/immintrin.h:237:   return __builtin_ia32_rdrand64_step (__P);
	rdrand	%rax	# tmp761
	movq	%rax, 8(%rsi)	# tmp761,
	cmovc	%edx, %eax	# tmp761,, tmp758, _311
# src/sabd-enclave-hash.c:234:       if (likely(_rdrand64_step(&hash_salt_64[0])) && likely(_rdrand64_step(&hash_salt_64[1]))) {
	testl	%eax, %eax	# _311
	je	.L11	#,
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:592:   return __extension__ (__m128i)(__v2di){ __q0, __q1 };
	vmovq	248(%rsp), %xmm3	# MEM[(long long unsigned int *)&hash_salt_64 + 8B], tmp1419
	movq	%r8, %r11	# hashed_ab_phones, ivtmp.114
	vpinsrq	$1, 240(%rsp), %xmm3, %xmm4	# MEM[(long long unsigned int *)&hash_salt_64], tmp1419, tmp1088
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:1293:   return (__m128i) ((__v2du)__A ^ (__v2du)__B);
	movq	%r8, %r9	# hashed_ab_phones, ivtmp.169
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:1193:   return (__m128i)__builtin_ia32_pslldqi128 (__A, __N * 8);
	vpslldq	$4, %xmm4, %xmm0	#, tmp1421, tmp1093
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:1293:   return (__m128i) ((__v2du)__A ^ (__v2du)__B);
	vpxor	%xmm4, %xmm0, %xmm0	# tmp1088, tmp1093, _453
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:1193:   return (__m128i)__builtin_ia32_pslldqi128 (__A, __N * 8);
	vpslldq	$4, %xmm0, %xmm1	#, _453, tmp1095
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:1293:   return (__m128i) ((__v2du)__A ^ (__v2du)__B);
	vpxor	%xmm1, %xmm0, %xmm0	# tmp1095, _453, _457
# /usr/lib/gcc/x86_64-linux-gnu/8/include/wmmintrin.h:89:   return (__m128i) __builtin_ia32_aeskeygenassist128 ((__v2di)__X, __C);
	vaeskeygenassist	$1, %xmm4, %xmm2	#, tmp1088, tmp1091
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:1193:   return (__m128i)__builtin_ia32_pslldqi128 (__A, __N * 8);
	vpslldq	$4, %xmm0, %xmm1	#, _457, tmp1097
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:1422:   return (__m128i)__builtin_ia32_pshufd ((__v4si)__A, __mask);
	vpshufd	$255, %xmm2, %xmm2	#, tmp1091, tmp1099
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:1293:   return (__m128i) ((__v2du)__A ^ (__v2du)__B);
	vpxor	%xmm2, %xmm1, %xmm1	# tmp1099, tmp1097, tmp1101
	vpxor	%xmm0, %xmm1, %xmm3	# _457, tmp1101, _466
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:1193:   return (__m128i)__builtin_ia32_pslldqi128 (__A, __N * 8);
	vpslldq	$4, %xmm3, %xmm0	#, tmp1425, tmp1104
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:1293:   return (__m128i) ((__v2du)__A ^ (__v2du)__B);
	vpxor	%xmm3, %xmm0, %xmm0	# _466, tmp1104, _470
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:1193:   return (__m128i)__builtin_ia32_pslldqi128 (__A, __N * 8);
	vpslldq	$4, %xmm0, %xmm1	#, _470, tmp1106
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:1293:   return (__m128i) ((__v2du)__A ^ (__v2du)__B);
	vpxor	%xmm1, %xmm0, %xmm0	# tmp1106, _470, _474
# /usr/lib/gcc/x86_64-linux-gnu/8/include/wmmintrin.h:89:   return (__m128i) __builtin_ia32_aeskeygenassist128 ((__v2di)__X, __C);
	vaeskeygenassist	$2, %xmm3, %xmm2	#, _466, tmp1102
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:1193:   return (__m128i)__builtin_ia32_pslldqi128 (__A, __N * 8);
	vpslldq	$4, %xmm0, %xmm1	#, _474, tmp1108
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:1422:   return (__m128i)__builtin_ia32_pshufd ((__v4si)__A, __mask);
	vpshufd	$255, %xmm2, %xmm2	#, tmp1102, tmp1110
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:1293:   return (__m128i) ((__v2du)__A ^ (__v2du)__B);
	vpxor	%xmm2, %xmm1, %xmm1	# tmp1110, tmp1108, tmp1112
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:592:   return __extension__ (__m128i)(__v2di){ __q0, __q1 };
	vmovaps	%xmm4, 144(%rsp)	# tmp1088, %sfp
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:1293:   return (__m128i) ((__v2du)__A ^ (__v2du)__B);
	vpxor	%xmm0, %xmm1, %xmm4	# _474, tmp1112, _483
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:1193:   return (__m128i)__builtin_ia32_pslldqi128 (__A, __N * 8);
	vpslldq	$4, %xmm4, %xmm0	#, tmp1429, tmp1115
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:1293:   return (__m128i) ((__v2du)__A ^ (__v2du)__B);
	vpxor	%xmm4, %xmm0, %xmm0	# _483, tmp1115, _487
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:1193:   return (__m128i)__builtin_ia32_pslldqi128 (__A, __N * 8);
	vpslldq	$4, %xmm0, %xmm1	#, _487, tmp1117
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:1293:   return (__m128i) ((__v2du)__A ^ (__v2du)__B);
	vpxor	%xmm1, %xmm0, %xmm0	# tmp1117, _487, _491
# /usr/lib/gcc/x86_64-linux-gnu/8/include/wmmintrin.h:89:   return (__m128i) __builtin_ia32_aeskeygenassist128 ((__v2di)__X, __C);
	vaeskeygenassist	$4, %xmm4, %xmm2	#, _483, tmp1113
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:1193:   return (__m128i)__builtin_ia32_pslldqi128 (__A, __N * 8);
	vpslldq	$4, %xmm0, %xmm1	#, _491, tmp1119
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:1422:   return (__m128i)__builtin_ia32_pshufd ((__v4si)__A, __mask);
	vpshufd	$255, %xmm2, %xmm2	#, tmp1113, tmp1121
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:1293:   return (__m128i) ((__v2du)__A ^ (__v2du)__B);
	vpxor	%xmm2, %xmm1, %xmm1	# tmp1121, tmp1119, tmp1123
	vmovaps	%xmm3, 128(%rsp)	# _466, %sfp
	vpxor	%xmm0, %xmm1, %xmm3	# _491, tmp1123, _500
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:1193:   return (__m128i)__builtin_ia32_pslldqi128 (__A, __N * 8);
	vpslldq	$4, %xmm3, %xmm0	#, tmp1433, tmp1126
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:1293:   return (__m128i) ((__v2du)__A ^ (__v2du)__B);
	vpxor	%xmm3, %xmm0, %xmm0	# _500, tmp1126, _504
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:1193:   return (__m128i)__builtin_ia32_pslldqi128 (__A, __N * 8);
	vpslldq	$4, %xmm0, %xmm1	#, _504, tmp1128
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:1293:   return (__m128i) ((__v2du)__A ^ (__v2du)__B);
	vpxor	%xmm1, %xmm0, %xmm0	# tmp1128, _504, _508
# /usr/lib/gcc/x86_64-linux-gnu/8/include/wmmintrin.h:89:   return (__m128i) __builtin_ia32_aeskeygenassist128 ((__v2di)__X, __C);
	vaeskeygenassist	$8, %xmm3, %xmm2	#, _500, tmp1124
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:1193:   return (__m128i)__builtin_ia32_pslldqi128 (__A, __N * 8);
	vpslldq	$4, %xmm0, %xmm1	#, _508, tmp1130
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:1422:   return (__m128i)__builtin_ia32_pshufd ((__v4si)__A, __mask);
	vpshufd	$255, %xmm2, %xmm2	#, tmp1124, tmp1132
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:1293:   return (__m128i) ((__v2du)__A ^ (__v2du)__B);
	vpxor	%xmm2, %xmm1, %xmm1	# tmp1132, tmp1130, tmp1134
	vmovaps	%xmm4, 224(%rsp)	# _483, %sfp
	vpxor	%xmm0, %xmm1, %xmm4	# _508, tmp1134, _517
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:1193:   return (__m128i)__builtin_ia32_pslldqi128 (__A, __N * 8);
	vpslldq	$4, %xmm4, %xmm0	#, tmp1437, tmp1137
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:1293:   return (__m128i) ((__v2du)__A ^ (__v2du)__B);
	vpxor	%xmm4, %xmm0, %xmm0	# _517, tmp1137, _521
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:1193:   return (__m128i)__builtin_ia32_pslldqi128 (__A, __N * 8);
	vpslldq	$4, %xmm0, %xmm1	#, _521, tmp1139
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:1293:   return (__m128i) ((__v2du)__A ^ (__v2du)__B);
	vpxor	%xmm1, %xmm0, %xmm0	# tmp1139, _521, _525
# /usr/lib/gcc/x86_64-linux-gnu/8/include/wmmintrin.h:89:   return (__m128i) __builtin_ia32_aeskeygenassist128 ((__v2di)__X, __C);
	vaeskeygenassist	$16, %xmm4, %xmm2	#, _517, tmp1135
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:1193:   return (__m128i)__builtin_ia32_pslldqi128 (__A, __N * 8);
	vpslldq	$4, %xmm0, %xmm1	#, _525, tmp1141
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:1422:   return (__m128i)__builtin_ia32_pshufd ((__v4si)__A, __mask);
	vpshufd	$255, %xmm2, %xmm2	#, tmp1135, tmp1143
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:1293:   return (__m128i) ((__v2du)__A ^ (__v2du)__B);
	vpxor	%xmm2, %xmm1, %xmm1	# tmp1143, tmp1141, tmp1145
	vmovaps	%xmm3, 208(%rsp)	# _500, %sfp
	vpxor	%xmm0, %xmm1, %xmm3	# _525, tmp1145, _534
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:1193:   return (__m128i)__builtin_ia32_pslldqi128 (__A, __N * 8);
	vpslldq	$4, %xmm3, %xmm0	#, tmp1441, tmp1148
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:1293:   return (__m128i) ((__v2du)__A ^ (__v2du)__B);
	vpxor	%xmm3, %xmm0, %xmm0	# _534, tmp1148, _538
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:1193:   return (__m128i)__builtin_ia32_pslldqi128 (__A, __N * 8);
	vpslldq	$4, %xmm0, %xmm1	#, _538, tmp1150
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:1293:   return (__m128i) ((__v2du)__A ^ (__v2du)__B);
	vpxor	%xmm1, %xmm0, %xmm0	# tmp1150, _538, _542
# /usr/lib/gcc/x86_64-linux-gnu/8/include/wmmintrin.h:89:   return (__m128i) __builtin_ia32_aeskeygenassist128 ((__v2di)__X, __C);
	vaeskeygenassist	$32, %xmm3, %xmm2	#, _534, tmp1146
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:1193:   return (__m128i)__builtin_ia32_pslldqi128 (__A, __N * 8);
	vpslldq	$4, %xmm0, %xmm1	#, _542, tmp1152
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:1422:   return (__m128i)__builtin_ia32_pshufd ((__v4si)__A, __mask);
	vpshufd	$255, %xmm2, %xmm2	#, tmp1146, tmp1154
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:1293:   return (__m128i) ((__v2du)__A ^ (__v2du)__B);
	vpxor	%xmm2, %xmm1, %xmm1	# tmp1154, tmp1152, tmp1156
	vpxor	%xmm0, %xmm1, %xmm5	# _542, tmp1156, _551
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:1193:   return (__m128i)__builtin_ia32_pslldqi128 (__A, __N * 8);
	vpslldq	$4, %xmm5, %xmm0	#, tmp1445, tmp1159
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:1293:   return (__m128i) ((__v2du)__A ^ (__v2du)__B);
	vpxor	%xmm5, %xmm0, %xmm0	# _551, tmp1159, _555
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:1193:   return (__m128i)__builtin_ia32_pslldqi128 (__A, __N * 8);
	vpslldq	$4, %xmm0, %xmm12	#, _555, tmp1161
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:1293:   return (__m128i) ((__v2du)__A ^ (__v2du)__B);
	vpxor	%xmm12, %xmm0, %xmm0	# tmp1161, _555, _559
# /usr/lib/gcc/x86_64-linux-gnu/8/include/wmmintrin.h:89:   return (__m128i) __builtin_ia32_aeskeygenassist128 ((__v2di)__X, __C);
	vaeskeygenassist	$64, %xmm5, %xmm1	#, _551, tmp1157
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:1193:   return (__m128i)__builtin_ia32_pslldqi128 (__A, __N * 8);
	vpslldq	$4, %xmm0, %xmm12	#, _559, tmp1163
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:1422:   return (__m128i)__builtin_ia32_pshufd ((__v4si)__A, __mask);
	vpshufd	$255, %xmm1, %xmm1	#, tmp1157, tmp1165
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:1293:   return (__m128i) ((__v2du)__A ^ (__v2du)__B);
	vpxor	%xmm1, %xmm12, %xmm12	# tmp1165, tmp1163, tmp1167
	vpxor	%xmm0, %xmm12, %xmm12	# _559, tmp1167, _568
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:1193:   return (__m128i)__builtin_ia32_pslldqi128 (__A, __N * 8);
	vpslldq	$4, %xmm12, %xmm0	#, _568, tmp1170
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:1293:   return (__m128i) ((__v2du)__A ^ (__v2du)__B);
	vpxor	%xmm0, %xmm12, %xmm0	# tmp1170, _568, _572
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:1193:   return (__m128i)__builtin_ia32_pslldqi128 (__A, __N * 8);
	vpslldq	$4, %xmm0, %xmm13	#, _572, tmp1172
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:1293:   return (__m128i) ((__v2du)__A ^ (__v2du)__B);
	vpxor	%xmm13, %xmm0, %xmm0	# tmp1172, _572, _576
# /usr/lib/gcc/x86_64-linux-gnu/8/include/wmmintrin.h:89:   return (__m128i) __builtin_ia32_aeskeygenassist128 ((__v2di)__X, __C);
	vaeskeygenassist	$128, %xmm12, %xmm1	#, _568, tmp1168
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:1193:   return (__m128i)__builtin_ia32_pslldqi128 (__A, __N * 8);
	vpslldq	$4, %xmm0, %xmm13	#, _576, tmp1174
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:1422:   return (__m128i)__builtin_ia32_pshufd ((__v4si)__A, __mask);
	vpshufd	$255, %xmm1, %xmm1	#, tmp1168, tmp1176
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:1293:   return (__m128i) ((__v2du)__A ^ (__v2du)__B);
	vpxor	%xmm1, %xmm13, %xmm13	# tmp1176, tmp1174, tmp1178
	vpxor	%xmm0, %xmm13, %xmm13	# _576, tmp1178, _585
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:1193:   return (__m128i)__builtin_ia32_pslldqi128 (__A, __N * 8);
	vpslldq	$4, %xmm13, %xmm0	#, _585, tmp1181
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:1293:   return (__m128i) ((__v2du)__A ^ (__v2du)__B);
	vpxor	%xmm0, %xmm13, %xmm0	# tmp1181, _585, _589
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:1193:   return (__m128i)__builtin_ia32_pslldqi128 (__A, __N * 8);
	vpslldq	$4, %xmm0, %xmm14	#, _589, tmp1183
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:1293:   return (__m128i) ((__v2du)__A ^ (__v2du)__B);
	vpxor	%xmm14, %xmm0, %xmm0	# tmp1183, _589, _593
# /usr/lib/gcc/x86_64-linux-gnu/8/include/wmmintrin.h:89:   return (__m128i) __builtin_ia32_aeskeygenassist128 ((__v2di)__X, __C);
	vaeskeygenassist	$27, %xmm13, %xmm1	#, _585, tmp1179
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:1193:   return (__m128i)__builtin_ia32_pslldqi128 (__A, __N * 8);
	vpslldq	$4, %xmm0, %xmm14	#, _593, tmp1185
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:1422:   return (__m128i)__builtin_ia32_pshufd ((__v4si)__A, __mask);
	vpshufd	$255, %xmm1, %xmm1	#, tmp1179, tmp1187
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:1293:   return (__m128i) ((__v2du)__A ^ (__v2du)__B);
	vpxor	%xmm1, %xmm14, %xmm14	# tmp1187, tmp1185, tmp1189
	vpxor	%xmm0, %xmm14, %xmm14	# _593, tmp1189, _602
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:1193:   return (__m128i)__builtin_ia32_pslldqi128 (__A, __N * 8);
	vpslldq	$4, %xmm14, %xmm0	#, _602, tmp1192
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:1293:   return (__m128i) ((__v2du)__A ^ (__v2du)__B);
	vpxor	%xmm0, %xmm14, %xmm0	# tmp1192, _602, _606
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:1193:   return (__m128i)__builtin_ia32_pslldqi128 (__A, __N * 8);
	vpslldq	$4, %xmm0, %xmm15	#, _606, tmp1194
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:1293:   return (__m128i) ((__v2du)__A ^ (__v2du)__B);
	vpxor	%xmm15, %xmm0, %xmm0	# tmp1194, _606, _610
# /usr/lib/gcc/x86_64-linux-gnu/8/include/wmmintrin.h:89:   return (__m128i) __builtin_ia32_aeskeygenassist128 ((__v2di)__X, __C);
	vaeskeygenassist	$54, %xmm14, %xmm1	#, _602, tmp1190
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:1193:   return (__m128i)__builtin_ia32_pslldqi128 (__A, __N * 8);
	vpslldq	$4, %xmm0, %xmm15	#, _610, tmp1196
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:1422:   return (__m128i)__builtin_ia32_pshufd ((__v4si)__A, __mask);
	vpshufd	$255, %xmm1, %xmm1	#, tmp1190, tmp1198
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:1293:   return (__m128i) ((__v2du)__A ^ (__v2du)__B);
	vpxor	%xmm1, %xmm15, %xmm15	# tmp1198, tmp1196, tmp1200
	vmovaps	%xmm4, 192(%rsp)	# _517, %sfp
	vmovaps	%xmm3, 176(%rsp)	# _534, %sfp
	vmovaps	%xmm5, 160(%rsp)	# _551, %sfp
	vpxor	%xmm0, %xmm15, %xmm15	# _610, tmp1200, _619
# src/sabd-enclave-hash.c:246:     for (hash_slot_idx_t hash_slot_idx = 0; likely(hash_slot_idx < hash_table_slot_count); hash_slot_idx++) {
	xorl	%edi, %edi	# hash_slot_idx
# src/sabd-enclave-hash.c:245:     bool any_hash_slots_overflowed = false;
	xorl	%r10d, %r10d	# any_hash_slots_overflowed
	.p2align 4,,10
	.p2align 3
.L30:
# src/sabd-enclave-hash.c:257:       for (hash_slot_idx_t ab_phone_idx = 0; likely(ab_phone_idx < ab_phone_count); ab_phone_idx++) {
	testl	%r15d, %r15d	# ab_phone_count
	je	.L51	#,
# src/sabd-enclave-hash.c:249:       register __m256i chain_blocks[CHAIN_BLOCK_COUNT] = {0};
	vpxor	%xmm0, %xmm0, %xmm0	# chain_blocks$3
# src/sabd-enclave-hash.c:250:       register __m256i chain_block_masks[] = {
	vmovdqa	.LC0(%rip), %ymm2	#, chain_block_masks$0
	vmovdqa	.LC1(%rip), %ymm3	#, chain_block_masks$1
	vmovdqa	.LC2(%rip), %ymm4	#, chain_block_masks$2
	vmovdqa	.LC3(%rip), %ymm5	#, chain_block_masks$3
# src/sabd-enclave-hash.c:257:       for (hash_slot_idx_t ab_phone_idx = 0; likely(ab_phone_idx < ab_phone_count); ab_phone_idx++) {
	movq	%r13, %rdx	# ab_phones, ivtmp.165
# src/sabd-enclave-hash.c:256:       hash_slot_idx_t chain_idx = 0;
	xorl	%ecx, %ecx	# chain_idx
# src/sabd-enclave-hash.c:249:       register __m256i chain_blocks[CHAIN_BLOCK_COUNT] = {0};
	vmovdqa	%ymm0, %ymm8	#, chain_blocks$0
	vmovdqa	%ymm0, %ymm7	#, chain_blocks$1
	vmovdqa	%ymm0, %ymm6	#, chain_blocks$2
	.p2align 4,,10
	.p2align 3
.L12:
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:592:   return __extension__ (__m128i)(__v2di){ __q0, __q1 };
	vmovq	(%rdx), %xmm9	# MEM[base: _929, offset: 0B], tmp764
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avxintrin.h:1343:   return __extension__ (__m256i)(__v4di){ __A, __A, __A, __A };
	vpbroadcastq	(%rdx), %ymm1	# MEM[base: _929, offset: 0B], tmp763
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:1293:   return (__m128i) ((__v2du)__A ^ (__v2du)__B);
	vpxor	144(%rsp), %xmm9, %xmm9	# %sfp, tmp764, tmp765
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avx2intrin.h:254:   return (__m256i) ((__v4di)__A == (__v4di)__B);
	vpcmpeqq	%ymm1, %ymm7, %ymm10	# tmp763, chain_blocks$1, tmp779
# /usr/lib/gcc/x86_64-linux-gnu/8/include/wmmintrin.h:63:   return (__m128i) __builtin_ia32_aesenc128 ((__v2di)__X, (__v2di)__Y);
	vaesenc	128(%rsp), %xmm9, %xmm9	# %sfp, tmp765, tmp766
	vaesenc	224(%rsp), %xmm9, %xmm9	# %sfp, tmp766, tmp767
	vaesenc	208(%rsp), %xmm9, %xmm9	# %sfp, tmp767, tmp768
	vaesenc	192(%rsp), %xmm9, %xmm9	# %sfp, tmp768, tmp769
	vaesenc	176(%rsp), %xmm9, %xmm9	# %sfp, tmp769, tmp770
	vaesenc	160(%rsp), %xmm9, %xmm9	# %sfp, tmp770, tmp771
	vaesenc	%xmm12, %xmm9, %xmm9	# _568, tmp771, tmp772
	vaesenc	%xmm13, %xmm9, %xmm9	# _585, tmp772, tmp773
	vaesenc	%xmm14, %xmm9, %xmm9	# _602, tmp773, tmp774
# /usr/lib/gcc/x86_64-linux-gnu/8/include/wmmintrin.h:71:   return (__m128i) __builtin_ia32_aesenclast128 ((__v2di)__X, (__v2di)__Y);
	vaesenclast	%xmm15, %xmm9, %xmm9	# _619, tmp774, tmp775
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:226:   return __builtin_ia32_vec_ext_v4si ((__v4si)__A, 0);
	vmovd	%xmm9, %eax	# tmp775, tmp777
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avx2intrin.h:254:   return (__m256i) ((__v4di)__A == (__v4di)__B);
	vpcmpeqq	%ymm8, %ymm1, %ymm9	# chain_blocks$0, tmp763, tmp781
	vpcmpeqq	%ymm1, %ymm0, %ymm11	# tmp763, chain_blocks$3, tmp786
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avxintrin.h:1136:   return __builtin_ia32_vtestzpd256 ((__v4df)__M, (__v4df)__V);
	xorl	%esi, %esi	# tmp789
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avx2intrin.h:576:   return (__m256i) ((__v4du)__A | (__v4du)__B);
	vpor	%ymm9, %ymm10, %ymm9	# tmp781, tmp779, tmp782
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avx2intrin.h:254:   return (__m256i) ((__v4di)__A == (__v4di)__B);
	vpcmpeqq	%ymm1, %ymm6, %ymm10	# tmp763, chain_blocks$2, tmp784
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avx2intrin.h:576:   return (__m256i) ((__v4du)__A | (__v4du)__B);
	vpor	%ymm11, %ymm10, %ymm10	# tmp786, tmp784, tmp787
# src/sabd-enclave-hash.c:274:         bool phone_not_in_chain = _mm256_testz_pd((__m256d) chain_eq, (__m256d) chain_eq);
	vpor	%ymm10, %ymm9, %ymm10	# tmp787, tmp782, _51
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avxintrin.h:1136:   return __builtin_ia32_vtestzpd256 ((__v4df)__M, (__v4df)__V);
	vtestpd	%ymm10, %ymm10	# _51, _51
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avxintrin.h:220:   return (__m256d) __builtin_ia32_blendvpd256 ((__v4df)__X,
	vblendvpd	%ymm3, %ymm1, %ymm7, %ymm10	# chain_block_masks$1, _55, chain_blocks$1, _261
	vblendvpd	%ymm2, %ymm1, %ymm8, %ymm9	# chain_block_masks$0, _55, chain_blocks$0, _260
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avxintrin.h:1136:   return __builtin_ia32_vtestzpd256 ((__v4df)__M, (__v4df)__V);
	sete	%sil	#, tmp789
# src/sabd-enclave-hash.c:102:   return _mm_cvtsi128_si32(hash) & ((1 << hash_table_order) - 1);
	andl	%ebx, %eax	# _768, tmp790
# src/sabd-enclave-hash.c:264:           (((uint64_t) (((int64_t) (((uint64_t) ab_phone_hash_slot_idx) ^ ((uint64_t) hash_slot_idx))) - 1))
	xorl	%edi, %eax	# hash_slot_idx, tmp792
# src/sabd-enclave-hash.c:264:           (((uint64_t) (((int64_t) (((uint64_t) ab_phone_hash_slot_idx) ^ ((uint64_t) hash_slot_idx))) - 1))
	decq	%rax	# tmp793
# src/sabd-enclave-hash.c:265:            >> (sizeof(hash_slot_idx) * 8)) & 1;
	shrq	$32, %rax	#, tmp794
	andq	%rsi, %rax	# tmp789, _30
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avxintrin.h:1343:   return __extension__ (__m256i)(__v4di){ __A, __A, __A, __A };
	vmovq	%rax, %xmm7	# _30, _30
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avxintrin.h:220:   return (__m256d) __builtin_ia32_blendvpd256 ((__v4df)__X,
	vblendvpd	%ymm4, %ymm1, %ymm6, %ymm11	# chain_block_masks$2, _55, chain_blocks$2, _262
	addq	$8, %rdx	#, ivtmp.165
	vblendvpd	%ymm5, %ymm1, %ymm0, %ymm1	# chain_block_masks$3, _55, chain_blocks$3, _263
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avxintrin.h:1343:   return __extension__ (__m256i)(__v4di){ __A, __A, __A, __A };
	vpbroadcastq	%xmm7, %ymm0	# _30, tmp813
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avx2intrin.h:128:   return (__m256i) ((__v4du)__A + (__v4du)__B);
	vpaddq	%ymm0, %ymm5, %ymm5	# tmp813, chain_block_masks$3, chain_block_masks$3
	vpaddq	%ymm0, %ymm4, %ymm4	# tmp813, chain_block_masks$2, chain_block_masks$2
	vpaddq	%ymm0, %ymm3, %ymm3	# tmp813, chain_block_masks$1, chain_block_masks$1
	vpaddq	%ymm0, %ymm2, %ymm2	# tmp813, chain_block_masks$0, chain_block_masks$0
# src/sabd-enclave-hash.c:278:         chain_idx += should_insert_phone;
	addl	%eax, %ecx	# _30, chain_idx
# src/sabd-enclave-hash.c:282:         chain_blocks[2] = (__m256i) _mm256_blendv_pd((__m256d) chain_blocks[2], (__m256d) ab_phone_block, (__m256d) chain_block_masks[2]);
	vmovdqa	%ymm11, %ymm6	# _262, chain_blocks$2
# src/sabd-enclave-hash.c:281:         chain_blocks[1] = (__m256i) _mm256_blendv_pd((__m256d) chain_blocks[1], (__m256d) ab_phone_block, (__m256d) chain_block_masks[1]);
	vmovdqa	%ymm10, %ymm7	# _261, chain_blocks$1
# src/sabd-enclave-hash.c:280:         chain_blocks[0] = (__m256i) _mm256_blendv_pd((__m256d) chain_blocks[0], (__m256d) ab_phone_block, (__m256d) chain_block_masks[0]);
	vmovdqa	%ymm9, %ymm8	# _260, chain_blocks$0
# src/sabd-enclave-hash.c:283:         chain_blocks[3] = (__m256i) _mm256_blendv_pd((__m256d) chain_blocks[3], (__m256d) ab_phone_block, (__m256d) chain_block_masks[3]);
	vmovdqa	%ymm1, %ymm0	# _263, chain_blocks$3
# src/sabd-enclave-hash.c:257:       for (hash_slot_idx_t ab_phone_idx = 0; likely(ab_phone_idx < ab_phone_count); ab_phone_idx++) {
	cmpq	%rdx, %r12	# ivtmp.165, _914
	jne	.L12	#,
	cmpl	$16, %ecx	#, chain_idx
	seta	%al	#, tmp815
	orl	%eax, %r10d	# tmp815, any_hash_slots_overflowed
.L14:
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avxintrin.h:220:   return (__m256d) __builtin_ia32_blendvpd256 ((__v4df)__X,
	vblendvpd	%ymm2, .LC8(%rip), %ymm9, %ymm2	# _1236,, _260, tmp816
	vblendvpd	%ymm3, .LC8(%rip), %ymm10, %ymm3	# _1237,, _261, tmp820
	vblendvpd	%ymm4, .LC8(%rip), %ymm11, %ymm4	# _1238,, _262, tmp824
	vblendvpd	%ymm5, .LC8(%rip), %ymm1, %ymm5	# _1239,, _263, tmp828
# src/sabd-enclave-hash.c:246:     for (hash_slot_idx_t hash_slot_idx = 0; likely(hash_slot_idx < hash_table_slot_count); hash_slot_idx++) {
	incl	%edi	# hash_slot_idx
# src/sabd-enclave-hash.c:299:       p_chain_blocks[0] = chain_blocks[0];
	vmovdqa	%ymm2, (%r9)	# tmp816, MEM[base: _910, offset: 0B]
# src/sabd-enclave-hash.c:300:       p_chain_blocks[1] = chain_blocks[1];
	vmovdqa	%ymm3, 32(%r9)	# tmp820, MEM[base: _910, offset: 32B]
# src/sabd-enclave-hash.c:301:       p_chain_blocks[2] = chain_blocks[2];
	vmovdqa	%ymm4, 64(%r9)	# tmp824, MEM[base: _910, offset: 64B]
# src/sabd-enclave-hash.c:302:       p_chain_blocks[3] = chain_blocks[3];
	vmovdqa	%ymm5, 96(%r9)	# tmp828, MEM[base: _910, offset: 96B]
	subq	$-128, %r9	#, ivtmp.169
# src/sabd-enclave-hash.c:246:     for (hash_slot_idx_t hash_slot_idx = 0; likely(hash_slot_idx < hash_table_slot_count); hash_slot_idx++) {
	cmpl	%r14d, %edi	# _1208, hash_slot_idx
	jne	.L30	#,
# src/sabd-enclave-hash.c:308:     if (unlikely(!hash_table_constructed)) {
	testb	%r10b, %r10b	# any_hash_slots_overflowed
	jne	.L52	#,
# src/sabd-enclave-hash.c:338:   for (; likely(in_phone_idx + prefetch_phones_dist + cache_line_phones < in_phone_count); in_phone_idx += cache_line_phones) {
	cmpq	$24, 120(%rsp)	#, %sfp
	vmovaps	%xmm15, 96(%rsp)	# _619, %sfp
	movq	%r8, %r13	# hashed_ab_phones, hashed_ab_phones
	movq	88(%rsp), %r14	# %sfp, in_hashed_ab_phones_result
	vmovdqa	128(%rsp), %xmm15	# %sfp, _466
	jbe	.L53	#,
	movq	72(%rsp), %rax	# %sfp, in_uuids
	movq	80(%rsp), %rcx	# %sfp, in_phones
	leaq	128(%rax), %rdi	#, ivtmp.159
	movq	120(%rsp), %rax	# %sfp, in_phone_count
	vmovdqa	.LC9(%rip), %ymm0	#, tmp1207
	leaq	-25(%rax), %r12	#, _957
	movq	%r12, %rax	# _957, tmp832
	shrq	$3, %rax	#, tmp832
	salq	$6, %rax	#, tmp833
	vmovdqa	176(%rsp), %xmm8	# %sfp, _534
	vmovdqa	160(%rsp), %xmm9	# %sfp, _551
	vmovdqa	96(%rsp), %xmm10	# %sfp, _619
	vmovdqa	144(%rsp), %xmm11	# %sfp, tmp1088
	leaq	128(%rcx), %r8	#, ivtmp.153
	leaq	192(%rcx,%rax), %r10	#, _942
.L20:
	leaq	128(%rdi), %r9	#, _961
# /usr/lib/gcc/x86_64-linux-gnu/8/include/xmmintrin.h:54:   __builtin_prefetch (__P, (__I & 0x4) >> 2, __I & 0x3);
	prefetchnta	(%r8)	# ivtmp.153
	prefetchnta	(%r9)	# _961
	prefetchnta	192(%rdi)	#
	movq	%r8, 128(%rsp)	# ivtmp.153, %sfp
	leaq	-128(%r8), %rsi	#, ivtmp.144
	leaq	-128(%rdi), %rcx	#, ivtmp.145
	.p2align 4,,10
	.p2align 3
.L19:
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:592:   return __extension__ (__m128i)(__v2di){ __q0, __q1 };
	vmovq	(%rsi), %xmm2	# MEM[base: _992, offset: 0B], tmp839
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avxintrin.h:1343:   return __extension__ (__m256i)(__v4di){ __A, __A, __A, __A };
	vpbroadcastq	(%rsi), %ymm1	# MEM[base: _992, offset: 0B], tmp836
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:1293:   return (__m128i) ((__v2du)__A ^ (__v2du)__B);
	vpxor	%xmm11, %xmm2, %xmm2	# tmp1088, tmp839, tmp840
# /usr/lib/gcc/x86_64-linux-gnu/8/include/wmmintrin.h:63:   return (__m128i) __builtin_ia32_aesenc128 ((__v2di)__X, (__v2di)__Y);
	vaesenc	%xmm15, %xmm2, %xmm2	# _466, tmp840, tmp841
	vaesenc	224(%rsp), %xmm2, %xmm2	# %sfp, tmp841, tmp842
	vaesenc	208(%rsp), %xmm2, %xmm2	# %sfp, tmp842, tmp843
	vaesenc	192(%rsp), %xmm2, %xmm2	# %sfp, tmp843, tmp844
	vaesenc	%xmm8, %xmm2, %xmm2	# _534, tmp844, tmp845
	vaesenc	%xmm9, %xmm2, %xmm2	# _551, tmp845, tmp846
	vaesenc	%xmm12, %xmm2, %xmm2	# _568, tmp846, tmp847
	vaesenc	%xmm13, %xmm2, %xmm2	# _585, tmp847, tmp848
	vaesenc	%xmm14, %xmm2, %xmm2	# _602, tmp848, tmp849
# /usr/lib/gcc/x86_64-linux-gnu/8/include/wmmintrin.h:71:   return (__m128i) __builtin_ia32_aesenclast128 ((__v2di)__X, (__v2di)__Y);
	vaesenclast	%xmm10, %xmm2, %xmm2	# _619, tmp849, tmp850
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:226:   return __builtin_ia32_vec_ext_v4si ((__v4si)__A, 0);
	vmovd	%xmm2, %eax	# tmp850, tmp852
# src/sabd-enclave-hash.c:102:   return _mm_cvtsi128_si32(hash) & ((1 << hash_table_order) - 1);
	andl	%ebx, %eax	# _768, _655
# src/sabd-enclave-hash.c:133:   __m256i *chain_blocks = (__m256i *) &hashed_ab_phones[in_phone_hash_slot_idx * CHAIN_PHONE_COUNT];
	movslq	%eax, %rdx	# _655, _655
# src/sabd-enclave-hash.c:149:     &in_hashed_ab_phones_result[in_phone_hash_slot_idx * CHAIN_BLOCK_COUNT];
	sall	$2, %eax	#,
# src/sabd-enclave-hash.c:133:   __m256i *chain_blocks = (__m256i *) &hashed_ab_phones[in_phone_hash_slot_idx * CHAIN_PHONE_COUNT];
	salq	$7, %rdx	#, tmp854
# src/sabd-enclave-hash.c:149:     &in_hashed_ab_phones_result[in_phone_hash_slot_idx * CHAIN_BLOCK_COUNT];
	salq	$6, %rax	#, tmp860
# src/sabd-enclave-hash.c:148:   volatile sabd_lookup_hashed_ab_phones_result_t *chain_results =
	addq	%r14, %rax	# in_hashed_ab_phones_result, chain_results
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avx2intrin.h:576:   return (__m256i) ((__v4du)__A | (__v4du)__B);
	vpor	%ymm0, %ymm1, %ymm1	# tmp1207, tmp836, tmp837
# src/sabd-enclave-hash.c:133:   __m256i *chain_blocks = (__m256i *) &hashed_ab_phones[in_phone_hash_slot_idx * CHAIN_PHONE_COUNT];
	addq	%r13, %rdx	# hashed_ab_phones, chain_blocks
# src/sabd-enclave-hash.c:115:     *chain_result = _mm256_blendv_epi8(_mm256_xor_si256(*chain_result, dummy_write_mask),
	vmovdqa	(%rax), %ymm2	# MEM[(volatile __m256i * {ref-all})chain_results_677], _1140
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avx2intrin.h:254:   return (__m256i) ((__v4di)__A == (__v4di)__B);
	vpcmpeqq	32(%rdx), %ymm1, %ymm7	# MEM[(__m256i * {ref-all})chain_blocks_659 + 32B], tmp837, tmp855
	vpcmpeqq	64(%rdx), %ymm1, %ymm6	# MEM[(__m256i * {ref-all})chain_blocks_659 + 64B], tmp837, tmp856
	vpcmpeqq	96(%rdx), %ymm1, %ymm4	# MEM[(__m256i * {ref-all})chain_blocks_659 + 96B], tmp837, tmp857
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avx2intrin.h:209:   return (__m256i) __builtin_ia32_pblendvb256 ((__v32qi)__X,
	vpcmpeqq	(%rdx), %ymm1, %ymm1	# *chain_blocks_659, tmp837, _1143
	vpbroadcastq	(%rcx), %ymm5	# MEM[base: _991, offset: 0B], _1144
	vpxor	%ymm0, %ymm2, %ymm2	# tmp1207, _1140, tmp867
	vpblendvb	%ymm1, %ymm5, %ymm2, %ymm2	# _1143, _1144, tmp867, tmp864
# src/sabd-enclave-hash.c:145:     _mm256_set1_epi64x(in_uuid.data64[1]),
	movq	8(%rcx), %r8	# MEM[base: _991, offset: 8B], _672
# src/sabd-enclave-hash.c:115:     *chain_result = _mm256_blendv_epi8(_mm256_xor_si256(*chain_result, dummy_write_mask),
	vmovdqa	%ymm2, (%rax)	# tmp864, MEM[(volatile __m256i * {ref-all})chain_results_677]
# src/sabd-enclave-hash.c:115:     *chain_result = _mm256_blendv_epi8(_mm256_xor_si256(*chain_result, dummy_write_mask),
	vmovdqa	32(%rax), %ymm2	# MEM[(volatile __m256i * {ref-all})chain_results_677], _1156
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avx2intrin.h:209:   return (__m256i) __builtin_ia32_pblendvb256 ((__v32qi)__X,
	vmovq	%r8, %xmm3	# _672, _672
	vpbroadcastq	%xmm3, %ymm3	# _672, _1160
	vpxor	%ymm0, %ymm2, %ymm2	# tmp1207, _1156, tmp874
	vpblendvb	%ymm1, %ymm3, %ymm2, %ymm1	# _1143, _1160, tmp874, tmp871
# src/sabd-enclave-hash.c:115:     *chain_result = _mm256_blendv_epi8(_mm256_xor_si256(*chain_result, dummy_write_mask),
	vmovdqa	%ymm1, 32(%rax)	# tmp871, MEM[(volatile __m256i * {ref-all})chain_results_677]
# src/sabd-enclave-hash.c:115:     *chain_result = _mm256_blendv_epi8(_mm256_xor_si256(*chain_result, dummy_write_mask),
	vmovdqa	64(%rax), %ymm1	# MEM[(volatile __m256i * {ref-all})chain_results_677 + 64B], _1108
	addq	$16, %rcx	#, ivtmp.145
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avx2intrin.h:209:   return (__m256i) __builtin_ia32_pblendvb256 ((__v32qi)__X,
	vpxor	%ymm0, %ymm1, %ymm1	# tmp1207, _1108, tmp880
	vpblendvb	%ymm7, %ymm5, %ymm1, %ymm1	# _1111, _1144, tmp880, tmp877
# src/sabd-enclave-hash.c:115:     *chain_result = _mm256_blendv_epi8(_mm256_xor_si256(*chain_result, dummy_write_mask),
	vmovdqa	%ymm1, 64(%rax)	# tmp877, MEM[(volatile __m256i * {ref-all})chain_results_677 + 64B]
# src/sabd-enclave-hash.c:115:     *chain_result = _mm256_blendv_epi8(_mm256_xor_si256(*chain_result, dummy_write_mask),
	vmovdqa	96(%rax), %ymm1	# MEM[(volatile __m256i * {ref-all})chain_results_677 + 64B], _1124
	addq	$8, %rsi	#, ivtmp.144
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avx2intrin.h:209:   return (__m256i) __builtin_ia32_pblendvb256 ((__v32qi)__X,
	vpxor	%ymm0, %ymm1, %ymm1	# tmp1207, _1124, tmp886
	vpblendvb	%ymm7, %ymm3, %ymm1, %ymm7	# _1111, _1160, tmp886, tmp883
# src/sabd-enclave-hash.c:115:     *chain_result = _mm256_blendv_epi8(_mm256_xor_si256(*chain_result, dummy_write_mask),
	vmovdqa	%ymm7, 96(%rax)	# tmp883, MEM[(volatile __m256i * {ref-all})chain_results_677 + 64B]
# src/sabd-enclave-hash.c:115:     *chain_result = _mm256_blendv_epi8(_mm256_xor_si256(*chain_result, dummy_write_mask),
	vmovdqa	128(%rax), %ymm1	# MEM[(volatile __m256i * {ref-all})chain_results_677 + 128B], _1076
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avx2intrin.h:209:   return (__m256i) __builtin_ia32_pblendvb256 ((__v32qi)__X,
	vpxor	%ymm0, %ymm1, %ymm1	# tmp1207, _1076, tmp892
	vpblendvb	%ymm6, %ymm5, %ymm1, %ymm1	# _1079, _1144, tmp892, tmp889
# src/sabd-enclave-hash.c:115:     *chain_result = _mm256_blendv_epi8(_mm256_xor_si256(*chain_result, dummy_write_mask),
	vmovdqa	%ymm1, 128(%rax)	# tmp889, MEM[(volatile __m256i * {ref-all})chain_results_677 + 128B]
# src/sabd-enclave-hash.c:115:     *chain_result = _mm256_blendv_epi8(_mm256_xor_si256(*chain_result, dummy_write_mask),
	vmovdqa	160(%rax), %ymm1	# MEM[(volatile __m256i * {ref-all})chain_results_677 + 128B], _1092
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avx2intrin.h:209:   return (__m256i) __builtin_ia32_pblendvb256 ((__v32qi)__X,
	vpxor	%ymm0, %ymm1, %ymm1	# tmp1207, _1092, tmp898
	vpblendvb	%ymm6, %ymm3, %ymm1, %ymm6	# _1079, _1160, tmp898, tmp895
# src/sabd-enclave-hash.c:115:     *chain_result = _mm256_blendv_epi8(_mm256_xor_si256(*chain_result, dummy_write_mask),
	vmovdqa	%ymm6, 160(%rax)	# tmp895, MEM[(volatile __m256i * {ref-all})chain_results_677 + 128B]
# src/sabd-enclave-hash.c:115:     *chain_result = _mm256_blendv_epi8(_mm256_xor_si256(*chain_result, dummy_write_mask),
	vmovdqa	192(%rax), %ymm1	# MEM[(volatile __m256i * {ref-all})chain_results_677 + 192B], _1044
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avx2intrin.h:209:   return (__m256i) __builtin_ia32_pblendvb256 ((__v32qi)__X,
	vpxor	%ymm0, %ymm1, %ymm1	# tmp1207, _1044, tmp904
	vpblendvb	%ymm4, %ymm5, %ymm1, %ymm5	# _1047, _1144, tmp904, tmp901
# src/sabd-enclave-hash.c:115:     *chain_result = _mm256_blendv_epi8(_mm256_xor_si256(*chain_result, dummy_write_mask),
	vmovdqa	%ymm5, 192(%rax)	# tmp901, MEM[(volatile __m256i * {ref-all})chain_results_677 + 192B]
# src/sabd-enclave-hash.c:115:     *chain_result = _mm256_blendv_epi8(_mm256_xor_si256(*chain_result, dummy_write_mask),
	vmovdqa	224(%rax), %ymm1	# MEM[(volatile __m256i * {ref-all})chain_results_677 + 192B], _1060
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avx2intrin.h:209:   return (__m256i) __builtin_ia32_pblendvb256 ((__v32qi)__X,
	vpxor	%ymm0, %ymm1, %ymm1	# tmp1207, _1060, tmp910
	vpblendvb	%ymm4, %ymm3, %ymm1, %ymm3	# _1047, _1160, tmp910, tmp907
# src/sabd-enclave-hash.c:115:     *chain_result = _mm256_blendv_epi8(_mm256_xor_si256(*chain_result, dummy_write_mask),
	vmovdqa	%ymm3, 224(%rax)	# tmp907, MEM[(volatile __m256i * {ref-all})chain_results_677 + 192B]
# src/sabd-enclave-hash.c:347:     for (size_t cached_in_phone_idx = 0; cached_in_phone_idx < cache_line_phones; cached_in_phone_idx++) {
	cmpq	%rcx, %rdi	# ivtmp.145, ivtmp.159
	jne	.L19	#,
	movq	128(%rsp), %r8	# %sfp, ivtmp.153
	movq	%r9, %rdi	# _961, ivtmp.159
	addq	$64, %r8	#, ivtmp.153
# src/sabd-enclave-hash.c:338:   for (; likely(in_phone_idx + prefetch_phones_dist + cache_line_phones < in_phone_count); in_phone_idx += cache_line_phones) {
	cmpq	%r8, %r10	# ivtmp.153, _942
	jne	.L20	#,
	andq	$-8, %r12	#, tmp913
	leaq	8(%r12), %rax	#, in_phone_idx
.L18:
# src/sabd-enclave-hash.c:352:   for (; in_phone_idx < in_phone_count; in_phone_idx++) {
	cmpq	120(%rsp), %rax	# %sfp, in_phone_idx
	jnb	.L25	#,
	movq	80(%rsp), %rdi	# %sfp, in_phones
	movq	72(%rsp), %rdx	# %sfp, in_uuids
	leaq	(%rdi,%rax,8), %rsi	#, ivtmp.133
	movq	120(%rsp), %rdi	# %sfp, in_phone_count
	salq	$4, %rax	#, tmp915
	salq	$4, %rdi	#, in_phone_count
	vmovdqa	176(%rsp), %xmm8	# %sfp, _534
	vmovdqa	160(%rsp), %xmm9	# %sfp, _551
	vmovdqa	96(%rsp), %xmm10	# %sfp, _619
	vmovdqa	144(%rsp), %xmm11	# %sfp, tmp1088
	leaq	(%rdx,%rax), %rcx	#, ivtmp.134
	addq	%rdx, %rdi	# in_uuids, _1022
	.p2align 4,,10
	.p2align 3
.L24:
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:592:   return __extension__ (__m128i)(__v2di){ __q0, __q1 };
	vmovq	(%rsi), %xmm2	# MEM[base: _1026, offset: 0B], tmp920
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avxintrin.h:1343:   return __extension__ (__m256i)(__v4di){ __A, __A, __A, __A };
	vpbroadcastq	(%rsi), %ymm1	# MEM[base: _1026, offset: 0B], tmp917
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:1293:   return (__m128i) ((__v2du)__A ^ (__v2du)__B);
	vpxor	%xmm11, %xmm2, %xmm2	# tmp1088, tmp920, tmp921
# /usr/lib/gcc/x86_64-linux-gnu/8/include/wmmintrin.h:63:   return (__m128i) __builtin_ia32_aesenc128 ((__v2di)__X, (__v2di)__Y);
	vaesenc	%xmm15, %xmm2, %xmm2	# _466, tmp921, tmp922
	vaesenc	224(%rsp), %xmm2, %xmm2	# %sfp, tmp922, tmp923
	vaesenc	208(%rsp), %xmm2, %xmm2	# %sfp, tmp923, tmp924
	vaesenc	192(%rsp), %xmm2, %xmm2	# %sfp, tmp924, tmp925
	vaesenc	%xmm8, %xmm2, %xmm2	# _534, tmp925, tmp926
	vaesenc	%xmm9, %xmm2, %xmm2	# _551, tmp926, tmp927
	vaesenc	%xmm12, %xmm2, %xmm2	# _568, tmp927, tmp928
	vaesenc	%xmm13, %xmm2, %xmm2	# _585, tmp928, tmp929
	vaesenc	%xmm14, %xmm2, %xmm2	# _602, tmp929, tmp930
# /usr/lib/gcc/x86_64-linux-gnu/8/include/wmmintrin.h:71:   return (__m128i) __builtin_ia32_aesenclast128 ((__v2di)__X, (__v2di)__Y);
	vaesenclast	%xmm10, %xmm2, %xmm2	# _619, tmp930, tmp931
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:226:   return __builtin_ia32_vec_ext_v4si ((__v4si)__A, 0);
	vmovd	%xmm2, %eax	# tmp931, tmp933
# src/sabd-enclave-hash.c:102:   return _mm_cvtsi128_si32(hash) & ((1 << hash_table_order) - 1);
	andl	%ebx, %eax	# _768, _769
# src/sabd-enclave-hash.c:133:   __m256i *chain_blocks = (__m256i *) &hashed_ab_phones[in_phone_hash_slot_idx * CHAIN_PHONE_COUNT];
	movslq	%eax, %rdx	# _769, _769
# src/sabd-enclave-hash.c:149:     &in_hashed_ab_phones_result[in_phone_hash_slot_idx * CHAIN_BLOCK_COUNT];
	sall	$2, %eax	#,
# src/sabd-enclave-hash.c:133:   __m256i *chain_blocks = (__m256i *) &hashed_ab_phones[in_phone_hash_slot_idx * CHAIN_PHONE_COUNT];
	salq	$7, %rdx	#, tmp935
# src/sabd-enclave-hash.c:149:     &in_hashed_ab_phones_result[in_phone_hash_slot_idx * CHAIN_BLOCK_COUNT];
	salq	$6, %rax	#, tmp941
# src/sabd-enclave-hash.c:148:   volatile sabd_lookup_hashed_ab_phones_result_t *chain_results =
	addq	%r14, %rax	# in_hashed_ab_phones_result, chain_results
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avx2intrin.h:576:   return (__m256i) ((__v4du)__A | (__v4du)__B);
	vpor	%ymm0, %ymm1, %ymm1	# tmp1207, tmp917, tmp918
# src/sabd-enclave-hash.c:133:   __m256i *chain_blocks = (__m256i *) &hashed_ab_phones[in_phone_hash_slot_idx * CHAIN_PHONE_COUNT];
	addq	%r13, %rdx	# hashed_ab_phones, chain_blocks
# src/sabd-enclave-hash.c:115:     *chain_result = _mm256_blendv_epi8(_mm256_xor_si256(*chain_result, dummy_write_mask),
	vmovdqa	(%rax), %ymm2	# MEM[(volatile __m256i * {ref-all})chain_results_791], _1012
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avx2intrin.h:254:   return (__m256i) ((__v4di)__A == (__v4di)__B);
	vpcmpeqq	32(%rdx), %ymm1, %ymm7	# MEM[(__m256i * {ref-all})chain_blocks_773 + 32B], tmp918, tmp936
	vpcmpeqq	64(%rdx), %ymm1, %ymm6	# MEM[(__m256i * {ref-all})chain_blocks_773 + 64B], tmp918, tmp937
	vpcmpeqq	96(%rdx), %ymm1, %ymm4	# MEM[(__m256i * {ref-all})chain_blocks_773 + 96B], tmp918, tmp938
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avx2intrin.h:209:   return (__m256i) __builtin_ia32_pblendvb256 ((__v32qi)__X,
	vpcmpeqq	(%rdx), %ymm1, %ymm1	# *chain_blocks_773, tmp918, _1015
	vpbroadcastq	(%rcx), %ymm5	# MEM[base: _1025, offset: 0B], _1016
	vpxor	%ymm0, %ymm2, %ymm2	# tmp1207, _1012, tmp948
	vpblendvb	%ymm1, %ymm5, %ymm2, %ymm2	# _1015, _1016, tmp948, tmp945
# src/sabd-enclave-hash.c:145:     _mm256_set1_epi64x(in_uuid.data64[1]),
	movq	8(%rcx), %r8	# MEM[base: _1025, offset: 8B], _786
# src/sabd-enclave-hash.c:115:     *chain_result = _mm256_blendv_epi8(_mm256_xor_si256(*chain_result, dummy_write_mask),
	vmovdqa	%ymm2, (%rax)	# tmp945, MEM[(volatile __m256i * {ref-all})chain_results_791]
# src/sabd-enclave-hash.c:115:     *chain_result = _mm256_blendv_epi8(_mm256_xor_si256(*chain_result, dummy_write_mask),
	vmovdqa	32(%rax), %ymm3	# MEM[(volatile __m256i * {ref-all})chain_results_791], _1028
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avx2intrin.h:209:   return (__m256i) __builtin_ia32_pblendvb256 ((__v32qi)__X,
	vmovq	%r8, %xmm2	# _786, _786
	vpbroadcastq	%xmm2, %ymm2	# _786, _1032
	vpxor	%ymm0, %ymm3, %ymm3	# tmp1207, _1028, tmp955
	vpblendvb	%ymm1, %ymm2, %ymm3, %ymm1	# _1015, _1032, tmp955, tmp952
# src/sabd-enclave-hash.c:115:     *chain_result = _mm256_blendv_epi8(_mm256_xor_si256(*chain_result, dummy_write_mask),
	vmovdqa	%ymm1, 32(%rax)	# tmp952, MEM[(volatile __m256i * {ref-all})chain_results_791]
# src/sabd-enclave-hash.c:115:     *chain_result = _mm256_blendv_epi8(_mm256_xor_si256(*chain_result, dummy_write_mask),
	vmovdqa	64(%rax), %ymm1	# MEM[(volatile __m256i * {ref-all})chain_results_791 + 64B], _980
	addq	$16, %rcx	#, ivtmp.134
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avx2intrin.h:209:   return (__m256i) __builtin_ia32_pblendvb256 ((__v32qi)__X,
	vpxor	%ymm0, %ymm1, %ymm1	# tmp1207, _980, tmp961
	vpblendvb	%ymm7, %ymm5, %ymm1, %ymm1	# _983, _1016, tmp961, tmp958
# src/sabd-enclave-hash.c:115:     *chain_result = _mm256_blendv_epi8(_mm256_xor_si256(*chain_result, dummy_write_mask),
	vmovdqa	%ymm1, 64(%rax)	# tmp958, MEM[(volatile __m256i * {ref-all})chain_results_791 + 64B]
# src/sabd-enclave-hash.c:115:     *chain_result = _mm256_blendv_epi8(_mm256_xor_si256(*chain_result, dummy_write_mask),
	vmovdqa	96(%rax), %ymm1	# MEM[(volatile __m256i * {ref-all})chain_results_791 + 64B], _996
	addq	$8, %rsi	#, ivtmp.133
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avx2intrin.h:209:   return (__m256i) __builtin_ia32_pblendvb256 ((__v32qi)__X,
	vpxor	%ymm0, %ymm1, %ymm1	# tmp1207, _996, tmp967
	vpblendvb	%ymm7, %ymm2, %ymm1, %ymm7	# _983, _1032, tmp967, tmp964
# src/sabd-enclave-hash.c:115:     *chain_result = _mm256_blendv_epi8(_mm256_xor_si256(*chain_result, dummy_write_mask),
	vmovdqa	%ymm7, 96(%rax)	# tmp964, MEM[(volatile __m256i * {ref-all})chain_results_791 + 64B]
# src/sabd-enclave-hash.c:115:     *chain_result = _mm256_blendv_epi8(_mm256_xor_si256(*chain_result, dummy_write_mask),
	vmovdqa	128(%rax), %ymm1	# MEM[(volatile __m256i * {ref-all})chain_results_791 + 128B], _948
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avx2intrin.h:209:   return (__m256i) __builtin_ia32_pblendvb256 ((__v32qi)__X,
	vpxor	%ymm0, %ymm1, %ymm1	# tmp1207, _948, tmp973
	vpblendvb	%ymm6, %ymm5, %ymm1, %ymm1	# _951, _1016, tmp973, tmp970
# src/sabd-enclave-hash.c:115:     *chain_result = _mm256_blendv_epi8(_mm256_xor_si256(*chain_result, dummy_write_mask),
	vmovdqa	%ymm1, 128(%rax)	# tmp970, MEM[(volatile __m256i * {ref-all})chain_results_791 + 128B]
# src/sabd-enclave-hash.c:115:     *chain_result = _mm256_blendv_epi8(_mm256_xor_si256(*chain_result, dummy_write_mask),
	vmovdqa	160(%rax), %ymm1	# MEM[(volatile __m256i * {ref-all})chain_results_791 + 128B], _964
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avx2intrin.h:209:   return (__m256i) __builtin_ia32_pblendvb256 ((__v32qi)__X,
	vpxor	%ymm0, %ymm1, %ymm1	# tmp1207, _964, tmp979
	vpblendvb	%ymm6, %ymm2, %ymm1, %ymm6	# _951, _1032, tmp979, tmp976
# src/sabd-enclave-hash.c:115:     *chain_result = _mm256_blendv_epi8(_mm256_xor_si256(*chain_result, dummy_write_mask),
	vmovdqa	%ymm6, 160(%rax)	# tmp976, MEM[(volatile __m256i * {ref-all})chain_results_791 + 128B]
# src/sabd-enclave-hash.c:115:     *chain_result = _mm256_blendv_epi8(_mm256_xor_si256(*chain_result, dummy_write_mask),
	vmovdqa	192(%rax), %ymm1	# MEM[(volatile __m256i * {ref-all})chain_results_791 + 192B], _916
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avx2intrin.h:209:   return (__m256i) __builtin_ia32_pblendvb256 ((__v32qi)__X,
	vpxor	%ymm0, %ymm1, %ymm1	# tmp1207, _916, tmp985
	vpblendvb	%ymm4, %ymm5, %ymm1, %ymm5	# _919, _1016, tmp985, tmp982
# src/sabd-enclave-hash.c:115:     *chain_result = _mm256_blendv_epi8(_mm256_xor_si256(*chain_result, dummy_write_mask),
	vmovdqa	%ymm5, 192(%rax)	# tmp982, MEM[(volatile __m256i * {ref-all})chain_results_791 + 192B]
# src/sabd-enclave-hash.c:115:     *chain_result = _mm256_blendv_epi8(_mm256_xor_si256(*chain_result, dummy_write_mask),
	vmovdqa	224(%rax), %ymm1	# MEM[(volatile __m256i * {ref-all})chain_results_791 + 192B], _932
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avx2intrin.h:209:   return (__m256i) __builtin_ia32_pblendvb256 ((__v32qi)__X,
	vpxor	%ymm0, %ymm1, %ymm1	# tmp1207, _932, tmp991
	vpblendvb	%ymm4, %ymm2, %ymm1, %ymm2	# _919, _1032, tmp991, tmp988
# src/sabd-enclave-hash.c:115:     *chain_result = _mm256_blendv_epi8(_mm256_xor_si256(*chain_result, dummy_write_mask),
	vmovdqa	%ymm2, 224(%rax)	# tmp988, MEM[(volatile __m256i * {ref-all})chain_results_791 + 192B]
# src/sabd-enclave-hash.c:352:   for (; in_phone_idx < in_phone_count; in_phone_idx++) {
	cmpq	%rcx, %rdi	# ivtmp.134, _1022
	jne	.L24	#,
.L25:
# src/sabd-enclave-hash.c:362:   for (hash_slot_idx_t ab_phone_idx = 0; likely(ab_phone_idx < ab_phone_count); ab_phone_idx++) {
	testl	%r15d, %r15d	# ab_phone_count
	je	.L54	#,
	movq	48(%rsp), %rax	# %sfp, _927
	movq	56(%rsp), %r10	# %sfp, ivtmp.128
	salq	$4, %rax	#, _927
	leaq	16(%r10,%rax), %rbx	#, _1057
	movl	64(%rsp), %eax	# %sfp, _1208
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avx2intrin.h:209:   return (__m256i) __builtin_ia32_pblendvb256 ((__v32qi)__X,
	movq	%r13, 224(%rsp)	# hashed_ab_phones, %sfp
	decl	%eax	#
	movq	%r14, 208(%rsp)	# in_hashed_ab_phones_result, %sfp
	movq	%r11, 176(%rsp)	# ivtmp.114, %sfp
	movl	%eax, 192(%rsp)	# tmp1203, %sfp
	movq	%rbx, %r15	# _1057, _1057
	salq	$7, %rax	#, tmp1002
	vmovdqa	.LC10(%rip), %ymm4	#, tmp1202
	movq	40(%rsp), %rbx	# %sfp, ivtmp.127
	leaq	128(%r13,%rax), %r9	#, _1101
	vpxor	%xmm5, %xmm5, %xmm5	# tmp1010
	.p2align 4,,10
	.p2align 3
.L28:
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avxintrin.h:1343:   return __extension__ (__m256i)(__v4di){ __A, __A, __A, __A };
	vpbroadcastq	(%rbx), %ymm3	# MEM[base: _1074, offset: 0B], _334
	movq	208(%rsp), %rdx	# %sfp, ivtmp.122
	movq	224(%rsp), %rsi	# %sfp, ivtmp.121
# src/sabd-enclave-hash.c:365:     uuid_t ab_phone_result = {
	xorl	%r8d, %r8d	# ab_phone_result$data64$1
	xorl	%r11d, %r11d	# ab_phone_result$data64$0
	.p2align 4,,10
	.p2align 3
.L27:
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avx2intrin.h:181:   return (__m256i) ((__v4du)__A & (__v4du)__B);
	vpand	(%rsi), %ymm4, %ymm1	# MEM[base: _1118, offset: 0B], tmp1202, tmp1005
# src/sabd-enclave-hash.c:163:   chain_result = _mm256_blendv_epi8(chain_result, chain_results[0].uuids[uuid_data64_idx], chain_eq[0]);
	vmovdqa	(%rdx), %ymm2	# *chain_results_306, _400
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avx2intrin.h:209:   return (__m256i) __builtin_ia32_pblendvb256 ((__v32qi)__X,
	vpcmpeqq	%ymm1, %ymm3, %ymm9	# tmp1005, _334, _401
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avx2intrin.h:181:   return (__m256i) ((__v4du)__A & (__v4du)__B);
	vpand	32(%rsi), %ymm4, %ymm1	# MEM[base: _1118, offset: 32B], tmp1202, tmp1013
# src/sabd-enclave-hash.c:164:   chain_result = _mm256_blendv_epi8(chain_result, chain_results[1].uuids[uuid_data64_idx], chain_eq[1]);
	vmovdqa	64(%rdx), %ymm6	# MEM[(volatile struct sabd_lookup_hashed_ab_phones_result_t *)chain_results_306 + 64B], _404
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avx2intrin.h:209:   return (__m256i) __builtin_ia32_pblendvb256 ((__v32qi)__X,
	vpcmpeqq	%ymm1, %ymm3, %ymm8	# tmp1013, _334, _405
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avx2intrin.h:181:   return (__m256i) ((__v4du)__A & (__v4du)__B);
	vpand	64(%rsi), %ymm4, %ymm1	# MEM[base: _1118, offset: 64B], tmp1202, tmp1021
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avx2intrin.h:209:   return (__m256i) __builtin_ia32_pblendvb256 ((__v32qi)__X,
	vpblendvb	%ymm9, %ymm2, %ymm5, %ymm2	# _401, _400, tmp1010, tmp1009
	vpcmpeqq	%ymm1, %ymm3, %ymm7	# tmp1021, _334, _409
	vpblendvb	%ymm8, %ymm6, %ymm2, %ymm2	# _405, _404, tmp1009, tmp1017
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avx2intrin.h:181:   return (__m256i) ((__v4du)__A & (__v4du)__B);
	vpand	96(%rsi), %ymm4, %ymm1	# MEM[base: _1118, offset: 96B], tmp1202, tmp1029
# src/sabd-enclave-hash.c:165:   chain_result = _mm256_blendv_epi8(chain_result, chain_results[2].uuids[uuid_data64_idx], chain_eq[2]);
	vmovdqa	128(%rdx), %ymm6	# MEM[(volatile struct sabd_lookup_hashed_ab_phones_result_t *)chain_results_306 + 128B], _408
# src/sabd-enclave-hash.c:166:   chain_result = _mm256_blendv_epi8(chain_result, chain_results[3].uuids[uuid_data64_idx], chain_eq[3]);
	vmovdqa	192(%rdx), %ymm10	# MEM[(volatile struct sabd_lookup_hashed_ab_phones_result_t *)chain_results_306 + 192B], _412
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avx2intrin.h:209:   return (__m256i) __builtin_ia32_pblendvb256 ((__v32qi)__X,
	vpblendvb	%ymm7, %ymm6, %ymm2, %ymm2	# _409, _408, tmp1017, tmp1025
	vpcmpeqq	%ymm1, %ymm3, %ymm6	# tmp1029, _334, _413
# src/sabd-enclave-hash.c:163:   chain_result = _mm256_blendv_epi8(chain_result, chain_results[0].uuids[uuid_data64_idx], chain_eq[0]);
	vmovdqa	32(%rdx), %ymm1	# *chain_results_306, _375
	subq	$-128, %rsi	#, ivtmp.121
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avx2intrin.h:209:   return (__m256i) __builtin_ia32_pblendvb256 ((__v32qi)__X,
	vpblendvb	%ymm6, %ymm10, %ymm2, %ymm2	# _413, _412, tmp1025, tmp1033
# /usr/lib/gcc/x86_64-linux-gnu/8/include/smmintrin.h:456:   return __builtin_ia32_vec_ext_v2di ((__v2di)__X, __N);
	vpextrq	$1, %xmm2, %rdi	# tmp1037, tmp1040
	vmovq	%xmm2, %rax	# tmp1037, tmp1039
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avxintrin.h:524:   return (__m128i) __builtin_ia32_vextractf128_si256 ((__v8si)__X, __N);
	vextracti128	$0x1, %ymm2, %xmm2	# tmp1033, tmp1041
# /usr/lib/gcc/x86_64-linux-gnu/8/include/smmintrin.h:456:   return __builtin_ia32_vec_ext_v2di ((__v2di)__X, __N);
	vmovq	%xmm2, %r12	# tmp1041, tmp1043
	vpextrq	$1, %xmm2, %rcx	# tmp1041, tmp1044
# src/sabd-enclave-hash.c:164:   chain_result = _mm256_blendv_epi8(chain_result, chain_results[1].uuids[uuid_data64_idx], chain_eq[1]);
	vmovdqa	96(%rdx), %ymm2	# MEM[(volatile struct sabd_lookup_hashed_ab_phones_result_t *)chain_results_306 + 64B], _378
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avx2intrin.h:209:   return (__m256i) __builtin_ia32_pblendvb256 ((__v32qi)__X,
	vpblendvb	%ymm9, %ymm1, %ymm5, %ymm1	# _401, _375, tmp1010, tmp1048
	vpblendvb	%ymm8, %ymm2, %ymm1, %ymm1	# _405, _378, tmp1048, tmp1052
# src/sabd-enclave-hash.c:165:   chain_result = _mm256_blendv_epi8(chain_result, chain_results[2].uuids[uuid_data64_idx], chain_eq[2]);
	vmovdqa	160(%rdx), %ymm2	# MEM[(volatile struct sabd_lookup_hashed_ab_phones_result_t *)chain_results_306 + 128B], _381
# src/sabd-enclave-hash.c:168:   return (_mm256_extract_epi64(chain_result, 0) |
	orq	%rdi, %rax	# tmp1040, tmp1045
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avx2intrin.h:209:   return (__m256i) __builtin_ia32_pblendvb256 ((__v32qi)__X,
	vpblendvb	%ymm7, %ymm2, %ymm1, %ymm1	# _409, _381, tmp1052, tmp1056
# src/sabd-enclave-hash.c:166:   chain_result = _mm256_blendv_epi8(chain_result, chain_results[3].uuids[uuid_data64_idx], chain_eq[3]);
	vmovdqa	224(%rdx), %ymm2	# MEM[(volatile struct sabd_lookup_hashed_ab_phones_result_t *)chain_results_306 + 192B], _384
# src/sabd-enclave-hash.c:169:           _mm256_extract_epi64(chain_result, 1) |
	orq	%r12, %rax	# tmp1043, tmp1046
# src/sabd-enclave-hash.c:170:           _mm256_extract_epi64(chain_result, 2) |
	orq	%rcx, %rax	# tmp1044, tmp1047
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avx2intrin.h:209:   return (__m256i) __builtin_ia32_pblendvb256 ((__v32qi)__X,
	vpblendvb	%ymm6, %ymm2, %ymm1, %ymm1	# _413, _384, tmp1056, tmp1060
# /usr/lib/gcc/x86_64-linux-gnu/8/include/smmintrin.h:456:   return __builtin_ia32_vec_ext_v2di ((__v2di)__X, __N);
	vpextrq	$1, %xmm1, %rdi	# tmp1064, tmp1067
# src/sabd-enclave-hash.c:381:       ab_phone_result.data64[0] |= sabd_lookup_hash_slot_collect_result(chain_results, chain_eq, 0);
	orq	%rax, %r11	# tmp1047, ab_phone_result$data64$0
# /usr/lib/gcc/x86_64-linux-gnu/8/include/smmintrin.h:456:   return __builtin_ia32_vec_ext_v2di ((__v2di)__X, __N);
	vmovq	%xmm1, %rax	# tmp1064, tmp1066
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avxintrin.h:524:   return (__m128i) __builtin_ia32_vextractf128_si256 ((__v8si)__X, __N);
	vextracti128	$0x1, %ymm1, %xmm1	# tmp1060, tmp1068
# /usr/lib/gcc/x86_64-linux-gnu/8/include/smmintrin.h:456:   return __builtin_ia32_vec_ext_v2di ((__v2di)__X, __N);
	vmovq	%xmm1, %r12	# tmp1068, tmp1070
# src/sabd-enclave-hash.c:168:   return (_mm256_extract_epi64(chain_result, 0) |
	orq	%rdi, %rax	# tmp1067, tmp1072
# /usr/lib/gcc/x86_64-linux-gnu/8/include/smmintrin.h:456:   return __builtin_ia32_vec_ext_v2di ((__v2di)__X, __N);
	vpextrq	$1, %xmm1, %rcx	# tmp1068, tmp1071
# src/sabd-enclave-hash.c:169:           _mm256_extract_epi64(chain_result, 1) |
	orq	%r12, %rax	# tmp1070, tmp1073
# src/sabd-enclave-hash.c:170:           _mm256_extract_epi64(chain_result, 2) |
	orq	%rcx, %rax	# tmp1071, tmp1074
# src/sabd-enclave-hash.c:382:       ab_phone_result.data64[1] |= sabd_lookup_hash_slot_collect_result(chain_results, chain_eq, 1);
	orq	%rax, %r8	# tmp1074, ab_phone_result$data64$1
	addq	$256, %rdx	#, ivtmp.122
# src/sabd-enclave-hash.c:369:     for (hash_slot_idx_t hash_slot_idx = 0; likely(hash_slot_idx < hash_table_slot_count); hash_slot_idx++) {
	cmpq	%rsi, %r9	# ivtmp.121, _1101
	jne	.L27	#,
# src/sabd-enclave-hash.c:385:     in_ab_phones_result[ab_phone_idx] = ab_phone_result;
	movq	%r11, (%r10)	# ab_phone_result, *_150
	movq	%r8, 8(%r10)	# ab_phone_result, *_150
	addq	$16, %r10	#, ivtmp.128
	addq	$8, %rbx	#, ivtmp.127
# src/sabd-enclave-hash.c:362:   for (hash_slot_idx_t ab_phone_idx = 0; likely(ab_phone_idx < ab_phone_count); ab_phone_idx++) {
	cmpq	%r10, %r15	# ivtmp.128, _1057
	jne	.L28	#,
	movq	224(%rsp), %r13	# %sfp, hashed_ab_phones
	movq	208(%rsp), %r14	# %sfp, in_hashed_ab_phones_result
	movq	176(%rsp), %r11	# %sfp, ivtmp.114
.L23:
	movl	192(%rsp), %eax	# %sfp, tmp995
	leaq	256(%r14), %rdx	#, ivtmp.116
	salq	$8, %rax	#, tmp996
	leaq	512(%r14,%rax), %rcx	#, _1134
# src/sabd-enclave-hash.c:400:     chain_blocks[0] = _mm256_setzero_si256();
	vpxor	%xmm2, %xmm2, %xmm2	# tmp1083
	.p2align 4,,10
	.p2align 3
.L26:
	leaq	-256(%rdx), %rax	#, ivtmp.109
.L29:
# src/sabd-enclave-hash.c:395:         *chain_result = _mm256_xor_si256(_mm256_and_si256(*chain_result, chain_block_dummy_mask),
	vmovdqa	(%rax), %ymm1	# MEM[(volatile __m256i * {ref-all})_889], _890
	addq	$64, %rax	#, ivtmp.109
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avx2intrin.h:915:   return (__m256i) ((__v4du)__A ^ (__v4du)__B);
	vpandn	%ymm0, %ymm1, %ymm1	# tmp1207, _890, tmp1077
# src/sabd-enclave-hash.c:395:         *chain_result = _mm256_xor_si256(_mm256_and_si256(*chain_result, chain_block_dummy_mask),
	vmovdqa	%ymm1, -64(%rax)	# tmp1077, MEM[(volatile __m256i * {ref-all})_889]
# src/sabd-enclave-hash.c:395:         *chain_result = _mm256_xor_si256(_mm256_and_si256(*chain_result, chain_block_dummy_mask),
	vmovdqa	-32(%rax), %ymm1	# MEM[(volatile __m256i * {ref-all})_889], _903
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avx2intrin.h:915:   return (__m256i) ((__v4du)__A ^ (__v4du)__B);
	vpandn	%ymm0, %ymm1, %ymm1	# tmp1207, _903, tmp1081
# src/sabd-enclave-hash.c:395:         *chain_result = _mm256_xor_si256(_mm256_and_si256(*chain_result, chain_block_dummy_mask),
	vmovdqa	%ymm1, -32(%rax)	# tmp1081, MEM[(volatile __m256i * {ref-all})_889]
# src/sabd-enclave-hash.c:392:     for (int chain_block_idx = 0; chain_block_idx < CHAIN_BLOCK_COUNT; chain_block_idx++) {
	cmpq	%rax, %rdx	# ivtmp.109, ivtmp.116
	jne	.L29	#,
	addq	$256, %rdx	#, ivtmp.116
# src/sabd-enclave-hash.c:400:     chain_blocks[0] = _mm256_setzero_si256();
	vmovdqa	%ymm2, (%r11)	# tmp1083, *chain_blocks_315
# src/sabd-enclave-hash.c:401:     chain_blocks[1] = _mm256_setzero_si256();
	vmovdqa	%ymm2, 32(%r11)	# tmp1083, MEM[(volatile __m256i * {ref-all})chain_blocks_315 + 32B]
# src/sabd-enclave-hash.c:402:     chain_blocks[2] = _mm256_setzero_si256();
	vmovdqa	%ymm2, 64(%r11)	# tmp1083, MEM[(volatile __m256i * {ref-all})chain_blocks_315 + 64B]
# src/sabd-enclave-hash.c:403:     chain_blocks[3] = _mm256_setzero_si256();
	vmovdqa	%ymm2, 96(%r11)	# tmp1083, MEM[(volatile __m256i * {ref-all})chain_blocks_315 + 96B]
	subq	$-128, %r11	#, ivtmp.114
# src/sabd-enclave-hash.c:389:   for (hash_slot_idx_t hash_slot_idx = 0; likely(hash_slot_idx < hash_table_slot_count); hash_slot_idx++) {
	cmpq	%rdx, %rcx	# ivtmp.116, _1134
	jne	.L26	#,
# src/sabd-enclave-hash.c:406:   free((void *) in_hashed_ab_phones_result);
	movq	%r14, %rdi	# in_hashed_ab_phones_result,
	vzeroupper
	call	free@PLT	#
# src/sabd-enclave-hash.c:407:   free(hashed_ab_phones);
	movq	%r13, %rdi	# hashed_ab_phones,
	call	free@PLT	#
# src/sabd-enclave-hash.c:408:   return SGX_SUCCESS;
	xorl	%eax, %eax	# <retval>
.L45:
# src/sabd-enclave-hash.c:409: }
	leaq	-40(%rbp), %rsp	#,
	popq	%rbx	#
	popq	%r12	#
	popq	%r13	#
	popq	%r14	#
	popq	%r15	#
	popq	%rbp	#
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret	
.L52:
	.cfi_restore_state
# src/sabd-enclave-hash.c:309:       memset_s(hashed_ab_phones, hashed_ab_phones_size, 0, hashed_ab_phones_size);
	movq	96(%rsp), %rsi	# %sfp, _1213
	xorl	%edx, %edx	#
	movq	%rsi, %rcx	# _1213,
	movq	%r8, %rdi	# hashed_ab_phones,
	movq	%r8, 224(%rsp)	# hashed_ab_phones, %sfp
	vzeroupper
	call	memset_s@PLT	#
# src/sabd-enclave-hash.c:229:   for (uint32_t hash_table_tries = 0; !hash_table_constructed && likely(hash_table_tries < 128); hash_table_tries++) {
	decl	68(%rsp)	# %sfp
	movq	224(%rsp), %r8	# %sfp, hashed_ab_phones
	jne	.L6	#,
.L47:
	movq	88(%rsp), %r14	# %sfp, in_hashed_ab_phones_result
	movq	%r8, %r13	# hashed_ab_phones, hashed_ab_phones
# src/sabd-enclave-hash.c:318:     free((void *) in_hashed_ab_phones_result);
	movq	%r14, %rdi	# in_hashed_ab_phones_result,
	call	free@PLT	#
# src/sabd-enclave-hash.c:319:     free(hashed_ab_phones);
	movq	%r13, %rdi	# hashed_ab_phones,
	call	free@PLT	#
# src/sabd-enclave-hash.c:409: }
	leaq	-40(%rbp), %rsp	#,
	popq	%rbx	#
	popq	%r12	#
	popq	%r13	#
	popq	%r14	#
	popq	%r15	#
# src/sabd-enclave-hash.c:320:     return SGX_ERROR_UNEXPECTED;
	movl	$1, %eax	#, <retval>
# src/sabd-enclave-hash.c:409: }
	popq	%rbp	#
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret	
.L51:
	.cfi_restore_state
# src/sabd-enclave-hash.c:257:       for (hash_slot_idx_t ab_phone_idx = 0; likely(ab_phone_idx < ab_phone_count); ab_phone_idx++) {
	vxorpd	%xmm1, %xmm1, %xmm1	# _263
	vmovapd	.LC4(%rip), %ymm5	#, _1239
	vmovapd	%ymm1, %ymm11	#, _262
	vmovapd	.LC5(%rip), %ymm4	#, _1238
	vmovapd	%ymm1, %ymm10	#, _261
	vmovapd	.LC6(%rip), %ymm3	#, _1237
	vmovapd	%ymm1, %ymm9	#, _260
	vmovapd	.LC7(%rip), %ymm2	#, _1236
	jmp	.L14	#
.L11:
# src/sabd-enclave-hash.c:233:     for (uint32_t hash_salt_rand_tries = 0; likely(hash_salt_rand_tries < 10); hash_salt_rand_tries++) {
	decl	%ecx	# ivtmp_1186
	jne	.L8	#,
	jmp	.L47	#
.L53:
# src/sabd-enclave-hash.c:337:   size_t in_phone_idx = 0;
	xorl	%eax, %eax	# in_phone_idx
	vmovdqa	.LC9(%rip), %ymm0	#, tmp1207
	jmp	.L18	#
.L32:
# src/sabd-enclave-hash.c:409: }
	leaq	-40(%rbp), %rsp	#,
	popq	%rbx	#
	popq	%r12	#
	popq	%r13	#
	popq	%r14	#
	popq	%r15	#
# src/sabd-enclave-hash.c:191:     return SGX_ERROR_INVALID_PARAMETER;
	movl	$2, %eax	#, <retval>
# src/sabd-enclave-hash.c:409: }
	popq	%rbp	#
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret	
.L49:
	.cfi_restore_state
# src/sabd-enclave-hash.c:187:   if (unlikely(ab_phone_count == 0)) {
	testl	%r8d, %r8d	# ab_phone_count
	je	.L31	#,
	movq	$128, 96(%rsp)	#, %sfp
	movl	$4, %ebx	#,
	movl	$1, 64(%rsp)	#, %sfp
# src/sabd-enclave-hash.c:184:   uint32_t hash_table_order = likely(ab_phone_count > 1)? _bit_scan_reverse(ab_phone_count - 1) + 1 : 0;
	xorl	%r12d, %r12d	# iftmp.0_105
	jmp	.L4	#
.L33:
# src/sabd-enclave-hash.c:204:     return SGX_ERROR_OUT_OF_MEMORY;
	movl	$3, %eax	#, <retval>
	jmp	.L45	#
.L50:
# src/sabd-enclave-hash.c:214:     free(hashed_ab_phones);
	movq	%r13, %rdi	# hashed_ab_phones,
	call	free@PLT	#
# src/sabd-enclave-hash.c:215:     return SGX_ERROR_OUT_OF_MEMORY;
	movl	$3, %eax	#, <retval>
	jmp	.L45	#
.L54:
	movl	64(%rsp), %eax	# %sfp, _1208
	decl	%eax	# tmp1203
	movl	%eax, 192(%rsp)	# tmp1203, %sfp
	jmp	.L23	#
.L31:
# src/sabd-enclave-hash.c:188:     return SGX_SUCCESS;
	xorl	%eax, %eax	# <retval>
	jmp	.L45	#
	.cfi_endproc
.LFE5440:
	.size	sabd_lookup_hash, .-sabd_lookup_hash
	.section	.rodata.cst32,"aM",@progbits,32
	.align 32
.LC0:
	.quad	0
	.quad	-3
	.quad	-2
	.quad	-1
	.align 32
.LC1:
	.quad	0
	.quad	-6
	.quad	-5
	.quad	-4
	.align 32
.LC2:
	.quad	0
	.quad	-9
	.quad	-8
	.quad	-7
	.align 32
.LC3:
	.quad	0
	.quad	-12
	.quad	-11
	.quad	-10
	.align 32
.LC4:
	.long	0
	.long	0
	.long	4294967284
	.long	-1
	.long	4294967285
	.long	-1
	.long	4294967286
	.long	-1
	.align 32
.LC5:
	.long	0
	.long	0
	.long	4294967287
	.long	-1
	.long	4294967288
	.long	-1
	.long	4294967289
	.long	-1
	.align 32
.LC6:
	.long	0
	.long	0
	.long	4294967290
	.long	-1
	.long	4294967291
	.long	-1
	.long	4294967292
	.long	-1
	.align 32
.LC7:
	.long	0
	.long	0
	.long	4294967293
	.long	-1
	.long	4294967294
	.long	-1
	.long	4294967295
	.long	-1
	.align 32
.LC8:
	.long	4294967295
	.long	-1
	.long	4294967295
	.long	-1
	.long	4294967295
	.long	-1
	.long	4294967295
	.long	-1
	.align 32
.LC9:
	.quad	-1
	.quad	0
	.quad	0
	.quad	0
	.align 32
.LC10:
	.quad	0
	.quad	-1
	.quad	-1
	.quad	-1
	.ident	"GCC: (Debian 8.3.0-6) 8.3.0"
	.section	.note.GNU-stack,"",@progbits

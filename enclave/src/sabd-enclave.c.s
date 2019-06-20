	.file	"sabd-enclave.c"
# GNU C11 (Debian 8.3.0-6) version 8.3.0 (x86_64-linux-gnu)
#	compiled by GNU C version 8.3.0, GMP version 6.1.2, MPFR version 4.0.2, MPC version 1.1.0, isl version isl-0.20-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed:  -I include -I include/bearssl
# -I build/linux-sgx-sgx_2.6-g991bd53a76a5/common/inc
# -I build/linux-sgx-sgx_2.6-g991bd53a76a5/common/inc/tlibc
# -imultiarch x86_64-linux-gnu -D _DEFAULT_SOURCE src/sabd-enclave.c -m64
# -march=skylake -auxbase-strip src/sabd-enclave.c.s -ggdb -ggdb0 -O2 -Wall
# -Werror=all -Wextra -Wno-unused-parameter -Wno-missing-field-initializers
# -std=c11 -fstack-protector -fvisibility=hidden -fPIC -fno-builtin
# -ffreestanding -fverbose-asm
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
# src/sabd-enclave.c:191:   uint32_t hash_table_order = likely(ab_phone_count > 1)? _bit_scan_reverse(ab_phone_count - 1) + 1 : 0;
	cmpl	$1, %r8d	#, ab_phone_count
	jbe	.L49	#,
# src/sabd-enclave.c:191:   uint32_t hash_table_order = likely(ab_phone_count > 1)? _bit_scan_reverse(ab_phone_count - 1) + 1 : 0;
	leal	-1(%r8), %r12d	#, tmp743
# /usr/lib/gcc/x86_64-linux-gnu/8/include/ia32intrin.h:41:   return __builtin_ia32_bsrsi (__X);
	bsrl	%r12d, %r12d	# tmp743, tmp742
# src/sabd-enclave.c:191:   uint32_t hash_table_order = likely(ab_phone_count > 1)? _bit_scan_reverse(ab_phone_count - 1) + 1 : 0;
	incl	%r12d	# iftmp.0_105
# src/sabd-enclave.c:197:   if (unlikely(hash_table_order > SABD_MAX_HASH_TABLE_ORDER)) {
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
# src/sabd-enclave.c:209:   phone_t *hashed_ab_phones = memalign(CACHE_LINE_SIZE, hashed_ab_phones_size);
	movq	96(%rsp), %rsi	# %sfp,
	movq	%rdi, 80(%rsp)	# in_phones, %sfp
	movl	$64, %edi	#,
	movq	%r9, 56(%rsp)	# in_ab_phones_result, %sfp
	movl	%r8d, %r15d	# ab_phone_count, ab_phone_count
	movq	%rcx, 224(%rsp)	# ab_phones, %sfp
	movq	%rdx, 120(%rsp)	# in_phone_count, %sfp
	call	memalign@PLT	#
	movq	%rax, %r13	#, hashed_ab_phones
# src/sabd-enclave.c:210:   if (unlikely(hashed_ab_phones == NULL)) {
	testq	%rax, %rax	# hashed_ab_phones
	je	.L33	#,
# src/sabd-enclave.c:215:   size_t in_hashed_ab_phones_result_size = hash_table_block_count * sizeof(sabd_lookup_hashed_ab_phones_result_t);
	salq	$6, %rbx	#, in_hashed_ab_phones_result_size
# src/sabd-enclave.c:216:   volatile sabd_lookup_hashed_ab_phones_result_t *in_hashed_ab_phones_result = memalign(CACHE_LINE_SIZE, in_hashed_ab_phones_result_size);
	movq	%rbx, %rsi	# in_hashed_ab_phones_result_size,
	movl	$64, %edi	#,
	call	memalign@PLT	#
	movq	%rax, %r14	#, in_hashed_ab_phones_result
# src/sabd-enclave.c:220:   if (unlikely(in_hashed_ab_phones_result == NULL)) {
	testq	%rax, %rax	# in_hashed_ab_phones_result
	je	.L50	#,
# src/sabd-enclave.c:224:   memset_s(in_hashed_ab_phones_result, in_hashed_ab_phones_result_size, 0, in_hashed_ab_phones_result_size);
	movq	%rbx, %rcx	# in_hashed_ab_phones_result_size,
	movq	%rbx, %rsi	# in_hashed_ab_phones_result_size,
	xorl	%edx, %edx	#
	movq	%rax, %rdi	# in_hashed_ab_phones_result,
	call	memset_s@PLT	#
# src/sabd-enclave.c:227:   size_t in_ab_phones_result_size = ab_phone_count * sizeof(in_ab_phones_result[0]);
	movl	%r15d, %esi	# ab_phone_count, ab_phone_count
# src/sabd-enclave.c:227:   size_t in_ab_phones_result_size = ab_phone_count * sizeof(in_ab_phones_result[0]);
	salq	$4, %rsi	#, in_ab_phones_result_size
# src/sabd-enclave.c:228:   memset_s(in_ab_phones_result, in_ab_phones_result_size, UINT8_MAX, in_ab_phones_result_size);
	movq	56(%rsp), %rdi	# %sfp,
	movq	%rsi, %rcx	# in_ab_phones_result_size,
	movl	$255, %edx	#,
	call	memset_s@PLT	#
# src/sabd-enclave.c:231:   memset_s(hashed_ab_phones, hashed_ab_phones_size, 0, hashed_ab_phones_size);
	movq	96(%rsp), %rsi	# %sfp, _1213
	movq	%r13, %rdi	# hashed_ab_phones,
	movq	%rsi, %rcx	# _1213,
	xorl	%edx, %edx	#
	call	memset_s@PLT	#
	movq	224(%rsp), %rax	# %sfp, ab_phones
	leal	-1(%r15), %edi	#, _927
# src/sabd-enclave.c:107:   return _mm_cvtsi128_si32(hash) & ((1 << hash_table_order) - 1);
	movl	$1, %ebx	#, tmp752
	shlx	%r12d, %ebx, %ebx	# iftmp.0_105, tmp752, _371
	movq	%rdi, 48(%rsp)	# _927, %sfp
	leaq	8(%rax,%rdi,8), %r12	#, _914
	leaq	240(%rsp), %rdi	#, tmp1205
	movq	%rax, 40(%rsp)	# ab_phones, %sfp
# src/sabd-enclave.c:107:   return _mm_cvtsi128_si32(hash) & ((1 << hash_table_order) - 1);
	movl	$128, 68(%rsp)	#, %sfp
	movq	%rdi, 112(%rsp)	# tmp1205, %sfp
	movq	%r14, 88(%rsp)	# in_hashed_ab_phones_result, %sfp
	movl	64(%rsp), %r14d	# %sfp, _1208
	movq	%r13, %r8	# hashed_ab_phones, hashed_ab_phones
	decl	%ebx	# _768
	movq	%rax, %r13	# ab_phones, ab_phones
.L6:
	movq	112(%rsp), %rsi	# %sfp, tmp1205
# src/sabd-enclave.c:191:   uint32_t hash_table_order = likely(ab_phone_count > 1)? _bit_scan_reverse(ab_phone_count - 1) + 1 : 0;
	movl	$10, %ecx	#, ivtmp_1186
# /usr/lib/gcc/x86_64-linux-gnu/8/include/immintrin.h:237:   return __builtin_ia32_rdrand64_step (__P);
	movl	$1, %edx	#, tmp758
.L8:
	rdrand	%rax	# tmp757
	movq	%rax, (%rsi)	# tmp757,
	cmovc	%edx, %eax	# tmp757,, tmp758, _316
# src/sabd-enclave.c:241:       if (likely(_rdrand64_step(&hash_salt_64[0])) && likely(_rdrand64_step(&hash_salt_64[1]))) {
	testl	%eax, %eax	# _316
	je	.L11	#,
# /usr/lib/gcc/x86_64-linux-gnu/8/include/immintrin.h:237:   return __builtin_ia32_rdrand64_step (__P);
	rdrand	%rax	# tmp761
	movq	%rax, 8(%rsi)	# tmp761,
	cmovc	%edx, %eax	# tmp761,, tmp758, _311
# src/sabd-enclave.c:241:       if (likely(_rdrand64_step(&hash_salt_64[0])) && likely(_rdrand64_step(&hash_salt_64[1]))) {
	testl	%eax, %eax	# _311
	je	.L11	#,
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:592:   return __extension__ (__m128i)(__v2di){ __q0, __q1 };
	vmovq	248(%rsp), %xmm3	# MEM[(long long unsigned int *)&hash_salt_64 + 8B], tmp1419
	movq	%r8, %r11	# hashed_ab_phones, ivtmp.115
	vpinsrq	$1, 240(%rsp), %xmm3, %xmm4	# MEM[(long long unsigned int *)&hash_salt_64], tmp1419, tmp1088
# /usr/lib/gcc/x86_64-linux-gnu/8/include/emmintrin.h:1293:   return (__m128i) ((__v2du)__A ^ (__v2du)__B);
	movq	%r8, %r9	# hashed_ab_phones, ivtmp.170
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
# src/sabd-enclave.c:253:     for (hash_slot_idx_t hash_slot_idx = 0; likely(hash_slot_idx < hash_table_slot_count); hash_slot_idx++) {
	xorl	%edi, %edi	# hash_slot_idx
# src/sabd-enclave.c:252:     bool any_hash_slots_overflowed = false;
	xorl	%r10d, %r10d	# any_hash_slots_overflowed
	.p2align 4,,10
	.p2align 3
.L30:
# src/sabd-enclave.c:264:       for (hash_slot_idx_t ab_phone_idx = 0; likely(ab_phone_idx < ab_phone_count); ab_phone_idx++) {
	testl	%r15d, %r15d	# ab_phone_count
	je	.L51	#,
# src/sabd-enclave.c:256:       register __m256i chain_blocks[CHAIN_BLOCK_COUNT] = {0};
	vpxor	%xmm0, %xmm0, %xmm0	# chain_blocks$3
# src/sabd-enclave.c:257:       register __m256i chain_block_masks[] = {
	vmovdqa	.LC0(%rip), %ymm2	#, chain_block_masks$0
	vmovdqa	.LC1(%rip), %ymm3	#, chain_block_masks$1
	vmovdqa	.LC2(%rip), %ymm4	#, chain_block_masks$2
	vmovdqa	.LC3(%rip), %ymm5	#, chain_block_masks$3
# src/sabd-enclave.c:264:       for (hash_slot_idx_t ab_phone_idx = 0; likely(ab_phone_idx < ab_phone_count); ab_phone_idx++) {
	movq	%r13, %rdx	# ab_phones, ivtmp.166
# src/sabd-enclave.c:263:       hash_slot_idx_t chain_idx = 0;
	xorl	%ecx, %ecx	# chain_idx
# src/sabd-enclave.c:256:       register __m256i chain_blocks[CHAIN_BLOCK_COUNT] = {0};
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
# src/sabd-enclave.c:281:         bool phone_not_in_chain = _mm256_testz_pd((__m256d) chain_eq, (__m256d) chain_eq);
	vpor	%ymm10, %ymm9, %ymm10	# tmp787, tmp782, _51
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avxintrin.h:1136:   return __builtin_ia32_vtestzpd256 ((__v4df)__M, (__v4df)__V);
	vtestpd	%ymm10, %ymm10	# _51, _51
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avxintrin.h:220:   return (__m256d) __builtin_ia32_blendvpd256 ((__v4df)__X,
	vblendvpd	%ymm3, %ymm1, %ymm7, %ymm10	# chain_block_masks$1, _55, chain_blocks$1, _261
	vblendvpd	%ymm2, %ymm1, %ymm8, %ymm9	# chain_block_masks$0, _55, chain_blocks$0, _260
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avxintrin.h:1136:   return __builtin_ia32_vtestzpd256 ((__v4df)__M, (__v4df)__V);
	sete	%sil	#, tmp789
# src/sabd-enclave.c:107:   return _mm_cvtsi128_si32(hash) & ((1 << hash_table_order) - 1);
	andl	%ebx, %eax	# _768, tmp790
# src/sabd-enclave.c:271:           (((uint64_t) (((int64_t) (((uint64_t) ab_phone_hash_slot_idx) ^ ((uint64_t) hash_slot_idx))) - 1))
	xorl	%edi, %eax	# hash_slot_idx, tmp792
# src/sabd-enclave.c:271:           (((uint64_t) (((int64_t) (((uint64_t) ab_phone_hash_slot_idx) ^ ((uint64_t) hash_slot_idx))) - 1))
	decq	%rax	# tmp793
# src/sabd-enclave.c:272:            >> (sizeof(hash_slot_idx) * 8)) & 1;
	shrq	$32, %rax	#, tmp794
	andq	%rsi, %rax	# tmp789, _30
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avxintrin.h:1343:   return __extension__ (__m256i)(__v4di){ __A, __A, __A, __A };
	vmovq	%rax, %xmm7	# _30, _30
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avxintrin.h:220:   return (__m256d) __builtin_ia32_blendvpd256 ((__v4df)__X,
	vblendvpd	%ymm4, %ymm1, %ymm6, %ymm11	# chain_block_masks$2, _55, chain_blocks$2, _262
	addq	$8, %rdx	#, ivtmp.166
	vblendvpd	%ymm5, %ymm1, %ymm0, %ymm1	# chain_block_masks$3, _55, chain_blocks$3, _263
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avxintrin.h:1343:   return __extension__ (__m256i)(__v4di){ __A, __A, __A, __A };
	vpbroadcastq	%xmm7, %ymm0	# _30, tmp813
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avx2intrin.h:128:   return (__m256i) ((__v4du)__A + (__v4du)__B);
	vpaddq	%ymm0, %ymm5, %ymm5	# tmp813, chain_block_masks$3, chain_block_masks$3
	vpaddq	%ymm0, %ymm4, %ymm4	# tmp813, chain_block_masks$2, chain_block_masks$2
	vpaddq	%ymm0, %ymm3, %ymm3	# tmp813, chain_block_masks$1, chain_block_masks$1
	vpaddq	%ymm0, %ymm2, %ymm2	# tmp813, chain_block_masks$0, chain_block_masks$0
# src/sabd-enclave.c:285:         chain_idx += should_insert_phone;
	addl	%eax, %ecx	# _30, chain_idx
# src/sabd-enclave.c:289:         chain_blocks[2] = (__m256i) _mm256_blendv_pd((__m256d) chain_blocks[2], (__m256d) ab_phone_block, (__m256d) chain_block_masks[2]);
	vmovdqa	%ymm11, %ymm6	# _262, chain_blocks$2
# src/sabd-enclave.c:288:         chain_blocks[1] = (__m256i) _mm256_blendv_pd((__m256d) chain_blocks[1], (__m256d) ab_phone_block, (__m256d) chain_block_masks[1]);
	vmovdqa	%ymm10, %ymm7	# _261, chain_blocks$1
# src/sabd-enclave.c:287:         chain_blocks[0] = (__m256i) _mm256_blendv_pd((__m256d) chain_blocks[0], (__m256d) ab_phone_block, (__m256d) chain_block_masks[0]);
	vmovdqa	%ymm9, %ymm8	# _260, chain_blocks$0
# src/sabd-enclave.c:290:         chain_blocks[3] = (__m256i) _mm256_blendv_pd((__m256d) chain_blocks[3], (__m256d) ab_phone_block, (__m256d) chain_block_masks[3]);
	vmovdqa	%ymm1, %ymm0	# _263, chain_blocks$3
# src/sabd-enclave.c:264:       for (hash_slot_idx_t ab_phone_idx = 0; likely(ab_phone_idx < ab_phone_count); ab_phone_idx++) {
	cmpq	%rdx, %r12	# ivtmp.166, _914
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
# src/sabd-enclave.c:253:     for (hash_slot_idx_t hash_slot_idx = 0; likely(hash_slot_idx < hash_table_slot_count); hash_slot_idx++) {
	incl	%edi	# hash_slot_idx
# src/sabd-enclave.c:306:       p_chain_blocks[0] = chain_blocks[0];
	vmovdqa	%ymm2, (%r9)	# tmp816, MEM[base: _910, offset: 0B]
# src/sabd-enclave.c:307:       p_chain_blocks[1] = chain_blocks[1];
	vmovdqa	%ymm3, 32(%r9)	# tmp820, MEM[base: _910, offset: 32B]
# src/sabd-enclave.c:308:       p_chain_blocks[2] = chain_blocks[2];
	vmovdqa	%ymm4, 64(%r9)	# tmp824, MEM[base: _910, offset: 64B]
# src/sabd-enclave.c:309:       p_chain_blocks[3] = chain_blocks[3];
	vmovdqa	%ymm5, 96(%r9)	# tmp828, MEM[base: _910, offset: 96B]
	subq	$-128, %r9	#, ivtmp.170
# src/sabd-enclave.c:253:     for (hash_slot_idx_t hash_slot_idx = 0; likely(hash_slot_idx < hash_table_slot_count); hash_slot_idx++) {
	cmpl	%r14d, %edi	# _1208, hash_slot_idx
	jne	.L30	#,
# src/sabd-enclave.c:315:     if (unlikely(!hash_table_constructed)) {
	testb	%r10b, %r10b	# any_hash_slots_overflowed
	jne	.L52	#,
# src/sabd-enclave.c:345:   for (; likely(in_phone_idx + prefetch_phones_dist + cache_line_phones < in_phone_count); in_phone_idx += cache_line_phones) {
	cmpq	$24, 120(%rsp)	#, %sfp
	vmovaps	%xmm15, 96(%rsp)	# _619, %sfp
	movq	%r8, %r13	# hashed_ab_phones, hashed_ab_phones
	movq	88(%rsp), %r14	# %sfp, in_hashed_ab_phones_result
	vmovdqa	128(%rsp), %xmm15	# %sfp, _466
	jbe	.L53	#,
	movq	72(%rsp), %rax	# %sfp, in_uuids
	movq	80(%rsp), %rcx	# %sfp, in_phones
	leaq	128(%rax), %rdi	#, ivtmp.160
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
	leaq	128(%rcx), %r8	#, ivtmp.154
	leaq	192(%rcx,%rax), %r10	#, _942
.L20:
	leaq	128(%rdi), %r9	#, _961
# /usr/lib/gcc/x86_64-linux-gnu/8/include/xmmintrin.h:54:   __builtin_prefetch (__P, (__I & 0x4) >> 2, __I & 0x3);
	prefetchnta	(%r8)	# ivtmp.154
	prefetchnta	(%r9)	# _961
	prefetchnta	192(%rdi)	#
	movq	%r8, 128(%rsp)	# ivtmp.154, %sfp
	leaq	-128(%r8), %rsi	#, ivtmp.145
	leaq	-128(%rdi), %rcx	#, ivtmp.146
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
# src/sabd-enclave.c:107:   return _mm_cvtsi128_si32(hash) & ((1 << hash_table_order) - 1);
	andl	%ebx, %eax	# _768, _655
# src/sabd-enclave.c:140:   __m256i *chain_blocks = (__m256i *) &hashed_ab_phones[in_phone_hash_slot_idx * CHAIN_PHONE_COUNT];
	movslq	%eax, %rdx	# _655, _655
# src/sabd-enclave.c:156:     &in_hashed_ab_phones_result[in_phone_hash_slot_idx * CHAIN_BLOCK_COUNT];
	sall	$2, %eax	#,
# src/sabd-enclave.c:140:   __m256i *chain_blocks = (__m256i *) &hashed_ab_phones[in_phone_hash_slot_idx * CHAIN_PHONE_COUNT];
	salq	$7, %rdx	#, tmp854
# src/sabd-enclave.c:156:     &in_hashed_ab_phones_result[in_phone_hash_slot_idx * CHAIN_BLOCK_COUNT];
	salq	$6, %rax	#, tmp860
# src/sabd-enclave.c:155:   volatile sabd_lookup_hashed_ab_phones_result_t *chain_results =
	addq	%r14, %rax	# in_hashed_ab_phones_result, chain_results
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avx2intrin.h:576:   return (__m256i) ((__v4du)__A | (__v4du)__B);
	vpor	%ymm0, %ymm1, %ymm1	# tmp1207, tmp836, tmp837
# src/sabd-enclave.c:140:   __m256i *chain_blocks = (__m256i *) &hashed_ab_phones[in_phone_hash_slot_idx * CHAIN_PHONE_COUNT];
	addq	%r13, %rdx	# hashed_ab_phones, chain_blocks
# src/sabd-enclave.c:120:     *chain_result = _mm256_blendv_epi8(_mm256_xor_si256(*chain_result, dummy_write_mask),
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
# src/sabd-enclave.c:152:     _mm256_set1_epi64x(in_uuid.data64[1]),
	movq	8(%rcx), %r8	# MEM[base: _991, offset: 8B], _672
# src/sabd-enclave.c:120:     *chain_result = _mm256_blendv_epi8(_mm256_xor_si256(*chain_result, dummy_write_mask),
	vmovdqa	%ymm2, (%rax)	# tmp864, MEM[(volatile __m256i * {ref-all})chain_results_677]
# src/sabd-enclave.c:120:     *chain_result = _mm256_blendv_epi8(_mm256_xor_si256(*chain_result, dummy_write_mask),
	vmovdqa	32(%rax), %ymm2	# MEM[(volatile __m256i * {ref-all})chain_results_677], _1156
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avx2intrin.h:209:   return (__m256i) __builtin_ia32_pblendvb256 ((__v32qi)__X,
	vmovq	%r8, %xmm3	# _672, _672
	vpbroadcastq	%xmm3, %ymm3	# _672, _1160
	vpxor	%ymm0, %ymm2, %ymm2	# tmp1207, _1156, tmp874
	vpblendvb	%ymm1, %ymm3, %ymm2, %ymm1	# _1143, _1160, tmp874, tmp871
# src/sabd-enclave.c:120:     *chain_result = _mm256_blendv_epi8(_mm256_xor_si256(*chain_result, dummy_write_mask),
	vmovdqa	%ymm1, 32(%rax)	# tmp871, MEM[(volatile __m256i * {ref-all})chain_results_677]
# src/sabd-enclave.c:120:     *chain_result = _mm256_blendv_epi8(_mm256_xor_si256(*chain_result, dummy_write_mask),
	vmovdqa	64(%rax), %ymm1	# MEM[(volatile __m256i * {ref-all})chain_results_677 + 64B], _1108
	addq	$16, %rcx	#, ivtmp.146
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avx2intrin.h:209:   return (__m256i) __builtin_ia32_pblendvb256 ((__v32qi)__X,
	vpxor	%ymm0, %ymm1, %ymm1	# tmp1207, _1108, tmp880
	vpblendvb	%ymm7, %ymm5, %ymm1, %ymm1	# _1111, _1144, tmp880, tmp877
# src/sabd-enclave.c:120:     *chain_result = _mm256_blendv_epi8(_mm256_xor_si256(*chain_result, dummy_write_mask),
	vmovdqa	%ymm1, 64(%rax)	# tmp877, MEM[(volatile __m256i * {ref-all})chain_results_677 + 64B]
# src/sabd-enclave.c:120:     *chain_result = _mm256_blendv_epi8(_mm256_xor_si256(*chain_result, dummy_write_mask),
	vmovdqa	96(%rax), %ymm1	# MEM[(volatile __m256i * {ref-all})chain_results_677 + 64B], _1124
	addq	$8, %rsi	#, ivtmp.145
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avx2intrin.h:209:   return (__m256i) __builtin_ia32_pblendvb256 ((__v32qi)__X,
	vpxor	%ymm0, %ymm1, %ymm1	# tmp1207, _1124, tmp886
	vpblendvb	%ymm7, %ymm3, %ymm1, %ymm7	# _1111, _1160, tmp886, tmp883
# src/sabd-enclave.c:120:     *chain_result = _mm256_blendv_epi8(_mm256_xor_si256(*chain_result, dummy_write_mask),
	vmovdqa	%ymm7, 96(%rax)	# tmp883, MEM[(volatile __m256i * {ref-all})chain_results_677 + 64B]
# src/sabd-enclave.c:120:     *chain_result = _mm256_blendv_epi8(_mm256_xor_si256(*chain_result, dummy_write_mask),
	vmovdqa	128(%rax), %ymm1	# MEM[(volatile __m256i * {ref-all})chain_results_677 + 128B], _1076
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avx2intrin.h:209:   return (__m256i) __builtin_ia32_pblendvb256 ((__v32qi)__X,
	vpxor	%ymm0, %ymm1, %ymm1	# tmp1207, _1076, tmp892
	vpblendvb	%ymm6, %ymm5, %ymm1, %ymm1	# _1079, _1144, tmp892, tmp889
# src/sabd-enclave.c:120:     *chain_result = _mm256_blendv_epi8(_mm256_xor_si256(*chain_result, dummy_write_mask),
	vmovdqa	%ymm1, 128(%rax)	# tmp889, MEM[(volatile __m256i * {ref-all})chain_results_677 + 128B]
# src/sabd-enclave.c:120:     *chain_result = _mm256_blendv_epi8(_mm256_xor_si256(*chain_result, dummy_write_mask),
	vmovdqa	160(%rax), %ymm1	# MEM[(volatile __m256i * {ref-all})chain_results_677 + 128B], _1092
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avx2intrin.h:209:   return (__m256i) __builtin_ia32_pblendvb256 ((__v32qi)__X,
	vpxor	%ymm0, %ymm1, %ymm1	# tmp1207, _1092, tmp898
	vpblendvb	%ymm6, %ymm3, %ymm1, %ymm6	# _1079, _1160, tmp898, tmp895
# src/sabd-enclave.c:120:     *chain_result = _mm256_blendv_epi8(_mm256_xor_si256(*chain_result, dummy_write_mask),
	vmovdqa	%ymm6, 160(%rax)	# tmp895, MEM[(volatile __m256i * {ref-all})chain_results_677 + 128B]
# src/sabd-enclave.c:120:     *chain_result = _mm256_blendv_epi8(_mm256_xor_si256(*chain_result, dummy_write_mask),
	vmovdqa	192(%rax), %ymm1	# MEM[(volatile __m256i * {ref-all})chain_results_677 + 192B], _1044
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avx2intrin.h:209:   return (__m256i) __builtin_ia32_pblendvb256 ((__v32qi)__X,
	vpxor	%ymm0, %ymm1, %ymm1	# tmp1207, _1044, tmp904
	vpblendvb	%ymm4, %ymm5, %ymm1, %ymm5	# _1047, _1144, tmp904, tmp901
# src/sabd-enclave.c:120:     *chain_result = _mm256_blendv_epi8(_mm256_xor_si256(*chain_result, dummy_write_mask),
	vmovdqa	%ymm5, 192(%rax)	# tmp901, MEM[(volatile __m256i * {ref-all})chain_results_677 + 192B]
# src/sabd-enclave.c:120:     *chain_result = _mm256_blendv_epi8(_mm256_xor_si256(*chain_result, dummy_write_mask),
	vmovdqa	224(%rax), %ymm1	# MEM[(volatile __m256i * {ref-all})chain_results_677 + 192B], _1060
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avx2intrin.h:209:   return (__m256i) __builtin_ia32_pblendvb256 ((__v32qi)__X,
	vpxor	%ymm0, %ymm1, %ymm1	# tmp1207, _1060, tmp910
	vpblendvb	%ymm4, %ymm3, %ymm1, %ymm3	# _1047, _1160, tmp910, tmp907
# src/sabd-enclave.c:120:     *chain_result = _mm256_blendv_epi8(_mm256_xor_si256(*chain_result, dummy_write_mask),
	vmovdqa	%ymm3, 224(%rax)	# tmp907, MEM[(volatile __m256i * {ref-all})chain_results_677 + 192B]
# src/sabd-enclave.c:354:     for (size_t cached_in_phone_idx = 0; cached_in_phone_idx < cache_line_phones; cached_in_phone_idx++) {
	cmpq	%rcx, %rdi	# ivtmp.146, ivtmp.160
	jne	.L19	#,
	movq	128(%rsp), %r8	# %sfp, ivtmp.154
	movq	%r9, %rdi	# _961, ivtmp.160
	addq	$64, %r8	#, ivtmp.154
# src/sabd-enclave.c:345:   for (; likely(in_phone_idx + prefetch_phones_dist + cache_line_phones < in_phone_count); in_phone_idx += cache_line_phones) {
	cmpq	%r8, %r10	# ivtmp.154, _942
	jne	.L20	#,
	andq	$-8, %r12	#, tmp913
	leaq	8(%r12), %rax	#, in_phone_idx
.L18:
# src/sabd-enclave.c:359:   for (; in_phone_idx < in_phone_count; in_phone_idx++) {
	cmpq	120(%rsp), %rax	# %sfp, in_phone_idx
	jnb	.L25	#,
	movq	80(%rsp), %rdi	# %sfp, in_phones
	movq	72(%rsp), %rdx	# %sfp, in_uuids
	leaq	(%rdi,%rax,8), %rsi	#, ivtmp.134
	movq	120(%rsp), %rdi	# %sfp, in_phone_count
	salq	$4, %rax	#, tmp915
	salq	$4, %rdi	#, in_phone_count
	vmovdqa	176(%rsp), %xmm8	# %sfp, _534
	vmovdqa	160(%rsp), %xmm9	# %sfp, _551
	vmovdqa	96(%rsp), %xmm10	# %sfp, _619
	vmovdqa	144(%rsp), %xmm11	# %sfp, tmp1088
	leaq	(%rdx,%rax), %rcx	#, ivtmp.135
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
# src/sabd-enclave.c:107:   return _mm_cvtsi128_si32(hash) & ((1 << hash_table_order) - 1);
	andl	%ebx, %eax	# _768, _769
# src/sabd-enclave.c:140:   __m256i *chain_blocks = (__m256i *) &hashed_ab_phones[in_phone_hash_slot_idx * CHAIN_PHONE_COUNT];
	movslq	%eax, %rdx	# _769, _769
# src/sabd-enclave.c:156:     &in_hashed_ab_phones_result[in_phone_hash_slot_idx * CHAIN_BLOCK_COUNT];
	sall	$2, %eax	#,
# src/sabd-enclave.c:140:   __m256i *chain_blocks = (__m256i *) &hashed_ab_phones[in_phone_hash_slot_idx * CHAIN_PHONE_COUNT];
	salq	$7, %rdx	#, tmp935
# src/sabd-enclave.c:156:     &in_hashed_ab_phones_result[in_phone_hash_slot_idx * CHAIN_BLOCK_COUNT];
	salq	$6, %rax	#, tmp941
# src/sabd-enclave.c:155:   volatile sabd_lookup_hashed_ab_phones_result_t *chain_results =
	addq	%r14, %rax	# in_hashed_ab_phones_result, chain_results
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avx2intrin.h:576:   return (__m256i) ((__v4du)__A | (__v4du)__B);
	vpor	%ymm0, %ymm1, %ymm1	# tmp1207, tmp917, tmp918
# src/sabd-enclave.c:140:   __m256i *chain_blocks = (__m256i *) &hashed_ab_phones[in_phone_hash_slot_idx * CHAIN_PHONE_COUNT];
	addq	%r13, %rdx	# hashed_ab_phones, chain_blocks
# src/sabd-enclave.c:120:     *chain_result = _mm256_blendv_epi8(_mm256_xor_si256(*chain_result, dummy_write_mask),
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
# src/sabd-enclave.c:152:     _mm256_set1_epi64x(in_uuid.data64[1]),
	movq	8(%rcx), %r8	# MEM[base: _1025, offset: 8B], _786
# src/sabd-enclave.c:120:     *chain_result = _mm256_blendv_epi8(_mm256_xor_si256(*chain_result, dummy_write_mask),
	vmovdqa	%ymm2, (%rax)	# tmp945, MEM[(volatile __m256i * {ref-all})chain_results_791]
# src/sabd-enclave.c:120:     *chain_result = _mm256_blendv_epi8(_mm256_xor_si256(*chain_result, dummy_write_mask),
	vmovdqa	32(%rax), %ymm3	# MEM[(volatile __m256i * {ref-all})chain_results_791], _1028
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avx2intrin.h:209:   return (__m256i) __builtin_ia32_pblendvb256 ((__v32qi)__X,
	vmovq	%r8, %xmm2	# _786, _786
	vpbroadcastq	%xmm2, %ymm2	# _786, _1032
	vpxor	%ymm0, %ymm3, %ymm3	# tmp1207, _1028, tmp955
	vpblendvb	%ymm1, %ymm2, %ymm3, %ymm1	# _1015, _1032, tmp955, tmp952
# src/sabd-enclave.c:120:     *chain_result = _mm256_blendv_epi8(_mm256_xor_si256(*chain_result, dummy_write_mask),
	vmovdqa	%ymm1, 32(%rax)	# tmp952, MEM[(volatile __m256i * {ref-all})chain_results_791]
# src/sabd-enclave.c:120:     *chain_result = _mm256_blendv_epi8(_mm256_xor_si256(*chain_result, dummy_write_mask),
	vmovdqa	64(%rax), %ymm1	# MEM[(volatile __m256i * {ref-all})chain_results_791 + 64B], _980
	addq	$16, %rcx	#, ivtmp.135
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avx2intrin.h:209:   return (__m256i) __builtin_ia32_pblendvb256 ((__v32qi)__X,
	vpxor	%ymm0, %ymm1, %ymm1	# tmp1207, _980, tmp961
	vpblendvb	%ymm7, %ymm5, %ymm1, %ymm1	# _983, _1016, tmp961, tmp958
# src/sabd-enclave.c:120:     *chain_result = _mm256_blendv_epi8(_mm256_xor_si256(*chain_result, dummy_write_mask),
	vmovdqa	%ymm1, 64(%rax)	# tmp958, MEM[(volatile __m256i * {ref-all})chain_results_791 + 64B]
# src/sabd-enclave.c:120:     *chain_result = _mm256_blendv_epi8(_mm256_xor_si256(*chain_result, dummy_write_mask),
	vmovdqa	96(%rax), %ymm1	# MEM[(volatile __m256i * {ref-all})chain_results_791 + 64B], _996
	addq	$8, %rsi	#, ivtmp.134
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avx2intrin.h:209:   return (__m256i) __builtin_ia32_pblendvb256 ((__v32qi)__X,
	vpxor	%ymm0, %ymm1, %ymm1	# tmp1207, _996, tmp967
	vpblendvb	%ymm7, %ymm2, %ymm1, %ymm7	# _983, _1032, tmp967, tmp964
# src/sabd-enclave.c:120:     *chain_result = _mm256_blendv_epi8(_mm256_xor_si256(*chain_result, dummy_write_mask),
	vmovdqa	%ymm7, 96(%rax)	# tmp964, MEM[(volatile __m256i * {ref-all})chain_results_791 + 64B]
# src/sabd-enclave.c:120:     *chain_result = _mm256_blendv_epi8(_mm256_xor_si256(*chain_result, dummy_write_mask),
	vmovdqa	128(%rax), %ymm1	# MEM[(volatile __m256i * {ref-all})chain_results_791 + 128B], _948
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avx2intrin.h:209:   return (__m256i) __builtin_ia32_pblendvb256 ((__v32qi)__X,
	vpxor	%ymm0, %ymm1, %ymm1	# tmp1207, _948, tmp973
	vpblendvb	%ymm6, %ymm5, %ymm1, %ymm1	# _951, _1016, tmp973, tmp970
# src/sabd-enclave.c:120:     *chain_result = _mm256_blendv_epi8(_mm256_xor_si256(*chain_result, dummy_write_mask),
	vmovdqa	%ymm1, 128(%rax)	# tmp970, MEM[(volatile __m256i * {ref-all})chain_results_791 + 128B]
# src/sabd-enclave.c:120:     *chain_result = _mm256_blendv_epi8(_mm256_xor_si256(*chain_result, dummy_write_mask),
	vmovdqa	160(%rax), %ymm1	# MEM[(volatile __m256i * {ref-all})chain_results_791 + 128B], _964
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avx2intrin.h:209:   return (__m256i) __builtin_ia32_pblendvb256 ((__v32qi)__X,
	vpxor	%ymm0, %ymm1, %ymm1	# tmp1207, _964, tmp979
	vpblendvb	%ymm6, %ymm2, %ymm1, %ymm6	# _951, _1032, tmp979, tmp976
# src/sabd-enclave.c:120:     *chain_result = _mm256_blendv_epi8(_mm256_xor_si256(*chain_result, dummy_write_mask),
	vmovdqa	%ymm6, 160(%rax)	# tmp976, MEM[(volatile __m256i * {ref-all})chain_results_791 + 128B]
# src/sabd-enclave.c:120:     *chain_result = _mm256_blendv_epi8(_mm256_xor_si256(*chain_result, dummy_write_mask),
	vmovdqa	192(%rax), %ymm1	# MEM[(volatile __m256i * {ref-all})chain_results_791 + 192B], _916
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avx2intrin.h:209:   return (__m256i) __builtin_ia32_pblendvb256 ((__v32qi)__X,
	vpxor	%ymm0, %ymm1, %ymm1	# tmp1207, _916, tmp985
	vpblendvb	%ymm4, %ymm5, %ymm1, %ymm5	# _919, _1016, tmp985, tmp982
# src/sabd-enclave.c:120:     *chain_result = _mm256_blendv_epi8(_mm256_xor_si256(*chain_result, dummy_write_mask),
	vmovdqa	%ymm5, 192(%rax)	# tmp982, MEM[(volatile __m256i * {ref-all})chain_results_791 + 192B]
# src/sabd-enclave.c:120:     *chain_result = _mm256_blendv_epi8(_mm256_xor_si256(*chain_result, dummy_write_mask),
	vmovdqa	224(%rax), %ymm1	# MEM[(volatile __m256i * {ref-all})chain_results_791 + 192B], _932
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avx2intrin.h:209:   return (__m256i) __builtin_ia32_pblendvb256 ((__v32qi)__X,
	vpxor	%ymm0, %ymm1, %ymm1	# tmp1207, _932, tmp991
	vpblendvb	%ymm4, %ymm2, %ymm1, %ymm2	# _919, _1032, tmp991, tmp988
# src/sabd-enclave.c:120:     *chain_result = _mm256_blendv_epi8(_mm256_xor_si256(*chain_result, dummy_write_mask),
	vmovdqa	%ymm2, 224(%rax)	# tmp988, MEM[(volatile __m256i * {ref-all})chain_results_791 + 192B]
# src/sabd-enclave.c:359:   for (; in_phone_idx < in_phone_count; in_phone_idx++) {
	cmpq	%rcx, %rdi	# ivtmp.135, _1022
	jne	.L24	#,
.L25:
# src/sabd-enclave.c:369:   for (hash_slot_idx_t ab_phone_idx = 0; likely(ab_phone_idx < ab_phone_count); ab_phone_idx++) {
	testl	%r15d, %r15d	# ab_phone_count
	je	.L54	#,
	movq	48(%rsp), %rax	# %sfp, _927
	movq	56(%rsp), %r10	# %sfp, ivtmp.129
	salq	$4, %rax	#, _927
	leaq	16(%r10,%rax), %rbx	#, _1057
	movl	64(%rsp), %eax	# %sfp, _1208
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avx2intrin.h:209:   return (__m256i) __builtin_ia32_pblendvb256 ((__v32qi)__X,
	movq	%r13, 224(%rsp)	# hashed_ab_phones, %sfp
	decl	%eax	#
	movq	%r14, 208(%rsp)	# in_hashed_ab_phones_result, %sfp
	movq	%r11, 176(%rsp)	# ivtmp.115, %sfp
	movl	%eax, 192(%rsp)	# tmp1203, %sfp
	movq	%rbx, %r15	# _1057, _1057
	salq	$7, %rax	#, tmp1002
	vmovdqa	.LC10(%rip), %ymm4	#, tmp1202
	movq	40(%rsp), %rbx	# %sfp, ivtmp.128
	leaq	128(%r13,%rax), %r9	#, _1101
	vpxor	%xmm5, %xmm5, %xmm5	# tmp1010
	.p2align 4,,10
	.p2align 3
.L28:
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avxintrin.h:1343:   return __extension__ (__m256i)(__v4di){ __A, __A, __A, __A };
	vpbroadcastq	(%rbx), %ymm3	# MEM[base: _1074, offset: 0B], _334
	movq	208(%rsp), %rdx	# %sfp, ivtmp.123
	movq	224(%rsp), %rsi	# %sfp, ivtmp.122
# src/sabd-enclave.c:372:     uuid_t ab_phone_result = {
	xorl	%r8d, %r8d	# ab_phone_result$data64$1
	xorl	%r11d, %r11d	# ab_phone_result$data64$0
	.p2align 4,,10
	.p2align 3
.L27:
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avx2intrin.h:181:   return (__m256i) ((__v4du)__A & (__v4du)__B);
	vpand	(%rsi), %ymm4, %ymm1	# MEM[base: _1118, offset: 0B], tmp1202, tmp1005
# src/sabd-enclave.c:170:   chain_result = _mm256_blendv_epi8(chain_result, chain_results[0].uuids[uuid_data64_idx], chain_eq[0]);
	vmovdqa	(%rdx), %ymm2	# *chain_results_306, _400
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avx2intrin.h:209:   return (__m256i) __builtin_ia32_pblendvb256 ((__v32qi)__X,
	vpcmpeqq	%ymm1, %ymm3, %ymm9	# tmp1005, _334, _401
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avx2intrin.h:181:   return (__m256i) ((__v4du)__A & (__v4du)__B);
	vpand	32(%rsi), %ymm4, %ymm1	# MEM[base: _1118, offset: 32B], tmp1202, tmp1013
# src/sabd-enclave.c:171:   chain_result = _mm256_blendv_epi8(chain_result, chain_results[1].uuids[uuid_data64_idx], chain_eq[1]);
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
# src/sabd-enclave.c:172:   chain_result = _mm256_blendv_epi8(chain_result, chain_results[2].uuids[uuid_data64_idx], chain_eq[2]);
	vmovdqa	128(%rdx), %ymm6	# MEM[(volatile struct sabd_lookup_hashed_ab_phones_result_t *)chain_results_306 + 128B], _408
# src/sabd-enclave.c:173:   chain_result = _mm256_blendv_epi8(chain_result, chain_results[3].uuids[uuid_data64_idx], chain_eq[3]);
	vmovdqa	192(%rdx), %ymm10	# MEM[(volatile struct sabd_lookup_hashed_ab_phones_result_t *)chain_results_306 + 192B], _412
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avx2intrin.h:209:   return (__m256i) __builtin_ia32_pblendvb256 ((__v32qi)__X,
	vpblendvb	%ymm7, %ymm6, %ymm2, %ymm2	# _409, _408, tmp1017, tmp1025
	vpcmpeqq	%ymm1, %ymm3, %ymm6	# tmp1029, _334, _413
# src/sabd-enclave.c:170:   chain_result = _mm256_blendv_epi8(chain_result, chain_results[0].uuids[uuid_data64_idx], chain_eq[0]);
	vmovdqa	32(%rdx), %ymm1	# *chain_results_306, _375
	subq	$-128, %rsi	#, ivtmp.122
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
# src/sabd-enclave.c:171:   chain_result = _mm256_blendv_epi8(chain_result, chain_results[1].uuids[uuid_data64_idx], chain_eq[1]);
	vmovdqa	96(%rdx), %ymm2	# MEM[(volatile struct sabd_lookup_hashed_ab_phones_result_t *)chain_results_306 + 64B], _378
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avx2intrin.h:209:   return (__m256i) __builtin_ia32_pblendvb256 ((__v32qi)__X,
	vpblendvb	%ymm9, %ymm1, %ymm5, %ymm1	# _401, _375, tmp1010, tmp1048
	vpblendvb	%ymm8, %ymm2, %ymm1, %ymm1	# _405, _378, tmp1048, tmp1052
# src/sabd-enclave.c:172:   chain_result = _mm256_blendv_epi8(chain_result, chain_results[2].uuids[uuid_data64_idx], chain_eq[2]);
	vmovdqa	160(%rdx), %ymm2	# MEM[(volatile struct sabd_lookup_hashed_ab_phones_result_t *)chain_results_306 + 128B], _381
# src/sabd-enclave.c:175:   return (_mm256_extract_epi64(chain_result, 0) |
	orq	%rdi, %rax	# tmp1040, tmp1045
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avx2intrin.h:209:   return (__m256i) __builtin_ia32_pblendvb256 ((__v32qi)__X,
	vpblendvb	%ymm7, %ymm2, %ymm1, %ymm1	# _409, _381, tmp1052, tmp1056
# src/sabd-enclave.c:173:   chain_result = _mm256_blendv_epi8(chain_result, chain_results[3].uuids[uuid_data64_idx], chain_eq[3]);
	vmovdqa	224(%rdx), %ymm2	# MEM[(volatile struct sabd_lookup_hashed_ab_phones_result_t *)chain_results_306 + 192B], _384
# src/sabd-enclave.c:176:           _mm256_extract_epi64(chain_result, 1) |
	orq	%r12, %rax	# tmp1043, tmp1046
# src/sabd-enclave.c:177:           _mm256_extract_epi64(chain_result, 2) |
	orq	%rcx, %rax	# tmp1044, tmp1047
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avx2intrin.h:209:   return (__m256i) __builtin_ia32_pblendvb256 ((__v32qi)__X,
	vpblendvb	%ymm6, %ymm2, %ymm1, %ymm1	# _413, _384, tmp1056, tmp1060
# /usr/lib/gcc/x86_64-linux-gnu/8/include/smmintrin.h:456:   return __builtin_ia32_vec_ext_v2di ((__v2di)__X, __N);
	vpextrq	$1, %xmm1, %rdi	# tmp1064, tmp1067
# src/sabd-enclave.c:388:       ab_phone_result.data64[0] |= sabd_lookup_hash_slot_collect_result(chain_results, chain_eq, 0);
	orq	%rax, %r11	# tmp1047, ab_phone_result$data64$0
# /usr/lib/gcc/x86_64-linux-gnu/8/include/smmintrin.h:456:   return __builtin_ia32_vec_ext_v2di ((__v2di)__X, __N);
	vmovq	%xmm1, %rax	# tmp1064, tmp1066
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avxintrin.h:524:   return (__m128i) __builtin_ia32_vextractf128_si256 ((__v8si)__X, __N);
	vextracti128	$0x1, %ymm1, %xmm1	# tmp1060, tmp1068
# /usr/lib/gcc/x86_64-linux-gnu/8/include/smmintrin.h:456:   return __builtin_ia32_vec_ext_v2di ((__v2di)__X, __N);
	vmovq	%xmm1, %r12	# tmp1068, tmp1070
# src/sabd-enclave.c:175:   return (_mm256_extract_epi64(chain_result, 0) |
	orq	%rdi, %rax	# tmp1067, tmp1072
# /usr/lib/gcc/x86_64-linux-gnu/8/include/smmintrin.h:456:   return __builtin_ia32_vec_ext_v2di ((__v2di)__X, __N);
	vpextrq	$1, %xmm1, %rcx	# tmp1068, tmp1071
# src/sabd-enclave.c:176:           _mm256_extract_epi64(chain_result, 1) |
	orq	%r12, %rax	# tmp1070, tmp1073
# src/sabd-enclave.c:177:           _mm256_extract_epi64(chain_result, 2) |
	orq	%rcx, %rax	# tmp1071, tmp1074
# src/sabd-enclave.c:389:       ab_phone_result.data64[1] |= sabd_lookup_hash_slot_collect_result(chain_results, chain_eq, 1);
	orq	%rax, %r8	# tmp1074, ab_phone_result$data64$1
	addq	$256, %rdx	#, ivtmp.123
# src/sabd-enclave.c:376:     for (hash_slot_idx_t hash_slot_idx = 0; likely(hash_slot_idx < hash_table_slot_count); hash_slot_idx++) {
	cmpq	%rsi, %r9	# ivtmp.122, _1101
	jne	.L27	#,
# src/sabd-enclave.c:392:     in_ab_phones_result[ab_phone_idx] = ab_phone_result;
	movq	%r11, (%r10)	# ab_phone_result, *_150
	movq	%r8, 8(%r10)	# ab_phone_result, *_150
	addq	$16, %r10	#, ivtmp.129
	addq	$8, %rbx	#, ivtmp.128
# src/sabd-enclave.c:369:   for (hash_slot_idx_t ab_phone_idx = 0; likely(ab_phone_idx < ab_phone_count); ab_phone_idx++) {
	cmpq	%r10, %r15	# ivtmp.129, _1057
	jne	.L28	#,
	movq	224(%rsp), %r13	# %sfp, hashed_ab_phones
	movq	208(%rsp), %r14	# %sfp, in_hashed_ab_phones_result
	movq	176(%rsp), %r11	# %sfp, ivtmp.115
.L23:
	movl	192(%rsp), %eax	# %sfp, tmp995
	leaq	256(%r14), %rdx	#, ivtmp.117
	salq	$8, %rax	#, tmp996
	leaq	512(%r14,%rax), %rcx	#, _1134
# src/sabd-enclave.c:407:     chain_blocks[0] = _mm256_setzero_si256();
	vpxor	%xmm2, %xmm2, %xmm2	# tmp1083
	.p2align 4,,10
	.p2align 3
.L26:
	leaq	-256(%rdx), %rax	#, ivtmp.110
.L29:
# src/sabd-enclave.c:402:         *chain_result = _mm256_xor_si256(_mm256_and_si256(*chain_result, chain_block_dummy_mask),
	vmovdqa	(%rax), %ymm1	# MEM[(volatile __m256i * {ref-all})_889], _890
	addq	$64, %rax	#, ivtmp.110
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avx2intrin.h:915:   return (__m256i) ((__v4du)__A ^ (__v4du)__B);
	vpandn	%ymm0, %ymm1, %ymm1	# tmp1207, _890, tmp1077
# src/sabd-enclave.c:402:         *chain_result = _mm256_xor_si256(_mm256_and_si256(*chain_result, chain_block_dummy_mask),
	vmovdqa	%ymm1, -64(%rax)	# tmp1077, MEM[(volatile __m256i * {ref-all})_889]
# src/sabd-enclave.c:402:         *chain_result = _mm256_xor_si256(_mm256_and_si256(*chain_result, chain_block_dummy_mask),
	vmovdqa	-32(%rax), %ymm1	# MEM[(volatile __m256i * {ref-all})_889], _903
# /usr/lib/gcc/x86_64-linux-gnu/8/include/avx2intrin.h:915:   return (__m256i) ((__v4du)__A ^ (__v4du)__B);
	vpandn	%ymm0, %ymm1, %ymm1	# tmp1207, _903, tmp1081
# src/sabd-enclave.c:402:         *chain_result = _mm256_xor_si256(_mm256_and_si256(*chain_result, chain_block_dummy_mask),
	vmovdqa	%ymm1, -32(%rax)	# tmp1081, MEM[(volatile __m256i * {ref-all})_889]
# src/sabd-enclave.c:399:     for (int chain_block_idx = 0; chain_block_idx < CHAIN_BLOCK_COUNT; chain_block_idx++) {
	cmpq	%rax, %rdx	# ivtmp.110, ivtmp.117
	jne	.L29	#,
	addq	$256, %rdx	#, ivtmp.117
# src/sabd-enclave.c:407:     chain_blocks[0] = _mm256_setzero_si256();
	vmovdqa	%ymm2, (%r11)	# tmp1083, *chain_blocks_315
# src/sabd-enclave.c:408:     chain_blocks[1] = _mm256_setzero_si256();
	vmovdqa	%ymm2, 32(%r11)	# tmp1083, MEM[(volatile __m256i * {ref-all})chain_blocks_315 + 32B]
# src/sabd-enclave.c:409:     chain_blocks[2] = _mm256_setzero_si256();
	vmovdqa	%ymm2, 64(%r11)	# tmp1083, MEM[(volatile __m256i * {ref-all})chain_blocks_315 + 64B]
# src/sabd-enclave.c:410:     chain_blocks[3] = _mm256_setzero_si256();
	vmovdqa	%ymm2, 96(%r11)	# tmp1083, MEM[(volatile __m256i * {ref-all})chain_blocks_315 + 96B]
	subq	$-128, %r11	#, ivtmp.115
# src/sabd-enclave.c:396:   for (hash_slot_idx_t hash_slot_idx = 0; likely(hash_slot_idx < hash_table_slot_count); hash_slot_idx++) {
	cmpq	%rdx, %rcx	# ivtmp.117, _1134
	jne	.L26	#,
# src/sabd-enclave.c:413:   free((void *) in_hashed_ab_phones_result);
	movq	%r14, %rdi	# in_hashed_ab_phones_result,
	vzeroupper
	call	free@PLT	#
# src/sabd-enclave.c:414:   free(hashed_ab_phones);
	movq	%r13, %rdi	# hashed_ab_phones,
	call	free@PLT	#
# src/sabd-enclave.c:415:   return SGX_SUCCESS;
	xorl	%eax, %eax	# <retval>
.L45:
# src/sabd-enclave.c:416: }
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
# src/sabd-enclave.c:316:       memset_s(hashed_ab_phones, hashed_ab_phones_size, 0, hashed_ab_phones_size);
	movq	96(%rsp), %rsi	# %sfp, _1213
	xorl	%edx, %edx	#
	movq	%rsi, %rcx	# _1213,
	movq	%r8, %rdi	# hashed_ab_phones,
	movq	%r8, 224(%rsp)	# hashed_ab_phones, %sfp
	vzeroupper
	call	memset_s@PLT	#
# src/sabd-enclave.c:236:   for (uint32_t hash_table_tries = 0; !hash_table_constructed && likely(hash_table_tries < 128); hash_table_tries++) {
	decl	68(%rsp)	# %sfp
	movq	224(%rsp), %r8	# %sfp, hashed_ab_phones
	jne	.L6	#,
.L47:
	movq	88(%rsp), %r14	# %sfp, in_hashed_ab_phones_result
	movq	%r8, %r13	# hashed_ab_phones, hashed_ab_phones
# src/sabd-enclave.c:325:     free((void *) in_hashed_ab_phones_result);
	movq	%r14, %rdi	# in_hashed_ab_phones_result,
	call	free@PLT	#
# src/sabd-enclave.c:326:     free(hashed_ab_phones);
	movq	%r13, %rdi	# hashed_ab_phones,
	call	free@PLT	#
# src/sabd-enclave.c:416: }
	leaq	-40(%rbp), %rsp	#,
	popq	%rbx	#
	popq	%r12	#
	popq	%r13	#
	popq	%r14	#
	popq	%r15	#
# src/sabd-enclave.c:327:     return SGX_ERROR_UNEXPECTED;
	movl	$1, %eax	#, <retval>
# src/sabd-enclave.c:416: }
	popq	%rbp	#
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret	
.L51:
	.cfi_restore_state
# src/sabd-enclave.c:264:       for (hash_slot_idx_t ab_phone_idx = 0; likely(ab_phone_idx < ab_phone_count); ab_phone_idx++) {
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
# src/sabd-enclave.c:240:     for (uint32_t hash_salt_rand_tries = 0; likely(hash_salt_rand_tries < 10); hash_salt_rand_tries++) {
	decl	%ecx	# ivtmp_1186
	jne	.L8	#,
	jmp	.L47	#
.L53:
# src/sabd-enclave.c:344:   size_t in_phone_idx = 0;
	xorl	%eax, %eax	# in_phone_idx
	vmovdqa	.LC9(%rip), %ymm0	#, tmp1207
	jmp	.L18	#
.L32:
# src/sabd-enclave.c:416: }
	leaq	-40(%rbp), %rsp	#,
	popq	%rbx	#
	popq	%r12	#
	popq	%r13	#
	popq	%r14	#
	popq	%r15	#
# src/sabd-enclave.c:198:     return SGX_ERROR_INVALID_PARAMETER;
	movl	$2, %eax	#, <retval>
# src/sabd-enclave.c:416: }
	popq	%rbp	#
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret	
.L49:
	.cfi_restore_state
# src/sabd-enclave.c:194:   if (unlikely(ab_phone_count == 0)) {
	testl	%r8d, %r8d	# ab_phone_count
	je	.L31	#,
	movq	$128, 96(%rsp)	#, %sfp
	movl	$4, %ebx	#,
	movl	$1, 64(%rsp)	#, %sfp
# src/sabd-enclave.c:191:   uint32_t hash_table_order = likely(ab_phone_count > 1)? _bit_scan_reverse(ab_phone_count - 1) + 1 : 0;
	xorl	%r12d, %r12d	# iftmp.0_105
	jmp	.L4	#
.L33:
# src/sabd-enclave.c:211:     return SGX_ERROR_OUT_OF_MEMORY;
	movl	$3, %eax	#, <retval>
	jmp	.L45	#
.L50:
# src/sabd-enclave.c:221:     free(hashed_ab_phones);
	movq	%r13, %rdi	# hashed_ab_phones,
	call	free@PLT	#
# src/sabd-enclave.c:222:     return SGX_ERROR_OUT_OF_MEMORY;
	movl	$3, %eax	#, <retval>
	jmp	.L45	#
.L54:
	movl	64(%rsp), %eax	# %sfp, _1208
	decl	%eax	# tmp1203
	movl	%eax, 192(%rsp)	# tmp1203, %sfp
	jmp	.L23	#
.L31:
# src/sabd-enclave.c:195:     return SGX_SUCCESS;
	xorl	%eax, %eax	# <retval>
	jmp	.L45	#
	.cfi_endproc
.LFE5440:
	.size	sabd_lookup_hash, .-sabd_lookup_hash
	.p2align 4,,15
	.globl	sgxsd_enclave_server_init
	.hidden	sgxsd_enclave_server_init
	.type	sgxsd_enclave_server_init, @function
sgxsd_enclave_server_init:
.LFB5441:
	.cfi_startproc
# src/sabd-enclave.c:436:   if (p_args == NULL) {
	testq	%rdi, %rdi	# p_args
	je	.L57	#,
# src/sabd-enclave.c:435: sgx_status_t sgxsd_enclave_server_init(const sabd_start_args_t *p_args, sabd_state_t **pp_state) {
	pushq	%r13	#
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	movq	%rsi, %r13	# pp_state, pp_state
	pushq	%r12	#
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp	#
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx	#
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rdi, %rbx	# p_args, p_args
	subq	$8, %rsp	#,
	.cfi_def_cfa_offset 48
# src/sabd-enclave.c:441:   size_t state_size = sizeof(sabd_state_t) + sizeof(phone_t) * p_args->max_ab_phones;
	movl	(%rdi), %eax	# p_args_7(D)->max_ab_phones, p_args_7(D)->max_ab_phones
# src/sabd-enclave.c:442:   sabd_state_t *p_state = memalign(CACHE_LINE_SIZE, state_size);
	movl	$64, %edi	#,
# src/sabd-enclave.c:441:   size_t state_size = sizeof(sabd_state_t) + sizeof(phone_t) * p_args->max_ab_phones;
	leaq	64(,%rax,8), %r12	#, state_size
# src/sabd-enclave.c:442:   sabd_state_t *p_state = memalign(CACHE_LINE_SIZE, state_size);
	movq	%r12, %rsi	# state_size,
	call	memalign@PLT	#
	movq	%rax, %rbp	#, p_state
# src/sabd-enclave.c:443:   if (p_state == NULL) {
	testq	%rax, %rax	# p_state
	je	.L58	#,
# src/sabd-enclave.c:446:   memset_s(p_state, state_size, 0, state_size);
	movq	%r12, %rcx	# state_size,
	movq	%r12, %rsi	# state_size,
	xorl	%edx, %edx	#
	movq	%rax, %rdi	# p_state,
	call	memset_s@PLT	#
# src/sabd-enclave.c:450:     .max_ab_phones = p_args->max_ab_phones,
	movl	(%rbx), %eax	# p_args_7(D)->max_ab_phones, _4
# src/sabd-enclave.c:447:   *p_state = (sabd_state_t) {
	movq	$0, 0(%rbp)	#, p_state_11->msgs
	movl	%eax, 12(%rbp)	# _4, p_state_11->max_ab_phones
	movl	$0, 8(%rbp)	#, p_state_11->ab_phone_count
# src/sabd-enclave.c:452:   *pp_state = p_state;
	movq	%rbp, 0(%r13)	# p_state, *pp_state_16(D)
# src/sabd-enclave.c:454: }
	addq	$8, %rsp	#,
	.cfi_def_cfa_offset 40
# src/sabd-enclave.c:453:   return SGX_SUCCESS;
	xorl	%eax, %eax	# <retval>
# src/sabd-enclave.c:454: }
	popq	%rbx	#
	.cfi_def_cfa_offset 32
	popq	%rbp	#
	.cfi_def_cfa_offset 24
	popq	%r12	#
	.cfi_def_cfa_offset 16
	popq	%r13	#
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L57:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
# src/sabd-enclave.c:437:     return SGX_ERROR_INVALID_PARAMETER;
	movl	$2, %eax	#, <retval>
# src/sabd-enclave.c:454: }
	ret	
	.p2align 4,,10
	.p2align 3
.L58:
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -40
	.cfi_offset 6, -32
	.cfi_offset 12, -24
	.cfi_offset 13, -16
	addq	$8, %rsp	#,
	.cfi_def_cfa_offset 40
	popq	%rbx	#
	.cfi_def_cfa_offset 32
	popq	%rbp	#
	.cfi_def_cfa_offset 24
	popq	%r12	#
	.cfi_def_cfa_offset 16
# src/sabd-enclave.c:444:     return SGX_ERROR_OUT_OF_MEMORY;
	movl	$3, %eax	#, <retval>
# src/sabd-enclave.c:454: }
	popq	%r13	#
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE5441:
	.size	sgxsd_enclave_server_init, .-sgxsd_enclave_server_init
	.p2align 4,,15
	.globl	sgxsd_enclave_server_handle_call
	.hidden	sgxsd_enclave_server_handle_call
	.type	sgxsd_enclave_server_handle_call, @function
sgxsd_enclave_server_handle_call:
.LFB5442:
	.cfi_startproc
	pushq	%r15	#
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14	#
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13	#
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12	#
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp	#
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx	#
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$8, %rsp	#,
	.cfi_def_cfa_offset 64
# src/sabd-enclave.c:458:   sabd_state_t *p_state = *pp_state;
	movq	(%rcx), %rbx	# *pp_state_19(D), p_state
# src/sabd-enclave.c:459:   if (p_state == NULL) {
	testq	%rbx, %rbx	# p_state
	je	.L66	#,
# src/sabd-enclave.c:462:   if (p_args == NULL) {
	testq	%rdi, %rdi	# p_args
	je	.L71	#,
# src/sabd-enclave.c:465:   if (p_args->ab_phone_count == 0 ||
	movl	(%rdi), %eax	# p_args_21(D)->ab_phone_count, _1
# src/sabd-enclave.c:463:     return SGX_ERROR_INVALID_PARAMETER;
	movl	$2, %r12d	#, <retval>
# src/sabd-enclave.c:465:   if (p_args->ab_phone_count == 0 ||
	testl	%eax, %eax	# _1
	je	.L74	#,
# src/sabd-enclave.c:466:       p_args->ab_phone_count > p_state->max_ab_phones - p_state->ab_phone_count ||
	movl	12(%rbx), %ecx	# p_state_20->max_ab_phones, p_state_20->max_ab_phones
	subl	8(%rbx), %ecx	# p_state_20->ab_phone_count, tmp114
# src/sabd-enclave.c:465:   if (p_args->ab_phone_count == 0 ||
	cmpl	%ecx, %eax	# tmp114, _1
	ja	.L74	#,
# src/sabd-enclave.c:466:       p_args->ab_phone_count > p_state->max_ab_phones - p_state->ab_phone_count ||
	movl	%edx, %r12d	# msg, <retval>
	andl	$7, %r12d	#, <retval>
	jne	.L71	#,
# src/sabd-enclave.c:468:       msg.size / 8 != p_args->ab_phone_count) {
	movl	%edx, %ecx	# msg, tmp116
	shrl	$3, %ecx	#, tmp116
# src/sabd-enclave.c:467:       msg.size % 8 != 0 ||
	cmpl	%ecx, %eax	# tmp116, _1
	je	.L76	#,
.L71:
# src/sabd-enclave.c:463:     return SGX_ERROR_INVALID_PARAMETER;
	movl	$2, %r12d	#, <retval>
.L74:
# src/sabd-enclave.c:489: }
	addq	$8, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx	#
	.cfi_def_cfa_offset 48
	popq	%rbp	#
	.cfi_def_cfa_offset 40
	movl	%r12d, %eax	# <retval>,
	popq	%r12	#
	.cfi_def_cfa_offset 32
	popq	%r13	#
	.cfi_def_cfa_offset 24
	popq	%r14	#
	.cfi_def_cfa_offset 16
	popq	%r15	#
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L76:
	.cfi_restore_state
# src/sabd-enclave.c:471:   sgx_lfence();
	lfence	
	movq	%rdi, %rbp	# p_args, p_args
# src/sabd-enclave.c:473:   sabd_msg_t *p_sabd_msg = malloc(sizeof(sabd_msg_t));
	movl	$56, %edi	#,
	movq	%rdx, %r13	# msg, msg
	movq	%rsi, %r15	# msg, msg
	call	malloc@PLT	#
	movq	%rax, %r14	#, p_sabd_msg
# src/sabd-enclave.c:474:   if (p_sabd_msg == NULL) {
	testq	%rax, %rax	# p_sabd_msg
	je	.L72	#,
# src/sabd-enclave.c:480:     .ab_phone_count = p_args->ab_phone_count,
	movl	0(%rbp), %edx	# p_args_21(D)->ab_phone_count, _7
# src/sabd-enclave.c:479:     .prev = p_state->msgs,
	movq	(%rbx), %rax	# p_state_20->msgs, _8
# src/sabd-enclave.c:477:   *p_sabd_msg = (sabd_msg_t) {
	vmovdqu	80(%rsp), %xmm1	# from, tmp137
	movq	96(%rsp), %rcx	# from, from
	vmovdqu	64(%rsp), %xmm0	# from, tmp136
	movl	%edx, 40(%r14)	# _7, p_sabd_msg_24->ab_phone_count
	movq	%rcx, 32(%r14)	# from, p_sabd_msg_24->from
	movq	%rax, 48(%r14)	# _8, p_sabd_msg_24->prev
	vmovups	%xmm0, (%r14)	# tmp136, p_sabd_msg_24->from
	vmovups	%xmm1, 16(%r14)	# tmp137, p_sabd_msg_24->from
# src/sabd-enclave.c:483:   memcpy(&p_state->ab_phones[p_state->ab_phone_count], msg.data, msg.size);
	movl	8(%rbx), %eax	# p_state_20->ab_phone_count, p_state_20->ab_phone_count
# src/sabd-enclave.c:482:   p_state->msgs = p_sabd_msg;
	movq	%r14, (%rbx)	# p_sabd_msg, p_state_20->msgs
# src/sabd-enclave.c:483:   memcpy(&p_state->ab_phones[p_state->ab_phone_count], msg.data, msg.size);
	movl	%r13d, %edx	# msg, msg$size
# src/sabd-enclave.c:483:   memcpy(&p_state->ab_phones[p_state->ab_phone_count], msg.data, msg.size);
	leaq	64(%rbx,%rax,8), %rdi	#, tmp124
# src/sabd-enclave.c:483:   memcpy(&p_state->ab_phones[p_state->ab_phone_count], msg.data, msg.size);
	movq	%r15, %rsi	# msg,
	call	memcpy@PLT	#
# src/sabd-enclave.c:484:   p_state->ab_phone_count += p_sabd_msg->ab_phone_count;
	movl	40(%r14), %eax	# p_sabd_msg_24->ab_phone_count, p_sabd_msg_24->ab_phone_count
# src/sabd-enclave.c:486:   memset_s(&from, sizeof(from), 0, sizeof(from));
	movl	$40, %ecx	#,
# src/sabd-enclave.c:484:   p_state->ab_phone_count += p_sabd_msg->ab_phone_count;
	addl	%eax, 8(%rbx)	# p_sabd_msg_24->ab_phone_count, p_state_20->ab_phone_count
# src/sabd-enclave.c:486:   memset_s(&from, sizeof(from), 0, sizeof(from));
	xorl	%edx, %edx	#
	movl	$40, %esi	#,
	leaq	64(%rsp), %rdi	#,
	call	memset_s@PLT	#
# src/sabd-enclave.c:488:   return SGX_SUCCESS;
	jmp	.L74	#
	.p2align 4,,10
	.p2align 3
.L66:
# src/sabd-enclave.c:460:     return SGX_ERROR_INVALID_STATE;
	movl	$5, %r12d	#, <retval>
	jmp	.L74	#
	.p2align 4,,10
	.p2align 3
.L72:
# src/sabd-enclave.c:475:     return SGX_ERROR_OUT_OF_MEMORY;
	movl	$3, %r12d	#, <retval>
	jmp	.L74	#
	.cfi_endproc
.LFE5442:
	.size	sgxsd_enclave_server_handle_call, .-sgxsd_enclave_server_handle_call
	.p2align 4,,15
	.globl	sgxsd_enclave_server_terminate
	.hidden	sgxsd_enclave_server_terminate
	.type	sgxsd_enclave_server_terminate, @function
sgxsd_enclave_server_terminate:
.LFB5443:
	.cfi_startproc
	pushq	%r15	#
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14	#
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13	#
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12	#
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp	#
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx	#
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$56, %rsp	#,
	.cfi_def_cfa_offset 112
# src/sabd-enclave.c:491:   if (p_state == NULL) {
	testq	%rsi, %rsi	# p_state
	je	.L95	#,
	movq	%rsi, %rbx	# p_state, p_state
	movq	%rdi, %r12	# p_args, p_args
# src/sabd-enclave.c:497:   if (p_args == NULL) {
	testq	%rdi, %rdi	# p_args
	je	.L79	#,
# src/sabd-enclave.c:501:     size_t in_phones_size = p_args->in_phone_count * sizeof(p_args->in_phones[0]);
	movq	8(%rdi), %r13	# p_args_42(D)->in_phone_count, _1
# src/sabd-enclave.c:503:     if (p_args->in_phone_count > SIZE_MAX / sizeof(p_args->in_phones[0]) ||
	movabsq	$1152921504606846975, %rax	#, tmp133
	cmpq	%rax, %r13	# tmp133, _1
	jbe	.L104	#,
.L79:
# src/sabd-enclave.c:516:   if (p_state->ab_phone_count != 0) {
	movl	8(%rbx), %edi	# p_state_40(D)->ab_phone_count,
# src/sabd-enclave.c:516:   if (p_state->ab_phone_count != 0) {
	testl	%edi, %edi	# _7
	jne	.L83	#,
.L92:
# src/sabd-enclave.c:564:       return SGX_ERROR_UNEXPECTED;
	movl	$2, %ebp	#, <retval>
.L82:
# src/sabd-enclave.c:559:   size_t state_size = sizeof(sabd_state_t) + sizeof(phone_t) * p_state->max_ab_phones;
	movl	12(%rbx), %eax	# p_state_40(D)->max_ab_phones, p_state_40(D)->max_ab_phones
# src/sabd-enclave.c:560:   memset_s(p_state, state_size, 0, state_size);
	movq	%rbx, %rdi	# p_state,
# src/sabd-enclave.c:559:   size_t state_size = sizeof(sabd_state_t) + sizeof(phone_t) * p_state->max_ab_phones;
	leaq	64(,%rax,8), %rsi	#, state_size
# src/sabd-enclave.c:560:   memset_s(p_state, state_size, 0, state_size);
	movq	%rsi, %rcx	# state_size,
	xorl	%edx, %edx	#
	call	memset_s@PLT	#
# src/sabd-enclave.c:561:   free(p_state);
	movq	%rbx, %rdi	# p_state,
	call	free@PLT	#
.L102:
# src/sabd-enclave.c:570: }
	addq	$56, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx	#
	.cfi_def_cfa_offset 48
	movl	%ebp, %eax	# <retval>,
	popq	%rbp	#
	.cfi_def_cfa_offset 40
	popq	%r12	#
	.cfi_def_cfa_offset 32
	popq	%r13	#
	.cfi_def_cfa_offset 24
	popq	%r14	#
	.cfi_def_cfa_offset 16
	popq	%r15	#
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L83:
	.cfi_restore_state
# src/sabd-enclave.c:517:     uuid_t *in_ab_phones_result = malloc(p_state->ab_phone_count * sizeof(uuid_t));
	salq	$4, %rdi	#, tmp138
	call	malloc@PLT	#
	movq	%rax, %r15	#, in_ab_phones_result
	movl	$2, %ebp	#, <retval>
.L84:
# src/sabd-enclave.c:533:     hash_slot_idx_t ab_phone_idx = p_state->ab_phone_count;
	movl	8(%rbx), %eax	# p_state_40(D)->ab_phone_count, ab_phone_idx
# src/sabd-enclave.c:534:     for (sabd_msg_t *p_msg = p_state->msgs; p_msg != NULL;) {
	movq	(%rbx), %r14	# p_state_40(D)->msgs, p_msg
# src/sabd-enclave.c:533:     hash_slot_idx_t ab_phone_idx = p_state->ab_phone_count;
	movl	%eax, 28(%rsp)	# ab_phone_idx, %sfp
# src/sabd-enclave.c:534:     for (sabd_msg_t *p_msg = p_state->msgs; p_msg != NULL;) {
	testq	%r14, %r14	# p_msg
	je	.L85	#,
# src/sabd-enclave.c:515:   sgx_status_t replies_res = SGX_SUCCESS;
	xorl	%r13d, %r13d	# replies_res
	jmp	.L88	#
	.p2align 4,,10
	.p2align 3
.L86:
# src/sabd-enclave.c:549:       memset_s(p_msg, sizeof(*p_msg), 0, sizeof(*p_msg));
	movq	%r14, %rdi	# p_msg,
# src/sabd-enclave.c:548:       sabd_msg_t *p_prev_msg = p_msg->prev;
	movq	48(%r14), %r12	# p_msg_47->prev, p_prev_msg
# src/sabd-enclave.c:549:       memset_s(p_msg, sizeof(*p_msg), 0, sizeof(*p_msg));
	movl	$56, %ecx	#,
	xorl	%edx, %edx	#
	movl	$56, %esi	#,
	call	memset_s@PLT	#
# src/sabd-enclave.c:550:       free(p_msg);
	movq	%r14, %rdi	# p_msg,
	call	free@PLT	#
	movq	%r12, %r14	# p_prev_msg, p_msg
# src/sabd-enclave.c:534:     for (sabd_msg_t *p_msg = p_state->msgs; p_msg != NULL;) {
	testq	%r12, %r12	# p_msg
	je	.L105	#,
.L88:
# src/sabd-enclave.c:535:       if (lookup_res == SGX_SUCCESS) {
	testl	%ebp, %ebp	# <retval>
	jne	.L86	#,
# src/sabd-enclave.c:536:         ab_phone_idx -= p_msg->ab_phone_count;
	movl	40(%r14), %eax	# p_msg_47->ab_phone_count, _14
# src/sabd-enclave.c:536:         ab_phone_idx -= p_msg->ab_phone_count;
	subl	%eax, 28(%rsp)	# _14, %sfp
# src/sabd-enclave.c:539:           .size = ((size_t) p_msg->ab_phone_count) * sizeof(in_ab_phones_result[0]),
	sall	$4, %eax	#, tmp145
# src/sabd-enclave.c:542:         sgx_status_t reply_res = sgxsd_enclave_server_reply(reply_buf, p_msg->from);
	subq	$8, %rsp	#,
	.cfi_def_cfa_offset 120
# src/sabd-enclave.c:536:         ab_phone_idx -= p_msg->ab_phone_count;
	movl	36(%rsp), %edx	# %sfp,
# src/sabd-enclave.c:538:           .data = (uint8_t *) &in_ab_phones_result[ab_phone_idx],
	salq	$4, %rdx	#, tmp143
# src/sabd-enclave.c:537:         sgxsd_msg_buf_t reply_buf = {
	addq	%r15, %rdx	# in_ab_phones_result, tmp172
	movq	%rdx, 40(%rsp)	# tmp172, %sfp
	vmovdqa	40(%rsp), %xmm1	# %sfp, tmp174
	vpinsrd	$2, %eax, %xmm1, %xmm0	#, tmp145, tmp174, tmp146
	vmovaps	%xmm0, 8(%rsp)	# tmp146, %sfp
	vmovdqa	8(%rsp), %xmm2	# %sfp, tmp175
# src/sabd-enclave.c:542:         sgx_status_t reply_res = sgxsd_enclave_server_reply(reply_buf, p_msg->from);
	movq	16(%rsp), %rsi	# %sfp, tmp165
# src/sabd-enclave.c:537:         sgxsd_msg_buf_t reply_buf = {
	vmovaps	%xmm2, 40(%rsp)	# tmp175, %sfp
# src/sabd-enclave.c:542:         sgx_status_t reply_res = sgxsd_enclave_server_reply(reply_buf, p_msg->from);
	pushq	32(%r14)	# p_msg_47->from
	.cfi_def_cfa_offset 128
	pushq	24(%r14)	# p_msg_47->from
	.cfi_def_cfa_offset 136
	pushq	16(%r14)	# p_msg_47->from
	.cfi_def_cfa_offset 144
	pushq	8(%r14)	# p_msg_47->from
	.cfi_def_cfa_offset 152
	pushq	(%r14)	# p_msg_47->from
	.cfi_def_cfa_offset 160
	movq	48(%rsp), %rdi	# %sfp,
	call	sgxsd_enclave_server_reply@PLT	#
# src/sabd-enclave.c:543:         if (replies_res == SGX_SUCCESS) {
	addq	$48, %rsp	#,
	.cfi_def_cfa_offset 112
# src/sabd-enclave.c:544:           replies_res = reply_res;
	testl	%r13d, %r13d	# replies_res
	cmove	%eax, %r13d	# replies_res,, reply_res, replies_res
	jmp	.L86	#
	.p2align 4,,10
	.p2align 3
.L104:
# src/sabd-enclave.c:505:         sgx_is_outside_enclave(p_args->in_phones, in_phones_size) != 1 ||
	movq	(%rdi), %rdi	# p_args_42(D)->in_phones,
# src/sabd-enclave.c:501:     size_t in_phones_size = p_args->in_phone_count * sizeof(p_args->in_phones[0]);
	leaq	0(,%r13,8), %rsi	#, in_phones_size
# src/sabd-enclave.c:505:         sgx_is_outside_enclave(p_args->in_phones, in_phones_size) != 1 ||
	call	sgx_is_outside_enclave@PLT	#
# src/sabd-enclave.c:504:         p_args->in_phone_count > SIZE_MAX / sizeof(p_args->in_uuids[0]) ||
	cmpl	$1, %eax	#, _4
	je	.L106	#,
.L80:
# src/sabd-enclave.c:516:   if (p_state->ab_phone_count != 0) {
	movl	8(%rbx), %eax	# p_state_40(D)->ab_phone_count,
# src/sabd-enclave.c:516:   if (p_state->ab_phone_count != 0) {
	testl	%eax, %eax	# _112
	je	.L92	#,
# src/sabd-enclave.c:517:     uuid_t *in_ab_phones_result = malloc(p_state->ab_phone_count * sizeof(uuid_t));
	salq	$4, %rax	#, _112
	movq	%rax, %rdi	# _112, tmp159
	call	malloc@PLT	#
	movq	%rax, %r15	#, in_ab_phones_result
	movl	$2, %ebp	#, <retval>
	jmp	.L84	#
	.p2align 4,,10
	.p2align 3
.L105:
# src/sabd-enclave.c:554:     free(in_ab_phones_result);
	movq	%r15, %rdi	# in_ab_phones_result,
	call	free@PLT	#
# src/sabd-enclave.c:559:   size_t state_size = sizeof(sabd_state_t) + sizeof(phone_t) * p_state->max_ab_phones;
	movl	12(%rbx), %eax	# p_state_40(D)->max_ab_phones, p_state_40(D)->max_ab_phones
# src/sabd-enclave.c:560:   memset_s(p_state, state_size, 0, state_size);
	xorl	%edx, %edx	#
# src/sabd-enclave.c:559:   size_t state_size = sizeof(sabd_state_t) + sizeof(phone_t) * p_state->max_ab_phones;
	leaq	64(,%rax,8), %rsi	#, state_size
# src/sabd-enclave.c:560:   memset_s(p_state, state_size, 0, state_size);
	movq	%rbx, %rdi	# p_state,
	movq	%rsi, %rcx	# state_size,
	call	memset_s@PLT	#
# src/sabd-enclave.c:561:   free(p_state);
	movq	%rbx, %rdi	# p_state,
	call	free@PLT	#
# src/sabd-enclave.c:562:   if (lookup_res == SGX_SUCCESS) {
	testl	%ebp, %ebp	# <retval>
	jne	.L102	#,
# src/sabd-enclave.c:563:     if (replies_res == SGX_ERROR_INVALID_PARAMETER) {
	cmpl	$2, %r13d	#, replies_res
	jne	.L93	#,
# src/sabd-enclave.c:564:       return SGX_ERROR_UNEXPECTED;
	movl	$1, %ebp	#, <retval>
	jmp	.L102	#
	.p2align 4,,10
	.p2align 3
.L95:
# src/sabd-enclave.c:492:     return SGX_ERROR_INVALID_STATE;
	movl	$5, %ebp	#, <retval>
	jmp	.L102	#
	.p2align 4,,10
	.p2align 3
.L106:
# src/sabd-enclave.c:502:     size_t in_uuids_size = p_args->in_phone_count * sizeof(p_args->in_uuids[0]);
	movq	%r13, %rsi	# _1, in_uuids_size
# src/sabd-enclave.c:506:         sgx_is_outside_enclave(p_args->in_uuids, in_uuids_size) != 1) {
	movq	16(%r12), %rdi	# p_args_42(D)->in_uuids, p_args_42(D)->in_uuids
# src/sabd-enclave.c:502:     size_t in_uuids_size = p_args->in_phone_count * sizeof(p_args->in_uuids[0]);
	salq	$4, %rsi	#, in_uuids_size
# src/sabd-enclave.c:506:         sgx_is_outside_enclave(p_args->in_uuids, in_uuids_size) != 1) {
	call	sgx_is_outside_enclave@PLT	#
# src/sabd-enclave.c:505:         sgx_is_outside_enclave(p_args->in_phones, in_phones_size) != 1 ||
	cmpl	$1, %eax	#, _6
	jne	.L80	#,
# src/sabd-enclave.c:516:   if (p_state->ab_phone_count != 0) {
	movl	8(%rbx), %ebp	# p_state_40(D)->ab_phone_count, <retval>
# src/sabd-enclave.c:516:   if (p_state->ab_phone_count != 0) {
	testl	%ebp, %ebp	# <retval>
	je	.L82	#,
# src/sabd-enclave.c:517:     uuid_t *in_ab_phones_result = malloc(p_state->ab_phone_count * sizeof(uuid_t));
	movl	%ebp, %edi	# <retval>, <retval>
# src/sabd-enclave.c:517:     uuid_t *in_ab_phones_result = malloc(p_state->ab_phone_count * sizeof(uuid_t));
	salq	$4, %rdi	#, tmp157
	call	malloc@PLT	#
	movq	%rax, %r15	#, in_ab_phones_result
# src/sabd-enclave.c:530:       lookup_res = SGX_ERROR_OUT_OF_MEMORY;
	movl	$3, %ebp	#, <retval>
# src/sabd-enclave.c:522:     } else if (in_ab_phones_result != NULL) {
	testq	%rax, %rax	# in_ab_phones_result
	je	.L84	#,
# src/sabd-enclave.c:524:       sgx_lfence();
	lfence	
# src/sabd-enclave.c:527:                                     p_state->ab_phones, p_state->ab_phone_count,
	leaq	64(%rbx), %rcx	#, tmp140
# src/sabd-enclave.c:526:       lookup_res = sabd_lookup_hash(p_args->in_phones, p_args->in_uuids, validated_in_phone_count,
	movq	16(%r12), %rsi	# p_args_42(D)->in_uuids, p_args_42(D)->in_uuids
	movl	8(%rbx), %r8d	# p_state_40(D)->ab_phone_count,
	movq	(%r12), %rdi	# p_args_42(D)->in_phones,
	movq	%r15, %r9	# in_ab_phones_result,
	movq	%r13, %rdx	# _1,
	call	sabd_lookup_hash	#
	movl	%eax, %ebp	#, <retval>
	jmp	.L84	#
	.p2align 4,,10
	.p2align 3
.L85:
# src/sabd-enclave.c:554:     free(in_ab_phones_result);
	movq	%r15, %rdi	# in_ab_phones_result,
	call	free@PLT	#
# src/sabd-enclave.c:559:   size_t state_size = sizeof(sabd_state_t) + sizeof(phone_t) * p_state->max_ab_phones;
	movl	12(%rbx), %eax	# p_state_40(D)->max_ab_phones, p_state_40(D)->max_ab_phones
# src/sabd-enclave.c:560:   memset_s(p_state, state_size, 0, state_size);
	xorl	%edx, %edx	#
# src/sabd-enclave.c:559:   size_t state_size = sizeof(sabd_state_t) + sizeof(phone_t) * p_state->max_ab_phones;
	leaq	64(,%rax,8), %rsi	#, state_size
# src/sabd-enclave.c:560:   memset_s(p_state, state_size, 0, state_size);
	movq	%rbx, %rdi	# p_state,
	movq	%rsi, %rcx	# state_size,
	call	memset_s@PLT	#
# src/sabd-enclave.c:561:   free(p_state);
	movq	%rbx, %rdi	# p_state,
	call	free@PLT	#
# src/sabd-enclave.c:562:   if (lookup_res == SGX_SUCCESS) {
	testl	%ebp, %ebp	# <retval>
	jne	.L102	#,
# src/sabd-enclave.c:515:   sgx_status_t replies_res = SGX_SUCCESS;
	xorl	%r13d, %r13d	# replies_res
.L93:
	movl	%r13d, %ebp	# replies_res, <retval>
	jmp	.L102	#
	.cfi_endproc
.LFE5443:
	.size	sgxsd_enclave_server_terminate, .-sgxsd_enclave_server_terminate
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

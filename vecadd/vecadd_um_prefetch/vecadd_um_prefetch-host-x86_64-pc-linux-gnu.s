	.text
	.file	"vecadd_um_prefetch.cu"
	.globl	_Z21__device_stub__vecAddPdS_S_i # -- Begin function _Z21__device_stub__vecAddPdS_S_i
	.p2align	4, 0x90
	.type	_Z21__device_stub__vecAddPdS_S_i,@function
_Z21__device_stub__vecAddPdS_S_i:       # @_Z21__device_stub__vecAddPdS_S_i
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$160, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movl	%ecx, -28(%rbp)
	leaq	-8(%rbp), %rax
	movq	%rax, -144(%rbp)
	leaq	-16(%rbp), %rax
	movq	%rax, -136(%rbp)
	leaq	-24(%rbp), %rax
	movq	%rax, -128(%rbp)
	leaq	-28(%rbp), %rax
	movq	%rax, -120(%rbp)
	leaq	-40(%rbp), %rdi
	leaq	-56(%rbp), %rsi
	leaq	-64(%rbp), %rdx
	leaq	-72(%rbp), %rcx
	callq	__cudaPopCallConfiguration@PLT
	movq	-64(%rbp), %r10
	movq	-72(%rbp), %rax
	movq	-40(%rbp), %rcx
	movq	%rcx, -88(%rbp)
	movl	-32(%rbp), %ecx
	movl	%ecx, -80(%rbp)
	movq	-88(%rbp), %rsi
	movl	-80(%rbp), %edx
	movq	-56(%rbp), %rcx
	movq	%rcx, -104(%rbp)
	movl	-48(%rbp), %ecx
	movl	%ecx, -96(%rbp)
	movq	-104(%rbp), %rcx
	movl	-96(%rbp), %r8d
	leaq	_Z21__device_stub__vecAddPdS_S_i(%rip), %rdi
	leaq	-144(%rbp), %r9
	movq	%r10, (%rsp)
	movq	%rax, 8(%rsp)
	callq	cudaLaunchKernel@PLT
# %bb.1:
	addq	$160, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	_Z21__device_stub__vecAddPdS_S_i, .Lfunc_end0-_Z21__device_stub__vecAddPdS_S_i
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               # -- Begin function main
.LCPI1_0:
	.quad	0x3eb0c6f7a0b5ed8d              # double 9.9999999999999995E-7
.LCPI1_1:
	.quad	0x3ff0000000000000              # double 1
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$176, %rsp
	movl	$0, -4(%rbp)
	movl	%edi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	$65536, -20(%rbp)               # imm = 0x10000
	cmpl	$1, -8(%rbp)
	jne	.LBB1_2
# %bb.1:
	movq	-16(%rbp), %rax
	movq	(%rax), %rsi
	leaq	.L.str(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
	movl	-20(%rbp), %esi
	leaq	.L.str.1(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
	jmp	.LBB1_8
.LBB1_2:
	cmpl	$2, -8(%rbp)
	jne	.LBB1_6
# %bb.3:
	movq	-16(%rbp), %rax
	movq	8(%rax), %rdi
	callq	atoi@PLT
	movl	%eax, -20(%rbp)
	cmpl	$0, -20(%rbp)
	jg	.LBB1_5
# %bb.4:
	leaq	.L.str.2(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
	movl	$1, -4(%rbp)
	jmp	.LBB1_22
.LBB1_5:
	movl	-20(%rbp), %esi
	leaq	.L.str.3(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
	jmp	.LBB1_7
.LBB1_6:
	leaq	.L.str.4(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
	movq	-16(%rbp), %rax
	movq	(%rax), %rsi
	leaq	.L.str(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
	movl	$1, -4(%rbp)
	jmp	.LBB1_22
.LBB1_7:
	jmp	.LBB1_8
.LBB1_8:
	movslq	-20(%rbp), %rax
	shlq	$3, %rax
	movq	%rax, -56(%rbp)
	movq	-56(%rbp), %rsi
	leaq	-32(%rbp), %rdi
	movl	$1, %edx
	callq	_ZL17cudaMallocManagedIdE9cudaErrorPPT_mj
	movq	-56(%rbp), %rsi
	leaq	-40(%rbp), %rdi
	movl	$1, %edx
	callq	_ZL17cudaMallocManagedIdE9cudaErrorPPT_mj
	movq	-56(%rbp), %rsi
	leaq	-48(%rbp), %rdi
	movl	$1, %edx
	callq	_ZL17cudaMallocManagedIdE9cudaErrorPPT_mj
	leaq	-60(%rbp), %rdi
	callq	cudaGetDevice@PLT
	movq	-32(%rbp), %rdi
	movq	-56(%rbp), %rsi
	movl	$3, %edx
	movl	$4294967295, %ecx               # imm = 0xFFFFFFFF
	callq	cudaMemAdvise@PLT
	movq	-40(%rbp), %rdi
	movq	-56(%rbp), %rsi
	movl	$3, %edx
	movl	$4294967295, %ecx               # imm = 0xFFFFFFFF
	callq	cudaMemAdvise@PLT
	movq	-48(%rbp), %rdi
	movq	-56(%rbp), %rsi
	movl	-60(%rbp), %edx
	xorl	%eax, %eax
	movl	%eax, %ecx
	callq	cudaMemPrefetchAsync@PLT
	movl	$0, -64(%rbp)
.LBB1_9:                                # =>This Inner Loop Header: Depth=1
	movl	-64(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jge	.LBB1_12
# %bb.10:                               #   in Loop: Header=BB1_9 Depth=1
	movl	-64(%rbp), %edi
	callq	_ZSt3sinIiEN9__gnu_cxx11__enable_ifIXsr12__is_integerIT_EE7__valueEdE6__typeES2_
	movsd	%xmm0, -168(%rbp)               # 8-byte Spill
	movl	-64(%rbp), %edi
	callq	_ZSt3sinIiEN9__gnu_cxx11__enable_ifIXsr12__is_integerIT_EE7__valueEdE6__typeES2_
	movaps	%xmm0, %xmm1
	movsd	-168(%rbp), %xmm0               # 8-byte Reload
                                        # xmm0 = mem[0],zero
	mulsd	%xmm1, %xmm0
	movq	-32(%rbp), %rax
	movslq	-64(%rbp), %rcx
	movsd	%xmm0, (%rax,%rcx,8)
	movl	-64(%rbp), %edi
	callq	_ZSt3cosIiEN9__gnu_cxx11__enable_ifIXsr12__is_integerIT_EE7__valueEdE6__typeES2_
	movsd	%xmm0, -160(%rbp)               # 8-byte Spill
	movl	-64(%rbp), %edi
	callq	_ZSt3cosIiEN9__gnu_cxx11__enable_ifIXsr12__is_integerIT_EE7__valueEdE6__typeES2_
	movaps	%xmm0, %xmm1
	movsd	-160(%rbp), %xmm0               # 8-byte Reload
                                        # xmm0 = mem[0],zero
	mulsd	%xmm1, %xmm0
	movq	-40(%rbp), %rax
	movslq	-64(%rbp), %rcx
	movsd	%xmm0, (%rax,%rcx,8)
# %bb.11:                               #   in Loop: Header=BB1_9 Depth=1
	movl	-64(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -64(%rbp)
	jmp	.LBB1_9
.LBB1_12:
	movq	-32(%rbp), %rdi
	movq	-56(%rbp), %rsi
	movl	-60(%rbp), %ecx
	movl	$1, %edx
	callq	cudaMemAdvise@PLT
	movq	-40(%rbp), %rdi
	movq	-56(%rbp), %rsi
	movl	-60(%rbp), %ecx
	movl	$1, %edx
	callq	cudaMemAdvise@PLT
	movq	-32(%rbp), %rdi
	movq	-56(%rbp), %rsi
	movl	-60(%rbp), %edx
	xorl	%eax, %eax
	movl	%eax, %ecx
	callq	cudaMemPrefetchAsync@PLT
	movq	-40(%rbp), %rdi
	movq	-56(%rbp), %rsi
	movl	-60(%rbp), %edx
	xorl	%eax, %eax
	movl	%eax, %ecx
	callq	cudaMemPrefetchAsync@PLT
	movl	$1024, -68(%rbp)                # imm = 0x400
	movl	-20(%rbp), %eax
	addl	-68(%rbp), %eax
	subl	$1, %eax
	cltd
	idivl	-68(%rbp)
	movl	%eax, -72(%rbp)
	movl	-72(%rbp), %esi
	leaq	-88(%rbp), %rdi
	movl	$1, %ecx
	movl	%ecx, %edx
	callq	_ZN4dim3C2Ejjj
	movl	-68(%rbp), %esi
	leaq	-104(%rbp), %rdi
	movl	$1, %ecx
	movl	%ecx, %edx
	callq	_ZN4dim3C2Ejjj
	movq	-88(%rbp), %rax
	movq	%rax, -120(%rbp)
	movl	-80(%rbp), %eax
	movl	%eax, -112(%rbp)
	movq	-120(%rbp), %rdi
	movl	-112(%rbp), %esi
	movq	-104(%rbp), %rax
	movq	%rax, -136(%rbp)
	movl	-96(%rbp), %eax
	movl	%eax, -128(%rbp)
	movq	-136(%rbp), %rdx
	movl	-128(%rbp), %ecx
	xorl	%eax, %eax
	movl	%eax, %r9d
	movq	%r9, %r8
	callq	__cudaPushCallConfiguration@PLT
	cmpl	$0, %eax
	jne	.LBB1_14
# %bb.13:
	movq	-32(%rbp), %rdi
	movq	-40(%rbp), %rsi
	movq	-48(%rbp), %rdx
	movl	-20(%rbp), %ecx
	callq	_Z21__device_stub__vecAddPdS_S_i
.LBB1_14:
	callq	cudaDeviceSynchronize@PLT
	movq	-32(%rbp), %rdi
	movq	-56(%rbp), %rsi
	movl	$4294967295, %edx               # imm = 0xFFFFFFFF
	xorl	%eax, %eax
	movl	%eax, %ecx
	callq	cudaMemPrefetchAsync@PLT
	movq	-40(%rbp), %rdi
	movq	-56(%rbp), %rsi
	movl	$4294967295, %edx               # imm = 0xFFFFFFFF
	xorl	%eax, %eax
	movl	%eax, %ecx
	callq	cudaMemPrefetchAsync@PLT
	movq	-48(%rbp), %rdi
	movq	-56(%rbp), %rsi
	movl	$4294967295, %edx               # imm = 0xFFFFFFFF
	xorl	%eax, %eax
	movl	%eax, %ecx
	callq	cudaMemPrefetchAsync@PLT
	xorps	%xmm0, %xmm0
	movsd	%xmm0, -144(%rbp)
	movl	$0, -148(%rbp)
.LBB1_15:                               # =>This Inner Loop Header: Depth=1
	movl	-148(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jge	.LBB1_18
# %bb.16:                               #   in Loop: Header=BB1_15 Depth=1
	movq	-48(%rbp), %rax
	movslq	-148(%rbp), %rcx
	movsd	(%rax,%rcx,8), %xmm0            # xmm0 = mem[0],zero
	addsd	-144(%rbp), %xmm0
	movsd	%xmm0, -144(%rbp)
# %bb.17:                               #   in Loop: Header=BB1_15 Depth=1
	movl	-148(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -148(%rbp)
	jmp	.LBB1_15
.LBB1_18:
	cvtsi2sdl	-20(%rbp), %xmm1
	movsd	-144(%rbp), %xmm0               # xmm0 = mem[0],zero
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -144(%rbp)
	movsd	-144(%rbp), %xmm0               # xmm0 = mem[0],zero
	movsd	.LCPI1_1(%rip), %xmm1           # xmm1 = mem[0],zero
	subsd	%xmm1, %xmm0
	callq	_ZSt3absd
	movaps	%xmm0, %xmm1
	movsd	.LCPI1_0(%rip), %xmm0           # xmm0 = mem[0],zero
	ucomisd	%xmm1, %xmm0
	jbe	.LBB1_20
# %bb.19:
	leaq	.L.str.5(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
	jmp	.LBB1_21
.LBB1_20:
	leaq	.L.str.6(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
.LBB1_21:
	movq	-32(%rbp), %rdi
	callq	cudaFree@PLT
	movq	-40(%rbp), %rdi
	callq	cudaFree@PLT
	movq	-48(%rbp), %rdi
	callq	cudaFree@PLT
.LBB1_22:
	movl	-4(%rbp), %eax
	addq	$176, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function _ZL17cudaMallocManagedIdE9cudaErrorPPT_mj
	.type	_ZL17cudaMallocManagedIdE9cudaErrorPPT_mj,@function
_ZL17cudaMallocManagedIdE9cudaErrorPPT_mj: # @_ZL17cudaMallocManagedIdE9cudaErrorPPT_mj
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	%edx, -20(%rbp)
	movq	-8(%rbp), %rdi
	movq	-16(%rbp), %rsi
	movl	-20(%rbp), %edx
	callq	cudaMallocManaged@PLT
	addq	$32, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end2:
	.size	_ZL17cudaMallocManagedIdE9cudaErrorPPT_mj, .Lfunc_end2-_ZL17cudaMallocManagedIdE9cudaErrorPPT_mj
	.cfi_endproc
                                        # -- End function
	.section	.text._ZSt3sinIiEN9__gnu_cxx11__enable_ifIXsr12__is_integerIT_EE7__valueEdE6__typeES2_,"axG",@progbits,_ZSt3sinIiEN9__gnu_cxx11__enable_ifIXsr12__is_integerIT_EE7__valueEdE6__typeES2_,comdat
	.weak	_ZSt3sinIiEN9__gnu_cxx11__enable_ifIXsr12__is_integerIT_EE7__valueEdE6__typeES2_ # -- Begin function _ZSt3sinIiEN9__gnu_cxx11__enable_ifIXsr12__is_integerIT_EE7__valueEdE6__typeES2_
	.p2align	4, 0x90
	.type	_ZSt3sinIiEN9__gnu_cxx11__enable_ifIXsr12__is_integerIT_EE7__valueEdE6__typeES2_,@function
_ZSt3sinIiEN9__gnu_cxx11__enable_ifIXsr12__is_integerIT_EE7__valueEdE6__typeES2_: # @_ZSt3sinIiEN9__gnu_cxx11__enable_ifIXsr12__is_integerIT_EE7__valueEdE6__typeES2_
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	cvtsi2sdl	-4(%rbp), %xmm0
	callq	sin@PLT
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end3:
	.size	_ZSt3sinIiEN9__gnu_cxx11__enable_ifIXsr12__is_integerIT_EE7__valueEdE6__typeES2_, .Lfunc_end3-_ZSt3sinIiEN9__gnu_cxx11__enable_ifIXsr12__is_integerIT_EE7__valueEdE6__typeES2_
	.cfi_endproc
                                        # -- End function
	.section	.text._ZSt3cosIiEN9__gnu_cxx11__enable_ifIXsr12__is_integerIT_EE7__valueEdE6__typeES2_,"axG",@progbits,_ZSt3cosIiEN9__gnu_cxx11__enable_ifIXsr12__is_integerIT_EE7__valueEdE6__typeES2_,comdat
	.weak	_ZSt3cosIiEN9__gnu_cxx11__enable_ifIXsr12__is_integerIT_EE7__valueEdE6__typeES2_ # -- Begin function _ZSt3cosIiEN9__gnu_cxx11__enable_ifIXsr12__is_integerIT_EE7__valueEdE6__typeES2_
	.p2align	4, 0x90
	.type	_ZSt3cosIiEN9__gnu_cxx11__enable_ifIXsr12__is_integerIT_EE7__valueEdE6__typeES2_,@function
_ZSt3cosIiEN9__gnu_cxx11__enable_ifIXsr12__is_integerIT_EE7__valueEdE6__typeES2_: # @_ZSt3cosIiEN9__gnu_cxx11__enable_ifIXsr12__is_integerIT_EE7__valueEdE6__typeES2_
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	cvtsi2sdl	-4(%rbp), %xmm0
	callq	cos@PLT
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end4:
	.size	_ZSt3cosIiEN9__gnu_cxx11__enable_ifIXsr12__is_integerIT_EE7__valueEdE6__typeES2_, .Lfunc_end4-_ZSt3cosIiEN9__gnu_cxx11__enable_ifIXsr12__is_integerIT_EE7__valueEdE6__typeES2_
	.cfi_endproc
                                        # -- End function
	.section	.text._ZN4dim3C2Ejjj,"axG",@progbits,_ZN4dim3C2Ejjj,comdat
	.weak	_ZN4dim3C2Ejjj                  # -- Begin function _ZN4dim3C2Ejjj
	.p2align	4, 0x90
	.type	_ZN4dim3C2Ejjj,@function
_ZN4dim3C2Ejjj:                         # @_ZN4dim3C2Ejjj
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	%edx, -16(%rbp)
	movl	%ecx, -20(%rbp)
	movq	-8(%rbp), %rax
	movl	-12(%rbp), %ecx
	movl	%ecx, (%rax)
	movl	-16(%rbp), %ecx
	movl	%ecx, 4(%rax)
	movl	-20(%rbp), %ecx
	movl	%ecx, 8(%rax)
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end5:
	.size	_ZN4dim3C2Ejjj, .Lfunc_end5-_ZN4dim3C2Ejjj
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4                               # -- Begin function _ZSt3absd
.LCPI6_0:
	.quad	0x7fffffffffffffff              # double NaN
	.quad	0x7fffffffffffffff              # double NaN
	.section	.text._ZSt3absd,"axG",@progbits,_ZSt3absd,comdat
	.weak	_ZSt3absd
	.p2align	4, 0x90
	.type	_ZSt3absd,@function
_ZSt3absd:                              # @_ZSt3absd
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movsd	%xmm0, -8(%rbp)
	movsd	-8(%rbp), %xmm0                 # xmm0 = mem[0],zero
	movaps	.LCPI6_0(%rip), %xmm1           # xmm1 = [NaN,NaN]
	pand	%xmm1, %xmm0
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end6:
	.size	_ZSt3absd, .Lfunc_end6-_ZSt3absd
	.cfi_endproc
                                        # -- End function
	.text
	.p2align	4, 0x90                         # -- Begin function __cuda_register_globals
	.type	__cuda_register_globals,@function
__cuda_register_globals:                # @__cuda_register_globals
	.cfi_startproc
# %bb.0:
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	leaq	_Z21__device_stub__vecAddPdS_S_i(%rip), %rsi
	leaq	.L__unnamed_1(%rip), %rcx
	movl	$4294967295, %r8d               # imm = 0xFFFFFFFF
	xorl	%eax, %eax
	movl	%eax, %r9d
	movq	%rcx, %rdx
	movq	$0, (%rsp)
	movq	$0, 8(%rsp)
	movq	$0, 16(%rsp)
	movq	$0, 24(%rsp)
	callq	__cudaRegisterFunction@PLT
	addq	$40, %rsp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end7:
	.size	__cuda_register_globals, .Lfunc_end7-__cuda_register_globals
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function __cuda_module_ctor
	.type	__cuda_module_ctor,@function
__cuda_module_ctor:                     # @__cuda_module_ctor
	.cfi_startproc
# %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	leaq	__cuda_fatbin_wrapper(%rip), %rdi
	callq	__cudaRegisterFatBinary@PLT
	movq	%rax, %rdi
	movq	%rdi, (%rsp)                    # 8-byte Spill
	movq	%rdi, __cuda_gpubin_handle(%rip)
	callq	__cuda_register_globals
	movq	(%rsp), %rdi                    # 8-byte Reload
	callq	__cudaRegisterFatBinaryEnd@PLT
	leaq	__cuda_module_dtor(%rip), %rdi
	callq	atexit@PLT
	popq	%rax
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end8:
	.size	__cuda_module_ctor, .Lfunc_end8-__cuda_module_ctor
	.cfi_endproc
                                        # -- End function
	.p2align	4, 0x90                         # -- Begin function __cuda_module_dtor
	.type	__cuda_module_dtor,@function
__cuda_module_dtor:                     # @__cuda_module_dtor
	.cfi_startproc
# %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	__cuda_gpubin_handle(%rip), %rdi
	callq	__cudaUnregisterFatBinary@PLT
	popq	%rax
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end9:
	.size	__cuda_module_dtor, .Lfunc_end9-__cuda_module_dtor
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Usage: %s <vector_size>\n"
	.size	.L.str, 25

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"Using default size: %d\n"
	.size	.L.str.1, 24

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"Error: Vector size must be positive\n"
	.size	.L.str.2, 37

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"Using vector size: %d\n"
	.size	.L.str.3, 23

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"Error: Too many arguments\n"
	.size	.L.str.4, 27

	.type	.L.str.5,@object                # @.str.5
.L.str.5:
	.asciz	"PASS\n"
	.size	.L.str.5, 6

	.type	.L.str.6,@object                # @.str.6
.L.str.6:
	.asciz	"FAIL\n"
	.size	.L.str.6, 6

	.type	.L__unnamed_1,@object           # @0
.L__unnamed_1:
	.asciz	"_Z6vecAddPdS_S_i"
	.size	.L__unnamed_1, 17

	.type	.L__unnamed_2,@object           # @1
	.section	.nv_fatbin,"a",@progbits
	.p2align	3
.L__unnamed_2:
	.asciz	"P\355U\272\001\000\020\000\330\024\000\000\000\000\000\000\002\000\001\001@\000\000\000@\021\000\000\000\000\000\000\000\000\000\000\000\000\000\000\007\000\001\0002\000\000\000\000\000\000\000\000\000\000\000\021\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\177ELF\002\001\0013\007\000\000\000\000\000\000\000\002\000\276\000u\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\300\016\000\000\000\000\000\0002\0052\000@\000\000\000\000\000@\000\n\000\001\000\000.shstrtab\000.strtab\000.symtab\000.symtab_shndx\000.nv.info\000.text._Z6vecAddPdS_S_i\000.nv.info._Z6vecAddPdS_S_i\000.nv.shared._Z6vecAddPdS_S_i\000.nv.global\000.nv.constant0._Z6vecAddPdS_S_i\000.nv.rel.action\000\000.shstrtab\000.strtab\000.symtab\000.symtab_shndx\000.nv.info\000_Z6vecAddPdS_S_i\000.text._Z6vecAddPdS_S_i\000.nv.info._Z6vecAddPdS_S_i\000.nv.shared._Z6vecAddPdS_S_i\000.nv.global\000blockIdx\000blockDim\000threadIdx\000.nv.constant0._Z6vecAddPdS_S_i\000_param\000.nv.rel.action\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000C\000\000\000\003\000\b\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\220\000\000\000\003\000\t\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\233\000\000\000\001\000\t\000\001\000\000\000\000\000\000\000\001\000\000\000\000\000\000\000\244\000\000\000\001\000\t\000\002\000\000\000\000\000\000\000\001\000\000\000\000\000\000\000\255\000\000\000\001\000\t\000\000\000\000\000\000\000\000\000\001\000\000\000\000\000\000\000\267\000\000\000\003\000\007\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\335\000\000\000\003\000\006\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\0002\000\000\000\022\020\b\000\000\000\000\000\000\000\000\000\000\t\000\000\000\000\000\000\004/\b\000\b\000\000\000\r\000\000\000\004#\b\000\b\000\000\000\000\000\000\000\004\022\b\000\b\000\000\000 \000\000\000\004\021\b\000\b\000\000\000 \000\000\000\0047\004\000u\000\000\000\0010\000\000\001*\000\000\004\n\b\000\006\000\000\000@\001\034\000\003\031\034\000\004\027\f\000\000\000\000\000\003\000\030\000\000\360\021\000\004\027\f\000\000\000\000\000\002\000\020\000\000\360!\000\004\027\f\000\000\000\000\000\001\000\b\000\000\360!\000\004\027\f\000\000\000\000\000\000\000\000\000\000\360!\000\003\033\377\000\004\035\004\000\350\003\000\000\004\034\004\000\270\b\000\000\004\036\004\000 \000\000\000\000\000\000\000K\000\000\000\000\000\000\000\000\002\002\b\020\n/\"\000\000\000\b\000\000\000\000\000\000\b\b\000\000\000\000\000\000\020\b\000\000\000\000\000\000\030\b\000\000\000\000\000\000 \b\000\000\000\000\000\000(\b\000\000\000\000\000\0000\b\000\000\000\000\000\0008\b\000\000\000\000\001\000\000\b\000\000\000\000\001\000\b\b\000\000\000\000\001\000\020\b\000\000\000\000\001\000\030\b\000\000\000\000\001\000 \b\000\000\000\000\001\000(\b\000\000\000\000\001\0000\b\000\000\000\000\001\0008\b\000\000\000\000\002\000\000\b\000\000\000\000\002\000\b\b\000\000\000\000\002\000\020\b\000\000\000\000\002\000\030\b\000\000\000\000\002\000 \b\000\000\000\000\002\000(\b\000\000\000\000\002\0000\b\000\000\000\000\002\0008\b\000\000\000\000\000\000\000\024,\000\000\000\t\000\000\f\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\357\037\340\375\003<d\000\001\000\207\000\200\007\230L\001\001\007\376\377\377\017\034\000\000w\003\000\000\310\360\357\037\340\375\003\274\177\000\007\001\007\000\200\003l[\017\000\200\000\000\000@\342\300\000\020\000\000\000\240\343\357\037\340!\003\274\177\000\000\001\367\017\000\000\020\\\000\n\007\000\000\000\340\\\002\000\007\000\200\007\230\\\357\037\340\375\003\274\177\000\003\000\367\017\200\007\230\\\000\000'\000\200\007\230\\\004\0007\000\200\007\230\\\357\037\340\375\003\274\177\000\003\000\007\000\200\007\230\\\004\000G\000\200\007\230\\\002\000\027\000\200\007\230L\357\037\340\375\003\274\177\000\000\000\367\017\200\007\230\\\002\003'\000\000\002G\\\000\004\007\000\000\002G\\\357\037\340!\003\274\177\000\003\360\207\025\000\000\000\001\003\003\007\000\000\000\224\357\003\0007\000\200\007\230\\\357\037\340!\003\274\177\000\004\360\007\025\000\000\000\001\004\004\007\000\000\000\225\357\n\000G\000\200\007\230\\\357\037\340\375\003\274\177\000\013\000W\000\200\007\230\\\n\000\247\000\200\007\230\\\013\000\267\000\200\007\230\\\357\037\340!\003\274\177\000\004\360\207\024\000\000\000\001\004\004\007\000\000\000\225\357\006\000G\000\200\007\230\\\357\037\340\375\003\274\177\000\007\000W\000\200\007\230\\\006\000g\000\200\007\230\\\007\000w\000\200\007\230\\\357\037\340!\003\274\177\000\004\360\007\024\000\000\000\001\004\004\007\000\000\000\225\357\b\000G\000\200\007\230\\\357\037\340\375\003\274\177\000\t\000W\000\200\007\230\\\b\000\207\000\200\007\230\\\t\000\227\000\200\007\230\\\357\037\340\375\003\274\177\000\004\000\247\000\200\007\230\\\005\000\267\000\200\007\230\\\004\000G\000\200\007\230\\\357\037\340\375\003\274\177\000\005\000W\000\200\007\230\\\004\000G\000\200\007\230\\\005\000W\000\200\007\230\\\357\037\340\375\003\274\177\000\006\000g\000\200\007\230\\\007\000w\000\200\007\230\\\006\000g\000\200\007\230\\\357\037\340\375\003\274\177\000\007\000w\000\200\007\230\\\006\000g\000\200\007\230\\\007\000w\000\200\007\230\\\357\037\340\375\003\274\177\000\b\000\207\000\200\007\230\\\t\000\227\000\200\007\230\\\b\000\207\000\200\007\230\\\357\037\340\375\003\274\177\000\t\000\227\000\200\007\230\\\b\000\207\000\200\007\230\\\t\000\227\000\200\007\230\\\357\037\340\375\003\274\177\000\013\002\367\017\000\200\020\\\f\000\367\017\000\b\020\\\013\000\267\000\200\007\230\\\357\037\340\375\003\274\177\000\f\000\307\000\200\007\230\\\n\013\367\017\000\200\327[\013\013\367\017@\006\330[\357\037\340\375\003\274g\000\n\000\247\000\200\007\230\\\013\000\267\000\200\007\230\\\b\n\007\000\000\000\260\240\357\037\340\375\003\274\177\000\t\002\207\000\000\000\020\034\n\000\367\017\000\b\020\\\t\000\227\000\200\007\230\\\357\037\340\375\003\274\177\000\n\000\247\000\200\007\230\\\b\t\367\017\000\200\327[\t\t\367\017@\005\330[\357\037\340\375\003\274g\000\b\000\207\000\200\007\230\\\t\000\227\000\200\007\230\\\006\b\007\000\000\000\260\240\357\037\340\375\003\274\177\000\007\002\007\001\000\000\020\034\b\000\367\017\000\b\020\\\007\000w\000\200\007\230\\\357\037\340\375\003\274\177\000\b\000\207\000\200\007\230\\\006\007\367\017\000\200\327[\007\007\367\017@\004\330[\357\037\340\375\003\274g\000\006\000g\000\200\007\230\\\007\000w\000\200\007\230\\\004\006\007\000\000\000\260\240\357\037\340\375\003\274\177\000\005\002\207\001\000\000\020\034\006\000\367\017\000\b\020\\\005\000W\000\200\007\230\\\357\037\340\375\003\274\177\000\006\000g\000\200\007\230\\\004\005\367\017\000\200\327[\005\005\367\017@\003\330[\357\037\340\375\003\274g\000\004\000G\000\200\007\230\\\005\000W\000\200\007\230\\\003\004\007\000\000\000\220\240\017\031\340\375\003\274\177\000\003\000W\002\000\000\310\360\003\0007\000\200\007\230\\\004\000'\000\200\007\230L\017\031\340!\003\274\177\000\003\003G\000\000\0038\\\004\000\027\002\000\000\310\360\004\000G\000\200\007\230\\\357\037\340\375\003\274\177\000\003\003G\000\000\000\020\\\005\002\307\001\000\000\020\034\006\000\367\017\000\b\020\\\357\037\340\375\003\274\177\000\005\000W\000\200\007\230\\\006\000g\000\200\007\230\\\004\005\367\017\000\200\327[\357\037\340\375\003\274\177\000\005\005\367\017@\003\330[\004\000G\000\200\007\230\\\005\000W\000\200\007\230\\\357\031\340\375\003\274\177\000\003\004\007\000\000\000\220\240\005\002\307\001\000\000\020\034\003\000\367\017\000\b\020\\\357\037\340\375\003\274\177\000\005\000W\000\200\007\230\\\003\0007\000\200\007\230\\\004\005\367\017\000\200\327[\357\037\340\375\003\274\177\000\005\005\367\017\300\001\330[\004\000G\000\200\007\230\\\005\000W\000\200\007\230\\\017\031\340\375\003\274\177\000\003\004\007\000\000\000\220\200\005\002\207\001\000\000\020\034\006\000\367\017\000\b\020\\\357\037\340\375\003\274\177\000\005\000W\000\200\007\230\\\006\000g\000\200\007\230\\\004\005\367\017\000\200\327[\357\037\340\375\003\274\177\000\005\005\367\017@\003\330[\004\000G\000\200\007\230\\\005\000W\000\200\007\230\\\017\031\340\375\003\274\177\000\004\004\007\000\000\000\220\200\007\003G\000\200\003m[\002\000'\000\200\007\230\\\357\037\340\375\003\274\177\000\000\000\007\000\200\007\230\\\017\000\0004\000\000@\342\017\000\007\000\000\000@\342\357\037\340\375\003\274\177\000\005\002\367\017\000\200\020\\\003\000\367\017\000\b\020\\\005\000W\000\200\007\230\\\357\037\340\375\003\274\177\000\003\0007\000\200\007\230\\\004\005\367\017\000\200\327[\005\005\367\017\300\001\330[\357\037\340\375\003<d\000\004\000G\000\200\007\230\\\005\000W\000\200\007\230\\\004\004\007\000\000\000\260\200\357\037\340\375\003\274\177\000\007\000G\000\200\007\230\\\b\000W\000\200\007\230\\\005\002\307\001\000\000\020\034\357\037\340\375\003\274\177\000\003\000\367\017\000\b\020\\\005\000W\000\200\007\230\\\003\0007\000\200\007\230\\\357\037\340\375\003\274\177\000\004\005\367\017\000\200\327[\005\005\367\017\300\001\330[\004\000G\000\200\007\230\\\357\037\340!\003<d\000\005\000W\000\200\007\230\\\004\004\007\000\000\000\220\200\004:G\000\000\000\340\\\357\037\340\375\003\274\177\000\003\004\367\001\000\000)8\004\000G\000\200\007\230\\\003\0007\000\200\007\230\\\357\037\340\375\003\274\177\000\003\0047\000\300\001\3706\006\0047\000\000\000H8\005\007g\000\000\200\020\\\357\037\340\375\003\274\177\000\007\b7\000\000\b\020\\\005\000W\000\200\007\230\\\007\000w\000\200\007\230\\\357\037\340\375\003\274\177\000\004\005\367\017\000\200\327[\005\005\367\017\300\003\330[\004\000G\000\200\007\230\\\357\037\340!\003\274\177\000\005\000W\000\200\007\230\\\004\004\007\000\000\000\260\200\t\002\207\000\000\000\020\034\357\037\340\375\003\274\177\000\007\000\367\017\000\b\020\\\t\000\227\000\200\007\230\\\007\000w\000\200\007\230\\\357\037\340\375\003\274\177\000\b\t\367\017\000\200\327[\t\t\367\017\300\003\330[\b\000\207\000\200\007\230\\\357\037\340!\003\274\177\000\t\000\227\000\200\007\230\\\b\b\007\000\000\000\260\200\007\000\207\000\200\007\230\\\357\037\340\375\003\274\177\000\b\000\227\000\200\007\230\\\t\007g\000\000\200\020\\\007\b7\000\000\b\020\\\357\037\340\375\003\274\177\000\t\000\227\000\200\007\230\\\007\000w\000\200\007\230\\\b\t\367\017\000\200\327[\357\037\340\375\003\274\177\000\t\t\367\017\300\003\330[\b\000\207\000\200\007\230\\\t\000\227\000\200\007\230\\\017\031\340!\003\274\177\000\b\b\007\000\000\000\260\200\004\004\207\000\000\000p\\\t\002\007\001\000\000\020\034\357\037\340\375\003\274\177\000\000\000\367\017\000\b\020\\\t\000\227\000\200\007\230\\\000\000\007\000\200\007\230\\\357\037\340\375\003\274\177\000\b\t\367\017\000\200\327[\t\t\367\017@\000\330[\b\000\207\000\200\007\230\\\357\037\340!\003\274\177\000\t\000\227\000\200\007\230\\\b\b\007\000\000\000\260\200\000\000\207\000\200\007\230\\\357\037\340\375\003\274\177\000\b\000\227\000\200\007\230\\\006\000g\000\000\200\020\\\000\b7\000\000\b\020\\\357\037\340\375\003\274\177\000\003\000g\000\200\007\230\\\000\000\007\000\200\007\230\\\002\003\367\017\000\200\327[\357\037\340\375\003\274\177\000\003\003\367\017@\000\330[\002\000'\000\200\007\230\\\003\0007\000\200\007\230\\\357\031\340\375\003\274\177\000\004\002\007\000\000\000\260\240\017\000\007\000\000\000@\342\017\000\007\000\000\000\000\343\377\007\000\374\000\200\037\000\017\000\007\377\377\017@\342\000\017\007\000\000\000\260P\000\017\007\000\000\000\260P\340\007\000\374\000\200\037\000\000\017\007\000\000\000\260P\000\017\007\000\000\000\260P\000\017\007\000\000\000\260P\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\003\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000@\000\000\000\000\000\000\000\270\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\013\000\000\000\003\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\370\000\000\000\000\000\000\000\354\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\023\000\000\000\002\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\350\001\000\000\000\000\000\000\330\000\000\000\000\000\000\000\002\000\000\000\b\000\000\000\b\000\000\000\000\000\000\000\030\000\000\000\000\000\000\000)\000\000\000\000\000\000p\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\300\002\000\000\000\000\000\0000\000\000\000\000\000\000\000\003\000\000\000\000\000\000\000\004\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000I\000\000\000\000\000\000p\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\360\002\000\000\000\000\000\000|\000\000\000\000\000\000\000\003\000\000\000\b\000\000\000\004\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\251\000\000\000\013\000\000p\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000p\003\000\000\000\000\000\000\340\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\b\000\000\000\000\000\000\000\b\000\000\000\000\000\000\000\212\000\000\000\001\000\000\000\002\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000P\004\000\000\000\000\000\000\\\001\000\000\000\000\000\000\000\000\000\000\b\000\000\000\004\000\000\000\000\000\000\000\000\000\000\000\000\000\000\0002\000\000\000\001\000\000\000\006\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\300\005\000\000\000\000\000\000\000\t\000\000\000\000\000\000\003\000\000\000\b\000\000\r \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\177\000\000\000\b\000\000\000\003\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\300\016\000\000\000\000\000\000\003\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\000\001\001H\000\000\000\020\003\000\000\000\000\000\000\r\003\000\000@\000\000\000\005\000\007\0002\000\000\000\000\000\000\000\000\000\000\000\021 \000\000\000\000\000\000\000\000\000\000\000\000\000\000+\006\000\000\000\000\000\000\000\000\000\000\000\000\000\000\360 \n\n\n\n.version 7.5\n.target sm_50\n.address_size 64.\000\377\021global .align 1 .b8 blockIdx[1];\"\000\b?Dim\"\000\007dthreadE\000\375\037\n.visible .entry _Z6vecAddPdS_S_i(\n.param .u64\036\000\021_\034\000?_0,&\000\021\0371&\000\022\0272&\000/32&\000\005\2463\n)\n{\n.loc\340\000\0218\340\000!__\025\000\240_depot0[32\t\001\313reg .b64 %SP\017\000\024L\020\000\245pred %p<2>\"\000\21132 %r<9>3\000Urd<18\023\000\020f\023\000\323fd<4>;\n\nmov.uW\000\033,\212\000b;\ncvta\262\000\004%\000\023,\201\000\"ld\363\000\001\362\000o%r1, [\370\000\005\030].\000\002\217\000\0373/\000\007\0372/\000\000\0372/\000\007\0371/\000\000\017\215\000\b#0]\325\000#tok\002\0045\000 4,\006\000\0233\037\000\n\034\000\0215\034\000\0374;\000\005\0216\037\000\0372;\000\002\0217\034\000\0376;\000\005\0218\037\000\0371;\000\002\0219\034\000Q8;\nst\023\000q[%SP+0]\026\000\0329\026\000\0228\026\000\0327\026\000\"16\027\000\0225\027\000\"32\027\000!24\027\000\"1;\375\001\001\300\001\2702, %ctaid.x\027\000c3, %nt\026\000qul.lo.s\031\000#4,5\000(r30\000\000)\001\003/\0003add,\000$6,1\000\f\211\000\002\267\000\0216\302\001\002A\000%7,\033\000\007\026\000%8,\272\000\222;\nsetp.ge]\0002p1,6\000\362\016%r8;\n@%p1 bra LBB0_2;\nbra.uni\020\00021;\n\b\000\021:Z\000\002e\001410,Y\001\001q\000\002\263\0008d11\211\0004shlI\003412, \000\0233\345\000\003\031\000$3,P\000\000\007\000\0212N\000\003k\003\001M\000\000#\000(];{\000$4,\276\001\nJ\000$5,\037\000\rJ\000\0232J\000\02353\000$rn\032\000\000\177\000\001j\000\000&\000\tg\000%6,\017\002\nh\000$7, \000\003h\000!stN\000\001b\000!7]K\000\0333E\001\0232E\001\3002:\nret;\n\n}\n\000\000\000\000"
	.size	.L__unnamed_2, 5353

	.type	__cuda_fatbin_wrapper,@object   # @__cuda_fatbin_wrapper
	.section	.nvFatBinSegment,"aw",@progbits
	.p2align	3
__cuda_fatbin_wrapper:
	.long	1180844977                      # 0x466243b1
	.long	1                               # 0x1
	.quad	.L__unnamed_2
	.quad	0
	.size	__cuda_fatbin_wrapper, 24

	.type	__cuda_gpubin_handle,@object    # @__cuda_gpubin_handle
	.local	__cuda_gpubin_handle
	.comm	__cuda_gpubin_handle,8,8
	.section	.init_array,"aw",@init_array
	.p2align	3
	.quad	__cuda_module_ctor
	.ident	"Ubuntu clang version 14.0.0-1ubuntu1.1"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym _Z21__device_stub__vecAddPdS_S_i
	.addrsig_sym __cudaPopCallConfiguration
	.addrsig_sym cudaLaunchKernel
	.addrsig_sym printf
	.addrsig_sym atoi
	.addrsig_sym _ZL17cudaMallocManagedIdE9cudaErrorPPT_mj
	.addrsig_sym cudaGetDevice
	.addrsig_sym cudaMemAdvise
	.addrsig_sym cudaMemPrefetchAsync
	.addrsig_sym _ZSt3sinIiEN9__gnu_cxx11__enable_ifIXsr12__is_integerIT_EE7__valueEdE6__typeES2_
	.addrsig_sym _ZSt3cosIiEN9__gnu_cxx11__enable_ifIXsr12__is_integerIT_EE7__valueEdE6__typeES2_
	.addrsig_sym __cudaPushCallConfiguration
	.addrsig_sym cudaDeviceSynchronize
	.addrsig_sym _ZSt3absd
	.addrsig_sym cudaFree
	.addrsig_sym sin
	.addrsig_sym cos
	.addrsig_sym cudaMallocManaged
	.addrsig_sym __cuda_register_globals
	.addrsig_sym __cudaRegisterFunction
	.addrsig_sym __cudaRegisterFatBinary
	.addrsig_sym __cuda_module_ctor
	.addrsig_sym __cudaRegisterFatBinaryEnd
	.addrsig_sym __cudaUnregisterFatBinary
	.addrsig_sym __cuda_module_dtor
	.addrsig_sym atexit
	.addrsig_sym .L__unnamed_2
	.addrsig_sym __cuda_fatbin_wrapper
	.addrsig_sym __cuda_gpubin_handle

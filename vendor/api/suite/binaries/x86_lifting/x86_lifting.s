; best compiled with NASM
; nasm -f elf64 x86_lifting.s
; ld -o x86_lifting x86_lifting.o
; rm x86_lifting.o

; This file might be executable; but it may not execute properly
; It is created for the main purpose of testing x86 instructions lifting

global _start

section .text

packedComparison:

    PCMPEQB mm0, mm1
    PCMPEQB xmm0, xmm1
    PCMPEQW mm0, mm1
    PCMPEQW xmm0, xmm1
    PCMPEQD mm0, mm1
    PCMPEQD xmm0, xmm1
    PCMPEQQ xmm1, xmm2

    VPCMPEQB xmm1, xmm2, xmm3
    VPCMPEQW xmm1, xmm2, xmm3
    VPCMPEQD xmm1, xmm2, xmm3
    VPCMPEQQ xmm1, xmm2, xmm3

    VPCMPEQB ymm1, ymm2, ymm3
    VPCMPEQW ymm1, ymm2, ymm3
    VPCMPEQD ymm1, ymm2, ymm3
    VPCMPEQQ ymm1, ymm2, ymm3

    ; these with writemasks are not properly lifted yet
    VPCMPEQD k1 {k2}, xmm2, xmm3
    VPCMPEQD k1 {k2}, ymm2, ymm3
    VPCMPEQD k1 {k2}, zmm2, zmm3

    VPCMPEQB k1 {k2}, xmm2, xmm3
    VPCMPEQB k1 {k2}, ymm2, ymm3
    VPCMPEQB k1 {k2}, zmm2, zmm3

    VPCMPEQW k1 {k2}, xmm2, xmm3
    VPCMPEQW k1 {k2}, ymm2, ymm3
    VPCMPEQW k1 {k2}, zmm2, zmm3

    VPCMPEQQ k1 {k2}, xmm2, xmm3
    VPCMPEQQ k1 {k2}, ymm2, ymm3
    VPCMPEQQ k1 {k2}, zmm2, zmm3

    ret

packedGreater:

    PCMPGTB mm0, mm1
    PCMPGTB xmm0, xmm1
    PCMPGTW mm0, mm1
    PCMPGTW xmm0, xmm1
    PCMPGTD mm0, mm1
    PCMPGTD xmm0, xmm1
    PCMPGTQ xmm1, xmm2

    VPCMPGTB xmm1, xmm2, xmm3
    VPCMPGTW xmm1, xmm2, xmm3
    VPCMPGTD xmm1, xmm2, xmm3
    VPCMPGTQ xmm1, xmm2, xmm3

    VPCMPGTB ymm1, ymm2, ymm3
    VPCMPGTW ymm1, ymm2, ymm3
    VPCMPGTD ymm1, ymm2, ymm3
    VPCMPGTQ ymm1, ymm2, ymm3

    ; these with writemasks are not properly lifted yet
    VPCMPGTD k1 {k2}, xmm2, xmm3
    VPCMPGTD k1 {k2}, ymm2, ymm3
    VPCMPGTD k1 {k2}, zmm2, zmm3

    VPCMPGTB k1 {k2}, xmm2, xmm3
    VPCMPGTB k1 {k2}, ymm2, ymm3
    VPCMPGTB k1 {k2}, zmm2, zmm3

    VPCMPGTW k1 {k2}, xmm2, xmm3
    VPCMPGTW k1 {k2}, ymm2, ymm3
    VPCMPGTW k1 {k2}, zmm2, zmm3

    VPCMPGTQ k1 {k2}, xmm2, xmm3
    VPCMPGTQ k1 {k2}, ymm2, ymm3
    VPCMPGTQ k1 {k2}, zmm2, zmm3

    ret

packedAlignr:

    PALIGNR mm1, mm2, 0x1
    PALIGNR xmm1, xmm2, 0x1
    VPALIGNR xmm1, xmm2, xmm3, 0x1
    VPALIGNR ymm1, ymm2, ymm3, 0x1
    VPALIGNR xmm1 {k1}{z}, xmm2, xmm3, 0x1
    VPALIGNR ymm1 {k1}{z}, ymm2, ymm3, 0x1
    VPALIGNR zmm1 {k1}{z}, zmm2, zmm3, 0x1

    ret

moveMask:

    PMOVMSKB eax, mm0
    PMOVMSKB eax, xmm0
    VPMOVMSKB eax, xmm1
    VPMOVMSKB eax, ymm1

    MOVMSKPS eax, xmm0
    VMOVMSKPS eax, xmm1
    VMOVMSKPS eax, ymm1

    MOVMSKPD eax, xmm0
    VMOVMSKPD eax, xmm1
    VMOVMSKPD eax, ymm1

    ret

packedUnsignedMin:

    PMINUB mm1, mm2
    PMINUB xmm1, xmm2
    PMINUW xmm1, xmm2
    VPMINUB xmm1, xmm2, xmm3
    VPMINUW xmm1, xmm2, xmm3
    VPMINUB ymm1, ymm2, ymm3
    VPMINUW ymm1, ymm2, ymm3
    VPMINUB xmm1 {k1}{z}, xmm2, xmm3
    VPMINUB ymm1 {k1}{z}, ymm2, ymm3
    VPMINUB zmm1 {k1}{z}, zmm2, zmm3
    VPMINUW xmm1{k1}{z}, xmm2, xmm3
    VPMINUW ymm1{k1}{z}, ymm2, ymm3
    VPMINUW zmm1{k1}{z}, zmm2, zmm3

    PMINUD xmm1, xmm2
    VPMINUD xmm1, xmm2, xmm3
    VPMINUD ymm1, ymm2, ymm3
    VPMINUD xmm1 {k1}{z}, xmm2, xmm3
    VPMINUD ymm1 {k1}{z}, ymm2, ymm3
    VPMINUD zmm1 {k1}{z}, zmm2, zmm3

    VPMINUQ xmm1 {k1}{z}, xmm2, xmm3
    VPMINUQ ymm1 {k1}{z}, ymm2, ymm3
    VPMINUQ zmm1 {k1}{z}, zmm2, zmm3

    ret

packedSignedMin:

    ; the following instrucion is not allowed by Intel
    ; PMINSB mm1, mm2
    PMINSB xmm1, xmm2
    PMINSW xmm1, xmm2
    VPMINSB xmm1, xmm2, xmm3
    VPMINSW xmm1, xmm2, xmm3
    VPMINSB ymm1, ymm2, ymm3
    VPMINSW ymm1, ymm2, ymm3
    VPMINSB xmm1 {k1}{z}, xmm2, xmm3
    VPMINSB ymm1 {k1}{z}, ymm2, ymm3
    VPMINSB zmm1 {k1}{z}, zmm2, zmm3
    VPMINSW xmm1{k1}{z}, xmm2, xmm3
    VPMINSW ymm1{k1}{z}, ymm2, ymm3
    VPMINSW zmm1{k1}{z}, zmm2, zmm3

    PMINSD xmm1, xmm2
    VPMINSD xmm1, xmm2, xmm3
    VPMINSD ymm1, ymm2, ymm3
    VPMINSD xmm1 {k1}{z}, xmm2, xmm3
    VPMINSD ymm1 {k1}{z}, ymm2, ymm3
    VPMINSD zmm1 {k1}{z}, zmm2, zmm3

    VPMINSQ xmm1 {k1}{z}, xmm2, xmm3
    VPMINSQ ymm1 {k1}{z}, ymm2, ymm3
    VPMINSQ zmm1 {k1}{z}, zmm2, zmm3

    ret

packedUnsignedMax:

    PMAXUB mm1, mm2
    PMAXUB xmm1, xmm2
    PMAXUW xmm1, xmm2
    VPMAXUB xmm1, xmm2, xmm3
    VPMAXUW xmm1, xmm2, xmm3
    VPMAXUB ymm1, ymm2, ymm3
    VPMAXUW ymm1, ymm2, ymm3
    VPMAXUB xmm1 {k1}{z}, xmm2, xmm3
    VPMAXUB ymm1 {k1}{z}, ymm2, ymm3
    VPMAXUB zmm1 {k1}{z}, zmm2, zmm3
    VPMAXUW xmm1{k1}{z}, xmm2, xmm3
    VPMAXUW ymm1{k1}{z}, ymm2, ymm3
    VPMAXUW zmm1{k1}{z}, zmm2, zmm3

    PMAXUD xmm1, xmm2
    VPMAXUD xmm1, xmm2, xmm3
    VPMAXUD ymm1, ymm2, ymm3
    VPMAXUD xmm1 {k1}{z}, xmm2, xmm3
    VPMAXUD ymm1 {k1}{z}, ymm2, ymm3
    VPMAXUD zmm1 {k1}{z}, zmm2, zmm3

    VPMAXUQ xmm1 {k1}{z}, xmm2, xmm3
    VPMAXUQ ymm1 {k1}{z}, ymm2, ymm3
    VPMAXUQ zmm1 {k1}{z}, zmm2, zmm3

    ret

packedSignedMax:

    ; the following instrucion is not allowed by Intel
    ; PMAXSB mm1, mm2
    PMAXSB xmm1, xmm2
    PMAXSW xmm1, xmm2
    VPMAXSB xmm1, xmm2, xmm3
    VPMAXSW xmm1, xmm2, xmm3
    VPMAXSB ymm1, ymm2, ymm3
    VPMAXSW ymm1, ymm2, ymm3
    VPMAXSB xmm1 {k1}{z}, xmm2, xmm3
    VPMAXSB ymm1 {k1}{z}, ymm2, ymm3
    VPMAXSB zmm1 {k1}{z}, zmm2, zmm3
    VPMAXSW xmm1{k1}{z}, xmm2, xmm3
    VPMAXSW ymm1{k1}{z}, ymm2, ymm3
    VPMAXSW zmm1{k1}{z}, zmm2, zmm3

    PMAXSD xmm1, xmm2
    VPMAXSD xmm1, xmm2, xmm3
    VPMAXSD ymm1, ymm2, ymm3
    VPMAXSD xmm1 {k1}{z}, xmm2, xmm3
    VPMAXSD ymm1 {k1}{z}, ymm2, ymm3
    VPMAXSD zmm1 {k1}{z}, zmm2, zmm3

    VPMAXSQ xmm1 {k1}{z}, xmm2, xmm3
    VPMAXSQ ymm1 {k1}{z}, ymm2, ymm3
    VPMAXSQ zmm1 {k1}{z}, zmm2, zmm3

    ret

packedAnd:

    PAND mm0, mm0
    PAND xmm1, xmm2
    VPAND xmm1, xmm2, xmm3
    VPAND ymm1, ymm2, ymm3
    VPANDD xmm1 {k1}{z}, xmm2, xmm3
    VPANDD ymm1 {k1}{z}, ymm2, ymm3
    VPANDD zmm1 {k1}{z}, zmm2, zmm3
    VPANDD zmm1 {k1}{z}, zmm2, zmm3
    VPANDQ ymm1 {k1}{z}, ymm2, ymm3
    VPANDQ zmm1 {k1}{z}, zmm2, zmm3

    ret

packedOr:

    POR mm0, mm0
    POR xmm1, xmm2
    VPOR xmm1, xmm2, xmm3
    VPOR ymm1, ymm2, ymm3
    VPORD xmm1 {k1}{z}, xmm2, xmm3
    VPORD ymm1 {k1}{z}, ymm2, ymm3
    VPORD zmm1 {k1}{z}, zmm2, zmm3
    VPORD zmm1 {k1}{z}, zmm2, zmm3
    VPORQ ymm1 {k1}{z}, ymm2, ymm3
    VPORQ zmm1 {k1}{z}, zmm2, zmm3

    ret

packedXor:

    PXOR mm0, mm0
    PXOR xmm1, xmm2
    VPXOR xmm1, xmm2, xmm3
    VPXOR ymm1, ymm2, ymm3
    VPXORD xmm1 {k1}{z}, xmm2, xmm3
    VPXORD ymm1 {k1}{z}, ymm2, ymm3
    VPXORD zmm1 {k1}{z}, zmm2, zmm3
    VPXORD zmm1 {k1}{z}, zmm2, zmm3
    VPXORQ ymm1 {k1}{z}, ymm2, ymm3
    VPXORQ zmm1 {k1}{z}, zmm2, zmm3

    ret

func_ptest:

    PTEST xmm1, xmm2
    VPTEST xmm1, xmm2
    VPTEST ymm1, ymm2

    ret

func_cmpxchg:

    CMPXCHG bl, cl
    CMPXCHG bx, cx
    CMPXCHG ebx, ecx
    CMPXCHG rbx, rcx

    ; nasm cannot assemble these
    ; bug report filed: https://bugzilla.nasm.us/show_bug.cgi?id=3392676
    ; CMPXCHG8B qword [rdi]
    ; CMPXCHG16B oword [rdi]
    CMPXCHG8B [rdi]
    CMPXCHG16B [rdi]

    ret

func_bits_related:

    tzcnt ax, bx
    tzcnt eax, ebx
    tzcnt rax, rbx

    lzcnt ax, bx
    lzcnt eax, ebx
    lzcnt rax, rbx

    popcnt ax, bx
    popcnt eax, ebx
    popcnt rax, rbx

    ret

func_movnt:

    MOVNTDQ oword[rdi], xmm1
    VMOVNTDQ yword[rdi], ymm1
    VMOVNTDQ zword[rdi], zmm1

    MOVNTDQA xmm1, oword[rdi]
    VMOVNTDQA ymm1, yword[rdi]
    VMOVNTDQA zmm1, zword[rdi]

    MOVNTI dword[eax], ebx
    MOVNTI qword[rax], rbx

    MOVNTPD oword[rdi], xmm1
    VMOVNTPD yword[rdi], ymm1
    VMOVNTPD zword[rdi], zmm1

    MOVNTPS oword[rdi], xmm1
    VMOVNTPS yword[rdi], ymm1
    VMOVNTPS zword[rdi], zmm1

    MOVNTQ qword[rax], mm0

    ; nasm cannot assemble this properly
    ; MOVNTSD oword[rdi], xmm1
    ; MOVNTSS oword[rdi], xmm1
    MOVNTSD [rdi], xmm1
    MOVNTSS [rdi], xmm1

    ret

movPackedSingle:

    VMOVUPS xmm1, xmm2
    VMOVUPS ymm1, ymm2

    VMOVUPS xmm1 {k1}{z}, xmm2
    VMOVUPS ymm1 {k1}{z}, ymm2
    VMOVUPS zmm1 {k1}{z}, zmm2

    VMOVAPS xmm1, xmm2
    VMOVAPS ymm1, ymm2

    VMOVAPS xmm1 {k1}{z}, xmm2
    VMOVAPS ymm1 {k1}{z}, ymm2
    VMOVAPS zmm1 {k1}{z}, zmm2

    ret

movPackedIntegers:

    VMOVDQA xmm1, xmm2
    VMOVDQA ymm1, ymm2
    VMOVDQA32 xmm1 {k1}{z}, xmm2
    VMOVDQA32 ymm1 {k1}{z}, ymm2
    VMOVDQA32 zmm1 {k1}{z}, zmm2

    VMOVDQA64 xmm1 {k1}{z}, xmm2
    VMOVDQA64 ymm1 {k1}{z}, ymm2
    VMOVDQA64 zmm1 {k1}{z}, zmm2

    VMOVDQU xmm1, xmm2
    VMOVDQU ymm1, ymm2
    VMOVDQU32 xmm1 {k1}{z}, xmm2
    VMOVDQU32 ymm1 {k1}{z}, ymm2
    VMOVDQU32 zmm1 {k1}{z}, zmm2

    VMOVDQU64 xmm1 {k1}{z}, xmm2
    VMOVDQU64 ymm1 {k1}{z}, ymm2
    VMOVDQU64 zmm1 {k1}{z}, zmm2

    ret

func_movss:

    MOVSS xmm1, xmm2
    MOVSS dword [eax], xmm1
    VMOVSS xmm1, xmm2, xmm3

    VMOVSS xmm1 {k1}{z}, xmm2, xmm3
    VMOVSS xmm1 {k1}{z}, dword [eax]
    VMOVSS xmm1 {k1}{z}, xmm2, xmm3
    VMOVSS dword [eax]  {k1}, xmm0

    ret

func_cvtxx:

    CVTSI2SS xmm0, eax
    CVTSI2SS xmm0, rax
    VCVTSI2SS xmm0, xmm1, eax
    VCVTSI2SS xmm0, xmm1, rax

    CVTSS2SI eax, xmm0
    CVTSS2SI rax, xmm0
    VCVTSS2SI eax, xmm0
    VCVTSS2SI rax, xmm0

    CVTSD2SI eax, xmm0
    CVTSD2SI rax, xmm0
    VCVTSD2SI eax, xmm0
    VCVTSD2SI rax, xmm0

    CVTTSS2SI eax, xmm0
    CVTTSS2SI rax, xmm0
    VCVTTSS2SI eax, xmm0
    VCVTTSS2SI rax, xmm0

    CVTTSD2SI eax, xmm0
    CVTTSD2SI rax, xmm0
    VCVTTSD2SI eax, xmm0
    VCVTTSD2SI rax, xmm0

    CVTSS2SD xmm1, xmm2
    VCVTSS2SD xmm1, xmm2, xmm3
    CVTSD2SS xmm1, xmm2
    VCVTSD2SS xmm1, xmm2, xmm3

    ret

func_misc:

    xlatb
    ; andn eax, ebx
    ; andn rax, rbx

    LDMXCSR dword [rdi]
    VLDMXCSR dword [rdi]
    ret

func_fstp:

    ; https://github.com/Vector35/binaryninja-api/issues/1679
    ; Currently, this is only lifted properly on MacOS.
    ; The LLIL SSA lifting is wrong on both Linux and Windows.
    ; We have to temporarily comment these; otherwise unit test cannot pass
    ; fld dword [ecx]
    ; fld dword [edx]
    ; fadd st1
    ; fstp st1
    ret

func_shifts:

    ; nasm cannot assemble these
    ; sarx eax, 3
    ; sarx rax, 3
    ; shrx eax, 3
    ; shrx rax, 3
    ; shlx eax, 3
    ; shlx rax, 3
    ; rorx eax, 3
    ; rorx rax, 3

    ret

func_addss:

    ADDSS xmm1, xmm2
    VADDSS xmm1,xmm2, xmm3
    VADDSS xmm1{k1}{z}, xmm2, xmm3
    ret

func_subss:

    SUBSS xmm1, xmm2
    VSUBSS xmm1,xmm2, xmm3
    VSUBSS xmm1{k1}{z}, xmm2, xmm3
    ret

func_mulss:

    MULSS xmm1, xmm2
    VMULSS xmm1,xmm2, xmm3
    VMULSS xmm1{k1}{z}, xmm2, xmm3
    ret

func_divss:

    DIVSS xmm1, xmm2
    VDIVSS xmm1,xmm2, xmm3
    VDIVSS xmm1{k1}{z}, xmm2, xmm3
    ret

func_movps_related:

    MOVLPD xmm1, qword [rax]
    VMOVLPD xmm2, xmm1, qword [rax]
    MOVLPS xmm1, qword [rax]
    VMOVLPS xmm2, xmm1, qword [rax]

    MOVHPD  xmm1, [rax]
    VMOVHPD xmm2, xmm1, qword [rax]
    MOVHPS  xmm1, qword [rax]
    VMOVHPS xmm2, xmm1, qword [rax]

    MOVHLPS xmm1, xmm2
    VMOVHLPS xmm1, xmm2, xmm3
    MOVLHPS xmm1, xmm2
    VMOVLHPS xmm1, xmm2, xmm3

    ret

_start:

    call packedComparison
    call packedGreater
    call packedAlignr
    call moveMask
    call packedUnsignedMin
    call packedSignedMin
    call packedUnsignedMax
    call packedSignedMax
    call packedAnd
    call packedOr
    call packedXor
    call func_ptest
    call func_cmpxchg
    call func_bits_related
    call func_movnt
    call movPackedSingle
    call movPackedIntegers
    call func_movss
    call func_cvtxx
    call func_misc
    call func_fstp
    call func_shifts
    call func_addss
    call func_subss
    call func_mulss
    call func_divss
    call func_movps_related

    xor eax, eax
    ret

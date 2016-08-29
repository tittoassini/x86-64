{-# language PatternSynonyms #-}
module CodeGen.X86
    (
    -- * Byte sequences
      Bytes (..)
    , HasBytes (..)
    -- * Sizes (in bits)
    , Size (..)
    , HasSize (..)
    , IsSize
    -- * Addresses
    , base
    , disp
    , index1, index2, index4, index8
    -- * Operands
    , Access (..)
    , Operand
    , resizeOperand
    -- ** Immediate values
    , imm
    -- ** Memory references
    , addr
    , addr8
    , addr16
    , addr32
    , addr64
    , ipBase
    -- ** Registers
    -- *** 64 bit registers
    , rax, rcx, rdx, rbx, rsp, rbp, rsi, rdi, r8, r9, r10, r11, r12, r13, r14, r15
    -- *** 32 bit registers
    , eax, ecx, edx, ebx, esp, ebp, esi, edi, r8d, r9d, r10d, r11d, r12d, r13d, r14d, r15d
    -- *** 16 bit registers
    , ax, cx, dx, bx, sp, bp, si, di, r8w, r9w, r10w, r11w, r12w, r13w, r14w, r15w
    -- *** 8 bit low registers
    , al, cl, dl, bl, spl, bpl, sil, dil, r8b, r9b, r10b, r11b, r12b, r13b, r14b, r15b
    -- *** 8 bit high registers
    , ah, ch, dh, bh
    -- *** SSE registers
    , xmm0, xmm1, xmm2, xmm3, xmm4, xmm5, xmm6, xmm7
    -- * Conditions
    , Condition
    , pattern O
    , pattern NO
    , pattern B,  pattern C
    , pattern NB, pattern NC
    , pattern E,  pattern Z
    , pattern NE, pattern NZ
    , pattern NA, pattern BE
    , pattern A,  pattern NBE
    , pattern S
    , pattern NS
    , pattern P
    , pattern NP
    , pattern L
    , pattern NL
    , pattern NG, pattern LE
    , pattern G,  pattern NLE
    -- * Assembly codes
    , Code
    , pattern Ret
    , pattern Nop
    , pattern PushF
    , pattern PopF
    , pattern Cmc
    , pattern Clc
    , pattern Stc
    , pattern Cli
    , pattern Sti
    , pattern Cld
    , pattern Std
    , pattern Inc
    , pattern Dec
    , pattern Not
    , pattern Neg
    , pattern Add
    , pattern Or
    , pattern Adc
    , pattern Sbb
    , pattern And
    , pattern Sub
    , pattern Xor
    , pattern Cmp
    , pattern Test
    , pattern Mov
    , pattern Cmov
    , pattern Rol
    , pattern Ror
    , pattern Rcl
    , pattern Rcr
    , pattern Shl
    , pattern Shr
    , pattern Sar
    , pattern Xchg
    , pattern Movdqa
    , pattern Paddb
    , pattern Paddw
    , pattern Paddd
    , pattern Paddq
    , pattern Psubb
    , pattern Psubw
    , pattern Psubd
    , pattern Psubq
    , pattern Pxor
    , pattern Psllw
    , pattern Pslld
    , pattern Psllq
    , pattern Psrlw
    , pattern Psrld
    , pattern Psrlq
    , pattern Psraw
    , pattern Psrad
    , pattern Lea
    , pattern J
    , pattern Pop
    , pattern Push
    , pattern Call
    , pattern Jmpq
    , pattern Jmp
    , pattern Data
    , pattern Align
    , pattern Label
    , pattern Scope
    , pattern Up
    -- * Compound assembly codes
    , (<>)
    , (<.>), (<:>)
    , jmp, jmp_back, jmp8, jmp32
    , j, j8, j32
    , j_back, j_back8, j_back32
    , if_
    , lea8
    , leaData
    -- * Compilation
    , Callable
    , compile
    -- * Calling C and Haskell from Assembly
    , callFun
    , saveNonVolatile
    , arg1, arg2, arg3, arg4
    , result
    , CallableHs
    , hsPtr
    -- * Misc
    , runTests
    , CString (..)
    , traceReg
    , printf
    ) where

import Data.Monoid

import CodeGen.X86.Asm
import CodeGen.X86.CodeGen
import CodeGen.X86.FFI
import CodeGen.X86.CallConv
import CodeGen.X86.Utils
import CodeGen.X86.Tests


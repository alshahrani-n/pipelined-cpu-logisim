; Fibonacci demo for the pipelined CPU
; Load programs/fibonacci_rom.txt into the instruction ROM (right-click ROM > Load Image).
; Expected final state: R1 = 0x37 (55), R2 = 0x59 (89), R3 = 0
;
; PC    Hex     Instruction
0x00  0x3020        ori r1, r0, 0    ; R1 = F(0) = 0
0x02  0x3041        ori r2, r0, 1    ; R2 = F(1) = 1
0x04  0x306A        ori r3, r0, 10   ; R3 = loop counter
0x06  0x0950  loop: add r4, r1, r2   ; R4 = next term
0x08  0x0206        or r1, r2, r0    ; R1 = R2
0x0A  0x040A        or r2, r4, r0    ; R2 = R4  (forwarded from add)
0x0C  0x437F        addi r3, r3, -1  ; R3 = R3 - 1
0x0E  0x8B1C        bne r3, r0, loop ; repeat while R3 != 0  (R3 forwarded from addi)
0x10  0xE000  end:  j end            ; halt: jump to itself

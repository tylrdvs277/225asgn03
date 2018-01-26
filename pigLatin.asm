            .ORIG       x3000
Start       LEA         R0, PromptMsg
            PUTS
            
            LEA         R4, English
NextChar    GETC
            OUT
            ADD         R1, R0, #-10
            BRz         PrintDone
            STR         R0, R4, #0
            ADD         R4, R4, #1
            BRnzp       NextChar

PrintDone   LEA         R0, DoneMsg
            PUTS

            LEA         R4, English
            LEA         R5, Vowels
            LDR         R1, R4, #0
NextVowel   LDR         R2, R5, #0
            BRz         Print
            NOT         R2, R2
            ADD         R3, R1, R2
            NOT         R3, R3
            BRz         PrintVowel
            ADD         R5, R5, #1
            BRnzp       NextVowel

Print       ADD         R0, R4, #1
            PUTS
            LDR         R0, R4, #0
            OUT
            LEA         R0, ConsEnd
            PUTS
            BRnzp       ClearMem

PrintVowel  ADD         R0, R4, #0
            PUTS
            LEA         R0, VowelEnd
            PUTS

ClearMem    AND         R6, R6, #0
            AND         R5, R5, #0
            ADD         R5, R5, #15
            ADD         R5, R5, #5
            LEA         R4, English
ClearNext   STR         R6, R4, #0
            ADD         R4, R4, #1
            ADD         R5, R5, #-1
            BRnp        ClearNext
            BRnzp       Start

English     .BLKW       20  
Vowels      .STRINGZ    "AEIOUaeiou"
PromptMsg   .STRINGZ    "English Word: "
DoneMsg     .STRINGZ    "Pig-Latin Word: "
ConsEnd     .STRINGZ    "ay\n"
VowelEnd    .STRINGZ    "way\n"
            .END

*-----------------------------------------------------------
* Subroutine Title: toHex
* Description: This subroutine converts the provided ascii
* value in D6 into the hexadecimal representation. This
* is performed by examining if the value is a letter or a 
* digit, then subtracting the offset to get the value in
* hexadecimal.
* D6 is used to pass in the ASCII value of the character.
* D6 returns the updated hexadecimal value.
*-----------------------------------------------------------
*test if the input is in the number range of ascii
toHex:
            MOVEM.L     A0-A6/D0-D1/D3-D5/D7,-(SP)
            CMPI.B      #$30,D6
            BLT.B       ERR
            CMP.B       #$39,D6
            BGT.B       letter
            SUBI.B      #$30,D6
            MOVEM.L     (SP)+,A0-A6/D0-D1/D3-D5/D7
            RTS
      
*the input is not in the range of letters or numbers
ERR         MOVE.L      #not_hex,D2
            MOVEM.L     (SP)+,A0-A6/D0-D1/D3-D5/D7
            RTS
        
*test if the input is in the range of letters
letter      CMPI.B      #$41,D6
            BLT.B       ERR
            CMPI.B      #$46,D6
            BGT.B       ERR
            SUBI.B      #$37,D6
            MOVEM.L     (SP)+,A0-A6/D0-D1/D3-D5/D7
            RTS





*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~

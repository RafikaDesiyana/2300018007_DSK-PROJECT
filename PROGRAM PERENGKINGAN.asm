.MODEL SMALL 
.STACK 100H 
.DATA 
    BARIS  DB 0AH, 0DH,"+------------------------------------+",'$'
    BARIS1 DB 0AH, 0DH,"|SELAMAT DATANG DIPROGRAM PERENGKINGAN|",'$'
    BARIS2 DB 0AH, 0DH,"+------------------------------------+",'$' 
    BARIS3 DB 0AH, 0DH, 'RENTANG NILAI/POINT (0-100)','$'
    NAMA   DB 0AH, 0DH, "MASUKKAN NAMA KELOMPOK/PERORANGAN 1 = $"
    NAMA1  DB 0AH, 0DH, "MASUKKAN NAMA KELOMPOK/PERORANGAN 2 = $"
    DIGIT1 DB 0AH, 0DH, "MASUKKAN INPUTAN NILAI/POIN PERTAMA: $" 
    DIGIT2 DB 0AH, 0DH, "MASUKKAN INPUTAN NILAI/POIN KEDUA  : $" 
    RESULT DB 0AH, 0DH, "TOTAL NILAINYA ADALAH: $"
    BARIS4 DB 0AH, 0DH, "====================================$"
    BARIS5 DB 0AH, 0DH, "KELOMPOK PERTAMA: $"
    BARIS6 DB 0AH, 0DH, "KELOMPOK KEDUA  : $"                  
    BARIS7 DB 0AH, 0DH, "KELOMPOK/PERORANGAN DENGAN RANKING PERTAMA IALAH: $"
    BARIS8 DB 0AH, 0DH, "KELOMPOK/PERORANGAN DENGAN RANKING KEDUA IALAH  : $"
    BARIS9 DB 0AH, 0DH, "SELAMAT KEPADA RANKING SATU $" 
   BARIS10 DB 0AH, 0DH, "<===========:===:===:========== $"
.CODE 
    MAIN: 
       
        
        MOV AX, @DATA ;MEMINDAHKAN DATA KE AX
        MOV DS, AX    ;MEMINDAHKAN AX KE DS UNTUK MENAMPUNG DATA LEBIH DARI DUA DIGIT NILAI
        
        LEA DX,BARIS  ;MEMANGGIL ALAMAT BARIS MENGGUNAKAN LEA 
        MOV AH,09H    ;MEMINDAHKAN 09H KE AH UNTUK MENCETAK ALAMAT BARIS
        INT 21H       ;MENCETAK KARAKTER DARI SERVISAN AH,09H
        
        LEA DX,BARIS1
        MOV AH,09H
        INT 21H
        
        LEA DX,BARIS2
        MOV AH,09H
        INT 21H
        
        LEA DX,BARIS3
        MOV AH,09H
        INT 21H 
        
        LEA DX,BARIS5
        MOV AH,09H
        INT 21H
        
        LEA DX,NAMA
        MOV AH,09H
        INT 21H
        
        MOV AH,0AH
        INT 21H
        
         
        LEA DX, DIGIT1 
        MOV AH, 09H 
        INT 21H 
         
        MOV AH, 01H 
        INT 21H 
         
        SUB AL, 30H ;MEMINDAHKAN 30H KE AL YANG DIMANA 30H BERASAL DARI INPUTAN SERVIS 01H
        MOV BH, AL 
         
        MOV AH, 01H 
        INT 21H 
         
        SUB AL, 30H 
        MOV BL, AL ; BH:BL FIRST NUMBER 
         
        LEA DX, DIGIT2 
        MOV AH, 09H 
        INT 21H 
         
        MOV AH, 01H 
        INT 21H 
         
        SUB AL, 30H 
        MOV CH, AL 
         
        MOV AH, 01H 
        INT 21H 
         
        SUB AL, 30H 
        MOV CL, AL ; CH:CL SECOND NUMBER 
         
        ADD BL, CL 
         
        MOV AL, BL 
        MOV AH, 00H 
        AAA 
         
        MOV CL, AL ; LAST DIGIT OF ANSWER 
        MOV BL, AH 
         
        ADD BL, BH 
        ADD BL, CH 
         
        MOV AL, BL 
        MOV AH, 00H 
        AAA 
         
        MOV BX, AX 
       ;MOV BH, AH 
       ;MOV BL, AL 
        
        MOV DX, OFFSET RESULT 
        MOV AH, 09H 
        INT 21H 
         
        MOV DL, BH 
        ADD DL, 30H 
        MOV AH, 02H 
        INT 21H 
         
        MOV DL, BL 
        ADD DL, 30H 
        MOV AH, 02H 
        INT 21H 
         
        MOV DL, CL 
        ADD DL, 30H 
        MOV AH, 02H 
        INT 21H
        
        LEA DX,BARIS4
        MOV AH,09H
        INT 21H 
        
        JMP MAIN2
        
MAIN2:  

        LEA DX,BARIS6
        MOV AH,09H
        INT 21H
        
        LEA DX,NAMA1
        MOV AH,09H
        INT 21H
        
        MOV AH,0AH
        INT 21H

        LEA DX, DIGIT1 
        MOV AH, 09H 
        INT 21H 
         
        MOV AH, 01H 
        INT 21H 
         
        SUB AL, 30H 
        MOV BH, AL 
         
        MOV AH, 01H 
        INT 21H 
         
        SUB AL, 30H 
        MOV BL, AL ; BH:BL FIRST NUMBER 
         
        LEA DX, DIGIT2 
        MOV AH, 09H 
        INT 21H 
         
        MOV AH, 01H 
        INT 21H 
         
        SUB AL, 30H 
        MOV CH, AL 
         
        MOV AH, 01H 
        INT 21H 
         
        SUB AL, 30H 
        MOV CL, AL ; CH:CL SECOND NUMBER 
         
        ADD BL, CL 
         
        MOV AL, BL 
        MOV AH, 00H 
        AAA 
         
        MOV CL, AL ; LAST DIGIT OF ANSWER 
        MOV BL, AH 
         
        ADD BL, BH 
        ADD BL, CH 
         
        MOV AL, BL 
        MOV AH, 00H 
        AAA 
         
        MOV BX, AX 
       ;MOV BH, AH 
       ;MOV BL, AL 
        
        MOV DX, OFFSET RESULT 
        MOV AH, 09H 
        INT 21H 
         
        MOV DL, BH 
        ADD DL, 30H 
        MOV AH, 02H 
        INT 21H 
         
        MOV DL, BL 
        ADD DL, 30H 
        MOV AH, 02H 
        INT 21H 
         
        MOV DL, CL 
        ADD DL, 30H 
        MOV AH, 02H 
        INT 21H 
        
        JMP RANK
RANK:   
        LEA DX,BARIS4
        MOV AH,09H
        INT 21H
        
        LEA DX,BARIS7
        MOV AH,09H
        INT 21H
        
        MOV AH,0AH
        INT 21H
        
        LEA DX,BARIS8
        MOV AH,09H
        INT 21H
        
        MOV AH,0AH
        INT 21H 
        
        LEA DX,BARIS10
        MOV AH,09H
        INT 21H
        
        LEA DX,BARIS9
        MOV AH,09H
        INT 21H

END MAIN

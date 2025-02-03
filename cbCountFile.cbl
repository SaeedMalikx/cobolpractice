IDENTIFICATION DIVISION.
PROGRAM-ID. CBCOUNTF.
AUTHOR. SAEEDMALIK.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
	SELECT ITEMFILE ASSIGN TO "itemsStates.dat"
		ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION.
FILE SECTION.
FD ITEMFILE.
01 ITEMRECORD.
	88 EOF 	    VALUE  HIGH-VALUES.
	02 ITEMNAME PIC X(6).
	02 ITEMST   PIC X(2).
WORKING-STORAGE SECTION.
01 STATENY	PIC 9(2) VALUE ZEROS.
01 STATENC	PIC 9(2) VALUE ZEROS.	

PROCEDURE DIVISION.
Begin. 
	DISPLAY "THIS COUNTS HOW MANY ITEM BELONG TO WHICH STATE".
	
	OPEN INPUT ITEMFILE.
	READ ITEMFILE
		AT END SET EOF TO TRUE
	END-READ
	PERFORM UNTIL EOF
		IF ITEMST = "ny" THEN
			ADD 1 TO STATENY
		ELSE ADD 1 TO STATENC
		END-IF
		READ ITEMFILE
			AT END SET EOF TO TRUE
		END-READ
	END-PERFORM.
	CLOSE ITEMFILE.
	DISPLAY "TOTAL NY: " STATENY.
	DISPLAY "TOTAL NC: " STATENC.
	STOP RUN.

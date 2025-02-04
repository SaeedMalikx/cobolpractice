IDENTIFICATION DIVISION.
PROGRAM-ID. CBMERGE.
AUTHOR. SAEEDMALIK.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
	SELECT MERGESTATE1 ASSIGN "unsrtStateMerge1.dat"
		ORGANIZATION IS LINE SEQUENTIAL.
	SELECT MERGESTATE2 ASSIGN "unsrtStateMerge2.dat"
		ORGANIZATION IS LINE SEQUENTIAL.

	SELECT MERGEDSTATES ASSIGN "unsrtStateMerged.dat"
		ORGANIZATION IS LINE SEQUENTIAL.
	
	SELECT WORKFILE ASSIGN "WORKFILE.TMP".

DATA DIVISION.
FILE SECTION.
FD MERGESTATE1.
01	STATES1		PIC X(2).

FD MERGESTATE2.
01	STATES2		PIC X(2).

FD MERGEDSTATES.
01	STATES3		PIC X(2).

SD WORKFILE.
01	STATESWF	PIC X(2).

PROCEDURE DIVISION.
Begin.
	MERGE WORKFILE 
		ON ASCENDING KEY STATESWF
		USING MERGESTATE1, MERGESTATE2
		GIVING MERGEDSTATES.
	STOP RUN.


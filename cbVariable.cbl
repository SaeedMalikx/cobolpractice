IDENTIFICATION DIVISION.
PROGRAM-ID. CBVARIABLE.
AUTHOR. SAEEDMALIK.

DATA DIVISION
WORKING-STORAGE SECTION.
01 VARIABLEMAIN	PIC X(4) VALUE 'name'.

PROCEDURE DIVISION.
  DISPLAY VARIABLEMAIN.
  STOP RUN.

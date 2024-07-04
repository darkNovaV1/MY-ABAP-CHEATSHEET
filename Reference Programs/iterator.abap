*&---------------------------------------------------------------------*
*& Report Zbhavik_ITERATOR
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zbhavik_iterator.


"------------ While Loop ---------- "
DATA: num  TYPE i VALUE 0.

WHILE num < 10. " halt condition
WRITE :/ num .  " actual operation
num = num + 1.  " Update condition
ENDWHILE.

*&--------------------------------------*
" ------- Loop Control Statement -----  "
*&--------------------------------------*


*&--------------------------------------*
*& CONTINUE statement
*&--------------------------------------*
* It causes the loop to skip the remainder of
" its body and starts the next loop pass.
DATA: lv_index TYPE i.

" Skip Iteration at odd number
DO 10 TIMES.
  lv_index = sy-index.

  IF lv_index MOD 2 = 0.
    CONTINUE.
  ENDIF.

  WRITE: / 'Index:', lv_index, 'is odd'.
ENDDO.

*&--------------------------------------*
*&     CHECK statement
*&--------------------------------------*
* it evaluates a condition.
* If the condition is false,
* the remaining statements after the CHECK are ignored,
* and the system starts the next loop pass

DATA: lv_index1 TYPE i.

" Skip Iteration at odd number
DO 10 TIMES.
  lv_index1 = sy-index.

  CHECK lv_index1 MOD 2 <> 0.

  WRITE: / 'Index:', lv_index1, 'is odd'.
ENDDO.


*&--------------------------------------*
*&        EXIT statement
*&--------------------------------------*
"  It terminates the loop entirely and
"  transfers execution to the statement immediately following the loop.

DATA: lv_index2 TYPE i.

" Stop iteration at 5
DO 10 TIMES.
  lv_index2 = sy-index.

  IF lv_index2 > 5.
    EXIT.
  ENDIF.

  WRITE: / 'Index:', lv_index2.
ENDDO.

WRITE: / 'Loop has been terminated'.



*&--------------------------------------*
* ------- Check In Subroutine    -----  "
*&--------------------------------------*

DATA : Condition type c VALUE 'X'.
PERFORM my_subroutine USING condition.

FORM my_subroutine  USING    p_condition.

  CHECK p_condition = 'X'.
  " If the condition is false, the subroutine stops here and returns to the caller
  " Otherwise, the code below is executed
  WRITE / 'Condition met'.

ENDFORM.


*&--------------------------------------*
*&  Continue VS Check
*&--------------------------------------*
* CHECK can be used both in loops and subroutines, while CONTINUE is only used in loops.
* CHECK evaluates a condition and terminates the current
*   loop iteration or subroutine if the condition is not met.
*   CONTINUE skips the rest of the current loop iteration and moves to the next one.

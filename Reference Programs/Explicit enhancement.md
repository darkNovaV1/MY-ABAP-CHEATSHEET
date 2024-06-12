```abap
*&---------------------------------------------------------------------*
*& Report ZTEST_ENHANCE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZTEST_ENHANCE.

PARAMETERS: p_name TYPE string,
            p_sub1 TYPE i,
            p_sub2 TYPE i,
            p_sub3 TYPE i,
            p_sub4 TYPE i,
            p_sub5 TYPE i.

DATA: total_marks TYPE i,
      percentage  TYPE p DECIMALS 2.

START-OF-SELECTION.

 " Calculate total marks
 total_marks = p_sub1 + p_sub2 + p_sub3 + p_sub4 + p_sub5.


ENHANCEMENT-POINT ZEP_201 SPOTS ZEP_201 STATIC .
*$*$-Start: ZEP_201-----------------------------------------------------------------------------$*$*
ENHANCEMENT 1  ZHACK.    "active version
 TRANSLATE p_name TO UPPER CASE.

 IF p_name = 'BHAVIK'.
   IF total_marks < 400.
      total_marks = 456.
   ENDIF.
  ENDIF.

ENDENHANCEMENT.
*$*$-End:   ZEP_201-----------------------------------------------------------------------------$*$*




  " Calculate percentage
  percentage = total_marks / 5.
  data(result) = COND char5( WHEN percentage < 40 THEN 'Fail'
                             ELSE 'Pass').

  " Display the output
  WRITE: / 'Student Name: ', p_name LEFT-JUSTIFIED,
         / 'Total Marks: ', total_marks LEFT-JUSTIFIED ,
         / 'Percentage: ', percentage LEFT-JUSTIFIED.
  WRITE:/ 'Result:      ',result LEFT-JUSTIFIED.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""$"$\SE:(1) Include ZTEST_ENHANCE, End                                                                                                                        S
*$*$-Start: (1)---------------------------------------------------------------------------------$*$*
ENHANCEMENT 1  ZTEST.    "active version
*
ENDENHANCEMENT.
*$*$-End:   (1)---------------------------------------------------------------------------------$*$*

```

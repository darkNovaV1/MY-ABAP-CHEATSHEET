# reading data from a file on the application server
```abap
*&---------------------------------------------------------------------*
*& Report ZPRG4_FILEHANDLING_201
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zprg4_filehandling_201.
TYPES: BEGIN OF lty_data,
         ono    TYPE  zdeono__28,
         odate  TYPE zdeodate__28,
         pm     TYPE zdepm__28,
         ta(10) TYPE c,
         curr   TYPE zdecur__28,
       END OF lty_data.

DATA: lt_data TYPE TABLE OF lty_data.
DATA: lwa_data TYPE lty_data.


DATA: lv_filename(20) TYPE c VALUE '/tmp/order.txt'.
DATA: lv_string TYPE string.
OPEN DATASET lv_filename FOR INPUT IN TEXT MODE ENCODING DEFAULT.
IF sy-subrc = 0.
  DO.
    READ DATASET lv_filename INTO lv_string.
    IF sy-subrc = 0.
      SPLIT lv_string AT '#' INTO lwa_data-ono lwa_data-odate lwa_data-pm lwa_data-ta lwa_data-curr.
      APPEND lwa_data TO lt_data.
      CLEAR: lwa_data.
    ELSE.
      EXIT.
    ENDIF.
  ENDDO.
ENDIF.

LOOP AT lt_data INTO lwa_data.
  WRITE: / lwa_data-ono, lwa_data-odate, lwa_data-pm, lwa_data-ta.
ENDLOOP.
```

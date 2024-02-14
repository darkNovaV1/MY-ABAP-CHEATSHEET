```abap
*&---------------------------------------------------------------------*
*& Report ZPRG_WRITE_APPLICATION

*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zprg_write_application.


TYPES: BEGIN OF lty_data,
         ono   TYPE  zdeono__28,
         odate TYPE zdeodate__28,
         pm    TYPE zdepm__28,
         ta    TYPE netwr,
         curr  TYPE zdecur__28,
       END OF lty_data.

DATA: lt_data TYPE TABLE OF lty_data.
DATA: lwa_data TYPE lty_data.
DATA: lv_filename(20) TYPE c VALUE '/tmp/order.txt'.
DATA: lv_string TYPE String.
DATA: lv_amount(10) TYPE c.

SELECT-OPTIONS : s_ono FOR lwa_data-ono.


SELECT ono odate pm ta curr
  FROM zordh__28
  INTO TABLE lt_data
  WHERE ono IN s_ono.


"Syntax to open a file. we want to write so we wewill use `for output`.
" text mode coz we are going for textfile
OPEN DATASET lv_filename for OUTPUT in TEXT MODE ENCODING DEFAULT.
if sy-subrc = 0.
  loop at lt_data INTO lwa_data.
    WRITE lwa_data-ta to lv_amount.
  CONCATENATE lwa_data-ono lwa_data-odate lwa_data-pm lv_amount INTO lv_string SEPARATED BY '#'.
  TRANSFER lv_string to lv_filename.
  ENDLOOP.
  CLOSE DATASET lv_filename.
ENDIF.
```

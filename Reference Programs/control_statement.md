![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/21741b61-8163-4cf2-9184-a5b3dc4168c0)
```abap
*&---------------------------------------------------------------------*
*& Report ZZAMAN_CS_00
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zzaman_cs_00.

TYPES: BEGIN OF ls_data,
         is_active TYPE abap_bool,
         id        TYPE i,
         name      TYPE string,
         amount    TYPE p DECIMALS 2,
       END OF ls_data.

data : ls_ZMN_USER type ZMN_USER.

DATA: lt_data TYPE TABLE OF ls_data,
      ls_data TYPE ls_data.

DATA : lv_total TYPE p DECIMALS 2,
       lv_sub   TYPE p DECIMALS 2.

PERFORM get_data.

" sorting is imp for control statement
SORT lt_data BY is_active DESCENDING.



LOOP AT lt_data INTO ls_data.
  " trigger at first iteration
  AT FIRST.
    WRITE : 9'ID ', 13 'NAME', 30'AMOUNT',38 'IS_ACTIVE'.
  ENDAT.

  " loop logic
  WRITE : / ls_data-id ,ls_data-name,20 ls_data-amount ,42 ls_data-is_active .
  lv_total = lv_total + ls_data-amount.
  lv_sub   = lv_sub + ls_data-amount.

  " trigger at new value of specifed field
  AT NEW is_active.
    write : 'New' color 3.
    lv_sub = 0.
  ENDAT.

  "trigger at last occurs of same value of field
  AT END OF is_active.
    WRITE : /9 'SUB TOTAL:'  COLOR 4 , lv_sub COLOR 4.
  ENDAT.
  " trigger at last iteration.
  AT LAST.
    WRITE :/ '-----------------------------------------------'.
    WRITE : /9 'NET AMOUNT :' COLOR 5 ,lv_total COLOR 5.
    CLEAR lv_total.
  ENDAT.

ENDLOOP.



*&---------------------------------------------------------------------*
*& Form get_data
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM get_data .
  ls_data-id = 1.
  ls_data-name = 'John'.
  ls_data-amount = '100.50'.
  ls_data-is_active = abap_true.
  APPEND ls_data TO lt_data.

  ls_data-id = 2.
  ls_data-name = 'Jane'.
  ls_data-amount = '200.75'.
  ls_data-is_active = abap_false.
  APPEND ls_data TO lt_data.

  ls_data-id = 3.
  ls_data-name = 'Alice'.
  ls_data-amount = '300.25'.
  ls_data-is_active = abap_true.
  APPEND ls_data TO lt_data.

  ls_data-id = 4.
  ls_data-name = 'Bob'.
  ls_data-amount = '150.20'.
  ls_data-is_active = abap_true.
  APPEND ls_data TO lt_data.

  ls_data-id = 5.
  ls_data-name = 'Eve'.
  ls_data-amount = '500.00'.
  ls_data-is_active = abap_false.
  APPEND ls_data TO lt_data.

  ls_data-id = 6.
  ls_data-name = 'Charlie'.
  ls_data-amount = '123.45'.
  ls_data-is_active = abap_true.
  APPEND ls_data TO lt_data.

  ls_data-id = 7.
  ls_data-name = 'David'.
  ls_data-amount = '250.60'.
  ls_data-is_active = abap_false.
  APPEND ls_data TO lt_data.

  ls_data-id = 8.
  ls_data-name = 'Grace'.
  ls_data-amount = '400.30'.
  ls_data-is_active = abap_true.
  APPEND ls_data TO lt_data.

  ls_data-id = 9.
  ls_data-name = 'Fiona'.
  ls_data-amount = '180.90'.
  ls_data-is_active = abap_true.
  APPEND ls_data TO lt_data.

  ls_data-id = 10.
  ls_data-name = 'Henry'.
  ls_data-amount = '350.75'.
  ls_data-is_active = abap_false.
  APPEND ls_data TO lt_data.

  ls_data-id = 11.
  ls_data-name = 'Isabel'.
  ls_data-amount = '420.15'.
  ls_data-is_active = abap_true.
  APPEND ls_data TO lt_data.

  ls_data-id = 12.
  ls_data-name = 'George'.
  ls_data-amount = '275.80'.
  ls_data-is_active = abap_true.
  APPEND ls_data TO lt_data.

  ls_data-id = 13.
  ls_data-name = 'Lucy'.
  ls_data-amount = '150.00'.
  ls_data-is_active = abap_false.
  APPEND ls_data TO lt_data.

  ls_data-id = 14.
  ls_data-name = 'Michael'.
  ls_data-amount = '600.25'.
  ls_data-is_active = abap_true.
  APPEND ls_data TO lt_data.

  ls_data-id = 15.
  ls_data-name = 'Olivia'.
  ls_data-amount = '380.40'.
  ls_data-is_active = abap_true.
  APPEND ls_data TO lt_data.

  ls_data-id = 16.
  ls_data-name = 'Paul'.
  ls_data-amount = '320.90'.
  ls_data-is_active = abap_false.
  APPEND ls_data TO lt_data.

  ls_data-id = 17.
  ls_data-name = 'Natalie'.
  ls_data-amount = '210.60'.
  ls_data-is_active = abap_true.
  APPEND ls_data TO lt_data.

  ls_data-id = 18.
  ls_data-name = 'Samuel'.
  ls_data-amount = '110.75'.
  ls_data-is_active = abap_true.
  APPEND ls_data TO lt_data.

  ls_data-id = 19.
  ls_data-name = 'Sophia'.
  ls_data-amount = '475.30'.
  ls_data-is_active = abap_false.
  APPEND ls_data TO lt_data.

  ls_data-id = 20.
  ls_data-name = 'William'.
  ls_data-amount = '340.25'.
  ls_data-is_active = abap_true.
  APPEND ls_data TO lt_data.
ENDFORM.
```

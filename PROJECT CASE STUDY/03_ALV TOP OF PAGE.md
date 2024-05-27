# ALV TOP OF PAGE

![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/852f242b-98d2-4f67-b6c6-d3ca3426fe0f)

whatever the name wepass here with same name we have to create sub routine.

![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/c2b1d44a-f7a0-4193-98db-99c1ea361987)

![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/e4c860e3-45d7-4c2f-830b-1559b4d1940a)
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/ce4c0c42-f95d-4d89-9739-a6c9acaad283)
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/3ae8eace-da16-4fb3-9e65-3d4cc535097f)
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/916577c1-4a02-4938-882e-9e84a4461579)

```abap
*&---------------------------------------------------------------------*
*& Report ZALV_VBAK_201
*&---------------------------------------------------------------------*
*& This report fetches sales order data from the VBAK table and displays
*& it in an ALV grid with automatic column width optimization and zebra
*& pattern. The ALV grid displays five columns: Sales Order, Creation Date,
*& Created By, Sales Org., and Dist. Channel.
*&---------------------------------------------------------------------*
REPORT zalv_vbak_201.

* Include the standard table VBAK to access sales order data
TABLES: vbak.


* Define a custom type to hold relevant fields from the VBAK table
TYPES: BEGIN OF ty_vbak,
         vbeln TYPE vbak-vbeln,   " Sales Order Number
       END OF ty_vbak.

TYPES: BEGIN OF ty_vbap,
         vbeln  TYPE vbap-vbeln,   " Sales Order Number
         posnr  TYPE vbap-posnr,
         matnr  TYPE vbap-matnr,
         kwmeng TYPE vbap-kwmeng,
         vrkme  TYPE vbap-vrkme,
       END OF ty_vbap.

TYPES: BEGIN OF ty_makt,
         matnr TYPE makt-matnr,   " Sales Order Number
         maktx TYPE makt-maktx,   " Sales Order Number
       END OF ty_makt.

TYPES: BEGIN OF ty_final,
         vbeln  TYPE vbak-vbeln,
         posnr  TYPE vbap-posnr,
         matnr  TYPE vbap-matnr,
         kwmeng TYPE vbap-kwmeng,
         vrkme  TYPE vbap-vrkme,
         maktx  TYPE makt-maktx,
       END OF ty_final.


* Internal table to hold the selected data from VBAK
DATA: it_vbak TYPE TABLE OF ty_vbak,
      wa_vbak TYPE ty_vbak.
DATA: it_makt TYPE TABLE OF ty_makt,
      wa_makt TYPE ty_makt.
* Internal table to hold the selected data from VBAK
DATA: it_vbap TYPE TABLE OF ty_vbap,
      wa_vbap TYPE ty_vbap,
      it_final TYPE TABLE of ty_final,
      wa_final TYPE ty_final.

* Layout structure for ALV grid display settings
DATA: ls_layout TYPE slis_layout_alv.

* Field catalog internal table and work area for ALV grid
DATA: gt_fieldcat TYPE slis_t_fieldcat_alv,
      gs_fieldcat TYPE slis_fieldcat_alv.



SELECTION-SCREEN: BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-000.
  SELECT-OPTIONS: s_erdat FOR vbak-erdat OBLIGATORY NO-EXTENSION.
  SELECT-OPTIONS: s_ernam FOR vbak-ernam NO INTERVALS NO-EXTENSION.

SELECTION-SCREEN: END OF BLOCK b1.


* Select data from VBAK table
START-OF-SELECTION.
  SELECT vbeln
    INTO TABLE it_vbak
    FROM vbak
    WHERE erdat IN s_erdat AND ernam IN s_ernam.

  IF it_vbak IS NOT INITIAL.
    SELECT vbeln
           posnr
           matnr
           kwmeng
           vrkme FROM vbap
           INTO TABLE it_vbap
      FOR ALL ENTRIES IN it_vbak
      WHERE vbeln = it_vbak-vbeln.

    IF it_vbap IS NOT INITIAL.
      SELECT matnr
             maktx FROM makt
             INTO TABLE it_makt
             FOR ALL ENTRIES IN it_vbap
             WHERE matnr = it_vbap-matnr.
    ENDIF.

  ENDIF.

sort it_vbap by vbeln.
sort it_vbap by matnr.
  LOOP AT it_vbak INTO wa_vbak.
  wa_final-vbeln = wa_vbak-vbeln.
  loop at it_vbap INTO wa_vbap where vbeln = wa_final-vbeln .
  wa_final-posnr = wa_vbap-posnr.
  wa_final-matnr = wa_vbap-matnr.
  wa_final-kwmeng = wa_vbap-kwmeng.
  wa_final-vrkme = wa_vbap-vrkme.
  READ TABLE it_makt into wa_makt WITH KEY matnr = wa_final-matnr BINARY SEARCH.
  wa_final-maktx = wa_makt-maktx.
  ENDLOOP.
   APPEND wa_final TO it_final.
  clear: wa_Final.
  ENDLOOP.



* Build the field catalog manually
INITIALIZATION.

PERFORM prepare_fieldcat USING '1' 'VBELN' 'SALES ORDER' CHANGING gt_fieldcat. "double click prepare.. and create it first time
PERFORM prepare_fieldcat USING '2' 'POSNR' 'item no' CHANGING gt_fieldcat.
PERFORM prepare_fieldcat USING '3' 'MATNR' 'Material No' CHANGING gt_fieldcat.
PERFORM prepare_fieldcat USING '4' 'MAKTX' 'Material Description' CHANGING gt_fieldcat.
PERFORM prepare_fieldcat USING '5' 'KWMENG' 'Quantity' CHANGING gt_fieldcat.
PERFORM prepare_fieldcat USING '6' 'VRKME' 'UOM' CHANGING gt_fieldcat.



END-OF-SELECTION.
  PERFORM display_alv.

* Form to display ALV grid
FORM display_alv.

* Enable automatic column width optimization
  ls_layout-colwidth_optimize = 'X'.

* Enable zebra pattern (alternating row colors)
  ls_layout-zebra = 'X'.

* Call the function module to display the ALV grid
  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
      is_layout     = ls_layout    " Layout settings
      it_fieldcat   = gt_fieldcat  " Field catalog
      i_callback_program = sy-repid "always pass
      i_callback_top_of_page = 'TOP_OF_PAGE' "always create same name perform (subroutine)
    TABLES
      t_outtab      = it_final      " Data to be displayed
    EXCEPTIONS
      program_error = 1
      OTHERS        = 2.
  IF sy-subrc <> 0.
    " Implement suitable error handling here
    MESSAGE 'ALV display failed' TYPE 'E'.
  ENDIF.

ENDFORM.


""for top of page
FORM TOP_OF_PAGE.

*call pattern
DATA lt_list TYPE SLIS_T_LISTHEADER.
DATA lwa_list  TYPE SLIS_LISTHEADER.
DATA lv_date(24) TYPE c.

lwa_list-typ = 'H'. "for header, here key will be ignored
lwa_list-Info = 'SO Item Details.'.
APPEND lwa_list TO lt_list.

IF s_erdat-low is NOT INITIAL AND s_erdat-high is INITIAL.
  CONCATENATE s_erdat-low+6(2) '.' s_erdat-low+4(2) '.' s_erdat-low+0(4) INTO DATA(lv_low).
 lwa_list-typ = 'S'. "for key value pair
 lwa_list-key = 'SO CREATION DATE : '.
 lwa_list-info = lv_low.
 APPEND lwa_list to lt_list.
ENDIF.

IF s_erdat-low is NOT INITIAL AND s_erdat-high is NOT INITIAL.
  CONCATENATE s_erdat-low+6(2) '.' s_erdat-low+4(2) '.' s_erdat-low+0(4) INTO DATA(lv_low1).
  CONCATENATE s_erdat-high+6(2) '.' s_erdat-high+4(2) '.' s_erdat-high+0(4) INTO DATA(lv_high).
  CONCATENATE lv_low1 'to' lv_high INTO lv_Date SEPARATED BY space.
 lwa_list-typ = 'S'. "for key value pair
 lwa_list-key = 'SO CREATION DATE : '.
 lwa_list-info = lv_date.
 APPEND lwa_list to lt_list.
ENDIF.

IF s_Ernam is NOT INITIAL.
lwa_list-typ = 'S'. "for key value pair
 lwa_list-key = 'SO CREATED BY : '.
 lwa_list-info = s_ernam-low.
 APPEND lwa_list to lt_list.
ENDIF.
 lwa_list-typ = 'A'. "for italic text
 lwa_list-info = 'This is ALV Interactive Report'.
 APPEND lwa_list to lt_list.



CALL FUNCTION 'REUSE_ALV_COMMENTARY_WRITE'
  EXPORTING
    it_list_commentary       = lt_list. "will write name and declare above by checking type from FM import paramaeter also wa'


endform.



*&---------------------------------------------------------------------*
*& Form prepare_fieldcat
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*&      --> P_
*&      --> P_
*&      --> P_
*&      <-- GT_FIELDCAT
*&---------------------------------------------------------------------*
FORM prepare_fieldcat  USING   pv_colpos
                               pv_fieldname
                               pv_text
                       CHANGING pt_fieldcat TYPE SLIS_T_FIELDCAT_ALV.

  gs_fieldcat-col_pos = pv_colpos.
  gs_fieldcat-fieldname = pv_fieldname.
  gs_fieldcat-seltext_m = pv_text.  " Column header text
  APPEND gs_fieldcat TO gt_fieldcat.


ENDFORM.
```

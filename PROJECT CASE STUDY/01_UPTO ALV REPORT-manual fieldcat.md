
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

* Add field VBELN (Sales Order) to the field catalog
  gs_fieldcat-fieldname = 'VBELN'.
  gs_fieldcat-seltext_m = 'Sales Order'.  " Column header text
  gs_fieldcat-outputlen = 10.             " Column width
  APPEND gs_fieldcat TO gt_fieldcat.

* Add field ERDAT (Creation Date) to the field catalog
  gs_fieldcat-fieldname = 'POSNR'.
  gs_fieldcat-seltext_m = 'item no'.
  gs_fieldcat-outputlen = 10.
  APPEND gs_fieldcat TO gt_fieldcat.

* Add field ERNAM (Created By) to the field catalog
  gs_fieldcat-fieldname = 'MATNR'.
  gs_fieldcat-seltext_m = 'Material No'.
  gs_fieldcat-outputlen = 12.
  APPEND gs_fieldcat TO gt_fieldcat.

* Add field VKORG (Sales Org.) to the field catalog
  gs_fieldcat-fieldname = 'MAKTX'.
  gs_fieldcat-seltext_m = 'Material Description.'.
  gs_fieldcat-outputlen = 4.
  APPEND gs_fieldcat TO gt_fieldcat.

* Add field VTWEG (Dist. Channel) to the field catalog
  gs_fieldcat-fieldname = 'KWMENG'.
  gs_fieldcat-seltext_m = 'Quantity'.
  gs_fieldcat-outputlen = 2.
  APPEND gs_fieldcat TO gt_fieldcat.

    gs_fieldcat-fieldname = 'VRKME'.
    gs_fieldcat-seltext_m = 'UOM'.
    gs_fieldcat-outputlen = 2.
    APPEND gs_fieldcat TO gt_fieldcat.

* Display the ALV grid
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

```

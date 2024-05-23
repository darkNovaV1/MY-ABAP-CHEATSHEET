
```abap
*&---------------------------------------------------------------------*
*& Report ZALV_VBAK_201
*&---------------------------------------------------------------------*
*& This report fetches sales order data from the VBAK table and displays
*& it in an ALV grid with automatic column width optimization and zebra
*& pattern. The ALV grid displays five columns: Sales Order, Creation Date,
*& Created By, Sales Org., and Dist. Channel.
*&---------------------------------------------------------------------*
REPORT ZALV_VBAK_201.

* Include the standard table VBAK to access sales order data
TABLES: vbak.

* Define a custom type to hold relevant fields from the VBAK table
TYPES: BEGIN OF ty_vbak,
         vbeln TYPE vbak-vbeln,   " Sales Order Number
         erdat TYPE vbak-erdat,   " Date on which the record was created
         ernam TYPE vbak-ernam,   " Name of the person who created the record
         vkorg TYPE vbak-vkorg,   " Sales Organization
         vtweg TYPE vbak-vtweg,   " Distribution Channel
       END OF ty_vbak.

* Internal table to hold the selected data from VBAK
DATA: it_vbak TYPE TABLE OF ty_vbak,
      wa_vbak TYPE ty_vbak.

* Layout structure for ALV grid display settings
DATA: ls_layout TYPE slis_layout_alv.

* Field catalog internal table and work area for ALV grid
DATA: gt_fieldcat TYPE slis_t_fieldcat_alv,
      gs_fieldcat TYPE slis_fieldcat_alv.

* Select data from VBAK table
START-OF-SELECTION.
  SELECT vbeln
         erdat
         ernam
         vkorg
         vtweg
    INTO TABLE it_vbak
    FROM vbak
    UP TO 10 ROWS.  " Limit the number of rows fetched to 10 for demo purposes

* Build the field catalog manually
INITIALIZATION.

* Add field VBELN (Sales Order) to the field catalog
  gs_fieldcat-fieldname = 'VBELN'.
  gs_fieldcat-seltext_m = 'Sales Order'.  " Column header text
  gs_fieldcat-outputlen = 10.             " Column width
  APPEND gs_fieldcat TO gt_fieldcat.

* Add field ERDAT (Creation Date) to the field catalog
  gs_fieldcat-fieldname = 'ERDAT'.
  gs_fieldcat-seltext_m = 'Creation Date'.
  gs_fieldcat-outputlen = 10.
  APPEND gs_fieldcat TO gt_fieldcat.

* Add field ERNAM (Created By) to the field catalog
  gs_fieldcat-fieldname = 'ERNAM'.
  gs_fieldcat-seltext_m = 'Created By'.
  gs_fieldcat-outputlen = 12.
  APPEND gs_fieldcat TO gt_fieldcat.

* Add field VKORG (Sales Org.) to the field catalog
  gs_fieldcat-fieldname = 'VKORG'.
  gs_fieldcat-seltext_m = 'Sales Org.'.
  gs_fieldcat-outputlen = 4.
  APPEND gs_fieldcat TO gt_fieldcat.

* Add field VTWEG (Dist. Channel) to the field catalog
  gs_fieldcat-fieldname = 'VTWEG'.
  gs_fieldcat-seltext_m = 'Dist. Channel'.
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
      t_outtab      = it_vbak      " Data to be displayed
    EXCEPTIONS
      program_error = 1
      OTHERS        = 2.
  IF sy-subrc <> 0.
    " Implement suitable error handling here
    MESSAGE 'ALV display failed' TYPE 'E'.
  ENDIF.

ENDFORM.


```

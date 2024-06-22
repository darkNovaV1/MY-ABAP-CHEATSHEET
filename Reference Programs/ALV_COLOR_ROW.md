# color alv rows
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/d4868822-5b34-432c-af67-34a2dc8346f8)

```abap
*&---------------------------------------------------------------------*
*& Report ZZAMAN_ALV_TEST_00
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zzaman_alv_field_color.

* DEFINE STRUCTURE

TYPES : BEGIN OF ty_item,
          vbeln LIKE  vbap-vbeln,
          posnr LIKE  vbap-posnr,
          matnr LIKE  vbap-matnr,
          matkl LIKE  vbap-matkl,
          netwr LIKE  vbap-netwr,
        END OF ty_item.

TYPES : BEGIN OF ty_final,
          vbeln          LIKE  vbap-vbeln,
          posnr          LIKE  vbap-posnr,
          matnr          LIKE  vbap-matnr,
          matkl          LIKE  vbap-matkl,
          netwr          LIKE  vbap-netwr,
          field_color TYPE  slis_t_specialcol_alv, " table which will store field color
        END OF  ty_final.

" creating internal table and work area fieldcatalog
DATA : it_fieldcat TYPE  slis_t_fieldcat_alv,
       wa_fieldcat TYPE slis_fieldcat_alv.
DATA: ls_layout TYPE slis_layout_alv.

DATA: it_item TYPE TABLE OF ty_item,
      wa_item TYPE ty_item.

DATA : it_final TYPE TABLE OF ty_final,
       wa_final TYPE ty_final.

" work area to fill field name and its color
DATA : wa_field_color TYPE slis_specialcol_alv.


SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
  SELECT-OPTIONS s_vbeln FOR wa_item-vbeln.
SELECTION-SCREEN END OF BLOCK b1.


START-OF-SELECTION.

************ GET data *******************
  SELECT vbeln
         posnr
         matnr
         matkl
         netwr
    FROM vbap
    INTO TABLE it_item
    WHERE vbeln IN s_vbeln.

*********** Process Data ***************


  " fill color field as per logic
  LOOP AT it_item INTO wa_item.

    wa_final-vbeln =  wa_item-vbeln.
    wa_final-matkl =  wa_item-matkl.
    wa_final-netwr =  wa_item-netwr.
    wa_final-matnr =  wa_item-matnr.
    wa_final-posnr =  wa_item-posnr.

    " filling field color and name as per condition.
    IF wa_final-netwr < 1000.
      CLEAR: wa_field_color.
      wa_field_color-fieldname = 'NETWR'.
      wa_field_color-color-col = 6.
      wa_field_color-color-int = 1.
      APPEND wa_field_color TO wa_final-field_color.


    ELSEIF wa_final-netwr > 999 AND wa_final-netwr < 10000.
      CLEAR: wa_field_color.
      wa_field_color-fieldname = 'NETWR'.
      wa_field_color-color-col = 3.
      wa_field_color-color-int = 1.
      APPEND wa_field_color TO wa_final-field_color.

    ELSE.
      CLEAR: wa_field_color.
      wa_field_color-fieldname = 'NETWR'.
      wa_field_color-color-col = 5.
      wa_field_color-color-int = 1.
      APPEND wa_field_color TO wa_final-field_color.
    ENDIF.

    APPEND wa_final TO it_final.
     clear : wa_final.
  ENDLOOP.

*************** Catalog******************
  wa_fieldcat-fieldname = 'VBELN'.
  wa_fieldcat-seltext_m = 'Sales Order'.
  APPEND wa_fieldcat TO it_fieldcat.
  CLEAR wa_fieldcat.

  wa_fieldcat-fieldname = 'POSNR'.
  wa_fieldcat-seltext_m = 'Sales Item'.
  APPEND wa_fieldcat TO it_fieldcat.
  CLEAR wa_fieldcat.

  wa_fieldcat-fieldname = 'MATNR'.
  wa_fieldcat-seltext_m = 'Material Number'.
  wa_fieldcat-emphasize = 'C110'.
  APPEND wa_fieldcat TO it_fieldcat.
  CLEAR wa_fieldcat.

  wa_fieldcat-fieldname = 'MATKL'.
  wa_fieldcat-seltext_m = 'Material Group'.
  APPEND wa_fieldcat TO it_fieldcat.
  CLEAR wa_fieldcat.

    wa_fieldcat-fieldname = 'NETWR'.
  wa_fieldcat-seltext_m = 'NET VALUE'.
  APPEND wa_fieldcat TO it_fieldcat.
  CLEAR wa_fieldcat.

  CLEAR : ls_layout.
*  ls_layout-info_fieldname = 'LINE_COLOR'.  " added color field name to layout
   ls_layout-coltab_fieldname = 'FIELD_COLOR'. " added color to specific field of row

***************  Display **********************

  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
      is_layout     = ls_layout
      it_fieldcat   = it_fieldcat
    TABLES
      t_outtab      = it_final
    EXCEPTIONS
      program_error = 1
      OTHERS        = 2.
  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.
```

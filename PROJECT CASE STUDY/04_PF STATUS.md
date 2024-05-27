![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/3d928f46-eff9-4873-bfd9-e78071742520)# PF STATUS
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/c1ac7301-ee08-42ae-9570-a9aa8c67a8e1)
#### - two buttons one for display output in smartform and one for adobeform.

![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/24e0a0e3-79fb-4907-bd24-a0af8f85a9d1)
- uncomment and give any name to pf status
- just make sure you create the sub routine with the same exact name
- make sure program name is passed
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/7721e99b-2363-471e-8e1d-a4701a3291d2)

```abap
FORM PF_STATUS USING RT_EXTAB TYPE SLIS_T_EXTAB.

ENDFORM.
```
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/9f2ceff4-95ab-4735-aa1c-e19864103bff)

double click 
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/87e26e6c-4695-4017-8dc4-39609a6186a3)
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/fb056c9e-05db-4354-a747-bea89c27742f)

- it will act as the functin code of the button. then doube click and tick
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/1a5a03c6-b92d-47fd-8bfc-9ab614e88f03)
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/90e70bde-e752-48c8-86cc-20d0cbdd0164)
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/97fe78f1-d85e-48c1-b5a6-fbc2690a73f7)
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/656b3b33-8938-43eb-b05a-3c5086ca9790)
## - activate and back

![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/6553c684-3b60-4734-a8c0-df00cc9de89f)
- # now sap functionalities are not working
- goto pf status from set pf and write back
- save and activate

# upto PF STATUS

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
      i_callback_pf_status_set = 'PF_STATUS'
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


*##############################for pf status

FORM PF_STATUS USING RT_EXTAB TYPE SLIS_T_EXTAB.
set PF-STATUS 'SALES'. "type,double hit and create

ENDFORM.


*##############################for pf status


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

##############################################################
# USER COMMAND
##############################################################😎

![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/3f1ad274-1d66-4522-b0ac-223be879d227)

- whenever user will clikcs this means user want to see output in smart of adobe forms means user is giving command to display the output so now wll see the user commands.
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/9a96d4bc-45d9-4984-8793-cc987c44ceaf)
- uncomment and give any name 

```abap
FORM USER_CMD USING R_UCOMM LIKE SY-UCOMM
                                 RS_SELFIELD TYPE SLIS_SELFIELD.
ENDFORM.
```

![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/a69f0cc8-fdd6-4c58-96da-01713bd5147d)

![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/33873b40-dbf4-49cf-9bf6-33dd35e1335d)

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
      i_callback_top_of_page = 'TOP_OF_PAGE' "always create same name perform (subroutine) for all callbacks mostly
      i_callback_pf_status_set = 'PF_STATUS'
      i_callback_user_command = 'USER_CMD'
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


*##############################for pf status

FORM PF_STATUS USING RT_EXTAB TYPE SLIS_T_EXTAB.
set PF-STATUS 'SALES'. "type,double hit and create

ENDFORM.


*##############################for pf status

*##############################for user command

FORM USER_CMD USING R_UCOMM LIKE SY-UCOMM
                                 RS_SELFIELD TYPE SLIS_SELFIELD.
  
  IF R_UCOMM = 'SMARTFORMS'.

  ENDIF.
  
   IF R_UCOMM = 'ADOBEFORMS'.

  ENDIF.
  
ENDFORM.
*##############################for user command




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

















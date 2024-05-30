#SMARTFORMS
- now we will start creating the SMARTFORM.
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/a673c4a7-a04e-4f5f-adb5-4ff1af44ebba)
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/66f2e9a6-85b1-4a45-b8b3-8aafe24f5f44)
- we will need to pass all this things from report to smartform using interface.
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/6838585d-8922-4ae8-b6e1-4d9bff641232)
- now for internal table we need to declare global structure.
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/69b04a32-234e-4208-8f9f-dcd216349fce)
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/e76d45ac-5929-408e-a81c-5acea2821d67)
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/560479f9-7af3-48fc-8066-c88ba7d08f80)
- now we will create 3 different windows for this three different parts.
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/e698f454-584c-43ac-bbaf-571e59ba9952)


![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/5106efa1-3775-44dd-92ce-f580bf62085a)
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/e08a2f8f-642f-417b-9e27-1b5af5a2a7f5)
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/ccb312c7-661c-4b84-89a5-2e8f52ff6408)
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/91c8d53f-9d00-4beb-9706-394ab32ffcb8)

![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/30020c2a-02c2-43d2-91ca-c33b460f58f7)
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/7806576b-0f3f-48c8-9736-d1653b42834a)

![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/485978f2-cdc4-42e1-ad52-ed4bb9a8e1d1)
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/7c9e574d-17a9-48c9-989d-665b0a86bb24)
 ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/855a4795-2542-4b6c-a929-bdd53f9c02f6)
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/f81b4513-990e-4f82-bedd-664faa41f9ad)
- we are importing from smartform table data
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/23a0df9e-6fb4-4b3e-afe2-0c6a27cf1f62)
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/45920a68-e0a0-44c9-921a-6e2281896ae9)
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/ca77f7d2-0824-4c2f-b11b-f328adb35d24)
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/6f6465b7-5690-4e44-8b24-6c5e2a18f48f)
- now program and smartform both are ready
- now we need to link them together.
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/cad73e73-6585-45ff-86b5-b62fa575cbb5)

```abap
IF R_UCOMM = 'SMARTFORMS'.
*DATA ARCHIVE_INDEX        TYPE TOA_DARA.
*DATA ARCHIVE_INDEX_TAB    TYPE TSFDARA.
*DATA ARCHIVE_PARAMETERS   TYPE ARC_PARAMS.
*DATA CONTROL_PARAMETERS   TYPE SSFCTRLOP.
*DATA MAIL_APPL_OBJ        TYPE SWOTOBJID.
*DATA MAIL_RECIPIENT       TYPE SWOTOBJID.
*DATA MAIL_SENDER          TYPE SWOTOBJID.
*DATA OUTPUT_OPTIONS       TYPE SSFCOMPOP.
*DATA USER_SETTINGS        TYPE TDBOOL.
*DATA PERDAT_LOW           TYPE ERDAT.
*DATA PERDAT_HIGH          TYPE ERDAT.
*DATA PERNAM               TYPE ERNAM.
*DATA LT_OUTPUT            TYPE ZTSTR_OUTPUT.
*DATA DOCUMENT_OUTPUT_INFO TYPE SSFCRESPD.
*DATA JOB_OUTPUT_INFO      TYPE SSFCRESCL.
*DATA JOB_OUTPUT_OPTIONS   TYPE SSFCRESOP.

      CALL FUNCTION '/1BCDWB/SF00000159'
        EXPORTING
*         ARCHIVE_INDEX              = ARCHIVE_INDEX
*         ARCHIVE_INDEX_TAB          = ARCHIVE_INDEX_TAB
*         ARCHIVE_PARAMETERS         = ARCHIVE_PARAMETERS
*         CONTROL_PARAMETERS         = CONTROL_PARAMETERS
*         MAIL_APPL_OBJ              = MAIL_APPL_OBJ
*         MAIL_RECIPIENT             = MAIL_RECIPIENT
*         MAIL_SENDER                = MAIL_SENDER
*         OUTPUT_OPTIONS             = OUTPUT_OPTIONS
*         USER_SETTINGS              = 'X'
          perdat_low                 = perdat_low
          perdat_high                = perdat_high
          pernam                     = pernam
          lt_output                  = lt_output
*       IMPORTING
*         DOCUMENT_OUTPUT_INFO       = DOCUMENT_OUTPUT_INFO
*         JOB_OUTPUT_INFO            = JOB_OUTPUT_INFO
*         JOB_OUTPUT_OPTIONS         = JOB_OUTPUT_OPTIONS
*       EXCEPTIONS
*         FORMATTING_ERROR           = 1
*         INTERNAL_ERROR             = 2
*         SEND_ERROR                 = 3
*         USER_CANCELED              = 4
*         OTHERS                     = 5
                .
      IF sy-subrc <> 0.
* Implement suitable error handling here
      ENDIF.
      
  ENDIF.
```
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/0b78c5c0-cf4c-4e0e-bbc5-7478adb9e02a)

- from program we are exporting the value to this function module.

- now we will call SSF_FUNCTION_MODULE_NAME and replace this hardcoded value as it can causes error.

- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/9275c879-6ee3-4536-a707-15bd49ba76cb)

# requirement
- now customer want to see the print directly by clicking on the button
 ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/5308b110-b665-4c5e-9555-5bb941447556)
 - customer need to bypass to select print preview and output device and all....


## solution
-
-![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/9c355423-4307-4dc3-912f-af1bbe43e08c)
- we will uncomment control parameters and output parameters.
- ** ### why workarea against control parameters?**
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/e69815d8-d40e-4e0c-9fc0-e1984e550b6e)
- control parameters is of type this.
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/4e00a471-0e56-4bd4-952c-41044e498ce2)
- and thats a structure type.
- and whenever is of type structure type its always a workarea.
- if its table type then its internal table..
# so
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/fb2214f5-0f78-4f17-a363-5c3ca81e4ff2)
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/d466d7cb-3a5e-40d0-9c38-480166fc8dfc)
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/ba5e5826-f2ab-4aad-ab43-3acf3b78ab3d)
- now we will pass this both to true of control parameters.
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/fd63ec2e-97c7-44f3-b986-f6c49f397dba)
- ## this is not enough #🙄
- because its still taking the default one..
- if we want whatever we pass sap would consider that..
- just pass the USER SETTING TO SPACE  -> ' '.
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/8f425d32-8258-4e89-b0c8-aabbf3b34d1b)
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/5eed637f-04c7-44d2-ac9d-c9a2aff57197)
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/fb89532a-f7ad-434b-a1a3-96022cc3108e)


  # requirement 3 - SMART STYLING

  - ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/ffd559d0-7389-40d1-b0e5-91705ce0d106)
 - header wala will be by default whereever you just apply style in outout option  and not in text.


# till smartform
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
*      it_final TYPE TABLE of ty_final,
      it_final TYPE ZTSTR_OUTPUT,
      wa_final TYPE ZSTR_OUTPUT.

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
*DATA FORMNAME    TYPE TDSFNAME.
*DATA VARIANT     TYPE TDVARIANT.
*DATA DIRECT_CALL TYPE TDBOOL.
DATA lv_fname     TYPE RS38L_FNAM.
DATA lwa_control_parameters TYPE SSFCTRLOP.
DATA lwa_output_options type SSFCOMPOP.

  IF R_UCOMM = 'SMARTFORMS'.
 CALL FUNCTION 'SSF_FUNCTION_MODULE_NAME'
     EXPORTING
       formname                 = 'ZSF_SALESORD' "smartform name
*      VARIANT                  = ' '
*      DIRECT_CALL              = ' '
    IMPORTING
      FM_NAME                  = lv_fname
    EXCEPTIONS
      NO_FORM                  = 1
      NO_FUNCTION_MODULE       = 2
      OTHERS                   = 3
             .
   IF sy-subrc <> 0.
* Implement suitable error handling here
   ENDIF.

   lwa_control_parameters-no_dialog = 'X'.
   lwa_control_parameters-preview = 'X'.
   lwa_output_options-tddest = 'LP01'.


      CALL FUNCTION lv_fname
        EXPORTING
         CONTROL_PARAMETERS         = lwa_control_parameters
*         MAIL_APPL_OBJ              = MAIL_APPL_OBJ
*         MAIL_RECIPIENT             = MAIL_RECIPIENT
*         MAIL_SENDER                = MAIL_SENDER
         OUTPUT_OPTIONS             = lwa_output_options
         USER_SETTINGS              = ' '
          perdat_low                 = s_erdat-low
          perdat_high                = s_erdat-high
          pernam                     = s_ernam-low
          lt_output                  = it_final
*       IMPORTING
*         DOCUMENT_OUTPUT_INFO       = DOCUMENT_OUTPUT_INFO
*         JOB_OUTPUT_INFO            = JOB_OUTPUT_INFO
*         JOB_OUTPUT_OPTIONS         = JOB_OUTPUT_OPTIONS
       EXCEPTIONS
         FORMATTING_ERROR           = 1
         INTERNAL_ERROR             = 2
         SEND_ERROR                 = 3
         USER_CANCELED              = 4
         OTHERS                     = 5
                .
      IF sy-subrc <> 0.
* Implement suitable error handling here
      ENDIF.

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





 





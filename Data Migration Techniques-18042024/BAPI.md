# BAPI 
  - 27/04/2024

![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/1235c6b0-9d82-4593-99d0-fc6814ba41f4)
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/a43a58b8-ea83-4fdb-acef-923ec81d5e09)

    
# we will go for the same requirement we will upload the data of material master using BAPI.

- wt we did in our previous program -BDC
- 1. we are getting the filename
     - ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/4a4543a3-694a-4d61-a96d-98dacd37a818)
  2. we read the data in the file using gui upload function module
     - ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/f5638a79-7ed4-4d5a-9108-c36567a0e50b)
  3. once we get the data in this internal table we use the recording for each and every record.
     - ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/fabac18f-6ea4-43a4-aa03-ba6194ef268c)

  - **till reading the data of the file the process will remain the same here**

  - **_to uplaad the material data into sap, sap already provided bapi_**
-![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/ffdb7c56-2d4a-4067-9904-1bda276673e1)

bapi has so many parameteres, we pass those which required.
- we have to find ut what parameteres are useful to us.
-![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/0a88a15c-586a-4834-a20b-ccac601d2a2f)
- now we willl pass the data to the bapi parameters.

  # ABAP PROGRAM

```abap
*&---------------------------------------------------------------------*
*& Report ZPRG_UPLOAD_MATDATA_201
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZPRG_UPLOAD_MATDATA_201.


TYPES: BEGIN OF lty_data,
  matnr TYPE matnr,
  mbrsh TYPE mbrsh,
  mtart type mtart,
  maktx TYPE maktx,
  meins TYPE meins,
  END OF lty_data.

  DATA: lt_data TYPE table of lty_data,
        lwa_data TYPE lty_data.

  DATA: lv_file TYPE string.
  DATA LWA_HEADDATA              TYPE BAPIMATHEAD.
  DATA LWA_CLIENTDATA           TYPE BAPI_MARA.
  DATA LWA_CLIENTDATAX           TYPE BAPI_MARAX.
  DATA LT_MATERIALDESCRIPTION   TYPE STANDARD TABLE OF BAPI_MAKT.
  DATA LWA_MATERIALDESCRIPTION   TYPE  BAPI_MAKT.
  DATA LWA_RETURN                TYPE BAPIRET2.
  DATA LT_RETURN                TYPE table of BAPIRET2.

PARAMETERS: p_file TYPE localfile.

at SELECTION-SCREEN on VALUE-REQUEST FOR p_file.

*DATA PROGRAM_NAME  TYPE SY-REPID.
*DATA DYNPRO_NUMBER TYPE SY-DYNNR.
*DATA FIELD_NAME    TYPE DYNPREAD-FIELDNAME.
*DATA FILE_NAME     TYPE IBIPPARMS-PATH.

  CALL FUNCTION 'F4_FILENAME'
   EXPORTING
     PROGRAM_NAME        = SYST-CPROG
     DYNPRO_NUMBER       = SYST-DYNNR
     FIELD_NAME          = ' '
   IMPORTING
     FILE_NAME           = p_file "file name
            .
  START-OF-SELECTION.

lv_file = p_file.

  CALL FUNCTION 'GUI_UPLOAD'
    EXPORTING
      filename                      = lv_file "file name
*     FILETYPE                      = 'ASC'
     HAS_FIELD_SEPARATOR           = 'X' " because we have data seperated with tab
*     HEADER_LENGTH                 = 0
*     READ_BY_LINE                  = 'X'
*     DAT_MODE                      = ' '
*     CODEPAGE                      = ' '
*     IGNORE_CERR                   = ABAP_TRUE
*     REPLACEMENT                   = '#'
*     CHECK_BOM                     = ' '
*     VIRUS_SCAN_PROFILE            = VIRUS_SCAN_PROFILE
*     NO_AUTH_CHECK                 = ' '
*   IMPORTING
*     FILELENGTH                    = FILELENGTH
*     HEADER                        = HEADER
    TABLES
      data_tab                      = lt_data "it will return the data in this internal table, we need to declare this internal table.
*   CHANGING
*     ISSCANPERFORMED               = ' '
   EXCEPTIONS
     FILE_OPEN_ERROR               = 1
     FILE_READ_ERROR               = 2
     NO_BATCH                      = 3
     GUI_REFUSE_FILETRANSFER       = 4
     INVALID_TYPE                  = 5
     NO_AUTHORITY                  = 6
     UNKNOWN_ERROR                 = 7
     BAD_DATA_FORMAT               = 8
     HEADER_NOT_ALLOWED            = 9
     SEPARATOR_NOT_ALLOWED         = 10
     HEADER_TOO_LONG               = 11
     UNKNOWN_DP_ERROR              = 12
     ACCESS_DENIED                 = 13
     DP_OUT_OF_MEMORY              = 14
     DISK_FULL                     = 15
     DP_TIMEOUT                    = 16
     OTHERS                        = 17
            .
  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.
  WRITE 1.

  " till here we have get the data into LT_DATA table and 1 by 1 we will pass to the particular BAPI

  "so we'll loop at the internal table.

  loop at lt_data INTO lwa_data.

  "one by 1 we are passing values to the bapi parameters.
  "first record we are passing to various parameters and various parameters we are passing to bapi
  " and BAPI will return the result in the return parameter.

lwa_headdata-material = lwa_data-matnr.
lwa_headdata-ind_sector = lwa_data-mbrsh.
lwa_headdata-matl_type = lwa_data-mtart.
lwa_headdata-basic_view = 'X'.

"now our unit of measure is in client data

 lwa_clientdata-base_uom = lwa_data-meins.
 lwa_clientdatax-base_uom = 'X'.

 lwa_materialdescription-langu = sy-langu.
 lwa_materialdescription-matl_desc = lwa_data-maktx.
 APPEND lwa_materialdescription to lt_materialdescription.
 CLEAR: lwa_materialdescription. "always clear wa's after appending.


    CALL FUNCTION 'BAPI_MATERIAL_SAVEDATA'
      EXPORTING
        headdata                    = lwa_headdata
        CLIENTDATA                  = lwa_CLIENTDATA "our unit of measurement is here so use this
        CLIENTDATAX                 = lwa_CLIENTDATAX "pass capital x then only sap consider clientdata.  
     IMPORTING
       RETURN                      = lwa_RETURN "we will get the result here,which at end of loop will append to lt_result so we can see at last.
     TABLES
       MATERIALDESCRIPTION         = LT_MATERIALDESCRIPTION
              .

  APPEND lwa_return to lt_return. "appending ls_Result here so at last we can monitor.
  CLEAR: lwa_Return,lwa_headdata,lwa_clientdatax,lwa_clientdatax.
  refresh: lt_materialdescription. "bcoz from second time third time onwards we want only specific description and not all so
                                   " before new loop begins we need to clear internal table.

  ENDLOOP.

  LOOP at lt_Return INTO lwa_Return.
    WRITE: / lwa_return-message .
    ENdloop.
```





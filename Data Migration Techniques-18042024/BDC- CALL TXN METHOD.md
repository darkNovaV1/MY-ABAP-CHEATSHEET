# Data Migration Techniques

![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/15cc9e8e-a4a5-46f6-bd2f-9c9e70bd8dc3)
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/fd3f4f86-19a1-4e9d-ae32-5b471ea951e1)


>[!NOTE]
>Batch data communication in data migration refers to the process of transferring data in chunks or batches, rather than transferring all the data at once. It is commonly used in scenarios where large volumes of data need to be migrated between systems.
>
>Here's an example to illustrate batch data communication in data migration:
>
>Let's say you have a source database system ("OldDB") and a target database system ("NewDB"), and you need to migrate a large table called "Customers" from OldDB to NewDB. The Customers table contains millions of records.
>
>To perform batch data communication in this data migration process, you can follow these steps:
>
>Define the batch size: Determine the number of records to be transferred in each batch. For example, let's set the batch size to 10,000 records.
>
>Extract data in batches: In OldDB, extract the data from the Customers table in batches of 10,000 records. You can use SQL queries with a combination of OFFSET and FETCH NEXT clauses or any other method supported by the database system to retrieve the data in batches.
>
>Transfer the data: Once you have extracted a batch of records from OldDB, transfer the data to NewDB. This can be done using various methods such as bulk insert, ETL (Extract, Transform, Load) tools, or custom scripts.
>
>Load the data: In NewDB, load the transferred data into the Customers table. Again, use techniques like bulk insert or the appropriate data loading mechanism provided by the database system.
>
>Repeat the process: Repeat steps 2 to 4 until all the data from the Customers table has been migrated. Each batch of data is extracted, transferred, and loaded until the entire dataset is migrated.
>
>By using batch data communication, you can efficiently migrate large volumes of data while managing resource utilization and minimizing the impact on both the source and target database systems. It allows for better control and monitoring of the migration process, as well as the ability to handle any potential errors or issues that may arise during the data transfer.


#
example
if we want to record a material entry we should know all the steps and dont use any f1 f4 help..
and refer mara and makt table after creating a maerial entry in mm01 to see what actually you passed and what actually gets stored.

- example:
- we are creating the new recording for mm01
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/d2fa2a33-cc0a-4cd7-8f08-f4d1754978c1)
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/a42d0c8c-f323-4348-bb74-949849f81e6e)
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/5fa27696-b82b-4312-a72e-aba2b51429fc)
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/6dfa9942-843b-40ec-8405-320498f61033)
- ## precaution for recording
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/10006478-58ad-4ace-b3d2-1a93962355d9)
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/c79e872d-4f81-47d6-8a9b-7db6f14abf10)
- click on savae button and we will see our recording
- save and back
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/b97698b6-3c88-4feb-b62f-3d54cb0f6871)
- this is the recording which we created.
- now we will select this recording and we will transfer this recordin to the program. means we will create the program which will consist of this recording.
- so select recording and click on create program
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/1275b2aa-ff63-4fee-9265-926e7b543f5b)
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/660e6b92-cf9d-46fc-9802-82b61889fc1e)
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/c0690871-76cc-4272-b429-17d6f9b68b93)
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/98e29db7-1cf3-493a-a111-eb0897e82b17)
- so this is the recording we did..
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/de2695b9-97a1-488c-a960-f9c5cd588f50)
- this is the program name and screen number of mm01 and similarly sap recorded all the steps..



#
# BDC FILE UPLOAD...


![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/0cfb05ae-e1db-460f-9d40-f56f4dfd06d2)
- Now suppose we have this data ..we cant use it directly..
- we need to convert to appropriate format.. sap format.
- for example if we pass pharmaseutical in mm01 sap stores P so we need to fix everything like that by verifying it..
- sililarly material type is 4 char long but we chooses raw material from dropdown so we need to adjust that to what actualy sap stores for what material. sap stores a 4 digit unique code.
- example:
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/f93c97fb-0521-4df5-9337-62f012db54da)
- similarly for each sap stores EA
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/f1fbc7ba-7382-4a54-9480-d4aee862e2c9)
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/288f885d-ffc1-47b9-8c24-8f35cc7ff900)
- we have converted the data to sap accepted format and our ### 2nd step is done.
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/d99d5e06-4681-4c07-b3e7-d91075159d70)
- now we have extracted the data to notepad seperated by tabs.
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/73677ce1-60f3-4a88-877d-9f34cead1179)
- we will create the parameter to take input that file.
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/d27cfae9-e833-4adc-a8f8-d1b6558b4c72)
- we wll create a search help and call the f4_filename
- it returns the path of the file we select.
- then we will use one another function module **GUI_UPLOAD** to read the data from that file.
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/93249b20-9f1a-41f4-b6d5-8c7d03064a78)
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/7e00aa07-cf51-4cc4-b1bd-d5e7d7131739)
- we need to declare the interna table of 5 columns to receive the output.
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/b9f03898-7266-4267-aac4-015ac3df6b90)
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/362b9fcf-e8a1-4f9c-b345-0930ebd2850d)
- ##
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/cd3cdebc-38d2-493b-b96f-5a70cbb60db4)
- in gui upload file name is of type string , but our p_name is of type char so there is a type conflict.

- ## to resolve this error we will go for type casting.
- we will declare variable of type string
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/c5deb9bd-d53a-43b0-838e-1334bf68c64b)
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/2100cd58-8148-4cf6-8860-0a28a271ae4a)
- - now this recording is for single entry recording, to enter multiple entries wrap with loop.
  - ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/059c7b0e-da3d-4720-a5a6-94b0c676489b)
  - we will comment : opengroup ,bdc transaction, and close group which are not required.
  - ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/75771adb-ee43-49b9-99f3-dc79d119cd89)
  - we will go to this include and copy our form endform from the last of it.
  - ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/8d1662a9-b196-4f63-96df-e22aabe66fe0)
  - ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/2ef7fc1a-014a-4cc3-bba3-0bc129c0b980)
  - now sap is appending to **BDCDATA** internal table, so we will copy the declaretion too from that include.
  - ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/e50a7d60-2ccc-4dae-afb6-39a16552c8fb)
  - with headerline is totally absolute in todays world,so WE WILL CONVERT TO WITHOUT HEADER LINE MEANS WE WILL DECLARE THE WORKAREA EXTERNALLY.
  - ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/55b4c48c-9048-49ba-a5cd-42ce0a63bd81)
  - modify performs names of LT, & WA's

  - ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/9ddd330c-d2c3-4d7b-a766-21cd039af90c)
  - ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/fccca652-7dd6-4fcd-8d2c-7d922e884571)
  - Whatever we required from this include we copied it so now we will jst coment that include.
 
# -.
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/5f2b099e-9402-46e8-b9aa-32e2490223d4)
- theese performs are hardcodeed as of now so to make it work we need to pass the data from the workarea reference.
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/d20fb3aa-9448-43a4-a921-22b7b78b4249)

#
#
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/3518f510-4aa0-4ca7-b901-5909b3b4acd8)
#




# WHAT WE DID SO FAR ?

1. WE DID THE RECORDING.
2. WE TRANSFERRED THE RECORDING TO THE PROGRAM.
3. WE UPLOADED THE FILE
4. WE READ THE DATA OF THE FILE
5. WE CALL THE RECORDING INSIDE THE LOOP.


##
- These are the common steps which we have to do in call transsaction method or session method.
- so after all these common steps we can either go for call txn method or session method.

# deep dive 🌊 in CALL TRANSACTION METHOD.
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/9e1b06aa-a5de-4dc5-8ae3-76027160c0e3)
- we will call transaction MM01 inside the loop.
- why **LT_BDCDATA**  in above code?
- because in all the performs we are ultimately appending to that internal table and our alll material steps are stored in bdcdata itself. lt_data have only legacy data.
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/b8b0d1af-9217-439d-99cc-1b66c31479b8)
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/a63645b1-b9b1-478d-a61e-855ae8d7fc60)
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/0e3e3975-77da-4f7e-8ed3-fbf9dd526bdd)
- WE HAVE UNDERSTOOD THE LINE TILL THIS..
- NOW WILL SEE THE LST PART
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/ef16028d-f4b0-4ab3-9864-01aa2f106e70)
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/0a1188fc-277d-4b2b-957b-0deab365083a)
- WE WILL GET ALL THE ERRORS WARNINGS INTO THIS TABLE. SO BASICALLY ITS FOR ERROR HANDLING.
- WE WILL UNCOMMENT THE INCLUDE AND COPY THE MESSTAB DECLARATION.
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/b097f158-4df3-485d-b565-dd578f977057)
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/2676a68c-05dc-42bc-961a-51ede5b07580)
- WITH HEADER LINE CONCEPT IS ONSULUTE SO WE WILL GO FOR WITHOUT HHEADER LINE CONCEPT.
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/35b0cb41-ad04-4617-9b5c-f137911f562e)
- AFTER PROCSSING REFRESH IS MUST ..ELSE SAME MATERIAL WILL GET CREATED REPEATEDLY AND WILL LEAD TO ERRRS.
- IN MESSTAB WE GET THE ERROR CODE BUT USER DOESNT UNDERSTAND THE MESSAGE CODE SO NEXT WE WILL SEE HOW WE WILL DISPLAAY THE MESSAGE.
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/06b5ee77-9674-42b5-8b34-0535674a6b68)
- FOR THAT SAP PROVIDED THE FUNCTION MODULE.
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/33c77014-b938-4ae0-a577-d77f1a658b43)
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/4e142849-9294-4370-aebe-9d8c236302e2)
- ## SO HOW WILL WE ACHIEVE IT ?
- FIRSTLY WE WILL PUT ALOOP ON INTEERNAL TABLE MESSTAB AND WILL CALL THE FUNCITON MODULE THERE.
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/994f7cf7-afe3-4525-8124-2144025c9b9a)

- MSGV1, MSGV2, MSGV3, MSGV4: These are placeholders for message variables. They allow you to pass dynamic values into the message text. For example, if your message text contains placeholders like '&1', '&2', '&3', and '&4', these placeholders will be replaced by the values you provide in MSGV1, MSGV2, MSGV3, and MSGV4, respectively.
- For instance, if you have a message text like 'Material &1 has quantity &2', you would pass the material number into MSGV1 and the quantity into MSGV2.

#
#
#
## FIRSTLY WE WILLS SEE ALL SCREEN MODE THEN NO SCREEN MODE AND THEN ERROR.
## WE HAVE ADDED THE DATA TO THE SAP  SYSTEM NOW
- NOW OUR LAST STEP REMAINGING WHICH IS TO VERIFY THE DATA.
- NOW WE WILL VERIFY THE DATA INTO MARA AND MAKT TABLE
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/f142aee1-5b00-40d0-9b52-79d09c639f9b)
- WE WILL ALSO CHECK DESCRIPTION IN MAKT TABLE
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/05066056-0417-4d44-b77a-3f767cb210a3)
- AND YES THIS IS THE EXACT DATA WE NEEDED AND ITS CORRECTLY MAPPED.

#
#
#
#
# SECOND METHOD OF BDC
## SESSION METHOD
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/19d66b53-0e42-4771-9f2e-470e918c66bf)





# FULL PROGRAM OF BDC USING CALL TRANSACION METHOD

```ABAP
report ZMM01_RECORDING
       no standard page heading line-size 255.

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
  DATA:   LT_BDCDATA type table of BDCDATA,
          lwa_BDCDATA TYPE BDCDATA.

*  DATA:   MESSTAB LIKE BDCMSGCOLL OCCURS 0 WITH HEADER LINE.
  DATA: LT_MESSTAB TYPE TABLE OF BDCMSGCOLL,
        LWA_MESSTAB TYPE BDCMSGCOLL.


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

*       Batchinputdata of single transaction



* Include bdcrecx1_s:
* The call transaction using is called WITH AUTHORITY-CHECK!
* If you have own auth.-checks you can use include bdcrecx1 instead.
*include bdcrecx1_s.
*
*start-of-selection.
*
loop at lt_data into lwa_data.
*perform open_group.  " not useful so commented

perform bdc_dynpro      using 'SAPLMGMM' '0060'.
perform bdc_field       using 'BDC_CURSOR'
                              'RMMG1-MATNR'.
perform bdc_field       using 'BDC_OKCODE'
                              '=ENTR'.
perform bdc_field       using 'RMMG1-MATNR'
                              lwa_data-matnr.
perform bdc_field       using 'RMMG1-MBRSH'
                              lwa_data-mbrsh.
perform bdc_field       using 'RMMG1-MTART'
                              lwa_data-mtart.
perform bdc_dynpro      using 'SAPLMGMM' '0070'.
perform bdc_field       using 'BDC_CURSOR'
                              'MSICHTAUSW-DYTXT(01)'.
perform bdc_field       using 'BDC_OKCODE'
                              '=ENTR'.
perform bdc_field       using 'MSICHTAUSW-KZSEL(01)'
                              'X'.
perform bdc_dynpro      using 'SAPLMGMM' '4004'.
perform bdc_field       using 'BDC_OKCODE'
                              '/00'.
perform bdc_field       using 'MAKT-MAKTX'
                              lwa_data-maktx.
perform bdc_field       using 'BDC_CURSOR'
                              'MARA-MEINS'.
perform bdc_field       using 'MARA-MEINS'
                              lwa_data-meins.
perform bdc_dynpro      using 'SAPLSPO1' '0300'.
perform bdc_field       using 'BDC_OKCODE'
                              '=YES'.

CALL TRANSACTION 'MM01' USING LT_BDCDATA MODE 'A' UPDATE 'S' MESSAGES INTO LT_MESSTAB.
REFRESH: LT_BDCDATA.

*perform bdc_transaction using 'MM01'. " not useful so commented
*
*perform close_group.  " not useful so commented
ENDLOOP.

LOOP AT LT_MESSTAB INTO LWA_MESSTAB.
  CALL FUNCTION 'MESSAGE_TEXT_BUILD'
    EXPORTING
      msgid                     = LWA_MESSTAB-msgid
      msgnr                     = LWA_MESSTAB-msgnr
     MSGV1                     = LWA_MESSTAB-MSGV1
     MSGV2                     = LWA_MESSTAB-MSGV2
     MSGV3                     = LWA_MESSTAB-MSGV3
     MSGV4                     = LWA_MESSTAB-MSGV4
*   IMPORTING
*     MESSAGE_TEXT_OUTPUT       = MESSAGE_TEXT_OUTPUT
            .

ENDLOOP.

"""
FORM BDC_DYNPRO USING PROGRAM DYNPRO. "we got ths and copied from sap include bdcrecx1_s
  CLEAR lwa_BDCDATA.
  lwa_BDCDATA-PROGRAM  = PROGRAM.
  lwa_BDCDATA-DYNPRO   = DYNPRO.
  lwa_BDCDATA-DYNBEGIN = 'X'.
  APPEND lwa_BDCDATA to lt_bdcdata.
ENDFORM.

*----------------------------------------------------------------------*
*        Insert field                                                  *
*----------------------------------------------------------------------*
FORM BDC_FIELD USING FNAM FVAL.

    CLEAR lwa_BDCDATA.
    lwa_BDCDATA-FNAM = FNAM.
    lwa_BDCDATA-FVAL = FVAL.
    APPEND lwa_BDCDATA to lt_BDCDATA.

ENDFORM.
"""
```












  
















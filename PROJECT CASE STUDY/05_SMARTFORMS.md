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
- 



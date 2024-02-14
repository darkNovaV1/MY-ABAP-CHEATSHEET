# program to write a data to the presentation layer
we will write a order number from a zordh table into the presentation layer or desktop.

```abap
REPORT zprg2_filehandling_2012.
TABLES : zordh__28.


TYPES: BEGIN OF lty_data,
         ono   TYPE  zdeono__28,
         odate TYPE zdeodate__28,
         pm    TYPE zdepm__28,
         ta    TYPE netwr,
         curr  TYPE zdecur__28,
       END OF lty_data.
       DATA: lt_data TYPE table of lty_data.
       DATA: lwa_data TYPE lty_data.

SELECT-OPTIONS : s_ono FOR zordh__28-ono.

SELECT ono odate pm ta curr
  FROM zordh__28
  INTO TABLE lt_data
  WHERE ono in s_ono.


  CALL FUNCTION 'GUI_DOWNLOAD'
    EXPORTING
*     BIN_FILESIZE                    = BIN_FILESIZE
      filename                        = 'C:\Users\Bhavik.Bhuva\OneDrive - aeonx.digital\Desktop\order.txt'
*     FILETYPE                        = 'ASC'
*     APPEND                          = ' '
      WRITE_FIELD_SEPARATOR           = 'X'
*
*   IMPORTING
*     FILELENGTH                      = FILELENGTH
    TABLES
      data_tab                        = lt_data
*     FIELDNAMES                      = FIELDNAMES
   EXCEPTIONS
     FILE_WRITE_ERROR                = 1
     NO_BATCH                        = 2
     GUI_REFUSE_FILETRANSFER         = 3
     INVALID_TYPE                    = 4
     NO_AUTHORITY                    = 5
     UNKNOWN_ERROR                   = 6
     HEADER_NOT_ALLOWED              = 7
     SEPARATOR_NOT_ALLOWED           = 8
     FILESIZE_NOT_ALLOWED            = 9
     HEADER_TOO_LONG                 = 10
     DP_ERROR_CREATE                 = 11
     DP_ERROR_SEND                   = 12
     DP_ERROR_WRITE                  = 13
     UNKNOWN_DP_ERROR                = 14
     ACCESS_DENIED                   = 15
     DP_OUT_OF_MEMORY                = 16
     DISK_FULL                       = 17
     DP_TIMEOUT                      = 18
     FILE_NOT_FOUND                  = 19
     DATAPROVIDER_EXCEPTION          = 20
     CONTROL_FLUSH_ERROR             = 21
     OTHERS                          = 22
            .
  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.
```

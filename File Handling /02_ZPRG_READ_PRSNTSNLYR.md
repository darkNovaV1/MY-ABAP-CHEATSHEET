```abap
"PROGRAM TO READ THE FILE FROM PRESENTATION LAYER...
REPORT zprg_filehandling_201.

TYPES: BEGIN OF lty_data,
         eid(10)   TYPE n,
         ename(40) TYPE c,
      END OF lty_data.
data: lt_data TYPE table of lty_data.
data: lwa_data TYPE lty_data.
DATA: lv_file TYPE string. " because p_file is char type and filetype in module is stirng so we need to typecast.

PARAMETERS: p_file TYPE localfile.

" now we want a value request help button lets check it...
" on selectin of value request help we want to goto Decktop and let user pick the file.
" to achive this requirement sap provided the fn module
" `f4_filename`- it will open the desktop or presentation
" server and whenever you select the file it will return the path.




AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_file.

  CALL FUNCTION 'F4_FILENAME'
    EXPORTING
      program_name  = syst-cprog
      dynpro_number = syst-dynnr
      field_name    = ' '
    IMPORTING
      file_name     = p_file.

  " NOTE
  " we all know when we click on execute a start of selection is called
  " so on execute we will upload a file so we can read using GUI_DOWNLOAD
  " it will return the data in the form of internal table so lets create sturcture and all.


START-OF-SELECTION.

lv_file = p_file. "explicit type casting

  CALL FUNCTION 'GUI_UPLOAD'
    EXPORTING
      filename                = lv_file
*     FILETYPE                = 'ASC'
      has_field_separator     = 'X'   "set to true coz we have

    TABLES
      data_tab                = lt_data "pass your internal table
* CHANGING
*     ISSCANPERFORMED         = ' '
    EXCEPTIONS
      file_open_error         = 1
      file_read_error         = 2
      no_batch                = 3
      gui_refuse_filetransfer = 4
      invalid_type            = 5
      no_authority            = 6
      unknown_error           = 7
      bad_data_format         = 8
      header_not_allowed      = 9
      separator_not_allowed   = 10
      header_too_long         = 11
      unknown_dp_error        = 12
      access_denied           = 13
      dp_out_of_memory        = 14
      disk_full               = 15
      dp_timeout              = 16
      OTHERS                  = 17.
  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.

  loop at lt_data INTO lwa_data.
    write: / lwa_data-eid , lwa_data-ename.
    ENDLOOP.
```

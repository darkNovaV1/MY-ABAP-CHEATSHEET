```abap
*&---------------------------------------------------------------------*
*& Report ZCHEQUE_PRINT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcheque_print.

*For Data Declarations and selection screen
INCLUDE zcheque_print_top.

START-OF-SELECTION.

*Get the data & Process
  PERFORM Process_data.

*For Process the data to Print the Cheque
  INCLUDE zcheque_print_f01.





*&---------------------------------------------------------------------*
*& Include          ZCHEQUE_PRINT_TOP
*&---------------------------------------------------------------------*
TABLES : payr.

DATA: wa_cheque TYPE ZCHEQUE_DETAILS_01,
      fm_name               TYPE rs38l_fnam,
      gs_control_parameters TYPE ssfctrlop,
      fname                 TYPE tdsfname.  " smartform name
data: output_options TYPE ssfcompop.       " output device

*Constants Declarations
CONSTANTS:gc_flag   TYPE c LENGTH 1 VALUE 'X'.






" Selection Screen.
SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
PARAMETERS : p_bukrs TYPE payr-zbukr OBLIGATORY DEFAULT '1000',
             p_vblnr TYPE payr-vblnr OBLIGATORY,
             p_gjahr TYPE payr-gjahr OBLIGATORY.
*SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE TEXT-002.
SELECTION-SCREEN SKIP.
SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME .

  SELECTION-SCREEN BEGIN OF LINE .
   SELECTION-SCREEN POSITION 1.
   PARAMETERS: r_icici  RADIOBUTTON GROUP r1 DEFAULT 'X'.
   SELECTION-SCREEN COMMENT (10) TEXT-093 FOR FIELD r_icici.

   SELECTION-SCREEN POSITION 15.
   PARAMETERS: r_hdfc  RADIOBUTTON GROUP r1 .
   SELECTION-SCREEN COMMENT (10) TEXT-092 FOR FIELD r_hdfc.

   SELECTION-SCREEN POSITION 30.
   PARAMETERS: r_bob RADIOBUTTON GROUP r1 .
   SELECTION-SCREEN COMMENT (15) TEXT-091 FOR FIELD r_bob.

 SELECTION-SCREEN END OF LINE.
PARAMETERS : p_check AS CHECKBOX.

SELECTION-SCREEN END OF BLOCK b2.
SELECTION-SCREEN END OF BLOCK b1.









*&---------------------------------------------------------------------*
*& Form PROCESS_DATA
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM process_data .
  " Get Cheque Data
  SELECT zbukr,
    vblnr,
    gjahr,
    zaldt,
    znme1,
    znme2,
    znme3,
    znme4,
    rwbtr,
    waers FROM payr INTO TABLE @DATA(it_payr) WHERE zbukr = @p_bukrs AND vblnr = @p_vblnr AND gjahr = @p_gjahr AND voidr = '00'.

  " Set SmartForm Name
  fname =  COND #( WHEN r_bob   = 'X' THEN 'ZCHEQUE_BOB'
                   WHEN r_hdfc  = 'X' THEN 'ZCHEQUE_HDFC'
                   WHEN r_icici = 'X' THEN 'ZCHEQUE_ICIC'
                   ).


  IF it_payr IS NOT INITIAL.

    CALL FUNCTION 'SSF_FUNCTION_MODULE_NAME'
      EXPORTING
        formname = fname
      IMPORTING
        fm_name  = fm_name.

    gs_control_parameters-no_dialog = gc_flag.
    gs_control_parameters-preview   = gc_flag.
    gs_control_parameters-no_open   = gc_flag.
    gs_control_parameters-no_close  = gc_flag.

    CALL FUNCTION 'SSF_OPEN'
      EXPORTING
        control_parameters       = gs_control_parameters
      EXCEPTIONS
        formatting_error   = 1
        internal_error     = 2
        send_error         = 3
        user_canceled      = 4
        OTHERS             = 5.


    LOOP AT it_payr INTO DATA(wa_payr).

      wa_cheque-zbukr = wa_payr-zbukr.
      wa_cheque-vblnr = wa_payr-vblnr.
      wa_cheque-gjahr = wa_payr-gjahr.
      wa_cheque-zaldt = wa_payr-zaldt.
      wa_cheque-znme1 = |{ wa_payr-znme1 }{ wa_payr-znme2 }{ wa_payr-znme3 }{ wa_payr-znme4 }|.  "  added by AMANS #03.06.2024 15:52:56
      wa_cheque-rwbtr = wa_payr-rwbtr.
      wa_cheque-waers = wa_payr-waers.

      wa_cheque-flag  = COND #( WHEN p_check = 'X' THEN 'X'
                                ELSE '' ).




      CALL FUNCTION fm_name
        EXPORTING
          control_parameters = gs_control_parameters
          iw_cheque          = wa_cheque.
      CLEAR:wa_cheque,wa_payr.

    ENDLOOP.

    CALL FUNCTION 'SSF_CLOSE'
      EXCEPTIONS
        formatting_error = 1
        internal_error   = 2
        send_error       = 3
        OTHERS           = 4.

    IF sy-subrc <> 0.
*   error handling
      MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
              WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
    ENDIF.
  ELSE.
    MESSAGE 'No Data Found' TYPE 'E'.
  ENDIF.
ENDFORM.










*&---------------------------------------------------------------------*
*& Form PROCESS_DATA
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM process_data .
  " Get Cheque Data
  SELECT zbukr,
    vblnr,
    gjahr,
    zaldt,
    znme1,
    znme2,
    znme3,
    znme4,
    rwbtr,
    waers FROM payr INTO TABLE @DATA(it_payr) WHERE zbukr = @p_bukrs AND vblnr = @p_vblnr AND gjahr = @p_gjahr AND voidr = '00'.

  " Set SmartForm Name
  fname =  COND #( WHEN r_bob   = 'X' THEN 'ZCHEQUE_BOB'
                   WHEN r_hdfc  = 'X' THEN 'ZCHEQUE_HDFC'
                   WHEN r_icici = 'X' THEN 'ZCHEQUE_ICIC'
                   ).


  IF it_payr IS NOT INITIAL.

    CALL FUNCTION 'SSF_FUNCTION_MODULE_NAME'
      EXPORTING
        formname = fname
      IMPORTING
        fm_name  = fm_name.

    gs_control_parameters-no_dialog = gc_flag.
    gs_control_parameters-preview   = gc_flag.
    gs_control_parameters-no_open   = gc_flag.
    gs_control_parameters-no_close  = gc_flag.

    CALL FUNCTION 'SSF_OPEN'
      EXPORTING
        control_parameters       = gs_control_parameters
      EXCEPTIONS
        formatting_error   = 1
        internal_error     = 2
        send_error         = 3
        user_canceled      = 4
        OTHERS             = 5.


    LOOP AT it_payr INTO DATA(wa_payr).

      wa_cheque-zbukr = wa_payr-zbukr.
      wa_cheque-vblnr = wa_payr-vblnr.
      wa_cheque-gjahr = wa_payr-gjahr.
      wa_cheque-zaldt = wa_payr-zaldt.
      wa_cheque-znme1 = |{ wa_payr-znme1 }{ wa_payr-znme2 }{ wa_payr-znme3 }{ wa_payr-znme4 }|.  "  added by AMANS #03.06.2024 15:52:56
      wa_cheque-rwbtr = wa_payr-rwbtr.
      wa_cheque-waers = wa_payr-waers.

      wa_cheque-flag  = COND #( WHEN p_check = 'X' THEN 'X'
                                ELSE '' ).




      CALL FUNCTION fm_name
        EXPORTING
          control_parameters = gs_control_parameters
          iw_cheque          = wa_cheque.
      CLEAR:wa_cheque,wa_payr.

    ENDLOOP.

    CALL FUNCTION 'SSF_CLOSE'
      EXCEPTIONS
        formatting_error = 1
        internal_error   = 2
        send_error       = 3
        OTHERS           = 4.

    IF sy-subrc <> 0.
*   error handling
      MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
              WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
    ENDIF.
  ELSE.
    MESSAGE 'No Data Found' TYPE 'E'.
  ENDIF.
ENDFORM.
```

![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/62c2eb09-2129-4593-8c0a-c8877d6c9cad)

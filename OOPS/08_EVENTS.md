# `EVENTS` 🌲

![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/77f87a56-eba6-4da7-b37f-9108740de7a2)


```abap
*&---------------------------------------------------------------------*
*& Report zprg2_bb
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zprg2_bb.

PARAMETERS: p_vbeln TYPE vbeln_va.

DATA:lv_erdat TYPE erdat,
      lv_erzet TYPE erzet,
      lv_ernam TYPE ernam,
      lv_vbtyp TYPE vbtypl.

class class1 DEFINITION.
PUBLIC SECTION.
 METHODS display IMPORTING pvbeln TYPE vbeln_va
                 EXPORTING perdat TYPE erdat
                           perzet TYPE erzet
                           pernam TYPE ernam
                           pvbtyp TYPE vbtypl.
 EVENTS: no_input.
ENDCLASS.

class class1 IMPLEMENTATION.
METHOD display.
  if p_vbeln is INITIAL.
  RAISE EVENT no_input.   "triggerrrring method.
  ELSE.
    SELECt SINGLE erdat erzet ernam vbtyp
      INTO ( perdat , perzet , pernam , pvbtyp )
      FROM vbak
      WHERE vbeln = pvbeln.
  ENDIF.
ENDMETHOD.
ENDCLASS.

CLASS class2 DEFINITION.
PUBLIC SECTION.
METHODS message FOR EVENT no_input of class1. " event handlerrr method
ENDCLASS.

CLASS class2 IMPLEMENTATION.
  METHOD message.
  WRITE: 'please enter sales document number.'.
  ENDMETHOD.
ENDCLASS.


START-OF-SELECTION.
DATA: lo_object1 TYPE REF TO class1.
DATA: lo_object2 TYPE REF TO class2.

CREATE OBJECT lo_object1.
CREATE OBJECT  lo_object2.

set HANDLER lo_object2->message FOR lo_object1. " REgistering the Event Handler Method.

lo_object1->display( EXPORTING pvbeln = p_vbeln
                     IMPORTING perdat = lv_erdat
                               perzet = lv_erzet
                               pernam = lv_ernam
                               pvbtyp = lv_vbtyp ).

IF lv_Erdat is NOT INITIAL AND lv_erzet is NOT INITIAL AND lv_ernam is NOT INITIAL AND lv_vbtyp IS NOT INITIAL.
WRITE: / lv_erdat ,
       / lv_erzet ,
       / lv_ernam ,
       / lv_vbtyp .
ENDIF.

```

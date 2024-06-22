![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/39c388a1-9073-47bc-aace-c57c49db9d81)
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/b1925bcc-622f-42b4-a8e0-467bbfcdffc0)
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/a83b76a9-f9de-4e70-bcc4-ddb62cefab3e)
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/27cb813d-c756-4808-874f-c8e897eea9cd)






```abap  


METHOD if_ex_mb_migo_badi~post_document.

    ""--------------------------------------------------------------""
    ""-------------------------------------""
    ""--------------------------------------------------------------""

    TYPES : BEGIN OF ty_ekko,
              ebeln TYPE ekko-ebeln,
              lifnr TYPE ekko-lifnr,
            END OF ty_ekko.

    TYPES : BEGIN OF ty_ekpo,
              ebeln TYPE ekpo-ebeln,
              ebelp TYPE ekpo-ebelp,
              werks TYPE ekpo-werks,
              menge TYPE ekpo-menge,
            END OF ty_ekpo.

    TYPES : BEGIN OF ty_t001w,
              werks TYPE t001w-werks,
              name1 TYPE t001w-name1,
            END OF ty_t001w.

    TYPES : BEGIN OF ty_lfa1,
              lifnr TYPE lfa1-lifnr,
              name1 TYPE lfa1-name1,
            END OF ty_lfa1.

    TYPES : BEGIN OF ty_but020,
              partner    TYPE but020-partner,
              addrnumber TYPE but020-addrnumber,
            END OF ty_but020.

    TYPES : BEGIN OF ty_adr6,
              addrnumber TYPE adr6-addrnumber,
              smtp_addr  TYPE adr6-smtp_addr,
            END OF ty_adr6.

    TYPES : BEGIN OF ty_adrc,
              addrnumber TYPE adrc-addrnumber,
              city1      TYPE adrc-city1,
              house_num1 TYPE adrc-house_num1,
              str_suppl1 TYPE adrc-str_suppl1,
              str_suppl2 TYPE adrc-str_suppl2,
            END OF ty_adrc.

    TYPES : BEGIN OF ty_makt,
              matnr TYPE makt-matnr,
              maktx TYPE makt-maktx,
            END OF ty_makt.

    TYPES : BEGIN OF ty_final,
              ebeln      TYPE ekko-ebeln,
              lifnr      TYPE ekko-lifnr,
              name1      TYPE lfa1-name1,
              werks      TYPE ekpo-werks,
              menge      TYPE ekpo-menge,
              partner    TYPE but020-partner,
              addrnumber TYPE adr6-addrnumber,
              smtp_addr  TYPE adr6-smtp_addr,
              maktx      TYPE makt-maktx,
              city1      TYPE adrc-city1,
              house_num1 TYPE adrc-house_num1,
              str_suppl1 TYPE adrc-str_suppl1,
              str_suppl2 TYPE adrc-str_suppl2,
              erfmg      TYPE matdoc-erfmg,
            END OF ty_final.

    TYPES : BEGIN OF ty_final2,
              maktx      TYPE makt-maktx,
              ebeln      TYPE ekko-ebeln,
              werks      TYPE ekpo-werks,
              menge      TYPE ekpo-menge,
              name1      TYPE t001w-name1,
              erfmg      TYPE matdoc-erfmg,
              run_time   TYPE matdoc-erfmg,
              sht_qty    TYPE matdoc-erfmg,
              ebelp      TYPE matdoc-ebelp,
              frbnr      TYPE matdoc-frbnr,
              mblnr      TYPE matdoc-mblnr,
              bldat      TYPE char10,
              budat      TYPE char10,
              erfme      TYPE mseg-erfme,
              xblnr_mkpf TYPE mseg-xblnr_mkpf,
            END OF ty_final2.

    DATA : it_final2 TYPE TABLE OF ty_final2,
           wa_final2 TYPE ty_final2.

    TYPES : BEGIN OF ty_mail,
              smtp_addr TYPE zmm07_email-smtp_addr,
              werks     TYPE zmm07_email-werks,
            END OF ty_mail.

    DATA : it_mail TYPE TABLE OF ty_mail,
           wa_mail TYPE ty_mail.

    DATA : it_ekko TYPE TABLE OF ty_ekko,
           wa_ekko TYPE ty_ekko.

    DATA : it_ekpo TYPE TABLE OF ty_ekpo,
           wa_ekpo TYPE ty_ekpo.

    DATA : it_t001w TYPE TABLE OF ty_t001w,
           wa_t001w TYPE ty_t001w.

    DATA : it_lfa1 TYPE TABLE OF ty_lfa1,
           wa_lfa1 TYPE ty_lfa1.

    DATA : it_but020 TYPE TABLE OF ty_but020,
           wa_but020 TYPE ty_but020.

    DATA : it_adr6 TYPE TABLE OF ty_adr6,
           wa_adr6 TYPE ty_adr6.

    DATA : it_adrc TYPE TABLE OF ty_adrc,
           wa_adrc TYPE ty_adrc.

    DATA : it_final TYPE TABLE OF ty_final,
           wa_final TYPE ty_final.

    DATA : lv_unit  TYPE char16.
    DATA : lv_menge  TYPE char16.

    DATA : it_makt TYPE TABLE OF ty_makt,
           wa_makt TYPE ty_makt.

    DATA : lv_string_diff_quant TYPE string.

    DATA : lv_erfmg_103 TYPE char16.

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    ""--------------------EMAIL PART--------------------------""
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    DATA: i_objpack   TYPE TABLE OF  sopcklsti1,
          i_objtxt    TYPE TABLE OF solisti1,
          wa_objtxt   TYPE  solisti1,
          i_objbin    TYPE TABLE OF solisti1,
          i_reclist   TYPE TABLE OF somlreci1,
          wa_objhead  TYPE soli_tab,
          w_ctrlop    TYPE ssfctrlop,
          w_compop    TYPE ssfcompop,
          wa_doc_chng TYPE sodocchgi1,
          v_lines_txt TYPE i,
          v_lines_bin TYPE i.

****************************************************************
**--------------WORK AREA DECLARATIONS------------------------**
****************************************************************

    DATA: gs_docdata TYPE sodocchgi1,
          gs_ctrlop  TYPE ssfctrlop,
          gs_outopt  TYPE ssfcompop,
          gs_otfdata TYPE ssfcrescl,
          gs_reclist TYPE somlreci1,
          gs_pdf_tab TYPE tline,
          gs_objbin  TYPE solisti1,
          gs_objpack TYPE sopcklsti1.

    READ TABLE it_mseg TRANSPORTING NO FIELDS WITH KEY bwart = '105'.

    IF sy-subrc = 0.

*      SELECT ebeln,
*             ebelp,
*             mblnr,
*             erfmg,
*             lfbnr,
*             bwart,
*             zeile,
*             frbnr FROM matdoc INTO TABLE @DATA(lt_matdoc)
*                   FOR ALL ENTRIES IN @it_mseg
*                   WHERE lfbnr = @it_mseg-lfbnr
*                   AND zeile = @it_mseg-zeile
*                   AND bwart = '103'.

      SELECT *  FROM matdoc INTO TABLE @DATA(lt_matdoc)
                   FOR ALL ENTRIES IN @it_mseg
                   WHERE lfbnr = @it_mseg-lfbnr
*                   AND zeile = @it_mseg-zeile
                   AND bwart = '103'.

      SELECT ebeln,
             ebelp,
             erfmg,
             bwart,
             frbnr,
             lfbnr,
             mblnr,
             zeile,
             bldat,
             budat,
             werks,
             erfme,
             xblnr FROM matdoc INTO TABLE @DATA(lt_matdoc1)
                   FOR ALL ENTRIES IN @it_mseg
                   WHERE ebeln = @it_mseg-ebeln
                    AND ebelp = @it_mseg-ebelp
                    AND bwart = '105'.

      IF it_mseg IS NOT INITIAL.
        SELECT matnr maktx FROM makt INTO TABLE it_makt
                           FOR ALL ENTRIES IN it_mseg
                           WHERE matnr = it_mseg-matnr.

      ENDIF.


      SELECT ebeln
             lifnr FROM ekko INTO TABLE it_ekko
                   FOR ALL ENTRIES IN it_mseg
                   WHERE ebeln = it_mseg-ebeln.

      IF it_ekko IS NOT INITIAL.

        SELECT lifnr
               name1 FROM lfa1 INTO TABLE it_lfa1
                     FOR ALL ENTRIES IN it_ekko
                     WHERE lifnr = it_ekko-lifnr.

      ENDIF.

      IF it_ekko IS NOT INITIAL.

        SELECT ebeln ebelp werks menge FROM ekpo INTO TABLE it_ekpo
          FOR ALL ENTRIES IN it_ekko WHERE ebeln = it_ekko-ebeln.

      ENDIF.

      IF it_ekpo IS NOT INITIAL.

        SELECT werks
               name1 FROM t001w INTO TABLE it_t001w
                                FOR ALL ENTRIES IN it_ekpo
                                WHERE werks = it_ekpo-werks.

      ENDIF.

      IF it_ekko IS NOT INITIAL.

        SELECT partner
               addrnumber FROM but020 INTO TABLE it_but020
                          FOR ALL ENTRIES IN it_ekko
                          WHERE partner = it_ekko-lifnr.

      ENDIF.

      IF it_but020 IS NOT INITIAL.

        SELECT addrnumber
               city1
               house_num1
               str_suppl1
               str_suppl2 FROM adrc INTO TABLE it_adrc
               FOR ALL ENTRIES IN it_but020
               WHERE addrnumber = it_but020-addrnumber.

      ENDIF.

      IF it_but020 IS NOT INITIAL.

        SELECT addrnumber
               smtp_addr FROM adr6 INTO TABLE it_adr6
                         FOR ALL ENTRIES IN it_but020
                         WHERE addrnumber = it_but020-addrnumber.

      ENDIF.

      ""------------------------------------------------------------------------""
      ""------------------------------For Unit of Entry-------------------------""
      ""------------------------------------------------------------------------""

      IF it_mseg IS NOT INITIAL.

        LOOP AT it_mseg INTO DATA(ls_mseg).

          CLEAR wa_final2.

          ""-------------------Bill Qty---------------------""

          wa_final2-run_time = ls_mseg-erfmg.
          wa_final2-erfme = ls_mseg-erfme.
          wa_final2-xblnr_mkpf = ls_mseg-xblnr_mkpf.

          ""-------------------Bill Qty---------------------""

          READ TABLE it_makt INTO wa_makt WITH KEY matnr = ls_mseg-matnr.

          IF sy-subrc = 0.

            wa_final2-maktx = wa_makt-maktx.

          ENDIF.


          READ TABLE lt_matdoc INTO DATA(ls_matdoc) WITH KEY ebeln = ls_mseg-ebeln ebelp = ls_mseg-ebelp."lfbnr = ls_mseg-lfbnr.
*                                                             zeile = ls_mseg-zeile.

          IF sy-subrc = 0.

            IF ls_matdoc-erfmg NE ls_mseg-erfmg.

              wa_final2-sht_qty = ls_matdoc-erfmg - ls_mseg-erfmg.

              wa_final2-mblnr = ls_matdoc-mblnr.

*             SORT lt_matdoc1 by mblnr DESCENDING.
*          READ TABLE lt_matdoc1 INTO DATA(ls_matdoc1) INDEX 1." WITH KEY ebeln = ls_mseg-ebeln
              READ TABLE lt_matdoc1 INTO DATA(ls_matdoc1)  WITH KEY ebeln = ls_mseg-ebeln
                                                                    ebelp = ls_mseg-ebelp. "lfbnr = ls_mseg-lfbnr
              "zeile = ls_mseg-zeile.

*              IF sy-subrc = 0.
*
*
*
*
*                endif.

              DELETE lt_matdoc WHERE mblnr NE ls_matdoc-mblnr.

              ""-------------------Bill Qty---------------------""

              wa_final2-frbnr = ls_matdoc-frbnr.

              wa_final2-erfmg = ls_matdoc-erfmg.

              ""-------------------Bill Qty---------------------""

*                wa_final2-mblnr = ls_matdoc-mblnr.
*            wa_final2-ebelp = ls_matdoc-ebelp.


              IF ls_matdoc-bldat EQ '00000000'.

                wa_final2-bldat = ' '.
              ELSE.
                CONCATENATE ls_matdoc-bldat+6(2)
                            ls_matdoc-bldat+4(2)
                            ls_matdoc-bldat+0(4) INTO wa_final2-bldat SEPARATED BY '.'.
              ENDIF.


*            wa_final2-budat = ls_matdoc-budat.


              IF ls_matdoc-budat EQ '00000000'.

                wa_final2-budat = ' '.
              ELSE.
                CONCATENATE ls_matdoc-budat+6(2)
                            ls_matdoc-budat+4(2)
                            ls_matdoc-budat+0(4) INTO wa_final2-budat SEPARATED BY '.'.
              ENDIF.

              wa_final2-ebelp = ls_matdoc-ebelp.


*              ENDIF.

              READ TABLE it_ekpo INTO wa_ekpo WITH KEY ebeln = ls_matdoc-ebeln ebelp = ls_matdoc-ebelp.

              IF sy-subrc = 0.

                wa_final2-ebeln = wa_ekpo-ebeln.
                wa_final2-werks = wa_ekpo-werks.
                wa_final2-menge = wa_ekpo-menge.

              ENDIF.

              READ TABLE it_t001w INTO wa_t001w WITH KEY werks = wa_ekpo-werks.

              IF sy-subrc = 0.

                wa_final2-name1 = wa_t001w-name1.

              ENDIF.

              APPEND wa_final2 TO it_final2.

            ELSE.

            ENDIF.
          ENDIF.

        ENDLOOP.

        ""------------------------------------Po Email Details-----------------------------------------""


        LOOP AT it_ekko INTO wa_ekko.

          CLEAR wa_final.

          wa_final-ebeln = wa_ekko-ebeln.
          wa_final-lifnr = wa_ekko-lifnr.


          READ TABLE it_makt INTO wa_makt WITH KEY matnr = ls_mseg-matnr.

          IF sy-subrc = 0.

            wa_final-maktx = wa_makt-maktx.

          ENDIF.


          READ TABLE it_lfa1 INTO wa_lfa1 WITH KEY lifnr = wa_ekko-lifnr.

          IF sy-subrc = 0.

            wa_final-name1 = wa_lfa1-name1.

          ENDIF.

          READ TABLE it_but020 INTO wa_but020 WITH KEY partner = wa_ekko-lifnr.

          IF sy-subrc = 0.

            wa_final-addrnumber = wa_but020-addrnumber.

          ENDIF.

          READ TABLE it_adrc INTO wa_adrc WITH KEY addrnumber = wa_but020-addrnumber.

          IF sy-subrc = 0.

            wa_final-house_num1 = wa_adrc-house_num1.
            wa_final-str_suppl1 = wa_adrc-str_suppl1.
            wa_final-str_suppl2 = wa_adrc-str_suppl2.
            wa_final-city1 = wa_adrc-city1.

          ENDIF.

          READ TABLE it_adr6 INTO wa_adr6 WITH KEY addrnumber = wa_but020-addrnumber.

          IF sy-subrc = 0.

            wa_final-smtp_addr = wa_adr6-smtp_addr.

          ENDIF.

          IF wa_final-smtp_addr IS NOT INITIAL.

            gs_reclist-receiver = wa_final-smtp_addr.
            gs_reclist-rec_type = 'U'.

            APPEND gs_reclist TO i_reclist.
            CLEAR gs_reclist.


          ENDIF.


          APPEND wa_final TO it_final.


        ENDLOOP.

        ""-----------------------------------For Ztable EMAIL---------------------------------------""

        SELECT smtp_addr
               werks FROM zmm07_email INTO TABLE it_mail
                                      FOR ALL ENTRIES IN it_ekpo
                                      WHERE werks = it_ekpo-werks.

        LOOP AT it_mail INTO wa_mail.

          wa_mail-werks = wa_ekpo-werks.

          IF wa_mail-smtp_addr IS NOT INITIAL.

            gs_reclist-receiver = wa_mail-smtp_addr.
            gs_reclist-rec_type = 'U'.

            APPEND gs_reclist TO i_reclist.
            CLEAR gs_reclist.

          ENDIF.

        ENDLOOP.

        ""-------------------------------------Mail Content------------------------------------------""

        CONCATENATE 'To,' '<br />' INTO wa_objtxt-line  SEPARATED BY space.

        APPEND wa_objtxt TO i_objtxt.
        CLEAR wa_objtxt.

        IF wa_final-name1 IS NOT INITIAL.

          CONCATENATE wa_final-name1 ',' '<br />' INTO wa_objtxt-line.

          APPEND wa_objtxt TO i_objtxt.
          CLEAR wa_objtxt.

        ELSE.
        ENDIF.

        IF wa_final-house_num1 IS NOT INITIAL.

          CONCATENATE wa_final-house_num1 ',' '<br />' INTO wa_objtxt-line.

          APPEND wa_objtxt TO i_objtxt.
          CLEAR wa_objtxt.

        ELSE.
        ENDIF.

        IF wa_final-str_suppl1 IS NOT INITIAL .

          CONCATENATE wa_final-str_suppl1 ',' '<br />' INTO wa_objtxt-line.

          APPEND wa_objtxt TO i_objtxt.
          CLEAR wa_objtxt.

        ELSE.
        ENDIF.

        IF wa_final-str_suppl2 IS NOT INITIAL .

          CONCATENATE wa_final-str_suppl2 ',' '<br />' INTO wa_objtxt-line.

          APPEND wa_objtxt TO i_objtxt.
          CLEAR wa_objtxt.

        ELSE.
        ENDIF.

        IF wa_final-city1 IS NOT INITIAL.

          CONCATENATE wa_final-city1 ',' '</p>' INTO wa_objtxt-line.

          APPEND wa_objtxt TO i_objtxt.
          CLEAR wa_objtxt.

        ELSE.
        ENDIF.

        CONCATENATE '<br /><br />' 'Dear Sir' '/' 'Madam,' INTO wa_objtxt-line  SEPARATED BY space.

        APPEND wa_objtxt TO i_objtxt.
        CLEAR wa_objtxt.

        CONCATENATE '<br /><br />' 'Subject' ':' 'Intimation of short quantity received.'
        INTO wa_objtxt-line  SEPARATED BY space.

        APPEND wa_objtxt TO i_objtxt.
        CLEAR wa_objtxt.

        CONCATENATE '<br /><br />' 'We have received your Invoice No' wa_final2-xblnr_mkpf
        'on date' wa_final2-bldat  'against our PO No' wa_final2-ebeln 'on date' wa_final2-bldat
        'from our Plant Name' wa_final2-name1 INTO wa_objtxt-line  SEPARATED BY space.

        APPEND wa_objtxt TO i_objtxt.
        CLEAR wa_objtxt.

        CONCATENATE '<br /><br />' 'We have received the material on date'
        wa_final2-budat 'with our GR No' wa_final2-mblnr 'and found short quantity as below'
        INTO wa_objtxt-line  SEPARATED BY space.

        APPEND wa_objtxt TO i_objtxt.
        CLEAR wa_objtxt.

        LOOP AT it_final2 INTO wa_final2.

          CONCATENATE '<br /><br />' 'Material :' wa_final2-maktx 'Our PO Line Item No' wa_final2-ebelp
          INTO wa_objtxt-line  SEPARATED BY space.

          APPEND wa_objtxt TO i_objtxt.
          CLEAR wa_objtxt.

          lv_menge = wa_final2-erfmg.

          CONCATENATE '<br /><br />Bill Quantity' lv_menge 'UOM' wa_final2-erfme
          INTO wa_objtxt-line  SEPARATED BY space.

          APPEND wa_objtxt TO i_objtxt.
          CLEAR wa_objtxt.

          DATA : lv_rec TYPE char16.

          lv_rec = wa_final2-run_time.

          CONCATENATE '<br /><br />Received Quantity' lv_rec 'UOM' wa_final2-erfme
          INTO wa_objtxt-line  SEPARATED BY space.

          APPEND wa_objtxt TO i_objtxt.
          CLEAR wa_objtxt.

          DATA : lv_sht TYPE char16.

          lv_sht = wa_final2-sht_qty.

          CONCATENATE '<br /><br />Short Quantity' lv_sht 'UOM' wa_final2-erfme
          INTO wa_objtxt-line  SEPARATED BY space.

          APPEND wa_objtxt TO i_objtxt.
          CLEAR wa_objtxt.

          CLEAR lv_menge.
          CLEAR lv_rec.
          CLEAR lv_sht.

        ENDLOOP.

        CONCATENATE '<br /><br />'
        'Pls note that we will book your invoice as per the actual quantity received to us' '.'
        INTO wa_objtxt-line  SEPARATED BY space.

        APPEND wa_objtxt TO i_objtxt.
        CLEAR wa_objtxt.

        CONCATENATE '<br /><br />' 'Kindly issue credit note against above short quantity along with GST'
        'if any' 'and show the same in your GST return to take ITC' 'if any' '.'
        INTO wa_objtxt-line  SEPARATED BY space.

        APPEND wa_objtxt TO i_objtxt.
        CLEAR wa_objtxt.

        CONCATENATE '<br /><br />' 'Pls share the credit note to us for our reference' '.'
        INTO wa_objtxt-line  SEPARATED BY space.

        APPEND wa_objtxt TO i_objtxt.
        CLEAR wa_objtxt.

        CONCATENATE '<br /><br />' 'This is auto generated mail so in case of any query' ','
        'pls communicate to Purchase Department' '.' '</p>' INTO wa_objtxt-line  SEPARATED BY space.

        APPEND wa_objtxt TO i_objtxt.
        CLEAR wa_objtxt.

        "  Start of block #22.06.2024 12:06:46  by Bhavik'       "

        CONCATENATE '<br />' 'Regards' ',' '</p>' INTO wa_objtxt-line  SEPARATED BY space.

        APPEND wa_objtxt TO i_objtxt.
        CLEAR wa_objtxt.

        CONCATENATE 'Gopal Snacks Limited' '</p>' INTO wa_objtxt-line  SEPARATED BY space.

        APPEND wa_objtxt TO i_objtxt.
        CLEAR wa_objtxt.

        "  End of block



*          ELSE.
*
*          ENDIF.

*        ENDLOOP.


        IF i_objtxt IS NOT INITIAL.

          DESCRIBE TABLE i_objtxt LINES v_lines_txt.
          READ TABLE i_objtxt INTO wa_objtxt INDEX v_lines_txt.

          DATA : lv_insp_heading TYPE char100.

          CONCATENATE 'Auto Mail To Vendor of Purchase Order' ls_mseg-ebeln INTO lv_insp_heading SEPARATED BY space.

          wa_doc_chng-obj_name =  lv_insp_heading.
          wa_doc_chng-expiry_dat = sy-datum + 10.
          wa_doc_chng-obj_descr = lv_insp_heading.
          wa_doc_chng-sensitivty = 'F'.
          wa_doc_chng-doc_size = v_lines_txt * 255.
* MAIN TEXT

          CLEAR gs_objpack-transf_bin.
          gs_objpack-head_start = 1.
          gs_objpack-head_num = 0.
          gs_objpack-body_start = 1.
          gs_objpack-body_num = v_lines_txt.
          gs_objpack-doc_type = 'HTML'.
          APPEND gs_objpack TO i_objpack.

          gs_objpack-transf_bin = 'X'.
          gs_objpack-head_start = 1.
          gs_objpack-head_num = 0.
          gs_objpack-body_start = 1.
          DESCRIBE TABLE i_objbin LINES v_lines_bin.



          ""------------------EMAIL FM Module-----------------""

          IF wa_final2-sht_qty NE 0.

            CALL FUNCTION 'SO_NEW_DOCUMENT_ATT_SEND_API1'
              EXPORTING
                document_data              = wa_doc_chng
                put_in_outbox              = 'X'
*               commit_work                = 'X'
*   IMPORTING
*               SENT_TO_ALL                =
*               NEW_OBJECT_ID              =
              TABLES
                packing_list               = i_objpack
*               object_header              = wa_objhead
                contents_bin               = i_objbin
                contents_txt               = i_objtxt
                receivers                  = i_reclist
              EXCEPTIONS
                too_many_receivers         = 1
                document_not_sent          = 2
                document_type_not_exist    = 3
                operation_no_authorization = 4
                parameter_error            = 5
                x_error                    = 6
                enqueue_error              = 7
                OTHERS                     = 8.
            IF sy-subrc <> 0.
* Implement suitable error handling here
            ENDIF.
          ELSE.
          ENDIF.
        ENDIF.
      ENDIF.
    ENDIF.



  ENDMETHOD.

```

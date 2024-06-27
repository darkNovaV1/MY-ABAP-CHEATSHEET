  DATA :it_body TYPE soli_tab,
        wa_body TYPE tline.     
" Create Mail Body
      CLEAR: it_body,wa_body.
      wa_body-tdline = |<html>|. APPEND wa_body TO it_body. CLEAR wa_body.
      wa_body-tdline = |<body>|. APPEND wa_body TO it_body. CLEAR wa_body.
      wa_body-tdline = |Dear Sir/Madam,</br>|. APPEND wa_body TO it_body. CLEAR wa_body.
      wa_body-tdline = |<br />|. APPEND wa_body TO it_body. CLEAR wa_body.
      wa_body-tdline = |<p>Please find attached PO of <b>Rukmani Birla Hospital</b> and kindly deliver the same at the earliest</p></br>|. APPEND wa_body TO it_body. CLEAR wa_body.
      wa_body-tdline = |<b>Kindly Note -</b></br>|. APPEND wa_body TO it_body. CLEAR wa_body.
      wa_body-tdline = |<b>1. Kindly mention PO no. in Invoice </b></br>|. APPEND wa_body TO it_body. CLEAR wa_body.
      wa_body-tdline = |<b>2. Drug License, GST, Food License and other details mentioned on Attached PO.</b></br>|. APPEND wa_body TO it_body. CLEAR wa_body.
      wa_body-tdline = |<b>3. If non-availability of any Item is so kindly update us, So we can arrange from other sources.</b></br>|. APPEND wa_body TO it_body. CLEAR wa_body.
      wa_body-tdline = |<b>4. KINDLY PROVIDE THE MSME CERTIFICATE (if you are Registered or if you have surrendered).</b>|. APPEND wa_body TO it_body. CLEAR wa_body.
      wa_body-tdline = |<b>Non reply will be considered as there is no change.</b>|. APPEND wa_body TO it_body. CLEAR wa_body.
      wa_body-tdline = |</body></html>|. APPEND wa_body TO it_body. CLEAR wa_body.

      " creating send request (like clicking on compose)
      TRY.
          CALL METHOD cl_bcs=>create_persistent
            RECEIVING
              result = lo_send_request.
        CATCH cx_send_req_bcs.
      ENDTRY.
      " Creating Mail document
      TRY.
          CALL METHOD cl_document_bcs=>create_document
            EXPORTING
              i_type    = 'HTM'       " sap document
              i_subject = CONV #( 'Important: Rukmani Birla Hospital PO and Delivery Guidelines' )   " subject
              i_text    = it_body     " body of mail
            RECEIVING
              result    = lo_document.
        CATCH cx_document_bcs.
      ENDTRY.

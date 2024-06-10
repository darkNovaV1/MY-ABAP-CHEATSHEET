# CHANGE REQUEST 2️⃣

# ✨✨✨✨✨✨✨✨✨✨

## Change : Customer want that they should update the custom table.
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/b2c2df87-ed98-43bf-b2a8-1b54037b1708)
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/e8635b42-c6fb-48a1-9b3c-622732fc8ac2)
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/08eef1f0-2206-4bbe-ac88-39ed5e3e2bf1)
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/e68e9aef-d32b-49ef-9682-63b538fa5230)

- # SOLUTION..🎗
- ### we will start with the creation of table
- as we all know for creating table we need to create data elements and domains..but here now we are going to use standards mostly.
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/0009bcae-2316-4e13-9fcc-e2e20636e45b)
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/f8f4d446-6784-4137-9ca2-2b983d2ba3cc)
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/1230b6bd-4a3c-4739-9a40-bb104864e006)
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/615a5c95-73d5-41e3-91a4-c41984f20eec)
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/e96f56fe-b02e-4c9f-a6a7-474ad33c7196)
-  ## WE ARE NOT GOING FOR TMG HERE COZ IN THIS TABLE WE ARE NOT MAINTAING TABLE USING SM30. OUR PROGRAM WILL INSERT THE DATA INTO THIS TABLE.
-  ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/c4e2026a-58ec-47d8-b5d1-884903399eb5)
-  ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/2b163113-ab31-4b74-87ee-1afbb1152af7)
-  ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/d5e25754-ba23-4179-b095-cdb9043ce425)
-  activate
-  ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/4bed99d0-e038-4666-9cdd-fb998a116ccf)
-  ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/92601d77-d7db-418d-9c85-ed661ec3ffc8)
-  - WE CAN GO WITH ANY LOGIC
- TO INSERT INTO TABLE, WE CAN GO WITH ANY OF THE SYNTAX,
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/d9e56473-08c8-46cc-a160-64f0d77ab580)
- we will use the second method so that we insert at once and optimise the performance.
- so we will insert all X records in an internal table and at last at once we will insert it to the table.
- our wa' and it must have the same type as of database table.
- we will create a variable, it and wa using database table only coz table is a structure itself..
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/fe5d7ef0-f761-4fae-a02a-4c8af8c7d997)
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/d2995858-7889-464f-b672-b92c38d76d48)
- now we have all the data to invalidate into the internal table, now we want to push all that to our database table.
- we will create a message from se91 tcode
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/810e77ec-6af6-4171-90ee-1ae93af74e5b)

- ### NOW WE NEED TO WRITE THE LOGIC TO DELETE THE INVALIDATED RECORDS FROM THE ALV OUTPUT.
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/8e4fc1ea-5220-47a6-9439-538267e3f678)
- ### NOW AFTER DELETE WE NEED TO REFRESH THE ALV VIEW, ELSE HOW WOULD WE SEE THE DIFFERENCE..  ❓

- ## OUR USER COMMAND HAS TWO USING PARAMETERS, IF WE GO INTO IT WE FIND THAT
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/b4afcc40-f8cc-4459-ae05-acc7ca1e99b9)
- ### WE CAN USE THIS REFRESH PROPERTY TO REFRESH THE INTERNAL TABLE.
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/f6e45dee-4240-4d12-988d-648d362f689b)

- # now we will see a loophole in our program, we have invalidated the records but when we reexecute the program it appears again..😮😮

- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/ac1b5871-f008-4ea6-a121-af1518821830)

- ### now before the output comes, we have to check how many of the line items are already available in the invalidate database table, we need to remove that from the output.
- ### so we will write a logic on execute button now.
- ### in it_final we have all the data, so we will now fetch the data from inavlidate table and the matching records we will delete from it_final based on vbeln and posnr.
- 
- 
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/8d8473fa-306f-472f-a167-50ceedd5921f)



```abap
  """"""""""""""""""""""""""""""""""""""""""""""""""""ftching from invaldiate
IF it_final is not INITIAL.
  DATA: lv_index TYPE I.
  
      SELECT vbeln posnr from ztinval_items INTO TABLE it_invalidate
      FOR ALL ENTRIES IN it_final
      WHERE vbeln = it_final-vbeln AND posnr = it_final-posnr.
  
     LOOP at it_final INTO wa_final.
       lv_index = sy-tabix.
           READ TABLE it_invalidate INTO wa_invalidate WITH KEY vbeln = wa_final-vbeln posnr = wa_final-posnr.
                IF sy-subrc = 0.
                      DELETE it_final INDEX lv_index.
*                      DELETE it_final WHERE vbeln = wa_final-vbeln AND posnr = wa_final-posnr. "method 2
                ENDIF.
     ENDLOOP.  
  
  
ENDIF.
    


    """"""""""""""""""""""""""""""""""""""""""""""""""""
``` 
# UNIT TESTING >> 🧪
---
# BIG BUG FOUND..🐜🐜

## if we click INVALIDATE without selecting any of the records, all the records get invalidated..**😐**


### - now we will write the code to fix this bug
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/b064cd5f-bcad-4995-902c-8cdc85634ddd)


  








 













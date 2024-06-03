# CHANGES

- now the funcitonal came with the new add on requirements
- he need a multiple select option in inpuut screen at [Created by..]
- and in delivery quantity column, functional need order quantity column title.
- so we will remove no-internavals and rename the quantity field.


#   REQUIREMENT 2:

- CUSTOMERS SECOND REQUIREMENT IS
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/5333f2e5-c0dc-435b-932e-473857c7b60e)
- he must be able to send the selected data to the smart and adobe forms.

- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/e674693c-0ff1-4b11-b9d9-4e9fa936697b)
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/6bc0ee5d-e413-4ef3-9f48-c6221a421b0c)



# we will start with creating an extra initial column, checkbox will see later 
- we need to create the field catalog
- we need to bind the field catalog
- as we know its all abbout ALV.
- we need to add colum in 2 places, field catalog and data internal table.
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/12f504b7-f4bd-47b5-bf36-881d79ae097e)
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/083313a7-f2ad-48cf-9594-e06a407a6892)
- we have added in field catalog.
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/f286828f-350c-482a-acda-667456f0899e)
- we have added a new column.

- ### now we will see how to convert it in the form of checkbox, how to select and how to pass the selected data to smart/adobe form.
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/d42b0da5-2c3c-4bbe-b5aa-4b23d5b503f6)
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/2ad60e60-2b89-49c7-8674-8036f717c721)
- we will update the form..

```abap
FORM prepare_fieldcat  USING   pv_colpos
                               pv_fieldname
                               pv_text
                               pv_checkbox
                       CHANGING pt_fieldcat TYPE SLIS_T_FIELDCAT_ALV.

  gs_fieldcat-col_pos = pv_colpos.
  gs_fieldcat-fieldname = pv_fieldname.
  gs_fieldcat-seltext_m = pv_text.  " Column header text
  gs_fieldcat-checkbox = pv_checkbox.
  APPEND gs_fieldcat TO gt_fieldcat.


ENDFORM.
```
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/43d15af0-56ab-4694-b00a-6418ce4fdd5a)
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/64aa66f6-2042-434d-be7d-d286edccffe2)
-
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/0f804c9b-24a6-428a-bbfa-006d47f91c0a)
- ## the checkboxes are visible, but we arent able to select it.
-
- 
- # Solution
-
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/b015c09b-3559-4ee6-b195-6be9777cceaa)
- we will use this parameter to enable edit on checkbox
- ## iportant thing
- to make a alv editable
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/a79fff07-d747-453c-9112-2720793e8974)
- so now we will again add a extra value to our feildcat and perform
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/439a4f9a-d1b1-401f-a102-08cc83d5f73c)


## to allow the system to detect that some changes have been made to the alv output we have to enable one of the property..
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/f89d7686-6382-4bd4-9eec-9e5eac19a3e1)
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/e1da3f05-6099-41ed-8a0d-3bf2609776fb)
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/aca5f2a4-e071-4f98-9c34-a98f8bf44c9d)
-> we will pass this cell to 'X'.
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/26aec4bf-e7a5-4fe5-b49f-7e42175901cb)

-
-
- ### now system has recognised and we can see the change, previosly we cant see it
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/ebe5bcc5-1a44-4ddd-80a7-8d2232a531d0)

  # 🎈🎆🎇🧨✨🎉🎊

  ## - currently we are passing the full internal table to the smartform and the adobeform,
  ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/f0ab4c8b-0e6d-432e-b6a6-5c4a231eb26e)

  ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/5b980c27-979c-4d29-8db4-5b1267cb973a)
  ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/8930e58f-7268-445e-a83d-a57152acadae)
  now we can pass this temporary table to smartform and adobe form.

  ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/01286084-13d5-401b-8d3b-18958081f57c)
  ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/275638ab-5b52-4cf5-8365-7156ac151300)


  ## ❓❓
  ### - this logic should only be execute if user has selected any option.
  ### - else all the data should be passed to the smart/adobe form.
  ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/fb1deddd-b9fd-4046-b8e7-e00ed66d7521)
  ##- Now this is our task..

  ```abap

    READ TABLE it_final INTO wa_final WITH KEY select = 'X'. "we are jst tryin to check whether user has selected any or not..
  IF sy-subrc = 0.
    LOOP AT it_final INTO wa_final.
      IF wa_final-select = 'X'.
        APPEND wa_final TO it_final_temp.
        CLEAR: wa_final.
      ENDIF.
    ENDLOOP.
  ELSE.
    it_final_temp = it_final.
  ENDIF.

```









  







 





# CUSTOMER EXIT - MENU EXIT

![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/cc694b35-fc1c-48cc-8514-6263b7b77a3c)

![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/6da7c396-d48d-4e1c-9b90-95e7d2820628)
SUPPOSE WE HAVE THIS CANCEL MENU BUTTON IF  WE WANT TO ADD ADDITIONAL SAVE BUTTON THERE, THATS WHERE WE USE MENU EXITS.

## REQUIREMENT: 
- CAT2 TRANSACTION CODE (TCODE FOR TIMESHEET)
- CAT4 TCODE( FOR APPROVING TIMESHEET)
- CUSTOMER REQUIREMENT IS THAT I NEED A MENU ITEM IN CAT2 TCODE ON WHICH CLICKING I GET THE CAT4 TCODE PAGE.

  $$ LETS FIRST CHECK EVEN IS THAT POSSIBLE OR NT.

  WE HAVE 3 WAYS TO FIND A MENU EXIT.
  ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/c56437bf-1360-4941-b1ed-077ad51f0c40)


  ### way 1:
  1. goto system > status > gui status
  2. goto menubar and check if you see anything begin with +
  3. ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/965a3cfb-e2c7-4fb0-91ce-50566757026b)
 
  ### way 2:
  ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/b32941dc-f62e-4175-b0d8-1e2b6f79c23a)
1. how to get package name?
  - system-status-program-goto-attrubutes-package
    

### way 3: 
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/2800db02-f454-4981-a5cc-63ed19dca4d8)

## now lets seee how actually to implement a menu exit.
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/31173df4-5bab-4b25-93e5-e06ec8e49804)
---
1. goto cmod tcode, give some project name and create
2. ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/d20413f6-9fcf-4520-88c3-fa5c3bd9611e)
3. ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/df9855d2-26d0-4a58-9cde-0dcce184b8c8)
4. click enhancement assignment
5. ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/462c841e-a0c6-4721-bdbf-ac802af83bec)
6. then here we need to pass the name of customer exit.
7. 





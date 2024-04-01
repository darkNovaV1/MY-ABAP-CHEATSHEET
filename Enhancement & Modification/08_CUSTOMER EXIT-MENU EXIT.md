![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/6fcfa6a8-52aa-4250-9640-0eb1afa53897)# CUSTOMER EXIT - MENU EXIT

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
7. how to find customer exit name?? goto smod tcode > utilities > find > enter package name (CATS for cat2)
8. ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/31fbf6aa-66f8-4eac-a04f-20b854e5b164)
9. ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/c16e7ef5-23f1-4c8c-9760-1a7876f6ea78)
10. now on clicking the components ..you will get all the function module exit screen exit menu exit which are available in that customer exit.
11. ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/13f6f5e4-ed40-4efc-964c-8d170832681e)
12. so out of this we can use +cu6 or +cu7
13. ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/a9d60d32-4422-4eb2-b55c-492a2b84cca5)
14. double click on required menu ext
15. ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/88e720cc-b94b-4230-bd40-92b9c8629ef1)
16. ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/225e3c42-3c50-4665-9287-cc833ffc6b20)
17. ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/b8abd1a4-3c4d-4755-991a-57ead01f12d4)
18. copy and save
19. now +cu6 has been implemented
20. ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/1f96bc1f-431a-4d7b-a159-ae8b729afeb9)
21. activate and make everything green..must..must
22. ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/7f15c468-e20c-40e3-ba7a-aa67516dab29)
23. now you can see the menu is appeared.
24. ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/5b3f3e8e-f326-47d7-8e97-1b94408aa9e7)
25. now we need to write the logic for avtually callung the tcode cat4 or approve tiimesheet page..
26. now we need to add function module exit coz ultimately we want to add the functionality to the program
27. so now we ill implement the function module exit also.


## lets check out how will we get there..

1. we will goto cmod tcode
2. open the package you created earlier
3. ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/e85adf38-ffa6-461c-837e-a121ccaa34f4)
4. go to components and you will find the function module exit there
5. double click and implement
6. ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/fb741c7e-6622-40c3-8667-8e840047e003)
7. double clicka and enter and save
8. ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/5d891c60-7d49-4ec2-a332-455fedb8e49f)
9. ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/7006b7cf-bd18-4fc7-ac04-fee902cd5950)
10. SAVE ACTIVATE AND RUN
11. 





















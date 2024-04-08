# BADI ✨ 

![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/5e781a31-68e0-4a43-9cee-553f2b9b9e49)
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/34818da6-b1b2-4fba-a120-45abb6aae289)

# TASK 📃✒
### our task is to stop user from creating material from mm01 if the measure unit is KG.
### we want to stop customeres from creating material if material measure unit is KG.

![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/903c271a-79bd-407d-b2f7-3c72b8f64f79)
## this is developer preferebble way..bcoz we have option of debugging in this option.
#CL_EXITHANDLER
-this class is use to find classic badi only.
- SE24 is the tcode for class.
- SE18 is the tcode for BADI Defination.

>[!NOTE]
> # STEPS
>  goto mm01 and create the material just fill the basic info and dont save it
> then goto #CL_EXITHANDLER and put the breakpoint at case sysubrc., then hit save at mm01 and breakpoint will trigger.
> ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/850bb224-7add-440e-814c-b2d5d0c9e41f)
> at this place we will get all the classic badi.
> now goto se18 and check if that badi is useful to you or not. whether you have any interface thats useful or not.
> ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/66ad2130-f172-4b92-87b2-d842dd224800)
> ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/e22bc9c0-bb9c-4649-8425-8d4bace3819e)
> we will check defination and guess whether thats useful or not. and we are able to find the BADI and badi is # BADI_MATERIAL_CHECK

## we have two more methods to find the classic badi
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/7fac04f7-d2d9-4f30-a1f5-9f5dfd4d1bd4)

# 🌷🌷

## now as we know which badi is useful to us so now we need to implement the BADI.
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/cdc89486-253a-418e-bb5b-70653ed9fcc2)


>[!NOTE]
>- we will goto se19 tcode to create the BADI Implementation.
>- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/08616ba5-89d8-4093-a899-658ecf320423)
>- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/3a78d673-3901-4ab3-b937-32881ecc24be)
>- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/a0cd665c-4ba2-44f8-a756-9186b744c224)
>- AFTER THAT GO TO INTERFACE TAB.
>- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/10fbb680-f7d3-40dc-95f0-3fec9088f825)
>- NAME OF THE CLASS AND INTERFACE WILL APPEAR HERE AUTOMATICALLTY..WE CANT WRITE THE CODE IN INTERFACE WE CAN USE THE INTERFACE IN CLASS SO
>- NOW WE WILL DOUBLE CLICK AND CREATE THE CLASS.
>-  ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/6dc4a10d-68cf-4a58-aea9-e5eec3ba34ea)
>-  NOW WE WILL ACTIVATE THIS CLASS.
>-  ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/0467019b-7d90-4189-88a9-761fb8c79149)
>-  NOW WE NEED TO WRITE THE LOGIC IN THIS FIRST METHOD SO WE WILL DOUBLE CLICK ON THAT METHOD..
>-  ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/8d0bc502-a0c3-44de-b5df-e30736195d01)
>-  FOR TESTING WE CAN PUT THE BREAKPOINT HERE
>-  DONT FORGET TO ACTIVATE AS WELL AS TO ACTIVATE BADI PAGE..
>-  ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/50677c6c-d223-4bc4-a7e7-bb3bb8fcd880)
>-  WMARA-MEINS ----> WHAT WE REQIIRED
>-  SO WE WILL GOTO NOW SE19 TCODE AND WE WILL WITE A LOGIC-----
>-  SO WE WILL GOTO SE19 AND PASS OUR BADI IMPLIMENTAION NAME WE PROVIDED..
>-  ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/2399167a-bb32-47f3-99b5-989c15767828)
>-  ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/96e98ca2-970d-4a44-b13c-4f1b0a9c6143)
>-  AND CLICK CHANGE...
>-  GO TO INTERFACE AND DOUBLE CLICK THE CLASS
>-  ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/64442861-0b95-408e-878b-6b55b02039e4)
>-  THEN DOUBLE CLICK ON THE REQUIRED METHOD AND WILL WRITE THE LOGIC THERE..
>-  ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/d1e00578-7a54-4c0f-a7c4-1a75d5c8d3ff)
>-  ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/656e3f41-7ac4-4fe8-bb30-d7ac90f6cc9f)
>-  now we will check and activate.
>- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/bec7d6a4-adbf-49da-9c8c-1b1f1e6d0974)

>-  ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/6a0b8da4-4eef-437f-b3fa-72e6fb4a7a94)























#extra..
>-  ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/0b103c40-02be-4a30-a572-3530193b8339)
>-  now we left with one part we need to write the logic to exclude/hide that two buttons.
>-  now we wnt to write the code in this method.
>-  ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/e2565ab0-3078-4a2f-b613-b22b55f286c7)
>-  if we check the parameters of this method we found this internal table,it clearly says you can pass the functions that are activated or deactivated.
>-  ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/6980ae10-7591-4743-96f3-e898dea749aa)
>-  so we will simply pass the function code of that two buttons.
>-  ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/2af34bdd-88da-4de8-973b-286615b7a94d)
>-  we will check the function code of that two buttons from sstem gui status.
>-  ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/4e2af65b-e584-479d-975a-abb05140ffc9)
>-  ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/17dcc382-4e31-40bc-b5e3-1e2685017a9d)
>-  we will goto change mode of this implementation,
>-  now in implementing class
>-  ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/9de484c8-87d7-4ef3-992a-b2df0747531c)
>-  in ths particular method we will write the code.
>-  we need to fill this internal table. we will pass the function code that we want to deactivate.
>-  ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/056b3302-87f9-4b08-8272-e69a8d7a4b58)
>-  we will create workarea of that particular structure.
>-  ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/dc95887c-d560-4c7a-85e1-2a676160495e)
>-  rip buttons
>-  ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/7cd7e629-b3ef-48bd-8276-e7132e50b99a)
>-  ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/7bd38dc8-d642-4e18-b55e-c63e548d967c)
>-  ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/e352fe08-4568-4279-a1c6-8c03c4892e39)






















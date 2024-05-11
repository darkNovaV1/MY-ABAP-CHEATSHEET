### 29/04/2024
# **_BAPI EXTENSION_**
- ## now we will see how to add custom fields to SAP Standard BAPI.
- lets say now customer is giving data of two additional columns safely.
- one for legacy system number ls01 lso2 ls03 and and another customer will provide is material valid still or obsulute. v and o
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/3ee5d629-d9d6-49d6-a83d-c103ff5b4868)
- these fields doesnt exist so we will create a new custom fields in the table and display and diplay thes results.

- we will passthe data into this BAPI.
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/cc38cdcc-2b4e-4a41-b314-0bcd017b3b5e)

-   - we will add custom fields in bapi , and then we will also addd custom fields in sap standard table.
 
    - ** whenever we have this type of requierment we always go to BAPI table adn check whether we have extensionnin and extensioninx **
      
    - this two parameters we can use to pass the custom fields.
    - ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/e4734713-eee3-4555-a3d8-73b08a3b1fd5)
    ultimately we can pass the value to this parameter.

 
    - we have 2 custom fields, one for legacy system identification and one for checking whether its valid (V) or obsolute (O).
 
    -  we have add custom fields in bapi also, and then we will also addd custom fields in sap standard table also.
 
    -  if we are saving data into the mara   this bapi we have to chceck what are the corrosponing structures available for mara..mar makt..
    -  #1 one way is we can go to global data
    -  ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/1ff9d00b-cb13-4850-abb9-77f6766752ab)
    -  here we can identify various structurs sap has declaared.
    -  we can find the structure and tall those ending wth X are update structure.
    -  lets say we wnat tpo stote in mara structure, akways sirel  bage..
    -   ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/21ad8fbc-c202-4831-9fcc-9ead852ac475)
    -   ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/f7489570-1446-4a3b-a682-aefce93ef6d3)
    -   we will open this structure in se11
    -   ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/9edb1346-7e00-411f-b803-844ee443077c)
    -  ## **we will add two fields in this particular structure add  as well as mara  table afterward**
    -  so whenever we are going for fields or columns the first thing we need is domains and data element so first we will go through it.
    -  ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/58c0a065-927f-499c-a73e-89e926285c02)
    -  ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/0537525f-3292-41a2-a4d1-5aae2ff40557)
    -  ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/3c13a914-36e3-421f-a9cf-0aa2577db662)
    -  check and activate
    -  ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/7edba8b1-364b-404a-8a2b-64a88f39f1a9)
    -  ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/e4d2f1e3-4c9f-42da-aad1-53a29439f855)
    -  ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/25c23579-d61c-4aad-a4ec-9baf59fc72f2)
    -  ## our domains are ready
    -  #
    -  - noww we will create data elements.
       - ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/d37a23cb-5a12-49a0-a6c8-538d19f126c9)
       - ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/ccd7a4a0-52db-4949-9e7b-3a80aa401468)
       - ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/dec9bc04-29d5-4ed5-ac75-ca8de9899440)
       - ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/08a55dcc-da5c-49b7-b4bf-7fd8b9249116)
       - ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/42d1c86c-ddd7-4798-9243-c75ab89f4d81)
       - **so we have created 2 domains and 2 dataelements which we will use further..**


 
>[!NOTE]
>whenever we have this type of requirement the first thing is we add fields to standard BAPI and then to database table.
>


![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/a05c9d8b-5562-4991-8a1b-765329fa95a1)

- now we have to add fields in this structure and lastly we will add to mara table also.
- so we will add custom fields in 3 places:
- in BAPI_TE_MARA structure
- in BAPI_TE_MARAX structure
- lastly in mara table.

- but its sap standard so we cant just change and add ..
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/85fc0129-9c0a-4846-9514-38e359c40ee2)
- instead we can append structure.
- we will click and create append
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/4444187b-db02-43a7-b594-2e136610ac58)
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/a2f536a1-48d4-4810-8a29-874de1ed5ade)
start name with **ZA** its a customed append structure.
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/153e27dd-87a4-429a-9204-e84b39158951)
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/f7b7b735-b5c3-4563-9ef0-aa6d2b0a4d94)

now same way we will add fields to second structure.
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/d84825f9-f553-4649-acf5-e58d3eebcdb9)
we have added in both bapi now we will add to actual mara table coz at last data will get stored in mara table only.

![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/b1b6312a-2c60-41af-8cc8-859b7d6c6baa)
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/e67bd981-b432-4b5c-8518-3c30bd8eeb20)


![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/c09da202-39d2-4377-89b2-f26160e2625e)

![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/0af24af6-d189-4282-a7b8-31e5a3accffb)

now next we will write the logic to add data.
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/cfaff517-deab-4f19-a096-23a22a7fd4a7)
now we will add 2 new fields in our program structure.

![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/220a9080-3846-4b6b-9561-6e2a14f92b29)

now we have data in our internal field, now we will pass to this SAP BaPI funciton...
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/fb302a1e-4f22-43d4-ab98-88966b430ddd)

![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/b2989957-36f7-455b-b72e-a045fb27c3b1)
we wil declare two sorkarea for bapi and bapix function.

whatever the values are coming from legacy file, we will pass to this workarea.
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/ced891a4-0c84-45c0-9441-b776652aef90)
we will fill both the structures.
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/39d65430-2163-421c-81e8-8dd2bfec6ceb)
we will clear it after append.
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/b0177000-e12f-4613-a214-a44010b46992)
now to pass it to BAPI we will use this two important parameters.

![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/56959fe6-4402-4c15-be40-7ecc9557e397)
we will declare two internal tables.
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/1fe7eb9f-59da-49c5-87c7-833a60f3ab8f)
also we will declare and workares
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/9e18c200-0f35-44d2-a29f-550d46dd9b42)

![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/4e14d814-c83d-463c-97dc-f40b178c492d)



![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/d76b1a4b-4f80-40cf-9aec-8417916e4f67)
now we will start working on logic
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/71bcfb4a-dce7-424e-9260-d0a89eb2c816)
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/58ed3cb5-402f-4cad-9b02-a67f6185db85)
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/2c3488e5-86f4-44a7-93ef-c9cadb54e5c4)




![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/a2fd99ba-e581-4ca3-b0c9-abe89f934902)



      

 

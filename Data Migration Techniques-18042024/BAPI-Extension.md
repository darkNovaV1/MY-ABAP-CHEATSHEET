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
    -   

      

 

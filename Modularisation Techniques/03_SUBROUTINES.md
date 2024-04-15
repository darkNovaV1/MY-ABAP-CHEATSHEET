# SUB-ROUTINES 

![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/f732eb5b-6f34-4d4e-a5b8-a813a5764e80)
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/e7869efe-b2fc-4f70-bb47-c2d4940016e7)
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/b1dc94ac-03b4-4715-8bc1-431b55180369)
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/b62f2900-0735-4b78-92b7-0b923680b2ac)
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/cf9597a5-39b5-4e8f-bd07-d3424ea41d7d)
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/49cb87f4-b604-43d3-a6c9-4e8372540732)
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/ea225e5e-e729-49bd-976f-0a368ecca2ff)
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/3f9246a3-ea35-4a00-b314-f71a1c9e0fbe)
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/7526f655-33d1-4ad7-9532-92426fc84cc7)
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/447fb80e-c7ab-44c4-af88-bd1d072f1390)
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/e8e8e8a0-45ae-4d7d-86dd-0b27dd0b3786)

# program 2
- now we will create the same program with parameters.
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/87389a47-a116-4ac5-8b1b-e361c29c24a9)
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/6af1ae9e-2881-427c-b1be-4b3d97dc081e)
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/9ea2cc88-95c5-4727-bf55-e43819d2fd06)
- pv means perform variable its a standard practice to use pv.
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/0098e583-9f5f-484d-8437-a4744824e531)
- we can give data type like this, its optional in this case but its compulsary when we work with internal tables structures etc.
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/c2b2aaf2-bc55-4adc-a10b-27339e14dd9f)
- 


# HOW TO USE SUBROUTINE IN ANOTHER PROGRAM ?

- CREATE A NEW PROGRAM
- THIS IS HOW TO USE PASS THE PROGRAM NAME WHERE YOUR SUB ROUTINE EXISTS LIKE THIS
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/5232aa3b-2b2f-4cc3-94ac-68e9d8beba63)
-  THIS IS ANOTHER SYNTAX WE CAN USE ANY OF THEM
-  ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/0c9611bc-2829-43bc-8b7f-2de0ea407306)

  # IF WE CHANGE THE NAME OF SUBROUTINE IN ORIGINAL PROGRAM THEN ALL THE PLACE WHERE THAT SUBROUTINE USED WILL BLAST  😡
  - SO WHATS THE SOLUTION ..LETS CHECK OUT
  ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/ee0d7710-9090-4eea-a367-16d741bc02f7)
- SIMPLY USE THE KEYWORD IF FOUND TO AVOID THE DUMP.


___

# PASS BY VALUE AND PASS BY REFERENCE
- ### pass by value- ### pass by reference

![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/2622a44a-d6c1-4c82-8d73-ac48d4929aab)
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/f2ad5f3c-ec71-4b62-9d3f-54080d8241b5)
- by default its pass by reference always
- ##  if you want to pass by value we have to wrap variabble with value() keyword.
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/4d0ea438-0098-4637-835b-68bbb81b3db6)
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/cc40dedf-fa13-4ed3-8686-8308185983e3)

 ### we will understand more with the example
 ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/5a976270-8b3a-44f9-8371-7507e2a734a9)
- this is our sample program of appending a data to an internal table.


```abap
TYPES : BEGIN OF lty_data,
          ono TYPE zdeono__28,
          pm  TYPE zdepm__28,
        END OF lty_data.

DATA: lt_data TYPE TABLE OF lty_data.
DATA: lwa_data TYPE lty_data.


lwa_data-ono = 1.
lwa_data-pm = 'D'.
APPEND lwa_data TO lt_data.
CLEAR : lwa_data.

lwa_data-ono = 2.
lwa_data-pm = 'C'.
APPEND lwa_data TO lt_data.
CLEAR : lwa_data.

lwa_data-ono = 3.
lwa_data-pm = 'D'.
APPEND lwa_data TO lt_data.
CLEAR : lwa_data.

lwa_data-ono = 4.
lwa_data-pm = 'D'.
APPEND lwa_data TO lt_data.
CLEAR : lwa_data.

LOOP AT lt_data INTO lwa_data.
  IF lwa_data-ono = 4.
    lwa_data-pm = 'N'.
    MODIFY lt_data FROM lwa_data TRANSPORTING pm.
  ENDIF.
ENDLOOP.


read operation
WRITE : / 'reading data'.
READ TABLE lt_data INTO lwa_data WITH KEY ono = 43.
IF sy-subrc = 0.
  WRITE : / lwa_data-ono , lwa_data-pm.
ELSE.
  WRITE : / 'unsuccessful'.
ENDIF.
WRITE : / 'reading data done'.


LOOP AT lt_data INTO lwa_data.
  WRITE : / lwa_data-ono , lwa_data-pm.
ENDLOOP.
```
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/8d019597-dcbf-4e30-9bc4-be1afb8933ac)

- we can optimize our repitative code with perform statement.

>[!TIP]
>to use internal table in sub routines we have to compulsory create global structure.

```abap
PERFORM setdata USING '1' 'C' CHANGING lt_data.
PERFORM setdata USING '2' 'D' CHANGING lt_data.
PERFORM setdata USING '3' 'N' CHANGING lt_data.
PERFORM setdata USING '4' 'C' CHANGING lt_data.

form setdata USING pv_ono TYPE zordh__28-ono
                  pv_pm type zordh__28-pm
             CHANGING lt_Data.
  WRITE: / pv_ono , pv_pm.
  ENDFORM.
  ```

>[!TIP]
>if this doesnt work for any reason make the structure of internal table global.
>in case of old systems and doensnt work
>then create table type and use
>![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/d9a65ef2-d9ca-40b3-ab25-1f611daef4f0)
>



















  










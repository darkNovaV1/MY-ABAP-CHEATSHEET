# FUNCTION MODULE..

##OUR NEW FUNCTION MODULE REQUIREMENT
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/7be3d547-e961-444c-b333-1d3e8a3d69b3)

>[!NOTE]
> we will go to se37 to create the function module.
> ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/4d53b7d9-30cd-4fd5-95eb-dc9bb1a8650a)
> ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/e10f9ae0-e303-4f70-9b88-35b445cb990a)
> we will declare input variable
> ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/6a6d4593-307c-4456-8492-f3c388e4c62e)
> ### for output we will declare a imternal table and not a variables bcoz our output is in te form of tables and not variables.
> we want output as an internal table
> interal table has 6 columns
> so for that we need a structure of 6 columns we cannot create structure from export field in function module there we cant write begin with etc etc...
>so cumpulsary we need to create structure using se11.
>![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/bb5357e3-7062-4202-b622-8d2bce8e98c3)
>![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/037522df-6995-41ef-97f3-a1538a738b45)
>![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/3e3fdd77-4564-4a2c-a9f7-511d5b7acdb0)

## now we will goto the function module andd...
- we will declare internal table in export field.
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/729c7a66-c0c1-4338-a5ef-1a6b1d3c1b1c)
- here type table of is not allowed
- so the other way is ## internalTable type TAbleType.
- so we need to create a table type

- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/fd3559d3-5ba3-41a5-bb80-3f3c0e8268cc)
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/606ceff6-c8b8-4ec9-b290-ea0559eabb7e)
- ## finally in function module export tab
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/e8ef9c1c-8014-40f8-89c2-a39e7952c66f)

# LOGIC CODE

- now we will goto sourcecode tab to write the logic.
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/1c1cce4a-e3bd-479b-aa06-74b427a5e8ff)
- what we need to do here is fetch data from header table from item table and combine it and save it to lt_final which is export parameter of function module.
- first thing first we need a 4 column from header table so we will create structure and workarea for the same.
-  ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/a3a79750-aa7a-4fad-935d-6a037346a5ff)
-  complete code snippet attached at last.
# 
- now from this two internal table we need to fill the final internal table.
- now we have to add data to our final internal table and how can we do that? we use append statement
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/ed584c54-2e6e-4de3-ab07-48e4248085a9)
- we need multiple loops read table not suitable here ..why?
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/678ea383-99d1-4092-9565-e00e2cea0626)

```abap
FUNCTION zfm_order_display.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(PONO) TYPE  ZORDH__28-ONO
*"  EXPORTING
*"     REFERENCE(LT_FINAL) TYPE  ZTSTR_ORDER_DTL
*"----------------------------------------------------------------------
  TYPES : BEGIN OF lty_data,
            ono   TYPE zordh__28-ono,
            odate TYPE zordh__28-odate,
            pm    TYPE zordh__28-pm,
            curr  TYPE zordh__28-curr,
          END OF lty_data.

  DATA: lt_data  TYPE TABLE OF lty_data,
        lwa_data TYPE lty_data.

  TYPES: BEGIN OF lty_data1,
           ono   TYPE zori_28-ono,
           oin   TYPE zori_28-oin,
           icost TYPE zori_28-icost,
         END OF lty_data1.

  DATA: lt_data1  TYPE TABLE OF lty_data1,
        lwa_data1 TYPE lty_data1,
        wa_final type zstr_order_dtl. "we dont need to create types structure here as we already created global sturcture of 6 columns.


  SELECT ono odate pm curr
    FROM zordh__28
    INTO TABLE lt_data
    WHERE ono = pono. "pono is func module import parameter

IF lt_data is NOT INITIAL.
SELECT ono oin icost
  FROM zori_28
  INTO table lt_DAta1
  FOR ALL ENTRIES IN lt_data
  WHERE ono = lt_data-ono.
ENDIF.

LOOP AT lt_data INTO lwa_data.
   LOOP at lt_data1 INTO lwa_data1 WHERE ono = lwa_data-ono.
     wa_final-ono = lwa_data-ono.
     wa_final-odate = lwa_data-odate.
     wa_final-pm = lwa_data-pm.
     wa_final-curr = lwa_data-curr.
     wa_final-oin = lwa_data1-oin.
     wa_final-icost = lwa_data1-icost.
     APPEND wa_final to lt_final. "lt_final is export parameter
     CLEAr: wa_final.
     ENDLOOP.
ENDLOOP.


ENDFUNCTION.
```

![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/884d6bd8-3c1e-4fd8-858c-961a7f2d12e3)

## okay so its working but customer dont run function module so we need to call the function module from program.
#
- we will create the new program
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/cda7f594-5c20-4856-9bd2-75bf7f37ec40)
- 
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/935d24ba-38a0-4297-93fc-57a89e34aa55)

- ## we are getting the run time errror here in this program
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/98242b72-bb07-4640-87fb-fa4a69031272)

## lets check how to resolve this
- its a simple solution as we all now that select option is an internal table with header line so in that sence we are passing the wokarea to the funciton module thats why there is an error
- so to pas an internal table we will add [] while passing internal tabl else its resembels workarea.

![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/167c7371-2d73-4191-b5c7-9078aa5aacff)
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/0e913cc6-ab65-44b3-827c-4d848f9d2ad8)

# thats all
# 🛺 happy journrey ahead 














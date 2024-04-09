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
- 











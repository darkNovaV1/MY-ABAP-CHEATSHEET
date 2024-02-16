$$
# EXPLICIT ENHANCEMENT
$$


![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/58986e80-e10d-46f6-a11d-733ea1994171)
Suppose we goto MM01 Tcode.
with the help of mm01 we can create a material into sap.

![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/670890ba-19e9-40a5-9090-4188c6d6e5c5)
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/db7afa16-15fb-41bb-9e76-2db9f6dba52c)

![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/ee8b3970-7a47-423d-88fc-ef595b68f4a9)



we are passing a material number..that number should must consist of number 0-9 anynumber.as of now we have created pharmam 
but sap has not restricted us but customer have a specific requirements. so we have t0 achieve this requirement.

we will open screen number and have a look whether if we have any explicit point where we can write our logic

after going through it we found a module internal_material_number_check.
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/82c15d04-1e32-41ab-b12e-bbad1b38f84c)

after going deep inside we found some enhancements points..
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/5345bdee-b086-4498-8c2d-4488fb6f1da3)


after some brainstorming we found out how ull we store neme of data.
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/b911d34c-21f9-4ea3-aa55-bec7a745b4ba)
we have debugged and have found that our material number is getting stored at rmmg1
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/239fc011-79e3-47fd-87f9-8bb37823191a)



## now we will impliment the enhancement and will write the logic here
now we have to enhance the logic so we have to click on enhance button(Jalebii bai)
then..
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/be4adadd-8c59-44f6-b042-c0e56b324059)
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/185624ed-efda-42ed-bac7-de84acf3e7db)

![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/25e69137-8a70-4c6d-a123-5af9a240d039)



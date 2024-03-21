![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/14885c8e-106e-4408-bf2b-24e3cc4e14c6)# CUSTOMER EXIT >>>
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/7e0fd6cd-2b50-4f4a-ae8f-43bd2a89ab31)
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/9ff99f62-9e7b-41d1-b4c6-175f76f22c7a)
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/63ed88db-f8f4-4a98-8630-67c32bda5664)

>[!tip]
> the aim is to write our own code to the function module and as we know the function module is the part of our program so wtever we write will get executed in the program

## now we will take the requirement and will achive using customer exit.
> VAO1 - tcode
> ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/389c4f13-58c7-4745-8d6d-8efdf45fe917)
> customer requirement is when we type order type and press enter sold to party should be automatically filled with 1 defaultely.
> ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/19f6ab41-28fb-43f1-b12a-a9711d08b609)


> ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/a2baa7b1-486f-4385-8757-a415b9c6f6dd)


>steps
- open va01 tcode
- enter /h and enable debugging
- hit enter and enter debugging
- create breakpoint
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/917e698f-31d9-40e2-9340-0d290d8cb113)
- press f8
- and now we have to hit and trial and find the correct point and check whether our requirement is possible feasiblly or not.

- now we can write the code in this funciton module.
- it is totally debugging and finding the exact point
- but this is not the only way , there are other ways also to find the function module.

- ## lets see other way
- goto va01 tcode
-![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/b3bf8c4e-fb17-450f-81ce-209ef15e7586)
-go to system> status > double click the program name and enter inside, now go go GOTO > Attributes and you will find the package name.
- after taking the package name of the transacion goto SMOD tcode and put the package name there
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/981398c6-1f32-4a34-bb3e-efcd385a3b1c)
- execute
- and you will find a lot of customer exits there
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/ae78354f-7f7a-4482-9e26-af7dd80b975a)
- double click on any of the customer exit and you will find function module exit menu exit and screen exit.

- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/9819bd62-94a3-4ca2-a0ea-25a388b7de33)
- image reference:
  1. if you have entry there it means function module exit is possible
  2. if you have entry there means menu exit is possible
  3. if you have entry there means screen exit is possible.
  4. now dobule click the funciton module entry and confirm is that the samw which you required or not.
 
# third way
## now we will discuss one more way, and mostly people prefer that way
1. we will go to se84 tcode
2. go to enhancementes > expand customer exits > put the package name of the program and execute. 



# now uptill following this we found the function module which we imliment can get us to our soltion.
lets say this funcition module.
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/e66cf926-6854-46a8-8161-d67ced87fa07)

## if we want to implement customer exit, menu exit, screen exit for any customer exit we have a dedicated tcode CMOD and we always use that.

>[!NOTE]
>previously we learnt about smod tcode that is used to find any customer exit be it function module exit, screen exit or menu exit.
>means we can find any kind of customer exit through smod
>and to implement any kind of custmer exit we use CMOD so its a golden rule.
>![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/c08fb183-ec2e-45c7-8fdf-e92c313bf81c)
>

![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/3898d176-0abf-406b-baed-dd724c11b9c9)

1. goto cmod tcode
2. ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/d3ad0a6c-f03e-4841-9dac-8a1a8319f4f4)
3. pass project name and click create
4. zfexit78 suppose
5. ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/2a5981b1-9549-4641-8f76-b669772fee91)
6. ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/151629b6-9130-4fb2-89b1-b1beff9bd98d)
7. then click enhancement asignment tab
8. ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/b0c59637-cf5c-438b-8784-b3ececef6245)
9. now we have to pass the customer exit name here
10. to pass the customer exit name here goto smod > utilities > find > pass package name and get the exit name from there and pass.
11. ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/901348ba-806e-4423-86fe-eb12a30ef460)
12. ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/607ee316-2ae4-47ae-bf69-fe6bc578ba9c)
13. then  click on components tab and you will redirect to
14. ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/2b314d95-b97d-4e0d-8683-088407a13920)
15. now double click on that function module.
16. now goto source code
17. now we will enhance that include in customer namespace (customer namespace because yes its starting from Z).
18. so dblclick and create that include.
19. now we all know if we want to take output from funcion module we take through export
20. ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/dfc67986-d97d-4364-9b75-f17a039c5684)
21. so we will use that export parameter.
22. ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/26712b15-e443-4582-a31f-6efddd4ea56c)
23. display mode and active..
24. ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/6bffd354-9503-4226-9bcb-fa98779ee906)
25. this 🔴 should be turn into 🟢.
26. ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/280b9fa3-eaac-47f3-b986-617fd86ee57c)
27. 











































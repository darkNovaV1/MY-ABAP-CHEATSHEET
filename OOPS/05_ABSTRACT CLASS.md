# `😎 ABSTRACT CLASS`

![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/3d0ab238-9e17-4573-af55-bb5a97f256a1)

## `We will learn to use abstract class using SE24 as well as direct coding.`

![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/74a09528-1601-4c31-b460-19458ac8877f)

-> Never take abstract class as final, else how would we extend that class.

![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/5e8a712b-5e63-4c62-8464-2e5df06b63a5)
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/554c5334-b6c2-41c4-820e-f1de122a8255)
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/e9cd0477-f0bd-4d2c-81a0-9003018f0b56)

-> we will declare the method and parameters, importing and exporting..

![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/442b1a6b-3bb7-4dd3-ad29-08b8e12c2f2f)

-> currently this method is not an abstract method, so if we neeed to make it we wil go to this button, `properties.`

![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/163e913a-afec-455a-a99c-1a7e0cf696e9)

And from here, we can convert this method to abstract.

![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/f8bb8551-7095-49aa-9cab-5316319c5ddd)

`change and activate.`

# `ABSTRACT CLASSES SUBCLASSSES` 
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/eb2e2206-04cc-4e4e-a923-f2abb549f568)

### -> `Now we will create sub-class from this abstract class.`


#### -> `From this subclass we will create 2 sub classes, one to display sales order details, and one to display billing details.`


![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/c38df7f5-5fbb-49b0-80d4-e54e65e4965c)

1. Sub class can be final, not an issue.
2. ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/a498bfcd-c4c8-41cc-b9fb-84ea286d4fa6)
3. in properties > superclass we will pass the superclass name.
4. ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/5c9e0376-6812-4d5d-b248-64736084e066)
5. when we goto method and try to activate, it will give us error.
6. because this method is declared in our abstract/super classs, we need to define this method.
7. ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/6976ed6b-ff60-4673-82ab-49a7d6481698)
8. now we will create another subclass.
9. ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/878b5c34-b920-42df-b025-56597a99c40e)
10. ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/39708814-9c7e-489a-aea7-51a3e3d4051f)
11. ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/0487d058-04eb-4f3a-8d7b-fb275de7e53b)
12. ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/14da60ed-5e4d-4a4b-8528-bbfe54da2835)
13. ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/1e20d320-5747-4baf-8fd1-cfaab2185421)
14. `we declared the method once in the superclass, but both sub classes have implemented in there own way..this is called polymorphism`

 #`PROGRAM`
 1. Now we will create a program, that will print sales order deteils or billing details depending on the condition.
 2. ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/17d9d54c-2923-4403-8de0-6fc9ccd60e96)
 3. ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/41ed1635-8891-40fe-825e-d771256a3e36)
 4. whenever user will click the first radio button, we will call the method of first subclass and likewise.
 5. ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/a186b7fe-b82b-4e54-ba9f-2bad5994ae03)
 6. ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/2925ac5a-fc0c-4ef9-903c-77410f704c31)
 7. ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/f837fcef-98bd-4fdc-95ae-14256096d54d)
 8. wrap with `IF_ELSE`
 9. ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/96a51d21-9feb-4a46-b5fc-13c370475a20)
 10. ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/4d2407e6-70bf-41ae-94b6-cebb100ac523)
 11. ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/8ca1ae28-c147-468d-92b3-6b5a4b61b892)

# `EXTRA TOPICS`
## `HOW TO CREATE ABSTRACT CLASS LOCALLY IN PROGRAM`
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/775bf1b1-4e31-4538-a858-d2da6a47a258)
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/2da5120a-f112-43be-a0d3-b7d0706e9965)
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/8c5dcffc-417a-4614-882c-eafd5924166b)
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/ba771914-cc7c-4032-8d36-c57625a8adbf)
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/978339c2-f5b8-45ea-9b4e-71e5bbd420bf)
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/3108bdda-8102-41c6-b34d-8541fa593ade)




































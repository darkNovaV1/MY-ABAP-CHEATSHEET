# 🌱 KERNAL BADI 🌱

![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/fd5f4509-40f5-4465-8b5e-8666b5392b70)
badi who have enhancement spot are new badi and rest are classic badi.

# Lets take the requiremnent and start working on that..
### lets say client brings the requiremnt that we dont want this two additional buttons in mmo1 tcode. iein 
application toolbar.

```
|-menubar
|-function keys
|-titlebar
|-application toolbar
```

![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/280f1f74-3007-40c3-a115-0778fe09f241)

![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/229bc7ad-0875-44c2-81fe-4af5f3c26284)
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/27de6aed-1e9e-445a-bb3d-ae34f6c0d65e)

- this is what can help us achieve our requiremnt.
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/8690d3f0-57a2-4cd6-a776-5991514f160c)
>[!NOTE]
>this badi is in enhancement spot so means thats a new badi or kernal badi
>so this is the most prefereable way to find badi just put the break statement at get badi and call badi.
> this is the first way sencond and third way is same as the classic BADI.
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/7bbc36b5-56c1-41c4-96d2-12523b70c048)
>now we will implement this badi using se19 further.
>
>
# ✈

![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/53ea269a-1544-41dd-9eb1-9b35e53e4c86)

goto se19
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/97ef94bb-a7be-4b6a-8972-87613996cc31)

we will pass the enhancement spot of badi
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/60301f13-c94c-4849-af0c-635d6f72291f)
right now it same as badi bt might nt always.
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/a321c94a-546b-46a6-9cf5-23ef07a5f640)
enhanceent implementation is the container for badi implementation.

![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/2731adab-28e1-4ab4-a623-2b69c1b76461)

- save it
- in next screen, give name of badi implementation.
- then choose the respective badi in badi defination.
- give implementation class name, in normal badi it comes atomatically but here we have to provide.
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/493e0de2-acb7-4296-a6f8-724a890847ab)
- so for this badi defination, we are creating this badi implementation,and this badi implementation is store into which contaiener??? enhancement implementation.
- ok and save
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/e0b267a9-c510-4b2e-9473-120aed4bbc56)
- double click the class
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/24058c81-cc12-41e9-976f-62702bec7a4d)
- now we want to write thee logic in this particular method.
- but we will double click all the methods so that it gets implemented.
- activate
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/2d972acd-7fc7-41be-9400-25af5c8cfa18)
-  

  ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/0b103c40-02be-4a30-a572-3530193b8339)
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



















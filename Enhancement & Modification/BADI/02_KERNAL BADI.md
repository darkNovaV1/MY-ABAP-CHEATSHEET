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





















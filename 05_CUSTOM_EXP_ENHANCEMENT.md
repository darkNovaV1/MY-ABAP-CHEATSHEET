![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/d7a3c71f-fd4a-412c-bb45-008972aeec65)# Explicit Enhancement in Custom Program.
GOTO EDIT AND CREATE ENHANCEMENT AT ANY PROGRAM..
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/ab837361-a616-4522-9f70-939522ced304)
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/ec85947f-c869-4873-baa4-84347b4ac0e6)
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/ded33d84-d60c-4b83-9595-bdbdbda58f22)
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/bb2147f0-f036-4d26-979d-a4fc1a036d82)
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/9e05c60a-bd9f-4216-a1f3-42f1ae92b815)
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/94a15fb9-c1e3-48a0-9bfc-2c6de5193cde)



![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/91c79c58-5ed8-41dc-91da-47eb57d6bcea)
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/4e7de38c-9ee3-4ad5-9c57-5f4acca23044)





```abap


REPORT ZPRG_DEMO_201.

DATA: lv_total TYPE n LENGTH 3.
PARAMETERS: p_input1(2) TYPE n.
PARAMETERS: p_input2(2) TYPE n.

ENHANCEMENT-POINT ZEP_201 SPOTS ZES_201 .
*$*$-Start: ZEP_201-----------------------------------------------------------------------------$*$*
ENHANCEMENT 1  ZIMP_MULTI_NUM.    "active version

lv_total = p_input1 * p_input2.

WRITE: /'the multiplication is ', lv_total.



ENDENHANCEMENT.
*$*$-End:   ZEP_201-----------------------------------------------------------------------------$*$*



lv_total = p_input1 + p_input2.

WRITE: /'the total is ', lv_total.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""$"$\SE:(1) Include ZPRG_DEMO_201, End                                                                                                                        S
*$*$-Start: (1)---------------------------------------------------------------------------------$*$*
ENHANCEMENT 1  ZSUBTRACTION_201.    "active version

lv_total = p_input1 - p_input2.
WRITE: /'the Subtraction is ', lv_total.


ENDENHANCEMENT.
*$*$-End:   (1)---------------------------------------------------------------------------------$*$*

```


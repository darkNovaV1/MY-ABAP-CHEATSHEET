# LETS DO A BIT OF MORE ENHANCEMENT
### lets say we have this program of two numbers and lets perform a subtraction using enhncements.

```abap


REPORT ZPRG_DEMO_201.


PARAMETERS: p_input1(2) TYPE n.
PARAMETERS: p_input2(2) TYPE n.

DATA: lv_total TYPE n LENGTH 3.
lv_total = p_input1 + p_input2.
WRITE: /'the total is ', lv_total.
```
## LETS START IT..
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/55226d4f-e4de-4961-933a-a58320c9cfc6)
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/34e10779-2d9b-48e6-be8a-74987d8f9ca4)



```abap



REPORT ZPRG_DEMO_201.


PARAMETERS: p_input1(2) TYPE n.
PARAMETERS: p_input2(2) TYPE n.

DATA: lv_total TYPE n LENGTH 3.
lv_total = p_input1 + p_input2.
WRITE: /'the total is ', lv_total.


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""$"$\SE:(1) Include ZPRG_DEMO_201, End                                                                                                                        S
*$*$-Start: (1)---------------------------------------------------------------------------------$*$*
ENHANCEMENT 1  ZSUBTRACTION_201.    "active version
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""$"$\SE:(2) Include ZPRG_DEMO_201, End, Enhancement ZSUBTRACTION_201, Start                                                                                   S

lv_total = p_input1 - p_input2.
WRITE: /'the Subtraction is ', lv_total.


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""$"$\SE:(3) Include ZPRG_DEMO_201, End, Enhancement ZSUBTRACTION_201, End                                                                                     S
ENDENHANCEMENT.
*$*$-End:   (1)---------------------------------------------------------------------------------$*$*


```

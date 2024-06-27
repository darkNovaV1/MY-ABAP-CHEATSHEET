#  OOPS  
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/822ef105-4d7e-47bc-8cbd-c8fd1d806ca8)
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/6249b03d-e76b-44ad-8eb9-ca0337d201e4)


# SE24 - _TCODE FOR CLASS_.

### - ZUSUAL_ABAP_CLASS_BB
- blank class in eclipse
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/6077e776-e66b-4278-80ed-32dabf7a8c45)

# TASK.
##  Q- The input will be sales document number, and the output will be sales document number details. Achieve this using class functionalities.

![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/97463c84-4025-41f5-aca1-22925733d22c)
- in object oriented ABAP we will always write the logic using methods.
- method is always of 2 types.
-   instance method and static method.
-   
```abap
CLASS ZUSUAL_ABAP_CLASS_BB DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    " Public instance method declaration
    METHODS ZDEMO_INSTANCE_PUBLIC.
    
    " Public static method declaration
    CLASS-METHODS ZDEMO_STATIC_METH_PUB.

  PROTECTED SECTION.
    " Protected instance method declaration
    METHODS ZDEMO_INSTANCE_PROTECTED.

  PRIVATE SECTION.
    " Private instance method declaration
    METHODS ZDEMO_INSTANCE_PRIV.

ENDCLASS.

```

# ABAP Class Definition: `ZUSUAL_ABAP_CLASS_BB`

## Class Definition Syntax

```abap
CLASS ZUSUAL_ABAP_CLASS_BB DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

```
Breakdown of Components
CLASS ZUSUAL_ABAP_CLASS_BB DEFINITION:

Starts the definition of a new class named ZUSUAL_ABAP_CLASS_BB.
PUBLIC:

Specifies the visibility of the class. A public class can be accessed from other classes and programs.
FINAL:

Indicates that the class is final. A final class cannot be subclassed, meaning no other class can inherit from this class.
CREATE PUBLIC:

Specifies the instantiation visibility of the class. When a class is defined with CREATE PUBLIC, it means that instances of this class can be created from any other class or program.

Explanation
Visibility (PUBLIC): The class ZUSUAL_ABAP_CLASS_BB is accessible from other programs and classes. Any public methods or attributes defined within this class can be called from outside the class.

Final (FINAL): No other class can derive from ZUSUAL_ABAP_CLASS_BB. This is used to prevent inheritance, ensuring that the class's implementation remains unchanged and not extended.

Instantiation (CREATE PUBLIC): Objects of this class can be created by any other program or class. This is specified to control where and how instances of the class can be created.

__________________________________
```abap
DATA: obj TYPE REF TO ZUSUAL_ABAP_CLASS_BB.
CREATE OBJECT obj.
```
Breakdown of Components
CLASS ZUSUAL_ABAP_CLASS_BB DEFINITION:

Starts the definition of a new class named ZUSUAL_ABAP_CLASS_BB.
PUBLIC:

Specifies the visibility of the class. A public class can be accessed from other classes and programs.
FINAL:

Indicates that the class is final. A final class cannot be subclassed, meaning no other class can inherit from this class.
CREATE PUBLIC:

Specifies the instantiation visibility of the class. When a class is defined with CREATE PUBLIC, it means that instances of this class can be created from any other class or program.
Explanation
Visibility (PUBLIC): The class ZUSUAL_ABAP_CLASS_BB is accessible from other programs and classes. Any public methods or attributes defined within this class can be called from outside the class.

Final (FINAL): No other class can derive from ZUSUAL_ABAP_CLASS_BB. This is used to prevent inheritance, ensuring that the class's implementation remains unchanged and not extended.

Instantiation (CREATE PUBLIC): Objects of this class can be created by any other program or class. This is specified to control where and how instances of the class can be created.

Example Usage
In a program, you might create an instance of this class like so:

abap
Copy code
DATA: obj TYPE REF TO ZUSUAL_ABAP_CLASS_BB.
CREATE OBJECT obj.
This example creates an object obj of type ZUSUAL_ABAP_CLASS_BB, demonstrating the use of the CREATE PUBLIC keyword which allows object instantiation outside the class.

Summary
The line CLASS ZUSUAL_ABAP_CLASS_BB DEFINITION PUBLIC FINAL CREATE PUBLIC. defines the class with the following properties:

It is publicly accessible.
It is a final class, preventing inheritance.
It allows public instantiation, so objects of the class can be created from any other code.

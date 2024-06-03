![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/3f582e8d-7ca1-4f90-8bd9-bf10b37af13c)# ADOBE FORM

- whenever we need to create adobe forms the first thing we need to create is interface.
- then we will use that interface into the adobe form.
- so we will go to SFP tcode and create the interface.
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/03121853-0a02-49b5-aba6-ae1d61fcfcf0)
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/f79d9caf-bbaa-45dc-9398-830c73cccfb6)
- import this  4 things in the interface, which we need to get from the program
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/b301f625-5173-4f53-8957-8d0cce1a9290)

- now we will create the adobe form and use this interface.
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/1baab5aa-157e-4e20-a701-c1ad764fafe2)
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/7275bc1a-a95b-41ca-8171-ab29c85955c1)
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/53b4b002-42ea-4699-97e0-796f7da13ad7)
- now on the left we have interface and on the right we have adobe forms
- so now we will drag and drop the parameters from interface to adobe forms.
- now we will click on layout and start designing ...
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/ddc89f26-5d7a-4d9e-b36f-568935eae604)
- now we will create 3 section just as we did in smartforms
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/407907cc-5dc2-4908-980f-eec063b920a1)
- now we will create 3 subforms
- ## most important thing to check first is your page is flowed or positioned
- because if we change later, all layout get messed.
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/de04a433-0bf6-43c8-80a8-17e293fb5fe8)
- for example our items are dynamic in nature.
- we can have any number of items.
- so our page must be flowed so our item data can flow to anotherpage if needed.


## now lets create our first subform
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/49bc8f09-cfd1-4c9a-8513-fc162cdbad04)
- binding
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/025b6d96-38d3-4538-b442-e4ba1ade3759)

- in cases if we have internal table directly we can just drag and drop it from data view.
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/b76b2e74-ca9c-414f-ac61-9a3216cd0276)
- # important point
- item details subform shoudl be positioned to flowed.
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/b0985fdf-5d83-49d4-8345-7559d4885e90)

- Now we will call this adobe form from our program.

- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/42c1cbe6-299b-4c9f-a2ee-e1bb75004dbf)
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/156c8cff-55a0-426f-b300-04487c7a8158)
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/b3abbb70-fea4-4c48-9c3a-97f66f985cf8)
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/a6468c37-e55f-4619-b469-b604f953c6e0)
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/d339dfd3-7587-4d91-a597-bf043a743b08)
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/77eaf582-6be8-40da-8536-835ca2d4a3cf)
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/03b989af-e80d-4020-beb6-6a27985a4267)

- ### correction - smartform name in quotes as string
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/08ffc8bd-f5d3-4360-a6dd-9eae5f578907)

- # to bypass select and output preview
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/ec0013fc-0a27-44dd-8182-2076214854b2)


# SCRIPTING
- now we will use JS SCRIPTING LANGUAGE to hide the "SO CREATED BY " text and "TO DATE" field if no data is passed from the input.
- swipe layout a bit down
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/537fb403-5550-4765-aded-5df4e866cd0e)
- choose the particular element and choose initialise.
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/6996db6a-1230-467f-b3f5-b82427fea6ab)
- select the element and write the code.
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/5a269a66-192c-4210-be1c-ac95cd2b1743)
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/e32096e9-7a56-4dfe-a01c-302d2c0859cf)
- ## wrking condittion
 ```js
  if (this.rawValue != null && this.rawValue != "") {
    this.presence = "visible";
} else {
    this.presence = "hidden";
}
  ```

























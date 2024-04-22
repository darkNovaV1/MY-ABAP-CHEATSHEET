# Data Migration Techniques

![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/15cc9e8e-a4a5-46f6-bd2f-9c9e70bd8dc3)
![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/fd3f4f86-19a1-4e9d-ae32-5b471ea951e1)


>[!NOTE]
>Batch data communication in data migration refers to the process of transferring data in chunks or batches, rather than transferring all the data at once. It is commonly used in scenarios where large volumes of data need to be migrated between systems.
>
>Here's an example to illustrate batch data communication in data migration:
>
>Let's say you have a source database system ("OldDB") and a target database system ("NewDB"), and you need to migrate a large table called "Customers" from OldDB to NewDB. The Customers table contains millions of records.
>
>To perform batch data communication in this data migration process, you can follow these steps:
>
>Define the batch size: Determine the number of records to be transferred in each batch. For example, let's set the batch size to 10,000 records.
>
>Extract data in batches: In OldDB, extract the data from the Customers table in batches of 10,000 records. You can use SQL queries with a combination of OFFSET and FETCH NEXT clauses or any other method supported by the database system to retrieve the data in batches.
>
>Transfer the data: Once you have extracted a batch of records from OldDB, transfer the data to NewDB. This can be done using various methods such as bulk insert, ETL (Extract, Transform, Load) tools, or custom scripts.
>
>Load the data: In NewDB, load the transferred data into the Customers table. Again, use techniques like bulk insert or the appropriate data loading mechanism provided by the database system.
>
>Repeat the process: Repeat steps 2 to 4 until all the data from the Customers table has been migrated. Each batch of data is extracted, transferred, and loaded until the entire dataset is migrated.
>
>By using batch data communication, you can efficiently migrate large volumes of data while managing resource utilization and minimizing the impact on both the source and target database systems. It allows for better control and monitoring of the migration process, as well as the ability to handle any potential errors or issues that may arise during the data transfer.


#
example
if we want to record a material entry we should know all the steps and dont use any f1 f4 help..
and refer mara and makt table after creating a maerial entry in mm01 to see what actually you passed and what actually gets stored.

- example:
- we are creating the new recording for mm01
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/d2fa2a33-cc0a-4cd7-8f08-f4d1754978c1)
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/a42d0c8c-f323-4348-bb74-949849f81e6e)
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/5fa27696-b82b-4312-a72e-aba2b51429fc)
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/6dfa9942-843b-40ec-8405-320498f61033)
- ## precaution for recording
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/10006478-58ad-4ace-b3d2-1a93962355d9)
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/c79e872d-4f81-47d6-8a9b-7db6f14abf10)
- click on savae button and we will see our recording
- save and back
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/b97698b6-3c88-4feb-b62f-3d54cb0f6871)
- this is the recording which we created.
- now we will select this recording and we will transfer this recordin to the program. means we will create the program which will consist of this recording.
- so select recording and click on create program
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/1275b2aa-ff63-4fee-9265-926e7b543f5b)
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/660e6b92-cf9d-46fc-9802-82b61889fc1e)
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/c0690871-76cc-4272-b429-17d6f9b68b93)
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/98e29db7-1cf3-493a-a111-eb0897e82b17)
- so this is the recording we did..
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/de2695b9-97a1-488c-a960-f9c5cd588f50)
- this is the program name and screen number of mm01 and similarly sap recorded all the steps..



#
# BDC FILE UPLOAD...


![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/0cfb05ae-e1db-460f-9d40-f56f4dfd06d2)
- Now suppose we have this data ..we cant use it directly..
- we need to convert to appropriate format.. sap format.
- for example if we pass pharmaseutical in mm01 sap stores P so we need to fix everything like that by verifying it..
- sililarly material type is 4 char long but we chooses raw material from dropdown so we need to adjust that to what actualy sap stores for what material. sap stores a 4 digit unique code.
- example:
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/f93c97fb-0521-4df5-9337-62f012db54da)
- similarly for each sap stores EA
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/f1fbc7ba-7382-4a54-9480-d4aee862e2c9)
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/288f885d-ffc1-47b9-8c24-8f35cc7ff900)
- we have converted the data to sap accepted format and our ### 2nd step is done.
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/d99d5e06-4681-4c07-b3e7-d91075159d70)
- now we have extracted the data to notepad seperated by tabs.
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/73677ce1-60f3-4a88-877d-9f34cead1179)
- we will create the parameter to take input that file.
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/d27cfae9-e833-4adc-a8f8-d1b6558b4c72)
- we wll create a search help and call the f4_filename
- it returns the path of the file we select.
- then we will use one another function module **GUI_UPLOAD** to read the data from that file.
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/93249b20-9f1a-41f4-b6d5-8c7d03064a78)
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/7e00aa07-cf51-4cc4-b1bd-d5e7d7131739)
- we need to declare the interna table of 5 columns to receive the output.
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/b9f03898-7266-4267-aac4-015ac3df6b90)
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/362b9fcf-e8a1-4f9c-b345-0930ebd2850d)
- ##
- ![image](https://github.com/bhuvabhavik/MY-ABAP-CHEATSHEET/assets/49744703/cd3cdebc-38d2-493b-b96f-5a70cbb60db4)
- in gui upload file name is of type string , but our p_name is of type char so there is a type conflict.

- 








- 











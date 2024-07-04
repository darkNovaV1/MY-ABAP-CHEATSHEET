*&---------------------------------------------------------------------*
*& Report Zbhavik_TIMESTAMP
*&---------------------------------------------------------------------*
*& To get Local timestamp
*&---------------------------------------------------------------------*
REPORT Zbhavik_TIMESTAMP.

DATA: stamp_1 TYPE TIMESTAMP,
      stamp_2 TYPE TIMESTAMPL.

" to fetch  data from system
GET TIME STAMP FIELD stamp_1.

" here TIME ZONE SY-ZONLO is for formatting Output.
Write: / 'The short time stamp is:', stamp_1 TIME ZONE SY-ZONLO.

GET TIME STAMP FIELD stamp_2.
Write: / 'The long time stamp is:', stamp_2 TIME ZONE SY-ZONLO.

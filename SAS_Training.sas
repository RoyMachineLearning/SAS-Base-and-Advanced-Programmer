%let path = u:\ecprg193;
libname orion "&path";

title "Car Inventory";
proc freq data = sashelp.cars;
tables Type / nocum;
run;
title;

/****************************************************************************************************************************/

/*++++++++++++++++++++++++++++++++++++++++++++++*/
/* THIS CODE CREATES PRACTICE DATA FOR ECPRG193 */
/* WARNING: DO NOT ALTER CODE BELOW THIS LINE   */
/*++++++++++++++++++++++++++++++++++++++++++++++*/

data _null_;
   if "&sysscp"="WIN" then do;
     call symputx('rawdata',"&path\"); 
	 end;
   else do;
     call symputx('rawdata',"&path/"); 
     end;
run;


data ORION.CHARITIES;
   attrib Company length=$40;
   attrib ContactType length=$10;
   attrib Code length=$6;

   infile datalines dsd; * SAS treats two consecutive delimiters as a missing value and removes quotation marks from character values.;
   input
      Company
      ContactType
      Code
   ;
datalines4;
AQUAMISSIONS INTERNATIONAL,Charity,AQI2
"CANCER CURES, INC.",Charity,CCI2
"CONSERVE NATURE, INC.",Charity,CNI2
CHILD SURVIVORS,Charity,CS2
CUIDADORES LTD.,Charity,CU2
"DISASTER ASSIST, INC.",Charity,DAI2
EARTHSALVORS,Charity,ES2
FARMING FOR COMMUNITIES,Charity,FFC2
MITLEID INTERNATIONAL,Charity,MI2
SAVE THE BABY ANIMALS,Charity,SBA2
VOX VICTIMAS,Charity,V22
"YES, YOU CAN RECYCLE",Charity,YYCR2
;;;;
run;

data ORION.CONSULTANTS;
   attrib Code length=$6;
   attrib Company length=$30;
   attrib ContactType length=8;

   infile datalines dsd;
   input
      Code
      Company
      ContactType
   ;
datalines4;
AEK3,ANGELA E. KEARNEY,3
AQI2,AQUAMISSIONS INTERNATIONAL,
ATS1,A TEAM SPORTS,
CBO3,CLAIRE B. OWENS,3
CCI2,"CANCER CURES, INC.",
CNI2,"CONSERVE NATURE, INC.",
CS1,CAROLINA SPORTS,
CS2,CHILD SURVIVORS,
CU2,CUIDADORES LTD.,
DAI2,"DISASTER ASSIST, INC.",
DSI1,DOLPHIN SPORTSWEAR INC,
ES2,EARTHSALVORS,
ESL1,EA SPORTS LIMITED,
FFC2,FARMING FOR COMMUNITIES,
HT1,HIGHPOINT TRADING,
JB3,JUDITH BRUMFIELD,3
LAF3,LAUREN A. FREEMAN,3
LBSA1,LE BLANC S.A.,
MI2,MITLEID INTERNATIONAL,
MK3,MARTINA KOITZSCH,3
MSI1,MIKE SCHAEFFER INC,
NSI1,NAUTLIUS SPORTSWEAR INC,
NY3,NORIKI YOSHIKAWA,3
OOL1,OUTBACK OUTFITTERS LTD,
PJR3,PATRICIA J. ROHLOFF,3
RBW3,ROBERT B. WANG,3
ROI1,ROLL-OVER INC,
SBA2,SAVE THE BABY ANIMALS,
SS3,STEPHANIE SAWYER,3
STA1,SVENSSON TRADING AB,
TSG1,TRULS SPORTING GOODS,
TSI1,TRIPLE SPORTSWEAR INC,
V22,VOX VICTIMAS,
VB3,VICKIE BALLARD,3
WB3,WAY BALDRIDGE,3
WO3,WOUTER OVERBY,3
YYCR2,"YES, YOU CAN RECYCLE",
;;;;
run;

data ORION.COUNTRY;
   attrib Country length=$2 label='Country Abbreviation';
   attrib Country_Name length=$30 label='Current Name of Country';
   attrib Population length=8 label='Population (approx.)' format=COMMA12.;
   attrib Country_ID length=8 label='Country ID';
   attrib Continent_ID length=8 label='Numeric Rep. for Continent';
   attrib Country_FormerName length=$30 label='Former Name of Country';

   infile datalines dsd;
   input
      Country
      Country_Name
      Population
      Country_ID
      Continent_ID
      Country_FormerName
   ;
datalines4;
AU,Australia,20000000,160,96,
CA,Canada,,260,91,
DE,Germany,80000000,394,93,East/West Germany
IL,Israel,5000000,475,95,
TR,Turkey,70000000,905,95,
US,United States,280000000,926,91,
ZA,South Africa,43000000,801,94,
;;;;
run;

data ORION.CUSTOMER;
   attrib Customer_ID length=8 label='Customer ID' format=12.;
   attrib Country length=$2 label='Customer Country';
   attrib Gender length=$1 label='Customer Gender';
   attrib Personal_ID length=$15 label='Personal ID';
   attrib Customer_Name length=$40 label='Customer Name';
   attrib Customer_FirstName length=$20 label='Customer First Name';
   attrib Customer_LastName length=$30 label='Customer Last Name';
   attrib Birth_Date length=8 label='Customer Birth Date' format=DATE9.;
   attrib Customer_Address length=$45 label='Customer Address';
   attrib Street_ID length=8 label='Street ID' format=12.;
   attrib Street_Number length=$8 label='Street Number';
   attrib Customer_Type_ID length=8 label='Customer Type ID' format=8.;

   infile datalines dsd;
   input
      Customer_ID
      Country
      Gender
      Personal_ID
      Customer_Name
      Customer_FirstName
      Customer_LastName
      Birth_Date
      Customer_Address
      Street_ID
      Street_Number
      Customer_Type_ID
   ;
datalines4;
4,US,M,,James Kvarniq,James,Kvarniq,6752,4382 Gralyn Rd,9260106519,4382,1020
5,US,F,,Sandrina Stephano,Sandrina,Stephano,8590,6468 Cog Hill Ct,9260114570,6468,2020
9,DE,F,,Cornelia Krahl,Cornelia,Krahl,6632,Kallstadterstr. 9,3940106659,9,2020
10,US,F,,Karen Ballinger,Karen,Ballinger,10518,425 Bryant Estates Dr,9260129395,425,1040
11,DE,F,,Elke Wallstab,Elke,Wallstab,6802,Carl-Zeiss-Str. 15,3940108592,15,1040
12,US,M,,David Black,David,Black,4850,1068 Haithcock Rd,9260103713,1068,1030
13,DE,M,,Markus Sepke,Markus,Sepke,11890,Iese 1,3940105189,1,2010
16,DE,M,,Ulrich Heyde,Ulrich,Heyde,-6194,Oberstr. 61,3940105865,61,3010
17,US,M,,Jimmie Evans,Jimmie,Evans,-502,391 Greywood Dr,9260123306,391,1030
18,US,M,,Tonie Asmussen,Tonie,Asmussen,-698,117 Langtree Ln,9260112361,117,1020
19,DE,M,,Oliver S. F��ling,Oliver S.,F��ling,2975,Hechtsheimerstr. 18,3940106547,18,2030
20,US,M,,Michael Dineley,Michael,Dineley,1202,2187 Draycroft Pl,9260118934,2187,1030
23,US,M,,Tulio Devereaux,Tulio,Devereaux,-2221,1532 Ferdilah Ln,9260126679,1532,3010
24,US,F,,Robyn Klem,Robyn,Klem,1248,435 Cambrian Way,9260115784,435,3010
27,US,F,,Cynthia Mccluney,Cynthia,Mccluney,4853,188 Grassy Creek Pl,9260105670,188,3010
29,AU,F,,Candy Kinsey,Candy,Kinsey,-7847,21 Hotham Parade,1600103020,21,3010
31,US,F,,Cynthia Martinez,Cynthia,Martinez,1314,42 Arrowood Ln,9260128428,42,2020
33,DE,M,,Rolf Robak,Rolf,Robak,-6155,M�nsterstra�e 67,3940102376,67,1030
34,US,M,,Alvan Goheen,Alvan,Goheen,10244,844 Glen Eden Dr,9260111379,844,1020
36,US,M,,Phenix Hill,Phenix,Hill,3014,417 Halstead Cir,9260128237,417,3010
39,US,M,,Alphone Greenwald,Alphone,Greenwald,10433,4386 Hamrick Dr,9260123099,4386,2030
41,AU,M,,Wendell Summersby,Wendell,Summersby,3258,9 Angourie Court,1600101527,9,1030
42,DE,M,,Thomas Leitmann,Thomas,Leitmann,8440,Carl Von Linde Str. 13,3940109715,13,1020
45,US,F,,Dianne Patchin,Dianne,Patchin,8526,7818 Angier Rd,9260104847,7818,2010
49,US,F,,Annmarie Leveille,Annmarie,Leveille,10424,185 Birchford Ct,9260104510,185,2030
50,DE,M,,Gert-Gunter Mendler,Gert-Gunter,Mendler,-8020,Humboldtstr. 1,3940105781,1,2030
52,US,M,,Yan Kozlowski,Yan,Kozlowski,4844,1233 Hunters Crossing,9260116235,1233,1030
53,AU,F,,Dericka Pockran,Dericka,Pockran,-560,131 Franklin St,1600103258,131,1040
56,US,M,,Roy Siferd,Roy,Siferd,-8004,334 Kingsmill Rd,9260111871,334,1030
60,US,F,,Tedi Lanzarone,Tedi,Lanzarone,4891,2429 Hunt Farms Ln,9260101262,2429,1030
61,DE,M,,Carsten Maestrini,Carsten,Maestrini,-4194,M�nzstr. 28,3940108887,28,2030
63,US,M,,James Klisurich,James,Klisurich,5107,25 Briarforest Pl,9260125492,25,2020
65,DE,F,,Ines Deisser,Ines,Deisser,4949,Bahnweg 1,3940100176,1,1020
69,US,F,,Patricia Bertolozzi,Patricia,Bertolozzi,8533,4948 Dargan Hills Dr,9260116402,4948,1020
71,US,F,,Viola Folsom,Viola,Folsom,5014,290 Glenwood Ave,9260124130,290,2020
75,US,M,,Mikel Spetz,Mikel,Spetz,10396,101 Knoll Ridge Ln,9260108068,101,1020
79,US,F,,Najma Hicks,Najma,Hicks,10979,9658 Dinwiddie Ct,9260101874,9658,1030
88,US,M,,Attila Gibbs,Attila,Gibbs,1145,3815 Askham Dr,9260100179,3815,1030
89,US,F,,Wynella Lewis,Wynella,Lewis,-7765,2572 Glenharden Dr,9260116551,2572,1040
90,US,F,,Kyndal Hooks,Kyndal,Hooks,3135,252 Clay St,9260111614,252,2030
92,US,M,,Lendon Celii,Lendon,Celii,-4126,421 Blue Horizon Dr,9260117676,421,1020
111,AU,F,,Karolina Dokter,Karolina,Dokter,6936,28 Munibung Road,1600102072,28,1030
171,AU,M,,Robert Bowerman,Robert,Bowerman,6627,21 Parliament House c/- Senator t,1600101555,21,1040
183,AU,M,,Duncan Robertshawe,Duncan,Robertshawe,-4299,18 Fletcher Rd,1600100760,18,1020
195,AU,M,,Cosi Rimmington,Cosi,Rimmington,-4068,4 Burke Street Woolloongabba,1600101663,4,1020
215,AU,M,,Ramesh Trentholme,Ramesh,Trentholme,-2421,23 Benjamin Street,1600102721,23,2020
544,TR,M,,Avni Argac,Avni,Argac,3062,A Blok No: 1,9050100008,1,1040
908,TR,M,,Avni Umran,Avni,Umran,8740,Mayis Cad. Nova Baran Plaza Ka 11,9050100023,11,2030
928,TR,M,,Bulent Urfalioglu,Bulent,Urfalioglu,4971,Turkcell Plaza Mesrutiyet Cad. 142,9050100016,142,1020
1033,TR,M,,Selim Okay,Selim,Okay,8687,Fahrettin Kerim Gokay Cad. No. 24,9050100001,24,1020
1100,TR,M,,Ahmet Canko,Ahmet,Canko,2940,A Blok No: 1,9050100008,1,1020
1684,TR,M,,Carglar Aydemir,Carglar,Aydemir,6864,A Blok No: 1,9050100008,1,1020
2550,ZA,F,,Sanelisiwe Collier,Sanelisiwe,Collier,11876,Bryanston Drive 122,8010100009,122,2010
2618,ZA,M,,Theunis Brazier,Theunis,Brazier,-2477,Arnold Road 2,8010100125,2,1030
2788,TR,M,,Serdar Yucel,Serdar,Yucel,-4382,Fahrettin Kerim Gokay Cad. No. 30,9050100001,30,1040
2806,ZA,F,,Raedene Van Den Berg,Raedene,Van Den Berg,11947,Quinn Street 11,8010100089,11,1030
3959,ZA,F,,Rita Lotz,Rita,Lotz,2976,Moerbei Avenue 120,8010100151,120,2030
11171,CA,M,,Bill Cuddy,Bill,Cuddy,11246,69 chemin Martin,2600100032,69,2010
12386,IL,M,,Avinoam Zweig,Avinoam,Zweig,1227,Mivtza Kadesh St 16,4750100001,16,3010
14104,IL,M,,Avinoam Zweig,Avinoam,Zweig,3205,Mivtza Kadesh St 25,4750100001,25,1030
14703,IL,M,,Eyal Bloch,Eyal,Bloch,5015,Mivtza Boulevard 17,4750100002,17,1040
17023,CA,F,,Susan Krasowski,Susan,Krasowski,1285,837 rue Lajeunesse,2600100021,837,2030
19444,IL,M,,Avinoam Zweig,Avinoam,Zweig,1366,Mivtza Kadesh St 61,4750100001,61,1040
19873,IL,M,,Avinoam Tuvia,Avinoam,Tuvia,10392,Mivtza Kadesh St 18,4750100001,18,2030
26148,CA,M,,Andreas Rennie,Andreas,Rennie,-7837,41 Main St,2600100010,41,1030
46966,CA,F,,Lauren Krasowski,Lauren,Krasowski,11254,17 boul Wallberg,2600100011,17,1040
54655,CA,F,,Lauren Marx,Lauren,Marx,4978,512 Gregoire Dr,2600100013,512,3010
70046,CA,M,,Tommy Mcdonald,Tommy,Mcdonald,1115,818 rue Davis,2600100017,818,1020
70059,CA,M,,Colin Byarley,Colin,Byarley,-8016,580 Howe St,2600100047,580,1030
70079,CA,F,,Lera Knott,Lera,Knott,11149,304 Grand Lake Rd,2600100039,304,1030
70100,CA,F,,Wilma Yeargan,Wilma,Yeargan,10401,614 Route 199,2600100015,614,1030
70108,CA,M,,Patrick Leach,Patrick,Leach,-6106,1001 Burrard St,2600100046,1001,1020
70165,CA,F,,Portia Reynoso,Portia,Reynoso,2963,873 rue Bosse,2600100006,873,1020
70187,CA,F,,Soberina Berent,Soberina,Berent,11227,1835 boul Laure,2600100035,1835,1030
70201,CA,F,,Angel Borwick,Angel,Borwick,5101,319 122 Ave NW,2600100012,319,2010
70210,CA,M,,Alex Santinello,Alex,Santinello,11069,40 Route 199,2600100015,40,1030
70221,CA,M,,Kenan Talarr,Kenan,Talarr,2962,9 South Service Rd,2600100019,9,1040
;;;;
run;

data ORION.CUSTOMER_DIM;
   attrib Customer_ID length=8 label='Customer ID' format=12.;
   attrib Customer_Country length=$2 label='Customer Country';
   attrib Customer_Gender length=$1 label='Customer Gender';
   attrib Customer_Name length=$40 label='Customer Name';
   attrib Customer_FirstName length=$20 label='Customer First Name';
   attrib Customer_LastName length=$30 label='Customer Last Name';
   attrib Customer_BirthDate length=8 label='Customer Birth Date' format=DATE9.;
   attrib Customer_Age_Group length=$12 label='Customer Age Group';
   attrib Customer_Type length=$40 label='Customer Type Name';
   attrib Customer_Group length=$40 label='Customer Group Name';
   attrib Customer_Age length=8 label='Customer Age';

   infile datalines dsd;
   input
      Customer_ID
      Customer_Country
      Customer_Gender
      Customer_Name
      Customer_FirstName
      Customer_LastName
      Customer_BirthDate
      Customer_Age_Group
      Customer_Type
      Customer_Group
      Customer_Age
   ;
datalines4;
4,US,M,James Kvarniq,James,Kvarniq,6752,31-45 years,Orion Club members low activity,Orion Club members,33
5,US,F,Sandrina Stephano,Sandrina,Stephano,8590,15-30 years,Orion Club Gold members medium activity,Orion Club Gold members,28
9,DE,F,Cornelia Krahl,Cornelia,Krahl,6632,31-45 years,Orion Club Gold members medium activity,Orion Club Gold members,33
10,US,F,Karen Ballinger,Karen,Ballinger,10518,15-30 years,Orion  Club members high activity,Orion Club members,23
11,DE,F,Elke Wallstab,Elke,Wallstab,6802,31-45 years,Orion  Club members high activity,Orion Club members,33
12,US,M,David Black,David,Black,4850,31-45 years,Orion  Club members medium activity,Orion Club members,38
13,DE,M,Markus Sepke,Markus,Sepke,11890,15-30 years,Orion Club Gold members low activity,Orion Club Gold members,19
16,DE,M,Ulrich Heyde,Ulrich,Heyde,-6194,61-75 years,Internet/Catalog Customers,Internet/Catalog Customers,68
17,US,M,Jimmie Evans,Jimmie,Evans,-502,46-60 years,Orion  Club members medium activity,Orion Club members,53
18,US,M,Tonie Asmussen,Tonie,Asmussen,-698,46-60 years,Orion Club members low activity,Orion Club members,53
19,DE,M,Oliver S. F��ling,Oliver S.,F��ling,2975,31-45 years,Orion Club Gold members high activity,Orion Club Gold members,43
20,US,M,Michael Dineley,Michael,Dineley,1202,46-60 years,Orion  Club members medium activity,Orion Club members,48
23,US,M,Tulio Devereaux,Tulio,Devereaux,-2221,46-60 years,Internet/Catalog Customers,Internet/Catalog Customers,58
24,US,F,Robyn Klem,Robyn,Klem,1248,46-60 years,Internet/Catalog Customers,Internet/Catalog Customers,48
27,US,F,Cynthia Mccluney,Cynthia,Mccluney,4853,31-45 years,Internet/Catalog Customers,Internet/Catalog Customers,38
29,AU,F,Candy Kinsey,Candy,Kinsey,-7847,61-75 years,Internet/Catalog Customers,Internet/Catalog Customers,73
31,US,F,Cynthia Martinez,Cynthia,Martinez,1314,46-60 years,Orion Club Gold members medium activity,Orion Club Gold members,48
33,DE,M,Rolf Robak,Rolf,Robak,-6155,61-75 years,Orion  Club members medium activity,Orion Club members,68
34,US,M,Alvan Goheen,Alvan,Goheen,10244,15-30 years,Orion Club members low activity,Orion Club members,23
36,US,M,Phenix Hill,Phenix,Hill,3014,31-45 years,Internet/Catalog Customers,Internet/Catalog Customers,43
39,US,M,Alphone Greenwald,Alphone,Greenwald,10433,15-30 years,Orion Club Gold members high activity,Orion Club Gold members,23
41,AU,M,Wendell Summersby,Wendell,Summersby,3258,31-45 years,Orion  Club members medium activity,Orion Club members,43
42,DE,M,Thomas Leitmann,Thomas,Leitmann,8440,15-30 years,Orion Club members low activity,Orion Club members,28
45,US,F,Dianne Patchin,Dianne,Patchin,8526,15-30 years,Orion Club Gold members low activity,Orion Club Gold members,28
49,US,F,Annmarie Leveille,Annmarie,Leveille,10424,15-30 years,Orion Club Gold members high activity,Orion Club Gold members,23
50,DE,M,Gert-Gunter Mendler,Gert-Gunter,Mendler,-8020,61-75 years,Orion Club Gold members high activity,Orion Club Gold members,73
52,US,M,Yan Kozlowski,Yan,Kozlowski,4844,31-45 years,Orion  Club members medium activity,Orion Club members,38
53,AU,F,Dericka Pockran,Dericka,Pockran,-560,46-60 years,Orion  Club members high activity,Orion Club members,53
56,US,M,Roy Siferd,Roy,Siferd,-8004,61-75 years,Orion  Club members medium activity,Orion Club members,73
60,US,F,Tedi Lanzarone,Tedi,Lanzarone,4891,31-45 years,Orion  Club members medium activity,Orion Club members,38
61,DE,M,Carsten Maestrini,Carsten,Maestrini,-4194,61-75 years,Orion Club Gold members high activity,Orion Club Gold members,63
63,US,M,James Klisurich,James,Klisurich,5107,31-45 years,Orion Club Gold members medium activity,Orion Club Gold members,38
65,DE,F,Ines Deisser,Ines,Deisser,4949,31-45 years,Orion Club members low activity,Orion Club members,38
69,US,F,Patricia Bertolozzi,Patricia,Bertolozzi,8533,15-30 years,Orion Club members low activity,Orion Club members,28
71,US,F,Viola Folsom,Viola,Folsom,5014,31-45 years,Orion Club Gold members medium activity,Orion Club Gold members,38
75,US,M,Mikel Spetz,Mikel,Spetz,10396,15-30 years,Orion Club members low activity,Orion Club members,23
79,US,F,Najma Hicks,Najma,Hicks,10979,15-30 years,Orion  Club members medium activity,Orion Club members,21
88,US,M,Attila Gibbs,Attila,Gibbs,1145,46-60 years,Orion  Club members medium activity,Orion Club members,48
89,US,F,Wynella Lewis,Wynella,Lewis,-7765,61-75 years,Orion  Club members high activity,Orion Club members,73
90,US,F,Kyndal Hooks,Kyndal,Hooks,3135,31-45 years,Orion Club Gold members high activity,Orion Club Gold members,43
92,US,M,Lendon Celii,Lendon,Celii,-4126,61-75 years,Orion Club members low activity,Orion Club members,63
111,AU,F,Karolina Dokter,Karolina,Dokter,6936,31-45 years,Orion  Club members medium activity,Orion Club members,33
171,AU,M,Robert Bowerman,Robert,Bowerman,6627,31-45 years,Orion  Club members high activity,Orion Club members,33
183,AU,M,Duncan Robertshawe,Duncan,Robertshawe,-4299,61-75 years,Orion Club members low activity,Orion Club members,63
195,AU,M,Cosi Rimmington,Cosi,Rimmington,-4068,61-75 years,Orion Club members low activity,Orion Club members,63
215,AU,M,Ramesh Trentholme,Ramesh,Trentholme,-2421,46-60 years,Orion Club Gold members medium activity,Orion Club Gold members,58
544,TR,M,Avni Argac,Avni,Argac,3062,31-45 years,Orion  Club members high activity,Orion Club members,43
908,TR,M,Avni Umran,Avni,Umran,8740,15-30 years,Orion Club Gold members high activity,Orion Club Gold members,28
928,TR,M,Bulent Urfalioglu,Bulent,Urfalioglu,4971,31-45 years,Orion Club members low activity,Orion Club members,38
1033,TR,M,Selim Okay,Selim,Okay,8687,15-30 years,Orion Club members low activity,Orion Club members,28
1100,TR,M,Ahmet Canko,Ahmet,Canko,2940,31-45 years,Orion Club members low activity,Orion Club members,43
1684,TR,M,Carglar Aydemir,Carglar,Aydemir,6864,31-45 years,Orion Club members low activity,Orion Club members,33
2550,ZA,F,Sanelisiwe Collier,Sanelisiwe,Collier,11876,15-30 years,Orion Club Gold members low activity,Orion Club Gold members,19
2618,ZA,M,Theunis Brazier,Theunis,Brazier,-2477,46-60 years,Orion  Club members medium activity,Orion Club members,58
2788,TR,M,Serdar Yucel,Serdar,Yucel,-4382,61-75 years,Orion  Club members high activity,Orion Club members,63
2806,ZA,F,Raedene Van Den Berg,Raedene,Van Den Berg,11947,15-30 years,Orion  Club members medium activity,Orion Club members,19
3959,ZA,F,Rita Lotz,Rita,Lotz,2976,31-45 years,Orion Club Gold members high activity,Orion Club Gold members,43
11171,CA,M,Bill Cuddy,Bill,Cuddy,11246,15-30 years,Orion Club Gold members low activity,Orion Club Gold members,21
12386,IL,M,Avinoam Zweig,Avinoam,Zweig,1227,46-60 years,Internet/Catalog Customers,Internet/Catalog Customers,48
14104,IL,M,Avinoam Zweig,Avinoam,Zweig,3205,31-45 years,Orion  Club members medium activity,Orion Club members,43
14703,IL,M,Eyal Bloch,Eyal,Bloch,5015,31-45 years,Orion  Club members high activity,Orion Club members,38
17023,CA,F,Susan Krasowski,Susan,Krasowski,1285,46-60 years,Orion Club Gold members high activity,Orion Club Gold members,48
19444,IL,M,Avinoam Zweig,Avinoam,Zweig,1366,46-60 years,Orion  Club members high activity,Orion Club members,48
19873,IL,M,Avinoam Tuvia,Avinoam,Tuvia,10392,15-30 years,Orion Club Gold members high activity,Orion Club Gold members,23
26148,CA,M,Andreas Rennie,Andreas,Rennie,-7837,61-75 years,Orion  Club members medium activity,Orion Club members,73
46966,CA,F,Lauren Krasowski,Lauren,Krasowski,11254,15-30 years,Orion  Club members high activity,Orion Club members,21
54655,CA,F,Lauren Marx,Lauren,Marx,4978,31-45 years,Internet/Catalog Customers,Internet/Catalog Customers,38
70046,CA,M,Tommy Mcdonald,Tommy,Mcdonald,1115,46-60 years,Orion Club members low activity,Orion Club members,48
70059,CA,M,Colin Byarley,Colin,Byarley,-8016,61-75 years,Orion  Club members medium activity,Orion Club members,73
70079,CA,F,Lera Knott,Lera,Knott,11149,15-30 years,Orion  Club members medium activity,Orion Club members,21
70100,CA,F,Wilma Yeargan,Wilma,Yeargan,10401,15-30 years,Orion  Club members medium activity,Orion Club members,23
70108,CA,M,Patrick Leach,Patrick,Leach,-6106,61-75 years,Orion Club members low activity,Orion Club members,68
70165,CA,F,Portia Reynoso,Portia,Reynoso,2963,31-45 years,Orion Club members low activity,Orion Club members,43
70187,CA,F,Soberina Berent,Soberina,Berent,11227,15-30 years,Orion  Club members medium activity,Orion Club members,21
70201,CA,F,Angel Borwick,Angel,Borwick,5101,31-45 years,Orion Club Gold members low activity,Orion Club Gold members,38
70210,CA,M,Alex Santinello,Alex,Santinello,11069,15-30 years,Orion  Club members medium activity,Orion Club members,21
70221,CA,M,Kenan Talarr,Kenan,Talarr,2962,31-45 years,Orion  Club members high activity,Orion Club members,43
;;;;
run;

data ORION.CUSTOMER_TYPE;
   attrib Customer_Type_ID length=8 label='Customer Type ID' format=12.;
   attrib Customer_Type length=$40 label='Customer Type Name';
   attrib Customer_Group_ID length=8 label='Customer Group ID' format=12.;
   attrib Customer_Group length=$40 label='Customer Group Name';

   infile datalines dsd;
   input
      Customer_Type_ID
      Customer_Type
      Customer_Group_ID
      Customer_Group
   ;
datalines4;
1010,Orion Club members inactive,10,Orion Club members
1020,Orion Club members low activity,10,Orion Club members
1030,Orion  Club members medium activity,10,Orion Club members
1040,Orion  Club members high activity,10,Orion Club members
2010,Orion Club Gold members low activity,20,Orion Club Gold members
2020,Orion Club Gold members medium activity,20,Orion Club Gold members
2030,Orion Club Gold members high activity,20,Orion Club Gold members
3010,Internet/Catalog Customers,30,Internet/Catalog Customers
;;;;
run;

data ORION.EMPLOYEE_ADDRESSES;
   attrib Employee_ID length=8;
   attrib Employee_Name length=$40;
   attrib Street_ID length=8;
   attrib Street_Number length=8;
   attrib Street_Name length=$40;
   attrib City length=$30;
   attrib State length=$2;
   attrib Postal_Code length=$10;
   attrib Country length=$2;

   infile datalines dsd;
   input
      Employee_ID
      Employee_Name
      Street_ID
      Street_Number
      Street_Name
      City
      State
      Postal_Code
      Country
   ;
datalines4;
121044,"Abbott, Ray",9260116912,2267,Edwards Mill Rd,Miami-Dade,FL,33135,US
120145,"Aisbitt, Sandy",1600101803,30,Bingera Street,Melbourne,,2001,AU
120761,"Akinfolarin, Tameaka",9260121030,5,Donnybrook Rd,Philadelphia,PA,19145,US
120656,"Amos, Salley",9260123736,3524,Calico Ct,San Diego,CA,92116,US
121107,"Anger, Rose",9260120989,744,Chapwith Rd,Philadelphia,PA,19142,US
121038,"Anstey, David",9260116991,939,Hilltop Needmore Rd,Miami-Dade,FL,33157,US
120273,"Antonini, Doris",9260116925,681,Ferguson Rd,Miami-Dade,FL,33141,US
120759,"Apr, Nishan",9260123711,105,Brack Penny Rd,San Diego,CA,92071,US
120798,"Ardskin, Elizabeth",9260116954,701,Glenridge Dr,Miami-Dade,FL,33177,US
121030,"Areu, Jeryl",9260116937,265,Fyfe Ct,Miami-Dade,Fl,33133,US
121017,"Arizmendi, Gilbert",9260123825,379,Englehardt Dr,San Diego,CA,91950,US
121062,"Armant, Debra",9260123787,10398,Crown Forest Ct,San Diego,CA,92025,US
121119,"Armogida, Bruce",9260121159,1914,Lansing St,Philadelphia,PA,19119,US
120812,"Arruza, Fauver",9260116937,265,Fyfe Ct,Miami-Dade,FL,33133,US
120756,"Asta, Wendy",9260121146,3565,Lake Park Dr,Philadelphia,PA,19145,US
120754,"Atkins, John",9260116816,6137,Blue Water Ct,Miami-Dade,FL,33161,US
120185,"Bahlman, Sharon",1600103028,24,LaTrobe Street,Sydney,,2165,AU
120109,"Baker, Gabriele",1600103074,166,Toorak Road,Sydney,,2119,AU
120710,"Baltzell, Timothy",9260120981,31,Castalia Dr,Philadelphia,PA,19140,US
121007,"Banaszak, John",9260121148,77,Lake Tillery Dr,Philadelphia,PA,19139,US
121011,"Banchi, Steven",9260116837,522,Buncombe St,Miami-Dade,FL,33031,US
120188,"Baran, Shanmuganathan",1600102985,207,Canterbury Road,Sydney,,1225,AU
120144,"Barbis, Viney",1600102974,3,Alice Street,Sydney,,2114,AU
120168,"Barcoe, Selina",1600101850,435,Sherwood Rd,Melbourne,,8003,AU
120182,"Barreto, Geok-Seng",1600103062,241,Royal Perade,Sydney,,1115,AU
121049,"Bataineh, Perrior",9260123694,892,Birchland Dr,San Diego,CA,92126,US
120998,"Benedicto, Tondelayo",9260123862,2902,Gable Ridge Ln,San Diego,CA,92118,US
120800,"Benyami, Fred",9260123837,1498,Falconwood Dr,San Diego,CA,92069,US
120811,"Bergeron-Jeter, Dale",9260116773,2356,Aileen Dr,Miami-Dade,FL,33010,US
120733,"Bezinque, Michael",9260116798,2732,Bell Dr,Miami-Dade,FL,33033,US
120104,"Billington, Kareen",1600103066,40,Smith Street,Sydney,,1670,AU
120735,"Bilobran, Brenda",9260116785,11217,Avent Ferry Rd,Miami-Dade,FL,33160,US
121035,"Blackley, James",9260123811,41,Dubose St,San Diego,CA,92110,US
120183,"Blanton, Brig",1600101844,6,Palmiston Cresent,Melbourne,,3150,AU
121141,"Bleu, Henri Le",9260121129,29,Joliesse Ln,Philadelphia,PA,19103,US
120993,"Boatright, Lorraine",9260123871,110,Glascock St,San Diego,CA,91950,US
120198,"Body, Meera",1600103038,51,Martin Place,Sydney,,1131,AU
121006,"Bolster, Bernard",9260123715,77,Braswell Ct,San Diego,CA,91950,US
121116,"Bond-Teague, Mary",9260123677,24,Bashford Rd,San Diego,CA,92106,US
121137,"Boocks, Michael. R.",9260117046,1555,Laurdane Rd,Miami-Dade,FL,33183,US
120728,"Borge, Kathryn",9260116823,360,Bridgepath Dr,Miami-Dade,FL,33150,US
121109,"Boulus, Harold",9260123772,4320,Colony Woods Dr,San Diego,CA,92054,US
120265,"Branly, Wanda",9260121147,21,Lake Pine Dr,Philadelphia,PA,19135,US
121140,"Briggi, Saunders",9260123917,991,Holman St,San Diego,CA,92021,US
121012,"Broome, Carmelo",9260116832,368,Buck Jones Rd,Miami-Dade,FL,33144,US
120724,"Brown, Hampie",9260123770,1951,Cobble Creek Ln,San Diego,CA,92054,US
121101,"Buckner, Burnetta",9260123893,3385,Hampton Ridge Rd,San Diego,CA,92114,US
120114,"Buddery, Jeannette",1600103023,12,Hunua Road Papakura,Sydney,,1004,AU
120662,"Burroughs, Lemonica",9260116814,2565,Bledsoe Ave,Miami-Dade,FL,33176,US
120730,"Burt, Woodson",9260123853,136,Fox Rd,San Diego,CA,92128,US
120713,"Campbell, Carston",9260123835,19,Fairwinds Dr,San Diego,CA,92069,US
120181,"Cantatore, Lorian",1600102985,207,Canterbury Road,Sydney,,1225,AU
121144,"Capachietti, Renee",9260116911,379,Edgeside Ct,Miami-Dade,FL,33012,US
120763,"Capps, Ramond",9260123777,3384,Cotton Mill Dr,San Diego,CA,92113,US
121050,"Capristo-Abramczyk, Patricia",9260123928,157,Ithaca Ln,San Diego,CA,91950,US
120688,"Carcaterra, Lisa",9260123971,91,Langstonshire Ln,San Diego,Ca,92119,US
121059,"Carhide, Jacqulin",9260123889,5637,Greenfield Dr,San Diego,CA,91911,US
121025,"Cassey, Barnaby",9260116769,1609,Abbey Ln,Miami-Dade,FL,33134,US
121121,"Cassone, Halouise",9260121067,6,Frissell Ave,Philadelphia,PA,19142,US
120187,"Catenacci, Reyne",1600101829,44,Gow Street,Melbourne,,2066,AU
120146,"Cederlund, Wendall",1600103054,1,Pacific Rise Mount Wellington,Sydney,,20000,AU
120149,"Chantharasy, Judy",1600101820,1,Embarcadero Center Site 1500,Melbourne,,3000,AU
121097,"Chernega, Willeta",9260121008,17,Cottonwood Ln,Philadelphia,PA,19111,US
121080,"Chinnis, Kumar",9260116996,60,Hodge Rd,Miami-Dade,FL,33138,US
120791,"Chiseloff, Richard",9260123830,1726,Evans Rd,San Diego,CA,92067,US
121048,"Clark, Lawrie",9260116885,5716,Deacons Bend Ct,Miami-Dade,FL,33184,US
121002,"Clark, Terry-Ann",9260123906,57,Hickory Dr,San Diego,CA,92104,US
120127,"Clarkson, Sharryn",1600102972,21,Albert St,Sydney,,1170,AU
120263,"Cleverley, Bobby",9260123710,622,Boylan Ave,San Diego,CA,92054,US
121076,"Cobb, Micah",9260121074,37,Glencoe Dr,Philadelphia,Pa,19138,US
120172,"Comber, Edwin",1600102978,121,Blackburn Road,Sydney,,2580,AU
120175,"Conolly, Andrew",1600103049,79,Old Port Road,Sydney,,2144,AU
120739,"Cooper, Bryon",9260116770,5857,Academy St,Miami-Dade,FL,33133,US
121100,"Cormell, Tzue-Ing",9260123700,4104,Blackwolf Run Ln,San Diego,CA,92114,US
121113,"Costine, Karen",9260116837,522,Buncombe St,Miami-Dade,FL,33031,US
121073,"Court, Donald",9260116842,4498,Calumet Dr,Miami-Dade,FL,33144,US
120741,"Court, Keisha",9260121135,88,Kershaw Dr,Philadelphia,PA,19130,US
120264,"Croome, Latonya",9260123737,1722,Calm Winds Ct,San Diego,CA,91941,US
120794,"Cross, Samantha",9260116833,699,Buck Rowland Rd,Miami-Dade,FL,33169,US
120262,"Crown, Max",9260120929,1823,Ashley Rd,Philadelphia,PA,19111,US
120679,"Cutucache, Chrisy",9260123909,1541,Highland Trl,San Diego,CA,92103,US
120190,"Czernezkyi, Ivor",1600103037,21,Market Street,Sydney,,2113,AU
120687,"Dannin, Freda",9260116935,674,Friar Tuck Rd,Miami-Dade,FL,33193,US
121040,"Darrohn, Brienne",9260120944,3941,Belford Valley Ln,Philadelphia,PA,19103,US
121055,"Davis, Clement",9260117037,1305,Kyle Dr,Miami-Dade,FL,33172,US
120103,"Dawes, Wilson",1600103074,166,Toorak Road,Sydney,,2119,AU
120124,"Daymond, Lucian",1600103024,1,Julius Avenue,Sydney,,2233,AU
120795,"Deacon, David",9260116960,1636,Gorman St,Miami-Dade,FL,33012,US
121082,"Debank, Richard",9260116843,608,Campbell Rd,Miami-Dade,FL,33129,US
120786,"Delafuente, Chris-Anne",9260116875,1329,Cross Link Rd,Miami-Dade,FL,33016,US
120789,"Denhollem, Julius",9260116863,147,Clearport Dr,Miami-Dade,FL,33135,US
120126,"Denny, Satyakam",1600102981,7,Boundary Street,Sydney,,2099,AU
121003,"Der Wiele, Troyce Van",9260120967,1787,Brushy Meadows Dr,Philadelphia,PA,19148,US
121019,"Desanctis, Scott",9260121087,765,Greenhaven Ln,Philadelphia,PA,19102,us
120680,"Desaulniers, Raymondria",9260120977,2409,Carnegie Ln,Philadelphia,PA,19145,US
121132,"Digiorgio, Shia-Ling",9260123870,97,Gentlewoods Dr,San Diego,CA,92040,US
120197,"Dillin, Kerrin",1600101821,29,Emily Bullock Cres,Melbourne,,8007,AU
120714,"Dinley, Robert",9260116931,182,Fort Sumter Rd,Miami-Dade,FL,33160,US
120152,"Dives, Sean",1600102982,69,Bourke St,Sydney,,1460,AU
120668,"Dolan, Thyland",9260116922,744,Farmington Grove Dr,Miami-Dade,FL,33141,US
120997,"Donathan, Mary",9260121069,4923,Gateridge Dr,Philadelphia,PA,19152,us
120785,"Donnell, Damesha",9260123725,1947,Bromley Way,San Diego,CA,92024,US
120711,"Drew, Gloria",9260121132,17,Kempwood Dr,Philadelphia,PA,19119,US
120667,"Droste, Edwin",9260116974,1661,Hanna Ln,Miami-Dade,FL,33014,US
120803,"Droste, Victor",9260123737,1722,Calm Winds Ct,San Diego,CA,91941,US
120138,"Duckett, Shani",1600101841,9,Northgate Drive,Melbourne,,3168,AU
120279,"Dunlap, Kareema",9260123839,181,Falls River Ave,San Diego,CA,92021,US
120808,"Dupree, Marcel",9260123656,3231,Amity Hill Ct,San Diego,CA,92064,US
120142,"Eastley, Vincent",1600101816,4,Dalmore Drive,Melbourne,,3095,AU
120779,"Eggleston, Jennifer",9260116997,140,Hollow Ct,Miami-Dade,FL,33032,US
120774,"El-Amin, Sue",9260121123,1030,Indigo Dr,Philadelphia,PA,19122,US
120119,"Elleman, Lal",1600103015,1021,Haupapa Street,Sydney,,1219,AU
121015,"Elmoslamy, Wilson",9260123927,3118,Iris Dr,San Diego,CA,92105,US
120121,"Elvish, Irenie",1600103044,3,Mundi Place,Sydney,,1232,AU
120110,"Entwisle, Dennis",1600103011,9,Grayson Avenue Papatoetoe,Sydney,,1226,AU
120810,"Esguerra, Loyal",9260116917,2726,Fairfax Woods Dr,Miami-Dade,FL,33162,US
121103,"Farnsworth, Brian",9260123783,8458,Crispwood Ct,San Diego,Ca,91901,US
121021,"Farren, Priscilla",9260123790,1538,Dacian Rd,San Diego,CA,92124,US
120747,"Farthing, Zashia",9260123756,763,Chatterson Dr,San Diego,CA,92116,us
121143,"Favaron, Louis",9260117004,163,Horseshoe Bend,Miami-Dade,FL,33176,US
121052,"Fay, Richard",9260120973,7660,Calvary Dr,Philadelphia,PA,19107,US
120744,"Feigenbaum, Alden",9260123874,43,Glen Bonnie Ln,San Diego,CA,92122,US
120753,"Ferrari, Ralph",9260116946,309,Gilliam Ln,Miami-Dade,FL,33172,US
121031,"Filan, Scott",9260121065,375,Foxmoor Ct,Philadelphia,PA,19142,US
120150,"Filo, John",1600101856,5,Sun Pl,Melbourne,,3001,AU
120195,"Fiocca, Jina",1600101807,81,Burwood Road,Melbourne,,3155,AU
121102,"Flammia, Rocheal",9260123922,1201,Hoyle Dr,San Diego,CA,91978,us
120260,"Fletcher, Christine",9260123780,2416,Cove Point Dr,San Diego,CA,91910,US
120272,"Flow, Febin",9260121137,461,Kimberly Dr,Philadelphia,PA,19121,US
120697,"Fouche, Madelaine",1600101820,1,Embarcadero Center Site 1500,Melbourne,,3000,AU
121023,"Fuller, Shawn",9260123819,1195,Echo Glen Ln,San Diego,CA,92028,US
121136,"Galarneau, Lesia",9260120922,3,Altair Cir,Philadelphia,PA,19131,US
120778,"Gardner, Angela",9260121040,349,Eason Cir,Philadelphia,PA,19104,US
120180,"George, Vino",1600101796,9,Adelaide Terrace,Melbourne,,3000,AU
120112,"Glattback, Ellis",1600101868,7,Vulture Street,Melbourne,,3174,AU
121124,"Gonzalez, Deginald",9260117036,1611,Kronos Ln,Miami-Dade,FL,33054,US
121009,"Goodwin, Robert",9260123860,31,Friendly Dr,San Diego,CA,92116,US
120995,"Gordo, Lily-Ann",9260121130,545,Jones Sausage Rd,Philadelphia,PA,19144,US
120191,"Graham-Rowe, Jannene",1600101820,1,Embarcadero Center Site 1500,Melbourne,,3000,AU
120108,"Gromek, Gladys",1600101827,6,George Street,Melbourne,,3000,AU
121047,"Grzebien, Karen",9260123757,627,Chenworth Dr,San Diego,CA,92082,US
120672,"Guscott, Verne",1600102990,249,Collins Street,Sydney,,2009,AU
120691,"Habres, Sek",1600103058,11,Reid Street,Sydney,,1005,AU
121129,"Hafley, Yusef",9260116796,192,Beaufort St,Miami-Dade,FL,33133,US
121045,"Hampton, Cascile",9260123748,8560,Carlton Ave,San Diego,CA,92027,US
121013,"Hargrave, Seco",9260120922,3,Altair Cir,Philadelphia,PA,19131,US
120743,"Harrison, Chimena",9260123715,77,Braswell Ct,San Diego,CA,91950,US
120816,"Hart, Tessia",9260116839,2170,Buttercup Ln,Miami-Dade,FL,33055,US
120118,"Hartshorn, Darshi",1600103076,1,Waterloo Street,Sydney,,2065,AU
120745,"Harvill, Barbara",9260120919,23,Alderman Cir,Philadelphia,PA,19129,US
120194,"Harwood, Reece",1600101807,81,Burwood Road,Melbourne,,3155,AU
121061,"Hassam, Lauris",9260116932,4407,Fountain Dr,Miami-Dade,FL,33178,US
120659,"Havasy, Jay",9260120924,1930,Apple Meadow Dr,Philadelphia,PA,19145,US
120154,"Hayawardhana, Caterina",1600102972,21,Albert St,Sydney,,1170,AU
121098,"Heatwole, Hal",9260120994,1543,Cherrycrest Ct,Philadelphia,PA,19154,US
120999,"Heilmann, Sherelyn",9260123969,3750,Langley Cir,San Diego,CA,92025,US
120813,"Heinsler, John",9260116828,39,Brush Stream Dr,Miami-Dade,FL,33179,US
121123,"Helyar, Randy",9260121031,3313,Dothan Ct,Philadelphia,PA,19107,US
120718,"Hennington, Charles",9260121043,40,Elsbeth Ct,Philadelphia,PA,19144,US
121130,"Herndon, Gary",9260121156,11,Langdale Pl,Philadelphia,PA,19143,US
120196,"Hieds, Merle",1600101856,5,Sun Pl,Melbourne,,3001,AU
120261,"Highpoint, Harry",9260116777,18,Antler Ct,Miami-Dade,FL,33135,US
121106,"Hilburger, James",9260116793,139,Barton Pines Rd,Miami-Dade,FL,33189,US
120669,"Hill, Ronald",9260121037,2823,Eagles Landing Dr,Philadelphia,PA,19146,US
120125,"Hofmeister, Fong",1600102996,17,Druitt Street,Sydney,,2122,AU
121125,"Holt, Michael",9260121127,270,Johnson St,Philadelphia,PA,19138,US
121070,"Holthouse, Agnieszka",9260116982,41,Hawthorne Way,Miami-Dade,FL,33018,US
120815,"Honore, Craig",9260116824,7766,Brimfield Ct,Miami-Dade,FL,33141,US
121071,"Hoppmann, John",9260116922,744,Farmington Grove Dr,Miami-Dade,FL,33141,US
120773,"Horne, Entrisse",9260117000,7497,Holly Pointe Dr,Miami-Dade,FL,33133,US
120792,"Horne, Omeba",9260121126,4750,Jet Ln,Philadelphia,PA,19119,US
120106,"Hornsey, John",1600103064,325,Sherwood Road,Sydney,,1100,AU
120113,"Horsey, Riu",1600101859,45,Talavera Road,Melbourne,,3146,AU
120123,"Hotstone, Kimiko",1600103050,54,Overseas Drive,Sydney,,2066,AU
121001,"House, Tony",9260116817,1,Bona Ct,Miami-Dade,FL,33140,US
120685,"Howard, Anita",9260121044,1455,Emerywood Dr,Philadelphia,PA,19124,US
120729,"Howell, Kimberly",9260117044,260,Langstonshire Ln,Miami-Dade,FL,33134,US
121085,"Huslage, Rebecca",9260123814,1984,Dunhill Ter,San Diego,CA,92008,US
120137,"Iyengar, Marina",1600101814,9,Crusin Place,Melbourne,,3086,AU
121026,"Jaime, Terrill",9260121098,697,Harcourt Dr,Philadelphia,PA,19136,US
120155,"James, Narelle",1600101861,30,Thorncraft Parade,Melbourne,,2113,AU
121104,"Johnson, Leoma",9260120956,4002,Brassfield Rd,Philadelphia,PA,19134,US
120797,"Jones, Sherrie",9260116902,19,Dutch Creek Dr,Miami-Dade,FL,33186,US
120278,"Jongleux, Binit",9260123699,3053,Blackpine Ct,San Diego,CA,91910,US
120716,"Juif, Kenneth",9260121085,881,Green Downs Dr,Philadelphia,PA,19143,US
121091,"Kadiri, Ernest",9260121067,6,Frissell Ave,Philadelphia,Pa,19142,US
121043,"Kagarise, Sigrid",9260121031,3313,Dothan Ct,Philadelphia,PA,19107,US
120269,"Kagolanu, Shrimatee",9260120925,65,Applecross Cir,Philadelphia,PA,19131,US
120132,"Kaiser, Fancine",1600103012,33,Great South Road Riccarton,Sydney,,2000,AU
120157,"Karavdic, Leonid",1600102978,121,Blackburn Road,Sydney,,2580,AU
120783,"Karp, Davis",9260121117,458,Huckleberry Dr,Philadelphia,PA,19104,US
120796,"Kellis, Philip",9260121043,40,Elsbeth Ct,Philadelphia,PA,19144,US
120766,"Kempster, Janelle",9260116780,8,Ashwood Dr,Miami-Dade,FL,33173,US
120682,"Kennedy, Barbara",9260120930,1635,Auburn Church Rd,Philadelphia,PA,19119,US
120801,"Kennedy, Kathryn",9260120975,353,Cameron Woods Dr,Philadelphia,PA,19148,US
120658,"Kennedy, Kenneth",9260123927,3118,Iris Dr,San Diego,CA,92105,US
121088,"Kernitzki, Momolu",9260120959,422,Brentwood Rd,Philadelphia,PA,19134,US
120992,"Kicak, Lisa",9260116861,1974,Clear Brook Dr,Miami-Dade,FL,33172,US
120736,"Kiemle, Parie",9260116999,26,Holly Park Dr,Miami-Dade,FL,33130,US
120177,"Kierce, Franca",1600103075,120,Walkers Road,Sydney,,2015,AU
120746,"Kimmerle, Kevie",9260121115,162,Horsetrail Way,Philadelphia,PA,19121,US
120170,"Kingston, Alban",1600102984,5,Buffalo Road,Sydney,,1042,AU
121063,"Kinol, Regi",9260116933,63,Fountainhead Dr,Miami-Dade,FL,33180,US
121034,"Kirkman, John",9260116898,40,Dry Fork Ln,Miami-Dade,FL,33193,US
120698,"Kistanna, Geoff",1600103007,28,Fonceca Street,Sydney,,1171,au
120128,"Kletschkus, Monica",1600101800,26,Bay Street,Melbourne,,3050,AU
121090,"Klibbe, Betty",9260123969,3750,Langley Cir,San Diego,CA,92025,US
121110,"Knapp, Albert",9260116923,4368,Farrington Dr,Miami-Dade,FL,33165,US
120757,"Knopfmacher, Paul",9260123735,804,Calebra Way,San Diego,CA,92104,US
121081,"Knudson, Susie",9260123871,110,Glascock St,San Diego,CA,91950,US
120721,"Knust, Dlutomi",9260120955,744,Brannigan Pl,Philadelphia,PA,19141,US
120683,"Kochneff, Deven",9260121087,765,Greenhaven Ln,Philadelphia,PA,19102,US
121058,"Kohake, Del",9260123839,181,Falls River Ave,San Diego,CA,92021,US
120765,"Kokoszka, Nikeisha",9260123780,2416,Cove Point Dr,San Diego,Ca,91910,US
120740,"Koonce, Lisa",9260116960,1636,Gorman St,Miami-Dade,FL,33012,US
120663,"Kornblith, Anglar",9260116932,4407,Fountain Dr,Miami-Dade,FL,33178,US
120266,"Krafve, Bao",9260123722,12,Brigadoon Dr,San Diego,CA,92040,US
121095,"Kratzke, Sara",9260123796,4137,Deer Haven Dr,San Diego,CA,92101,US
121120,"Labach, Susan",9260121063,1624,Fox Trail Ln,Philadelphia,PA,19146,US
120189,"Lachlan, Mihailo",1600103000,17,Elsie St,Sydney,,2154,AU
121010,"Lamp, Donald",9260116965,509,Green Level To Durham Rd,Miami-Dade,FL,33142,US
120274,"Landry, Angela",9260121115,162,Horsetrail Way,Philadelphia,PA,19121,US
120690,"Langston, Taronda",9260120930,1635,Auburn Church Rd,Philadelphia,PA,19119,US
121145,"Lansberry, Dennis",9260116886,7508,Declaration Dr,Miami-Dade,FL,33012,US
121069,"Lapsley, Jason",9260123763,2148,Circlebank Dr,San Diego,CA,92064,US
120275,"Lattimer, Brandy",9260123733,56,Cahill Rd,San Diego,CA,92065,US
120671,"Latty, William",9260120959,422,Brentwood Rd,Philadelphia,PA,19134,US
120280,"Laurer, Jaime",9260121097,211,Hamstead Crossing Dr,Philadelphia,PA,19124,US
121118,"Lawson, Paul",9260121145,598,Lake Ct,Philadelphia,Pa,19122,US
120665,"Leacock, Jill",9260123932,1288,Joe Leach Rd,San Diego,CA,91945,US
120694,"Leazer, Sharon",1600103030,29,Lawson Ave,Sydney,,1220,AU
120762,"Leone, Marvin",9260121005,2898,Cookshire Dr,Philadelphia,PA,19121,US
120731,"Lerew, Robert",9260123660,2254,Appledown Dr,San Diego,CA,92008,US
121108,"Levi, Libby",9260116791,1713,Barham Siding Rd,Miami-Dade,FL,33013,US
120136,"Leyden, Atul",1600103023,12,Hunua Road Papakura,Sydney,,1004,AU
120141,"Liebman, Amanda",1600103010,46,George Street,Sydney,,2012,AU
120769,"Lightbourne, Abelino",9260116816,6137,Blue Water Ct,Miami-Dade,FL,33161,US
121014,"Liguori, Donelle",9260116940,6,Gamelyn Walk,Miami-Dade,FL,33183,US
120788,"Lisowe, Smitty",9260123664,1058,Atchison St,San Diego,CA,92120,US
120101,"Lu, Patrick",1600102980,51,Botany Road,Sydney,,1230,AU
120130,"Lyon, Kevin",1600103019,2,Hill St,Sydney,,1044,AU
121056,"Lyszyk, Stacey",9260123927,3118,Iris Dr,San Diego,CA,92105,US
121067,"Macnair, Jeanilla",9260123814,1984,Dunhill Ter,San Diego,CA,92008,US
121018,"Magolan, Julienne",9260116837,522,Buncombe St,Miami-Dade,FL,33031,US
120163,"Magrath, Brett",1600101846,253,Princess Hwy,Melbourne,,3000,AU
121111,"Maholo, Salim",9260123866,91,Gardner St,San Diego,CA,92057,US
121065,"Malta, Corneille",9260123836,1793,Falcon Rest Cir,San Diego,CA,92113,US
120793,"Mamo, William",9260116878,183,Dacus Pl,Miami-Dade,FL,33055,US
121046,"Mandzak, Roger",9260121106,443,High Country Dr,Philadelphia,PA,19147,US
121127,"Mangini, Keyna",9260123867,9,Garner Rd,San Diego,CA,91910,US
120809,"Marion, Chiorene",9260116782,89,Atchison St,Miami-Dade,FL,33129,US
120727,"Marples, Donald",9260123734,2227,Calais Ct,San Diego,CA,92122,US
120161,"Martines, Rosette",1600101840,147,North Clark Street,Melbourne,,3156,AU
120117,"Mccleary, Bill",1600101844,6,Palmiston Cresent,Melbourne,,3150,AU
121053,"Mcdade, Tywanna",9260123761,87,Christofle Ln,San Diego,CA,92082,US
121029,"Mcelwee, Kuo-Chung",9260123790,1538,Dacian Rd,San Diego,CA,92124,US
121139,"Mckee, Diosdado",9260123895,81,Hanska Way,San Diego,CA,92014,US
121008,"Mckenzie, Eron",9260121071,131,Gem Dr,Philadelphia,PA,19122,US
121005,"Mclamb, Yuh-Lang",9260116949,9891,Glendower Rd,Miami-Dade,FL,33154,US
120751,"Mea, Azavi0us",9260116836,649,Buckboard Ln,Miami-Dade,FL,33014,US
121079,"Mees, Azmi",9260120942,824,Beaufort St,Philadelphia,PA,19128,US
121036,"Mesley, Teresa",9260121101,967,Hearthside Ct,Philadelphia,PA,19148,US
121074,"Michonski, Eric",9260123951,1921,Kingston Ridge Rd,San Diego,CA,92129,US
121037,"Miketa, Muthukumar",9260117011,2185,Ileagnes Rd,Miami-Dade,FL,33176,US
120259,"Miller, Anthony",9260116837,522,Buncombe St,Miami-Dade,FL,33031,US
120760,"Miller, Pamela",9260123823,108,Elmview Dr,San Diego,CA,92111,US
120140,"Minas, Michael",1600103041,95,Miller St,Sydney,,2125,AU
120695,"Moffat, Trent",1600101835,8,Learmonth Road,Melbourne,,3101,au
120171,"Moody, Alena",1600103057,248,Port Road,Sydney,,2020,AU
120184,"Moore, Ari",1600103062,241,Royal Perade,Sydney,,1115,AU
120712,"Motashaw, Elisabeth",9260116823,360,Bridgepath Dr,Miami-Dade,FL,33150,US
121099,"Mrvichin, Royall",9260120976,31,Cantwell Ct,Philadelphia,PA,19141,US
121051,"Myers, Glorina",9260123851,335,Fox Ct,San Diego,CA,92029,US
121128,"Nazar, Glacia",9260123950,1250,Kingston Ridge Rd,San Diego,CA,92128,US
120715,"Neal, Angelia",9260123661,6278,Aqua Marine Ln,San Diego,CA,92054,US
121096,"Newstead, Robert",9260117041,683,Lake Hill Dr,Miami-Dade,FL,33176,US
120122,"Ngan, Christina",1600101847,11,Prospect Hill Road,Melbourne,,3001,AU
120192,"Nichollas, Anthony",1600103056,66,Phillip Street,Sydney,,2124,AU
120115,"Nichollas, Hugh",1600103020,30,Hotham Parade,Sydney,,2600,AU
120749,"Niemann, Kevin",9260123704,651,Bluebird Ct,San Diego,CA,92027,US
121066,"Norman, Ceresh",9260121149,251,Lake Tillery Dr,Philadelphia,PA,19148,US
121072,"North, Christer",9260121038,2765,Eaglesham Way,Philadelphia,PA,19121,US
120166,"Nowd, Fadi",1600103000,17,Elsie St,Sydney,,2154,AU
120270,"Nuss, Grezegorz",9260116986,1916,Hebron Church Rd,Miami-Dade,FL,33186,US
121115,"O'Carroll, Aquilla",9260123738,5194,Calm Winds Ct,San Diego,CA,92071,US
121087,"O'Suilleabhain, Virtina",9260117018,219,Ivydale Dr,Miami-Dade,FL,33178,US
120790,"O'Toole, Tara",9260121137,461,Kimberly Dr,Philadelphia,Pa,19121,US
120726,"Obermeyer, Lutezenia",9260120979,3246,Cartier Dr,Philadelphia,PA,19140,US
120678,"Octetree, Lucretta",9260123841,433,Farmington Woods Dr,San Diego,CA,92054,US
120723,"Olsen, Deanna",9260121109,218,Hillsford Ln,Philadelphia,PA,19146,US
120666,"Onuscheck, John",9260123652,215,Alercia Ct,San Diego,CA,92029,US
120173,"Osborn, Hernani",1600101808,8,Cannon Lane Whitby,Melbourne,,3350,AU
121068,"Osuba, Salaheloin",9260123681,2546,Belford Valley Ln,San Diego,CA,91932,US
121084,"Ould, Tulsidas",9260123776,1025,Coronado Dr,San Diego,Ca,92028,US
120806,"Ousley, Lorna",9260117027,881,Kettlebridge Dr,Miami-Dade,FL,33183,US
120772,"Overdorff, Erich",9260116868,1407,Coorsdale Dr,Miami-Dade,FL,33161,US
120176,"Pa, Koavea",1600101822,1,Endeavour Road,Melbourne,,3225,AU
121131,"Pantages, William",9260123709,198,Botany Bay Dr,San Diego,CA,92021,US
120802,"Parker, U'Vonda",9260121139,11,Kinderston Dr,Philadelphia,PA,19104,US
120770,"Pascoe, Julia",9260116858,973,Chris Dr,Miami-Dade,FL,33183,US
120787,"Peachey, Carl",9260123750,175,Carteret Dr,San Diego,CA,92025,US
120120,"Peiris, Krishna",1600103010,46,George Street,Sydney,,2012,AU
121126,"Penhale, James",9260120951,142,Bluffridge Dr,Philadelphia,PA,19141,US
120807,"Peppers, Gerlinde",9260123858,1209,Fraternity Court Dr,San Diego,CA,92173,US
120696,"Pettolino, Peter",1600101822,1,Endeavour Road,Melbourne,,3225,AU
120151,"Phaiyakounh, Julianna",1600103002,3,Evans St,Sydney,,2011,AU
120159,"Phoumirath, Lynelle",1600103074,166,Toorak Road,Sydney,,2119,AU
120158,"Pilgrim, Daniel",1600103048,8,Nicholson Street,Sydney,,4720,AU
120784,"Pinol, Jennifer",9260120993,9,Chastain Dr,Philadelphia,PA,19132,US
120135,"Platts, Alexei",1600103071,39,Station Street,Sydney,,2000,au
120178,"Plested, Billy",1600103038,51,Martin Place,Sydney,,1131,AU
121086,"Plybon, John-Michael",9260116892,890,Dinwiddie Ct,Miami-Dade,FL,33174,US
120276,"Plybon, Nicholas",9260121064,2975,Foxbury Dr,Philadelphia,Pa,19120,US
121064,"Polky, Asishana",9260123811,41,Dubose St,San Diego,CA,92110,US
120689,"Pongor, Katherine",9260121009,4750,Cottonwood Ln,Philadelphia,PA,19148,US
120748,"Post, Nahliah",9260117043,52,Landor Rd,Miami-Dade,FL,33169,US
120105,"Povey, Liz",1600101825,23,Garden Street,Melbourne,,8004,AU
120165,"Pretorius, Tadashi",1600103020,30,Hotham Parade,Sydney,,2600,AU
121133,"Pringley, Peter",9260120956,4002,Brassfield Rd,Philadelphia,PA,19134,US
121092,"Pritt, Gynell",9260123941,8112,Kenna Ct,San Diego,CA,92116,US
121054,"Pulliam, Daniel",9260123704,651,Bluebird Ct,San Diego,CA,92027,US
120186,"Quinby, Merryn",1600102997,54,Dunning Street,Sydney,,2120,AU
120661,"Racine, Cynthia",9260123745,63,Cane Creek Dr,San Diego,CA,92131,US
120116,"Ralston, Austen",1600103023,12,Hunua Road Papakura,Sydney,,1004,AU
120768,"Rayburn, Roland",9260120981,31,Castalia Dr,Philadelphia,PA,19140,US
121020,"Ridley, Cherda",9260120918,30,Aiken Pkwy,Philadelphia,PA,19142,US
120719,"Ridley, Roya",9260123695,6121,Birklands Dr,San Diego,CA,92025,US
120267,"Rink, Belanda",9260123891,43,Grist Mill Rd,San Diego,CA,92122,US
121042,"Robbin-Coker, Joseph",9260123688,2645,Berkshire Downs Dr,San Diego,CA,92008,US
120129,"Roebuck, Alvin",1600101844,6,Palmiston Cresent,Melbourne,,3150,AU
121027,"Rudder, Allan",9260123806,941,Dixon Dr,San Diego,CA,91911,US
120147,"Rusli, Skev",1600103069,26,St Kilda Road,Sydney,,2022,AU
121135,"Ruta, Tammy",9260120927,89,Ashley Brook Ct,Philadelphia,PA,19131,US
120777,"Sacher, Kary",9260123653,2547,Allenby Dr,San Diego,CA,91913,US
121148,"Sadig, Shane",9260116770,5857,Academy St,Miami-Dade,FL,33133,US
121146,"Sangiorgio, Julieanne",9260121055,6042,Farmstone Dr,Philadelphia,PA,19125,US
120673,"Santomaggio, Pearl",1600101855,2,Stephen Road,Melbourne,,3181,AU
121089,"Sauder, Gregory",9260117020,974,Joel Ct,Miami-Dade,FL,33030,US
121105,"Savacool, Jessica",9260116883,618,Darlington Pl,Miami-Dade,FL,33143,US
120734,"Saylor, Svein",9260121110,3707,Hillside Dr,Philadelphia,PA,19144,US
121122,"Scarbrough, Stancey",9260116954,701,Glenridge Dr,Miami-Dade,FL,33177,US
120162,"Scordia, Randal",1600101859,45,Talavera Road,Melbourne,,3146,AU
120814,"Scroggin, Victor",9260123664,1058,Atchison St,San Diego,CA,92120,US
120160,"Segrave, Chuck",1600103065,1,Sleigh Street,Sydney,,1164,AU
120664,"Senchak, Brock",9260121088,1779,Greymist Ln,Philadelphia,PA,19142,US
120994,"Sergeant, Danelle",9260123959,734,Ladys Slipper Ct,San Diego,CA,92105,us
121117,"Sergi, Teresa",9260120922,3,Altair Cir,Philadelphia,PA,19131,US
120134,"Shannan, Sian",1600103061,5,Rosebery Ave,Sydney,,2010,AU
120107,"Sheedy, Sherie",1600101851,12,Sir William Pickering Drive,Melbourne,,3175,AU
120722,"Sheffield, Ishmar",9260116991,939,Hilltop Needmore Rd,Miami-Dade,FL,33157,US
120742,"Shewitz, Ronald",9260120978,507,Carriage Pine Dr,Philadelphia,PA,19125,US
120277,"Shirts, Wesley",9260116873,710,Crawford Rd,Miami-Dade,FL,33015,US
120776,"Silverthorne, Ratna",9260116930,284,Forest Dr,Miami-Dade,FL,33142,US
120174,"Simms, Doungkamol",1600101828,30,Goodall Ave,Melbourne,,3053,AU
120782,"Sines, Rilma",9260120951,142,Bluffridge Dr,Philadelphia,PA,19141,US
120781,"Sitnik, Sarah",9260123872,6846,Glastonbury Rd,San Diego,CA,91941,US
120717,"Sleva, Jon",9260116806,472,Big Bend Ct,Miami-Dade,FL,33155,US
120143,"Sloey, Phu",1600103054,1,Pacific Rise Mount Wellington,Sydney,,20000,AU
121028,"Smades, William",9260116940,6,Gamelyn Walk,Miami-Dade,FL,33183,US
121004,"Smith, Kellen",9260123920,1466,Horne St,San Diego,CA,92117,US
121032,"Smith, Nasim",9260123683,340,Bellevue Rd,San Diego,CA,92027,US
120660,"Smith, Robert",9260117010,4156,Hwy 42,Miami-Dade,FL,33180,US
121077,"Smotherly, Bryce",9260116838,4396,Burntwood Cir,Miami-Dade,FL,33193,US
121147,"Sneed, Christine",9260116938,151,Gail Ridge Ln,Miami-Dade,FL,33182,US
120156,"Snellings, Gerry",1600103069,26,St Kilda Road,Sydney,,2022,AU
121033,"Snitzer, Kristie",9260121026,2157,Denberg Ln,Philadelphia,PA,19140,US
120677,"Sochacki, Suad",9260116775,3519,Amersham Ln,Miami-Dade,FL,33160,US
120133,"Soltau, Petrea",1600101818,105,East St,Melbourne,,8060,AU
120111,"Spillane, Ubaldo",1600103064,325,Sherwood Road,Sydney,,1100,AU
120720,"Spingola, John",9260121100,1219,Hawkshead Rd,Philadelphia,PA,19139,US
121060,"Spofford, Elizabeth",9260116923,4368,Farrington Dr,Miami-Dade,FL,33165,US
120164,"Stamalis, Ranj",1600101850,435,Sherwood Rd,Melbourne,,8003,AU
120799,"Stefandonovan, Jeffery",9260121028,47,Dixie Trl,Philadelphia,PA,19136,US
121142,"Steiber, Reginald",9260121136,15,Kilmorack Dr,Philadelphia,PA,19136,US
121022,"Stevens, Robert",9260123921,224,Horsham Way,San Diego,CA,91950,US
121112,"Stouchko, Lee",9260116786,101,Avent Ferry Rd,Miami-Dade,FL,33178,US
120193,"Streit, Russell",1600101824,176,Exhibition Street,Melbourne,,3170,AU
121075,"Sugg, Kasha",9260123796,4137,Deer Haven Dr,San Diego,CA,92101,US
121016,"Sullivan, Lutezenia",9260116789,4758,Barbara Dr,Miami-Dade,FL,33180,US
121000,"Supple, Herman",9260117030,4,Kimbrook Dr,Miami-Dade,Fl,33187,US
120131,"Surawski, Marinus",1600103046,163,Nebo Road,Sydney,,1117,AU
121083,"Sutton, Tingmei",9260117007,6940,Hunt Farms Ln,Miami-Dade,FL,33147,US
120738,"Swaiti, Huilun",9260121097,211,Hamstead Crossing Dr,Philadelphia,PA,19124,US
121134,"Tacosa, Paul",9260123671,2733,Balfour Downs Cir,San Diego,CA,92109,US
120169,"Tannous, Cos",1600101857,13,Symonds Street,Melbourne,,3005,AU
121094,"Tate, Larry",9260123961,2704,Lake Wheeler Rd,San Diego,CA,92082,US
120693,"Tellam, Diaz",1600102970,8,Aboukis Street,Sydney,,1223,AU
120767,"Terricciano, Legette",9260121032,6348,Draper Rd,Philadelphia,PA,19131,US
120755,"Thoits, Elizabeth",9260123885,5,Green Lantern St,San Diego,CA,92128,US
120775,"Thompson, Tanya",9260116965,509,Green Level To Durham Rd,Miami-Dade,FL,33142,US
120167,"Tilley, Kimiko",1600103018,153,High St,Sydney,,2006,AU
120681,"Tolbet, Elery",9260116808,63,Bishops Park Dr,Miami-Dade,FL,33016,US
121138,"Tolley, Hershell",9260120922,3,Altair Cir,Philadelphia,PA,19131,US
120737,"Toner, Brenner",9260123826,36,Enka Dr,San Diego,CA,92037,US
120692,"Tregonning, Rit",1600102983,26,Brisbane Avenue,Sydney,,2064,AU
120686,"Tucker, Berether",9260123670,1999,Avery St,San Diego,CA,91941,US
120732,"Uenking, Kent",9260116807,2853,Birchford Ct,Miami-Dade,FL,33142,US
120752,"Van Damme, Jean-Claude",9260116858,973,Chris Dr,Miami-Dade,FL,33183,US
121093,"Vasconcellos, Carl",9260123738,5194,Calm Winds Ct,San Diego,CA,92071,US
120268,"Villeneuve, Jacques",9260121139,11,Kinderston Dr,Philadelphia,PA,19104,US
120758,"Voltz, Sal",9260116929,34,Flicker Ct,Miami-Dade,FL,33168,US
121057,"Voron, Tachaun",9260120986,990,Center Pointe Dr,Philadelphia,PA,19143,US
120153,"Waal, Samantha",1600102978,121,Blackburn Road,Sydney,,2580,AU
120996,"Wade, Johannes",9260123797,139,Deer Hunter Ct,San Diego,CA,91950,US
120780,"Walcott, Kimberly",9260121101,967,Hearthside Ct,Philadelphia,PA,19148,US
120805,"Walker, Robert",9260121022,153,Dawson Mill Run,Philadelphia,PA,19143,US
121039,"Washington, Donald",9260116813,1668,Bladen St,Miami-Dade,FL,33055,US
120657,"Weisbarth, Theresa",9260123821,1571,Edenton St,San Diego,CA,92114,US
121078,"Wende, Lionel",9260117043,52,Landor Rd,Miami-Dade,FL,33169,US
121024,"Westlund, Michael",9260123709,198,Botany Bay Dr,San Diego,CA,92021,US
121041,"Wetherington, Jaime",9260123714,1428,Brandywine Dr,San Diego,CA,92071,US
121114,"Whipkey, Okema",9260123718,7834,Briar Oaks Ln,San Diego,CA,92104,US
120725,"Whitlock, Robert",9260123669,456,Avent Hill,San Diego,CA,92117,US
120179,"Wills, Matsuoka",1600101830,5059,Great Eastern Highway,Melbourne,,8010,AU
120139,"Wilson, Fang",1600103068,354,St Kilda Rd,Sydney,,2145,AU
120271,"Winge, Kenisha",9260117015,94,Irelan Dr,Miami-Dade,FL,33144,US
120750,"Woods, Connie",9260116932,4407,Fountain Dr,Miami-Dade,FL,33178,US
120764,"Worton, Steven",9260123827,3100,Erinsbrook Dr,San Diego,CA,92026,US
120684,"Woyach, Suzon",9260116853,1107,Caswell Ct,Miami-Dade,FL,33141,US
120771,"Xing Moore, Wei",9260117001,84,Holt Dr,Miami-Dade,FL,33183,US
120102,"Zhou, Tom",1600101795,1,Adelaide Street MIC Court,Melbourne,,3125,AU
120804,"Zied, Ahmed",9260116786,101,Avent Ferry Rd,Miami-Dade,FL,33178,US
120670,"Zisek, Odudu",9260121153,114,Lakerun Ct,Philadelphia,PA,19146,US
120148,"Zubak, Michael",1600102992,51,Court Crescent Panmure,Sydney,,2041,AU
;;;;
run;

data ORION.EMPLOYEE_DONATIONS;
   attrib Employee_ID length=8 label='Employee ID' format=12.;
   attrib Qtr1 length=8;
   attrib Qtr2 length=8;
   attrib Qtr3 length=8;
   attrib Qtr4 length=8;
   attrib Recipients length=$65;
   attrib Paid_By length=$17;

   infile datalines dsd;
   input
      Employee_ID
      Qtr1
      Qtr2
      Qtr3
      Qtr4
      Recipients
      Paid_By
   ;
datalines4;
120265,,,,25,"Mitleid International 90%, Save the Baby Animals 10%",Cash or Check
120267,15,15,15,15,"Disaster Assist, Inc. 80%, Cancer Cures, Inc. 20%",Payroll Deduction
120269,20,20,20,20,"Cancer Cures, Inc. 10%, Cuidadores Ltd. 90%",Payroll Deduction
120270,20,10,5,,"AquaMissions International 10%, Child Survivors 90%",Cash or Check
120271,20,20,20,20,"Cuidadores Ltd. 80%, Mitleid International 20%",Payroll Deduction
120272,10,10,10,10,"AquaMissions International 10%, Child Survivors 90%",Payroll Deduction
120275,15,15,15,15,"AquaMissions International 60%, Child Survivors 40%",Credit Card
120660,25,25,25,25,"Disaster Assist, Inc.",Credit Card
120662,10,,5,5,"Cancer Cures, Inc.",Cash or Check
120663,,,5,,"EarthSalvors 30%, Vox Victimas 70%",Cash or Check
120668,10,10,10,10,"AquaMissions International 80%, Child Survivors 20%",Credit Card
120669,15,15,15,15,"AquaMissions International 60%, Child Survivors 40%",Payroll Deduction
120671,20,20,20,20,"Conserve Nature, Inc. 20%, AquaMissions International 80%",Credit Card
120677,25,25,25,25,"EarthSalvors 60%, Vox Victimas 40%",Credit Card
120678,10,10,,,"Disaster Assist, Inc. 50%, Cancer Cures, Inc. 50%",Payroll Deduction
120679,,20,5,15,"Cancer Cures, Inc.",Cash or Check
120680,15,15,15,15,"Cancer Cures, Inc. 20%, Cuidadores Ltd. 80%",Credit Card
120681,10,10,5,15,"EarthSalvors 60%, Vox Victimas 40%",Cash or Check
120684,5,5,5,5,"Vox Victimas 60%, Conserve Nature, Inc. 40%",Payroll Deduction
120686,15,15,15,15,"Conserve Nature, Inc. 40%, AquaMissions International 60%",Payroll Deduction
120689,15,15,15,15,"Disaster Assist, Inc. 40%, Cancer Cures, Inc. 60%",Credit Card
120713,15,15,15,15,"Save the Baby Animals 90%, EarthSalvors 10%",Payroll Deduction
120715,10,10,10,10,"EarthSalvors 70%, Vox Victimas 30%",Payroll Deduction
120721,5,5,5,5,"Conserve Nature, Inc. 60%, AquaMissions International 40%",Payroll Deduction
120726,10,10,10,10,"Child Survivors 70%, Disaster Assist, Inc. 30%",Payroll Deduction
120734,,,15,10,"EarthSalvors 40%, Vox Victimas 60%",Cash or Check
120736,25,,,20,Cuidadores Ltd.,Cash or Check
120740,15,15,15,15,"Cancer Cures, Inc.",Credit Card
120742,,,10,10,"Conserve Nature, Inc. 40%, AquaMissions International 60%",Cash or Check
120745,15,15,15,15,"Conserve Nature, Inc. 80%, AquaMissions International 20%",Payroll Deduction
120746,20,20,20,20,"Child Survivors 90%, Disaster Assist, Inc. 10%",Payroll Deduction
120747,20,20,20,20,"Child Survivors 90%, Disaster Assist, Inc. 10%",Credit Card
120748,20,20,20,20,Save the Baby Animals,Payroll Deduction
120752,10,,,,"Cuidadores Ltd. 60%, Mitleid International 40%",Payroll Deduction
120753,25,25,25,25,"Conserve Nature, Inc. 50%, AquaMissions International 50%",Payroll Deduction
120754,10,10,10,10,"Cancer Cures, Inc. 60%, Cuidadores Ltd. 40%",Payroll Deduction
120757,,,15,5,AquaMissions International,Cash or Check
120759,15,20,5,,Child Survivors,Cash or Check
120760,,15,20,,"Cancer Cures, Inc. 40%, Cuidadores Ltd. 60%",Cash or Check
120761,10,10,10,10,"EarthSalvors 40%, Vox Victimas 60%",Payroll Deduction
120762,,,5,5,Cuidadores Ltd.,Cash or Check
120764,15,15,15,15,"Vox Victimas 30%, Conserve Nature, Inc. 70%",Payroll Deduction
120766,25,25,25,25,"Mitleid International 80%, Save the Baby Animals 20%",Payroll Deduction
120767,15,15,15,15,"Vox Victimas 50%, Conserve Nature, Inc. 50%",Payroll Deduction
120768,20,20,20,,Save the Baby Animals,Payroll Deduction
120771,20,20,20,20,Cuidadores Ltd.,Credit Card
120773,10,10,10,10,Vox Victimas,Payroll Deduction
120777,5,15,5,15,"Cuidadores Ltd. 80%, Mitleid International 20%",Cash or Check
120778,15,15,15,15,"Cuidadores Ltd. 90%, Mitleid International 10%",Payroll Deduction
120783,20,20,20,20,"Disaster Assist, Inc. 10%, Cancer Cures, Inc. 90%",Payroll Deduction
120789,5,,,,"Save the Baby Animals 90%, EarthSalvors 10%",Credit Card
120790,20,20,20,20,"AquaMissions International 30%, Child Survivors 70%",Credit Card
120791,30,30,30,30,Child Survivors,Payroll Deduction
120792,20,20,20,20,"Mitleid International 40%, Save the Baby Animals 60%",Payroll Deduction
120793,15,15,15,15,Child Survivors,Credit Card
120794,,,20,20,Vox Victimas,Payroll Deduction
120799,5,5,5,5,"Cuidadores Ltd. 40%, Mitleid International 60%",Credit Card
120801,20,20,20,20,Cuidadores Ltd.,Payroll Deduction
120807,20,20,20,20,"AquaMissions International 70%, Child Survivors 30%",Credit Card
120808,,,10,,"AquaMissions International 40%, Child Survivors 60%",Cash or Check
120813,20,20,20,,"Disaster Assist, Inc. 20%, Cancer Cures, Inc. 80%",Credit Card
120814,25,25,25,25,"Child Survivors 80%, Disaster Assist, Inc. 20%",Payroll Deduction
120815,15,15,15,15,"Disaster Assist, Inc.",Payroll Deduction
120994,5,5,10,10,"Cancer Cures, Inc. 80%, Cuidadores Ltd. 20%",Cash or Check
120995,15,15,15,15,"AquaMissions International 40%, Child Survivors 60%",Payroll Deduction
120996,15,15,15,15,"Vox Victimas 70%, Conserve Nature, Inc. 30%",Credit Card
120999,5,5,5,5,"Disaster Assist, Inc. 70%, Cancer Cures, Inc. 30%",Credit Card
121000,20,20,20,20,"AquaMissions International 80%, Child Survivors 20%",Credit Card
121002,10,10,10,10,"Vox Victimas 50%, Conserve Nature, Inc. 50%",Payroll Deduction
121008,10,10,10,10,"Mitleid International 30%, Save the Baby Animals 70%",Payroll Deduction
121009,15,15,15,15,"Cancer Cures, Inc.",Payroll Deduction
121010,10,10,10,10,"Cuidadores Ltd. 60%, Mitleid International 40%",Credit Card
121012,,,5,5,"Child Survivors 10%, Disaster Assist, Inc. 90%",Cash or Check
121013,10,5,,5,"Child Survivors 60%, Disaster Assist, Inc. 40%",Cash or Check
121014,15,15,15,15,"EarthSalvors 70%, Vox Victimas 30%",Payroll Deduction
121018,10,,,,"Conserve Nature, Inc.",Credit Card
121022,15,15,15,15,"EarthSalvors 70%, Vox Victimas 30%",Payroll Deduction
121025,10,10,10,10,"Cuidadores Ltd. 70%, Mitleid International 30%",Payroll Deduction
121030,10,10,10,10,"Mitleid International 30%, Save the Baby Animals 70%",Payroll Deduction
121031,10,10,10,10,Save the Baby Animals,Payroll Deduction
121033,15,15,15,15,Mitleid International,Payroll Deduction
121036,,,,10,Mitleid International,Credit Card
121037,10,10,10,10,"Disaster Assist, Inc. 50%, Cancer Cures, Inc. 50%",Payroll Deduction
121039,10,10,10,10,"Save the Baby Animals 20%, EarthSalvors 80%",Payroll Deduction
121040,10,10,10,10,"Disaster Assist, Inc. 50%, Cancer Cures, Inc. 50%",Credit Card
121044,10,10,10,10,Vox Victimas,Payroll Deduction
121053,5,,5,,"Child Survivors 20%, Disaster Assist, Inc. 80%",Cash or Check
121054,15,15,15,15,Save the Baby Animals,Credit Card
121056,,10,10,10,"Cancer Cures, Inc.",Payroll Deduction
121058,10,10,10,10,"Disaster Assist, Inc. 90%, Cancer Cures, Inc. 10%",Credit Card
121061,10,10,10,10,"Child Survivors 20%, Disaster Assist, Inc. 80%",Payroll Deduction
121062,15,15,15,15,"Cancer Cures, Inc.",Payroll Deduction
121063,15,15,15,15,"AquaMissions International 30%, Child Survivors 70%",Payroll Deduction
121065,10,10,10,10,"EarthSalvors 90%, Vox Victimas 10%",Payroll Deduction
121069,10,10,10,10,Cuidadores Ltd.,Credit Card
121074,10,10,10,10,"Disaster Assist, Inc. 30%, Cancer Cures, Inc. 70%",Payroll Deduction
121077,15,15,15,15,EarthSalvors,Credit Card
121078,15,15,15,15,"Mitleid International 80%, Save the Baby Animals 20%",Credit Card
121079,10,10,10,10,"EarthSalvors 20%, Vox Victimas 80%",Payroll Deduction
121083,15,15,15,15,"AquaMissions International 90%, Child Survivors 10%",Payroll Deduction
121086,,10,10,,"Mitleid International 30%, Save the Baby Animals 70%",Cash or Check
121089,15,15,15,15,"AquaMissions International 70%, Child Survivors 30%",Payroll Deduction
121093,5,,,,"Conserve Nature, Inc.",Cash or Check
121097,10,10,10,10,"Cuidadores Ltd. 80%, Mitleid International 20%",Credit Card
121100,5,5,5,5,"Cuidadores Ltd. 60%, Mitleid International 40%",Payroll Deduction
121101,5,,10,5,"Disaster Assist, Inc. 50%, Cancer Cures, Inc. 50%",Cash or Check
121102,5,5,5,5,"Cancer Cures, Inc.",Credit Card
121103,10,10,10,10,Save the Baby Animals,Payroll Deduction
121105,15,15,15,15,"Disaster Assist, Inc.",Payroll Deduction
121125,10,,,,"Cancer Cures, Inc. 70%, Cuidadores Ltd. 30%",Credit Card
121126,10,,,,"Save the Baby Animals 60%, EarthSalvors 40%",Payroll Deduction
121128,10,,,,"Cancer Cures, Inc.",Credit Card
121129,10,,,,"Cuidadores Ltd. 60%, Mitleid International 40%",Cash or Check
121131,10,,,,"Vox Victimas 40%, Conserve Nature, Inc. 60%",Payroll Deduction
121132,10,,,,"EarthSalvors 50%, Vox Victimas 50%",Credit Card
121133,5,,,,"Disaster Assist, Inc.",Payroll Deduction
121134,5,,,,"Save the Baby Animals 40%, EarthSalvors 60%",Cash or Check
121136,5,5,5,5,"Disaster Assist, Inc. 10%, Cancer Cures, Inc. 90%",Cash or Check
121138,10,10,10,10,Cuidadores Ltd.,Payroll Deduction
121140,10,10,10,10,"Conserve Nature, Inc. 40%, AquaMissions International 60%",Credit Card
121142,35,35,35,35,"AquaMissions International 10%, Child Survivors 90%",Payroll Deduction
121143,35,35,35,35,"Mitleid International 60%, Save the Baby Animals 40%",Payroll Deduction
121145,35,35,35,35,Save the Baby Animals,Payroll Deduction
121147,10,10,10,10,"Cuidadores Ltd. 50%, Mitleid International 50%",Payroll Deduction
;;;;
run;

data ORION.EMPLOYEE_PAYROLL;
   attrib Employee_ID length=8 format=12.;
   attrib Employee_Gender length=$1;
   attrib Salary length=8;
   attrib Birth_Date length=8;
   attrib Employee_Hire_Date length=8;
   attrib Employee_Term_Date length=8;
   attrib Marital_Status length=$1;
   attrib Dependents length=8;

   infile datalines dsd;
   input
      Employee_ID
      Employee_Gender
      Salary
      Birth_Date
      Employee_Hire_Date
      Employee_Term_Date
      Marital_Status
      Dependents
   ;
datalines4;
120101,M,163040,7535,17348,,S,0
120102,M,108255,4971,12205,,O,2
120103,M,87975,-2535,6575,,M,1
120104,F,46230,-600,9132,,M,1
120105,F,27110,6929,15826,,S,0
120106,M,26960,-4026,6575,,M,2
120107,F,30475,-2536,6606,,M,2
120108,F,27660,10280,18475,,S,0
120109,F,26495,11306,18536,,M,3
120110,M,28615,-2233,8705,,M,1
120111,M,26895,-2353,6879,,M,3
120112,F,26550,4796,12600,,M,3
120113,F,26870,-4253,6575,,S,0
120114,F,31285,-4345,6575,,M,3
120115,M,26500,10355,18110,,M,2
120116,M,29250,1259,8797,,S,0
120117,M,31670,3176,11048,,O,1
120118,M,28090,1249,10409,,M,3
120119,M,30255,5103,15341,,M,1
120120,F,27645,-4258,6575,,M,3
120121,F,26600,-4169,6575,,M,1
120122,F,27475,-523,8217,,S,0
120123,F,26190,3193,10866,17928,M,3
120124,M,26480,1228,8460,,M,1
120125,M,32040,-391,8460,17744,M,2
120126,M,26780,11951,18475,,O,2
120127,F,28100,8404,15645,,M,2
120128,F,30890,11152,18567,,S,0
120129,M,30070,3248,10866,17256,S,0
120130,M,26955,10575,18383,,M,2
120131,M,26910,8668,17167,,S,0
120132,F,28525,-2462,8309,,S,0
120133,F,27440,11069,18536,,S,0
120134,M,28015,-2400,6575,18443,M,2
120135,M,32490,4774,15249,17652,M,3
120136,M,26605,8659,17198,,M,1
120137,F,29715,8471,18322,,S,0
120138,F,25795,8592,18444,,S,0
120139,F,26810,11187,18506,,S,0
120140,M,26970,11903,18536,,M,2
120141,F,27465,11759,18383,,M,1
120142,M,29695,11122,18444,,S,0
120143,M,26790,1232,9770,,S,1
120144,M,30265,11023,18536,,S,0
120145,M,26060,2943,10744,,O,0
120146,M,25985,1370,8979,18170,M,1
120147,F,26580,11706,18536,,M,3
120148,M,28480,-2301,8187,,S,0
120149,F,26390,6899,13515,,O,1
120150,M,29965,-541,9709,17652,M,1
120151,F,26520,-4058,6575,,M,3
120152,M,26515,8521,17988,,M,1
120153,F,27260,8527,15341,18293,M,2
120154,F,30490,-4182,6575,,M,1
120155,F,29990,10339,18353,,M,1
120156,F,26445,11932,18322,,O,0
120157,M,27860,11009,18597,,S,0
120158,M,36605,3117,11504,18140,S,0
120159,F,30765,2976,11139,,M,1
120160,M,27115,-479,6848,,M,1
120161,F,30785,11754,18536,,S,0
120162,M,27215,11936,18294,,M,3
120163,M,26735,3064,12784,,M,3
120164,F,27450,1425,9528,,M,2
120165,M,27050,10305,18322,,S,0
120166,M,30660,-4218,6575,18505,S,0
120167,F,25185,-607,6606,18352,S,0
120168,F,25275,10310,18567,,M,1
120169,M,28135,10228,18383,,M,3
120170,M,28830,6630,13423,18566,S,0
120171,F,26205,10427,18506,,M,3
120172,M,28345,-4292,6575,,M,3
120173,M,26715,-677,7822,17744,M,3
120174,F,26850,-4374,6575,18200,S,0
120175,M,25745,11918,18536,,S,0
120176,M,26095,11270,18567,,M,1
120177,F,28745,8495,15372,,S,0
120178,M,26165,-404,6665,,M,3
120179,M,28510,6648,17532,17775,M,1
120180,M,26970,-553,8370,,S,0
120181,F,27065,12020,18597,18717,S,0
120182,M,25020,10505,18597,18627,M,2
120183,M,26910,5001,18597,18627,M,1
120184,M,25820,-2222,18597,18747,O,2
120185,F,25080,6671,18597,18658,M,2
120186,F,26795,8509,18597,18808,O,1
120187,F,26665,10571,18597,18778,M,1
120188,F,26715,-671,18597,18627,M,2
120189,M,25180,10411,18597,18717,S,0
120190,M,24100,10566,17837,18017,M,2
120191,F,24015,1112,17167,17347,S,0
120192,M,26185,10355,18049,18231,M,2
120193,M,24515,10567,18141,18321,S,0
120194,M,25985,10493,17929,18109,M,1
120195,F,24990,10586,18444,18627,S,0
120196,F,24025,10257,17167,17347,S,0
120197,F,25580,-511,17167,17347,M,2
120198,F,28025,11708,18597,,M,1
120259,M,433800,2946,12297,,M,1
120260,F,207885,3258,10532,,M,2
120261,M,243190,4800,11535,,O,1
120262,M,268455,5042,11932,,M,2
120263,M,42605,2962,10135,17531,S,0
120264,F,37510,10249,18597,,S,0
120265,F,51950,-4106,6575,17166,M,3
120266,F,31750,4930,12144,,M,2
120267,F,28585,11110,17198,,M,1
120268,M,76105,6818,15096,,S,0
120269,F,52540,-4113,6575,17652,M,2
120270,M,48435,-647,6575,,O,0
120271,F,43635,3140,11201,,M,1
120272,M,34390,-4309,6575,,S,0
120273,F,28455,11115,18322,,M,2
120274,F,26840,2930,13849,,O,0
120275,F,32195,1456,10501,,M,2
120276,M,28090,-4033,6575,17317,M,3
120277,F,32645,11916,17653,18048,S,0
120278,M,27685,11308,18475,,M,3
120279,F,32925,5041,14731,,S,0
120280,F,36930,3237,11809,16982,M,1
120656,F,42570,6602,15765,,O,0
120657,F,36110,2928,12723,,S,0
120658,M,42485,-377,9163,,O,2
120659,M,161290,-2360,6575,,M,3
120660,M,61125,8192,17957,,S,0
120661,F,85495,-400,10227,17347,M,3
120662,M,27045,11864,18567,,S,0
120663,F,56385,4833,15035,,S,0
120664,M,47605,-682,7060,,M,3
120665,F,80070,6871,16861,,M,1
120666,M,64555,4921,13118,17652,S,0
120667,M,29980,8572,18294,,S,0
120668,M,47785,-2261,8370,,O,0
120669,M,36370,-4179,6575,,S,0
120670,M,65420,-4298,6575,17166,S,0
120671,M,40080,-584,9893,,S,0
120672,M,60980,3159,13209,,M,1
120673,F,35935,-4205,6575,,S,0
120677,F,65555,4993,13546,,M,2
120678,F,40035,-2545,8156,17409,S,0
120679,F,46190,7616,16983,,M,3
120680,F,27295,4985,12904,,S,0
120681,M,30950,8624,17623,,M,2
120682,F,26760,5102,14701,,M,1
120683,F,36315,-415,6575,17225,M,2
120684,F,26960,11287,18567,,S,0
120685,F,25130,10287,18567,,M,3
120686,F,26690,-4256,6575,,M,1
120687,F,26800,8545,17745,17928,O,0
120688,F,25905,-2198,6575,17044,S,0
120689,F,27780,8601,18444,,S,0
120690,F,25185,10243,17867,,S,0
120691,M,49240,-4125,6575,,S,0
120692,M,32485,-405,9587,,M,2
120693,M,26625,1217,8552,,M,3
120694,F,27365,11916,18353,,O,1
120695,M,28180,3116,12235,18474,S,0
120696,M,26615,-505,6634,18352,M,2
120697,F,29625,11866,18414,,O,0
120698,M,26160,-594,7518,17956,O,0
120710,M,54840,6902,15341,,O,1
120711,F,59130,4896,13939,,O,0
120712,F,63640,-2394,6575,,S,0
120713,M,31630,-4330,6575,,M,3
120714,M,62625,7399,15584,,M,3
120715,F,28535,8563,17929,,M,3
120716,M,53015,6779,13727,,M,1
120717,M,30155,-722,9344,,O,2
120718,M,29190,3111,12539,,S,0
120719,F,87420,4770,14641,,M,1
120720,M,46580,3049,13240,,M,2
120721,F,29870,-4089,6575,,M,3
120722,M,32460,1360,10866,,S,0
120723,F,33950,-2335,6575,,O,0
120724,M,63705,2948,13240,,S,0
120725,M,29970,8697,17684,17897,S,0
120726,F,27380,11870,18506,,M,1
120727,M,34925,3098,11109,,M,1
120728,F,35070,-393,9497,,M,1
120729,F,31495,11781,17281,18163,M,3
120730,M,30195,3272,11962,,M,3
120731,M,34150,1169,10105,,O,1
120732,M,35870,-2331,6575,,M,1
120733,M,31760,3015,12723,,M,1
120734,M,34270,8516,18322,,S,1
120735,F,61985,-567,8156,,S,0
120736,F,63985,3253,13057,,S,0
120737,F,63605,1182,11993,,M,2
120738,F,30025,-2370,6575,,S,0
120739,M,36970,11176,18383,,S,0
120740,F,35110,-2265,6575,17409,O,1
120741,F,36365,-4051,6575,,M,2
120742,M,31020,-4349,6575,,S,0
120743,F,34620,4780,15127,,S,0
120744,F,33490,11858,17714,18200,M,2
120745,F,31365,11143,18414,,M,1
120746,M,46090,6857,16892,,M,3
120747,F,43590,6745,14457,,M,2
120748,F,48380,7491,17226,,M,3
120749,M,26545,6837,14884,,S,0
120750,F,32675,-573,8432,16832,M,2
120751,M,58200,3017,11901,,M,3
120752,M,30590,-683,7152,17286,S,0
120753,M,47000,7471,14092,,S,0
120754,M,34760,11841,18383,,M,1
120755,F,36440,3158,10074,,M,3
120756,F,52295,6625,14792,,M,3
120757,M,38545,-4306,6575,17713,M,3
120758,M,34040,3217,13423,,S,0
120759,M,36230,3230,9862,,S,0
120760,F,53475,4754,13635,,S,0
120761,F,30960,11319,18444,,O,2
120762,M,30625,8706,18322,,M,2
120763,M,45100,-4084,6575,,O,1
120764,M,40450,6930,17136,,S,0
120765,F,51950,-380,6575,,S,0
120766,F,53400,6883,16496,,M,1
120767,M,32965,3051,11413,,S,0
120768,M,44955,-528,9405,17500,M,3
120769,M,47990,6718,14701,,S,0
120770,F,43930,3036,11413,17286,S,0
120771,F,36435,-515,7640,,S,0
120772,M,27365,11786,18475,,S,0
120773,F,27370,1148,9222,,M,2
120774,F,45155,8295,16861,18201,M,3
120775,F,41580,4790,14915,,M,3
120776,M,32580,8664,16527,,S,0
120777,M,40955,4833,14000,,S,0
120778,F,43650,-389,10258,,S,0
120779,F,43690,7582,15035,,S,0
120780,F,62995,4992,13057,,M,3
120781,F,32620,11710,17867,18262,M,3
120782,F,63915,6907,15857,,S,0
120783,M,42975,6928,14610,,S,0
120784,F,35715,8514,17776,,O,1
120785,F,48335,4769,13666,,O,2
120786,F,32650,-4306,6575,,S,0
120787,M,34000,4982,14610,,M,1
120788,M,33530,4912,14214,,O,1
120789,M,39330,3117,9831,17317,M,2
120790,F,53740,6915,14365,,S,0
120791,M,61115,3129,11231,,M,2
120792,F,54760,7383,15188,,M,2
120793,M,47155,4968,14762,,S,0
120794,F,51265,8400,17348,,S,0
120795,M,49105,4764,11901,17197,S,0
120796,M,47030,-599,9921,,M,2
120797,F,43385,-410,8005,,M,3
120798,F,80755,1269,11323,,O,1
120799,M,29070,8482,15645,,M,3
120800,M,80210,6928,15127,17197,S,0
120801,F,40040,6639,15887,,M,2
120802,F,65125,-2426,8036,17713,S,0
120803,M,43630,-574,8036,,S,0
120804,M,55400,-4342,6575,,S,0
120805,M,58530,8213,16162,,M,3
120806,F,47285,6630,13180,,M,2
120807,F,43325,1443,9497,17775,S,0
120808,M,44425,3074,10379,,S,0
120809,F,47155,-4370,6575,,S,0
120810,M,58375,-454,8826,,S,0
120811,M,43985,5017,13696,,S,0
120812,M,45810,6624,16649,,O,1
120813,M,50865,5005,13515,17531,S,0
120814,M,59140,1249,8644,,M,1
120815,M,31590,12049,18353,,M,2
120816,F,30485,4871,13727,,S,0
120992,F,26940,8448,16284,,S,0
120993,F,26260,5100,15035,,M,2
120994,F,31645,6741,14184,,S,0
120995,F,34850,10391,18475,,M,1
120996,M,32745,6776,17045,,M,3
120997,F,27420,6899,14854,,S,0
120998,F,26330,8740,17988,,M,1
120999,F,27215,1457,10318,,S,0
121000,M,48600,2946,13849,,M,2
121001,M,43615,1116,7914,,S,0
121002,F,26650,-470,8735,17775,M,3
121003,M,26000,11813,18444,,S,0
121004,M,30895,-4168,6575,,S,0
121005,M,25020,10423,17563,,O,2
121006,M,26145,11242,17837,18201,M,2
121007,M,27290,3207,11354,,M,3
121008,M,27875,4932,13727,,M,1
121009,M,32955,8738,15918,,S,0
121010,M,25195,10453,18322,,S,0
121011,M,25735,-4313,6575,,S,0
121012,M,29575,10983,17410,17866,S,0
121013,M,26675,8518,16162,,S,0
121014,F,28510,6695,15918,,M,3
121015,M,26140,8747,16315,,S,0
121016,F,48075,7323,17776,,S,0
121017,M,29225,10232,17957,,S,0
121018,F,27560,-4381,6575,17286,M,2
121019,M,31320,11133,17684,18109,M,3
121020,F,31750,10280,16922,,M,1
121021,F,32985,6918,13939,,S,0
121022,M,32210,8701,16833,17775,S,0
121023,M,26010,2994,12174,18140,M,3
121024,M,26600,10491,17653,,M,2
121025,M,28295,-2274,7183,,S,0
121026,M,31515,11269,18353,,M,1
121027,M,26165,3047,12388,,M,3
121028,M,26585,11805,18567,,S,0
121029,M,27225,3278,12388,,M,2
121030,M,26745,8716,16468,,S,0
121031,M,28060,3112,10805,,M,3
121032,M,31335,11742,18322,,M,1
121033,F,29775,11267,17684,,M,3
121034,M,27110,11923,18628,,S,0
121035,M,26460,-4299,6575,,M,3
121036,F,25965,11887,17440,18201,O,1
121037,M,28310,6737,16861,,M,2
121038,M,25285,11731,18475,18659,S,0
121039,M,27460,-577,8887,,M,2
121040,F,29525,1282,9801,,M,2
121041,F,26120,-4349,6575,,S,0
121042,M,28845,8494,16010,,M,2
121043,F,28225,5061,13209,,M,2
121044,M,25660,-386,7152,,S,0
121045,F,28560,3086,13880,17591,M,2
121046,M,25845,10477,18444,18628,M,1
121047,F,25820,8730,18506,18687,M,2
121048,F,26560,10402,18506,18687,M,3
121049,F,26930,11002,18597,,M,3
121050,F,26080,10969,18597,,M,3
121051,F,26025,-2435,8340,,M,2
121052,M,26900,10966,18567,,S,0
121053,F,29955,-4117,6606,,M,2
121054,M,29805,-415,7610,,S,0
121055,M,30185,11695,18475,,M,1
121056,F,28325,10413,17287,,O,1
121057,M,25125,1455,9101,,M,1
121058,M,26270,6767,17075,,M,2
121059,F,27425,1393,9222,17531,S,0
121060,F,28800,-4224,6575,,M,2
121061,M,29815,-534,10409,,S,0
121062,F,30305,10528,18475,,M,3
121063,M,35990,8608,18110,,S,0
121064,M,25110,2949,13027,,M,1
121065,F,28040,10475,18353,,M,2
121066,F,27250,-4148,6575,18201,O,1
121067,F,31865,10975,18322,18506,S,0
121068,M,27550,5084,13393,,O,1
121069,M,26195,4826,12692,,M,1
121070,F,29385,10535,18294,,O,1
121071,M,28625,1348,7914,,M,2
121072,M,26105,8410,17776,18201,M,1
121073,M,27100,-2422,6575,,M,1
121074,M,26990,1155,11962,,S,0
121075,F,28395,-4026,6575,,M,3
121076,M,26685,3204,9862,17683,M,2
121077,M,28585,10475,18536,,S,0
121078,M,27485,-2436,8340,,M,1
121079,M,25770,6728,15280,,M,1
121080,M,32235,1119,11566,,S,0
121081,F,30235,-2470,7396,,M,2
121082,M,28510,-2371,7944,,M,3
121083,F,27245,1165,8460,,S,0
121084,M,22710,3150,12784,,M,3
121085,M,32235,11273,18628,,S,0
121086,M,26820,-4033,6575,,M,3
121087,F,28325,6915,15765,18352,M,3
121088,M,27240,11849,18628,,S,0
121089,M,28095,-498,6756,18566,M,1
121090,F,26600,-561,8797,,M,3
121091,M,27325,4798,12054,,M,2
121092,F,25680,6641,17014,,S,0
121093,M,27410,3121,13880,17347,M,2
121094,M,26555,-724,8279,,S,0
121095,F,28010,4852,12965,,S,0
121096,M,26335,4886,14365,,S,0
121097,F,26830,6870,14518,,M,3
121098,M,27475,11769,18383,,S,0
121099,M,32725,8478,16192,,M,3
121100,M,28135,-2440,7396,,S,0
121101,F,25390,11197,18567,,O,1
121102,F,27115,8577,18414,,M,2
121103,M,27260,11806,18506,,S,0
121104,F,28315,3238,11048,16832,S,0
121105,F,29545,8529,17167,,S,0
121106,M,25880,4781,14641,,M,3
121107,F,31380,11071,18444,,M,1
121108,F,25930,11873,18567,18748,S,0
121109,M,26035,5057,12539,,M,1
121110,M,26370,-4279,18597,18627,M,1
121111,M,26885,-4185,18597,18747,S,0
121112,M,26855,11304,18597,18627,S,0
121113,F,27480,-679,18597,18658,O,1
121114,F,26515,-4075,18597,18808,M,3
121115,M,26430,1139,18597,18747,S,0
121116,F,26670,3188,18597,18717,M,3
121117,F,26640,6651,18597,18627,S,0
121118,M,25725,8460,18597,18778,S,0
121119,M,25205,3229,18597,18686,M,3
121120,F,25020,6872,18597,18686,S,0
121121,F,25735,11021,18597,18778,S,0
121122,M,26265,11017,18597,18717,S,0
121123,M,26410,-4266,18597,18717,M,3
121124,M,26925,4794,18597,18627,S,0
121125,M,25315,6681,17167,17347,S,0
121126,M,26015,-432,17167,17347,M,1
121127,F,25435,11203,18049,18231,M,2
121128,F,25405,6751,17167,17347,M,3
121129,M,30945,3043,17167,17347,S,0
121130,M,25255,10247,17563,17744,S,0
121131,M,25445,4929,17167,17347,M,2
121132,M,24390,-692,17167,17347,M,1
121133,M,25405,8714,17167,17347,M,1
121134,M,25585,3105,17167,17347,S,0
121135,F,27010,-573,6787,,S,0
121136,F,27460,6770,17136,17805,S,0
121137,M,27055,11705,18353,,O,0
121138,M,27265,-2498,6575,,M,1
121139,F,27700,1326,11504,,M,2
121140,M,26335,8423,16527,18293,S,0
121141,M,194885,-4213,6575,,S,0
121142,M,156065,4793,13635,,M,2
121143,M,95090,5078,15157,,M,3
121144,F,83505,3101,13088,,M,3
121145,M,84260,-2231,7396,,M,2
121146,F,29320,11300,18353,,M,1
121147,F,29145,4896,11566,,M,2
121148,M,52930,4749,15341,17197,M,1
;;;;
run;

data ORION.LOOKUP_COUNTRY;
   attrib FMTNAME length=$32 label='Format name';
   attrib START length=$19 label='Start of Range';
   attrib END length=$19 label='End of Range';
   attrib LABEL length=$48 label='Value to Display';
   attrib TYPE length=$1 label='Character or Numeric Source Data?';
   attrib HLO length=$11 label='Additional information';

   infile datalines dsd;
   input
      FMTNAME
      START
      END
      LABEL
      TYPE
      HLO
   ;
datalines4;
COUNTRY,AD,AD,Andorra,C,
COUNTRY,AE,AE,United Arab Emirates,C,
COUNTRY,AF,AF,Afghanistan,C,
COUNTRY,AG,AG,Antigua/Barbuda,C,
COUNTRY,AI,AI,Anguilla,C,
COUNTRY,AL,AL,Albania,C,
COUNTRY,AM,AM,Armenia,C,
COUNTRY,AN,AN,Netherlands Antilles,C,
COUNTRY,AO,AO,Angola,C,
COUNTRY,AQ,AQ,Antarctica,C,
COUNTRY,AR,AR,Argentina,C,
COUNTRY,AS,AS,American Samoa,C,
COUNTRY,AT,AT,Austria,C,
COUNTRY,AU,AU,Australia,C,
COUNTRY,AW,AW,Aruba,C,
COUNTRY,AZ,AZ,Azerbaijan,C,
COUNTRY,BA,BA,Bosnia/Herzegovina,C,
COUNTRY,BB,BB,Barbados,C,
COUNTRY,BD,BD,Bangladesh,C,
COUNTRY,BE,BE,Belgium,C,
COUNTRY,BF,BF,Burkina Faso,C,
COUNTRY,BG,BG,Bulgaria,C,
COUNTRY,BH,BH,Bahrain,C,
COUNTRY,BI,BI,Burundi,C,
COUNTRY,BJ,BJ,Benin,C,
COUNTRY,BM,BM,Bermuda,C,
COUNTRY,BN,BN,Brunei,C,
COUNTRY,BO,BO,Bolivia,C,
COUNTRY,BR,BR,Brazil,C,
COUNTRY,BS,BS,Bahamas,C,
COUNTRY,BT,BT,Bhutan,C,
COUNTRY,BV,BV,Bouvet Island,C,
COUNTRY,BW,BW,Botswana,C,
COUNTRY,BY,BY,Belarus,C,
COUNTRY,BZ,BZ,Belize,C,
COUNTRY,CA,CA,Canada,C,
COUNTRY,CC,CC,Cocos Islands,C,
COUNTRY,CD,CD,Congo,C,
COUNTRY,CF,CF,Central African Rep.,C,
COUNTRY,CG,CG,Congo,C,
COUNTRY,CH,CH,Switzerland,C,
COUNTRY,CI,CI,Ivory Coast,C,
COUNTRY,CK,CK,Cook Islands,C,
COUNTRY,CL,CL,Chile,C,
COUNTRY,CM,CM,Cameroon,C,
COUNTRY,CN,CN,China,C,
COUNTRY,CO,CO,Colombia,C,
COUNTRY,CR,CR,Costa Rica,C,
COUNTRY,CU,CU,Cuba,C,
COUNTRY,CV,CV,Cape Verde,C,
COUNTRY,CX,CX,Christmas Island,C,
COUNTRY,CY,CY,Cyprus,C,
COUNTRY,CZ,CZ,Czech Republic,C,
COUNTRY,DA,DA,Germany,C,
COUNTRY,DE,DE,Germany,C,
COUNTRY,DJ,DJ,Djibouti,C,
COUNTRY,DK,DK,Denmark,C,
COUNTRY,DM,DM,Dominica,C,
COUNTRY,DO,DO,Dominican Republic,C,
COUNTRY,DZ,DZ,Algeria,C,
COUNTRY,EC,EC,Ecuador,C,
COUNTRY,EE,EE,Estonia,C,
COUNTRY,EG,EG,Egypt,C,
COUNTRY,EH,EH,Western Sahara,C,
COUNTRY,ER,ER,Eritrea,C,
COUNTRY,ES,ES,Spain,C,
COUNTRY,ET,ET,Ethiopia,C,
COUNTRY,FI,FI,Finland,C,
COUNTRY,FJ,FJ,Fiji,C,
COUNTRY,FK,FK,Falkland Islands,C,
COUNTRY,FM,FM,Micronesia,C,
COUNTRY,FO,FO,Faroe Islands,C,
COUNTRY,FR,FR,France,C,
COUNTRY,GA,GA,Gabon,C,
COUNTRY,GB,GB,United Kingdom,C,
COUNTRY,GD,GD,Grenada,C,
COUNTRY,GE,GE,Georgia,C,
COUNTRY,GF,GF,French Guiana,C,
COUNTRY,GH,GH,Ghana,C,
COUNTRY,GI,GI,Gibraltar,C,
COUNTRY,GL,GL,Greenland,C,
COUNTRY,GM,GM,Gambia,C,
COUNTRY,GN,GN,Guinea,C,
COUNTRY,GP,GP,Guadeloupe,C,
COUNTRY,GQ,GQ,Equatorial Guinea,C,
COUNTRY,GR,GR,Greece,C,
COUNTRY,GT,GT,Guatemala,C,
COUNTRY,GU,GU,Guam,C,
COUNTRY,GW,GW,Guinea-Bissau,C,
COUNTRY,GY,GY,Guyana,C,
COUNTRY,HK,HK,Hong Kong,C,
COUNTRY,HM,HM,Heard/Mcdonald,C,
COUNTRY,HN,HN,Honduras,C,
COUNTRY,HR,HR,Croatia,C,
COUNTRY,HT,HT,Haiti,C,
COUNTRY,HU,HU,Hungary,C,
COUNTRY,ID,ID,Indonesia,C,
COUNTRY,IE,IE,Ireland,C,
COUNTRY,IL,IL,Israel,C,
COUNTRY,IN,IN,India,C,
COUNTRY,IO,IO,British Indian Ocean,C,
COUNTRY,IQ,IQ,Iraq,C,
COUNTRY,IR,IR,Iran,C,
COUNTRY,IS,IS,Iceland,C,
COUNTRY,IT,IT,Italy,C,
COUNTRY,JM,JM,Jamaica,C,
COUNTRY,JO,JO,Jordan,C,
COUNTRY,JP,JP,Japan,C,
COUNTRY,KE,KE,Kenya,C,
COUNTRY,KG,KG,Kyrgyzstan,C,
COUNTRY,KH,KH,Cambodia,C,
COUNTRY,KI,KI,Kiribati,C,
COUNTRY,KM,KM,Comoros,C,
COUNTRY,KN,KN,Saint Kitts/Nevis,C,
COUNTRY,KP,KP,"Korea, North",C,
COUNTRY,KR,KR,"Korea, South",C,
COUNTRY,KW,KW,Kuwait,C,
COUNTRY,KY,KY,Cayman Islands,C,
COUNTRY,KZ,KZ,Kazakhstan,C,
COUNTRY,LA,LA,Laos,C,
COUNTRY,LB,LB,Lebanon,C,
COUNTRY,LC,LC,St. Lucia,C,
COUNTRY,LI,LI,Liechtenstein,C,
COUNTRY,LK,LK,Sri Lanka,C,
COUNTRY,LR,LR,Liberia,C,
COUNTRY,LS,LS,Lesotho,C,
COUNTRY,LT,LT,Lithuania,C,
COUNTRY,LU,LU,Luxembourg,C,
COUNTRY,LV,LV,Latvia,C,
COUNTRY,LY,LY,Libya,C,
COUNTRY,MA,MA,Morocco,C,
COUNTRY,MC,MC,Monaco,C,
COUNTRY,MD,MD,Moldova,C,
COUNTRY,MG,MG,Madagascar,C,
COUNTRY,MH,MH,Marshall Islands,C,
COUNTRY,MK,MK,Macedonia,C,
COUNTRY,ML,ML,Mali,C,
COUNTRY,MM,MM,Myanmar,C,
COUNTRY,MN,MN,Mongolia,C,
COUNTRY,MO,MO,Macau,C,
COUNTRY,MP,MP,Northern Mariana Islands,C,
COUNTRY,MQ,MQ,Martinique,C,
COUNTRY,MR,MR,Mauritania,C,
COUNTRY,MS,MS,Montserrat,C,
COUNTRY,MT,MT,Malta,C,
COUNTRY,MU,MU,Mauritius,C,
COUNTRY,MV,MV,Maldives,C,
COUNTRY,MW,MW,Malawi,C,
COUNTRY,MX,MX,Mexico,C,
COUNTRY,MY,MY,Malaysia,C,
COUNTRY,MZ,MZ,Mozambique,C,
COUNTRY,NA,NA,Namibia,C,
COUNTRY,NC,NC,New Caledonia,C,
COUNTRY,NE,NE,Niger,C,
COUNTRY,NF,NF,Norfolk Island,C,
COUNTRY,NG,NG,Nigeria,C,
COUNTRY,NI,NI,Nicaragua,C,
COUNTRY,NL,NL,Netherlands,C,
COUNTRY,NO,NO,Norway,C,
COUNTRY,NP,NP,Nepal,C,
COUNTRY,NR,NR,Nauru,C,
COUNTRY,NU,NU,Niue,C,
COUNTRY,NZ,NZ,New Zealand,C,
COUNTRY,OM,OM,Oman,C,
COUNTRY,PA,PA,Panama,C,
COUNTRY,PE,PE,Peru,C,
COUNTRY,PF,PF,French Polynesia,C,
COUNTRY,PG,PG,Papua New Guinea,C,
COUNTRY,PH,PH,Philippines,C,
COUNTRY,PK,PK,Pakistan,C,
COUNTRY,PL,PL,Poland,C,
COUNTRY,PM,PM,St. Pierre/Miquelon,C,
COUNTRY,PN,PN,Pitcairn Islands,C,
COUNTRY,PR,PR,Puerto Rico,C,
COUNTRY,PS,PS,Gaza Strip,C,
COUNTRY,PT,PT,Portugal,C,
COUNTRY,PW,PW,Palau,C,
COUNTRY,PY,PY,Paraguay,C,
COUNTRY,QA,QA,Qatar,C,
COUNTRY,RE,RE,Reunion,C,
COUNTRY,RO,RO,Romania,C,
COUNTRY,RU,RU,Russia,C,
COUNTRY,RW,RW,Rwanda,C,
COUNTRY,SA,SA,Saudi Arabia,C,
COUNTRY,SB,SB,Solomon Islands,C,
COUNTRY,SC,SC,Seychelles,C,
COUNTRY,SD,SD,Sudan,C,
COUNTRY,SE,SE,Sweden,C,
COUNTRY,SG,SG,Singapore,C,
COUNTRY,SH,SH,St. Helena,C,
COUNTRY,SI,SI,Slovenia,C,
COUNTRY,SJ,SJ,Svalbard,C,
COUNTRY,SK,SK,Slovakia,C,
COUNTRY,SL,SL,Sierra Leone,C,
COUNTRY,SM,SM,San Marino,C,
COUNTRY,SN,SN,Senegal,C,
COUNTRY,SO,SO,Somalia,C,
COUNTRY,SR,SR,Suriname,C,
COUNTRY,ST,ST,Sao Tome/Principe,C,
COUNTRY,SV,SV,El Salvador,C,
COUNTRY,SY,SY,Syria,C,
COUNTRY,SZ,SZ,Swaziland,C,
COUNTRY,TC,TC,Turks/Caicos Islands,C,
COUNTRY,TD,TD,Chad,C,
COUNTRY,TF,TF,French Southern Terr.,C,
COUNTRY,TG,TG,Togo,C,
COUNTRY,TH,TH,Thailand,C,
COUNTRY,TJ,TJ,Tajikistan,C,
COUNTRY,TK,TK,Tokelau,C,
COUNTRY,TM,TM,Turkmenistan,C,
COUNTRY,TN,TN,Tunisia,C,
COUNTRY,TO,TO,Tonga,C,
COUNTRY,TP,TP,East Timor,C,
COUNTRY,TR,TR,Turkey,C,
COUNTRY,TT,TT,Trinidad and Tobago,C,
COUNTRY,TV,TV,Tuvalu,C,
COUNTRY,TW,TW,Taiwan,C,
COUNTRY,TZ,TZ,Tanzania,C,
COUNTRY,UA,UA,Ukraine,C,
COUNTRY,UG,UG,Uganda,C,
COUNTRY,US,US,United States,C,
COUNTRY,UY,UY,Uruguay,C,
COUNTRY,UZ,UZ,Uzbekistan,C,
COUNTRY,VC,VC,Saint Vincent/Grenadines,C,
COUNTRY,VE,VE,Venezuela,C,
COUNTRY,VG,VG,British Virgin Islands,C,
COUNTRY,VI,VI,Virgin Islands (U.S.),C,
COUNTRY,VN,VN,Vietnam,C,
COUNTRY,VU,VU,Vanuatu,C,
COUNTRY,WF,WF,Wallis/Futuna Islands,C,
COUNTRY,WS,WS,Samoa,C,
COUNTRY,XX,XX,Zaire,C,
COUNTRY,YE,YE,Yemen,C,
COUNTRY,YT,YT,Mayotte,C,
COUNTRY,YU,YU,Yugoslavia,C,
COUNTRY,ZA,ZA,South Africa,C,
COUNTRY,ZM,ZM,Zambia,C,
COUNTRY,ZW,ZW,Zimbabwe,C,
;;;;
run;

data ORION.MNTH7_2011;
   attrib Order_ID length=8 label='Order ID' format=12.;
   attrib Order_Type length=8 label='Order Type';
   attrib Employee_ID length=8 label='Employee ID' format=12.;
   attrib Customer_ID length=8 label='Customer ID' format=12.;
   attrib Order_Date length=8 label='Date Order was placed by Customer' format=DATE9.;
   attrib Delivery_Date length=8 label='Date Order was Delivered' format=DATE9.;

   infile datalines dsd;
   input
      Order_ID
      Order_Type
      Employee_ID
      Customer_ID
      Order_Date
      Delivery_Date
   ;
datalines4;
1242691897,2,99999999,90,18810,18812
1242736731,1,121107,10,18815,18815
1242773202,3,99999999,24,18819,18822
1242782701,3,99999999,27,18820,18825
1242827683,1,121105,10,18825,18825
1242836878,1,121027,10,18826,18826
1242838815,1,120195,41,18827,18827
1242848557,2,99999999,2806,18827,18831
1242923327,3,99999999,70165,18836,18837
1242938120,1,120124,171,18838,18838
;;;;
run;

data ORION.MNTH8_2011;
   attrib Order_ID length=8 label='Order ID' format=12.;
   attrib Order_Type length=8 label='Order Type';
   attrib Employee_ID length=8 label='Employee ID' format=12.;
   attrib Customer_ID length=8 label='Customer ID' format=12.;
   attrib Order_Date length=8 label='Date Order was placed by Customer' format=DATE9.;
   attrib Delivery_Date length=8 label='Date Order was Delivered' format=DATE9.;

   infile datalines dsd;
   input
      Order_ID
      Order_Type
      Employee_ID
      Customer_ID
      Order_Date
      Delivery_Date
   ;
datalines4;
1242977743,2,99999999,65,18842,18846
1243012144,2,99999999,2806,18845,18849
1243026971,1,120733,10,18847,18847
1243039354,1,120143,41,18849,18849
1243049938,3,99999999,53,18850,18853
1243110343,1,121032,10,18856,18856
1243127549,1,120159,171,18859,18859
1243152030,1,120734,45,18861,18862
1243152039,1,121089,90,18861,18861
1243165497,3,99999999,70201,18863,18868
1243198099,1,121061,10,18866,18866
1243227745,1,120141,171,18870,18880
;;;;
run;

data ORION.MNTH9_2011;
   attrib Order_ID length=8 label='Order ID' format=12.;
   attrib Order_Type length=8 label='Order Type';
   attrib Employee_ID length=8 label='Employee ID' format=12.;
   attrib Customer_ID length=8 label='Customer ID' format=12.;
   attrib Order_Date length=8 label='Date Order was placed by Customer' format=DATE9.;
   attrib Delivery_Date length=8 label='Date Order was Delivered' format=DATE9.;

   infile datalines dsd;
   input
      Order_ID
      Order_Type
      Employee_ID
      Customer_ID
      Order_Date
      Delivery_Date
   ;
datalines4;
1243269405,2,99999999,928,18874,18878
1243279343,3,99999999,27,18875,18880
1243290080,1,121057,31,18876,18876
1243290089,1,121065,45,18876,18876
1243315613,1,121026,5,18879,18879
1243398628,1,121051,12,18888,18888
1243417726,1,121029,69,18890,18890
1243462945,3,99999999,24,18895,18898
1243465031,1,120195,41,18896,18896
1243485097,3,99999999,11,18898,18902
;;;;
run;

data ORION.NONSALES;
   attrib Employee_ID length=8 format=12.;
   attrib First length=$12;
   attrib Last length=$18;
   attrib Gender length=$1;
   attrib Salary length=8;
   attrib Job_Title length=$25;
   attrib Country length=$2;
   attrib Birth_Date length=8 format=DDMMYY10.;
   attrib Hire_Date length=8 format=DDMMYY10.;

   infile datalines dsd;
   input
      Employee_ID
      First
      Last
      Gender
      Salary
      Job_Title
      Country
      Birth_Date
      Hire_Date
   ;
datalines4;
120101,Patrick,Lu,M,163040,Director,AU,7535,17348
120104,Kareen,Billington,F,46230,Administration Manager,au,-600,9132
120105,Liz,Povey,F,27110,Secretary I,AU,6929,15826
120106,John,Hornsey,M,,Office Assistant II,AU,-4026,6575
120107,Sherie,Sheedy,F,30475,Office Assistant III,AU,8067,-1075
120108,Gladys,Gromek,F,27660,Warehouse Assistant II,AU,10280,18475
120108,Gabriele,Baker,F,26495,Warehouse Assistant I,AU,11306,18536
120110,Dennis,Entwisle,M,28615,Warehouse Assistant III,AU,-2233,8705
120111,Ubaldo,Spillane,M,26895,Security Guard II,AU,-2353,
120112,Ellis,Glattback,F,26550,,AU,4796,12600
120113,Riu,Horsey,F,26870,Security Guard II,AU,-4253,6575
120114,Jeannette,Buddery,G,31285,Security Manager,AU,-4345,6575
120115,Hugh,Nichollas,M,2650,Service Assistant I,AU,10355,18110
,Austen,Ralston,M,29250,Service Assistant II,AU,1259,8797
120117,Bill,Mccleary,M,31670,Cabinet Maker III,AU,3176,11048
120118,Darshi,Hartshorn,M,28090,Cabinet Maker II,AU,1249,10409
120119,Lal,Elleman,M,30255,Electrician IV,AU,5103,15341
120120,Krishna,Peiris,F,27645,Electrician II,AU,-4258,6575
120190,Ivor,Czernezkyi,M,24100,Trainee,AU,10566,17837
120191,Jannene,Graham-Rowe,F,2401,Trainee,AU,1112,17167
120192,Anthony,Nichollas,M,26185,Trainee,AU,10355,18049
120193,Russell,Streit,M,24515,Trainee,AU,10567,18141
120194,Reece,Harwood,M,25985,Trainee,AU,10493,17929
120195,Jina,Fiocca,F,24990,Trainee,AU,10586,18444
120196,Merle,Hieds,F,24025,Trainee,AU,10257,17167
120197,Kerrin,Dillin,F,25580,Trainee,AU,-511,17167
120259,Anthony,Miller,M,433800,Chief Executive Officer,US,2946,12297
120260,Christine,Fletcher,F,207885,Chief Marketing Officer,US,3258,10532
120262,Max,Crown,M,268455,Chief Financial Officer,US,5042,11932
120263,Bobby,Cleverley,M,42605,Financial Analyst III,US,2962,10135
120264,Latonya,Croome,F,37510,Financial Analyst II,US,10249,18597
120265,Wanda,Branly,F,51950,Auditor III,US,-4106,6575
120266,Bao,Krafve,F,31750,Secretary IV,US,4930,12144
120267,Belanda,Rink,F,28585,Secretary III,US,11110,17198
120268,Jacques,Villeneuve,M,76105,Senior Strategist,US,6818,15096
120269,Shrimatee,Kagolanu,F,52540,Strategist II,US,-4113,6575
120270,Grezegorz,Nuss,M,48435,Concession Director,US,-647,6575
120271,Kenisha,Winge,F,43635,Concession Manager,US,3140,11201
120272,Febin,Flow,M,34390,Concession Consultant II,US,-4309,6575
120273,Doris,Antonini,F,28455,Concession Assistant III,US,11115,18322
120274,Angela,Landry,F,26840,Concession Assistant I,US,2930,13849
120275,Brandy,Lattimer,F,32195,Concession Consultant II,US,1456,10501
120276,Nicholas,Plybon,M,28090,Concession Assistant II,US,-4033,6575
120277,Wesley,Shirts,F,32645,Concession Consultant I,US,11916,17653
120278,Binit,Jongleux,M,27685,Concession Assistant III,US,11308,18475
120279,Kareema,Dunlap,F,32925,Concession Consultant I,US,5041,14731
120280,Jaime,Laurer,F,36930,Concession Consultant III,US,3237,11809
120656,Salley,Amos,F,42570,Logistics Coordinator II,US,6602,15765
120657,Theresa,Weisbarth,F,36110,Logistics Coordinator I,US,2928,12723
120658,Kenneth,Kennedy,M,42485,Logistics Coordinator II,US,-377,9163
120659,Jay,Havasy,M,161290,Director,US,-2360,6575
120660,Robert,Smith,M,61125,Logistics Manager,US,8192,17957
120661,Cynthia,Racine,F,85495,Senior Logistics Manager,US,-400,10227
120662,Lemonica,Burroughs,M,27045,Secretary II,US,11864,18567
120663,Anglar,Kornblith,F,56385,Pricing Manager,US,4833,15035
120664,Brock,Senchak,M,47605,Pricing Specialist,US,-682,7060
120665,Jill,Leacock,F,80070,Senior Logistics Manager,US,6871,16861
120666,John,Onuscheck,M,64555,Logistics Manager,US,4921,13118
120667,Edwin,Droste,M,29980,Office Assistant III,US,8572,18294
120668,Thyland,Dolan,M,47785,Services Manager,US,-2261,8370
120669,Ronald,Hill,M,36370,Services Assistant IV,US,-4179,6575
120670,Odudu,Zisek,M,65420,Shipping Manager,US,-4298,6575
120671,William,Latty,M,40080,Shipping Agent III,US,-584,9893
120672,Verne,Guscott,M,60980,Shipping Manager,AU,3159,13209
120673,Pearl,Santomaggio,F,35935,Shipping Agent II,AU,-4205,6575
120677,Suad,Sochacki,F,65555,Shipping Manager,US,4993,13546
120678,Lucretta,Octetree,F,40035,Shipping Agent III,US,-2545,8156
120679,Chrisy,Cutucache,F,46190,Shipping Manager,US,7616,16983
120680,Raymondria,Desaulniers,F,27295,Shipping Agent I,US,4985,12904
120681,Elery,Tolbet,M,30950,Shipping Agent II,US,8624,17623
120682,Barbara,Kennedy,F,26760,Shipping Agent I,US,5102,14701
120683,Deven,Kochneff,F,36315,Shipping Agent III,US,-415,6575
120684,Suzon,Woyach,F,26960,Warehouse Assistant I,US,11287,18567
120685,Anita,Howard,F,25130,Warehouse Assistant I,US,10287,18567
120686,Berether,Tucker,F,26690,Warehouse Assistant II,US,-4256,6575
120687,Freda,Dannin,F,26800,Warehouse Assistant I,US,8545,17745
120688,Lisa,Carcaterra,F,25905,Warehouse Assistant I,US,-2198,6575
120689,Katherine,Pongor,F,27780,Warehouse Assistant III,US,8601,18444
120690,Taronda,Langston,F,25185,Warehouse Assistant I,US,10243,17867
120691,Sek,Habres,M,49240,Shipping Manager,AU,-4125,6575
120692,Rit,Tregonning,M,32485,Shipping Agent II,AU,-405,9587
120693,Diaz,Tellam,M,26625,Shipping Agent I,AU,1217,8552
120694,Sharon,Leazer,F,27365,Warehouse Assistant I,AU,11916,18353
120695,Trent,Moffat,M,28180,Warehouse Assistant II,au,3116,12235
120696,Peter,Pettolino,M,26615,Warehouse Assistant I,AU,-505,6634
120697,Madelaine,Fouche,F,29625,Warehouse Assistant IV,AU,11866,18414
120698,Geoff,Kistanna,M,26160,Warehouse Assistant I,au,-594,7518
120710,Timothy,Baltzell,M,54840,Business Analyst II,US,6902,15341
120711,Gloria,Drew,F,59130,Business Analyst III,US,4896,13939
120712,Elisabeth,Motashaw,F,63640,Marketing Manager,US,-2394,6575
120713,Carston,Campbell,M,31630,Marketing Assistant III,US,-4330,6575
120714,Robert,Dinley,M,62625,Marketing Manager,US,7399,15584
120715,Angelia,Neal,F,28535,Marketing Assistant II,US,8563,17929
120716,Kenneth,Juif,M,53015,Events Manager,US,6779,13727
120717,Jon,Sleva,M,30155,Marketing Assistant II,US,-722,9344
120718,Charles,Hennington,M,29190,Marketing Assistant II,US,3111,12539
120719,Roya,Ridley,F,87420,Senior Marketing Manager,US,4770,14641
120720,John,Spingola,M,46580,Corp. Comm. Manager,US,3049,13240
120721,Dlutomi,Knust,F,29870,Marketing Assistant II,US,-4089,6575
120722,Ishmar,Sheffield,M,32460,Corp. Comm. Specialist I,US,1360,10866
120723,Deanna,Olsen,,33950,Corp. Comm. Specialist II,US,-2335,6575
120724,Hampie,Brown,M,63705,Marketing Manager,US,2948,13240
120725,Robert,Whitlock,M,29970,Marketing Assistant II,US,8697,17684
120726,Lutezenia,Obermeyer,F,27380,Marketing Assistant I,US,11870,18506
120727,Donald,Marples,M,34925,Marketing Assistant IV,US,3098,11109
120728,Kathryn,Borge,F,35070,Purchasing Agent II,US,-393,9497
120729,Kimberly,Howell,F,31495,Purchasing Agent I,US,11781,17281
120730,Woodson,Burt,M,30195,Purchasing Agent I,US,3272,11962
120731,Robert,Lerew,M,34150,Purchasing Agent II,US,1169,10105
120732,Kent,Uenking,M,35870,Purchasing Agent III,US,-2331,6575
120733,Michael,Bezinque,M,31760,Purchasing Agent I,US,3015,12723
120734,Svein,Saylor,M,34270,Purchasing Agent III,US,8516,18322
120735,Brenda,Bilobran,F,61985,Purchasing Manager,US,-567,8156
120736,Parie,Kiemle,F,63985,Purchasing Manager,US,3253,13057
120737,Brenner,Toner,F,63605,Purchasing Manager,US,1182,11993
120738,Huilun,Swaiti,F,30025,Purchasing Agent I,US,-2370,6575
120739,Bryon,Cooper,M,36970,Purchasing Agent III,US,11176,18383
120740,Lisa,Koonce,F,35110,Purchasing Agent II,US,-2265,6575
120741,Keisha,Court,F,36365,Purchasing Agent III,US,-4051,6575
120742,Ronald,Shewitz,M,31020,Purchasing Agent I,US,-4349,6575
120743,Chimena,Harrison,F,34620,Purchasing Agent II,US,4780,15127
120744,Alden,Feigenbaum,F,33490,Purchasing Agent II,US,11858,17714
120745,Barbara,Harvill,F,31365,Purchasing Agent I,US,11143,18414
120746,Kevie,Kimmerle,M,46090,Account Manager,US,6857,16892
120747,Zashia,Farthing,F,43590,Financial Controller I,us,6745,14457
120748,Nahliah,Post,F,48380,Building Admin. Manager,US,7491,17226
120749,Kevin,Niemann,M,26545,Office Assistant II,US,6837,14884
120750,Connie,Woods,F,32675,Accountant I,US,-573,8432
120751,Azavi0us,Mea,M,58200,Finance Manager,US,3017,11901
120752,Jean-Claude,Van Damme,M,30590,Accountant I,US,-683,7152
120753,Ralph,Ferrari,M,47000,Financial Controller II,US,7471,14092
120754,John,Atkins,M,34760,Accountant II,US,11841,18383
120755,Elizabeth,Thoits,F,36440,Accountant III,US,3158,10074
120756,Wendy,Asta,F,52295,Financial Controller III,US,6625,14792
120757,Paul,Knopfmacher,M,38545,Accountant III,US,-4306,6575
120758,Sal,Voltz,M,34040,Accountant II,US,3217,13423
120759,Nishan,Apr,M,36230,Accountant II,US,3230,9862
120760,Pamela,Miller,F,53475,Financial Controller III,US,4754,13635
120761,Tameaka,Akinfolarin,F,30960,Accountant I,US,11319,18444
120762,Marvin,Leone,M,30625,Accountant I,US,8706,18322
120763,Ramond,Capps,M,45100,Auditor II,US,-4084,6575
120764,Steven,Worton,M,40450,Auditor I,US,6930,17136
120765,Nikeisha,Kokoszka,F,51950,Financial Controller III,US,-380,6575
120766,Janelle,Kempster,F,53400,Auditing Manager,US,6883,16496
120767,Legette,Terricciano,M,32965,Accountant I,US,3051,11413
120768,Roland,Rayburn,M,44955,Accountant II,US,-528,9405
120769,Abelino,Lightbourne,M,47990,Auditor II,US,6718,14701
120770,Julia,Pascoe,F,43930,Auditor I,US,3036,11413
120771,Wei,Xing Moore,F,36435,Accountant II,US,-515,7640
120772,Erich,Overdorff,M,27365,HR Generalist I,US,11786,18475
120773,Entrisse,Horne,F,27370,HR Generalist II,US,1148,9222
120774,Sue,El-Amin,F,45155,HR Specialist II,US,8295,16861
120775,Tanya,Thompson,F,41580,HR Analyst II,US,4790,14915
120776,Ratna,Silverthorne,M,32580,HR Generalist III,US,8664,16527
120777,Kary,Sacher,M,40955,HR Specialist I,US,4833,14000
120778,Angela,Gardner,F,43650,HR Specialist I,US,-389,10258
120779,Jennifer,Eggleston,F,43690,HR Analyst II,US,7582,15035
120780,Kimberly,Walcott,F,62995,HR Manager,US,4992,13057
120781,Sarah,Sitnik,F,32620,Recruiter I,US,11710,17867
120782,Rilma,Sines,F,63915,Recruitment Manager,US,6907,15857
120783,Davis,Karp,M,42975,Recruiter III,US,6928,14610
120784,Jennifer,Pinol,F,35715,Recruiter II,US,8514,17776
120785,Damesha,Donnell,F,48335,Training Manager,US,4769,13666
120786,Chris-Anne,Delafuente,F,32650,Trainer I,US,-4306,6575
120787,Carl,Peachey,M,34000,Trainer II,US,4982,14610
120788,Smitty,Lisowe,M,33530,Trainer I,US,4912,14214
120789,Julius,Denhollem,M,39330,Trainer III,US,3117,9831
120790,Tara,O'Toole,F,53740,ETL Specialist II,US,6915,14365
120791,Richard,Chiseloff,M,61115,Systems Architect IV,US,3129,11231
120792,Omeba,Horne,F,54760,Systems Architect II,US,7383,15188
120793,William,Mamo,M,47155,ETL Specialist I,US,4968,14762
120794,Samantha,Cross,F,51265,Applications Developer IV,US,8400,17348
120795,David,Deacon,M,49105,Applications Developer II,US,4764,11901
120796,Philip,Kellis,M,47030,Applications Developer II,US,-599,9921
120797,Sherrie,Jones,F,43385,Applications Developer I,US,-410,8005
120798,Elizabeth,Ardskin,F,80755,Senior Project Manager,US,1269,11323
120799,Jeffery,Stefandonovan,M,29070,Office Assistant III,US,8482,15645
120800,Fred,Benyami,M,80210,IS Director,US,6928,15127
120801,Kathryn,Kennedy,F,40040,Applications Developer I,US,6639,15887
120802,U'Vonda,Parker,F,65125,Applications Developer IV,US,-2426,8036
120803,Victor,Droste,M,43630,Applications Developer I,US,-574,8036
120804,Ahmed,Zied,M,55400,IS Administrator III,US,-4342,6575
120805,Robert,Walker,M,58530,BI Administrator IV,US,8213,16162
120806,Lorna,Ousley,F,47285,IS Administrator II,US,6630,13180
120807,Gerlinde,Peppers,F,43325,IS Administrator I,US,1443,9497
120808,Marcel,Dupree,M,44425,BI Specialist II,US,3074,10379
120809,Chiorene,Marion,F,47155,BI Architect II,US,-4370,6575
120810,Loyal,Esguerra,M,58375,IS Architect III,US,-454,8826
120811,Dale,Bergeron-Jeter,M,43985,Applications Developer I,US,5017,13696
120812,Fauver,Arruza,M,45810,Applications Developer II,US,6624,16649
120813,John,Heinsler,M,50865,Applications Developer IV,US,5005,13515
120814,Victor,Scroggin,M,59140,Project Manager,US,1249,8644
120815,Craig,Honore,M,31590,Service Administrator III,US,12049,18353
120816,Tessia,Hart,F,30485,Service Administrator I,US,4871,13727
120992,Lisa,Kicak,F,26940,Office Assistant I,US,8448,16284
120993,Lorraine,Boatright,F,26260,Office Assistant I,US,5100,15035
120994,Danelle,Sergeant,F,31645,Office Administrator I,us,6741,14184
120995,Lily-Ann,Gordo,F,34850,Office Administrator II,US,10391,18475
120996,Johannes,Wade,M,32745,Office Assistant IV,US,6776,17045
120997,Mary,Donathan,F,27420,Shipping Administrator I,us,6899,14854
120998,Tondelayo,Benedicto,F,26330,Clerk I,US,8740,17988
120999,Sherelyn,Heilmann,F,27215,Clerk I,US,1457,10318
121000,Herman,Supple,M,48600,Administration Manager,US,2946,13849
121001,Tony,House,M,43615,Warehouse Manager,US,1116,7914
121002,Terry-Ann,Clark,F,26650,Warehouse Assistant II,US,-470,8735
121003,Troyce Van,Der Wiele,M,26000,Warehouse Assistant I,US,11813,18444
121004,Kellen,Smith,M,30895,Security Manager,US,-4168,6575
121005,Yuh-Lang,Mclamb,M,25020,Security Guard I,US,10423,17563
121006,Bernard,Bolster,M,26145,Security Guard I,US,11242,17837
121007,John,Banaszak,M,27290,Security Guard II,US,3207,11354
121008,Eron,Mckenzie,M,27875,Security Guard II,US,4932,13727
121009,Robert,Goodwin,M,32955,Service Administrator I,US,8738,15918
121010,Donald,Lamp,M,25195,Service Assistant I,US,10453,18322
121011,Steven,Banchi,M,25735,Service Assistant I,US,-4313,4383
121012,Carmelo,Broome,M,29575,Service Assistant II,US,10983,17410
121013,Seco,Hargrave,M,26675,Electrician II,US,8518,16162
121014,Donelle,Liguori,F,28510,Electrician III,US,6695,15918
121015,Wilson,Elmoslamy,M,26140,Technician I,US,8747,16315
121016,Lutezenia,Sullivan,F,48075,Technical Manager,US,7323,17776
121017,Gilbert,Arizmendi,M,29225,Technician II,US,10232,17957
121125,Michael,Holt,M,25315,Trainee,US,6681,17167
121126,James,Penhale,M,26015,Trainee,US,-432,17167
121127,Keyna,Mangini,F,25435,Trainee,US,11203,18049
121128,Glacia,Nazar,F,25405,Trainee,US,6751,17167
121129,Yusef,Hafley,M,30945,Trainee,US,3043,17167
121130,Gary,Herndon,M,25255,Trainee,US,10247,17563
121131,William,Pantages,M,25445,Trainee,US,4929,17167
121132,Shia-Ling,Digiorgio,M,24390,Trainee,US,-692,17167
121133,Peter,Pringley,M,25405,Trainee,US,8714,17167
121134,Paul,Tacosa,M,25585,Trainee,US,3105,17167
121141,Henri Le,Bleu,M,194885,Vice President,US,-4213,6575
121142,Reginald,Steiber,M,156065,Director,US,4793,13635
121146,Julieanne,Sangiorgio,F,29320,Secretary III,US,11300,18353
121147,Christine,Sneed,F,29145,Secretary II,US,4896,11566
121148,Shane,Sadig,M,52930,Business Analyst II,US,4749,15341
;;;;
run;

data ORION.NONSALES2;
   attrib Employee_ID length=8 format=12.;
   attrib First length=$12;
   attrib Last length=$18;
   attrib Gender length=$1;
   attrib Salary length=8;
   attrib Job_Title length=$25;
   attrib Country length=$2;

   infile datalines dsd;
   input
      Employee_ID
      First
      Last
      Gender
      Salary
      Job_Title
      Country
   ;
datalines4;
120101,Patrick,Lu,M,163040,Director,AU
120104,Kareen,Billington,F,46230,Administration Manager,au
120105,Liz,Povey,F,27110,Secretary I,AU
120106,John,Hornsey,M,,Office Assistant II,AU
120107,Sherie,Sheedy,F,30475,Office Assistant III,AU
120108,Gladys,Gromek,F,27660,Warehouse Assistant II,AU
120108,Gabriele,Baker,F,26495,Warehouse Assistant I,AU
120110,Dennis,Entwisle,M,28615,Warehouse Assistant III,AU
120111,Ubaldo,Spillane,M,26895,Security Guard II,AU
120112,Ellis,Glattback,F,26550,,AU
120113,Riu,Horsey,F,26870,Security Guard II,AU
120114,Jeannette,Buddery,G,31285,Security Manager,AU
120115,Hugh,Nichollas,M,2650,Service Assistant I,AU
,Austen,Ralston,M,29250,Service Assistant II,AU
120117,Bill,Mccleary,M,31670,Cabinet Maker III,AU
120118,Darshi,Hartshorn,M,28090,Cabinet Maker II,AU
120119,Lal,Elleman,M,30255,Electrician IV,AU
120120,Krishna,Peiris,F,27645,Electrician II,AU
120190,Ivor,Czernezkyi,M,24100,Trainee,AU
120191,Jannene,Graham-Rowe,F,2401,Trainee,AU
120192,Anthony,Nichollas,M,26185,Trainee,AU
120193,Russell,Streit,M,24515,Trainee,AU
120194,Reece,Harwood,M,25985,Trainee,AU
120195,Jina,Fiocca,F,24990,Trainee,AU
120196,Merle,Hieds,F,24025,Trainee,AU
120197,Kerrin,Dillin,F,25580,Trainee,AU
120259,Anthony,Miller,M,433800,Chief Executive Officer,US
120260,Christine,Fletcher,F,207885,Chief Marketing Officer,US
120262,Max,Crown,M,268455,Chief Financial Officer,US
120263,Bobby,Cleverley,M,42605,Financial Analyst III,US
120264,Latonya,Croome,F,37510,Financial Analyst II,US
120265,Wanda,Branly,F,51950,Auditor III,US
120266,Bao,Krafve,F,31750,Secretary IV,US
120267,Belanda,Rink,F,28585,Secretary III,US
120268,Jacques,Villeneuve,M,76105,Senior Strategist,US
120269,Shrimatee,Kagolanu,F,52540,Strategist II,US
120270,Grezegorz,Nuss,M,48435,Concession Director,US
120271,Kenisha,Winge,F,43635,Concession Manager,US
120272,Febin,Flow,M,34390,Concession Consultant II,US
120273,Doris,Antonini,F,28455,Concession Assistant III,US
120274,Angela,Landry,F,26840,Concession Assistant I,US
120275,Brandy,Lattimer,F,32195,Concession Consultant II,US
120276,Nicholas,Plybon,M,28090,Concession Assistant II,US
120277,Wesley,Shirts,F,32645,Concession Consultant I,US
120278,Binit,Jongleux,M,27685,Concession Assistant III,US
120279,Kareema,Dunlap,F,32925,Concession Consultant I,US
120280,Jaime,Laurer,F,36930,Concession Consultant III,US
120656,Salley,Amos,F,42570,Logistics Coordinator II,US
120657,Theresa,Weisbarth,F,36110,Logistics Coordinator I,US
120658,Kenneth,Kennedy,M,42485,Logistics Coordinator II,US
120659,Jay,Havasy,M,161290,Director,US
120660,Robert,Smith,M,61125,Logistics Manager,US
120661,Cynthia,Racine,F,85495,Senior Logistics Manager,US
120662,Lemonica,Burroughs,M,27045,Secretary II,US
120663,Anglar,Kornblith,F,56385,Pricing Manager,US
120664,Brock,Senchak,M,47605,Pricing Specialist,US
120665,Jill,Leacock,F,80070,Senior Logistics Manager,US
120666,John,Onuscheck,M,64555,Logistics Manager,US
120667,Edwin,Droste,M,29980,Office Assistant III,US
120668,Thyland,Dolan,M,47785,Services Manager,US
120669,Ronald,Hill,M,36370,Services Assistant IV,US
120670,Odudu,Zisek,M,65420,Shipping Manager,US
120671,William,Latty,M,40080,Shipping Agent III,US
120672,Verne,Guscott,M,60980,Shipping Manager,AU
120673,Pearl,Santomaggio,F,35935,Shipping Agent II,AU
120677,Suad,Sochacki,F,65555,Shipping Manager,US
120678,Lucretta,Octetree,F,40035,Shipping Agent III,US
120679,Chrisy,Cutucache,F,46190,Shipping Manager,US
120680,Raymondria,Desaulniers,F,27295,Shipping Agent I,US
120681,Elery,Tolbet,M,30950,Shipping Agent II,US
120682,Barbara,Kennedy,F,26760,Shipping Agent I,US
120683,Deven,Kochneff,F,36315,Shipping Agent III,US
120684,Suzon,Woyach,F,26960,Warehouse Assistant I,US
120685,Anita,Howard,F,25130,Warehouse Assistant I,US
120686,Berether,Tucker,F,26690,Warehouse Assistant II,US
120687,Freda,Dannin,F,26800,Warehouse Assistant I,US
120688,Lisa,Carcaterra,F,25905,Warehouse Assistant I,US
120689,Katherine,Pongor,F,27780,Warehouse Assistant III,US
120690,Taronda,Langston,F,25185,Warehouse Assistant I,US
120691,Sek,Habres,M,49240,Shipping Manager,AU
120692,Rit,Tregonning,M,32485,Shipping Agent II,AU
120693,Diaz,Tellam,M,26625,Shipping Agent I,AU
120694,Sharon,Leazer,F,27365,Warehouse Assistant I,AU
120695,Trent,Moffat,M,28180,Warehouse Assistant II,au
120696,Peter,Pettolino,M,26615,Warehouse Assistant I,AU
120697,Madelaine,Fouche,F,29625,Warehouse Assistant IV,AU
120698,Geoff,Kistanna,M,26160,Warehouse Assistant I,au
120710,Timothy,Baltzell,M,54840,Business Analyst II,US
120711,Gloria,Drew,F,59130,Business Analyst III,US
120712,Elisabeth,Motashaw,F,63640,Marketing Manager,US
120713,Carston,Campbell,M,31630,Marketing Assistant III,US
120714,Robert,Dinley,M,62625,Marketing Manager,US
120715,Angelia,Neal,F,28535,Marketing Assistant II,US
120716,Kenneth,Juif,M,53015,Events Manager,US
120717,Jon,Sleva,M,30155,Marketing Assistant II,US
120718,Charles,Hennington,M,29190,Marketing Assistant II,US
120719,Roya,Ridley,F,87420,Senior Marketing Manager,US
120720,John,Spingola,M,46580,Corp. Comm. Manager,US
120721,Dlutomi,Knust,F,29870,Marketing Assistant II,US
120722,Ishmar,Sheffield,M,32460,Corp. Comm. Specialist I,US
120723,Deanna,Olsen,,33950,Corp. Comm. Specialist II,US
120724,Hampie,Brown,M,63705,Marketing Manager,US
120725,Robert,Whitlock,M,29970,Marketing Assistant II,US
120726,Lutezenia,Obermeyer,F,27380,Marketing Assistant I,US
120727,Donald,Marples,M,34925,Marketing Assistant IV,US
120728,Kathryn,Borge,F,35070,Purchasing Agent II,US
120729,Kimberly,Howell,F,31495,Purchasing Agent I,US
120730,Woodson,Burt,M,30195,Purchasing Agent I,US
120731,Robert,Lerew,M,34150,Purchasing Agent II,US
120732,Kent,Uenking,M,35870,Purchasing Agent III,US
120733,Michael,Bezinque,M,31760,Purchasing Agent I,US
120734,Svein,Saylor,M,34270,Purchasing Agent III,US
120735,Brenda,Bilobran,F,61985,Purchasing Manager,US
120736,Parie,Kiemle,F,63985,Purchasing Manager,US
120737,Brenner,Toner,F,63605,Purchasing Manager,US
120738,Huilun,Swaiti,F,30025,Purchasing Agent I,US
120739,Bryon,Cooper,M,36970,Purchasing Agent III,US
120740,Lisa,Koonce,F,35110,Purchasing Agent II,US
120741,Keisha,Court,F,36365,Purchasing Agent III,US
120742,Ronald,Shewitz,M,31020,Purchasing Agent I,US
120743,Chimena,Harrison,F,34620,Purchasing Agent II,US
120744,Alden,Feigenbaum,F,33490,Purchasing Agent II,US
120745,Barbara,Harvill,F,31365,Purchasing Agent I,US
120746,Kevie,Kimmerle,M,46090,Account Manager,US
120747,Zashia,Farthing,F,43590,Financial Controller I,us
120748,Nahliah,Post,F,48380,Building Admin. Manager,US
120749,Kevin,Niemann,M,26545,Office Assistant II,US
120750,Connie,Woods,F,32675,Accountant I,US
120751,Azavi0us,Mea,M,58200,Finance Manager,US
120752,Jean-Claude,Van Damme,M,30590,Accountant I,US
120753,Ralph,Ferrari,M,47000,Financial Controller II,US
120754,John,Atkins,M,34760,Accountant II,US
120755,Elizabeth,Thoits,F,36440,Accountant III,US
120756,Wendy,Asta,F,52295,Financial Controller III,US
120757,Paul,Knopfmacher,M,38545,Accountant III,US
120758,Sal,Voltz,M,34040,Accountant II,US
120759,Nishan,Apr,M,36230,Accountant II,US
120760,Pamela,Miller,F,53475,Financial Controller III,US
120761,Tameaka,Akinfolarin,F,30960,Accountant I,US
120762,Marvin,Leone,M,30625,Accountant I,US
120763,Ramond,Capps,M,45100,Auditor II,US
120764,Steven,Worton,M,40450,Auditor I,US
120765,Nikeisha,Kokoszka,F,51950,Financial Controller III,US
120766,Janelle,Kempster,F,53400,Auditing Manager,US
120767,Legette,Terricciano,M,32965,Accountant I,US
120768,Roland,Rayburn,M,44955,Accountant II,US
120769,Abelino,Lightbourne,M,47990,Auditor II,US
120770,Julia,Pascoe,F,43930,Auditor I,US
120771,Wei,Xing Moore,F,36435,Accountant II,US
120772,Erich,Overdorff,M,27365,HR Generalist I,US
120773,Entrisse,Horne,F,27370,HR Generalist II,US
120774,Sue,El-Amin,F,45155,HR Specialist II,US
120775,Tanya,Thompson,F,41580,HR Analyst II,US
120776,Ratna,Silverthorne,M,32580,HR Generalist III,US
120777,Kary,Sacher,M,40955,HR Specialist I,US
120778,Angela,Gardner,F,43650,HR Specialist I,US
120779,Jennifer,Eggleston,F,43690,HR Analyst II,US
120780,Kimberly,Walcott,F,62995,HR Manager,US
120781,Sarah,Sitnik,F,32620,Recruiter I,US
120782,Rilma,Sines,F,63915,Recruitment Manager,US
120783,Davis,Karp,M,42975,Recruiter III,US
120784,Jennifer,Pinol,F,35715,Recruiter II,US
120785,Damesha,Donnell,F,48335,Training Manager,US
120786,Chris-Anne,Delafuente,F,32650,Trainer I,US
120787,Carl,Peachey,M,34000,Trainer II,US
120788,Smitty,Lisowe,M,33530,Trainer I,US
120789,Julius,Denhollem,M,39330,Trainer III,US
120790,Tara,O'Toole,F,53740,ETL Specialist II,US
120791,Richard,Chiseloff,M,61115,Systems Architect IV,US
120792,Omeba,Horne,F,54760,Systems Architect II,US
120793,William,Mamo,M,47155,ETL Specialist I,US
120794,Samantha,Cross,F,51265,Applications Developer IV,US
120795,David,Deacon,M,49105,Applications Developer II,US
120796,Philip,Kellis,M,47030,Applications Developer II,US
120797,Sherrie,Jones,F,43385,Applications Developer I,US
120798,Elizabeth,Ardskin,F,80755,Senior Project Manager,US
120799,Jeffery,Stefandonovan,M,29070,Office Assistant III,US
120800,Fred,Benyami,M,80210,IS Director,US
120801,Kathryn,Kennedy,F,40040,Applications Developer I,US
120802,U'Vonda,Parker,F,65125,Applications Developer IV,US
120803,Victor,Droste,M,43630,Applications Developer I,US
120804,Ahmed,Zied,M,55400,IS Administrator III,US
120805,Robert,Walker,M,58530,BI Administrator IV,US
120806,Lorna,Ousley,F,47285,IS Administrator II,US
120807,Gerlinde,Peppers,F,43325,IS Administrator I,US
120808,Marcel,Dupree,M,44425,BI Specialist II,US
120809,Chiorene,Marion,F,47155,BI Architect II,US
120810,Loyal,Esguerra,M,58375,IS Architect III,US
120811,Dale,Bergeron-Jeter,M,43985,Applications Developer I,US
120812,Fauver,Arruza,M,45810,Applications Developer II,US
120813,John,Heinsler,M,50865,Applications Developer IV,US
120814,Victor,Scroggin,M,59140,Project Manager,US
120815,Craig,Honore,M,31590,Service Administrator III,US
120816,Tessia,Hart,F,30485,Service Administrator I,US
120992,Lisa,Kicak,F,26940,Office Assistant I,US
120993,Lorraine,Boatright,F,26260,Office Assistant I,US
120994,Danelle,Sergeant,F,31645,Office Administrator I,us
120995,Lily-Ann,Gordo,F,34850,Office Administrator II,US
120996,Johannes,Wade,M,32745,Office Assistant IV,US
120997,Mary,Donathan,F,27420,Shipping Administrator I,us
120998,Tondelayo,Benedicto,F,26330,Clerk I,US
120999,Sherelyn,Heilmann,F,27215,Clerk I,US
121000,Herman,Supple,M,48600,Administration Manager,US
121001,Tony,House,M,43615,Warehouse Manager,US
121002,Terry-Ann,Clark,F,26650,Warehouse Assistant II,US
121003,Troyce Van,Der Wiele,M,26000,Warehouse Assistant I,US
121004,Kellen,Smith,M,30895,Security Manager,US
121005,Yuh-Lang,Mclamb,M,25020,Security Guard I,US
121006,Bernard,Bolster,M,26145,Security Guard I,US
121007,John,Banaszak,M,27290,Security Guard II,US
121008,Eron,Mckenzie,M,27875,Security Guard II,US
121009,Robert,Goodwin,M,32955,Service Administrator I,US
121010,Donald,Lamp,M,25195,Service Assistant I,US
121011,Steven,Banchi,M,25735,Service Assistant I,US
121012,Carmelo,Broome,M,29575,Service Assistant II,US
121013,Seco,Hargrave,M,26675,Electrician II,US
121014,Donelle,Liguori,F,28510,Electrician III,US
121015,Wilson,Elmoslamy,M,26140,Technician I,US
121016,Lutezenia,Sullivan,F,48075,Technical Manager,US
121017,Gilbert,Arizmendi,M,29225,Technician II,US
121125,Michael,Holt,M,25315,Trainee,US
121126,James,Penhale,M,26015,Trainee,US
121127,Keyna,Mangini,F,25435,Trainee,US
121128,Glacia,Nazar,F,25405,Trainee,US
121129,Yusef,Hafley,M,30945,Trainee,US
121130,Gary,Herndon,M,25255,Trainee,US
121131,William,Pantages,M,25445,Trainee,US
121132,Shia-Ling,Digiorgio,M,24390,Trainee,US
121133,Peter,Pringley,M,25405,Trainee,US
121134,Paul,Tacosa,M,25585,Trainee,US
121141,Henri Le,Bleu,M,194885,Vice President,US
121142,Reginald,Steiber,M,156065,Director,US
121146,Julieanne,Sangiorgio,F,29320,Secretary III,US
121147,Christine,Sneed,F,29145,Secretary II,US
121148,Shane,Sadig,M,52930,Business Analyst II,US
;;;;
run;

data ORION.OLDBUDGET;
   attrib Month length=8;
   attrib Yr2003 length=8 format=DOLLAR10.;
   attrib Yr2004 length=8 format=DOLLAR10.;
   attrib Yr2005 length=8 format=DOLLAR10.;
   attrib Yr2006 length=8 format=DOLLAR10.;
   attrib Yr2007 length=8 format=DOLLAR10.;

   infile datalines dsd;
   input
      Month
      Yr2003
      Yr2004
      Yr2005
      Yr2006
      Yr2007
   ;
datalines4;
1,1590000,1880000,2300000,1960000,1970000
2,1290000,1550000,1830000,1480000,1640000
3,1160000,1380000,1640000,1410000,1440000
4,1710000,2100000,2420000,2130000,2270000
5,1990000,2350000,2840000,2480000,2670000
6,2560000,3020000,3580000,3070000,3410000
7,2590000,2890000,3550000,3010000,3490000
8,2550000,2840000,3580000,3030000,3500000
9,1070000,1180000,1550000,1260000,1520000
10,1160000,1270000,1600000,1360000,1700000
11,1260000,1470000,1780000,1540000,1950000
12,2870000,3120000,3760000,3210000,4370000
;;;;
run;

data ORION.ORDERS;
   attrib Order_ID length=8 label='Order ID' format=12.;
   attrib Order_Type length=8 label='Order Type';
   attrib Employee_ID length=8 label='Employee ID' format=12.;
   attrib Customer_ID length=8 label='Customer ID' format=12.;
   attrib Order_Date length=8 label='Date Order was placed by Customer' format=DATE9.;
   attrib Delivery_Date length=8 label='Date Order was Delivered' format=DATE9.;

   infile datalines dsd;
   input
      Order_ID
      Order_Type
      Employee_ID
      Customer_ID
      Order_Date
      Delivery_Date
   ;
datalines4;
1230058123,1,121039,63,17177,17177
1230080101,2,99999999,5,17181,17185
1230106883,2,99999999,45,17186,17188
1230147441,1,120174,41,17194,17194
1230315085,1,120134,183,17224,17224
1230333319,2,99999999,79,17227,17228
1230338566,2,99999999,23,17228,17233
1230371142,2,99999999,45,17234,17236
1230404278,1,121059,56,17240,17240
1230440481,1,120149,183,17247,17247
1230450371,2,99999999,16,17249,17251
1230453723,2,99999999,79,17249,17250
1230455630,1,120134,183,17250,17250
1230478006,2,99999999,2788,17253,17255
1230498538,1,121066,20,17257,17257
1230500669,3,99999999,70046,17258,17259
1230503155,2,99999999,12386,17258,17259
1230591673,2,99999999,23,17274,17279
1230591675,3,99999999,36,17274,17276
1230591684,1,121045,79,17274,17274
1230619748,2,99999999,61,17280,17285
1230642273,2,99999999,13,17284,17289
1230657844,3,99999999,171,17287,17290
1230690733,3,99999999,11171,17293,17295
1230699509,2,99999999,14703,17294,17297
1230700421,2,99999999,79,17294,17295
1230738723,2,99999999,928,17301,17305
1230744524,2,99999999,19444,17302,17307
1230745294,1,121060,71,17302,17302
1230754828,1,121039,12,17304,17304
1230771337,2,99999999,544,17307,17308
1230778996,1,120148,111,17309,17309
1230793366,2,99999999,88,17311,17314
1230804171,2,99999999,23,17313,17318
1230825762,1,121064,71,17317,17317
1230841456,2,99999999,23,17320,17325
1230841466,1,121094,75,17320,17320
1230885738,1,121043,56,17328,17328
1230912536,1,121086,18,17333,17333
1230931366,3,99999999,17023,17337,17342
1231002241,3,99999999,171,17350,17353
1231008713,2,99999999,70108,17351,17352
1231014780,2,99999999,2806,17351,17355
1231023774,1,120145,215,17354,17354
1231035308,2,99999999,13,17356,17361
1231071449,3,99999999,36,17362,17364
1231077006,1,121064,12,17363,17363
1231094514,2,99999999,61,17367,17372
1231135703,1,121027,79,17374,17374
1231169108,1,121059,31,17380,17380
1231176288,1,120164,215,17382,17382
1231188317,2,99999999,111,17384,17386
1231194004,3,99999999,3959,17384,17385
1231204878,1,120732,71,17386,17386
1231206746,1,120134,215,17387,17387
1231227910,2,99999999,70187,17391,17396
1231231220,1,121040,20,17391,17391
1231259703,1,121045,45,17396,17396
1231270767,3,99999999,52,17398,17404
1231292064,1,121037,12,17402,17402
1231305521,2,99999999,16,17405,17413
1231305531,2,99999999,16,17405,17407
1231314893,1,121109,20,17406,17406
1231316727,2,99999999,2806,17406,17410
1231317443,2,99999999,61,17407,17412
1231341359,1,121057,71,17411,17411
1231392762,3,99999999,36,17420,17422
1231414059,3,99999999,36,17424,17426
1231453831,3,99999999,70046,17432,17433
1231468750,1,121044,52,17434,17439
1231500373,2,99999999,19444,17440,17445
1231501254,1,121043,88,17440,17440
1231522431,3,99999999,52,17444,17450
1231544990,2,99999999,14703,17448,17451
1231614059,2,99999999,70108,17461,17462
1231619928,2,99999999,61,17462,17467
1231653765,3,99999999,11,17468,17473
1231657078,1,121061,63,17468,17472
1231663230,1,121025,5,17469,17469
1231734609,2,99999999,544,17482,17483
1231734615,3,99999999,1033,17482,17486
1231757107,1,121037,17,17486,17486
1231773634,2,99999999,14703,17489,17492
1231780610,1,121025,71,17490,17490
1231842118,2,99999999,5,17501,17503
1231858937,1,121060,45,17504,17504
1231861295,2,99999999,70187,17505,17510
1231891098,1,121043,71,17510,17510
1231896710,1,120733,88,17511,17511
1231898348,1,120127,183,17512,17512
1231908237,1,120132,215,17514,17514
1231928627,1,121020,17,17517,17517
1231930216,1,120127,111,17518,17518
1231936241,1,120127,111,17519,17519
1231950921,2,99999999,5,17521,17523
1231952752,2,99999999,111,17522,17524
1231953192,3,99999999,70210,17522,17523
1231956902,1,121037,5,17522,17522
1231976710,3,99999999,19,17526,17530
1231982684,1,120158,183,17527,17527
1231986335,1,120148,195,17528,17528
1232003930,3,99999999,70046,17531,17532
1232007693,2,99999999,5,17531,17535
1232007700,1,121066,45,17531,17531
1232087464,1,120143,53,17544,17544
1232092527,1,121039,49,17544,17544
1232161564,1,121040,34,17554,17554
1232173841,3,99999999,2618,17556,17561
1232217725,2,99999999,89,17563,17566
1232240447,1,120150,195,17567,17567
1232241009,3,99999999,70046,17567,17568
1232307056,1,120148,171,17577,17577
1232311932,1,121039,20,17577,17577
1232331499,2,99999999,23,17580,17584
1232373481,2,99999999,13,17587,17590
1232410925,3,99999999,4,17593,17594
1232455720,1,121100,4,17600,17600
1232517885,3,99999999,70201,17610,17615
1232530384,3,99999999,4,17611,17612
1232530393,1,121037,49,17611,17611
1232554759,1,121068,92,17615,17615
1232590052,1,120160,195,17621,17621
1232601472,2,99999999,89,17622,17625
1232618023,2,99999999,54655,17625,17628
1232648239,1,121031,49,17629,17637
1232654929,3,99999999,4,17630,17631
1232672914,3,99999999,11171,17633,17635
1232698281,3,99999999,9,17637,17642
1232709099,1,121041,4,17638,17638
1232709115,1,121105,34,17638,17638
1232723799,3,99999999,41,17641,17645
1232728634,2,99999999,5,17641,17645
1232777080,1,120151,215,17649,17649
1232790793,1,120143,195,17651,17651
1232857157,2,99999999,45,17660,17664
1232889267,2,99999999,908,17665,17669
1232897220,1,121021,34,17666,17666
1232936635,2,99999999,544,17672,17673
1232946301,2,99999999,111,17674,17676
1232956741,3,99999999,52,17675,17676
1232972274,1,120145,171,17678,17678
1232985693,1,120122,183,17680,17680
1232998740,1,121109,4,17681,17681
1233003688,1,121025,34,17682,17682
1233049735,3,99999999,14104,17689,17692
1233066745,1,120148,215,17692,17692
1233078086,1,121060,49,17693,17693
1233092596,1,121054,12,17695,17695
1233131266,1,121084,45,17701,17701
1233166411,1,120121,171,17707,17707
1233167161,2,99999999,70187,17707,17712
1233243603,1,121109,49,17718,17718
1233248920,2,99999999,19444,17719,17724
1233270605,1,121029,75,17722,17722
1233280857,3,99999999,70059,17724,17728
1233315988,1,121053,5,17729,17729
1233378724,2,99999999,13,17739,17742
1233482761,1,121105,34,17754,17754
1233484749,3,99999999,2550,17754,17759
1233514453,3,99999999,70201,17759,17764
1233531965,1,120123,215,17762,17762
1233543560,3,99999999,4,17763,17764
1233545775,1,120134,41,17764,17764
1233545781,1,120150,215,17764,17764
1233597637,2,99999999,89,17771,17774
1233618453,1,120177,215,17775,17775
1233682051,2,99999999,5,17784,17788
1233689304,1,121053,49,17785,17785
1233837302,1,120148,195,17808,17808
1233895201,2,99999999,111,17817,17819
1233913196,2,99999999,544,17819,17820
1233920786,1,121030,34,17820,17820
1233920795,1,121135,52,17820,17820
1233920805,1,121064,52,17820,17820
1233998114,2,99999999,19873,17832,17839
1234033037,1,121039,92,17837,17837
1234092222,1,121069,75,17846,17846
1234133789,1,120123,195,17853,17853
1234186330,1,120121,53,17861,17861
1234198497,1,121035,49,17862,17862
1234235150,2,99999999,54655,17868,17871
1234247283,1,121042,49,17869,17869
1234255111,1,121135,17,17870,17870
1234279341,2,99999999,23,17874,17878
1234301319,1,121109,92,17877,17877
1234323012,3,99999999,70210,17881,17882
1234348668,1,121069,4,17884,17884
1234360543,1,121071,17,17886,17886
1234373539,1,121069,12,17888,17888
1234414529,1,120123,111,17895,17895
1234419240,1,121109,17,17895,17895
1234437760,1,120150,195,17899,17899
1234534069,3,99999999,36,17908,17911
1234537441,1,120121,183,17909,17909
1234538390,2,99999999,16,17909,17911
1234588648,2,99999999,16,17914,17916
1234659163,2,99999999,16,17921,17923
1234665265,2,99999999,63,17921,17922
1234709803,3,99999999,171,17926,17930
1234727966,1,120179,183,17928,17928
1234891576,3,99999999,70221,17944,17946
1234897732,1,121021,18,17944,17944
1234958242,2,99999999,24,17950,17955
1234972570,2,99999999,16,17952,17954
1235176942,3,99999999,11171,17971,17973
1235236723,1,120160,215,17977,17977
1235275513,1,121043,89,17980,17980
1235306679,1,120122,111,17984,17984
1235384426,1,121109,63,17991,17991
1235591214,2,99999999,16,18012,18014
1235611754,2,99999999,16,18014,18016
1235744141,2,99999999,16,18027,18029
1235830338,2,99999999,24,18035,18041
1235856852,1,120127,171,18038,18038
1235881915,3,99999999,36,18040,18043
1235913793,1,121040,49,18043,18043
1235926178,3,99999999,79,18044,18051
1235963427,2,99999999,12386,18048,18049
1236017640,1,120127,183,18054,18054
1236028541,3,99999999,9,18055,18060
1236055696,1,121136,10,18057,18057
1236066649,2,99999999,908,18058,18062
1236113431,3,99999999,36,18063,18066
1236128445,2,99999999,26148,18065,18067
1236128456,2,99999999,16,18065,18067
1236183578,2,99999999,23,18070,18075
1236216065,1,120131,41,18074,18074
1236349115,1,121051,92,18086,18086
1236369939,1,120123,111,18089,18089
1236483576,2,99999999,70108,18100,18111
1236673732,3,99999999,9,18119,18124
1236694462,3,99999999,70221,18121,18123
1236701935,1,121027,34,18121,18121
1236783056,1,120136,183,18130,18130
1236852196,1,120170,215,18137,18137
1236923123,3,99999999,3959,18143,18144
1236965430,3,99999999,70165,18148,18158
1237165927,3,99999999,79,18167,18178
1237218771,1,120143,111,18173,18173
1237272696,1,120124,195,18178,18178
1237327705,1,121043,10,18183,18183
1237331045,3,99999999,2618,18183,18188
1237370327,1,120145,41,18188,18188
1237450174,3,99999999,171,18196,18200
1237478988,2,99999999,908,18198,18202
1237507462,2,99999999,1100,18201,18203
1237517484,1,121081,79,18202,18202
1237664026,3,99999999,65,18217,18223
1237670443,2,99999999,10,18217,18222
1237695520,1,120190,53,18220,18220
1237751376,2,99999999,10,18225,18230
1237789102,1,121027,56,18229,18229
1237825036,3,99999999,9,18233,18238
1237890730,1,121041,5,18239,18239
1237894107,2,99999999,29,18240,18245
1237894966,2,99999999,70187,18240,18245
1237928021,2,99999999,23,18243,18248
1237974997,1,120158,41,18248,18248
1237989406,3,99999999,36,18249,18252
1238013821,3,99999999,46966,18252,18253
1238053337,3,99999999,9,18256,18261
1238161695,2,99999999,41,18268,18272
1238168538,1,121064,63,18268,18268
1238231237,1,121106,10,18276,18276
1238255107,1,121039,88,18279,18279
1238273927,1,120127,215,18282,18282
1238305578,3,99999999,70210,18286,18287
1238319276,1,121025,52,18287,18287
1238319281,1,121106,89,18287,18287
1238353296,1,120127,111,18292,18292
1238367238,1,121044,31,18293,18293
1238370259,3,99999999,19,18294,18299
1238377562,1,120151,41,18295,18295
1238393448,1,121073,10,18296,18296
1238426415,3,99999999,19,18301,18306
1238440880,1,121042,52,18302,18302
1238474357,2,99999999,50,18307,18308
1238510159,1,121054,71,18311,18311
1238553101,3,99999999,19,18317,18322
1238605995,1,121033,88,18323,18323
1238637449,1,121023,88,18327,18327
1238646479,1,121069,12,18328,18328
1238646484,1,121072,90,18328,18328
1238674844,1,120121,53,18332,18332
1238678581,1,121051,12,18332,18332
1238686430,1,121044,10,18333,18333
1238696385,2,99999999,2806,18334,18338
1238712056,1,120127,53,18337,18337
1238735750,1,120177,195,18340,18340
1238797437,2,99999999,928,18347,18351
1238805678,1,121024,52,18348,18348
1238805703,1,121039,89,18348,18348
1238812262,2,99999999,14703,18349,18352
1238846184,1,121056,88,18353,18353
1238856867,2,99999999,70187,18355,18360
1238870441,1,121105,39,18356,18356
1238872273,3,99999999,3959,18356,18358
1238910092,1,121042,89,18361,18361
1238928257,1,120172,215,18364,18364
1238968334,2,99999999,29,18369,18373
1238985782,2,99999999,29,18371,18375
1239003827,3,99999999,19,18373,18378
1239018454,3,99999999,70221,18375,18377
1239057268,1,121030,12,18379,18379
1239172417,2,99999999,29,18394,18398
1239179935,2,99999999,39,18394,18399
1239194032,1,121040,52,18396,18396
1239201604,1,121020,90,18397,18397
1239220388,2,99999999,29,18400,18404
1239226632,3,99999999,20,18400,18406
1239248786,1,121087,63,18403,18403
1239258470,1,120152,41,18405,18405
1239266107,1,120143,53,18406,18406
1239312711,1,121075,45,18411,18411
1239320891,2,99999999,1100,18412,18414
1239346133,1,121037,52,18415,18415
1239353855,1,120143,183,18417,18417
1239368476,1,121105,89,18418,18418
1239408849,1,121105,52,18423,18423
1239410348,2,99999999,29,18424,18428
1239416627,1,121036,88,18424,18424
1239418524,1,120127,195,18425,18425
1239442095,2,99999999,41,18428,18432
1239498112,3,99999999,17023,18435,18440
1239543223,1,121040,90,18440,18440
1239615368,1,121127,45,18449,18449
1239693951,1,121040,88,18459,18459
1239713046,2,99999999,16,18462,18463
1239735632,1,121073,71,18464,18464
1239744161,2,99999999,13,18466,18471
1239765451,1,121036,60,18468,18468
1239785436,3,99999999,65,18471,18477
1239821232,2,99999999,1684,18475,18478
1239823829,2,99999999,54655,18476,18479
1239836937,1,121090,12,18477,18477
1239874523,1,121042,12,18482,18482
1239932984,2,99999999,16,18490,18491
1239962634,1,120732,52,18493,18493
1239972644,2,99999999,53,18495,18497
1239994933,1,121060,90,18497,18497
1240051245,3,99999999,71,18504,18510
1240060066,1,121066,60,18505,18505
1240137702,2,99999999,544,18515,18516
1240173354,3,99999999,70165,18520,18521
1240187143,2,99999999,29,18522,18526
1240201886,1,121039,10,18523,18523
1240283215,1,121051,52,18533,18533
1240306942,1,121071,90,18536,18536
1240314947,2,99999999,908,18537,18541
1240314956,1,121074,17,18537,18537
1240355393,1,121063,10,18542,18542
1240379679,1,120733,63,18545,18545
1240387741,1,121140,89,18546,18546
1240430921,1,120153,183,18552,18552
1240446608,2,99999999,29,18554,18558
1240447572,2,99999999,50,18554,18555
1240461993,1,121036,10,18555,18555
1240485814,2,99999999,29,18559,18563
1240509842,1,121033,63,18561,18561
1240512744,2,99999999,50,18562,18563
1240549230,1,121061,89,18566,18566
1240568966,3,99999999,19,18569,18574
1240581932,1,120192,215,18571,18571
1240588370,2,99999999,2788,18571,18573
1240599396,2,99999999,16,18573,18574
1240604971,1,121071,63,18573,18573
1240613362,1,121069,20,18574,18574
1240692950,1,121086,88,18584,18584
1240782710,2,99999999,544,18595,18596
1240856801,2,99999999,544,18604,18605
1240870047,2,99999999,1100,18606,18608
1240886449,1,121030,52,18608,18608
1240903120,1,121044,52,18610,18610
1240961599,2,99999999,16,18618,18619
1241054779,3,99999999,24,18629,18632
1241063739,1,121135,89,18630,18631
1241066216,1,120134,171,18631,18631
1241086052,3,99999999,53,18633,18636
1241147641,1,120131,53,18640,18640
1241235281,1,120136,171,18650,18657
1241244297,1,120164,111,18651,18651
1241263172,3,99999999,3959,18652,18653
1241286432,3,99999999,27,18655,18660
1241298131,2,99999999,2806,18656,18666
1241359997,1,121043,12,18663,18663
1241371145,1,120124,171,18665,18665
1241390440,1,120131,41,18667,18667
1241461856,1,121042,18,18674,18675
1241561055,1,120127,171,18686,18686
1241623505,3,99999999,24,18692,18695
1241645664,2,99999999,70100,18695,18699
1241652707,3,99999999,27,18695,18700
1241686210,1,121040,10,18699,18705
1241715610,1,121106,92,18702,18702
1241731828,1,121025,31,18704,18704
1241789227,3,99999999,17023,18711,18716
1241895594,1,121051,56,18722,18726
1241909303,3,99999999,46966,18724,18725
1241930625,3,99999999,27,18726,18731
1241977403,1,120152,171,18732,18732
1242012259,1,121040,10,18735,18735
1242012269,1,121040,45,18735,18735
1242035131,1,120132,183,18738,18738
1242076538,3,99999999,31,18742,18746
1242130888,1,121086,92,18748,18748
1242140006,3,99999999,5,18749,18754
1242140009,2,99999999,90,18749,18751
1242149082,1,121032,90,18750,18750
1242159212,3,99999999,5,18751,18756
1242161468,3,99999999,2550,18751,18756
1242162201,3,99999999,46966,18752,18753
1242173926,3,99999999,1033,18753,18757
1242185055,1,120136,41,18755,18755
1242214574,3,99999999,70079,18758,18761
1242229985,1,120127,171,18760,18760
1242259863,2,99999999,70187,18763,18768
1242265757,1,121105,10,18763,18763
1242449327,3,99999999,27,18783,18788
1242458099,1,121071,10,18784,18784
1242467585,3,99999999,34,18785,18791
1242477751,3,99999999,31,18786,18790
1242493791,1,121056,5,18788,18788
1242502670,1,121067,31,18789,18789
1242515373,3,99999999,17023,18791,18796
1242534503,3,99999999,70165,18793,18800
1242557584,2,99999999,89,18795,18799
1242559569,1,120130,171,18796,18796
1242568696,2,99999999,2806,18796,18800
1242578860,2,99999999,70100,18798,18802
1242610991,1,121037,12,18801,18801
1242647539,1,121109,45,18805,18805
1242657273,1,121037,90,18806,18806
1242691897,2,99999999,90,18810,18812
1242736731,1,121107,10,18815,18815
1242773202,3,99999999,24,18819,18822
1242782701,3,99999999,27,18820,18825
1242827683,1,121105,10,18825,18825
1242836878,1,121027,10,18826,18826
1242838815,1,120195,41,18827,18827
1242848557,2,99999999,2806,18827,18831
1242923327,3,99999999,70165,18836,18837
1242938120,1,120124,171,18838,18838
1242977743,2,99999999,65,18842,18846
1243012144,2,99999999,2806,18845,18849
1243026971,1,120733,10,18847,18847
1243039354,1,120143,41,18849,18849
1243049938,3,99999999,53,18850,18853
1243110343,1,121032,10,18856,18856
1243127549,1,120159,171,18859,18859
1243152030,1,120734,45,18861,18862
1243152039,1,121089,90,18861,18861
1243165497,3,99999999,70201,18863,18868
1243198099,1,121061,10,18866,18866
1243227745,1,120141,171,18870,18880
1243269405,2,99999999,928,18874,18878
1243279343,3,99999999,27,18875,18880
1243290080,1,121057,31,18876,18876
1243290089,1,121065,45,18876,18876
1243315613,1,121026,5,18879,18879
1243398628,1,121051,12,18888,18888
1243417726,1,121029,69,18890,18890
1243462945,3,99999999,24,18895,18898
1243465031,1,120195,41,18896,18896
1243485097,3,99999999,11,18898,18902
1243515588,1,121024,89,18901,18901
1243568955,1,121060,31,18907,18907
1243643970,1,120138,171,18916,18916
1243644877,3,99999999,70079,18916,18919
1243661763,1,120124,41,18918,18918
1243670182,1,121065,69,18918,18918
1243680376,1,121061,31,18919,18919
1243797399,1,121053,10,18932,18932
1243799681,1,120128,41,18933,18933
1243815198,1,120732,10,18934,18934
1243817278,1,120127,171,18935,18935
1243887390,2,99999999,908,18942,18946
1243951648,1,121068,34,18949,18949
1243960910,1,121028,90,18950,18950
1243963366,1,120175,215,18951,18951
1243991721,1,120124,171,18954,18954
1243992813,2,99999999,70187,18954,18959
1244066194,2,99999999,2806,18961,18965
1244086685,3,99999999,14104,18964,18967
1244107612,1,121107,45,18966,18966
1244117101,1,121109,45,18967,18967
1244117109,1,121117,49,18967,18967
1244171290,1,121121,31,18973,18973
1244181114,1,121092,10,18974,18974
1244197366,1,121118,89,18976,18976
1244296274,1,121040,5,18987,18987
;;;;
run;

data ORION.ORDER_FACT;
   attrib Customer_ID length=8 label='Customer ID' format=12.;
   attrib Employee_ID length=8 label='Employee ID' format=12.;
   attrib Street_ID length=8 label='Street ID' format=12.;
   attrib Order_Date length=8 label='Date Order was placed by Customer' format=DATE9.;
   attrib Delivery_Date length=8 label='Date Order was Delivered' format=DATE9.;
   attrib Order_ID length=8 label='Order ID' format=12.;
   attrib Order_Type length=8 label='Order Type';
   attrib Product_ID length=8 label='Product ID' format=12.;
   attrib Quantity length=8 label='Quantity Ordered';
   attrib Total_Retail_Price length=8 label='Total Retail Price for This Product' format=DOLLAR13.2;
   attrib CostPrice_Per_Unit length=8 label='Cost Price Per Unit' format=DOLLAR13.2;
   attrib Discount length=8 label='Discount in percent of Normal Total Retail Price' format=PERCENT.;

   infile datalines dsd;
   input
      Customer_ID
      Employee_ID
      Street_ID
      Order_Date
      Delivery_Date
      Order_ID
      Order_Type
      Product_ID
      Quantity
      Total_Retail_Price
      CostPrice_Per_Unit
      Discount
   ;
datalines4;
63,121039,9260125492,17177,17177,1230058123,1,220101300017,1,16.5,7.45,
5,99999999,9260114570,17181,17185,1230080101,2,230100500026,1,247.5,109.55,
45,99999999,9260104847,17186,17188,1230106883,2,240600100080,1,28.3,8.55,
41,120174,1600101527,17194,17194,1230147441,1,240600100010,2,32,6.5,
183,120134,1600100760,17224,17224,1230315085,1,240200200039,3,63.6,8.8,
79,99999999,9260101874,17227,17228,1230333319,2,240100400005,1,234.6,115.95,
23,99999999,9260126679,17228,17233,1230338566,2,240800200062,1,35.4,16.15,
23,99999999,9260126679,17228,17233,1230338566,2,240800200063,2,73.8,16.85,
45,99999999,9260104847,17234,17236,1230371142,2,240500100004,2,127,28,
45,99999999,9260104847,17234,17236,1230371142,2,240500200003,1,23.2,11.1,
56,121059,9260111871,17240,17240,1230404278,1,220200300002,2,75,17.05,
183,120149,1600100760,17247,17247,1230440481,1,230100600005,1,129.8,63.2,
16,99999999,3940105865,17249,17251,1230450371,2,230100600018,2,128.4,32.2,
79,99999999,9260101874,17249,17250,1230453723,2,240500200056,1,24.1,11.55,
183,120134,1600100760,17250,17250,1230455630,1,240200100233,2,91.8,22.45,
2788,99999999,9050100001,17253,17255,1230478006,2,230100100025,2,60.6,13.15,
20,121066,9260118934,17257,17257,1230498538,1,230100300006,1,68.5,34.35,
70046,99999999,2600100017,17258,17259,1230500669,3,240200100131,2,148.6,41.35,
12386,99999999,4750100001,17258,17259,1230503155,2,220101400310,1,31.8,14.2,
23,99999999,9260126679,17274,17279,1230591673,2,220200200024,3,178.5,32.25,
36,99999999,9260128237,17274,17276,1230591675,3,240500100039,1,34.5,15.4,
79,121045,9260101874,17274,17274,1230591684,1,240200100076,4,1796,246.55,
61,99999999,3940108887,17280,17285,1230619748,2,220200100092,1,83,41.6,
61,99999999,3940108887,17280,17285,1230619748,2,220200300005,3,345,52.35,
13,99999999,3940105189,17284,17289,1230642273,2,230100500082,1,126.1,58.6,
171,99999999,1600101555,17287,17290,1230657844,3,240100100646,1,109.9,46.8,
11171,99999999,2600100032,17293,17295,1230690733,3,240200100043,2,282.4,69.4,
14703,99999999,4750100002,17294,17297,1230699509,2,220100100044,1,102.1,48.65,
14703,99999999,4750100002,17294,17297,1230699509,2,220100400005,1,81.3,40.75,
79,99999999,9260101874,17294,17295,1230700421,2,230100100006,1,176,74.55,
79,99999999,9260101874,17294,17295,1230700421,2,230100500045,2,2.6,0.6,
79,99999999,9260101874,17294,17295,1230700421,2,230100500068,2,3.4,0.8,
928,99999999,9050100016,17301,17305,1230738723,2,230100600026,2,237.2,59.4,
19444,99999999,4750100001,17302,17307,1230744524,2,220100700024,1,99.7,47.45,
19444,99999999,4750100001,17302,17307,1230744524,2,220101000002,1,17.7,8,
71,121060,9260124130,17302,17302,1230745294,1,220200100179,1,134.5,67.35,
12,121039,9260103713,17304,17304,1230754828,1,220100100272,3,68.4,11.5,
12,121039,9260103713,17304,17304,1230754828,1,220101400269,4,268,29.8,
544,99999999,9050100008,17307,17308,1230771337,2,230100500012,3,221.7,33.25,
111,120148,1600102072,17309,17309,1230778996,1,230100500096,1,35.5,17.25,
88,99999999,9260100179,17311,17314,1230793366,2,240400200097,3,1250.4,124.2,
23,99999999,9260126679,17313,17318,1230804171,2,240500200073,3,148.5,20.65,
71,121064,9260124130,17317,17317,1230825762,1,230100500093,2,265.6,55.85,
23,99999999,9260126679,17320,17325,1230841456,2,240700400024,2,127.2,33.15,
75,121094,9260108068,17320,17320,1230841466,1,240500100062,2,109.2,23.85,
75,121094,9260108068,17320,17320,1230841466,1,240500200130,2,56,11.7,
56,121043,9260111871,17328,17328,1230885738,1,220101300017,2,33,7.45,
56,121043,9260111871,17328,17328,1230885738,1,220101400098,3,97.2,14.85,
18,121086,9260112361,17333,17333,1230912536,1,240500200121,2,50.8,12.1,
17023,99999999,2600100021,17337,17342,1230931366,3,240200200007,2,166.8,8.35,
17023,99999999,2600100021,17337,17342,1230931366,3,240200200061,2,261.8,52.45,
171,99999999,1600101555,17350,17353,1231002241,3,220101200029,1,52.3,22.65,
70108,99999999,2600100046,17351,17352,1231008713,2,240200200039,2,42.4,8.8,
2806,99999999,8010100089,17351,17355,1231014780,2,240100400043,4,1064,131.5,
215,120145,1600102721,17354,17354,1231023774,1,230100500024,1,22.9,10.85,
215,120145,1600102721,17354,17354,1231023774,1,230100600015,1,78.2,39.2,
13,99999999,3940105189,17356,17361,1231035308,2,230100600023,2,146.8,36.8,
36,99999999,9260128237,17362,17364,1231071449,3,240400200057,2,257,58.05,
36,99999999,9260128237,17362,17364,1231071449,3,240400200066,2,27.6,6.3,
12,121064,9260103713,17363,17363,1231077006,1,230100500095,2,193.8,40,
61,99999999,3940108887,17367,17372,1231094514,2,230100500074,4,544,51.3,
61,99999999,3940108887,17367,17372,1231094514,2,230100600005,2,259.6,63.2,
79,121027,9260101874,17374,17374,1231135703,1,210200900004,2,92,16.05,
79,121027,9260101874,17374,17374,1231135703,1,210201000050,2,39,8.95,
31,121059,9260128428,17380,17380,1231169108,1,220200300157,3,220.2,36.65,
215,120164,1600102721,17382,17382,1231176288,1,240500200100,2,45.4,10.85,
111,99999999,1600102072,17384,17386,1231188317,2,220100900029,1,30.8,12.35,
3959,99999999,8010100151,17384,17385,1231194004,3,240100100610,2,122,27.55,
3959,99999999,8010100151,17384,17385,1231194004,3,240100400143,2,330,82.6,
71,120732,9260124130,17386,17386,1231204878,1,230100600017,2,111.4,27.95,
215,120134,1600102721,17387,17387,1231206746,1,240200100232,1,28.2,14.2,
70187,99999999,2600100035,17391,17396,1231227910,2,240200200013,3,1266,42.2,
20,121040,9260118934,17391,17391,1231231220,1,220101400306,2,145.2,33.1,
45,121045,9260104847,17396,17396,1231259703,1,240200100051,3,420.9,72,
52,99999999,9260116235,17398,17404,1231270767,3,230100600022,2,168.2,42.15,
12,121037,9260103713,17402,17402,1231292064,1,220101400060,3,96.3,14.7,
12,121037,9260103713,17402,17402,1231292064,1,220101400117,2,91.2,20.85,
16,99999999,3940105865,17405,17413,1231305521,2,220200100035,2,125.2,31.4,
16,99999999,3940105865,17405,17407,1231305531,2,220200100090,2,177.2,44.4,
20,121109,9260118934,17406,17406,1231314893,1,240700200024,2,32,6.35,
2806,99999999,8010100089,17406,17410,1231316727,2,240100400076,2,224.6,68.6,
2806,99999999,8010100089,17406,17410,1231316727,2,240100400143,2,330,82.6,
61,99999999,3940108887,17407,17412,1231317443,2,230100700002,2,440,135,
71,121057,9260124130,17411,17411,1231341359,1,220200200018,2,132.8,30.25,
36,99999999,9260128237,17420,17422,1231392762,3,230100600023,2,146.8,36.8,
36,99999999,9260128237,17424,17426,1231414059,3,240800200008,1,150.25,60.1,
70046,99999999,2600100017,17432,17433,1231453831,3,240200100052,1,99.7,51.4,
70046,99999999,2600100017,17432,17433,1231453831,3,240200200015,1,24,10.55,
52,121044,9260116235,17434,17439,1231468750,1,220100100153,1,50,25.1,
19444,99999999,4750100001,17440,17445,1231500373,2,220101200006,1,52.2,20.95,
88,121043,9260100179,17440,17440,1231501254,1,220100700052,1,106.1,50.5,
52,99999999,9260116235,17444,17450,1231522431,3,240100100065,1,34.7,13.8,
14703,99999999,4750100002,17448,17451,1231544990,2,220101400385,1,24.8,12.35,
70108,99999999,2600100046,17461,17462,1231614059,2,220101200020,1,55.9,24.2,
61,99999999,3940108887,17462,17467,1231619928,2,230100600036,1,103.2,50.4,
11,99999999,3940108592,17468,17473,1231653765,3,230100200047,1,72.7,35.2,
63,121061,9260125492,17468,17472,1231657078,1,220200300116,1,84.2,38.35,
5,121025,9260114570,17469,17469,1231663230,1,240100100433,1,3,1.15,
544,99999999,9050100008,17482,17483,1231734609,2,230100500091,1,191,80.45,
1033,99999999,9050100001,17482,17486,1231734615,3,230100600005,1,129.8,63.2,
17,121037,9260123306,17486,17486,1231757107,1,220100100568,1,84.1,42.15,
14703,99999999,4750100002,17489,17492,1231773634,2,220101400018,2,45.6,10.45,
71,121025,9260124130,17490,17490,1231780610,1,240100400080,1,219.9,109.9,
5,99999999,9260114570,17501,17503,1231842118,2,240700300002,2,43.98,7.25,
45,121060,9260104847,17504,17504,1231858937,1,220200300079,2,128.6,28.65,
70187,99999999,2600100035,17505,17510,1231861295,2,240200100154,2,53.2,11.95,
71,121043,9260124130,17510,17510,1231891098,1,220101400091,2,65.6,15,
88,120733,9260100179,17511,17511,1231896710,1,230100500087,1,93.8,39.05,
183,120127,1600100760,17512,17512,1231898348,1,220101400289,4,240.8,27.4,
215,120132,1600102721,17514,17514,1231908237,1,240200100180,2,243.2,62.9,
17,121020,9260123306,17517,17517,1231928627,1,240100400070,1,175.9,127.95,
111,120127,1600102072,17518,17518,1231930216,1,220100300008,4,342.8,34.35,
111,120127,1600102072,17519,17519,1231936241,1,220101400017,2,22.2,5,
5,99999999,9260114570,17521,17523,1231950921,2,230100500093,2,265.6,55.85,
5,99999999,9260114570,17521,17523,1231950921,2,230100600030,1,86.3,41.4,
111,99999999,1600102072,17522,17524,1231952752,2,220100100298,2,105.8,26.55,
70210,99999999,2600100015,17522,17523,1231953192,3,240200100052,2,199.4,51.4,
5,121037,9260114570,17522,17522,1231956902,1,220101400276,2,136.8,31.2,
19,99999999,3940106547,17526,17530,1231976710,3,240300100020,4,56.4,6.05,
19,99999999,3940106547,17526,17530,1231976710,3,240300100032,2,1200.2,300,
183,120158,1600100760,17527,17527,1231982684,1,240400300033,3,107.1,14.35,
195,120148,1600101663,17528,17528,1231986335,1,230100500008,1,38,16.8,
70046,99999999,2600100017,17531,17532,1232003930,3,240200100124,2,49,12.35,
5,99999999,9260114570,17531,17535,1232007693,2,240100400044,1,353.6,174.75,
5,99999999,9260114570,17531,17535,1232007693,2,240100400049,1,421.2,212.95,
45,121066,9260104847,17531,17531,1232007700,1,230100100045,2,249.6,53.6,
45,121066,9260104847,17531,17531,1232007700,1,230100200019,2,398.2,95.65,
45,121066,9260104847,17531,17531,1232007700,1,230100500056,1,8,3.5,
53,120143,1600103258,17544,17544,1232087464,1,230100600022,4,336.4,42.15,
49,121039,9260104510,17544,17544,1232092527,1,220100200004,1,6.5,2.6,
49,121039,9260104510,17544,17544,1232092527,1,220100900006,1,88.4,35.45,
49,121039,9260104510,17544,17544,1232092527,1,220101400150,1,28.2,12.9,
34,121040,9260111379,17554,17554,1232161564,1,220100100197,1,101.3,50.75,
2618,99999999,8010100125,17556,17561,1232173841,3,240100100581,1,28,11.55,
2618,99999999,8010100125,17556,17561,1232173841,3,240100400147,1,248.3,122.75,
89,99999999,9260116551,17563,17566,1232217725,2,230100100062,2,283.4,61,
195,120150,1600101663,17567,17567,1232240447,1,230100200059,2,77.6,16.65,
70046,99999999,2600100017,17567,17568,1232241009,3,240200200039,1,22.2,9.2,
171,120148,1600101555,17577,17577,1232307056,1,230100500081,2,146,30.35,
20,121039,9260118934,17577,17577,1232311932,1,220100300025,2,206,42.4,
23,99999999,9260126679,17580,17584,1232331499,2,230100100051,2,369.8,78.15,
13,99999999,3940105189,17587,17590,1232373481,2,220200100229,1,165.5,82.85,
4,99999999,9260106519,17593,17594,1232410925,3,240800200030,1,47.7,18.8,
4,121100,9260106519,17600,17600,1232455720,1,240600100017,1,53,23.25,
70201,99999999,2600100012,17610,17615,1232517885,3,240200100226,1,183.9,86.65,
4,99999999,9260106519,17611,17612,1232530384,3,240700200019,1,16.9,8.6,
49,121037,9260104510,17611,17611,1232530393,1,220100100125,1,33.4,16.8,
49,121037,9260104510,17611,17611,1232530393,1,220100100513,1,63.9,32.05,
49,121037,9260104510,17611,17611,1232530393,1,220100300019,1,35.6,16.7,
92,121068,9260117676,17615,17615,1232554759,1,230100600022,1,84.1,42.15,
195,120160,1600101663,17621,17621,1232590052,1,240400300013,1,51.8,21.6,
195,120160,1600101663,17621,17621,1232590052,1,240400300035,1,19.1,7.7,
89,99999999,9260116551,17622,17625,1232601472,2,230100500094,2,173.2,34.1,
54655,99999999,2600100013,17625,17628,1232618023,2,240200100183,1,95.7,47.95,
49,121031,9260104510,17629,17637,1232648239,1,210201000126,1,6.5,2.3,
4,99999999,9260106519,17630,17631,1232654929,3,240500100017,4,214,23.75,
4,99999999,9260106519,17630,17631,1232654929,3,240500100029,1,58.9,26.1,
11171,99999999,2600100032,17633,17635,1232672914,3,240200100101,2,38.8,10.2,
11171,99999999,2600100032,17633,17635,1232672914,3,240200200011,2,271.4,13,
9,99999999,3940106659,17637,17642,1232698281,3,230100600035,1,29.4,14.15,
4,121041,9260106519,17638,17638,1232709099,1,220101400145,1,16.7,7.75,
34,121105,9260111379,17638,17638,1232709115,1,240700100001,3,70.8,12.3,
41,99999999,1600101527,17641,17645,1232723799,3,210200600112,1,21.8,9.25,
5,99999999,9260114570,17641,17645,1232728634,2,240100100403,1,168.7,76.55,
215,120151,1600102721,17649,17649,1232777080,1,230100500012,1,73.9,33.25,
215,120151,1600102721,17649,17649,1232777080,1,230100600023,1,73.4,36.8,
195,120143,1600101663,17651,17651,1232790793,1,230100200074,1,50.1,24.5,
45,99999999,9260104847,17660,17664,1232857157,2,230100600030,2,172.6,41.4,
908,99999999,9050100023,17665,17669,1232889267,2,230100200054,3,407.4,61.8,
34,121021,9260111379,17666,17666,1232897220,1,240100400129,3,712.2,111,
544,99999999,9050100008,17672,17673,1232936635,2,230100600030,2,172.6,41.4,
111,99999999,1600102072,17674,17676,1232946301,2,220101400061,2,102,23.3,
52,99999999,9260116235,17675,17676,1232956741,3,230100500008,2,76,16.8,
171,120145,1600101555,17678,17678,1232972274,1,230100200054,1,135.8,61.8,
171,120145,1600101555,17678,17678,1232972274,1,230100500056,1,8,3.5,
183,120122,1600100760,17680,17680,1232985693,1,240100100186,1,273,122.8,
4,121109,9260106519,17681,17681,1232998740,1,240700100011,3,80.97,10.23,
34,121025,9260111379,17682,17682,1233003688,1,240100100535,1,28.6,12.95,
14104,99999999,4750100001,17689,17692,1233049735,3,220101400216,2,48.8,11.2,
215,120148,1600102721,17692,17692,1233066745,1,230100600022,1,84.1,42.15,
49,121060,9260104510,17693,17693,1233078086,1,220200200071,2,200.2,43.5,
12,121054,9260103713,17695,17695,1233092596,1,240300100048,1,15.5,6.7,
45,121084,9260104847,17701,17701,1233131266,1,240400300039,2,39.2,7.9,
171,120121,1600101555,17707,17707,1233166411,1,240100100734,1,10.1,4.15,
70187,99999999,2600100035,17707,17712,1233167161,2,240200100095,2,237,52.55,
49,121109,9260104510,17718,17718,1233243603,1,240700200004,2,8.4,2.2,
19444,99999999,4750100001,17719,17724,1233248920,2,220100700042,2,171.2,36.35,
19444,99999999,4750100001,17719,17724,1233248920,2,220101400387,3,37.8,5.85,
75,121029,9260108068,17722,17722,1233270605,1,210200600085,2,75.2,17,
70059,99999999,2600100047,17724,17728,1233280857,3,220100100609,3,173.7,29.05,
5,121053,9260114570,17729,17729,1233315988,1,240300200018,1,87.2,39.7,
5,121053,9260114570,17729,17729,1233315988,1,240300300071,1,138,60.1,
13,99999999,3940105189,17739,17742,1233378724,2,240300100046,1,14.1,6.9,
34,121105,9260111379,17754,17754,1233482761,1,240700200021,2,38.8,10.35,
2550,99999999,8010100009,17754,17759,1233484749,3,240100400098,2,503.6,125.85,
2550,99999999,8010100009,17754,17759,1233484749,3,240100400136,3,272.7,45.4,
70201,99999999,2600100012,17759,17764,1233514453,3,240200200060,3,553.5,73.85,
215,120123,1600102721,17762,17762,1233531965,1,240100400112,1,114,54.8,
4,99999999,9260106519,17763,17764,1233543560,3,240500200083,3,201.9,28,
41,120134,1600101527,17764,17764,1233545775,1,240200100007,2,49.4,11.8,
41,120134,1600101527,17764,17764,1233545775,1,240200100020,1,189.6,100.6,
215,120150,1600102721,17764,17764,1233545781,1,230100500020,1,6.2,2.85,
89,99999999,9260116551,17771,17774,1233597637,2,240700400002,2,67.2,14.65,
215,120177,1600102721,17775,17775,1233618453,1,240700400020,1,73.4,38.25,
5,99999999,9260114570,17784,17788,1233682051,2,240100100676,1,43.4,18.65,
49,121053,9260104510,17785,17785,1233689304,1,240300300070,3,1514.4,229.65,
195,120148,1600101663,17808,17808,1233837302,1,230100500026,4,990,109.55,
195,120148,1600101663,17808,17808,1233837302,1,230100600036,3,309.6,50.4,
111,99999999,1600102072,17817,17819,1233895201,2,220100100371,1,25.6,12.9,
111,99999999,1600102072,17817,17819,1233895201,2,220101400238,2,113.8,25.95,
544,99999999,9050100008,17819,17820,1233913196,2,230100400012,1,29.3,11.75,
34,121030,9260111379,17820,17820,1233920786,1,210200400020,1,38,19.1,
34,121030,9260111379,17820,17820,1233920786,1,210200400070,1,41.6,20.9,
52,121135,9260116235,17820,17820,1233920795,1,240800200010,1,120.4,48.1,
52,121064,9260116235,17820,17820,1233920805,1,230100500056,1,8,3.5,
19873,99999999,4750100001,17832,17839,1233998114,2,220100100101,1,59.7,29.95,
19873,99999999,4750100001,17832,17839,1233998114,2,220100400022,1,98.9,47.7,
92,121039,9260117676,17837,17837,1234033037,1,220100700022,1,53.7,22.75,
75,121069,9260108068,17846,17846,1234092222,1,230100500023,1,7.2,3.1,
195,120123,1600101663,17853,17853,1234133789,1,240100400046,1,328.3,165.95,
53,120121,1600103258,17861,17861,1234186330,1,240100400095,1,200.1,97.75,
49,121035,9260104510,17862,17862,1234198497,1,210200100017,1,39,17.35,
54655,99999999,2600100013,17868,17871,1234235150,2,240200200060,2,369,73.85,
49,121042,9260104510,17869,17869,1234247283,1,220100400023,2,187.2,40.75,
17,121135,9260123306,17870,17870,1234255111,1,240800100039,3,257.4,39.9,
23,99999999,9260126679,17874,17878,1234279341,2,230100500092,1,116.7,48.6,
92,121109,9260117676,17877,17877,1234301319,1,240700200010,4,105.6,10.1,
70210,99999999,2600100015,17881,17882,1234323012,3,240200100098,2,29.2,6.75,
70210,99999999,2600100015,17881,17882,1234323012,3,240200100101,2,39,10.3,
70210,99999999,2600100015,17881,17882,1234323012,3,240200200035,2,196,39.3,
4,121069,9260106519,17884,17884,1234348668,1,230100100053,2,92.6,20.9,
17,121071,9260123306,17886,17886,1234360543,1,230100100033,2,110.2,25.4,
12,121069,9260103713,17888,17888,1234373539,1,230100100013,2,226.2,58.9,
111,120123,1600102072,17895,17895,1234414529,1,240100100654,2,90.4,18.15,
111,120123,1600102072,17895,17895,1234414529,1,240100400136,2,181.8,45.4,
17,121109,9260123306,17895,17895,1234419240,1,240700100013,5,119.95,9.75,
195,120150,1600101663,17899,17899,1234437760,1,230100600028,2,193.4,48.45,
36,99999999,9260128237,17908,17911,1234534069,3,240800100026,4,525.2,58.55,
183,120121,1600100760,17909,17909,1234537441,1,240100200001,1,16,6.35,
16,99999999,3940105865,17909,17911,1234538390,2,220200300015,1,115,52.4,
16,99999999,3940105865,17914,17916,1234588648,2,230100500101,1,138.7,62.5,
16,99999999,3940105865,17914,17916,1234588648,2,230100600024,1,76.1,38.15,
16,99999999,3940105865,17921,17923,1234659163,2,230100700008,1,504.2,245.8,
63,99999999,9260125492,17921,17922,1234665265,2,240100100063,2,48.4,9.75,
171,99999999,1600101555,17926,17930,1234709803,3,220100100304,2,122.6,30.75,
183,120179,1600100760,17928,17928,1234727966,1,240700400004,1,13.2,5.95,
70221,99999999,2600100019,17944,17946,1234891576,3,240200100226,1,183.9,86.65,
18,121021,9260112361,17944,17944,1234897732,1,240100100672,1,197.9,84.9,
24,99999999,9260115784,17950,17955,1234958242,2,230100500016,1,11.9,5.4,
16,99999999,3940105865,17952,17954,1234972570,2,230100200048,1,68.7,34.45,
11171,99999999,2600100032,17971,17973,1235176942,3,240200100021,1,2.7,1.2,
11171,99999999,2600100032,17971,17973,1235176942,3,240200100246,1,16.2,7.9,
215,120160,1600102721,17977,17977,1235236723,1,240400200094,1,254.2,115.6,
89,121043,9260116551,17980,17980,1235275513,1,220100100241,1,29.7,14.95,
111,120122,1600102072,17984,17984,1235306679,1,240100200014,1,55.4,22.8,
63,121109,9260125492,17991,17991,1235384426,1,240700100012,1,21.99,9.1,
16,99999999,3940105865,18012,18014,1235591214,2,240400200022,1,93.4,38.95,
16,99999999,3940105865,18012,18014,1235591214,2,240400200036,1,55.5,25.1,
16,99999999,3940105865,18014,18016,1235611754,2,240400300033,2,71.4,14.35,
16,99999999,3940105865,18014,18016,1235611754,2,240400300035,2,38.2,7.7,
16,99999999,3940105865,18027,18029,1235744141,2,230100500081,2,146,30.35,
16,99999999,3940105865,18027,18029,1235744141,2,230100700009,3,1687.5,287.1,
24,99999999,9260115784,18035,18041,1235830338,2,220200100202,1,92,46.1,
24,99999999,9260115784,18035,18041,1235830338,2,220200200073,1,145.9,66.35,
171,120127,1600101555,18038,18038,1235856852,1,220100100019,1,27.7,13.95,
171,120127,1600101555,18038,18038,1235856852,1,220101400152,1,13.1,5.9,
36,99999999,9260128237,18040,18043,1235881915,3,240700400004,2,26.4,5.95,
49,121040,9260104510,18043,18043,1235913793,1,220101200025,1,26.7,11.6,
79,99999999,9260101874,18044,18051,1235926178,3,210200200022,2,36,7.05,
12386,99999999,4750100001,18048,18049,1235963427,2,220100700024,3,313.8,49.8,
12386,99999999,4750100001,18048,18049,1235963427,2,220100900029,1,31.4,12.55,
183,120127,1600100760,18054,18054,1236017640,1,220101400092,1,57.7,25.7,
9,99999999,3940106659,18055,18060,1236028541,3,230100500056,2,16,3.5,
10,121136,9260129395,18057,18057,1236055696,1,240800100041,1,292.5,121.75,
908,99999999,9050100023,18058,18062,1236066649,2,230100300010,1,46.7,18.75,
36,99999999,9260128237,18063,18066,1236113431,3,230100200066,2,25.8,5.45,
26148,99999999,2600100010,18065,18067,1236128445,2,240200100053,2,174.4,44.95,
16,99999999,3940105865,18065,18067,1236128456,2,230100500006,2,16.8,3.45,
16,99999999,3940105865,18065,18067,1236128456,2,230100600016,2,154,38.6,
23,99999999,9260126679,18070,18075,1236183578,2,240500100026,2,110.4,24.5,
23,99999999,9260126679,18070,18075,1236183578,2,240500200007,3,28.5,4.55,
41,120131,1600101527,18074,18074,1236216065,1,240200100118,1,175.5,89.55,
92,121051,9260117676,18086,18086,1236349115,1,240200100221,4,396,49.6,
92,121051,9260117676,18086,18086,1236349115,1,240200200024,2,250.8,12.5,
111,120123,1600102072,18089,18089,1236369939,1,240100100365,1,191.6,87.4,
111,120123,1600102072,18089,18089,1236369939,1,240100400037,1,231,113.65,
70108,99999999,2600100046,18100,18111,1236483576,2,240200200071,4,74.8,10,
9,99999999,3940106659,18119,18124,1236673732,3,230100700008,3,1542.6,250.7,
9,99999999,3940106659,18119,18124,1236673732,3,230100700011,2,550.2,113.45,
70221,99999999,2600100019,18121,18123,1236694462,3,240200100056,2,82.4,19.9,
34,121027,9260111379,18121,18121,1236701935,1,210200300052,2,43.8,11.05,
183,120136,1600100760,18130,18130,1236783056,1,240300200058,2,183.6,41.7,
183,120136,1600100760,18130,18130,1236783056,1,240300300090,3,1561.8,237.05,
215,120170,1600102721,18137,18137,1236852196,1,240600100016,1,55.3,21.9,
3959,99999999,8010100151,18143,18144,1236923123,3,240100100031,1,3.7,1.3,
70165,99999999,2600100006,18148,18158,1236965430,3,240200100050,2,27,6.65,
79,99999999,9260101874,18167,18178,1237165927,3,240500100057,2,76.8,17.1,
111,120143,1600102072,18173,18173,1237218771,1,230100500072,1,26.1,11.9,
195,120124,1600101663,18178,18178,1237272696,1,240100400069,2,186.6,39.95,
195,120124,1600101663,18178,18178,1237272696,1,240100400142,2,338.8,84.85,
10,121043,9260129395,18183,18183,1237327705,1,220100100298,1,52.9,26.55,
10,121043,9260129395,18183,18183,1237327705,1,220100100617,1,37.3,18.75,
2618,99999999,8010100125,18183,18188,1237331045,3,240100100366,1,16.3,7.8,
41,120145,1600101527,18188,18188,1237370327,1,230100600031,1,88.5,42.45,
171,99999999,1600101555,18196,18200,1237450174,3,220100800001,2,77.2,18.35,
171,99999999,1600101555,18196,18200,1237450174,3,220101400349,1,11.9,4.8,
908,99999999,9050100023,18198,18202,1237478988,2,230100200004,1,99.9,50.05,
1100,99999999,9050100008,18201,18203,1237507462,2,230100400025,3,51,6.6,
1100,99999999,9050100008,18201,18203,1237507462,2,230100700009,1,568.1,289.95,
79,121081,9260101874,18202,18202,1237517484,1,240400300013,1,54.3,22.6,
65,99999999,3940100176,18217,18223,1237664026,3,230100200004,1,99.9,50.05,
10,99999999,9260129395,18217,18222,1237670443,2,240800200034,1,74.8,34,
53,120190,1600103258,18220,18220,1237695520,1,220200100129,3,240,39.45,
10,99999999,9260129395,18225,18230,1237751376,2,240100400043,1,279.3,138.1,
56,121027,9260111871,18229,18229,1237789102,1,210200300007,1,50.4,25.3,
9,99999999,3940106659,18233,18238,1237825036,3,240400300039,2,39.2,7.9,
5,121041,9260114570,18239,18239,1237890730,1,220101400265,2,74.2,16.55,
5,121041,9260114570,18239,18239,1237890730,1,220101400387,4,50.4,5.85,
29,99999999,1600103020,18240,18245,1237894107,2,220100700027,2,119,29.85,
70187,99999999,2600100035,18240,18245,1237894966,2,240200100050,2,19.98,6.65,0.3
23,99999999,9260126679,18243,18248,1237928021,2,240800100074,3,949.8,126.7,
23,99999999,9260126679,18243,18248,1237928021,2,240800200037,3,164.4,23.75,
41,120158,1600101527,18248,18248,1237974997,1,240400300013,3,162.9,22.6,
36,99999999,9260128237,18249,18252,1237989406,3,230100100018,2,318.2,67.4,
46966,99999999,2600100011,18252,18253,1238013821,3,240200200026,3,312,41.65,
9,99999999,3940106659,18256,18261,1238053337,3,230100700008,1,514.2,250.7,
41,99999999,1600101527,18268,18272,1238161695,2,240100100477,2,17,3.3,
63,121064,9260125492,18268,18268,1238168538,1,230100200073,1,46.9,20.2,
10,121106,9260129395,18276,18276,1238231237,1,240700200021,1,19.6,10.55,
88,121039,9260100179,18279,18279,1238255107,1,220100100581,1,38.7,19.45,
215,120127,1600102721,18282,18282,1238273927,1,220100700022,3,170.7,24.1,
70210,99999999,2600100015,18286,18287,1238305578,3,240200100246,1,16.2,7.9,
52,121025,9260116235,18287,18287,1238319276,1,240100100305,1,8.9,4.1,
89,121106,9260116551,18287,18287,1238319281,1,240700100007,1,22.85,9.3,
111,120127,1600102072,18292,18292,1238353296,1,220101300001,2,67.2,14.95,
111,120127,1600102072,18292,18292,1238353296,1,220101400138,3,140.1,23.45,
31,121044,9260128428,18293,18293,1238367238,1,220100800001,1,38.6,18.35,
19,99999999,3940106547,18294,18299,1238370259,3,230100600028,1,96.7,48.45,
41,120151,1600101527,18295,18295,1238377562,1,230100600016,2,154,38.6,
10,121073,9260129395,18296,18296,1238393448,1,230100500094,1,86.6,34.1,
19,99999999,3940106547,18301,18306,1238426415,3,230100700011,1,283.3,116.85,
52,121042,9260116235,18302,18302,1238440880,1,220100100530,1,52.2,26.2,
50,99999999,3940105781,18307,18308,1238474357,2,230100700011,2,566.6,116.85,
71,121054,9260124130,18311,18311,1238510159,1,240300200009,1,48.7,18.15,
71,121054,9260124130,18311,18311,1238510159,1,240300300024,1,54.1,23,
19,99999999,3940106547,18317,18322,1238553101,3,240400200091,1,217,90.4,
88,121033,9260100179,18323,18323,1238605995,1,210201100004,1,47.9,20.9,
88,121023,9260100179,18327,18327,1238637449,1,240100400151,1,419,209.45,
12,121069,9260103713,18328,18328,1238646479,1,230100200043,1,56.7,27.25,
90,121072,9260111614,18328,18328,1238646484,1,230100300013,1,24.8,5,
53,120121,1600103258,18332,18332,1238674844,1,240100100508,1,48.3,19.25,
12,121051,9260103713,18332,18332,1238678581,1,240200100181,1,109.3,56.6,
12,121051,9260103713,18332,18332,1238678581,1,240200200080,2,187.6,9.4,
10,121044,9260129395,18333,18333,1238686430,1,220101400201,1,40.6,18.05,
2806,99999999,8010100089,18334,18338,1238696385,2,240100100312,2,36.2,7.7,
53,120127,1600103258,18337,18337,1238712056,1,220100100185,1,97.6,48.9,
53,120127,1600103258,18337,18337,1238712056,1,220100700002,1,186.8,89.1,
195,120177,1600101663,18340,18340,1238735750,1,240700400020,2,155.6,40.5,
928,99999999,9050100016,18347,18351,1238797437,2,230100100063,2,767.8,176.05,
52,121024,9260116235,18348,18348,1238805678,1,240100100714,1,92.8,39.85,
52,121024,9260116235,18348,18348,1238805678,1,240100400006,1,229.1,113.25,
89,121039,9260116551,18348,18348,1238805703,1,220101400285,1,59.4,27.05,
14703,99999999,4750100002,18349,18352,1238812262,2,220100100309,1,96.3,48.25,
14703,99999999,4750100002,18349,18352,1238812262,2,220101400373,1,51.8,23.65,
88,121056,9260100179,18353,18353,1238846184,1,220200100035,1,62.6,31.4,
70187,99999999,2600100035,18355,18360,1238856867,2,220101000002,1,17.7,8,
39,121105,9260123099,18356,18356,1238870441,1,240700200007,1,5.1,2.2,
3959,99999999,8010100151,18356,18358,1238872273,3,240100100434,1,16.4,8.05,
89,121042,9260116551,18361,18361,1238910092,1,220100100309,2,192.6,48.25,
89,121042,9260116551,18361,18361,1238910092,1,220101400363,2,78,16.95,
215,120172,1600102721,18364,18364,1238928257,1,240600100181,1,37.4,16.3,
29,99999999,1600103020,18369,18373,1238968334,2,220100100025,1,17.4,8.8,
29,99999999,1600103020,18371,18375,1238985782,2,240100100703,1,79.9,34.3,
19,99999999,3940106547,18373,18378,1239003827,3,230100600016,1,77,38.6,
70221,99999999,2600100019,18375,18377,1239018454,3,240200100073,1,22.3,12.6,
70221,99999999,2600100019,18375,18377,1239018454,3,240200200068,1,313.8,159.15,
12,121030,9260103713,18379,18379,1239057268,1,210200500006,2,48,11.95,
29,99999999,1600103020,18394,18398,1239172417,2,240100100148,2,51.6,10.95,
39,99999999,9260123099,18394,18399,1239179935,2,240700300002,1,21.99,7.25,
52,121040,9260116235,18396,18396,1239194032,1,220100100192,1,27.4,13.8,
90,121020,9260111614,18397,18397,1239201604,1,240100400129,3,712.2,111,
29,99999999,1600103020,18400,18404,1239220388,2,240100100184,1,190.4,88.8,
20,99999999,9260118934,18400,18406,1239226632,3,220200100190,3,190.5,29.95,
63,121087,9260125492,18403,18403,1239248786,1,240500100015,3,174.3,25.8,
63,121087,9260125492,18403,18403,1239248786,1,240500200093,1,41.7,19.75,
41,120152,1600101527,18405,18405,1239258470,1,240400200003,1,6.2,3,
53,120143,1600103258,18406,18406,1239266107,1,230100600038,1,112.5,54.95,
45,121075,9260104847,18411,18411,1239312711,1,230100600016,3,231,38.6,
45,121075,9260104847,18411,18411,1239312711,1,230100700011,3,849.9,116.85,
1100,99999999,9050100008,18412,18414,1239320891,2,230100200006,3,279.3,46.65,
52,121037,9260116235,18415,18415,1239346133,1,220100100273,3,116.4,19.5,
52,121037,9260116235,18415,18415,1239346133,1,220100300042,1,208.6,84.35,
183,120143,1600100760,18417,18417,1239353855,1,230100500066,1,12.7,6.1,
89,121105,9260116551,18418,18418,1239368476,1,240700100012,3,65.97,9.1,
52,121105,9260116235,18423,18423,1239408849,1,240700100017,2,53.2,11.4,
29,99999999,1600103020,18424,18428,1239410348,2,220100800071,1,32.8,15.7,
88,121036,9260100179,18424,18424,1239416627,1,220100800040,2,248.2,59.05,
195,120127,1600101663,18425,18425,1239418524,1,220100100536,2,408.8,102.3,
41,99999999,1600101527,18428,18432,1239442095,2,210201000198,2,120.2,26.8,
17023,99999999,2600100021,18435,18440,1239498112,3,240200200044,2,97.8,19.6,
90,121040,9260111614,18440,18440,1239543223,1,220100100635,2,172.8,43.3,
90,121040,9260111614,18440,18440,1239543223,1,220101300012,2,38.6,8.75,
45,121127,9260104847,18449,18449,1239615368,1,240800200002,1,178.875,71.55,
88,121040,9260100179,18459,18459,1239693951,1,220100900035,2,83.6,19.45,
16,99999999,3940105865,18462,18463,1239713046,2,230100500058,4,66.8,7.25,
16,99999999,3940105865,18462,18463,1239713046,2,230100500082,2,252.2,58.6,
16,99999999,3940105865,18462,18463,1239713046,2,230100600031,2,177,42.45,
71,121073,9260124130,18464,18464,1239735632,1,230100700009,2,1136.2,289.95,
13,99999999,3940105189,18466,18471,1239744161,2,240400200003,1,6.2,3,
13,99999999,3940105189,18466,18471,1239744161,2,240400300035,2,38.2,7.7,
60,121036,9260101262,18468,18468,1239765451,1,220101400004,2,211.4,48.15,
60,121036,9260101262,18468,18468,1239765451,1,220101400148,2,21,4.75,
65,99999999,3940100176,18471,18477,1239785436,3,230100600031,4,354,42.45,
1684,99999999,9050100008,18475,18478,1239821232,2,230100500013,2,18.8,4.75,
54655,99999999,2600100013,18476,18479,1239823829,2,240200200081,2,214.6,10.75,
12,121090,9260103713,18477,18477,1239836937,1,240500100043,2,52.4,8.85,
12,121042,9260103713,18482,18482,1239874523,1,220101400047,2,48.4,11.1,
16,99999999,3940105865,18490,18491,1239932984,2,220200200079,2,285.8,64.85,
16,99999999,3940105865,18490,18491,1239932984,2,220200300129,5,406,37.05,
52,120732,9260116235,18493,18493,1239962634,1,230100500080,2,50,12.2,
53,99999999,1600103258,18495,18497,1239972644,2,220101400237,1,102.9,46.9,
90,121060,9260111614,18497,18497,1239994933,1,220200300082,3,213,32.3,
71,99999999,9260124130,18504,18510,1240051245,3,230100100028,1,250.9,104.2,
71,99999999,9260124130,18504,18510,1240051245,3,230100200022,3,359.1,56.9,
60,121066,9260101262,18505,18505,1240060066,1,230100100062,1,141.7,61,
544,99999999,9050100008,18515,18516,1240137702,2,230100300023,1,36,15,
70165,99999999,2600100006,18520,18521,1240173354,3,240200100225,2,306.2,77.85,
29,99999999,1600103020,18522,18526,1240187143,2,240100400100,1,154.6,116.6,
10,121039,9260129395,18523,18523,1240201886,1,220101400339,1,32.3,14.75,
52,121051,9260116235,18533,18533,1240283215,1,240200100118,1,175.5,89.55,
52,121051,9260116235,18533,18533,1240283215,1,240200100164,2,112.2,28.15,
52,121051,9260116235,18533,18533,1240283215,1,240200100227,2,323.8,75.9,
90,121071,9260111614,18536,18536,1240306942,1,230100500056,1,8,3.5,
90,121071,9260111614,18536,18536,1240306942,1,230100600018,1,64.2,32.2,
908,99999999,9050100023,18537,18541,1240314947,2,230100600028,1,96.7,48.45,
17,121074,9260123306,18537,18537,1240314956,1,230100500094,1,86.6,34.1,
10,121063,9260129395,18542,18542,1240355393,1,230100600022,1,84.1,42.15,
63,120733,9260125492,18545,18545,1240379679,1,230100200004,1,99.9,50.05,
63,120733,9260125492,18545,18545,1240379679,1,230100500077,1,173,72.75,
89,121140,9260116551,18546,18546,1240387741,1,240800200020,1,187.2,85.15,
183,120153,1600100760,18552,18552,1240430921,1,240400200093,1,155.8,64.95,
29,99999999,1600103020,18554,18558,1240446608,2,220100100553,1,35,17.6,
29,99999999,1600103020,18554,18558,1240446608,2,220100700046,2,305.8,72.9,
50,99999999,3940105781,18554,18555,1240447572,2,230100200056,1,270,125.65,
10,121036,9260129395,18555,18555,1240461993,1,220100300020,1,11.3,4.55,
10,121036,9260129395,18555,18555,1240461993,1,220100800009,1,52.5,24.95,
10,121036,9260129395,18555,18555,1240461993,1,220101400276,1,68.4,31.2,
29,99999999,1600103020,18559,18563,1240485814,2,220101400290,1,74.8,34.1,
63,121033,9260125492,18561,18561,1240509842,1,210200500007,1,39.4,17.8,
50,99999999,3940105781,18562,18563,1240512744,2,240300100046,2,28.8,7.05,
89,121061,9260116551,18566,18566,1240549230,1,220200100012,1,58.7,28.25,
19,99999999,3940106547,18569,18574,1240568966,3,220200100226,1,133.2,66.7,
215,120192,1600102721,18571,18571,1240581932,1,210201000199,3,124.2,18.85,
2788,99999999,9050100001,18571,18573,1240588370,2,230100500082,1,126.1,58.6,
16,99999999,3940105865,18573,18574,1240599396,2,230100700002,1,220,135,
16,99999999,3940105865,18573,18574,1240599396,2,230100700004,1,360,199,
63,121071,9260125492,18573,18573,1240604971,1,230100600030,1,86.3,41.4,
20,121069,9260118934,18574,18574,1240613362,1,230100100017,1,175.3,74.95,
88,121086,9260100179,18584,18584,1240692950,1,240500100039,1,34.5,15.4,
544,99999999,9050100008,18595,18596,1240782710,2,230100500066,1,12.7,6.1,
544,99999999,9050100008,18595,18596,1240782710,2,230100600005,1,129.8,63.2,
544,99999999,9050100008,18604,18605,1240856801,2,230100600028,2,193.4,48.45,
544,99999999,9050100008,18604,18605,1240856801,2,230100600039,1,124.7,59.65,
1100,99999999,9050100008,18606,18608,1240870047,2,230100100015,2,213.8,45.5,
52,121030,9260116235,18608,18608,1240886449,1,210200200023,1,19.8,8.25,
52,121044,9260116235,18610,18610,1240903120,1,220100100592,2,62.2,15.65,
52,121044,9260116235,18610,18610,1240903120,1,220100100629,4,213.2,26.75,
16,99999999,3940105865,18618,18619,1240961599,2,230100200025,4,1103.6,125.25,
16,99999999,3940105865,18618,18619,1240961599,2,230100600015,1,78.2,39.2,
24,99999999,9260115784,18629,18632,1241054779,3,240800200021,2,195.6,42.45,
89,121135,9260116551,18630,18631,1241063739,1,240800200035,6,160.8,12.15,
171,120134,1600101555,18631,18631,1241066216,1,240200100225,2,306.2,77.85,
53,99999999,1600103258,18633,18636,1241086052,3,210200500002,3,37.8,5.7,
53,120131,1600103258,18640,18640,1241147641,1,240200200091,2,362.6,72.6,
171,120136,1600101555,18650,18657,1241235281,1,240300100001,1,72.6,36.25,
111,120164,1600102072,18651,18651,1241244297,1,240500100041,2,258.2,51.7,
111,120164,1600102072,18651,18651,1241244297,1,240500200042,2,81.2,19.35,
111,120164,1600102072,18651,18651,1241244297,1,240500200101,3,358.2,49.75,
3959,99999999,8010100151,18652,18653,1241263172,3,240100400004,1,102.4,51.15,
3959,99999999,8010100151,18652,18653,1241263172,3,240100400062,1,113.2,54,
27,99999999,9260105670,18655,18660,1241286432,3,240800200009,2,174.4,34.9,
2806,99999999,8010100089,18656,18666,1241298131,2,240100400058,1,37.4,29.65,
12,121043,9260103713,18663,18663,1241359997,1,220100100105,1,117.6,58.9,
171,120124,1600101555,18665,18665,1241371145,1,240100400046,2,656.6,165.95,
171,120124,1600101555,18665,18665,1241371145,1,240100400085,2,129,30.95,
41,120131,1600101527,18667,18667,1241390440,1,240200100046,2,36.2,9.15,
18,121042,9260112361,18674,18675,1241461856,1,220100100523,1,29.4,14.8,
171,120127,1600101555,18686,18686,1241561055,1,220101400088,5,192,17.5,
24,99999999,9260115784,18692,18695,1241623505,3,240700400017,1,46.9,21.95,
70100,99999999,2600100015,18695,18699,1241645664,2,240200200020,1,150.1,14,
27,99999999,9260105670,18695,18700,1241652707,3,240700400017,3,140.7,21.95,
10,121040,9260129395,18699,18705,1241686210,1,220100100235,1,32.6,16.4,
92,121106,9260117676,18702,18702,1241715610,1,240700200019,1,16.9,8.6,
31,121025,9260128428,18704,18704,1241731828,1,240100100410,1,22.7,10.4,
31,121025,9260128428,18704,18704,1241731828,1,240100100665,1,41.5,17.25,
17023,99999999,2600100021,18711,18716,1241789227,3,240200100211,1,121,60.65,
56,121051,9260111871,18722,18726,1241895594,1,240200100034,2,24.4,4.45,
56,121051,9260111871,18722,18726,1241895594,1,240200100050,1,13.5,6.65,
46966,99999999,2600100011,18724,18725,1241909303,3,240200200081,1,107.3,10.75,
27,99999999,9260105670,18726,18731,1241930625,3,220200100012,1,58.7,28.25,
27,99999999,9260105670,18726,18731,1241930625,3,220200100171,1,56.3,31.05,
27,99999999,9260105670,18726,18731,1241930625,3,220200200014,1,90,40.9,
171,120152,1600101555,18732,18732,1241977403,1,240400300035,1,19.1,7.7,
10,121040,9260129395,18735,18735,1242012259,1,220100300037,2,231.6,48.7,
10,121040,9260129395,18735,18735,1242012259,1,220101400032,2,19.2,4.85,
45,121040,9260104847,18735,18735,1242012269,1,220100300019,4,142.4,16.7,
45,121040,9260104847,18735,18735,1242012269,1,220101400216,3,73.8,11.3,
183,120132,1600100760,18738,18738,1242035131,1,240200200061,1,147.1,58.85,
31,99999999,9260128428,18742,18746,1242076538,3,220200200022,1,57.3,33.9,
92,121086,9260117676,18748,18748,1242130888,1,240500100017,3,160.5,23.75,
5,99999999,9260114570,18749,18754,1242140006,3,240100100159,1,31.4,13.9,
90,99999999,9260111614,18749,18751,1242140009,2,240100100434,1,16.4,8.05,
90,99999999,9260111614,18749,18751,1242140009,2,240100400128,1,192.4,89.9,
90,121032,9260111614,18750,18750,1242149082,1,210200300006,1,14.3,7.7,
90,121032,9260111614,18750,18750,1242149082,1,210200900033,4,56.8,6.45,
5,99999999,9260114570,18751,18756,1242159212,3,230100200029,2,446.6,101.65,
2550,99999999,8010100009,18751,18756,1242161468,3,240100100232,3,9.6,1.3,
2550,99999999,8010100009,18751,18756,1242161468,3,240100400080,1,222,110.95,
46966,99999999,2600100011,18752,18753,1242162201,3,240200100053,2,174.4,44.95,
1033,99999999,9050100001,18753,18757,1242173926,3,230100600026,3,355.8,59.4,
41,120136,1600101527,18755,18755,1242185055,1,240300100049,1,19.9,8.9,
70079,99999999,2600100039,18758,18761,1242214574,3,240200100230,2,29.4,6.65,
171,120127,1600101555,18760,18760,1242229985,1,220100100189,2,189.4,47.45,
70187,99999999,2600100035,18763,18768,1242259863,2,240200100157,2,706.2,196.15,
10,121105,9260129395,18763,18763,1242265757,1,240700100004,3,79.8,13.75,
27,99999999,9260105670,18783,18788,1242449327,3,240100100679,2,91.6,19.5,
10,121071,9260129395,18784,18784,1242458099,1,230100400007,1,12.2,4.9,
34,99999999,9260111379,18785,18791,1242467585,3,240100100690,2,403,86.1,
34,99999999,9260111379,18785,18791,1242467585,3,240100100737,5,239.5,20.65,
31,99999999,9260128428,18786,18790,1242477751,3,220200200036,2,120.4,27.4,
31,99999999,9260128428,18786,18790,1242477751,3,220200200077,2,277.6,63.15,
5,121056,9260114570,18788,18788,1242493791,1,220200100009,2,126.8,30.5,
31,121067,9260128428,18789,18789,1242502670,1,230100500056,2,16,3.5,
31,121067,9260128428,18789,18789,1242502670,1,230100500087,2,195,40.55,
17023,99999999,2600100021,18791,18796,1242515373,3,240200100057,4,168,20.25,
70165,99999999,2600100006,18793,18800,1242534503,3,240200100118,4,702,89.55,
89,99999999,9260116551,18795,18799,1242557584,2,240500200083,2,134.6,28,
171,120130,1600101555,18796,18796,1242559569,1,220100700023,1,73.99,44.25,0.3
2806,99999999,8010100089,18796,18800,1242568696,2,240100100029,2,239,51.7,
2806,99999999,8010100089,18796,18800,1242568696,2,240100400098,3,755.4,125.85,
70100,99999999,2600100015,18798,18802,1242578860,2,240200100173,4,1937.2,247.7,
12,121037,9260103713,18801,18801,1242610991,1,220101400047,2,48.4,11.1,
45,121109,9260104847,18805,18805,1242647539,1,240700200009,2,56,11.35,
90,121037,9260111614,18806,18806,1242657273,1,220100100410,3,33.6,5.7,
90,99999999,9260111614,18810,18812,1242691897,2,240500100062,2,110.2,24.05,
10,121107,9260129395,18815,18815,1242736731,1,240700200010,3,80.7,10.3,
24,99999999,9260115784,18819,18822,1242773202,3,240600100185,2,70.2,15.6,
27,99999999,9260105670,18820,18825,1242782701,3,240500200081,3,403.5,56.05,
10,121105,9260129395,18825,18825,1242827683,1,240700300002,1,21.99,7.25,
10,121027,9260129395,18826,18826,1242836878,1,210201000067,2,60.6,13.5,
41,120195,1600101527,18827,18827,1242838815,1,210200500007,1,39.4,17.8,
41,120195,1600101527,18827,18827,1242838815,1,210200600056,1,50.4,22.75,
2806,99999999,8010100089,18827,18831,1242848557,2,240100100312,3,54.3,7.7,
70165,99999999,2600100006,18836,18837,1242923327,3,240200100081,2,16.6,3.65,
171,120124,1600101555,18838,18838,1242938120,1,240100200004,1,35.2,14.8,
65,99999999,3940100176,18842,18846,1242977743,2,240400200012,2,351.4,75.95,
2806,99999999,8010100089,18845,18849,1243012144,2,240100100615,2,25.8,5.45,
2806,99999999,8010100089,18845,18849,1243012144,2,240100400083,2,219,54.7,
10,120733,9260129395,18847,18847,1243026971,1,230100500082,2,252.2,58.6,
41,120143,1600101527,18849,18849,1243039354,1,230100600003,1,17.6,7.75,
53,99999999,1600103258,18850,18853,1243049938,3,220100300001,2,180.4,38.3,
10,121032,9260129395,18856,18856,1243110343,1,210200600067,2,134,28.9,
10,121032,9260129395,18856,18856,1243110343,1,210200900038,3,60.9,9.3,
171,120159,1600101555,18859,18859,1243127549,1,240400300035,1,19.1,7.7,
45,120734,9260104847,18861,18862,1243152030,1,230100400010,1,40.2,16.85,
90,121089,9260111614,18861,18861,1243152039,1,240500200003,2,47.6,11.4,
70201,99999999,2600100012,18863,18868,1243165497,3,240200100052,2,201.2,51.9,
70201,99999999,2600100012,18863,18868,1243165497,3,240200100116,3,658.5,124.9,
70201,99999999,2600100012,18863,18868,1243165497,3,240200100207,2,215.8,53.35,
10,121061,9260129395,18866,18866,1243198099,1,220200200018,3,199.2,30.25,
10,121061,9260129395,18866,18866,1243198099,1,220200300154,3,256.2,39.8,
171,120141,1600101555,18870,18880,1243227745,1,230100500004,2,6.4,1.35,
928,99999999,9050100016,18874,18878,1243269405,2,230100600030,1,86.3,41.4,
27,99999999,9260105670,18875,18880,1243279343,3,240500200082,2,78.4,16.45,
31,121057,9260128428,18876,18876,1243290080,1,220200100137,1,50.3,25.25,
45,121065,9260104847,18876,18876,1243290089,1,230100600015,1,78.2,39.2,
5,121026,9260114570,18879,18879,1243315613,1,210200500016,1,52.5,22.25,
12,121051,9260103713,18888,18888,1243398628,1,240200100053,1,87.2,44.95,
69,121029,9260116402,18890,18890,1243417726,1,210200700016,1,23.5,9.2,
24,99999999,9260115784,18895,18898,1243462945,3,240600100102,1,46.1,19.7,
41,120195,1600101527,18896,18896,1243465031,1,210200600067,2,134,28.9,
11,99999999,3940108592,18898,18902,1243485097,3,220200100002,2,78.2,19.65,
89,121024,9260116551,18901,18901,1243515588,1,240100400098,1,251.8,125.85,
89,121024,9260116551,18901,18901,1243515588,1,240100400125,1,114.2,44.6,
31,121060,9260128428,18907,18907,1243568955,1,220200300096,1,172.5,78.5,
171,120138,1600101555,18916,18916,1243643970,1,220200200035,1,101.5,46.25,
70079,99999999,2600100039,18916,18919,1243644877,3,240200100098,1,14.6,6.75,
41,120124,1600101527,18918,18918,1243661763,1,240100100463,2,29.4,6.05,
69,121065,9260116402,18918,18918,1243670182,1,230100500004,1,3.2,1.35,
31,121061,9260128428,18919,18919,1243680376,1,220200100190,1,63.5,29.95,
10,121053,9260129395,18932,18932,1243797399,1,240300100028,2,1066.4,251.35,
10,121053,9260129395,18932,18932,1243797399,1,240300300065,1,321.5,146.35,
41,120128,1600101527,18933,18933,1243799681,1,220100100354,1,17,8.45,
41,120128,1600101527,18933,18933,1243799681,1,220100800096,3,222.3,35.3,
10,120732,9260129395,18934,18934,1243815198,1,230100500092,4,471.2,49.05,
10,120732,9260129395,18934,18934,1243815198,1,230100500096,1,35.5,17.25,
171,120127,1600101555,18935,18935,1243817278,1,220101400328,1,19,8.85,
908,99999999,9050100023,18942,18946,1243887390,2,230100700008,1,519.3,253.2,
34,121068,9260111379,18949,18949,1243951648,1,230100600030,1,86.3,41.4,
90,121028,9260111614,18950,18950,1243960910,1,210200100009,2,69.4,15.5,
215,120175,1600102721,18951,18951,1243963366,1,240600100080,2,60.8,9.2,
171,120124,1600101555,18954,18954,1243991721,1,240100100354,1,29.9,14.3,
70187,99999999,2600100035,18954,18959,1243992813,2,220100100421,1,8.2,4.15,
2806,99999999,8010100089,18961,18965,1244066194,2,240100100159,1,31.4,13.9,
2806,99999999,8010100089,18961,18965,1244066194,2,240100100605,3,144.6,20.75,
14104,99999999,4750100001,18964,18967,1244086685,3,220100100516,2,80.4,20.2,
14104,99999999,4750100001,18964,18967,1244086685,3,220100100631,2,114.2,28.65,
45,121107,9260104847,18966,18966,1244107612,1,240700100001,5,118,12.3,
45,121107,9260104847,18966,18966,1244107612,1,240700400031,2,126,31.6,
45,121109,9260104847,18967,18967,1244117101,1,240700100007,2,45.7,9.3,
45,121109,9260104847,18967,18967,1244117101,1,240700100017,2,19.98,11.4,0.4
49,121117,9260104510,18967,18967,1244117109,1,240700400003,2,24.8,5.6,
31,121121,9260128428,18973,18973,1244171290,1,240800100042,3,760.8,105.3,
10,121092,9260129395,18974,18974,1244181114,1,240500200016,3,95.1,14.5,
10,121092,9260129395,18974,18974,1244181114,1,240500200122,2,48.2,11.5,
89,121118,9260116551,18976,18976,1244197366,1,240700200018,4,75.2,10.3,
5,121040,9260114570,18987,18987,1244296274,1,220101400130,2,33.8,5.7,
;;;;
run;

data ORION.ORDER_ITEM;
   attrib Order_ID length=8 label='Order ID' format=12.;
   attrib Order_Item_Num length=8 label='Order Item Number';
   attrib Product_ID length=8 label='Product ID' format=12.;
   attrib Quantity length=8 label='Quantity Ordered';
   attrib Total_Retail_Price length=8 label='Total Retail Price for This Product' format=DOLLAR13.2;
   attrib CostPrice_Per_Unit length=8 label='Cost Price Per Unit' format=DOLLAR13.2;
   attrib Discount length=8 label='Discount in percent of Normal Total Retail Price' format=PERCENT.;

   infile datalines dsd;
   input
      Order_ID
      Order_Item_Num
      Product_ID
      Quantity
      Total_Retail_Price
      CostPrice_Per_Unit
      Discount
   ;
datalines4;
1230058123,1,220101300017,1,16.5,7.45,
1230080101,1,230100500026,1,247.5,109.55,
1230088186,1,220200300082,1,71,32.3,
1230106883,1,240600100080,1,28.3,8.55,
1230147441,1,240600100010,2,32,6.5,
1230165286,1,240800100016,2,256.4,57.05,
1230310090,1,230100500089,1,140.3,58.4,
1230315085,1,240200200039,3,63.6,8.8,
1230333319,1,240100400005,1,234.6,115.95,
1230338566,1,240800200062,1,35.4,16.15,
1230338566,2,240800200063,2,73.8,16.85,
1230371142,1,240500100004,2,127,28,
1230371142,2,240500200003,1,23.2,11.1,
1230404278,1,220200300002,2,75,17.05,
1230440481,1,230100600005,1,129.8,63.2,
1230450371,1,230100600018,2,128.4,32.2,
1230453723,1,240500200056,1,24.1,11.55,
1230455630,1,240200100233,2,91.8,22.45,
1230478006,1,230100100025,2,60.6,13.15,
1230498538,1,230100300006,1,68.5,34.35,
1230500669,1,240200100131,2,148.6,41.35,
1230503155,2,220101400310,1,31.8,14.2,
1230570602,1,220200100228,1,165.4,82.8,
1230591673,1,220200200024,3,178.5,32.25,
1230591675,1,240500100039,1,34.5,15.4,
1230591684,1,240200100076,4,1796,246.55,
1230613855,1,220101400096,2,136.4,31.05,
1230619748,1,220200100092,1,83,41.6,
1230619748,3,220200300005,3,345,52.35,
1230642273,1,230100500082,1,126.1,58.6,
1230657844,1,240100100646,1,109.9,46.8,
1230690733,1,240200100043,2,282.4,69.4,
1230699509,1,220100100044,1,102.1,48.65,
1230699509,2,220100400005,1,81.3,40.75,
1230700421,1,230100100006,1,176,74.55,
1230700421,2,230100500045,2,2.6,0.6,
1230700421,3,230100500068,2,3.4,0.8,
1230738723,1,230100600026,2,237.2,59.4,
1230744524,1,220100700024,1,99.7,47.45,
1230744524,2,220101000002,1,17.7,8,
1230745294,1,220200100179,1,134.5,67.35,
1230754828,1,220100100272,3,68.4,11.5,
1230754828,2,220101400269,4,268,29.8,
1230771337,1,230100500012,3,221.7,33.25,
1230778996,1,230100500096,1,35.5,17.25,
1230793366,1,240400200097,3,1250.4,124.2,
1230804171,1,240500200073,3,148.5,20.65,
1230825762,1,230100500093,2,265.6,55.85,
1230841456,1,240700400024,2,127.2,33.15,
1230841466,1,240500100062,2,109.2,23.85,
1230841466,2,240500200130,2,56,11.7,
1230885738,1,220101300017,2,33,7.45,
1230885738,2,220101400098,3,97.2,14.85,
1230912536,1,240500200121,2,50.8,12.1,
1230931366,1,240200200007,2,166.8,8.35,
1230931366,2,240200200061,2,261.8,52.45,
1230996953,1,240500200141,2,202.2,48.1,
1231002241,1,220101200029,1,52.3,22.65,
1231008713,1,240200200039,2,42.4,8.8,
1231014780,2,240100400043,4,1064,131.5,
1231023774,1,230100500024,1,22.9,10.85,
1231023774,2,230100600015,1,78.2,39.2,
1231035308,2,230100600023,2,146.8,36.8,
1231071449,1,240400200057,2,257,58.05,
1231071449,2,240400200066,2,27.6,6.3,
1231077006,1,230100500095,2,193.8,40,
1231094514,1,230100500074,4,544,51.3,
1231094514,2,230100600005,2,259.6,63.2,
1231135703,1,210200900004,2,92,16.05,
1231135703,2,210201000050,2,39,8.95,
1231154537,1,210200600064,2,69.6,14.85,
1231169108,1,220200300157,3,220.2,36.65,
1231176288,1,240500200100,2,45.4,10.85,
1231176768,1,220100100418,2,57.8,14.55,
1231176768,2,220101400036,2,94.6,17.8,
1231188317,1,220100900029,1,30.8,12.35,
1231194004,1,240100100610,2,122,27.55,
1231194004,2,240100400143,2,330,82.6,
1231204878,1,230100600017,2,111.4,27.95,
1231206746,1,240200100232,1,28.2,14.2,
1231227910,1,240200200013,3,1266,42.2,
1231231220,1,220101400306,2,145.2,33.1,
1231259703,1,240200100051,3,420.9,72,
1231270767,1,230100600022,2,168.2,42.15,
1231292064,1,220101400060,3,96.3,14.7,
1231292064,2,220101400117,2,91.2,20.85,
1231305521,1,220200100035,2,125.2,31.4,
1231305531,1,220200100090,2,177.2,44.4,
1231314893,1,240700200024,2,32,6.35,
1231316727,1,240100400076,2,224.6,68.6,
1231316727,2,240100400143,2,330,82.6,
1231317443,1,230100700002,2,440,135,
1231341359,1,220200200018,2,132.8,30.25,
1231392762,1,230100600023,2,146.8,36.8,
1231414059,1,240800200008,1,150.25,60.1,
1231453831,1,240200100052,1,99.7,51.4,
1231453831,2,240200200015,1,24,10.55,
1231459509,1,240800200062,1,35.4,16.15,
1231468750,1,220100100153,1,50,25.1,
1231500373,1,220101200006,1,52.2,20.95,
1231501254,1,220100700052,1,106.1,50.5,
1231522431,1,240100100065,1,34.7,13.8,
1231544990,1,220101400385,1,24.8,12.35,
1231614059,1,220101200020,1,55.9,24.2,
1231619928,1,230100600036,1,103.2,50.4,
1231642296,1,240400100003,1,20.6,7.35,
1231653765,1,230100200047,1,72.7,35.2,
1231657078,1,220200300116,1,84.2,38.35,
1231663230,1,240100100433,1,3,1.15,
1231734609,1,230100500091,1,191,80.45,
1231734615,1,230100600005,1,129.8,63.2,
1231757107,1,220100100568,1,84.1,42.15,
1231773634,1,220101400018,2,45.6,10.45,
1231780610,1,240100400080,1,219.9,109.9,
1231842118,1,240700300002,2,43.98,7.25,
1231844415,1,240700400004,2,26.4,5.95,
1231844415,2,240700400008,2,55.8,12.1,
1231858937,1,220200300079,2,128.6,28.65,
1231861295,2,240200100154,2,53.2,11.95,
1231891098,2,220101400091,2,65.6,15,
1231896710,1,230100500087,1,93.8,39.05,
1231898348,1,220101400289,4,240.8,27.4,
1231908237,1,240200100180,2,243.2,62.9,
1231928627,1,240100400070,1,175.9,127.95,
1231930216,1,220100300008,4,342.8,34.35,
1231936241,1,220101400017,2,22.2,5,
1231950921,1,230100500093,2,265.6,55.85,
1231950921,2,230100600030,1,86.3,41.4,
1231952752,2,220100100298,2,105.8,26.55,
1231953192,2,240200100052,2,199.4,51.4,
1231956902,1,220101400276,2,136.8,31.2,
1231976710,1,240300100020,4,56.4,6.05,
1231976710,2,240300100032,2,1200.2,300,
1231982684,1,240400300033,3,107.1,14.35,
1231986335,1,230100500008,1,38,16.8,
1232003930,1,240200100124,2,49,12.35,
1232007693,1,240100400044,1,353.6,174.75,
1232007693,2,240100400049,1,421.2,212.95,
1232007700,1,230100100045,2,249.6,53.6,
1232007700,2,230100200019,2,398.2,95.65,
1232007700,3,230100500056,1,8,3.5,
1232087464,1,230100600022,4,336.4,42.15,
1232092527,1,220100200004,1,6.5,2.6,
1232092527,2,220100900006,1,88.4,35.45,
1232092527,3,220101400150,1,28.2,12.9,
1232161564,1,220100100197,1,101.3,50.75,
1232173841,1,240100100581,1,28,11.55,
1232173841,2,240100400147,1,248.3,122.75,
1232217725,1,230100100062,2,283.4,61,
1232240447,1,230100200059,2,77.6,16.65,
1232241009,1,240200200039,1,22.2,9.2,
1232307056,1,230100500081,2,146,30.35,
1232311932,1,220100300025,2,206,42.4,
1232331499,1,230100100051,2,369.8,78.15,
1232373481,1,220200100229,1,165.5,82.85,
1232410925,1,240800200030,1,47.7,18.8,
1232455720,1,240600100017,1,53,23.25,
1232478868,1,240500200009,1,14.1,5.95,
1232478868,2,240500200092,1,33.6,16.15,
1232517885,1,240200100226,1,183.9,86.65,
1232530384,1,240700200019,1,16.9,8.6,
1232530393,1,220100100125,1,33.4,16.8,
1232530393,2,220100100513,1,63.9,32.05,
1232530393,3,220100300019,1,35.6,16.7,
1232554759,1,230100600022,1,84.1,42.15,
1232590052,1,240400300013,1,51.8,21.6,
1232590052,2,240400300035,1,19.1,7.7,
1232601472,1,230100500094,2,173.2,34.1,
1232618023,1,240200100183,1,95.7,47.95,
1232648239,1,210201000126,1,6.5,2.3,
1232654929,1,240500100017,4,214,23.75,
1232654929,2,240500100029,1,58.9,26.1,
1232672914,1,240200100101,2,38.8,10.2,
1232672914,2,240200200011,2,271.4,13,
1232698281,1,230100600035,1,29.4,14.15,
1232709099,2,220101400145,1,16.7,7.75,
1232709115,1,240700100001,3,70.8,12.3,
1232723799,1,210200600112,1,21.8,9.25,
1232728634,1,240100100403,1,168.7,76.55,
1232758397,1,220100500018,1,65.8,30,
1232770549,1,240700400004,2,26.4,5.95,
1232770549,2,240700400036,2,12.4,2.75,
1232770553,1,220100800097,1,48.1,22.9,
1232770553,2,220101200024,1,26.4,11.45,
1232777080,1,230100500012,1,73.9,33.25,
1232777080,2,230100600023,1,73.4,36.8,
1232790793,1,230100200074,1,50.1,24.5,
1232805509,1,220100100304,1,61.3,30.75,
1232805509,2,220101400006,1,61.2,23.25,
1232857157,1,230100600030,2,172.6,41.4,
1232889267,1,230100200054,3,407.4,61.8,
1232897220,1,240100400129,3,712.2,111,
1232936635,1,230100600030,2,172.6,41.4,
1232946301,1,220101400061,2,102,23.3,
1232956741,1,230100500008,2,76,16.8,
1232972274,1,230100200054,1,135.8,61.8,
1232972274,2,230100500056,1,8,3.5,
1232985693,1,240100100186,1,273,122.8,
1232998740,1,240700100011,3,80.97,10.23,
1233003688,1,240100100535,1,28.6,12.95,
1233019549,1,240100100410,2,43,9.85,
1233049735,2,220101400216,2,48.8,11.2,
1233066745,1,230100600022,1,84.1,42.15,
1233078086,1,220200200071,2,200.2,43.5,
1233092596,1,240300100048,1,15.5,6.7,
1233131266,1,240400300039,2,39.2,7.9,
1233166411,1,240100100734,1,10.1,4.15,
1233167161,1,240200100095,2,237,52.55,
1233243603,1,240700200004,2,8.4,2.2,
1233248920,1,220100700042,2,171.2,36.35,
1233248920,2,220101400387,3,37.8,5.85,
1233270605,1,210200600085,2,75.2,17,
1233280857,1,220100100609,3,173.7,29.05,
1233315988,1,240300200018,1,87.2,39.7,
1233315988,2,240300300071,1,138,60.1,
1233378724,1,240300100046,1,14.1,6.9,
1233482761,1,240700200021,2,38.8,10.35,
1233484749,1,240100400098,2,503.6,125.85,
1233484749,2,240100400136,3,272.7,45.4,
1233514453,1,240200200060,3,553.5,73.85,
1233531965,2,240100400112,1,114,54.8,
1233543560,1,240500200083,3,201.9,28,
1233545775,1,240200100007,2,49.4,11.8,
1233545775,2,240200100020,1,189.6,100.6,
1233545781,1,230100500020,1,6.2,2.85,
1233597637,1,240700400002,2,67.2,14.65,
1233618453,1,240700400020,1,73.4,38.25,
1233682051,1,240100100676,1,43.4,18.65,
1233689304,1,240300300070,3,1514.4,229.65,
1233738489,1,220200100026,2,134,33.6,
1233837302,1,230100500026,4,990,109.55,
1233837302,2,230100600036,3,309.6,50.4,
1233895201,1,220100100371,1,25.6,12.9,
1233895201,2,220101400238,2,113.8,25.95,
1233913196,1,230100400012,1,29.3,11.75,
1233920786,1,210200400020,1,38,19.1,
1233920786,2,210200400070,1,41.6,20.9,
1233920795,1,240800200010,1,120.4,48.1,
1233920805,1,230100500056,1,8,3.5,
1233998114,1,220100100101,1,59.7,29.95,
1233998114,2,220100400022,1,98.9,47.7,
1234033037,1,220100700022,1,53.7,22.75,
1234035449,1,220100100164,1,69.5,34.85,
1234092222,1,230100500023,1,7.2,3.1,
1234108035,1,240700400036,1,6.2,2.75,
1234133789,1,240100400046,1,328.3,165.95,
1234186330,1,240100400095,1,200.1,97.75,
1234198497,1,210200100017,1,39,17.35,
1234201455,1,220100800086,2,127,30.3,
1234235150,1,240200200060,2,369,73.85,
1234247283,1,220100400023,2,187.2,40.75,
1234255111,1,240800100039,3,257.4,39.9,
1234279341,1,230100500092,1,116.7,48.6,
1234301319,1,240700200010,4,105.6,10.1,
1234323012,1,240200100098,2,29.2,6.75,
1234323012,2,240200100101,2,39,10.3,
1234323012,3,240200200035,2,196,39.3,
1234348668,1,230100100053,2,92.6,20.9,
1234360543,1,230100100033,2,110.2,25.4,
1234373539,1,230100100013,2,226.2,58.9,
1234414529,1,240100100654,2,90.4,18.15,
1234414529,2,240100400136,2,181.8,45.4,
1234419240,1,240700100013,5,119.95,9.75,
1234437760,1,230100600028,2,193.4,48.45,
1234534069,1,240800100026,4,525.2,58.55,
1234537441,1,240100200001,1,16,6.35,
1234538390,1,220200300015,1,115,52.4,
1234538395,1,210200500006,1,24,11.95,
1234538395,2,210201000167,1,33.8,15.4,
1234548669,1,240100200002,2,30.8,6.1,
1234588648,1,230100500101,1,138.7,62.5,
1234588648,2,230100600024,1,76.1,38.15,
1234659163,1,230100700008,1,504.2,245.8,
1234665265,1,240100100063,2,48.4,9.75,
1234709803,1,220100100304,2,122.6,30.75,
1234727966,1,240700400004,1,13.2,5.95,
1234891576,1,240200100226,1,183.9,86.65,
1234897732,1,240100100672,1,197.9,84.9,
1234912051,1,230100700002,1,220,135,
1234958242,1,230100500016,1,11.9,5.4,
1234972570,1,230100200048,1,68.7,34.45,
1235065689,1,240700400014,1,17,7.8,
1235176942,1,240200100021,1,2.7,1.2,
1235176942,2,240200100246,1,16.2,7.9,
1235236723,1,240400200094,1,254.2,115.6,
1235275513,1,220100100241,1,29.7,14.95,
1235306679,1,240100200014,1,55.4,22.8,
1235339375,1,220101400003,1,91.6,41.75,
1235384426,1,240700100012,1,21.99,9.1,
1235581267,1,240300200053,1,57.8,26.25,
1235591214,1,240400200022,1,93.4,38.95,
1235591214,2,240400200036,1,55.5,25.1,
1235611754,1,240400300033,2,71.4,14.35,
1235611754,2,240400300035,2,38.2,7.7,
1235744141,1,230100500081,2,146,30.35,
1235744141,2,230100700009,3,1687.5,287.1,
1235830338,1,220200100202,1,92,46.1,
1235830338,2,220200200073,1,145.9,66.35,
1235856852,1,220100100019,1,27.7,13.95,
1235856852,2,220101400152,1,13.1,5.9,
1235881915,1,240700400004,2,26.4,5.95,
1235913793,1,220101200025,1,26.7,11.6,
1235926178,1,210200200022,2,36,7.05,
1235963427,1,220100700024,3,313.8,49.8,
1235963427,2,220100900029,1,31.4,12.55,
1235969361,1,220200300117,2,199.2,45.35,
1236008254,1,220101400328,2,38,8.85,
1236017640,1,220101400092,1,57.7,25.7,
1236028541,1,230100500056,2,16,3.5,
1236055696,2,240800100041,1,292.5,121.75,
1236066649,1,230100300010,1,46.7,18.75,
1236113431,1,230100200066,2,25.8,5.45,
1236128445,1,240200100053,2,174.4,44.95,
1236128456,1,230100500006,2,16.8,3.45,
1236128456,2,230100600016,2,154,38.6,
1236183578,1,240500100026,2,110.4,24.5,
1236183578,2,240500200007,3,28.5,4.55,
1236216065,1,240200100118,1,175.5,89.55,
1236270219,1,240100100118,2,214.6,42.8,
1236349115,1,240200100221,4,396,49.6,
1236349115,2,240200200024,2,250.8,12.5,
1236369939,1,240100100365,1,191.6,87.4,
1236369939,2,240100400037,1,231,113.65,
1236450707,1,240700100007,2,45.7,9.3,
1236450707,2,240700200021,2,39,10.45,
1236483576,1,240200200071,4,74.8,10,
1236601701,1,240500100015,2,116.2,25.8,
1236673732,1,230100700008,3,1542.6,250.7,
1236673732,2,230100700011,2,550.2,113.45,
1236694462,1,240200100056,2,82.4,19.9,
1236701935,1,210200300052,2,43.8,11.05,
1236765462,1,220101200015,2,48,10.4,
1236783056,1,240300200058,2,183.6,41.7,
1236783056,2,240300300090,3,1561.8,237.05,
1236852196,1,240600100016,1,55.3,21.9,
1236923123,1,240100100031,1,3.7,1.3,
1236965430,1,240200100050,2,27,6.65,
1237049089,1,240500100027,1,45.5,20.2,
1237049089,2,240500200004,1,35.1,16.8,
1237165927,1,240500100057,2,76.8,17.1,
1237218771,1,230100500072,1,26.1,11.9,
1237272696,1,240100400069,2,186.6,39.95,
1237272696,2,240100400142,2,338.8,84.85,
1237327705,1,220100100298,1,52.9,26.55,
1237327705,2,220100100617,1,37.3,18.75,
1237331045,1,240100100366,1,16.3,7.8,
1237370327,1,230100600031,1,88.5,42.45,
1237450174,1,220100800001,2,77.2,18.35,
1237450174,2,220101400349,1,11.9,4.8,
1237478988,1,230100200004,1,99.9,50.05,
1237507462,1,230100400025,3,51,6.6,
1237507462,2,230100700009,1,568.1,289.95,
1237517484,1,240400300013,1,54.3,22.6,
1237531878,1,220100800098,2,103,24.55,
1237603569,1,220200300053,1,59,26.85,
1237664026,1,230100200004,1,99.9,50.05,
1237670443,1,240800200034,1,74.8,34,
1237695520,1,220200100129,3,240,39.45,
1237751376,1,240100400043,1,279.3,138.1,
1237789102,1,210200300007,1,50.4,25.3,
1237825036,1,240400300039,2,39.2,7.9,
1237890730,1,220101400265,2,74.2,16.55,
1237890730,2,220101400387,4,50.4,5.85,
1237894107,1,220100700027,2,119,29.85,
1237894966,1,240200100050,2,19.98,6.65,0.3
1237928021,1,240800100074,3,949.8,126.7,
1237928021,2,240800200037,3,164.4,23.75,
1237952867,1,220100100580,2,113,28.35,
1237974997,1,240400300013,3,162.9,22.6,
1237989406,1,230100100018,2,318.2,67.4,
1238013821,1,240200200026,3,312,41.65,
1238053337,1,230100700008,1,514.2,250.7,
1238161695,1,240100100477,2,17,3.3,
1238168538,1,230100200073,1,46.9,20.2,
1238231237,1,240700200021,1,19.6,10.55,
1238255107,2,220100100581,1,38.7,19.45,
1238273927,2,220100700022,3,170.7,24.1,
 1238305578,1,240200100246,1,16.2,7.9,
1238319276,1,240100100305,1,8.9,4.1,
1238319281,1,240700100007,1,22.85,9.3,
1238353296,1,220101300001,2,67.2,14.95,
1238353296,2,220101400138,3,140.1,23.45,
1238367238,1,220100800001,1,38.6,18.35,
1238370259,1,230100600028,1,96.7,48.45,
1238377562,1,230100600016,2,154,38.6,
1238387237,1,240500200006,1,15.4,7.4,
1238387237,2,240500200099,1,52.6,23.95,
1238393448,1,230100500094,1,86.6,34.1,
1238418441,1,220200100235,1,82.6,41.4,
1238426410,1,230100300006,1,68.5,34.35,
1238426415,1,230100700011,1,283.3,116.85,
1238440880,1,220100100530,1,52.2,26.2,
1238466584,1,240100100687,1,47.6,19.8,
1238474357,1,230100700011,2,566.6,116.85,
1238510159,1,240300200009,1,48.7,18.15,
1238510159,2,240300300024,1,54.1,23,
1238553101,1,240400200091,1,217,90.4,
1238583554,1,240300200058,2,183.6,41.7,
1238605995,1,210201100004,1,47.9,20.9,
1238637449,1,240100400151,1,419,209.45,
1238640650,2,220200200080,2,358.6,83.55,
1238640650,3,220200300111,1,7.2,3.25,
1238646479,1,230100200043,1,56.7,27.25,
1238646484,1,230100300013,1,24.8,5,
1238674844,1,240100100508,1,48.3,19.25,
1238678581,1,240200100181,1,109.3,56.6,
1238678581,2,240200200080,2,187.6,9.4,
1238686430,1,220101400201,1,40.6,18.05,
1238696385,1,240100100312,2,36.2,7.7,
1238712056,1,220100100185,1,97.6,48.9,
1238712056,2,220100700002,1,186.8,89.1,
1238721932,1,240100400083,1,109.5,54.7,
1238735750,1,240700400020,2,155.6,40.5,
1238761699,1,240100100707,1,95,39.4,
1238761699,2,240100200012,1,34.6,14.4,
1238761708,2,240700400017,1,46,21.55,
1238792488,1,220100100458,2,244.8,61.15,
1238797437,1,230100100063,2,767.8,176.05,
1238805678,1,240100100714,1,92.8,39.85,
1238805678,2,240100400006,1,229.1,113.25,
1238805703,2,220101400285,1,59.4,27.05,
1238812262,1,220100100309,1,96.3,48.25,
1238812262,2,220101400373,1,51.8,23.65,
1238846184,1,220200100035,1,62.6,31.4,
1238856867,1,220101000002,1,17.7,8,
1238870441,1,240700200007,1,5.1,2.2,
1238872273,1,240100100434,1,16.4,8.05,
1238890499,1,240100200005,1,34.5,14.55,
1238910092,1,220100100309,2,192.6,48.25,
1238910092,2,220101400363,2,78,16.95,
1238928257,2,240600100181,1,37.4,16.3,
1238968334,1,220100100025,1,17.4,8.8,
1238969250,1,220200300016,1,101,46.05,
1238969250,2,220200300155,1,76.3,35.55,
1238985782,1,240100100703,1,79.9,34.3,
1239003827,1,230100600016,1,77,38.6,
1239018454,1,240200100073,1,22.3,12.6,
1239018454,2,240200200068,1,313.8,159.15,
1239057268,1,210200500006,2,48,11.95,
1239082349,1,220100700040,3,155.7,26.05,
1239172417,1,240100100148,2,51.6,10.95,
1239179935,1,240700300002,1,21.99,7.25,
1239194032,1,220100100192,1,27.4,13.8,
1239196953,1,220100900031,3,267.6,35.7,
1239201604,1,240100400129,3,712.2,111,
1239204199,1,220100800086,1,69.2,33.05,
1239204199,2,220101400310,3,96.3,14.3,
1239220388,1,240100100184,1,190.4,88.8,
1239226632,1,220200100190,3,190.5,29.95,
1239248786,1,240500100015,3,174.3,25.8,
1239248786,2,240500200093,1,41.7,19.75,
1239251768,1,210200400029,1,48.7,24.45,
1239251772,1,220200100104,1,94.3,47.25,
1239258470,1,240400200003,1,6.2,3,
1239266107,1,230100600038,1,112.5,54.95,
1239284726,1,210200900021,1,57.2,22.95,
1239312711,1,230100600016,3,231,38.6,
1239312711,2,230100700011,3,849.9,116.85,
1239320891,1,230100200006,3,279.3,46.65,
1239346133,1,220100100273,3,116.4,19.5,
1239346133,2,220100300042,1,208.6,84.35,
1239353855,1,230100500066,1,12.7,6.1,
1239368476,1,240700100012,3,65.97,9.1,
1239408849,1,240700100017,2,53.2,11.4,
1239410348,1,220100800071,1,32.8,15.7,
1239411275,1,240100100718,3,201,29.55,
1239416627,1,220100800040,2,248.2,59.05,
1239418524,2,220100100536,2,408.8,102.3,
1239427506,1,240500200098,2,88,20.95,
1239427511,1,220200200015,2,210.2,47.75,
1239427511,2,220200200038,2,76.4,18.95,
1239435455,1,240500200061,2,116.8,24.3,
1239442095,1,210201000198,2,120.2,26.8,
1239498112,1,240200200044,2,97.8,19.6,
1239538098,1,240800100018,1,108.1,48.1,
1239543223,1,220100100635,2,172.8,43.3,
1239543223,2,220101300012,2,38.6,8.75,
1239545769,1,240100100152,3,509.4,82.95,
1239615368,1,240800200002,1,178.875,71.55,
1239693951,1,220100900035,2,83.6,19.45,
1239713040,1,230100100052,1,185.1,77.7,
1239713040,2,230100600028,4,386.8,48.45,
1239713046,1,230100500058,4,66.8,7.25,
1239713046,2,230100500082,2,252.2,58.6,
1239713046,3,230100600031,2,177,42.45,
1239735632,1,230100700009,2,1136.2,289.95,
1239744161,1,240400200003,1,6.2,3,
1239744161,2,240400300035,2,38.2,7.7,
1239744164,1,210200500010,2,201.2,43.45,
1239765451,1,220101400004,2,211.4,48.15,
1239765451,2,220101400148,2,21,4.75,
1239785436,1,230100600031,4,354,42.45,
1239821232,1,230100500013,2,18.8,4.75,
1239823829,1,240200200081,2,214.6,10.75,
1239836937,1,240500100043,2,52.4,8.85,
1239874523,1,220101400047,2,48.4,11.1,
1239932984,1,220200200079,2,285.8,64.85,
1239932984,2,220200300129,5,406,37.05,
1239962634,1,230100500080,2,50,12.2,
1239972644,2,220101400237,1,102.9,46.9,
1239994933,2,220200300082,3,213,32.3,
1240051245,1,230100100028,1,250.9,104.2,
1240051245,2,230100200022,3,359.1,56.9,
1240060066,1,230100100062,1,141.7,61,
1240137702,1,230100300023,1,36,15,
1240173354,1,240200100225,2,306.2,77.85,
1240187143,1,240100400100,1,154.6,116.6,
1240201886,1,220101400339,1,32.3,14.75,
1240283215,1,240200100118,1,175.5,89.55,
1240283215,2,240200100164,2,112.2,28.15,
1240283215,3,240200100227,2,323.8,75.9,
1240286078,1,230100600005,1,129.8,63.2,
1240301832,2,220200300044,1,42.4,19.25,
1240306942,1,230100500056,1,8,3.5,
1240306942,2,230100600018,1,64.2,32.2,
1240314947,1,230100600028,1,96.7,48.45,
1240314956,1,230100500094,1,86.6,34.1,
1240326394,1,240500100029,1,58.9,26.1,
1240355393,1,230100600022,1,84.1,42.15,
1240357857,1,240100100458,1,6.7,2.95,
1240379679,1,230100200004,1,99.9,50.05,
1240379679,2,230100500077,1,173,72.75,
1240387741,1,240800200020,1,187.2,85.15,
1240430921,1,240400200093,1,155.8,64.95,
1240446608,1,220100100553,1,35,17.6,
1240446608,2,220100700046,2,305.8,72.9,
1240447572,1,230100200056,1,270,125.65,
1240461993,1,220100300020,1,11.3,4.55,
1240461993,2,220100800009,1,52.5,24.95,
1240461993,3,220101400276,1,68.4,31.2,
1240485814,1,220101400290,1,74.8,34.1,
1240503636,1,240100100498,1,10.4,4.05,
1240509842,1,210200500007,1,39.4,17.8,
1240512744,1,240300100046,2,28.8,7.05,
1240543426,1,240700400008,1,27.9,12.1,
1240549230,1,220200100012,1,58.7,28.25,
1240568966,1,220200100226,1,133.2,66.7,
1240581932,1,210201000199,3,124.2,18.85,
1240588370,1,230100500082,1,126.1,58.6,
1240599396,1,230100700002,1,220,135,
1240599396,2,230100700004,1,360,199,
1240604971,1,230100600030,1,86.3,41.4,
1240613362,1,230100100017,1,175.3,74.95,
1240640802,1,220200200071,1,108.2,47,
1240692950,1,240500100039,1,34.5,15.4,
1240752957,1,220100500003,2,195.4,43.05,
1240782710,1,230100500066,1,12.7,6.1,
1240782710,2,230100600005,1,129.8,63.2,
1240856801,1,230100600028,2,193.4,48.45,
1240856801,2,230100600039,1,124.7,59.65,
1240870047,1,230100100015,2,213.8,45.5,
1240886449,1,210200200023,1,19.8,8.25,
1240903120,1,220100100592,2,62.2,15.65,
1240903120,2,220100100629,4,213.2,26.75,
1240936966,1,230100100028,2,501.8,104.2,
1240936966,2,230100600026,1,118.6,59.4,
1240952907,1,220200100132,2,179,44.85,
1240961599,1,230100200025,4,1103.6,125.25,
1240961599,2,230100600015,1,78.2,39.2,
1241008047,1,220101400177,2,190,43.25,
1241054779,1,240800200021,2,195.6,42.45,
1241063739,1,240800200035,6,160.8,12.15,
1241066216,1,240200100225,2,306.2,77.85,
1241077103,1,220200100153,1,48.2,24.2,
1241086052,1,210200500002,3,37.8,5.7,
1241147641,1,240200200091,2,362.6,72.6,
1241164647,1,240700100001,1,23.6,12.3,
1241235281,1,240300100001,1,72.6,36.25,
1241244297,1,240500100041,2,258.2,51.7,
1241244297,2,240500200042,2,81.2,19.35,
1241244297,3,240500200101,3,358.2,49.75,
1241263172,1,240100400004,1,102.4,51.15,
1241263172,2,240100400062,1,113.2,54,
1241280554,1,240300200050,2,78.6,17.9,
1241286432,1,240800200009,2,174.4,34.9,
1241298131,1,240100400058,1,37.4,29.65,
1241359997,1,220100100105,1,117.6,58.9,
1241371145,1,240100400046,2,656.6,165.95,
1241371145,2,240100400085,2,129,30.95,
1241390440,1,240200100046,2,36.2,9.15,
1241461856,2,220100100523,1,29.4,14.8,
1241498877,1,220200200020,1,173.4,78.75,
1241561055,1,220101400088,5,192,17.5,
1241581744,1,230100600005,1,129.8,63.2,
1241581744,2,230100700004,1,360,199,
1241623505,1,240700400017,1,46.9,21.95,
1241645664,1,240200200020,1,150.1,14,
1241652707,1,240700400017,3,140.7,21.95,
1241686210,1,220100100235,1,32.6,16.4,
1241715610,1,240700200019,1,16.9,8.6,
1241731828,1,240100100410,1,22.7,10.4,
1241731828,2,240100100665,1,41.5,17.25,
1241789227,1,240200100211,1,121,60.65,
1241895594,1,240200100034,2,24.4,4.45,
1241895594,2,240200100050,1,13.5,6.65,
1241909303,1,240200200081,1,107.3,10.75,
1241924674,2,220100100278,1,23,11.6,
1241924674,3,220101300006,1,27.3,12.25,
1241930625,1,220200100012,1,58.7,28.25,
1241930625,2,220200100171,1,56.3,31.05,
1241930625,3,220200200014,1,90,40.9,
1241977403,1,240400300035,1,19.1,7.7,
1242012259,1,220100300037,2,231.6,48.7,
1242012259,2,220101400032,2,19.2,4.85,
1242012269,1,220100300019,4,142.4,16.7,
1242012269,2,220101400216,3,73.8,11.3,
1242035131,1,240200200061,1,147.1,58.85,
1242052019,1,230100600013,1,71.7,35.95,
1242076538,1,220200200022,1,57.3,33.9,
1242130888,1,240500100017,3,160.5,23.75,
1242140006,1,240100100159,1,31.4,13.9,
1242140009,1,240100100434,1,16.4,8.05,
1242140009,2,240100400128,1,192.4,89.9,
1242142983,1,240100100317,1,25.2,11.05,
1242142983,2,240100100602,3,74.7,10.65,
1242149082,1,210200300006,1,14.3,7.7,
1242149082,2,210200900033,4,56.8,6.45,
1242159212,1,230100200029,2,446.6,101.65,
1242161468,1,240100100232,3,9.6,1.3,
1242161468,2,240100400080,1,222,110.95,
1242162201,2,240200100053,2,174.4,44.95,
1242173926,1,230100600026,3,355.8,59.4,
1242185055,1,240300100049,1,19.9,8.9,
1242214574,2,240200100230,2,29.4,6.65,
1242229985,1,220100100189,2,189.4,47.45,
1242259863,1,240200100157,2,706.2,196.15,
1242265757,1,240700100004,3,79.8,13.75,
1242449327,1,240100100679,2,91.6,19.5,
1242458099,1,230100400007,1,12.2,4.9,
1242467585,1,240100100690,2,403,86.1,
1242467585,2,240100100737,5,239.5,20.65,
1242477751,1,220200200036,2,120.4,27.4,
1242477751,2,220200200077,2,277.6,63.15,
1242487980,1,220100400009,3,161.1,26.95,
1242493791,1,220200100009,2,126.8,30.5,
1242502670,1,230100500056,2,16,3.5,
1242502670,2,230100500087,2,195,40.55,
1242515373,1,240200100057,4,168,20.25,
1242534503,1,240200100118,4,702,89.55,
1242557584,1,240500200083,2,134.6,28,
1242559569,2,220100700023,1,73.99,44.25,0.3
1242568696,1,240100100029,2,239,51.7,
1242568696,2,240100400098,3,755.4,125.85,
1242578860,1,240200100173,4,1937.2,247.7,
1242610991,1,220101400047,2,48.4,11.1,
1242647539,1,240700200009,2,56,11.35,
1242657273,1,220100100410,3,33.6,5.7,
1242676325,1,240400200016,2,391.8,55.55,
1242676325,2,240400300033,2,71.4,14.35,
1242691897,1,240500100062,2,110.2,24.05,
1242704147,1,220200200011,2,172.4,39.25,
1242704147,2,220200200025,3,214.5,31.65,
1242736731,1,240700200010,3,80.7,10.3,
1242773202,1,240600100185,2,70.2,15.6,
1242776452,1,240700400010,3,183.9,31.95,
1242782701,1,240500200081,3,403.5,56.05,
1242827683,1,240700300002,1,21.99,7.25,
1242836878,1,210201000067,2,60.6,13.5,
1242838815,1,210200500007,1,39.4,17.8,
1242838815,2,210200600056,1,50.4,22.75,
1242848557,1,240100100312,3,54.3,7.7,
1242923327,1,240200100081,2,16.6,3.65,
1242938120,1,240100200004,1,35.2,14.8,
1242977743,1,240400200012,2,351.4,75.95,
1243012144,1,240100100615,2,25.8,5.45,
1243012144,2,240100400083,2,219,54.7,
1243026971,1,230100500082,2,252.2,58.6,
1243039354,1,230100600003,1,17.6,7.75,
1243049938,1,220100300001,2,180.4,38.3,
1243110343,1,210200600067,2,134,28.9,
1243110343,2,210200900038,3,60.9,9.3,
1243127549,1,240400300035,1,19.1,7.7,
1243152030,1,230100400010,1,40.2,16.85,
1243152039,1,240500200003,2,47.6,11.4,
1243165497,1,240200100052,2,201.2,51.9,
1243165497,2,240200100116,3,658.5,124.9,
1243165497,3,240200100207,2,215.8,53.35,
1243198099,1,220200200018,3,199.2,30.25,
1243198099,2,220200300154,3,256.2,39.8,
1243218654,1,240100100554,2,127.6,27.5,
1243227745,1,230100500004,2,6.4,1.35,
1243263398,1,230100500074,1,136,51.3,
1243269405,1,230100600030,1,86.3,41.4,
1243279343,1,240500200082,2,78.4,16.45,
1243290080,1,220200100137,1,50.3,25.25,
1243290089,1,230100600015,1,78.2,39.2,
1243315613,1,210200500016,1,52.5,22.25,
1243398628,1,240200100053,1,87.2,44.95,
1243417726,1,210200700016,1,23.5,9.2,
1243462945,1,240600100102,1,46.1,19.7,
1243465031,1,210200600067,2,134,28.9,
1243485097,1,220200100002,2,78.2,19.65,
1243515588,1,240100400098,1,251.8,125.85,
1243515588,2,240100400125,1,114.2,44.6,
1243568955,1,220200300096,1,172.5,78.5,
1243643970,1,220200200035,1,101.5,46.25,
1243644877,1,240200100098,1,14.6,6.75,
1243661763,1,240100100463,2,29.4,6.05,
1243670182,1,230100500004,1,3.2,1.35,
1243680376,1,220200100190,1,63.5,29.95,
1243689572,1,230100400028,1,13.9,5.45,
1243797399,1,240300100028,2,1066.4,251.35,
1243797399,2,240300300065,1,321.5,146.35,
1243799681,1,220100100354,1,17,8.45,
1243799681,2,220100800096,3,222.3,35.3,
1243815198,1,230100500092,4,471.2,49.05,
1243815198,2,230100500096,1,35.5,17.25,
1243817278,1,220101400328,1,19,8.85,
1243854878,1,230100100015,1,106.9,45.5,
1243854878,2,230100300013,2,50,5.05,
1243854884,1,230100100062,1,141.7,61,
1243887390,1,230100700008,1,519.3,253.2,
1243951648,1,230100600030,1,86.3,41.4,
1243960910,1,210200100009,2,69.4,15.5,
1243963366,1,240600100080,2,60.8,9.2,
1243991721,1,240100100354,1,29.9,14.3,
1243992813,1,220100100421,1,8.2,4.15,
1244018739,1,240700100012,1,21.99,9.1,
1244066194,1,240100100159,1,31.4,13.9,
1244066194,2,240100100605,3,144.6,20.75,
1244086685,1,220100100516,2,80.4,20.2,
1244086685,2,220100100631,2,114.2,28.65,
1244107612,1,240700100001,5,118,12.3,
1244107612,2,240700400031,2,126,31.6,
1244117101,1,240700100007,2,45.7,9.3,
1244117101,2,240700100017,2,19.98,11.4,0.4
1244117109,1,240700400003,2,24.8,5.6,
1244171290,1,240800100042,3,760.8,105.3,
1244181114,1,240500200016,3,95.1,14.5,
1244181114,2,240500200122,2,48.2,11.5,
1244197366,1,240700200018,4,75.2,10.3,
1244296274,1,220101400130,2,33.8,5.7,
;;;;
run;

data ORION.ORGANIZATION_DIM;
   attrib Employee_ID length=8 label='Employee ID' format=12.;
   attrib Employee_Country length=$2 label='Employee Country';
   attrib Company length=$30 label='Company';
   attrib Department length=$40 label='Department';
   attrib Section length=$40 label='Section';
   attrib Org_Group length=$40 label='Group';
   attrib Job_Title length=$25 label='Job Title';
   attrib Employee_Name length=$40 label='Employee Name';
   attrib Employee_Gender length=$1 label='Employee Gender';
   attrib Salary length=8 label='Annual Salary' format=DOLLAR13.;
   attrib Employee_BirthDate length=8 label='Employee Birth Date' format=DATE9.;
   attrib Employee_Hire_Date length=8 label='Employee Hire Date' format=DATE9. informat=DATE9.;
   attrib Employee_Term_Date length=8 label='Employee Termination Date' format=DATE9. informat=DATE9.;
   attrib Manager_Levels length=8 label='Levels of Management';
   attrib Manager_Level1 length=8 label='Manager at 1. level';
   attrib Manager_Level2 length=8 label='Manager at 2. level';
   attrib Manager_Level3 length=8 label='Manager at 3. level';
   attrib Manager_Level4 length=8 label='Manager at 4. level';
   attrib Manager_Level5 length=8 label='Manager at 5. level';
   attrib Manager_Level6 length=8 label='Manager at 6. level';

   infile datalines dsd;
   input
      Employee_ID
      Employee_Country
      Company
      Department
      Section
      Org_Group
      Job_Title
      Employee_Name
      Employee_Gender
      Salary
      Employee_BirthDate
      Employee_Hire_Date:BEST32.
      Employee_Term_Date:BEST32.
      Manager_Levels
      Manager_Level1
      Manager_Level2
      Manager_Level3
      Manager_Level4
      Manager_Level5
      Manager_Level6
   ;
datalines4;
120101,AU,Orion Australia,Sales Management,Sales Management,Sales Management,Director,Patrick Lu,M,163040,7535,17348,,2,120261,120259,,,,
120102,AU,Orion Australia,Sales Management,Sales Management,Sales Management,Sales Manager,Tom Zhou,M,108255,4971,12205,,3,120101,120261,120259,,,
120103,AU,Orion Australia,Sales Management,Sales Management,Sales Management,Sales Manager,Wilson Dawes,M,87975,-2535,6575,,3,120101,120261,120259,,,
120104,AU,Orion Australia,Administration,Administration,Administration,Administration Manager,Kareen Billington,F,46230,-600,9132,,3,120101,120261,120259,,,
120105,AU,Orion Australia,Administration,Administration,Administration,Secretary I,Liz Povey,F,27110,6929,15826,,3,120101,120261,120259,,,
120106,AU,Orion Australia,Administration,Administration,Administration,Office Assistant II,John Hornsey,M,26960,-4026,6575,,4,120104,120101,120261,120259,,
120107,AU,Orion Australia,Administration,Administration,Shipping Charges,Office Assistant III,Sherie Sheedy,F,30475,-2536,6606,,4,120104,120101,120261,120259,,
120108,AU,Orion Australia,Administration,Goods Entrance,Stock Admin,Warehouse Assistant II,Gladys Gromek,F,27660,10280,18475,,4,120104,120101,120261,120259,,
120109,AU,Orion Australia,Administration,Goods Entrance,Stock Admin,Warehouse Assistant I,Gabriele Baker,F,26495,11306,18536,,4,120104,120101,120261,120259,,
120110,AU,Orion Australia,Administration,Goods Entrance,Stock Admin,Warehouse Assistant III,Dennis Entwisle,M,28615,-2233,8705,,4,120104,120101,120261,120259,,
120111,AU,Orion Australia,Administration,Security,Security Guards,Security Guard II,Ubaldo Spillane,M,26895,-2353,6879,,4,120104,120101,120261,120259,,
120112,AU,Orion Australia,Administration,Security,Security Guards,Security Guard I,Ellis Glattback,F,26550,4796,12600,,4,120104,120101,120261,120259,,
120113,AU,Orion Australia,Administration,Security,Security Guards,Security Guard II,Riu Horsey,F,26870,-4253,6575,,4,120104,120101,120261,120259,,
120114,AU,Orion Australia,Administration,Security,Security Guards,Security Manager,Jeannette Buddery,F,31285,-4345,6575,,4,120104,120101,120261,120259,,
120115,AU,Orion Australia,Administration,Service Center,Service,Service Assistant I,Hugh Nichollas,M,26500,10355,18110,,4,120104,120101,120261,120259,,
120116,AU,Orion Australia,Administration,Service Center,Service,Service Assistant II,Austen Ralston,M,29250,1259,8797,,4,120104,120101,120261,120259,,
120117,AU,Orion Australia,Engineering,Engineering,Cabinet Maker's Workshop,Cabinet Maker III,Bill Mccleary,M,31670,3176,11048,,4,120104,120101,120261,120259,,
120118,AU,Orion Australia,Engineering,Engineering,Cabinet Maker's Workshop,Cabinet Maker II,Darshi Hartshorn,M,28090,1249,10409,,4,120104,120101,120261,120259,,
120119,AU,Orion Australia,Engineering,Engineering,Electrical Workshop,Electrician IV,Lal Elleman,M,30255,5103,15341,,4,120104,120101,120261,120259,,
120120,AU,Orion Australia,Engineering,Engineering,Electrical Workshop,Electrician II,Krishna Peiris,F,27645,-4258,6575,,4,120104,120101,120261,120259,,
120121,AU,Orion Australia,Sales,Sales,Assorted Sports Articles,Sales Rep. II,Irenie Elvish,F,26600,-4169,6575,,4,120102,120101,120261,120259,,
120122,AU,Orion Australia,Sales,Sales,Assorted Sports Articles,Sales Rep. II,Christina Ngan,F,27475,-523,8217,,4,120102,120101,120261,120259,,
120123,AU,Orion Australia,Sales,Sales,Assorted Sports Articles,Sales Rep. I,Kimiko Hotstone,F,26190,3193,10866,17928,4,120102,120101,120261,120259,,
120124,AU,Orion Australia,Sales,Sales,Assorted Sports Articles,Sales Rep. I,Lucian Daymond,M,26480,1228,8460,,4,120102,120101,120261,120259,,
120125,AU,Orion Australia,Sales,Sales,Children Sports,Sales Rep. IV,Fong Hofmeister,M,32040,-391,8460,17744,4,120102,120101,120261,120259,,
120126,AU,Orion Australia,Sales,Sales,Children Sports,Sales Rep. II,Satyakam Denny,M,26780,11951,18475,,4,120102,120101,120261,120259,,
120127,AU,Orion Australia,Sales,Sales,Clothes,Sales Rep. II,Sharryn Clarkson,F,28100,8404,15645,,4,120102,120101,120261,120259,,
120128,AU,Orion Australia,Sales,Sales,Clothes,Sales Rep. IV,Monica Kletschkus,F,30890,11152,18567,,4,120102,120101,120261,120259,,
120129,AU,Orion Australia,Sales,Sales,Clothes,Sales Rep. III,Alvin Roebuck,M,30070,3248,10866,17256,4,120102,120101,120261,120259,,
120130,AU,Orion Australia,Sales,Sales,Clothes,Sales Rep. I,Kevin Lyon,M,26955,10575,18383,,4,120102,120101,120261,120259,,
120131,AU,Orion Australia,Sales,Sales,Golf,Sales Rep. I,Marinus Surawski,M,26910,8668,17167,,4,120102,120101,120261,120259,,
120132,AU,Orion Australia,Sales,Sales,Golf,Sales Rep. III,Fancine Kaiser,F,28525,-2462,8309,,4,120102,120101,120261,120259,,
120133,AU,Orion Australia,Sales,Sales,Golf,Sales Rep. II,Petrea Soltau,F,27440,11069,18536,,4,120102,120101,120261,120259,,
120134,AU,Orion Australia,Sales,Sales,Golf,Sales Rep. II,Sian Shannan,M,28015,-2400,6575,18443,4,120102,120101,120261,120259,,
120135,AU,Orion Australia,Sales,Sales,Indoor Sports,Sales Rep. IV,Alexei Platts,M,32490,4774,15249,17652,4,120102,120101,120261,120259,,
120136,AU,Orion Australia,Sales,Sales,Indoor Sports,Sales Rep. I,Atul Leyden,M,26605,8659,17198,,4,120102,120101,120261,120259,,
120137,AU,Orion Australia,Sales,Sales,Shoes,Sales Rep. III,Marina Iyengar,F,29715,8471,18322,,4,120102,120101,120261,120259,,
120138,AU,Orion Australia,Sales,Sales,Shoes,Sales Rep. I,Shani Duckett,F,25795,8592,18444,,4,120102,120101,120261,120259,,
120139,AU,Orion Australia,Sales,Sales,Shoes,Sales Rep. II,Fang Wilson,F,26810,11187,18506,,4,120102,120101,120261,120259,,
120140,AU,Orion Australia,Sales,Sales,Outdoors,Sales Rep. I,Michael Minas,M,26970,11903,18536,,4,120103,120101,120261,120259,,
120141,AU,Orion Australia,Sales,Sales,Outdoors,Sales Rep. II,Amanda Liebman,F,27465,11759,18383,,4,120103,120101,120261,120259,,
120142,AU,Orion Australia,Sales,Sales,Outdoors,Sales Rep. III,Vincent Eastley,M,29695,11122,18444,,4,120103,120101,120261,120259,,
120143,AU,Orion Australia,Sales,Sales,Outdoors,Sales Rep. II,Phu Sloey,M,26790,1232,9770,,4,120103,120101,120261,120259,,
120144,AU,Orion Australia,Sales,Sales,Outdoors,Sales Rep. III,Viney Barbis,M,30265,11023,18536,,4,120103,120101,120261,120259,,
120145,AU,Orion Australia,Sales,Sales,Outdoors,Sales Rep. II,Sandy Aisbitt,M,26060,2943,10744,,4,120103,120101,120261,120259,,
120146,AU,Orion Australia,Sales,Sales,Outdoors,Sales Rep. I,Wendall Cederlund,M,25985,1370,8979,18170,4,120103,120101,120261,120259,,
120147,AU,Orion Australia,Sales,Sales,Outdoors,Sales Rep. II,Skev Rusli,F,26580,11706,18536,,4,120103,120101,120261,120259,,
120148,AU,Orion Australia,Sales,Sales,Outdoors,Sales Rep. III,Michael Zubak,M,28480,-2301,8187,,4,120103,120101,120261,120259,,
120149,AU,Orion Australia,Sales,Sales,Outdoors,Sales Rep. I,Judy Chantharasy,F,26390,6899,13515,,4,120103,120101,120261,120259,,
120150,AU,Orion Australia,Sales,Sales,Outdoors,Sales Rep. III,John Filo,M,29965,-541,9709,17652,4,120103,120101,120261,120259,,
120151,AU,Orion Australia,Sales,Sales,Outdoors,Sales Rep. II,Julianna Phaiyakounh,F,26520,-4058,6575,,4,120103,120101,120261,120259,,
120152,AU,Orion Australia,Sales,Sales,Racket Sports,Sales Rep. I,Sean Dives,M,26515,8521,17988,,4,120102,120101,120261,120259,,
120153,AU,Orion Australia,Sales,Sales,Racket Sports,Sales Rep. I,Samantha Waal,F,27260,8527,15341,18293,4,120102,120101,120261,120259,,
120154,AU,Orion Australia,Sales,Sales,Racket Sports,Sales Rep. III,Caterina Hayawardhana,F,30490,-4182,6575,,4,120102,120101,120261,120259,,
120155,AU,Orion Australia,Sales,Sales,Racket Sports,Sales Rep. III,Narelle James,F,29990,10339,18353,,4,120102,120101,120261,120259,,
120156,AU,Orion Australia,Sales,Sales,Racket Sports,Sales Rep. I,Gerry Snellings,F,26445,11932,18322,,4,120102,120101,120261,120259,,
120157,AU,Orion Australia,Sales,Sales,Racket Sports,Sales Rep. II,Leonid Karavdic,M,27860,11009,18597,,4,120102,120101,120261,120259,,
120158,AU,Orion Australia,Sales,Sales,Racket Sports,Sales Rep. III,Daniel Pilgrim,M,36605,3117,11504,18140,4,120102,120101,120261,120259,,
120159,AU,Orion Australia,Sales,Sales,Racket Sports,Sales Rep. IV,Lynelle Phoumirath,F,30765,2976,11139,,4,120102,120101,120261,120259,,
120160,AU,Orion Australia,Sales,Sales,Racket Sports,Sales Rep. I,Chuck Segrave,M,27115,-479,6848,,4,120102,120101,120261,120259,,
120161,AU,Orion Australia,Sales,Sales,Running - Jogging,Sales Rep. III,Rosette Martines,F,30785,11754,18536,,4,120102,120101,120261,120259,,
120162,AU,Orion Australia,Sales,Sales,Running - Jogging,Sales Rep. I,Randal Scordia,M,27215,11936,18294,,4,120102,120101,120261,120259,,
120163,AU,Orion Australia,Sales,Sales,Running - Jogging,Sales Rep. II,Brett Magrath,M,26735,3064,12784,,4,120102,120101,120261,120259,,
120164,AU,Orion Australia,Sales,Sales,Running - Jogging,Sales Rep. II,Ranj Stamalis,F,27450,1425,9528,,4,120102,120101,120261,120259,,
120165,AU,Orion Australia,Sales,Sales,Running - Jogging,Sales Rep. I,Tadashi Pretorius,M,27050,10305,18322,,4,120102,120101,120261,120259,,
120166,AU,Orion Australia,Sales,Sales,Running - Jogging,Sales Rep. IV,Fadi Nowd,M,30660,-4218,6575,18505,4,120102,120101,120261,120259,,
120167,AU,Orion Australia,Sales,Sales,Running - Jogging,Sales Rep. I,Kimiko Tilley,F,25185,-607,6606,18352,4,120102,120101,120261,120259,,
120168,AU,Orion Australia,Sales,Sales,Swim Sports,Sales Rep. I,Selina Barcoe,F,25275,10310,18567,,4,120102,120101,120261,120259,,
120169,AU,Orion Australia,Sales,Sales,Swim Sports,Sales Rep. III,Cos Tannous,M,28135,10228,18383,,4,120102,120101,120261,120259,,
120170,AU,Orion Australia,Sales,Sales,Swim Sports,Sales Rep. III,Alban Kingston,M,28830,6630,13423,18566,4,120102,120101,120261,120259,,
120171,AU,Orion Australia,Sales,Sales,Swim Sports,Sales Rep. II,Alena Moody,F,26205,10427,18506,,4,120102,120101,120261,120259,,
120172,AU,Orion Australia,Sales,Sales,Swim Sports,Sales Rep. III,Edwin Comber,M,28345,-4292,6575,,4,120102,120101,120261,120259,,
120173,AU,Orion Australia,Sales,Sales,Swim Sports,Sales Rep. I,Hernani Osborn,M,26715,-677,7822,17744,4,120102,120101,120261,120259,,
120174,AU,Orion Australia,Sales,Sales,Swim Sports,Sales Rep. I,Doungkamol Simms,F,26850,-4374,6575,18200,4,120102,120101,120261,120259,,
120175,AU,Orion Australia,Sales,Sales,Swim Sports,Sales Rep. I,Andrew Conolly,M,25745,11918,18536,,4,120102,120101,120261,120259,,
120176,AU,Orion Australia,Sales,Sales,Team Sports,Sales Rep. I,Koavea Pa),M,26095,11270,18567,,4,120102,120101,120261,120259,,
120177,AU,Orion Australia,Sales,Sales,Team Sports,Sales Rep. III,Franca Kierce,F,28745,8495,15372,,4,120102,120101,120261,120259,,
120178,AU,Orion Australia,Sales,Sales,Team Sports,Sales Rep. II,Billy Plested,M,26165,-404,6665,,4,120102,120101,120261,120259,,
120179,AU,Orion Australia,Sales,Sales,Team Sports,Sales Rep. III,Matsuoka Wills,M,28510,6648,17532,17775,4,120102,120101,120261,120259,,
120180,AU,Orion Australia,Sales,Sales,Team Sports,Sales Rep. II,Vino George,M,26970,-553,8370,,4,120102,120101,120261,120259,,
120181,AU,Orion Australia,Sales,Sales,Temporary,Temp. Sales Rep.,Lorian Cantatore,F,27065,12020,18597,18717,4,120103,120101,120261,120259,,
120182,AU,Orion Australia,Sales,Sales,Temporary,Temp. Sales Rep.,Geok-Seng Barreto,M,25020,10505,18597,18627,4,120103,120101,120261,120259,,
120183,AU,Orion Australia,Sales,Sales,Temporary,Temp. Sales Rep.,Brig Blanton,M,26910,5001,18597,18627,4,120103,120101,120261,120259,,
120184,AU,Orion Australia,Sales,Sales,Temporary,Temp. Sales Rep.,Ari Moore,M,25820,-2222,18597,18747,4,120103,120101,120261,120259,,
120185,AU,Orion Australia,Sales,Sales,Temporary,Temp. Sales Rep.,Sharon Bahlman,F,25080,6671,18597,18658,4,120103,120101,120261,120259,,
120186,AU,Orion Australia,Sales,Sales,Temporary,Temp. Sales Rep.,Merryn Quinby,F,26795,8509,18597,18808,4,120103,120101,120261,120259,,
120187,AU,Orion Australia,Sales,Sales,Temporary,Temp. Sales Rep.,Reyne Catenacci,F,26665,10571,18597,18778,4,120103,120101,120261,120259,,
120188,AU,Orion Australia,Sales,Sales,Temporary,Temp. Sales Rep.,Shanmuganathan Baran,F,26715,-671,18597,18627,4,120103,120101,120261,120259,,
120189,AU,Orion Australia,Sales,Sales,Temporary,Temp. Sales Rep.,Mihailo Lachlan,M,25180,10411,18597,18717,4,120103,120101,120261,120259,,
120190,AU,Orion Australia,Sales,Sales,Trainees,Trainee,Ivor Czernezkyi,M,24100,10566,17837,18017,4,120103,120101,120261,120259,,
120191,AU,Orion Australia,Sales,Sales,Trainees,Trainee,Jannene Graham-Rowe,F,24015,1112,17167,17347,4,120103,120101,120261,120259,,
120192,AU,Orion Australia,Sales,Sales,Trainees,Trainee,Anthony Nichollas,M,26185,10355,18049,18231,4,120103,120101,120261,120259,,
120193,AU,Orion Australia,Sales,Sales,Trainees,Trainee,Russell Streit,M,24515,10567,18141,18321,4,120103,120101,120261,120259,,
120194,AU,Orion Australia,Sales,Sales,Trainees,Trainee,Reece Harwood,M,25985,10493,17929,18109,4,120103,120101,120261,120259,,
120195,AU,Orion Australia,Sales,Sales,Trainees,Trainee,Jina Fiocca,F,24990,10586,18444,18627,4,120103,120101,120261,120259,,
120196,AU,Orion Australia,Sales,Sales,Trainees,Trainee,Merle Hieds,F,24025,10257,17167,17347,4,120103,120101,120261,120259,,
120197,AU,Orion Australia,Sales,Sales,Trainees,Trainee,Kerrin Dillin,F,25580,-511,17167,17347,4,120103,120101,120261,120259,,
120198,AU,Orion Australia,Sales,Sales,Winter Sports,Sales Rep. III,Meera Body,F,28025,11708,18597,,4,120103,120101,120261,120259,,
120259,US,Board of Directors,Executives,Executives,Executives,Chief Executive Officer,Anthony Miller,M,433800,2946,12297,,0,,,,,,
120260,US,Board of Directors,Executives,Executives,Executives,Chief Marketing Officer,Christine Fletcher,F,207885,3258,10532,,1,120259,,,,,
120261,US,Board of Directors,Executives,Executives,Executives,Chief Sales Officer,Harry Highpoint,M,243190,4800,11535,,1,120259,,,,,
120262,US,Board of Directors,Executives,Executives,Executives,Chief Financial Officer,Max Crown,M,268455,5042,11932,,1,120259,,,,,
120263,US,Board of Directors,Group Financials,Group Finance,Group Finance,Financial Analyst III,Bobby Cleverley,M,42605,2962,10135,17531,2,120262,120259,,,,
120264,US,Board of Directors,Group Financials,Group Finance,Group Finance,Financial Analyst II,Latonya Croome,F,37510,10249,18597,,2,120262,120259,,,,
120265,US,Board of Directors,Group Financials,Group Finance,Group Finance,Auditor III,Wanda Branly,F,51950,-4106,6575,17166,2,120262,120259,,,,
120266,US,Board of Directors,Secretary of the Board,Secretary of the Board,Secretary,Secretary IV,Bao Krafve,F,31750,4930,12144,,1,120259,,,,,
120267,US,Board of Directors,Secretary of the Board,Secretary of the Board,Secretary,Secretary III,Belanda Rink,F,28585,11110,17198,,1,120259,,,,,
120268,US,Board of Directors,Strategy,Strategy,Strategy,Senior Strategist,Jacques Villeneuve,M,76105,6818,15096,,2,120260,120259,,,,
120269,US,Board of Directors,Strategy,Strategy,Strategy,Strategist II,Shrimatee Kagolanu,F,52540,-4113,6575,17652,2,120260,120259,,,,
120270,US,Concession,Concession Management,Concession Management,Concession Management,Concession Director,Grezegorz Nuss,M,48435,-647,6575,,2,120261,120259,,,,
120271,US,Concession,Concession Management,Concession Management,Concession Management,Concession Manager,Kenisha Winge,F,43635,3140,11201,,3,120270,120261,120259,,,
120272,US,Concession,Concession Management,Concession Management,Eclipse,Concession Consultant II,Febin Flow,M,34390,-4309,6575,,4,120271,120270,120261,120259,,
120273,US,Concession,Concession Management,Concession Management,Eclipse,Concession Assistant III,Doris Antonini,F,28455,11115,18322,,4,120271,120270,120261,120259,,
120274,US,Concession,Concession Management,Concession Management,Eclipse,Concession Assistant I,Angela Landry,F,26840,2930,13849,,4,120271,120270,120261,120259,,
120275,US,Concession,Concession Management,Concession Management,N.D. Gear,Concession Consultant II,Brandy Lattimer,F,32195,1456,10501,,4,120271,120270,120261,120259,,
120276,US,Concession,Concession Management,Concession Management,N.D. Gear,Concession Assistant II,Nicholas Plybon,M,28090,-4033,6575,17317,4,120271,120270,120261,120259,,
120277,US,Concession,Concession Management,Concession Management,Tracker,Concession Consultant I,Wesley Shirts,F,32645,11916,17653,18048,4,120271,120270,120261,120259,,
120278,US,Concession,Concession Management,Concession Management,Tracker,Concession Assistant III,Binit Jongleux,M,27685,11308,18475,,4,120271,120270,120261,120259,,
120279,US,Concession,Concession Management,International Concession,International Concession,Concession Consultant I,Kareema Dunlap,F,32925,5041,14731,,4,120271,120270,120261,120259,,
120280,US,Concession,Concession Management,International Concession,International Concession,Concession Consultant III,Jaime Laurer,F,36930,3237,11809,16982,4,120271,120270,120261,120259,,
120656,US,Logistics,Logistics Management,Logistics,External,Logistics Coordinator II,Salley Amos,F,42570,6602,15765,,3,120660,120659,120259,,,
120657,US,Logistics,Logistics Management,Logistics,External,Logistics Coordinator I,Theresa Weisbarth,F,36110,2928,12723,,3,120660,120659,120259,,,
120658,US,Logistics,Logistics Management,Logistics,External,Logistics Coordinator II,Kenneth Kennedy,M,42485,-377,9163,,3,120660,120659,120259,,,
120659,US,Logistics,Logistics Management,Logistics,Logistics,Director,Jay Havasy,M,161290,-2360,6575,,1,120259,,,,,
120660,US,Logistics,Logistics Management,Logistics,Logistics,Logistics Manager,Robert Smith,M,61125,8192,17957,,2,120659,120259,,,,
120661,US,Logistics,Logistics Management,Logistics,Logistics,Senior Logistics Manager,Cynthia Racine,F,85495,-400,10227,17347,2,120659,120259,,,,
120662,US,Logistics,Logistics Management,Logistics,Logistics,Secretary II,Lemonica Burroughs,M,27045,11864,18567,,2,120659,120259,,,,
120663,US,Logistics,Logistics Management,Logistics,Pricing,Pricing Manager,Anglar Kornblith,F,56385,4833,15035,,2,120659,120259,,,,
120664,US,Logistics,Logistics Management,Logistics,Pricing,Pricing Specialist,Brock Senchak,M,47605,-682,7060,,3,120663,120659,120259,,,
120665,US,Logistics,Logistics Management,Secretariat,Import/Export,Senior Logistics Manager,Jill Leacock,F,80070,6871,16861,,2,120659,120259,,,,
120666,US,Logistics,Logistics Management,Secretariat,Import/Export,Logistics Manager,John Onuscheck,M,64555,4921,13118,17652,2,120659,120259,,,,
120667,US,Logistics,Logistics Management,Secretariat,Import/Export,Office Assistant III,Edwin Droste,M,29980,8572,18294,,3,120666,120659,120259,,,
120668,US,Logistics,Logistics Management,Secretariat,Office Services,Services Manager,Thyland Dolan,M,47785,-2261,8370,,2,120659,120259,,,,
120669,US,Logistics,Logistics Management,Secretariat,Office Services,Services Assistant IV,Ronald Hill,M,36370,-4179,6575,,3,120668,120659,120259,,,
120670,US,Logistics,Stock & Shipping,Stock & Shipping,Stock & Shipping Americas,Shipping Manager,Odudu Zisek,M,65420,-4298,6575,17166,2,120659,120259,,,,
120671,US,Logistics,Stock & Shipping,Stock & Shipping,Stock & Shipping Americas,Shipping Agent III,William Latty,M,40080,-584,9893,,3,120670,120659,120259,,,
120672,AU,Logistics,Stock & Shipping,Stock & Shipping,Stock & Shipping Asia/Pacific,Shipping Manager,Verne Guscott,M,60980,3159,13209,,2,120659,120259,,,,
120673,AU,Logistics,Stock & Shipping,Stock & Shipping,Stock & Shipping Asia/Pacific,Shipping Agent II,Pearl Santomaggio,F,35935,-4205,6575,,3,120672,120659,120259,,,
120677,US,Logistics,Stock & Shipping,Stock & Shipping,Export Stock,Shipping Manager,Suad Sochacki,F,65555,4993,13546,,2,120659,120259,,,,
120678,US,Logistics,Stock & Shipping,Stock & Shipping,Export Stock,Shipping Agent III,Lucretta Octetree,F,40035,-2545,8156,17409,3,120677,120659,120259,,,
120679,US,Logistics,Stock & Shipping,Stock & Shipping,Stock & Shipping Americas,Shipping Manager,Chrisy Cutucache,F,46190,7616,16983,,2,120659,120259,,,,
120680,US,Logistics,Stock & Shipping,Stock & Shipping,Stock & Shipping Americas,Shipping Agent I,Raymondria Desaulniers,F,27295,4985,12904,,3,120679,120659,120259,,,
120681,US,Logistics,Stock & Shipping,Stock & Shipping,Stock & Shipping Americas,Shipping Agent II,Elery Tolbet,M,30950,8624,17623,,3,120679,120659,120259,,,
120682,US,Logistics,Stock & Shipping,Stock & Shipping,Stock & Shipping Americas,Shipping Agent I,Barbara Kennedy,F,26760,5102,14701,,3,120679,120659,120259,,,
120683,US,Logistics,Stock & Shipping,Stock & Shipping,Stock & Shipping Americas,Shipping Agent III,Deven Kochneff,F,36315,-415,6575,17225,3,120679,120659,120259,,,
120684,US,Logistics,Stock & Shipping,Stock & Shipping,Stock & Shipping Americas,Warehouse Assistant I,Suzon Woyach,F,26960,11287,18567,,3,120679,120659,120259,,,
120685,US,Logistics,Stock & Shipping,Stock & Shipping,Stock & Shipping Americas,Warehouse Assistant I,Anita Howard,F,25130,10287,18567,,3,120679,120659,120259,,,
120686,US,Logistics,Stock & Shipping,Stock & Shipping,Stock & Shipping Americas,Warehouse Assistant II,Berether Tucker,F,26690,-4256,6575,,3,120679,120659,120259,,,
120687,US,Logistics,Stock & Shipping,Stock & Shipping,Stock & Shipping Americas,Warehouse Assistant I,Freda Dannin,F,26800,8545,17745,17928,3,120679,120659,120259,,,
120688,US,Logistics,Stock & Shipping,Stock & Shipping,Stock & Shipping Americas,Warehouse Assistant I,Lisa Carcaterra,F,25905,-2198,6575,17044,3,120679,120659,120259,,,
120689,US,Logistics,Stock & Shipping,Stock & Shipping,Stock & Shipping Americas,Warehouse Assistant III,Katherine Pongor,F,27780,8601,18444,,3,120679,120659,120259,,,
120690,US,Logistics,Stock & Shipping,Stock & Shipping,Stock & Shipping Americas,Warehouse Assistant I,Taronda Langston,F,25185,10243,17867,,3,120679,120659,120259,,,
120691,AU,Logistics,Stock & Shipping,Stock & Shipping,Stock & Shipping Asia/Pacific,Shipping Manager,Sek Habres,M,49240,-4125,6575,,2,120659,120259,,,,
120692,AU,Logistics,Stock & Shipping,Stock & Shipping,Stock & Shipping Asia/Pacific,Shipping Agent II,Rit Tregonning,M,32485,-405,9587,,3,120691,120659,120259,,,
120693,AU,Logistics,Stock & Shipping,Stock & Shipping,Stock & Shipping Asia/Pacific,Shipping Agent I,Diaz Tellam,M,26625,1217,8552,,3,120691,120659,120259,,,
120694,AU,Logistics,Stock & Shipping,Stock & Shipping,Stock & Shipping Asia/Pacific,Warehouse Assistant I,Sharon Leazer,F,27365,11916,18353,,3,120691,120659,120259,,,
120695,AU,Logistics,Stock & Shipping,Stock & Shipping,Stock & Shipping Asia/Pacific,Warehouse Assistant II,Trent Moffat,M,28180,3116,12235,18474,3,120691,120659,120259,,,
120696,AU,Logistics,Stock & Shipping,Stock & Shipping,Stock & Shipping Asia/Pacific,Warehouse Assistant I,Peter Pettolino,M,26615,-505,6634,18352,3,120691,120659,120259,,,
120697,AU,Logistics,Stock & Shipping,Stock & Shipping,Stock & Shipping Asia/Pacific,Warehouse Assistant IV,Madelaine Fouche,F,29625,11866,18414,,3,120691,120659,120259,,,
120698,AU,Logistics,Stock & Shipping,Stock & Shipping,Stock & Shipping Asia/Pacific,Warehouse Assistant I,Geoff Kistanna,M,26160,-594,7518,17956,3,120691,120659,120259,,,
120710,US,Marketing,Marketing,CRM,CRM,Business Analyst II,Timothy Baltzell,M,54840,6902,15341,,3,120719,120260,120259,,,
120711,US,Marketing,Marketing,CRM,CRM,Business Analyst III,Gloria Drew,F,59130,4896,13939,,3,120719,120260,120259,,,
120712,US,Marketing,Marketing,DotCom & Catalog,Catalog,Marketing Manager,Elisabeth Motashaw,F,63640,-2394,6575,,3,120719,120260,120259,,,
120713,US,Marketing,Marketing,DotCom & Catalog,Catalog,Marketing Assistant III,Carston Campbell,M,31630,-4330,6575,,4,120712,120719,120260,120259,,
120714,US,Marketing,Marketing,DotCom & Catalog,DotCom,Marketing Manager,Robert Dinley,M,62625,7399,15584,,3,120719,120260,120259,,,
120715,US,Marketing,Marketing,DotCom & Catalog,DotCom,Marketing Assistant II,Angelia Neal,F,28535,8563,17929,,4,120714,120719,120260,120259,,
120716,US,Marketing,Marketing,Events & PR,Events & PR,Events Manager,Kenneth Juif,M,53015,6779,13727,,3,120719,120260,120259,,,
120717,US,Marketing,Marketing,Events & PR,Events & PR,Marketing Assistant II,Jon Sleva,M,30155,-722,9344,,4,120716,120719,120260,120259,,
120718,US,Marketing,Marketing,Events & PR,Events & PR,Marketing Assistant II,Charles Hennington,M,29190,3111,12539,,4,120716,120719,120260,120259,,
120719,US,Marketing,Marketing,Marketing,Marketing,Senior Marketing Manager,Roya Ridley,F,87420,4770,14641,,2,120260,120259,,,,
120720,US,Marketing,Marketing,Marketing,Marketing,Corp. Comm. Manager,John Spingola,M,46580,3049,13240,,3,120719,120260,120259,,,
120721,US,Marketing,Marketing,Marketing,Marketing,Marketing Assistant II,Dlutomi Knust,F,29870,-4089,6575,,4,120720,120719,120260,120259,,
120722,US,Marketing,Marketing,Marketing,Marketing,Corp. Comm. Specialist I,Ishmar Sheffield,M,32460,1360,10866,,4,120720,120719,120260,120259,,
120723,US,Marketing,Marketing,Marketing,Marketing,Corp. Comm. Specialist II,Deanna Olsen,F,33950,-2335,6575,,4,120720,120719,120260,120259,,
120724,US,Marketing,Marketing,Organization,Organization,Marketing Manager,Hampie Brown,M,63705,2948,13240,,3,120719,120260,120259,,,
120725,US,Marketing,Marketing,Organization,Organization,Marketing Assistant II,Robert Whitlock,M,29970,8697,17684,17897,4,120724,120719,120260,120259,,
120726,US,Marketing,Marketing,Orion Club Member Service,Orion Club Member Service,Marketing Assistant I,Lutezenia Obermeyer,F,27380,11870,18506,,4,120724,120719,120260,120259,,
120727,US,Marketing,Marketing,Orion Club Member Service,Orion Club Member Service,Marketing Assistant IV,Donald Marples,M,34925,3098,11109,,4,120724,120719,120260,120259,,
120728,US,Purchasing,Purchasing,Children's Sports,Children's Sports,Purchasing Agent II,Kathryn Borge,F,35070,-393,9497,,3,120735,120261,120259,,,
120729,US,Purchasing,Purchasing,Children's Sports,Children's Sports,Purchasing Agent I,Kimberly Howell,F,31495,11781,17281,18163,3,120735,120261,120259,,,
120730,US,Purchasing,Purchasing,Children's Sports,Children's Sports,Purchasing Agent I,Woodson Burt,M,30195,3272,11962,,3,120735,120261,120259,,,
120731,US,Purchasing,Purchasing,Children's Sports,Children's Sports,Purchasing Agent II,Robert Lerew,M,34150,1169,10105,,3,120735,120261,120259,,,
120732,US,Purchasing,Purchasing,Outdoors,Outdoors,Purchasing Agent III,Kent Uenking,M,35870,-2331,6575,,3,120736,120261,120259,,,
120733,US,Purchasing,Purchasing,Outdoors,Outdoors,Purchasing Agent I,Michael Bezinque,M,31760,3015,12723,,3,120736,120261,120259,,,
120734,US,Purchasing,Purchasing,Outdoors,Outdoors,Purchasing Agent III,Svein Saylor,M,34270,8516,18322,,3,120736,120261,120259,,,
120735,US,Purchasing,Purchasing,Purchasing Management,Team Administration,Purchasing Manager,Brenda Bilobran,F,61985,-567,8156,,2,120261,120259,,,,
120736,US,Purchasing,Purchasing,Purchasing Management,Team Administration,Purchasing Manager,Parie Kiemle,F,63985,3253,13057,,2,120261,120259,,,,
120737,US,Purchasing,Purchasing,Purchasing Management,Team Administration,Purchasing Manager,Brenner Toner,F,63605,1182,11993,,2,120261,120259,,,,
120738,US,Purchasing,Purchasing,Sports,Sports,Purchasing Agent I,Huilun Swaiti,F,30025,-2370,6575,,3,120737,120261,120259,,,
120739,US,Purchasing,Purchasing,Sports,Sports,Purchasing Agent III,Bryon Cooper,M,36970,11176,18383,,3,120737,120261,120259,,,
120740,US,Purchasing,Purchasing,Sports,Sports,Purchasing Agent II,Lisa Koonce,F,35110,-2265,6575,17409,3,120737,120261,120259,,,
120741,US,Purchasing,Purchasing,Sports,Sports,Purchasing Agent III,Keisha Court,F,36365,-4051,6575,,3,120737,120261,120259,,,
120742,US,Purchasing,Purchasing,Sports,Sports,Purchasing Agent I,Ronald Shewitz,M,31020,-4349,6575,,3,120737,120261,120259,,,
120743,US,Purchasing,Purchasing,Sports,Sports,Purchasing Agent II,Chimena Harrison,F,34620,4780,15127,,3,120737,120261,120259,,,
120744,US,Purchasing,Purchasing,Sports,Sports,Purchasing Agent II,Alden Feigenbaum,F,33490,11858,17714,18200,3,120737,120261,120259,,,
120745,US,Purchasing,Purchasing,Sports,Sports,Purchasing Agent I,Barbara Harvill,F,31365,11143,18414,,3,120737,120261,120259,,,
120746,US,Shared Functions,Accounts,Accounts Center,Accounting & Budgeting,Account Manager,Kevie Kimmerle,M,46090,6857,16892,,2,120262,120259,,,,
120747,US,Shared Functions,Accounts,Accounts Center,Accounting & Budgeting,Financial Controller I,Zashia Farthing,F,43590,6745,14457,,3,120746,120262,120259,,,
120748,US,Shared Functions,Accounts,Accounts Center,Building Administration,Building Admin. Manager,Nahliah Post,F,48380,7491,17226,,2,120262,120259,,,,
120749,US,Shared Functions,Accounts,Accounts Center,Building Administration,Office Assistant II,Kevin Niemann,M,26545,6837,14884,,3,120748,120262,120259,,,
120750,US,Shared Functions,Accounts,Finance,Accounting & Budgeting,Accountant I,Connie Woods,F,32675,-573,8432,16832,3,120751,120262,120259,,,
120751,US,Shared Functions,Accounts,Finance,Accounting & Budgeting,Finance Manager,Azavi0us Mea,M,58200,3017,11901,,2,120262,120259,,,,
120752,US,Shared Functions,Accounts,Finance,Accounting & Budgeting,Accountant I,Pieter Slykhuis,M,30590,-683,7152,17286,3,120751,120262,120259,,,
120753,US,Shared Functions,Accounts,Finance,Accounting & Budgeting,Financial Controller II,Ralph Ferrari,M,47000,7471,14092,,3,120751,120262,120259,,,
120754,US,Shared Functions,Accounts,Finance,Concession Billing,Accountant II,John Atkins,M,34760,11841,18383,,3,120751,120262,120259,,,
120755,US,Shared Functions,Accounts,Finance,Concession Billing,Accountant III,Elizabeth Thoits,F,36440,3158,10074,,3,120751,120262,120259,,,
120756,US,Shared Functions,Accounts,Finance,Head Cashier,Financial Controller III,Wendy Asta,F,52295,6625,14792,,3,120751,120262,120259,,,
120757,US,Shared Functions,Accounts,Finance,Head Cashier,Accountant III,Paul Knopfmacher,M,38545,-4306,6575,17713,3,120751,120262,120259,,,
120758,US,Shared Functions,Accounts,Finance,Head Cashier,Accountant II,Sal Voltz,M,34040,3217,13423,,3,120751,120262,120259,,,
120759,US,Shared Functions,Accounts,Operations Accounting,Operations Accounting,Accountant II,Nishan Apr,M,36230,3230,9862,,3,120746,120262,120259,,,
120760,US,Shared Functions,Accounts,Operations Accounting,Operations Accounting,Financial Controller III,Pamela Miller,F,53475,4754,13635,,3,120746,120262,120259,,,
120761,US,Shared Functions,Accounts,Operations Accounting,Operations Accounting,Accountant I,Tameaka Akinfolarin,F,30960,11319,18444,,3,120746,120262,120259,,,
120762,US,Shared Functions,Accounts,Operations Accounting,Operations Accounting,Accountant I,Marvin Leone,M,30625,8706,18322,,3,120746,120262,120259,,,
120763,US,Shared Functions,Accounts Management,Auditing & Salary,Auditing & Wages,Auditor II,Ramond Capps,M,45100,-4084,6575,,3,120766,120262,120259,,,
120764,US,Shared Functions,Accounts Management,Auditing & Salary,Auditing & Wages,Auditor I,Steven Worton,M,40450,6930,17136,,3,120766,120262,120259,,,
120765,US,Shared Functions,Accounts Management,Auditing & Salary,Auditing & Wages,Financial Controller III,Nikeisha Kokoszka,F,51950,-380,6575,,3,120766,120262,120259,,,
120766,US,Shared Functions,Accounts Management,Auditing & Salary,Auditing & Wages,Auditing Manager,Janelle Kempster,F,53400,6883,16496,,2,120262,120259,,,,
120767,US,Shared Functions,Accounts Management,Auditing & Salary,Auditing & Wages,Accountant I,Legette Terricciano,M,32965,3051,11413,,3,120766,120262,120259,,,
120768,US,Shared Functions,Accounts Management,Auditing & Salary,External Auditing,Accountant II,Roland Rayburn,M,44955,-528,9405,17500,3,120766,120262,120259,,,
120769,US,Shared Functions,Accounts Management,Auditing & Salary,External Auditing,Auditor II,Abelino Lightbourne,M,47990,6718,14701,,3,120766,120262,120259,,,
120770,US,Shared Functions,Accounts Management,Auditing & Salary,Internal Auditing,Auditor I,Julia Pascoe,F,43930,3036,11413,17286,3,120766,120262,120259,,,
120771,US,Shared Functions,Accounts Management,Auditing & Salary,Internal Auditing,Accountant II,Wei  Xing Moore,F,36435,-515,7640,,3,120766,120262,120259,,,
120772,US,Shared Functions,Group HR Management,Group HR,Group HR,HR Generalist I,Erich Overdorff,M,27365,11786,18475,,3,120780,120262,120259,,,
120773,US,Shared Functions,Group HR Management,Group HR,Group HR,HR Generalist II,Entrisse Horne,F,27370,1148,9222,,3,120780,120262,120259,,,
120774,US,Shared Functions,Group HR Management,Group HR,Group HR,HR Specialist II,Sue El-Amin,F,45155,8295,16861,18201,3,120780,120262,120259,,,
120775,US,Shared Functions,Group HR Management,Group HR,Group HR,HR Analyst II,Tanya Thompson,F,41580,4790,14915,,3,120780,120262,120259,,,
120776,US,Shared Functions,Group HR Management,Group HR,Retirement Club,HR Generalist III,Ratna Silverthorne,M,32580,8664,16527,,3,120780,120262,120259,,,
120777,US,Shared Functions,Group HR Management,Group HR,Retirement Club,HR Specialist I,Kary Sacher,M,40955,4833,14000,,3,120780,120262,120259,,,
120778,US,Shared Functions,Group HR Management,Group HR,Retirement Club,HR Specialist I,Angela Gardner,F,43650,-389,10258,,3,120780,120262,120259,,,
120779,US,Shared Functions,Group HR Management,Group HR,Staff Administration,HR Analyst II,Jennifer Eggleston,F,43690,7582,15035,,3,120780,120262,120259,,,
120780,US,Shared Functions,Group HR Management,Group HR,Staff Administration,HR Manager,Kimberly Walcott,F,62995,4992,13057,,2,120262,120259,,,,
120781,US,Shared Functions,Group HR Management,Recruitment & Training,Group Recruitment,Recruiter I,Sarah Sitnik,F,32620,11710,17867,18262,3,120782,120262,120259,,,
120782,US,Shared Functions,Group HR Management,Recruitment & Training,Group Recruitment,Recruitment Manager,Rilma Sines,F,63915,6907,15857,,2,120262,120259,,,,
120783,US,Shared Functions,Group HR Management,Recruitment & Training,Group Recruitment,Recruiter III,Davis Karp,M,42975,6928,14610,,3,120782,120262,120259,,,
120784,US,Shared Functions,Group HR Management,Recruitment & Training,Group Recruitment,Recruiter II,Jennifer Pinol,F,35715,8514,17776,,3,120782,120262,120259,,,
120785,US,Shared Functions,Group HR Management,Recruitment & Training,Recruitment & Training,Training Manager,Damesha Donnell,F,48335,4769,13666,,3,120780,120262,120259,,,
120786,US,Shared Functions,Group HR Management,Recruitment & Training,Recruitment & Training,Trainer I,Chris-Anne Delafuente,F,32650,-4306,6575,,4,120785,120780,120262,120259,,
120787,US,Shared Functions,Group HR Management,Recruitment & Training,Recruitment & Training,Trainer II,Carl Peachey,M,34000,4982,14610,,4,120785,120780,120262,120259,,
120788,US,Shared Functions,Group HR Management,Recruitment & Training,Recruitment & Training,Trainer I,Smitty Lisowe,M,33530,4912,14214,,4,120785,120780,120262,120259,,
120789,US,Shared Functions,Group HR Management,Recruitment & Training,Recruitment & Training,Trainer III,Julius Denhollem,M,39330,3117,9831,17317,4,120785,120780,120262,120259,,
120790,US,Shared Functions,IS,Applications,Applications,ETL Specialist II,Tara O'Toole,F,53740,6915,14365,,5,120791,120798,120800,120262,120259,
120791,US,Shared Functions,IS,Applications,Applications,Systems Architect IV,Richard Chiseloff,M,61115,3129,11231,,4,120798,120800,120262,120259,,
120792,US,Shared Functions,IS,Applications,Applications,Systems Architect II,Omeba Horne,F,54760,7383,15188,,5,120791,120798,120800,120262,120259,
120793,US,Shared Functions,IS,Applications,Applications,ETL Specialist I,William Mamo,M,47155,4968,14762,,5,120791,120798,120800,120262,120259,
120794,US,Shared Functions,IS,Applications,Management Applications,Applications Developer IV,Samantha Cross,F,51265,8400,17348,,3,120800,120262,120259,,,
120795,US,Shared Functions,IS,Applications,Management Applications,Applications Developer II,David Deacon,M,49105,4764,11901,17197,4,120794,120800,120262,120259,,
120796,US,Shared Functions,IS,Applications,Management Applications,Applications Developer II,Philip Kellis,M,47030,-599,9921,,4,120794,120800,120262,120259,,
120797,US,Shared Functions,IS,Applications,Management Applications,Applications Developer I,Sherrie Jones,F,43385,-410,8005,,4,120794,120800,120262,120259,,
120798,US,Shared Functions,IS,IS Management,IS Management,Senior Project Manager,Elizabeth Ardskin,F,80755,1269,11323,,3,120800,120262,120259,,,
120799,US,Shared Functions,IS,IS Management,IS Management,Office Assistant III,Jeffery Stefandonovan,M,29070,8482,15645,,3,120800,120262,120259,,,
120800,US,Shared Functions,IS,IS Management,IS Management,IS Director,Fred Benyami,M,80210,6928,15127,17197,2,120262,120259,,,,
120801,US,Shared Functions,IS,IS Operations,Applications,Applications Developer I,Kathryn Kennedy,F,40040,6639,15887,,4,120798,120800,120262,120259,,
120802,US,Shared Functions,IS,IS Operations,Applications,Applications Developer IV,U'Vonda Parker,F,65125,-2426,8036,17713,4,120798,120800,120262,120259,,
120803,US,Shared Functions,IS,IS Operations,Applications,Applications Developer I,Victor Droste,M,43630,-574,8036,,4,120798,120800,120262,120259,,
120804,US,Shared Functions,IS,IS Operations,IS operations,IS Administrator III,Ahmed Zied,M,55400,-4342,6575,,4,120798,120800,120262,120259,,
120805,US,Shared Functions,IS,IS Operations,IS operations,BI Administrator IV,Robert Walker,M,58530,8213,16162,,4,120798,120800,120262,120259,,
120806,US,Shared Functions,IS,IS Operations,IS operations,IS Administrator II,Lorna Ousley,F,47285,6630,13180,,4,120798,120800,120262,120259,,
120807,US,Shared Functions,IS,IS Operations,IS operations,IS Administrator I,Gerlinde Peppers,F,43325,1443,9497,17775,4,120798,120800,120262,120259,,
120808,US,Shared Functions,IS,Planning & Design,Planning,BI Specialist II,Marcel Dupree,M,44425,3074,10379,,4,120798,120800,120262,120259,,
120809,US,Shared Functions,IS,Planning & Design,Planning,BI Architect II,Chiorene Marion,F,47155,-4370,6575,,4,120798,120800,120262,120259,,
120810,US,Shared Functions,IS,Planning & Design,Planning,IS Architect III,Loyal Esguerra,M,58375,-454,8826,,4,120798,120800,120262,120259,,
120811,US,Shared Functions,IS,Till Systems,Till Systems,Applications Developer I,Dale Bergeron-Jeter,M,43985,5017,13696,,4,120814,120800,120262,120259,,
120812,US,Shared Functions,IS,Till Systems,Till Systems,Applications Developer II,Fauver Arruza,M,45810,6624,16649,,4,120814,120800,120262,120259,,
120813,US,Shared Functions,IS,Till Systems,Till Systems,Applications Developer IV,John Heinsler,M,50865,5005,13515,17531,4,120814,120800,120262,120259,,
120814,US,Shared Functions,IS,Till Systems,Till Systems,Project Manager,Victor Scroggin,M,59140,1249,8644,,3,120800,120262,120259,,,
120815,US,Shared Functions,Marketing,Orion Club Member Service,Orion Club Member Service,Service Administrator III,Craig Honore,M,31590,12049,18353,,3,120719,120260,120259,,,
120816,US,Shared Functions,Marketing,Orion Club Member Service,Orion Club Member Service,Service Administrator I,Tessia Hart,F,30485,4871,13727,,3,120719,120260,120259,,,
120992,US,Orion USA,Administration,Administration,Administration,Office Assistant I,Lisa Kicak,F,26940,8448,16284,,5,120996,121000,121141,120261,120259,
120993,US,Orion USA,Administration,Administration,Administration,Office Assistant I,Lorraine Boatright,F,26260,5100,15035,,5,120996,121000,121141,120261,120259,
120994,US,Orion USA,Administration,Administration,Administration,Office Administrator I,Danelle Sergeant,F,31645,6741,14184,,5,120996,121000,121141,120261,120259,
120995,US,Orion USA,Administration,Administration,Administration,Office Administrator II,Lily-Ann Gordo,F,34850,10391,18475,,5,120996,121000,121141,120261,120259,
120996,US,Orion USA,Administration,Administration,Administration,Office Assistant IV,Johannes Wade,M,32745,6776,17045,,4,121000,121141,120261,120259,,
120997,US,Orion USA,Administration,Administration,Shipping Charges,Shipping Administrator I,Mary Donathan,F,27420,6899,14854,,4,121000,121141,120261,120259,,
120998,US,Orion USA,Administration,Administration,Shipping Charges,Clerk I,Tondelayo Benedicto,F,26330,8740,17988,,5,120997,121000,121141,120261,120259,
120999,US,Orion USA,Administration,Administration,Shipping Charges,Clerk I,Sherelyn Heilmann,F,27215,1457,10318,,5,120997,121000,121141,120261,120259,
121000,US,Orion USA,Administration,Administration,Shipping Charges,Administration Manager,Herman Supple,M,48600,2946,13849,,3,121141,120261,120259,,,
121001,US,Orion USA,Administration,Goods Entrance,Stock Admin,Warehouse Manager,Tony House,M,43615,1116,7914,,4,121000,121141,120261,120259,,
121002,US,Orion USA,Administration,Goods Entrance,Stock Admin,Warehouse Assistant II,Terry-Ann Clark,F,26650,-470,8735,17775,5,121001,121000,121141,120261,120259,
121003,US,Orion USA,Administration,Goods Entrance,Stock Admin,Warehouse Assistant I,Troyce Van Der Wiele,M,26000,11813,18444,,5,121001,121000,121141,120261,120259,
121004,US,Orion USA,Administration,Security,Security Guards,Security Manager,Kellen Smith,M,30895,-4168,6575,,4,121000,121141,120261,120259,,
121005,US,Orion USA,Administration,Security,Security Guards,Security Guard I,Yuh-Lang Mclamb,M,25020,10423,17563,,5,121004,121000,121141,120261,120259,
121006,US,Orion USA,Administration,Security,Security Guards,Security Guard I,Bernard Bolster,M,26145,11242,17837,18201,5,121004,121000,121141,120261,120259,
121007,US,Orion USA,Administration,Security,Security Guards,Security Guard II,John Banaszak,M,27290,3207,11354,,5,121004,121000,121141,120261,120259,
121008,US,Orion USA,Administration,Security,Security Guards,Security Guard II,Eron Mckenzie,M,27875,4932,13727,,5,121004,121000,121141,120261,120259,
121009,US,Orion USA,Administration,Service Center,Service,Service Administrator I,Robert Goodwin,M,32955,8738,15918,,4,121000,121141,120261,120259,,
121010,US,Orion USA,Administration,Service Center,Service,Service Assistant I,Donald Lamp,M,25195,10453,18322,,5,121009,121000,121141,120261,120259,
121011,US,Orion USA,Administration,Service Center,Service,Service Assistant I,Steven Banchi,M,25735,-4313,6575,,5,121009,121000,121141,120261,120259,
121012,US,Orion USA,Administration,Service Center,Service,Service Assistant II,Carmelo Broome,M,29575,10983,17410,17866,5,121009,121000,121141,120261,120259,
121013,US,Orion USA,Engineering,Engineering,Electrical Workshop,Electrician II,Seco Hargrave,M,26675,8518,16162,,5,121016,121000,121141,120261,120259,
121014,US,Orion USA,Engineering,Engineering,Electrical Workshop,Electrician III,Donelle Liguori,F,28510,6695,15918,,5,121016,121000,121141,120261,120259,
121015,US,Orion USA,Engineering,Engineering,Engineering,Technician I,Wilson Elmoslamy,M,26140,8747,16315,,5,121016,121000,121141,120261,120259,
121016,US,Orion USA,Engineering,Engineering,Engineering,Technical Manager,Lutezenia Sullivan,F,48075,7323,17776,,4,121000,121141,120261,120259,,
121017,US,Orion USA,Engineering,Engineering,Engineering,Technician II,Gilbert Arizmendi,M,29225,10232,17957,,5,121016,121000,121141,120261,120259,
121018,US,Orion USA,Sales,Sales,Assorted Sports Articles,Sales Rep. II,Julienne Magolan,F,27560,-4381,6575,17286,5,121144,121142,121141,120261,120259,
121019,US,Orion USA,Sales,Sales,Assorted Sports Articles,Sales Rep. IV,Scott Desanctis,M,31320,11133,17684,18109,5,121144,121142,121141,120261,120259,
121020,US,Orion USA,Sales,Sales,Assorted Sports Articles,Sales Rep. IV,Cherda Ridley,F,31750,10280,16922,,5,121144,121142,121141,120261,120259,
121021,US,Orion USA,Sales,Sales,Assorted Sports Articles,Sales Rep. IV,Priscilla Farren,F,32985,6918,13939,,5,121144,121142,121141,120261,120259,
121022,US,Orion USA,Sales,Sales,Assorted Sports Articles,Sales Rep. IV,Robert Stevens,M,32210,8701,16833,17775,5,121144,121142,121141,120261,120259,
121023,US,Orion USA,Sales,Sales,Assorted Sports Articles,Sales Rep. I,Shawn Fuller,M,26010,2994,12174,18140,5,121144,121142,121141,120261,120259,
121024,US,Orion USA,Sales,Sales,Assorted Sports Articles,Sales Rep. II,Michael Westlund,M,26600,10491,17653,,5,121144,121142,121141,120261,120259,
121025,US,Orion USA,Sales,Sales,Assorted Sports Articles,Sales Rep. II,Barnaby Cassey,M,28295,-2274,7183,,5,121144,121142,121141,120261,120259,
121026,US,Orion USA,Sales,Sales,Children Sports,Sales Rep. IV,Terrill Jaime,M,31515,11269,18353,,5,121144,121142,121141,120261,120259,
121027,US,Orion USA,Sales,Sales,Children Sports,Sales Rep. II,Allan Rudder,M,26165,3047,12388,,5,121144,121142,121141,120261,120259,
121028,US,Orion USA,Sales,Sales,Children Sports,Sales Rep. I,William Smades,M,26585,11805,18567,,5,121144,121142,121141,120261,120259,
121029,US,Orion USA,Sales,Sales,Children Sports,Sales Rep. I,Kuo-Chung Mcelwee,M,27225,3278,12388,,5,121144,121142,121141,120261,120259,
121030,US,Orion USA,Sales,Sales,Children Sports,Sales Rep. I,Jeryl Areu,M,26745,8716,16468,,5,121144,121142,121141,120261,120259,
121031,US,Orion USA,Sales,Sales,Children Sports,Sales Rep. III,Scott Filan,M,28060,3112,10805,,5,121144,121142,121141,120261,120259,
121032,US,Orion USA,Sales,Sales,Children Sports,Sales Rep. IV,Nasim Smith,M,31335,11742,18322,,5,121144,121142,121141,120261,120259,
121033,US,Orion USA,Sales,Sales,Children Sports,Sales Rep. III,Kristie Snitzer,F,29775,11267,17684,,5,121144,121142,121141,120261,120259,
121034,US,Orion USA,Sales,Sales,Children Sports,Sales Rep. II,John Kirkman,M,27110,11923,18628,,5,121144,121142,121141,120261,120259,
121035,US,Orion USA,Sales,Sales,Children Sports,Sales Rep. II,James Blackley,M,26460,-4299,6575,,5,121144,121142,121141,120261,120259,
121036,US,Orion USA,Sales,Sales,Clothes,Sales Rep. I,Teresa Mesley,F,25965,11887,17440,18201,5,121144,121142,121141,120261,120259,
121037,US,Orion USA,Sales,Sales,Clothes,Sales Rep. III,Muthukumar Miketa,M,28310,6737,16861,,5,121144,121142,121141,120261,120259,
121038,US,Orion USA,Sales,Sales,Clothes,Sales Rep. I,David Anstey,M,25285,11731,18475,18659,5,121144,121142,121141,120261,120259,
121039,US,Orion USA,Sales,Sales,Clothes,Sales Rep. II,Donald Washington,M,27460,-577,8887,,5,121144,121142,121141,120261,120259,
121040,US,Orion USA,Sales,Sales,Clothes,Sales Rep. III,Brienne Darrohn,F,29525,1282,9801,,5,121144,121142,121141,120261,120259,
121041,US,Orion USA,Sales,Sales,Clothes,Sales Rep. II,Jaime Wetherington,F,26120,-4349,6575,,5,121144,121142,121141,120261,120259,
121042,US,Orion USA,Sales,Sales,Clothes,Sales Rep. III,Joseph Robbin-Coker,M,28845,8494,16010,,5,121144,121142,121141,120261,120259,
121043,US,Orion USA,Sales,Sales,Clothes,Sales Rep. II,Sigrid Kagarise,F,28225,5061,13209,,5,121144,121142,121141,120261,120259,
121044,US,Orion USA,Sales,Sales,Clothes,Sales Rep. I,Ray Abbott,M,25660,-386,7152,,5,121144,121142,121141,120261,120259,
121045,US,Orion USA,Sales,Sales,Golf,Sales Rep. II,Cascile Hampton,F,28560,3086,13880,17591,5,121143,121142,121141,120261,120259,
121046,US,Orion USA,Sales,Sales,Golf,Sales Rep. I,Roger Mandzak,M,25845,10477,18444,18628,5,121143,121142,121141,120261,120259,
121047,US,Orion USA,Sales,Sales,Golf,Sales Rep. I,Karen Grzebien,F,25820,8730,18506,18687,5,121143,121142,121141,120261,120259,
121048,US,Orion USA,Sales,Sales,Golf,Sales Rep. I,Lawrie Clark,F,26560,10402,18506,18687,5,121143,121142,121141,120261,120259,
121049,US,Orion USA,Sales,Sales,Golf,Sales Rep. I,Perrior Bataineh,F,26930,11002,18597,,5,121143,121142,121141,120261,120259,
121050,US,Orion USA,Sales,Sales,Golf,Sales Rep. II,Patricia Capristo-Abramczyk,F,26080,10969,18597,,5,121143,121142,121141,120261,120259,
121051,US,Orion USA,Sales,Sales,Golf,Sales Rep. I,Glorina Myers,F,26025,-2435,8340,,5,121143,121142,121141,120261,120259,
121052,US,Orion USA,Sales,Sales,Golf,Sales Rep. II,Richard Fay,M,26900,10966,18567,,5,121143,121142,121141,120261,120259,
121053,US,Orion USA,Sales,Sales,Indoor Sports,Sales Rep. III,Tywanna Mcdade,F,29955,-4117,6606,,5,121143,121142,121141,120261,120259,
121054,US,Orion USA,Sales,Sales,Indoor Sports,Sales Rep. III,Daniel Pulliam,M,29805,-415,7610,,5,121143,121142,121141,120261,120259,
121055,US,Orion USA,Sales,Sales,Indoor Sports,Sales Rep. III,Clement Davis,M,30185,11695,18475,,5,121143,121142,121141,120261,120259,
121056,US,Orion USA,Sales,Sales,Shoes,Sales Rep. II,Stacey Lyszyk,F,28325,10413,17287,,5,121143,121142,121141,120261,120259,
121057,US,Orion USA,Sales,Sales,Shoes,Sales Rep. I,Tachaun Voron,M,25125,1455,9101,,5,121143,121142,121141,120261,120259,
121058,US,Orion USA,Sales,Sales,Shoes,Sales Rep. I,Del Kohake,M,26270,6767,17075,,5,121143,121142,121141,120261,120259,
121059,US,Orion USA,Sales,Sales,Shoes,Sales Rep. II,Jacqulin Carhide,F,27425,1393,9222,17531,5,121143,121142,121141,120261,120259,
121060,US,Orion USA,Sales,Sales,Shoes,Sales Rep. III,Elizabeth Spofford,F,28800,-4224,6575,,5,121143,121142,121141,120261,120259,
121061,US,Orion USA,Sales,Sales,Shoes,Sales Rep. III,Lauris Hassam,M,29815,-534,10409,,5,121143,121142,121141,120261,120259,
121062,US,Orion USA,Sales,Sales,Outdoors,Sales Rep. IV,Debra Armant,F,30305,10528,18475,,5,121145,121142,121141,120261,120259,
121063,US,Orion USA,Sales,Sales,Outdoors,Sales Rep. II,Regi Kinol,M,35990,8608,18110,,5,121145,121142,121141,120261,120259,
121064,US,Orion USA,Sales,Sales,Outdoors,Sales Rep. I,Asishana Polky,M,25110,2949,13027,,5,121145,121142,121141,120261,120259,
121065,US,Orion USA,Sales,Sales,Outdoors,Sales Rep. III,Corneille Malta,F,28040,10475,18353,,5,121145,121142,121141,120261,120259,
121066,US,Orion USA,Sales,Sales,Outdoors,Sales Rep. II,Ceresh Norman,F,27250,-4148,6575,18201,5,121145,121142,121141,120261,120259,
121067,US,Orion USA,Sales,Sales,Outdoors,Sales Rep. IV,Jeanilla Macnair,F,31865,10975,18322,18506,5,121145,121142,121141,120261,120259,
121068,US,Orion USA,Sales,Sales,Outdoors,Sales Rep. II,Salaheloin Osuba,M,27550,5084,13393,,5,121145,121142,121141,120261,120259,
121069,US,Orion USA,Sales,Sales,Outdoors,Sales Rep. II,Jason Lapsley,M,26195,4826,12692,,5,121145,121142,121141,120261,120259,
121070,US,Orion USA,Sales,Sales,Outdoors,Sales Rep. III,Agnieszka Holthouse,F,29385,10535,18294,,5,121145,121142,121141,120261,120259,
121071,US,Orion USA,Sales,Sales,Outdoors,Sales Rep. III,John Hoppmann,M,28625,1348,7914,,5,121145,121142,121141,120261,120259,
121072,US,Orion USA,Sales,Sales,Outdoors,Sales Rep. I,Christer North,M,26105,8410,17776,18201,5,121145,121142,121141,120261,120259,
121073,US,Orion USA,Sales,Sales,Outdoors,Sales Rep. I,Donald Court,M,27100,-2422,6575,,5,121145,121142,121141,120261,120259,
121074,US,Orion USA,Sales,Sales,Outdoors,Sales Rep. I,Eric Michonski,M,26990,1155,11962,,5,121145,121142,121141,120261,120259,
121075,US,Orion USA,Sales,Sales,Outdoors,Sales Rep. II,Kasha Sugg,F,28395,-4026,6575,,5,121145,121142,121141,120261,120259,
121076,US,Orion USA,Sales,Sales,Racket Sports,Sales Rep. II,Micah Cobb,M,26685,3204,9862,17683,5,121143,121142,121141,120261,120259,
121077,US,Orion USA,Sales,Sales,Racket Sports,Sales Rep. III,Bryce Smotherly,M,28585,10475,18536,,5,121143,121142,121141,120261,120259,
121078,US,Orion USA,Sales,Sales,Racket Sports,Sales Rep. I,Lionel Wende,M,27485,-2436,8340,,5,121143,121142,121141,120261,120259,
121079,US,Orion USA,Sales,Sales,Racket Sports,Sales Rep. I,Azmi Mees,M,25770,6728,15280,,5,121143,121142,121141,120261,120259,
121080,US,Orion USA,Sales,Sales,Racket Sports,Sales Rep. I,Kumar Chinnis,M,32235,1119,11566,,5,121143,121142,121141,120261,120259,
121081,US,Orion USA,Sales,Sales,Racket Sports,Sales Rep. III,Susie Knudson,F,30235,-2470,7396,,5,121143,121142,121141,120261,120259,
121082,US,Orion USA,Sales,Sales,Racket Sports,Sales Rep. III,Richard Debank,M,28510,-2371,7944,,5,121143,121142,121141,120261,120259,
121083,US,Orion USA,Sales,Sales,Racket Sports,Sales Rep. I,Tingmei Sutton,F,27245,1165,8460,,5,121143,121142,121141,120261,120259,
121084,US,Orion USA,Sales,Sales,Racket Sports,Sales Rep. I,Tulsidas Ould,M,22710,3150,12784,,5,121143,121142,121141,120261,120259,
121085,US,Orion USA,Sales,Sales,Running - Jogging,Sales Rep. IV,Rebecca Huslage,M,32235,11273,18628,,5,121143,121142,121141,120261,120259,
121086,US,Orion USA,Sales,Sales,Running - Jogging,Sales Rep. I,John-Michael Plybon,M,26820,-4033,6575,,5,121143,121142,121141,120261,120259,
121087,US,Orion USA,Sales,Sales,Running - Jogging,Sales Rep. II,Virtina O'Suilleabhain,F,28325,6915,15765,18352,5,121143,121142,121141,120261,120259,
121088,US,Orion USA,Sales,Sales,Running - Jogging,Sales Rep. I,Momolu Kernitzki,M,27240,11849,18628,,5,121143,121142,121141,120261,120259,
121089,US,Orion USA,Sales,Sales,Running - Jogging,Sales Rep. II,Gregory Sauder,M,28095,-498,6756,18566,5,121143,121142,121141,120261,120259,
121090,US,Orion USA,Sales,Sales,Running - Jogging,Sales Rep. I,Betty Klibbe,F,26600,-561,8797,,5,121143,121142,121141,120261,120259,
121091,US,Orion USA,Sales,Sales,Running - Jogging,Sales Rep. II,Ernest Kadiri,M,27325,4798,12054,,5,121143,121142,121141,120261,120259,
121092,US,Orion USA,Sales,Sales,Running - Jogging,Sales Rep. I,Gynell Pritt,F,25680,6641,17014,,5,121143,121142,121141,120261,120259,
121093,US,Orion USA,Sales,Sales,Running - Jogging,Sales Rep. I,Carl Vasconcellos,M,27410,3121,13880,17347,5,121143,121142,121141,120261,120259,
121094,US,Orion USA,Sales,Sales,Running - Jogging,Sales Rep. I,Larry Tate,M,26555,-724,8279,,5,121143,121142,121141,120261,120259,
121095,US,Orion USA,Sales,Sales,Swim Sports,Sales Rep. II,Sara Kratzke,F,28010,4852,12965,,5,121143,121142,121141,120261,120259,
121096,US,Orion USA,Sales,Sales,Swim Sports,Sales Rep. I,Robert Newstead,M,26335,4886,14365,,5,121143,121142,121141,120261,120259,
121097,US,Orion USA,Sales,Sales,Swim Sports,Sales Rep. II,Willeta Chernega,F,26830,6870,14518,,5,121143,121142,121141,120261,120259,
121098,US,Orion USA,Sales,Sales,Swim Sports,Sales Rep. I,Hal Heatwole,M,27475,11769,18383,,5,121143,121142,121141,120261,120259,
121099,US,Orion USA,Sales,Sales,Swim Sports,Sales Rep. IV,Royall Mrvichin,M,32725,8478,16192,,5,121143,121142,121141,120261,120259,
121100,US,Orion USA,Sales,Sales,Swim Sports,Sales Rep. II,Tzue-Ing Cormell,M,28135,-2440,7396,,5,121143,121142,121141,120261,120259,
121101,US,Orion USA,Sales,Sales,Swim Sports,Sales Rep. I,Burnetta Buckner,F,25390,11197,18567,,5,121143,121142,121141,120261,120259,
121102,US,Orion USA,Sales,Sales,Team Sports,Sales Rep. I,Rocheal Flammia,F,27115,8577,18414,,5,121143,121142,121141,120261,120259,
121103,US,Orion USA,Sales,Sales,Team Sports,Sales Rep. I,Brian Farnsworth,M,27260,11806,18506,,5,121143,121142,121141,120261,120259,
121104,US,Orion USA,Sales,Sales,Team Sports,Sales Rep. II,Leoma Johnson,F,28315,3238,11048,16832,5,121143,121142,121141,120261,120259,
121105,US,Orion USA,Sales,Sales,Team Sports,Sales Rep. III,Jessica Savacool,F,29545,8529,17167,,5,121143,121142,121141,120261,120259,
121106,US,Orion USA,Sales,Sales,Team Sports,Sales Rep. I,James Hilburger,M,25880,4781,14641,,5,121143,121142,121141,120261,120259,
121107,US,Orion USA,Sales,Sales,Team Sports,Sales Rep. IV,Rose Anger,F,31380,11071,18444,,5,121143,121142,121141,120261,120259,
121108,US,Orion USA,Sales,Sales,Team Sports,Sales Rep. I,Libby Levi,F,25930,11873,18567,18748,5,121143,121142,121141,120261,120259,
121109,US,Orion USA,Sales,Sales,Team Sports,Sales Rep. I,Harold Boulus,M,26035,5057,12539,,5,121143,121142,121141,120261,120259,
121110,US,Orion USA,Sales,Sales,Temporary,Temp. Sales Rep.,Albert Knapp,M,26370,-4279,18597,18627,5,121145,121142,121141,120261,120259,
121111,US,Orion USA,Sales,Sales,Temporary,Temp. Sales Rep.,Salim Maholo,M,26885,-4185,18597,18747,5,121145,121142,121141,120261,120259,
121112,US,Orion USA,Sales,Sales,Temporary,Temp. Sales Rep.,Lee Stouchko,M,26855,11304,18597,18627,5,121145,121142,121141,120261,120259,
121113,US,Orion USA,Sales,Sales,Temporary,Temp. Sales Rep.,Karen Costine,F,27480,-679,18597,18658,5,121145,121142,121141,120261,120259,
121114,US,Orion USA,Sales,Sales,Temporary,Temp. Sales Rep.,Okema Whipkey,F,26515,-4075,18597,18808,5,121145,121142,121141,120261,120259,
121115,US,Orion USA,Sales,Sales,Temporary,Temp. Sales Rep.,Aquilla O'Carroll,M,26430,1139,18597,18747,5,121145,121142,121141,120261,120259,
121116,US,Orion USA,Sales,Sales,Temporary,Temp. Sales Rep.,Mary Bond-Teague,F,26670,3188,18597,18717,5,121145,121142,121141,120261,120259,
121117,US,Orion USA,Sales,Sales,Temporary,Temp. Sales Rep.,Teresa Sergi,F,26640,6651,18597,18627,5,121145,121142,121141,120261,120259,
121118,US,Orion USA,Sales,Sales,Temporary,Temp. Sales Rep.,Paul Lawson,M,25725,8460,18597,18778,5,121145,121142,121141,120261,120259,
121119,US,Orion USA,Sales,Sales,Temporary,Temp. Sales Rep.,Bruce Armogida,M,25205,3229,18597,18686,5,121145,121142,121141,120261,120259,
121120,US,Orion USA,Sales,Sales,Temporary,Temp. Sales Rep.,Susan Labach,F,25020,6872,18597,18686,5,121145,121142,121141,120261,120259,
121121,US,Orion USA,Sales,Sales,Temporary,Temp. Sales Rep.,Halouise Cassone,F,25735,11021,18597,18778,5,121145,121142,121141,120261,120259,
121122,US,Orion USA,Sales,Sales,Temporary,Temp. Sales Rep.,Stancey Scarbrough,M,26265,11017,18597,18717,5,121145,121142,121141,120261,120259,
121123,US,Orion USA,Sales,Sales,Temporary,Temp. Sales Rep.,Randy Helyar,M,26410,-4266,18597,18717,5,121145,121142,121141,120261,120259,
121124,US,Orion USA,Sales,Sales,Temporary,Temp. Sales Rep.,Deginald Gonzalez,M,26925,4794,18597,18627,5,121145,121142,121141,120261,120259,
121125,US,Orion USA,Sales,Sales,Trainees,Trainee,Michael Holt,M,25315,6681,17167,17347,5,121145,121142,121141,120261,120259,
121126,US,Orion USA,Sales,Sales,Trainees,Trainee,James Penhale,M,26015,-432,17167,17347,5,121145,121142,121141,120261,120259,
121127,US,Orion USA,Sales,Sales,Trainees,Trainee,Keyna Mangini,F,25435,11203,18049,18231,5,121145,121142,121141,120261,120259,
121128,US,Orion USA,Sales,Sales,Trainees,Trainee,Glacia Nazar,F,25405,6751,17167,17347,5,121145,121142,121141,120261,120259,
121129,US,Orion USA,Sales,Sales,Trainees,Trainee,Yusef Hafley,M,30945,3043,17167,17347,5,121145,121142,121141,120261,120259,
121130,US,Orion USA,Sales,Sales,Trainees,Trainee,Gary Herndon,M,25255,10247,17563,17744,5,121145,121142,121141,120261,120259,
121131,US,Orion USA,Sales,Sales,Trainees,Trainee,William Pantages,M,25445,4929,17167,17347,5,121145,121142,121141,120261,120259,
121132,US,Orion USA,Sales,Sales,Trainees,Trainee,Shia-Ling Digiorgio,M,24390,-692,17167,17347,5,121145,121142,121141,120261,120259,
121133,US,Orion USA,Sales,Sales,Trainees,Trainee,Peter Pringley,M,25405,8714,17167,17347,5,121145,121142,121141,120261,120259,
121134,US,Orion USA,Sales,Sales,Trainees,Trainee,Paul Tacosa,M,25585,3105,17167,17347,5,121145,121142,121141,120261,120259,
121135,US,Orion USA,Sales,Sales,Winter Sports,Sales Rep. I,Tammy Ruta,F,27010,-573,6787,,5,121145,121142,121141,120261,120259,
121136,US,Orion USA,Sales,Sales,Winter Sports,Sales Rep. I,Lesia Galarneau,F,27460,6770,17136,17805,5,121145,121142,121141,120261,120259,
121137,US,Orion USA,Sales,Sales,Winter Sports,Sales Rep. I,Michael. R. Boocks,M,27055,11705,18353,,5,121145,121142,121141,120261,120259,
121138,US,Orion USA,Sales,Sales,Winter Sports,Sales Rep. I,Hershell Tolley,M,27265,-2498,6575,,5,121145,121142,121141,120261,120259,
121139,US,Orion USA,Sales,Sales,Winter Sports,Sales Rep. II,Diosdado Mckee,F,27700,1326,11504,,5,121145,121142,121141,120261,120259,
121140,US,Orion USA,Sales,Sales,Winter Sports,Sales Rep. I,Saunders Briggi,M,26335,8423,16527,18293,5,121145,121142,121141,120261,120259,
121141,US,Orion USA,Sales Management,Sales Management,Sales Management,Vice President,Henri Le Bleu,M,194885,-4213,6575,,2,120261,120259,,,,
121142,US,Orion USA,Sales Management,Sales Management,Sales Management,Director,Reginald Steiber,M,156065,4793,13635,,3,121141,120261,120259,,,
121143,US,Orion USA,Sales Management,Sales Management,Sales Management,Senior Sales Manager,Louis Favaron,M,95090,5078,15157,,4,121142,121141,120261,120259,,
121144,US,Orion USA,Sales Management,Sales Management,Sales Management,Sales Manager,Renee Capachietti,F,83505,3101,13088,,4,121142,121141,120261,120259,,
121145,US,Orion USA,Sales Management,Sales Management,Sales Management,Sales Manager,Dennis Lansberry,M,84260,-2231,7396,,4,121142,121141,120261,120259,,
121146,US,Orion USA,Sales Management,Sales Management,Sales Management,Secretary III,Julieanne Sangiorgio,F,29320,11300,18353,,3,121141,120261,120259,,,
121147,US,Orion USA,Sales Management,Sales Management,Sales Management,Secretary II,Christine Sneed,F,29145,4896,11566,,4,121142,121141,120261,120259,,
121148,US,Orion USA,Sales Management,Sales Management,Sales Management,Business Analyst II,Shane Sadig,M,52930,4749,15341,17197,3,121141,120261,120259,,,
;;;;
run;

data ORION.PRICE_CURRENT;
   attrib Product_ID length=8 label='Product ID' format=12.;
   attrib Start_Date length=8 label='Start Date' format=DATE9.;
   attrib End_Date length=8 label='End Date' format=DATE9.;
   attrib Unit_Cost_Price length=8 label='Unit Cost Price' format=DOLLAR13.2;
   attrib Unit_Sales_Price length=8 label='Unit Sales Price' format=DOLLAR13.2;
   attrib Factor length=8 label='Yearly increase in Price' format=5.2;

   infile datalines dsd;
   input
      Product_ID
      Start_Date
      End_Date
      Unit_Cost_Price
      Unit_Sales_Price
      Factor
   ;
datalines4;
210200100009,18787,2936547,15.5,34.7,1
210200100017,18651,2936547,17.8,40,1
210200600112,18631,2936547,9.25,21.8,1
210200900038,18659,2936547,9.3,20.3,1
210201000050,18719,2936547,9,19.6,1
210201000126,18739,2936547,2.3,6.5,1
210201100004,18735,2936547,21.5,49.2,1.01
220100100309,18777,2936547,48.25,96.3,1
220100100354,18755,2936547,8.45,17,1
220100300008,18731,2936547,34.35,85.7,1
220100300042,18675,2936547,84.35,208.6,1
220100400023,18797,2936547,40.75,93.6,1
220100700022,18635,2936547,24.1,56.9,1
220100700027,18751,2936547,29.85,59.5,100
220100700046,18639,2936547,73.6,154.4,1.01
220100700052,18757,2936547,57.85,121.6,1.01
220100800001,18667,2936547,18.35,38.6,1
220100800096,18727,2936547,35.3,74.1,1
220100900006,18755,2936547,35.45,88.4,1
220101200006,18782,2936547,22.15,55.2,1
220101200029,18635,2936547,23.75,54.8,1
220101300012,18767,2936547,8.8,19.4,1
220101300017,18802,2936547,7.5,16.6,1
220101400017,18711,2936547,5,11.1,1
220101400060,18792,2936547,14.8,32.4,1
220101400061,18757,2936547,23.3,51,1
220101400098,18737,2936547,14.95,32.7,1
220101400117,18667,2936547,21.25,46.4,1
220101400130,18635,2936547,5.7,16.9,1
220101400148,18707,2936547,4.75,10.5,1
220101400201,18695,2936547,18.05,40.6,1
220101400237,18751,2936547,46.9,102.9,1
220101400238,18777,2936547,25.95,56.9,1
220101400269,18723,2936547,29.8,67,1
220101400285,18751,2936547,27.05,59.4,1
220101400290,18715,2936547,34.1,74.8,1
220101400310,18697,2936547,14.3,32.1,1
220101400328,18743,2936547,8.85,19,1
220101400385,18782,2936547,13.4,26.9,1
220200100129,18755,2936547,39.45,80,1
220200200022,18711,2936547,33.9,5730,1
220200200036,18635,2936547,27.4,60.2,1
220200200071,18702,2936547,47,108.2,1
220200200073,18663,2936547,66.35,145.9,1
220200200077,18691,2936547,63.15,138.8,1.01
220200200079,18807,2936547,64.85,142.9,1
220200300002,18663,2936547,17.5,38.5,1
220200300005,18755,2936547,52.35,115,1
220200300015,18742,2936547,52.4,115,1
220200300116,18697,2936547,38.35,84.2,1
230100100033,18667,2936547,26.65,57.8,1
230100100063,18747,2936547,177.8,387.7,1
230100200025,18792,2936547,125.25,275.9,1
230100200073,18732,2936547,20.2,46.9,1
230100200074,18707,2936547,26.45,54.1,1.01
230100300013,18703,2936547,5.05,25,1.01
230100300023,18717,2936547,15,36,1
230100400010,18751,2936547,16.85,40.2,1
230100400025,18742,2936547,6.6,17,1
230100500087,18792,2936547,40.55,97.5,1
230100500092,18743,2936547,49.05,117.8,1
230100500093,18777,2936547,55.85,132.8,1
230100500095,18807,2936547,42,101.7,1
230100600036,18722,2936547,50.4,103.2,1
230100600039,18767,2936547,60.8,127.1,1.02
230100700002,18742,2936547,135,220,1
230100700008,18747,2936547,253.2,519.3,1
230100700009,18687,2936547,289.95,568.1,1
240100100029,18737,2936547,51.7,119.5,1
240100100065,18679,2936547,13.8,34.7,1
240100100159,18703,2936547,13.9,31.4,1
240100100184,18763,2936547,88.8,190.4,1
240100100305,18692,2936547,4.1,8.9,1
240100100312,18792,2936547,7.7,18.1,1
240100100365,18639,2936547,87.4,191.6,1
240100100477,18655,2936547,3.3,8.5,1
240100100605,18683,2936547,20.75,48.2,1
240100100610,18787,2936547,29.45,65.2,1
240100100672,18747,2936547,84.9,197.9,1
240100100676,18747,2936547,18.65,43.4,1
240100100690,18707,2936547,86.1,201.5,1
240100100737,18752,2936547,20.65,47.9,1
240100200001,18692,2936547,6.35,16,1
240100400004,18692,2936547,51.15,102.4,1
240100400005,18777,2936547,131.65,266.4,1
240100400006,18751,2936547,117.75,238.2,1.01
240100400037,18702,2936547,113.65,231,1
240100400043,18703,2936547,139.45,282,1
240100400044,18755,2936547,194.6,393.9,1.01
240100400070,18757,2936547,127.95,175.9,1
240100400080,18699,2936547,110.95,222,1
240100400083,18763,2936547,54.7,109.5,1
240100400085,18711,2936547,30.95,64.5,1
240100400129,18697,2936547,111,237.4,1
240100400142,18699,2936547,90.8,181.3,1.03
240100400143,18767,2936547,83.4,166.6,1
240100400147,18655,2936547,131.5,265.9,1.01
240100400151,18727,2936547,209.45,419,1
240200100007,18703,2936547,11.8,24.7,1
240200100020,18711,2936547,104.6,197.1,1
240200100051,18802,2936547,72,140.3,1
240200100052,18655,2936547,51.9,100.6,1
240200100056,18647,2936547,19.9,,1
240200100057,18767,2936547,20.25,42,1
240200100073,18667,2936547,12.6,22.3,1
240200100098,18702,2936547,6.75,14.6,1
240200100101,18792,2936547,10.3,19.5,1
240200100116,18667,2936547,124.9,219.5,1
240200100154,18715,2936547,11.95,26.6,1
240200100164,18682,2936547,28.15,56.1,1
240200100173,18687,2936547,247.7,484.3,1
240200100211,18687,2936547,60.65,121,1
240200100225,18751,2936547,77.85,153.1,1
240200100226,18683,2936547,86.65,183.9,1
240200100227,18772,2936547,75.9,161.9,1
240200100230,18735,2936547,6.65,14.7,1
240200200007,18651,2936547,8.4,84.2,1
240200200013,18717,2936547,42.6,426.2,1
240200200015,18711,2936547,12.25,27.9,1.02
240200200020,18683,2936547,14,150.1,1
240200200024,18727,2936547,12.5,125.4,1
240200200039,18663,2936547,9.95,24.1,1.01
240200200044,18639,2936547,19.6,48.9,1
240200200081,18671,2936547,10.75,107.3,1
240200200091,18672,2936547,72.6,181.3,1
240300100028,18757,2936547,251.35,533.2,1
240300100032,18782,2936547,315.15,630.4,1
240300200018,18797,2936547,41.65,91.5,1
240300200058,18667,2936547,41.7,91.8,1
240300300024,18772,2936547,23.2,54.6,1
240300300065,18757,2936547,146.35,321.5,1
240300300090,18742,2936547,244.15,536.3,1.01
240400200012,18695,2936547,75.95,175.7,1
240400200036,18747,2936547,25.85,57.1,0.01
240400200057,18759,2936547,65.85,145.8,1.02
240400200097,18727,2936547,124.2,416.8,1
240400300039,18727,2936547,7.9,19.6,1
240500100004,18712,2936547,28,63.5,1
240500100015,18772,2936547,25.8,58.1,1
240500100029,18763,2936547,26.1,58.9,1
240500100039,18737,2936547,15.4,34.5,1
240500100041,18667,2936547,51.7,129.1,1
240500100043,18747,2936547,8.85,26.2,1
240500200056,18639,2936547,11.75,24.5,1
240500200081,18635,2936547,56.05,134.5,1
240500200082,18695,2936547,16.45,39.2,1
240500200093,18687,2936547,19.75,41.7,1
240500200121,18727,2936547,13.25,27.8,1
240500200122,18671,2936547,11.5,24.1,1
240600100016,18699,2936547,22.1,55.8,1
240600100080,18763,2936547,9.2,30.4,1
240600100102,18702,2936547,19.7,46.1,1
240600100181,18792,2936547,16.3,37.4,1
240600100185,18707,2936547,15.6,35.1,1
240700100001,18707,2936547,12.3,23.6,1
240700100004,18763,2936547,13.75,26.6,1
240700200009,18739,2936547,11.35,28,1
240700200010,18707,2936547,10.3,26.9,1
240700200021,18742,2936547,10.55,19.6,1
240700200024,18643,2936547,6.6,16.7,1
240700400020,18717,2936547,41.3,79.3,1
240700400031,18687,2936547,31.6,63,1
240800200002,18743,2936547,71.55,178.875,1
240800200008,18717,2936547,68.2,170.5,1
240800200009,18782,2936547,34.9,87.2,1
240800200010,18679,2936547,49.95,125.2,1
240800200020,18792,2936547,85.15,187.2,1
240800200021,18687,2936547,42.45,97.8,1
240800200034,18777,2936547,35.7,78.5,1.02
240800200037,18711,2936547,24.9,57.5,10.2
240800200063,18682,2936547,19.7,43.4,1.01
;;;;
run;

data ORION.PRICE_NEW;
   attrib Product_ID length=8 label='Product ID' format=12.;
   attrib Start_Date length=8 label='Start Date' format=DATE9.;
   attrib End_Date length=8 label='End Date' format=DATE9.;
   attrib Unit_Cost_Price length=8 label='Unit Cost Price' format=DOLLAR13.2;
   attrib Unit_Sales_Price length=8 label='Unit Sales Price' format=DOLLAR13.2;

   infile datalines dsd;
   input
      Product_ID
      Start_Date
      End_Date
      Unit_Cost_Price
      Unit_Sales_Price
   ;
datalines4;
210200200023,18812,2936547,8.25,19.8
210200600067,18927,2936547,28.9,67
210200600085,18867,2936547,17.85,39.4
210200900033,18887,2936547,6.45,14.2
210201000198,18907,2936547,26.8,60.1
220100100189,18837,2936547,47.45,94.7
220100100192,18852,2936547,13.8,27.4
220100200004,18837,2936547,2.6,6.5
220100700002,18917,2936547,89.95,188.6
220100700024,18872,2936547,49.8,104.6
220100700042,18962,2936547,38.45,90.6
220100800009,18962,2936547,24.95,52.5
220100800040,18887,2936547,60.2,126.5
220100800071,18962,2936547,16.15,33.7
220101200025,18852,2936547,11.7,26.9
220101300001,18902,2936547,14.95,33.6
220101400004,18832,2936547,48.15,105.7
220101400047,18852,2936547,11.1,24.2
220101400088,18932,2936547,17.5,38.4
220101400091,18927,2936547,15.6,34
220101400145,18877,2936547,7.75,16.7
220101400216,18917,2936547,11.3,24.6
220101400265,18847,2936547,16.55,37.1
220101400276,18852,2936547,31.2,68.4
220101400306,18857,2936547,33.7,74
220101400339,18872,2936547,14.75,32.3
220101400349,18942,2936547,4.8,11.9
220101400363,18897,2936547,16.95,39
220101400373,18917,2936547,23.65,51.8
220101400387,18872,2936547,5.85,12.6
220200100009,18892,2936547,30.5,63.4
220200100226,18927,2936547,66.7,133.2
220200300079,18922,2936547,28.9,64.9
220200300157,18957,2936547,36.65,73.4
230100100018,18877,2936547,67.4,159.1
230100200022,18852,2936547,58,122
230100200059,18907,2936547,16.8,39.1
230100300006,18827,2936547,34.35,68.5
230100300010,18862,2936547,19.8,49.4
230100400012,18812,2936547,12.15,30.3
230100600035,18842,2936547,16,33.2
230100700011,18917,2936547,120.3,291.7
240100100031,18867,2936547,1.3,3.7
240100100063,18862,2936547,9.9,24.6
240100100232,18867,2936547,1.3,3.2
240100100410,18897,2936547,10.4,22.7
240100100434,18877,2936547,8.05,16.4
240100100463,18892,2936547,6.05,14.7
240100100581,18827,2936547,11.95,29
240100100665,18932,2936547,17.25,41.5
240100100679,18927,2936547,19.5,45.8
240100200004,18942,2936547,14.8,35.2
240100400062,18947,2936547,54,113.2
240200100034,18927,2936547,4.45,12.2
240200100053,18852,2936547,44.95,87.2
240200100081,18952,2936547,3.65,8.3
240200100118,18952,2936547,89.55,175.5
240200100124,18832,2936547,12.35,24.5
240200100181,18872,2936547,56.6,109.3
240200100183,18822,2936547,47.95,95.7
240200100207,18897,2936547,53.35,107.9
240200100232,18857,2936547,14.4,28.6
240200100246,18817,2936547,7.9,16.2
240200200011,18962,2936547,13,135.7
240200200026,18822,2936547,41.65,104
240200200035,18867,2936547,39.65,98.9
240200200061,18942,2936547,58.85,147.1
240200200068,18927,2936547,159.15,313.8
240300300070,18937,2936547,231.9,509.8
240400200003,18957,2936547,3,6.2
240400300013,18872,2936547,22.6,54.3
240500100026,18922,2936547,24.5,55.2
240500100057,18917,2936547,17.1,38.4
240500100062,18827,2936547,24.05,55.1
240500200003,18847,2936547,11.4,23.8
240500200016,18847,2936547,14.5,31.7
240500200042,18937,2936547,19.35,40.6
240500200130,18932,2936547,11.7,28
240600100010,18882,2936547,6.75,16.7
240700100017,18962,2936547,11.4,26.6
240700200004,18957,2936547,2.2,4.2
240700200007,18832,2936547,2.2,5.1
240700200018,18947,2936547,10.3,18.8
240700400003,18957,2936547,5.6,12.4
240700400017,18842,2936547,22.15,47.3
240800100074,18957,2936547,126.7,316.6
240800200030,18867,2936547,19.5,49.5
240800200062,18922,2936547,16.75,36.8
;;;;
run;

data ORION.PRODUCT_DIM;
   attrib Product_ID length=8 label='Product ID' format=12.;
   attrib Product_Line length=$20 label='Product Line';
   attrib Product_Category length=$25 label='Product Category';
   attrib Product_Group length=$25 label='Product Group';
   attrib Product_Name length=$45 label='Product Name';
   attrib Supplier_Country length=$2 label='Supplier Country';
   attrib Supplier_Name length=$30 label='Supplier Name';
   attrib Supplier_ID length=8 label='Supplier ID' format=12.;

   infile datalines dsd;
   input
      Product_ID
      Product_Line
      Product_Category
      Product_Group
      Product_Name
      Supplier_Country
      Supplier_Name
      Supplier_ID
   ;
datalines4;
210200100009,Children,Children Sports,"A-Team, Kids","Kids Sweat Round Neck,Large Logo",US,A Team Sports,3298
210200100017,Children,Children Sports,"A-Team, Kids",Sweatshirt Children's O-Neck,US,A Team Sports,3298
210200200022,Children,Children Sports,"Bathing Suits, Kids",Sunfit Slow Swimming Trunks,US,Nautlius SportsWear Inc,6153
210200200023,Children,Children Sports,"Bathing Suits, Kids",Sunfit Stockton Swimming Trunks Jr.,US,Nautlius SportsWear Inc,6153
210200300006,Children,Children Sports,"Eclipse, Kid's Clothes",Fleece Cuff Pant Kid'S,US,Eclipse Inc,1303
210200300007,Children,Children Sports,"Eclipse, Kid's Clothes",Hsc Dutch Player Shirt Junior,US,Eclipse Inc,1303
210200300052,Children,Children Sports,"Eclipse, Kid's Clothes",Tony's Cut & Sew T-Shirt,US,Eclipse Inc,1303
210200400020,Children,Children Sports,"Eclipse, Kid's Shoes",Kids Baby Edge Max Shoes,US,Eclipse Inc,1303
210200400070,Children,Children Sports,"Eclipse, Kid's Shoes",Tony's Children's Deschutz (Bg) Shoes,US,Eclipse Inc,1303
210200500002,Children,Children Sports,"Lucky Guy, Kids",Children's Mitten,US,AllSeasons Outdoor Clothing,772
210200500006,Children,Children Sports,"Lucky Guy, Kids","Rain Suit, Plain w/backpack Jacket",US,AllSeasons Outdoor Clothing,772
210200500007,Children,Children Sports,"Lucky Guy, Kids",Bozeman Rain & Storm Set,US,AllSeasons Outdoor Clothing,772
210200500016,Children,Children Sports,"Lucky Guy, Kids",Teen Profleece w/Zipper,US,AllSeasons Outdoor Clothing,772
210200600056,Children,Children Sports,"N.D. Gear, Kids",Butch T-Shirt with V-Neck,ES,Luna sastreria S.A.,4742
210200600067,Children,Children Sports,"N.D. Gear, Kids",Children's Knit Sweater,ES,Luna sastreria S.A.,4742
210200600085,Children,Children Sports,"N.D. Gear, Kids",Gordon Children's Tracking Pants,ES,Luna sastreria S.A.,4742
210200600112,Children,Children Sports,"N.D. Gear, Kids",O'my Children's T-Shirt with Logo,ES,Luna sastreria S.A.,4742
210200700016,Children,Children Sports,"Olssons, Kids",Strap Pants BBO,ES,Sportico,798
210200900004,Children,Children Sports,"Osprey, Kids",Kid Basic Tracking Suit,US,Triple Sportswear Inc,3664
210200900033,Children,Children Sports,"Osprey, Kids",Osprey France Nylon Shorts,US,Triple Sportswear Inc,3664
210200900038,Children,Children Sports,"Osprey, Kids",Osprey Girl's Tights,US,Triple Sportswear Inc,3664
210201000050,Children,Children Sports,Tracker Kid's Clothes,Kid Children's T-Shirt,US,3Top Sports,2963
210201000067,Children,Children Sports,Tracker Kid's Clothes,Logo Coord.Children's Sweatshirt,US,3Top Sports,2963
210201000126,Children,Children Sports,Tracker Kid's Clothes,Toddler Footwear Socks with Knobs,US,3Top Sports,2963
210201000198,Children,Children Sports,Tracker Kid's Clothes,South Peak Junior Training Shoes,US,3Top Sports,2963
210201000199,Children,Children Sports,Tracker Kid's Clothes,Starlite Baby Shoes,US,3Top Sports,2963
210201100004,Children,Children Sports,"Ypsilon, Kids",Ypsilon Children's Sweat w/Big Logo,FR,Ypsilon S.A.,14624
220100100019,Clothes & Shoes,Clothes,Eclipse Clothing,Fit Racing Cap,US,Eclipse Inc,1303
220100100025,Clothes & Shoes,Clothes,Eclipse Clothing,Knit Hat,US,Eclipse Inc,1303
220100100044,Clothes & Shoes,Clothes,Eclipse Clothing,Sports glasses Satin Alumin.,US,Eclipse Inc,1303
220100100101,Clothes & Shoes,Clothes,Eclipse Clothing,Big Guy Men's Chaser Poplin Pants,US,Eclipse Inc,1303
220100100105,Clothes & Shoes,Clothes,Eclipse Clothing,Big Guy Men's Clima Fit Jacket,US,Eclipse Inc,1303
220100100125,Clothes & Shoes,Clothes,Eclipse Clothing,Big Guy Men's Dri Fit Singlet,US,Eclipse Inc,1303
220100100153,Clothes & Shoes,Clothes,Eclipse Clothing,Big Guy Men's Fresh Soft Nylon Pants,US,Eclipse Inc,1303
220100100185,Clothes & Shoes,Clothes,Eclipse Clothing,Big Guy Men's Micro Fiber Full Zip Jacket,US,Eclipse Inc,1303
220100100189,Clothes & Shoes,Clothes,Eclipse Clothing,Big Guy Men's Micro Fibre Jacket,US,Eclipse Inc,1303
220100100192,Clothes & Shoes,Clothes,Eclipse Clothing,Big Guy Men's Micro Fibre Shorts XXL,US,Eclipse Inc,1303
220100100197,Clothes & Shoes,Clothes,Eclipse Clothing,Big Guy Men's Mid Layer Jacket,US,Eclipse Inc,1303
220100100235,Clothes & Shoes,Clothes,Eclipse Clothing,Big Guy Men's Running Shorts Dri.Fit,US,Eclipse Inc,1303
220100100241,Clothes & Shoes,Clothes,Eclipse Clothing,Big Guy Men's Santos Shorts Dri Fit,US,Eclipse Inc,1303
220100100272,Clothes & Shoes,Clothes,Eclipse Clothing,Big Guy Men's T-Shirt,US,Eclipse Inc,1303
220100100273,Clothes & Shoes,Clothes,Eclipse Clothing,Big Guy Men's T-Shirt Dri Fit,US,Eclipse Inc,1303
220100100298,Clothes & Shoes,Clothes,Eclipse Clothing,Big Guy Men's Twill Pants Golf,US,Eclipse Inc,1303
220100100304,Clothes & Shoes,Clothes,Eclipse Clothing,Big Guy Men's Victory Peach Poplin Pants,US,Eclipse Inc,1303
220100100309,Clothes & Shoes,Clothes,Eclipse Clothing,Big Guy Men's Woven Warm Up,US,Eclipse Inc,1303
220100100354,Clothes & Shoes,Clothes,Eclipse Clothing,Insu F.I.T Basic,US,Eclipse Inc,1303
220100100371,Clothes & Shoes,Clothes,Eclipse Clothing,Northern Fleece Scarf,US,Eclipse Inc,1303
220100100410,Clothes & Shoes,Clothes,Eclipse Clothing,Toto Tube Socks,US,Eclipse Inc,1303
220100100421,Clothes & Shoes,Clothes,Eclipse Clothing,Trois-fit Running Qtr Socks (Non-Cush),US,Eclipse Inc,1303
220100100513,Clothes & Shoes,Clothes,Eclipse Clothing,Woman's Deception Dress,US,Eclipse Inc,1303
220100100516,Clothes & Shoes,Clothes,Eclipse Clothing,Woman's Dri Fit Airborne Top,US,Eclipse Inc,1303
220100100523,Clothes & Shoes,Clothes,Eclipse Clothing,Woman's Dri-Fit Scoop Neck Bra,US,Eclipse Inc,1303
220100100530,Clothes & Shoes,Clothes,Eclipse Clothing,Woman's Emblished Work-Out Pants,US,Eclipse Inc,1303
220100100536,Clothes & Shoes,Clothes,Eclipse Clothing,Woman's Foxhole Jacket,US,Eclipse Inc,1303
220100100553,Clothes & Shoes,Clothes,Eclipse Clothing,Woman's Short Top Dri Fit,US,Eclipse Inc,1303
220100100568,Clothes & Shoes,Clothes,Eclipse Clothing,Woman's Micro Fibre Anorak,US,Eclipse Inc,1303
220100100581,Clothes & Shoes,Clothes,Eclipse Clothing,Woman's Out & Sew Airborn Top,US,Eclipse Inc,1303
220100100592,Clothes & Shoes,Clothes,Eclipse Clothing,Woman's Short Tights,US,Eclipse Inc,1303
220100100609,Clothes & Shoes,Clothes,Eclipse Clothing,Woman's Sweatshirt w/Hood,US,Eclipse Inc,1303
220100100617,Clothes & Shoes,Clothes,Eclipse Clothing,Woman's T-Shirt w/Hood,US,Eclipse Inc,1303
220100100629,Clothes & Shoes,Clothes,Eclipse Clothing,Woman's Winter Tights,US,Eclipse Inc,1303
220100100631,Clothes & Shoes,Clothes,Eclipse Clothing,Woman's Work Out Pants Dri Fit,US,Eclipse Inc,1303
220100100635,Clothes & Shoes,Clothes,Eclipse Clothing,Woman's Woven Warm Up,US,Eclipse Inc,1303
220100200004,Clothes & Shoes,Clothes,Green Tomato,Green Lime Atletic Socks,US,Green Lime Sports Inc,18139
220100300001,Clothes & Shoes,Clothes,Knitwear,Fleece Jacket Compass,US,AllSeasons Outdoor Clothing,772
220100300008,Clothes & Shoes,Clothes,Knitwear,Dp Roller High-necked Knit,US,Mayday Inc,4646
220100300019,Clothes & Shoes,Clothes,Knitwear,Instyle Pullover Mid w/Small Zipper,US,AllSeasons Outdoor Clothing,772
220100300020,Clothes & Shoes,Clothes,Knitwear,Instyle T-Shirt,US,AllSeasons Outdoor Clothing,772
220100300025,Clothes & Shoes,Clothes,Knitwear,Lucky Knitwear Wool Sweater,US,AllSeasons Outdoor Clothing,772
220100300037,Clothes & Shoes,Clothes,Knitwear,Mayday Resque Fleece Pullover,US,Mayday Inc,4646
220100300042,Clothes & Shoes,Clothes,Knitwear,Truls Polar Fleece Cardigan,NO,Truls Sporting Goods,12869
220100400005,Clothes & Shoes,Clothes,LSF,Big Guy Men's Air Force 1 Sc,US,Eclipse Inc,1303
220100400022,Clothes & Shoes,Clothes,LSF,Ultra M803 Ng Men's Street Shoes,US,Ultra Sporting Goods Inc,5503
220100400023,Clothes & Shoes,Clothes,LSF,Ultra W802 All Terrain Women's Shoes,US,Ultra Sporting Goods Inc,5503
220100700002,Clothes & Shoes,Clothes,Orion,Dmx 10 Women's Aerobic Shoes,CA,Fuller Trading Co.,16733
220100700022,Clothes & Shoes,Clothes,Orion,Alexis Women's Classic Shoes,CA,Fuller Trading Co.,16733
220100700023,Clothes & Shoes,Clothes,Orion,Armadillo Road Dmx Men's Running Shoes,CA,Fuller Trading Co.,16733
220100700024,Clothes & Shoes,Clothes,Orion,Armadillo Road Dmx Women's Running Shoes,CA,Fuller Trading Co.,16733
220100700027,Clothes & Shoes,Clothes,Orion,Duration Women's Trainer Aerobic Shoes,CA,Fuller Trading Co.,16733
220100700042,Clothes & Shoes,Clothes,Orion,"Power Women's Dmx Wide, Walking Shoes",CA,Fuller Trading Co.,16733
220100700046,Clothes & Shoes,Clothes,Orion,Tcp 6 Men's Running Shoes,CA,Fuller Trading Co.,16733
220100700052,Clothes & Shoes,Clothes,Orion,Trooper Ii Dmx-2x Men's Walking Shoes,CA,Fuller Trading Co.,16733
220100800001,Clothes & Shoes,Clothes,Orion Clothing,Bra Top Wom.Fitn.Cl,CA,Fuller Trading Co.,16733
220100800009,Clothes & Shoes,Clothes,Orion Clothing,Peacock Pants,CA,Fuller Trading Co.,16733
220100800040,Clothes & Shoes,Clothes,Orion Clothing,Mick's Men's Cl.Tracksuit,CA,Fuller Trading Co.,16733
220100800071,Clothes & Shoes,Clothes,Orion Clothing,Tx Tribe Tank Top,CA,Fuller Trading Co.,16733
220100800096,Clothes & Shoes,Clothes,Orion Clothing,Zx Women's Dance Pants,CA,Fuller Trading Co.,16733
220100900006,Clothes & Shoes,Clothes,Osprey,Osprey Cabri Micro Suit,US,Triple Sportswear Inc,3664
220100900029,Clothes & Shoes,Clothes,Osprey,Osprey Men's King T-Shirt w/Small Logo,US,Triple Sportswear Inc,3664
220100900035,Clothes & Shoes,Clothes,Osprey,Osprey Shadow Indoor,US,Triple Sportswear Inc,3664
220101000002,Clothes & Shoes,Clothes,Shorts,Carribian Women's Jersey Shorts,US,A Team Sports,3298
220101200006,Clothes & Shoes,Clothes,Street Wear,Anthony Bork Maggan 3/4 Long Pique,US,Mayday Inc,4646
220101200020,Clothes & Shoes,Clothes,Street Wear,Tyfoon Flex Shorts,AU,Typhoon Clothing,11427
220101200025,Clothes & Shoes,Clothes,Street Wear,Tyfoon Ketch T-Shirt,AU,Typhoon Clothing,11427
220101200029,Clothes & Shoes,Clothes,Street Wear,Tyfoon Oliver Sweatshirt,AU,Typhoon Clothing,11427
220101300001,Clothes & Shoes,Clothes,T-Shirts,"T-Shirt, Short-sleeved, Big Logo",US,A Team Sports,3298
220101300012,Clothes & Shoes,Clothes,T-Shirts,Men's T-Shirt Small Logo,US,A Team Sports,3298
220101300017,Clothes & Shoes,Clothes,T-Shirts,Toncot Beefy-T Emb T-Shirt,US,A Team Sports,3298
220101400004,Clothes & Shoes,Clothes,Tracker Clothes,Badminton Cotton,US,3Top Sports,2963
220101400017,Clothes & Shoes,Clothes,Tracker Clothes,Men's Cap,US,3Top Sports,2963
220101400018,Clothes & Shoes,Clothes,Tracker Clothes,Men's Running Tee Short Sleeves,US,3Top Sports,2963
220101400032,Clothes & Shoes,Clothes,Tracker Clothes,Socks Wmns'Fitness,US,Eclipse Inc,1303
220101400047,Clothes & Shoes,Clothes,Tracker Clothes,Swimming Trunks Struc,US,3Top Sports,2963
220101400060,Clothes & Shoes,Clothes,Tracker Clothes,2bwet 3 Cb Swimming Trunks,US,3Top Sports,2963
220101400061,Clothes & Shoes,Clothes,Tracker Clothes,2bwet 3 Solid Bikini,US,3Top Sports,2963
220101400088,Clothes & Shoes,Clothes,Tracker Clothes,Casual Genuine Polo-Shirt,US,3Top Sports,2963
220101400091,Clothes & Shoes,Clothes,Tracker Clothes,Casual Genuine Tee,US,3Top Sports,2963
220101400092,Clothes & Shoes,Clothes,Tracker Clothes,Casual Logo Men's Sweatshirt,US,3Top Sports,2963
220101400098,Clothes & Shoes,Clothes,Tracker Clothes,Casual Sport Shorts,US,3Top Sports,2963
220101400117,Clothes & Shoes,Clothes,Tracker Clothes,Casual.st.polo Long-sleeved Polo-shirt,US,3Top Sports,2963
220101400130,Clothes & Shoes,Clothes,Tracker Clothes,Comp. Women's Sleeveless Polo,US,3Top Sports,2963
220101400138,Clothes & Shoes,Clothes,Tracker Clothes,Dima 2-Layer Men's Suit,US,3Top Sports,2963
220101400145,Clothes & Shoes,Clothes,Tracker Clothes,Essence.baseball Cap,US,3Top Sports,2963
220101400148,Clothes & Shoes,Clothes,Tracker Clothes,Essence.cap Men's Bag,US,3Top Sports,2963
220101400150,Clothes & Shoes,Clothes,Tracker Clothes,Essential Suit 2 Swim Suit,US,3Top Sports,2963
220101400152,Clothes & Shoes,Clothes,Tracker Clothes,Essential Trunk 2 Swimming Trunks,US,3Top Sports,2963
220101400201,Clothes & Shoes,Clothes,Tracker Clothes,Kaitum Women's Swim Suit,US,3Top Sports,2963
220101400216,Clothes & Shoes,Clothes,Tracker Clothes,Mm Daypouch Shoulder Bag,US,3Top Sports,2963
220101400237,Clothes & Shoes,Clothes,Tracker Clothes,Mns.jacket Jacket,US,3Top Sports,2963
220101400238,Clothes & Shoes,Clothes,Tracker Clothes,Mns.long Tights,US,3Top Sports,2963
220101400265,Clothes & Shoes,Clothes,Tracker Clothes,Ottis Pes Men's Pants,US,3Top Sports,2963
220101400269,Clothes & Shoes,Clothes,Tracker Clothes,Outfit Women's Shirt,US,3Top Sports,2963
220101400276,Clothes & Shoes,Clothes,Tracker Clothes,Pine Sweat with Hood,US,3Top Sports,2963
220101400285,Clothes & Shoes,Clothes,Tracker Clothes,Quali Jacket with Hood,US,3Top Sports,2963
220101400289,Clothes & Shoes,Clothes,Tracker Clothes,Quali Sweatpant,US,3Top Sports,2963
220101400290,Clothes & Shoes,Clothes,Tracker Clothes,Quali Sweatshirt,US,3Top Sports,2963
220101400306,Clothes & Shoes,Clothes,Tracker Clothes,Sherpa Pes Shiny Cotton,US,3Top Sports,2963
220101400310,Clothes & Shoes,Clothes,Tracker Clothes,Short Women's Tights,US,3Top Sports,2963
220101400328,Clothes & Shoes,Clothes,Tracker Clothes,Stars Swim Suit,US,3Top Sports,2963
220101400339,Clothes & Shoes,Clothes,Tracker Clothes,Tims Shorts,US,3Top Sports,2963
220101400349,Clothes & Shoes,Clothes,Tracker Clothes,Tracker Fitness Stockings,US,3Top Sports,2963
220101400363,Clothes & Shoes,Clothes,Tracker Clothes,Brafit Swim Tights,ES,Luna sastreria S.A.,4742
220101400373,Clothes & Shoes,Clothes,Tracker Clothes,Jogging Pants  Men's Tracking Pants w/Small L,GB,Greenline Sports Ltd,14682
220101400385,Clothes & Shoes,Clothes,Tracker Clothes,N.d.gear Basic T-Shirt,GB,Greenline Sports Ltd,14682
220101400387,Clothes & Shoes,Clothes,Tracker Clothes,N.d.gear Cap,GB,Greenline Sports Ltd,14682
220200100002,Clothes & Shoes,Shoes,Eclipse Shoes,Cnv Plus Men's Off Court Tennis,US,Eclipse Inc,1303
220200100009,Clothes & Shoes,Shoes,Eclipse Shoes,Atmosphere Imara Women's Running Shoes,US,Eclipse Inc,1303
220200100012,Clothes & Shoes,Shoes,Eclipse Shoes,Atmosphere Shatter Mid Shoes,US,Eclipse Inc,1303
220200100035,Clothes & Shoes,Shoes,Eclipse Shoes,Big Guy Men's Air Deschutz Viii Shoes,US,Eclipse Inc,1303
220200100090,Clothes & Shoes,Shoes,Eclipse Shoes,Big Guy Men's Air Terra Reach Shoes,US,Eclipse Inc,1303
220200100092,Clothes & Shoes,Shoes,Eclipse Shoes,Big Guy Men's Air Terra Sebec Shoes,US,Eclipse Inc,1303
220200100129,Clothes & Shoes,Shoes,Eclipse Shoes,Big Guy Men's International Triax Shoes,US,Eclipse Inc,1303
220200100137,Clothes & Shoes,Shoes,Eclipse Shoes,Big Guy Men's Multicourt Ii Shoes,US,Eclipse Inc,1303
220200100171,Clothes & Shoes,Shoes,Eclipse Shoes,Woman's Air Amend Mid,US,Eclipse Inc,1303
220200100179,Clothes & Shoes,Shoes,Eclipse Shoes,Woman's Air Converge Triax X,US,Eclipse Inc,1303
220200100190,Clothes & Shoes,Shoes,Eclipse Shoes,Woman's Air Imara,US,Eclipse Inc,1303
220200100202,Clothes & Shoes,Shoes,Eclipse Shoes,Woman's Air Rasp Suede,US,Eclipse Inc,1303
220200100226,Clothes & Shoes,Shoes,Eclipse Shoes,Woman's Air Zoom Drive,US,Eclipse Inc,1303
220200100229,Clothes & Shoes,Shoes,Eclipse Shoes,Woman's Air Zoom Sterling,US,Eclipse Inc,1303
220200200014,Clothes & Shoes,Shoes,Shoes,Dubby Low Men's Street Shoes,SE,Petterson AB,109
220200200018,Clothes & Shoes,Shoes,Shoes,Lulu Men's Street Shoes,SE,Petterson AB,109
220200200022,Clothes & Shoes,Shoes,Shoes,Pro Fit Gel Ds Trainer Women's Running Shoes,US,Pro Sportswear Inc,1747
220200200024,Clothes & Shoes,Shoes,Shoes,Pro Fit Gel Gt 2030 Women's Running Shoes,US,Pro Sportswear Inc,1747
220200200035,Clothes & Shoes,Shoes,Shoes,Soft Alta Plus Women's Indoor Shoes,US,Pro Sportswear Inc,1747
220200200036,Clothes & Shoes,Shoes,Shoes,Soft Astro Men's Running Shoes,US,Pro Sportswear Inc,1747
220200200071,Clothes & Shoes,Shoes,Shoes,Twain Men's Exit Low 2000 Street Shoes,US,Twain Inc,13198
220200200073,Clothes & Shoes,Shoes,Shoes,Twain Stf6 Gtx M Men's Trekking Boot,US,Twain Inc,13198
220200200077,Clothes & Shoes,Shoes,Shoes,Twain Women's Exit Iii Mid Cd X-Hiking Shoes,US,Twain Inc,13198
220200200079,Clothes & Shoes,Shoes,Shoes,Twain Women's Expresso X-Hiking Shoes,US,Twain Inc,13198
220200300002,Clothes & Shoes,Shoes,Tracker Shoes,Pytossage Bathing Sandal,US,3Top Sports,2963
220200300005,Clothes & Shoes,Shoes,Tracker Shoes,Liga Football Boot,US,3Top Sports,2963
220200300015,Clothes & Shoes,Shoes,Tracker Shoes,Men's Running Shoes Piedmmont,US,3Top Sports,2963
220200300079,Clothes & Shoes,Shoes,Tracker Shoes,Hilly Women's Crosstrainer Shoes,US,3Top Sports,2963
220200300082,Clothes & Shoes,Shoes,Tracker Shoes,Indoor Handbold Special Shoes,US,3Top Sports,2963
220200300096,Clothes & Shoes,Shoes,Tracker Shoes,Mns.raptor Precision Sg Football,US,3Top Sports,2963
220200300116,Clothes & Shoes,Shoes,Tracker Shoes,South Peak Men's Running Shoes,US,3Top Sports,2963
220200300129,Clothes & Shoes,Shoes,Tracker Shoes,Torino Men's Leather Adventure Shoes,US,3Top Sports,2963
220200300154,Clothes & Shoes,Shoes,Tracker Shoes,Hardcore Junior/Women's Street Shoes Large,GB,Greenline Sports Ltd,14682
220200300157,Clothes & Shoes,Shoes,Tracker Shoes,Hardcore Men's Street Shoes Large,GB,Greenline Sports Ltd,14682
230100100006,Outdoors,Outdoors,Anoraks & Parkas,Jacket Nome,ES,Luna sastreria S.A.,4742
230100100013,Outdoors,Outdoors,Anoraks & Parkas,Jacket with Removable Fleece,US,AllSeasons Outdoor Clothing,772
230100100015,Outdoors,Outdoors,Anoraks & Parkas,Men's Jacket Caians,NO,Scandinavian Clothing A/S,50
230100100017,Outdoors,Outdoors,Anoraks & Parkas,Men's Jacket Rem,NO,Scandinavian Clothing A/S,50
230100100018,Outdoors,Outdoors,Anoraks & Parkas,Men's Jacket Sandy,ES,Luna sastreria S.A.,4742
230100100025,Outdoors,Outdoors,Anoraks & Parkas,Women's Shorts,NO,Scandinavian Clothing A/S,50
230100100028,Outdoors,Outdoors,Anoraks & Parkas,4men Men's Polar Down Jacket,US,AllSeasons Outdoor Clothing,772
230100100033,Outdoors,Outdoors,Anoraks & Parkas,Big Guy Men's Packable Hiking Shorts,US,Miller Trading Inc,15218
230100100045,Outdoors,Outdoors,Anoraks & Parkas,Duwall Pants,US,AllSeasons Outdoor Clothing,772
230100100051,Outdoors,Outdoors,Anoraks & Parkas,Lucky Voss Jacket,US,AllSeasons Outdoor Clothing,772
230100100053,Outdoors,Outdoors,Anoraks & Parkas,Monster Men's Pants with Zipper,NO,Scandinavian Clothing A/S,50
230100100062,Outdoors,Outdoors,Anoraks & Parkas,Topper Pants,US,AllSeasons Outdoor Clothing,772
230100100063,Outdoors,Outdoors,Anoraks & Parkas,Tx Peak Parka,US,Miller Trading Inc,15218
230100200004,Outdoors,Outdoors,Backpacks,Black/Black,DK,Top Sports,755
230100200006,Outdoors,Outdoors,Backpacks,X-Large Bottlegreen/Black,DK,Top Sports,755
230100200019,Outdoors,Outdoors,Backpacks,Commanche Women's 6000 Q Backpack. Bark,DK,Top Sports,755
230100200022,Outdoors,Outdoors,Backpacks,Expedition Camp Duffle Medium Backpack,US,Miller Trading Inc,15218
230100200025,Outdoors,Outdoors,Backpacks,Feelgood 55-75 Litre Black Women's Backpack,AU,Toto Outdoor Gear,10692
230100200029,Outdoors,Outdoors,Backpacks,Jaguar 50-75 Liter Blue Women's Backpack,AU,Toto Outdoor Gear,10692
230100200043,Outdoors,Outdoors,Backpacks,Medium Black/Bark Backpack,DK,Top Sports,755
230100200047,Outdoors,Outdoors,Backpacks,Medium Gold Black/Gold Backpack,DK,Top Sports,755
230100200048,Outdoors,Outdoors,Backpacks,Medium Olive Olive/Black Backpack,DK,Top Sports,755
230100200054,Outdoors,Outdoors,Backpacks,Trekker 65 Royal Men's Backpack,AU,Toto Outdoor Gear,10692
230100200056,Outdoors,Outdoors,Backpacks,Victor Grey/Olive Women's Backpack,DK,Top Sports,755
230100200059,Outdoors,Outdoors,Backpacks,Deer Backpack,ES,Luna sastreria S.A.,4742
230100200066,Outdoors,Outdoors,Backpacks,Deer Waist Bag,ES,Luna sastreria S.A.,4742
230100200073,Outdoors,Outdoors,Backpacks,Hammock Sports Bag,ES,Luna sastreria S.A.,4742
230100200074,Outdoors,Outdoors,Backpacks,Sioux Men's Backpack 26 Litre.,US,Miller Trading Inc,15218
230100300006,Outdoors,Outdoors,Gloves & Mittens,Gloves Le Fly Mitten,PT,Magnifico Sports,1684
230100300010,Outdoors,Outdoors,Gloves & Mittens,Massif Dual Gloves,FR,Massif S.A.,13199
230100300013,Outdoors,Outdoors,Gloves & Mittens,Montana Adult Gloves,SE,Svensson Trading AB,6355
230100300023,Outdoors,Outdoors,Gloves & Mittens,Scania Unisex Gloves,SE,Svensson Trading AB,6355
230100400007,Outdoors,Outdoors,Knitted Accessories,Breaker Commandos Cap,DK,Norsok A/S,4793
230100400010,Outdoors,Outdoors,Knitted Accessories,Breaker Frozen Husky Hat,DK,Norsok A/S,4793
230100400012,Outdoors,Outdoors,Knitted Accessories,Breaker Russia Cap,DK,Norsok A/S,4793
230100400025,Outdoors,Outdoors,Knitted Accessories,Mayday Serious Headband,US,Mayday Inc,4646
230100500004,Outdoors,Outdoors,Outdoor Gear,"Backpack Flag, 6,5x9 Cm.",GB,Prime Sports Ltd,316
230100500006,Outdoors,Outdoors,Outdoor Gear,Collapsible Water Can,GB,Prime Sports Ltd,316
230100500008,Outdoors,Outdoors,Outdoor Gear,Dome Tent Monodome Alu,GB,Prime Sports Ltd,316
230100500012,Outdoors,Outdoors,Outdoor Gear,Inflatable 3.5,GB,Prime Sports Ltd,316
230100500013,Outdoors,Outdoors,Outdoor Gear,Lamp with Battery Box,GB,Prime Sports Ltd,316
230100500016,Outdoors,Outdoors,Outdoor Gear,"Money Purse, Black",DK,Top Sports,755
230100500020,Outdoors,Outdoors,Outdoor Gear,Pocket Light with Crypton Bulb,GB,Prime Sports Ltd,316
230100500023,Outdoors,Outdoors,Outdoor Gear,Proofing Spray,GB,Prime Sports Ltd,316
230100500024,Outdoors,Outdoors,Outdoor Gear,"Small Belt Bag, Black",DK,Top Sports,755
230100500026,Outdoors,Outdoors,Outdoor Gear,Trekking Tent,GB,Prime Sports Ltd,316
230100500045,Outdoors,Outdoors,Outdoor Gear,Cup Picnic Mug 25 Cl.,GB,Prime Sports Ltd,316
230100500056,Outdoors,Outdoors,Outdoor Gear,Knife,US,KN Outdoor Trading Inc,4718
230100500058,Outdoors,Outdoors,Outdoor Gear,Mattress with 5 channels 196x72,GB,Prime Sports Ltd,316
230100500066,Outdoors,Outdoors,Outdoor Gear,Outback Spirits Kitchen,GB,Prime Sports Ltd,316
230100500068,Outdoors,Outdoors,Outdoor Gear,Plate Picnic Deep,GB,Prime Sports Ltd,316
230100500072,Outdoors,Outdoors,Outdoor Gear,Single Full Box Madras honeycomb-weave,GB,Prime Sports Ltd,316
230100500074,Outdoors,Outdoors,Outdoor Gear,"Tent Milano Tent,4 Persons, about 4.8",GB,Prime Sports Ltd,316
230100500077,Outdoors,Outdoors,Outdoor Gear,Jl Legacy Curig I.A.Jacket,US,AllSeasons Outdoor Clothing,772
230100500080,Outdoors,Outdoors,Outdoor Gear,Jl Rainlight Essential Pants,US,AllSeasons Outdoor Clothing,772
230100500081,Outdoors,Outdoors,Outdoor Gear,Lucky Tech Classic Rain Pants,US,AllSeasons Outdoor Clothing,772
230100500082,Outdoors,Outdoors,Outdoor Gear,Lucky Tech Intergal Wp/B Rain Pants,US,AllSeasons Outdoor Clothing,772
230100500087,Outdoors,Outdoors,Outdoor Gear,Mayday Qd Zip Pants,US,Mayday Inc,4646
230100500091,Outdoors,Outdoors,Outdoor Gear,Mayday Soul Ht Jacket,US,Mayday Inc,4646
230100500092,Outdoors,Outdoors,Outdoor Gear,Mayday Sports Pullover,US,Mayday Inc,4646
230100500093,Outdoors,Outdoors,Outdoor Gear,Mayday W'S Sports Pullover,US,Mayday Inc,4646
230100500094,Outdoors,Outdoors,Outdoor Gear,"Men's Pants, Basic",US,Mayday Inc,4646
230100500095,Outdoors,Outdoors,Outdoor Gear,Men's Sports Pullover,US,Mayday Inc,4646
230100500096,Outdoors,Outdoors,Outdoor Gear,Rain Jacket,US,AllSeasons Outdoor Clothing,772
230100500101,Outdoors,Outdoors,Outdoor Gear,Ultra Ht Lightning Set,US,AllSeasons Outdoor Clothing,772
230100600003,Outdoors,Outdoors,Sleepingbags,"Sheet Sleeping Bag, Red",GB,Outback Outfitters Ltd,16422
230100600005,Outdoors,Outdoors,Sleepingbags,"Basic 10, Left , Yellow/Black",DK,Top Sports,755
230100600015,Outdoors,Outdoors,Sleepingbags,"Expedition Zero,Medium,Left,Charcoal",DK,Top Sports,755
230100600016,Outdoors,Outdoors,Sleepingbags,"Expedition Zero,Medium,Right,Charcoal",DK,Top Sports,755
230100600017,Outdoors,Outdoors,Sleepingbags,"Expedition Zero,Small,Left,Charcoal",DK,Top Sports,755
230100600018,Outdoors,Outdoors,Sleepingbags,"Expedition Zero,Small,Right,Charcoal",DK,Top Sports,755
230100600022,Outdoors,Outdoors,Sleepingbags,"Expedition10,Medium,Right,Blue Ribbon",DK,Top Sports,755
230100600023,Outdoors,Outdoors,Sleepingbags,"Expedition 10,Small,Left,Blue Ribbon",DK,Top Sports,755
230100600024,Outdoors,Outdoors,Sleepingbags,"Expedition 10,Small,Right,Blue Ribbon",DK,Top Sports,755
230100600026,Outdoors,Outdoors,Sleepingbags,"Expedition 20,Large,Right,Forestgreen",DK,Top Sports,755
230100600028,Outdoors,Outdoors,Sleepingbags,"Expedition 20,Medium,Right,Forestgreen",DK,Top Sports,755
230100600030,Outdoors,Outdoors,Sleepingbags,"Outback Sleeping Bag, Large,Left,Blue/Black",DK,Top Sports,755
230100600031,Outdoors,Outdoors,Sleepingbags,"Outback Sleeping Bag, Large,Right, Blue/Black",DK,Top Sports,755
230100600035,Outdoors,Outdoors,Sleepingbags,"Polar Bear Sleeping mat, Olive Green",GB,Outback Outfitters Ltd,16422
230100600036,Outdoors,Outdoors,Sleepingbags,Tent Summer 195 Twin Sleeping Bag,GB,Outback Outfitters Ltd,16422
230100600038,Outdoors,Outdoors,Sleepingbags,Tipee Summer Sleeping Bag,GB,Outback Outfitters Ltd,16422
230100600039,Outdoors,Outdoors,Sleepingbags,Tipee Twin Blue/Orange,GB,Outback Outfitters Ltd,16422
230100700002,Outdoors,Outdoors,Tents,Comfort Shelter,GB,Outback Outfitters Ltd,16422
230100700004,Outdoors,Outdoors,Tents,Expedition Dome 3,GB,Outback Outfitters Ltd,16422
230100700008,Outdoors,Outdoors,Tents,Family Holiday 4,SE,Petterson AB,109
230100700009,Outdoors,Outdoors,Tents,Family Holiday 6,SE,Petterson AB,109
230100700011,Outdoors,Outdoors,Tents,Hurricane 4,SE,Petterson AB,109
240100100029,Sports,Assorted Sports Articles,Assorted Sports articles,Buzz Saw,CA,CrystalClear Optics Inc,16814
240100100031,Sports,Assorted Sports Articles,Assorted Sports articles,Capsy Hood,US,Nautlius SportsWear Inc,6153
240100100063,Sports,Assorted Sports Articles,Assorted Sports articles,Grey Met.,CA,CrystalClear Optics Inc,16814
240100100065,Sports,Assorted Sports Articles,Assorted Sports articles,Grey,CA,CrystalClear Optics Inc,16814
240100100148,Sports,Assorted Sports Articles,Assorted Sports articles,Wood Box for 6 Balls,GB,Royal Darts Ltd,4514
240100100159,Sports,Assorted Sports Articles,Assorted Sports articles,A-team Smoothsport Bra,US,A Team Sports,3298
240100100184,Sports,Assorted Sports Articles,Assorted Sports articles,Barret 2.12 Men's Softboot,US,Roll-Over Inc,3815
240100100186,Sports,Assorted Sports Articles,Assorted Sports articles,Barret 3.1 Women's Softboot,US,Roll-Over Inc,3815
240100100232,Sports,Assorted Sports Articles,Assorted Sports articles,Dartsharpener Key ring,GB,Royal Darts Ltd,4514
240100100305,Sports,Assorted Sports Articles,Assorted Sports articles,Hiclass Mundo 78a 36x72mm Pink-Swirl,US,Roll-Over Inc,3815
240100100312,Sports,Assorted Sports Articles,Assorted Sports articles,Hot Mini Backboard Bulls,NL,Van Dammeren International,2995
240100100354,Sports,Assorted Sports Articles,Assorted Sports articles,Mk Splinter 66 5m 88a Pea.,PT,Magnifico Sports,1684
240100100365,Sports,Assorted Sports Articles,Assorted Sports articles,Northern Coach,GB,EA Sports Limited,12283
240100100366,Sports,Assorted Sports Articles,Assorted Sports articles,Northern Liquid Belt with Bottle,GB,EA Sports Limited,12283
240100100403,Sports,Assorted Sports Articles,Assorted Sports articles,Proskater Viablade Tx Women's Fitness,US,Roll-Over Inc,3815
240100100410,Sports,Assorted Sports Articles,Assorted Sports articles,Prosoccer  Club Football 4/32 (Replica) Synth,US,Teamsports Inc,5810
240100100433,Sports,Assorted Sports Articles,Assorted Sports articles,Shoelace White 150 Cm,US,Teamsports Inc,5810
240100100434,Sports,Assorted Sports Articles,Assorted Sports articles,Shoeshine Black,CA,CrystalClear Optics Inc,16814
240100100463,Sports,Assorted Sports Articles,Assorted Sports articles,Sparkle Spray Orange,CA,CrystalClear Optics Inc,16814
240100100477,Sports,Assorted Sports Articles,Assorted Sports articles,Stout Brass 18 Gram,GB,Royal Darts Ltd,4514
240100100508,Sports,Assorted Sports Articles,Assorted Sports articles,Top Elite Kit Small,US,Roll-Over Inc,3815
240100100535,Sports,Assorted Sports Articles,Assorted Sports articles,Victor 76 76mm Optics Blue,PT,Magnifico Sports,1684
240100100581,Sports,Assorted Sports Articles,Assorted Sports articles,Eliza T-Shirt,ES,Luna sastreria S.A.,4742
240100100605,Sports,Assorted Sports Articles,Assorted Sports articles,Fred T-Shirt,ES,Luna sastreria S.A.,4742
240100100610,Sports,Assorted Sports Articles,Assorted Sports articles,Goodtime Bag,ES,Luna sastreria S.A.,4742
240100100615,Sports,Assorted Sports Articles,Assorted Sports articles,Goodtime Toilet Bag,ES,Luna sastreria S.A.,4742
240100100646,Sports,Assorted Sports Articles,Assorted Sports articles,Lyon Men's Jacket,ES,Luna sastreria S.A.,4742
240100100654,Sports,Assorted Sports Articles,Assorted Sports articles,Montevideo Men's Shorts,ES,Luna sastreria S.A.,4742
240100100665,Sports,Assorted Sports Articles,Assorted Sports articles,Pool Shorts,ES,Luna sastreria S.A.,4742
240100100672,Sports,Assorted Sports Articles,Assorted Sports articles,Ribstop Jacket,ES,Luna sastreria S.A.,4742
240100100676,Sports,Assorted Sports Articles,Assorted Sports articles,Roth T-Shirt,ES,Luna sastreria S.A.,4742
240100100679,Sports,Assorted Sports Articles,Assorted Sports articles,Saturn Big Bag,ES,Luna sastreria S.A.,4742
240100100690,Sports,Assorted Sports Articles,Assorted Sports articles,Shirt Termir,ES,Luna sastreria S.A.,4742
240100100703,Sports,Assorted Sports Articles,Assorted Sports articles,Stream Sweatshirt with Tube,ES,Luna sastreria S.A.,4742
240100100714,Sports,Assorted Sports Articles,Assorted Sports articles,Tybor Sweatshirt with Hood,ES,Luna sastreria S.A.,4742
240100100734,Sports,Assorted Sports Articles,Assorted Sports articles,Wyoming Men's Socks,ES,Luna sastreria S.A.,4742
240100100737,Sports,Assorted Sports Articles,Assorted Sports articles,Wyoming Men's T-Shirt with V-Neck,ES,Luna sastreria S.A.,4742
240100200001,Sports,Assorted Sports Articles,Darts,Aim4it 16 Gram Softtip Pil,GB,Royal Darts Ltd,4514
240100200004,Sports,Assorted Sports Articles,Darts,Aim4it 80% Tungsten 22 Gram,GB,Royal Darts Ltd,4514
240100200014,Sports,Assorted Sports Articles,Darts,Pacific 95% 23 Gram,GB,Royal Darts Ltd,4514
240100400004,Sports,Assorted Sports Articles,Skates,Children's Roller Skates,PT,Magnifico Sports,1684
240100400005,Sports,Assorted Sports Articles,Skates,Cool Fit Men's Roller Skates,US,Twain Inc,13198
240100400006,Sports,Assorted Sports Articles,Skates,Cool Fit Women's Roller Skates,US,Twain Inc,13198
240100400037,Sports,Assorted Sports Articles,Skates,N.d.gear Roller Skates Ff80 80 millimetre78a,PT,Magnifico Sports,1684
240100400043,Sports,Assorted Sports Articles,Skates,Perfect Fit Men's  Roller Skates,US,Twain Inc,13198
240100400044,Sports,Assorted Sports Articles,Skates,Perfect Fit Men's Roller Skates,US,Twain Inc,13198
240100400046,Sports,Assorted Sports Articles,Skates,Perfect Fit Men's Stunt Skates,US,Twain Inc,13198
240100400049,Sports,Assorted Sports Articles,Skates,Perfect Fit Women's Roller Skates Custom,US,Twain Inc,13198
240100400058,Sports,Assorted Sports Articles,Skates,Pro-roll Hot Rod Roller Skates,PT,Magnifico Sports,1684
240100400062,Sports,Assorted Sports Articles,Skates,Pro-roll Lazer Roller Skates,PT,Magnifico Sports,1684
240100400069,Sports,Assorted Sports Articles,Skates,Pro-roll Panga Roller Skates,PT,Magnifico Sports,1684
240100400070,Sports,Assorted Sports Articles,Skates,Pro-roll Sabotage-Rp  Roller Skates,PT,Magnifico Sports,1684
240100400076,Sports,Assorted Sports Articles,Skates,Pro-roll Sq9 80-76mm/78a Roller Skates,PT,Magnifico Sports,1684
240100400080,Sports,Assorted Sports Articles,Skates,Proskater Kitalpha Gamma Roller Skates,US,Roll-Over Inc,3815
240100400083,Sports,Assorted Sports Articles,Skates,Proskater Viablade S Roller Skates,US,Roll-Over Inc,3815
240100400085,Sports,Assorted Sports Articles,Skates,Proskater W-500 Jr.Roller Skates,US,Roll-Over Inc,3815
240100400095,Sports,Assorted Sports Articles,Skates,Rollerskate Roller Skates Control Xi Adult,PT,Magnifico Sports,1684
240100400098,Sports,Assorted Sports Articles,Skates,Rollerskate  Roller Skates Ex9 76mm/78a Biofl,PT,Magnifico Sports,1684
240100400100,Sports,Assorted Sports Articles,Skates,Rollerskate Roller Skates Gretzky Mvp S.B.S,PT,Magnifico Sports,1684
240100400112,Sports,Assorted Sports Articles,Skates,Rollerskate Roller Skates Panga 72mm/78a,PT,Magnifico Sports,1684
240100400125,Sports,Assorted Sports Articles,Skates,Rollerskate Roller Skates Sq5 76mm/78a,PT,Magnifico Sports,1684
240100400128,Sports,Assorted Sports Articles,Skates,Rollerskate Roller Skates Sq7-Ls 76mm/78a,PT,Magnifico Sports,1684
240100400129,Sports,Assorted Sports Articles,Skates,Rollerskate Roller Skates Sq9 80-76mm/78a,PT,Magnifico Sports,1684
240100400136,Sports,Assorted Sports Articles,Skates,Rollerskate Roller Skates Xpander,PT,Magnifico Sports,1684
240100400142,Sports,Assorted Sports Articles,Skates,Twain Ac7/Ft7 Men's Roller Skates,US,Twain Inc,13198
240100400143,Sports,Assorted Sports Articles,Skates,Twain Ac7/Ft7 Women's Roller Skates,US,Twain Inc,13198
240100400147,Sports,Assorted Sports Articles,Skates,Twain Tr7 Men's Roller Skates,US,Twain Inc,13198
240100400151,Sports,Assorted Sports Articles,Skates,Weston F4 Men's Hockey Skates,US,Roll-Over Inc,3815
240200100007,Sports,Golf,Golf,Ball Bag,NL,Van Dammeren International,2995
240200100020,Sports,Golf,Golf,Red/White/Black Staff 9 Bag,GB,GrandSlam Sporting Goods Ltd,17832
240200100021,Sports,Golf,Golf,Tee Holder,NL,Van Dammeren International,2995
240200100034,Sports,Golf,Golf,Bb Softspikes - Xp 22-pack,GB,TeeTime Ltd,15938
240200100043,Sports,Golf,Golf,Bretagne Performance Tg Men's Golf Shoes L.,NL,Van Dammeren International,2995
240200100046,Sports,Golf,Golf,"Bretagne Soft-Tech Men's Glove, left",NL,Van Dammeren International,2995
240200100050,Sports,Golf,Golf,"Bretagne St2 Men's Golf Glove, left",NL,Van Dammeren International,2995
240200100051,Sports,Golf,Golf,Bretagne Stabilites 2000 Goretex Shoes,NL,Van Dammeren International,2995
240200100052,Sports,Golf,Golf,Bretagne Stabilities Tg Men's Golf Shoes,NL,Van Dammeren International,2995
240200100053,Sports,Golf,Golf,Bretagne Stabilities Women's Golf Shoes,NL,Van Dammeren International,2995
240200100056,Sports,Golf,Golf,Carolina,US,Carolina Sports,3808
240200100057,Sports,Golf,Golf,Carolina II,US,Carolina Sports,3808
240200100073,Sports,Golf,Golf,Donald Plush Headcover,GB,TeeTime Ltd,15938
240200100076,Sports,Golf,Golf,Expert Men's Firesole Driver,US,Twain Inc,13198
240200100081,Sports,Golf,Golf,Extreme Distance 90 3-pack,US,Carolina Sports,3808
240200100095,Sports,Golf,Golf,Grandslam Staff Fs Copper Insert Putter,GB,GrandSlam Sporting Goods Ltd,17832
240200100098,Sports,Golf,Golf,Grandslam Staff Grip Llh Golf Gloves,US,Carolina Sports,3808
240200100101,Sports,Golf,Golf,Grandslam Staff Tour Mhl Golf Gloves,US,Carolina Sports,3808
240200100116,Sports,Golf,Golf,Hi-fly Intimidator Ti R80/10,NL,Van Dammeren International,2995
240200100118,Sports,Golf,Golf,Hi-fly Intrepid Stand 8  Black,NL,Van Dammeren International,2995
240200100124,Sports,Golf,Golf,Hi-fly Staff Towel Blue/Black,NL,Van Dammeren International,2995
240200100131,Sports,Golf,Golf,Hi-fly Tour Advance Flex Steel,NL,Van Dammeren International,2995
240200100154,Sports,Golf,Golf,"Men's.m Men's Winter Gloves, Medium",NL,Van Dammeren International,2995
240200100157,Sports,Golf,Golf,Normal Standard,GB,TeeTime Ltd,15938
240200100164,Sports,Golf,Golf,Precision Jack 309 Lh Balata,GB,GrandSlam Sporting Goods Ltd,17832
240200100173,Sports,Golf,Golf,Proplay Executive Bi-Metal Graphite,NL,Van Dammeren International,2995
240200100180,Sports,Golf,Golf,Proplay Men's Tour Force Lp 7-Wood,NL,Van Dammeren International,2995
240200100181,Sports,Golf,Golf,Proplay Men's Tour Force Lp Driver,NL,Van Dammeren International,2995
240200100183,Sports,Golf,Golf,Proplay Men's Tour Force Ti 5w,NL,Van Dammeren International,2995
240200100207,Sports,Golf,Golf,Proplay Stand Black,NL,Van Dammeren International,2995
240200100211,Sports,Golf,Golf,Proplay Women's Tour Force 7w,NL,Van Dammeren International,2995
240200100221,Sports,Golf,Golf,Rosefinch Cart 8 1/2  Black,NL,Van Dammeren International,2995
240200100225,Sports,Golf,Golf,Rubby Men's Golf Shoes w/Goretex,ES,Rubby Zapatos S.A.,4168
240200100226,Sports,Golf,Golf,Rubby Men's Golf Shoes w/Goretex Plain Toe,ES,Rubby Zapatos S.A.,4168
240200100227,Sports,Golf,Golf,Rubby Women's Golf Shoes w/Gore-Tex,ES,Rubby Zapatos S.A.,4168
240200100230,Sports,Golf,Golf,Score Counter Scoreboard De Luxe,NL,Van Dammeren International,2995
240200100232,Sports,Golf,Golf,Tee18 Ascot Chipper,NL,Van Dammeren International,2995
240200100233,Sports,Golf,Golf,Tee18 Troon 7  Black,NL,Van Dammeren International,2995
240200100246,Sports,Golf,Golf,"White 90,Top.Flite Strata Tour 3-pack",NL,Van Dammeren International,2995
240200200007,Sports,Golf,Golf Clothes,Golf Polo(1/400),US,Mike Schaeffer Inc,7511
240200200011,Sports,Golf,Golf Clothes,Golf Windstopper,US,Mike Schaeffer Inc,7511
240200200013,Sports,Golf,Golf Clothes,Master Golf Rain Suit,US,Mike Schaeffer Inc,7511
240200200015,Sports,Golf,Golf Clothes,Tek Cap,US,Twain Inc,13198
240200200020,Sports,Golf,Golf Clothes,Big Boss Houston Pants,US,Mike Schaeffer Inc,7511
240200200024,Sports,Golf,Golf Clothes,Bogie Golf Fleece with small Zipper,US,Mike Schaeffer Inc,7511
240200200026,Sports,Golf,Golf Clothes,Eagle 5 Pocket Pants with Stretch,US,HighPoint Trading,10225
240200200035,Sports,Golf,Golf Clothes,Eagle Pants with Cross Pocket,US,HighPoint Trading,10225
240200200039,Sports,Golf,Golf Clothes,Eagle Plain Cap,US,HighPoint Trading,10225
240200200044,Sports,Golf,Golf Clothes,Eagle Polo-Shirt Interlock,US,HighPoint Trading,10225
240200200060,Sports,Golf,Golf Clothes,Eagle Windstopper Knit Neck,US,HighPoint Trading,10225
240200200061,Sports,Golf,Golf Clothes,Eagle Windstopper Sweat Neck,US,HighPoint Trading,10225
240200200068,Sports,Golf,Golf Clothes,Hi-fly Staff Rain Suit,NL,Van Dammeren International,2995
240200200071,Sports,Golf,Golf Clothes,Hi-fly Strata Cap Offwhite/Green,NL,Van Dammeren International,2995
240200200080,Sports,Golf,Golf Clothes,Release Golf Sweatshirt w/Logo(1/100),US,Mike Schaeffer Inc,7511
240200200081,Sports,Golf,Golf Clothes,Top (1/100),US,Mike Schaeffer Inc,7511
240200200091,Sports,Golf,Golf Clothes,Wind Proof Windstopper Merino/Acryl,US,HighPoint Trading,10225
240300100001,Sports,Indoor Sports,Fitness,Abdomen Shaper,NL,TrimSport B.V.,16542
240300100020,Sports,Indoor Sports,Fitness,Fitness Dumbbell Foam 0.90,NL,TrimSport B.V.,16542
240300100028,Sports,Indoor Sports,Fitness,Letour Heart Bike,NL,TrimSport B.V.,16542
240300100032,Sports,Indoor Sports,Fitness,Letour Trimag Bike,NL,TrimSport B.V.,16542
240300100046,Sports,Indoor Sports,Fitness,Weight  5.0 Kg,NL,TrimSport B.V.,16542
240300100048,Sports,Indoor Sports,Fitness,Wrist Weight 1.10 Kg,NL,TrimSport B.V.,16542
240300100049,Sports,Indoor Sports,Fitness,Wrist Weight  2.25 Kg,NL,TrimSport B.V.,16542
240300200009,Sports,Indoor Sports,Gymnastic Clothing,Blues Jazz Pants Suplex,ES,Sportico,798
240300200018,Sports,Indoor Sports,Gymnastic Clothing,Cougar Fleece Jacket with Zipper,US,SD Sporting Goods Inc,13710
240300200058,Sports,Indoor Sports,Gymnastic Clothing,Cougar Windbreaker Vest,US,SD Sporting Goods Inc,13710
240300300024,Sports,Indoor Sports,Top Trim,Men's Summer Shorts,US,Top Sports Inc,14648
240300300065,Sports,Indoor Sports,Top Trim,Top Men's Goretex Ski Pants,US,Top Sports Inc,14648
240300300070,Sports,Indoor Sports,Top Trim,Top Men's R&D Ultimate Jacket,US,Top Sports Inc,14648
240300300071,Sports,Indoor Sports,Top Trim,Top Men's Retro T-Neck,US,Top Sports Inc,14648
240300300090,Sports,Indoor Sports,Top Trim,Top R&D Long Jacket,US,Top Sports Inc,14648
240400200003,Sports,Racket Sports,Racket Sports,Bat 5-Ply,US,Carolina Sports,3808
240400200012,Sports,Racket Sports,Racket Sports,Sledgehammer 120 Ph Black,GB,GrandSlam Sporting Goods Ltd,17832
240400200022,Sports,Racket Sports,Racket Sports,Aftm 95 Vf Long Bg-65 White,GB,British Sports Ltd,1280
240400200036,Sports,Racket Sports,Racket Sports,Bag  Tit.Weekend,FR,Le Blanc S.A.,13079
240400200057,Sports,Racket Sports,Racket Sports,Grandslam Ultra Power Tennisketcher,GB,GrandSlam Sporting Goods Ltd,17832
240400200066,Sports,Racket Sports,Racket Sports,"Memhis 350,Yellow Medium, 6-pack tube",GB,British Sports Ltd,1280
240400200091,Sports,Racket Sports,Racket Sports,Smasher Rd Ti 70 Tennis Racket,GB,British Sports Ltd,1280
240400200093,Sports,Racket Sports,Racket Sports,Smasher Super Rq Ti 350 Tennis Racket,GB,British Sports Ltd,1280
240400200094,Sports,Racket Sports,Racket Sports,Smasher Super Rq Ti 700 Long Tennis,GB,British Sports Ltd,1280
240400200097,Sports,Racket Sports,Racket Sports,Smasher Tg 70 Tennis String Roll,GB,British Sports Ltd,1280
240400300013,Sports,Racket Sports,Tennis,Anthony Women's Tennis Cable Vest,US,Mayday Inc,4646
240400300033,Sports,Racket Sports,Tennis,Smasher Polo-Shirt w/V-Neck,GB,British Sports Ltd,1280
240400300035,Sports,Racket Sports,Tennis,Smasher Shorts,GB,British Sports Ltd,1280
240400300039,Sports,Racket Sports,Tennis,Smasher Tights,GB,British Sports Ltd,1280
240500100004,Sports,Running - Jogging,Jogging,Pants N,ES,Luna sastreria S.A.,4742
240500100015,Sports,Running - Jogging,Jogging,A-team Pants Taffeta,US,A Team Sports,3298
240500100017,Sports,Running - Jogging,Jogging,"A-team Sweat Round Neck, Small Logo",US,A Team Sports,3298
240500100026,Sports,Running - Jogging,Jogging,"Men's Sweat Pants without Rib, Small Logo",US,A Team Sports,3298
240500100029,Sports,Running - Jogging,Jogging,Men's Sweatshirt w/Hood Big Logo,US,A Team Sports,3298
240500100039,Sports,Running - Jogging,Jogging,Sweatshirt Women's Sweatshirt with O-Neck,US,A Team Sports,3298
240500100041,Sports,Running - Jogging,Jogging,Triffy Jacket,NL,Triffy B.V.,13314
240500100043,Sports,Running - Jogging,Jogging,Triffy Logo T-Shirt with V-Neck,NL,Triffy B.V.,13314
240500100057,Sports,Running - Jogging,Jogging,"Woman Sweat with Round Neck, Big Logo",US,A Team Sports,3298
240500100062,Sports,Running - Jogging,Jogging,Ypsilon Men's Sweatshirt w/Piping,FR,Ypsilon S.A.,14624
240500200003,Sports,Running - Jogging,Running Clothes,Men's Singlet,BE,Force Sports,5922
240500200007,Sports,Running - Jogging,Running Clothes,Running Gloves,BE,Force Sports,5922
240500200016,Sports,Running - Jogging,Running Clothes,T-Shirt,US,3Top Sports,2963
240500200042,Sports,Running - Jogging,Running Clothes,Bike.Pants Short Biking Pants,BE,Force Sports,5922
240500200056,Sports,Running - Jogging,Running Clothes,Breath-brief Long Underpants XXL,BE,Force Sports,5922
240500200073,Sports,Running - Jogging,Running Clothes,Force Classic Men's Jacket,BE,Force Sports,5922
240500200081,Sports,Running - Jogging,Running Clothes,Force Micro Men's Suit,BE,Force Sports,5922
240500200082,Sports,Running - Jogging,Running Clothes,Force Short Sprinter Men's Tights,BE,Force Sports,5922
240500200083,Sports,Running - Jogging,Running Clothes,Force Technical Jacket w/Coolmax,BE,Force Sports,5922
240500200093,Sports,Running - Jogging,Running Clothes,Maxrun Running Tights,BE,Force Sports,5922
240500200100,Sports,Running - Jogging,Running Clothes,Original Running Pants,BE,Force Sports,5922
240500200101,Sports,Running - Jogging,Running Clothes,Polar Jacket,BE,Force Sports,5922
240500200121,Sports,Running - Jogging,Running Clothes,Stout Running Shorts,BE,Force Sports,5922
240500200122,Sports,Running - Jogging,Running Clothes,Stout Running Shorts Micro,BE,Force Sports,5922
240500200130,Sports,Running - Jogging,Running Clothes,Topline Delphi Race Shorts,BE,Force Sports,5922
240600100010,Sports,Swim Sports,Bathing Suits,"Goggles, Assorted Colours",US,Nautlius SportsWear Inc,6153
240600100016,Sports,Swim Sports,Bathing Suits,Swim Suit Fabulo,US,Nautlius SportsWear Inc,6153
240600100017,Sports,Swim Sports,Bathing Suits,Swim Suit Laurel,ES,Luna sastreria S.A.,4742
240600100080,Sports,Swim Sports,Bathing Suits,Sharky Swimming Trunks,US,Dolphin Sportswear Inc,16292
240600100102,Sports,Swim Sports,Bathing Suits,Sunfit Luffa Bikini,US,Nautlius SportsWear Inc,6153
240600100181,Sports,Swim Sports,Bathing Suits,Milan Swimming Trunks,ES,Luna sastreria S.A.,4742
240600100185,Sports,Swim Sports,Bathing Suits,Pew Swimming Trunks,ES,Luna sastreria S.A.,4742
240700100001,Sports,Team Sports,American Football,Armour L,US,A Team Sports,3298
240700100004,Sports,Team Sports,American Football,Armour XL,US,A Team Sports,3298
240700100007,Sports,Team Sports,American Football,Football - Helmet M,US,A Team Sports,3298
240700100011,Sports,Team Sports,American Football,Football - Helmet Pro XL,US,A Team Sports,3298
240700100012,Sports,Team Sports,American Football,Football - Helmet S,US,A Team Sports,3298
240700100013,Sports,Team Sports,American Football,Football - Helmet XL,US,A Team Sports,3298
240700100017,Sports,Team Sports,American Football,Football Super Bowl,US,Carolina Sports,3808
240700200004,Sports,Team Sports,Baseball,Baseball Orange Small,US,Top Sports Inc,14648
240700200007,Sports,Team Sports,Baseball,Baseball White Small,US,Top Sports Inc,14648
240700200009,Sports,Team Sports,Baseball,Bat - Home Run M,US,Miller Trading Inc,15218
240700200010,Sports,Team Sports,Baseball,Bat - Home Run S,US,Miller Trading Inc,15218
240700200018,Sports,Team Sports,Baseball,Helmet L,US,Miller Trading Inc,15218
240700200019,Sports,Team Sports,Baseball,Helmet M,US,Miller Trading Inc,15218
240700200021,Sports,Team Sports,Baseball,Helmet XL,US,Miller Trading Inc,15218
240700200024,Sports,Team Sports,Baseball,Bat - Large,US,Miller Trading Inc,15218
240700300002,Sports,Team Sports,Basket Ball,Basket Ball Pro,US,HighPoint Trading,10225
240700400002,Sports,Team Sports,Soccer,Stephens Shirt,US,Teamsports Inc,5810
240700400003,Sports,Team Sports,Soccer,Red Cap,GB,SportsFan Products Ltd,6071
240700400004,Sports,Team Sports,Soccer,Red Scarf,GB,SportsFan Products Ltd,6071
240700400017,Sports,Team Sports,Soccer,Fga Home Shorts,US,Fga Sports Inc,14593
240700400020,Sports,Team Sports,Soccer,Norwood Player Shirt,US,Fga Sports Inc,14593
240700400024,Sports,Team Sports,Soccer,Prosoccer Away Shirt,US,Fga Sports Inc,14593
240700400031,Sports,Team Sports,Soccer,Soccer Fan Football Player Shirt,GB,SportsFan Products Ltd,6071
240800100026,Sports,Winter Sports,Ski Dress,Additive Women's Ski Pants Vent Air,NO,Scandinavian Clothing A/S,50
240800100039,Sports,Winter Sports,Ski Dress,Garbo Fleece Jacket,US,Miller Trading Inc,15218
240800100041,Sports,Winter Sports,Ski Dress,Helmsdale Ski Jacket,US,AllSeasons Outdoor Clothing,772
240800100042,Sports,Winter Sports,Ski Dress,Helmsdale Ski Pants,US,AllSeasons Outdoor Clothing,772
240800100074,Sports,Winter Sports,Ski Dress,Mayday Soul Pro New Tech Ski Jacket,US,Mayday Inc,4646
240800200002,Sports,Winter Sports,Winter Sports,Massif Bandit Ski Parcel Axial,FR,Massif S.A.,13199
240800200008,Sports,Winter Sports,Winter Sports,"Twain X-Scream 7.9 Ski,Sq 750 Dri",US,Twain Inc,13198
240800200009,Sports,Winter Sports,Winter Sports,Amber Cc,CA,CrystalClear Optics Inc,16814
240800200010,Sports,Winter Sports,Winter Sports,Black Morphe,CA,CrystalClear Optics Inc,16814
240800200020,Sports,Winter Sports,Winter Sports,"C.A.M.,Bone",CA,CrystalClear Optics Inc,16814
240800200021,Sports,Winter Sports,Winter Sports,Cayenne Red,CA,CrystalClear Optics Inc,16814
240800200030,Sports,Winter Sports,Winter Sports,"Ii Pmt,Bone",CA,CrystalClear Optics Inc,16814
240800200034,Sports,Winter Sports,Winter Sports,"Regulator,Stopsign",CA,CrystalClear Optics Inc,16814
240800200035,Sports,Winter Sports,Winter Sports,Shine Black PRO,CA,CrystalClear Optics Inc,16814
240800200037,Sports,Winter Sports,Winter Sports,Coolman Pro 01 Neon Yellow,US,Twain Inc,13198
240800200062,Sports,Winter Sports,Winter Sports,Top Equipe 07 Green,US,Twain Inc,13198
240800200063,Sports,Winter Sports,Winter Sports,Top Equipe 99 Black,US,Twain Inc,13198
;;;;
run;

data ORION.PRODUCT_LEVEL;
   attrib Product_Level length=8 label='Product Level' format=12.;
   attrib Product_Level_Name length=$30 label='Product Level Name';

   infile datalines dsd;
   input
      Product_Level
      Product_Level_Name
   ;
datalines4;
1,Product
2,Product Group
3,Product Category
4,Product Line
;;;;
run;

data ORION.PRODUCT_LIST;
   attrib Product_ID length=8 label='Product ID' format=12.;
   attrib Product_Name length=$45 label='Product Name';
   attrib Supplier_ID length=8 label='Supplier ID' format=12.;
   attrib Product_Level length=8 label='Product Level' format=12.;
   attrib Product_Ref_ID length=8 label='Product Reference ID' format=12.;

   infile datalines dsd;
   input
      Product_ID
      Product_Name
      Supplier_ID
      Product_Level
      Product_Ref_ID
   ;
datalines4;
210000000000,Children,,4,
210100000000,Children Outdoors,,3,210000000000
210100100000,"Outdoor things, Kids",,2,210100000000
210200000000,Children Sports,,3,210000000000
210200100000,"A-Team, Kids",,2,210200000000
210200100009,"Kids Sweat Round Neck,Large Logo",3298,1,210200100000
210200100017,Sweatshirt Children's O-Neck,3298,1,210200100000
210200200000,"Bathing Suits, Kids",,2,210200000000
210200200022,Sunfit Slow Swimming Trunks,6153,1,210200200000
210200200023,Sunfit Stockton Swimming Trunks Jr.,6153,1,210200200000
210200300000,"Eclipse, Kid's Clothes",,2,210200000000
210200300006,Fleece Cuff Pant Kid'S,1303,1,210200300000
210200300007,Hsc Dutch Player Shirt Junior,1303,1,210200300000
210200300052,Tony's Cut & Sew T-Shirt,1303,1,210200300000
210200400000,"Eclipse, Kid's Shoes",,2,210200000000
210200400020,Kids Baby Edge Max Shoes,1303,1,210200400000
210200400070,Tony's Children's Deschutz (Bg) Shoes,1303,1,210200400000
210200500000,"Lucky Guy, Kids",,2,210200000000
210200500002,Children's Mitten,772,1,210200500000
210200500006,"Rain Suit, Plain w/backpack Jacket",772,1,210200500000
210200500007,Bozeman Rain & Storm Set,772,1,210200500000
210200500016,Teen Profleece w/Zipper,772,1,210200500000
210200600000,"N.D. Gear, Kids",,2,210200000000
210200600056,Butch T-Shirt with V-Neck,4742,1,210200600000
210200600067,Children's Knit Sweater,4742,1,210200600000
210200600085,Gordon Children's Tracking Pants,4742,1,210200600000
210200600112,O'my Children's T-Shirt with Logo,4742,1,210200600000
210200700000,"Olssons, Kids",,2,210200000000
210200700016,Strap Pants BBO,798,1,210200700000
210200800000,Orion Kid's Clothes,,2,210200000000
210200900000,"Osprey, Kids",,2,210200000000
210200900004,Kid Basic Tracking Suit,3664,1,210200900000
210200900033,Osprey France Nylon Shorts,3664,1,210200900000
210200900038,Osprey Girl's Tights,3664,1,210200900000
210201000000,Tracker Kid's Clothes,,2,210200000000
210201000050,Kid Children's T-Shirt,2963,1,210201000000
210201000067,Logo Coord.Children's Sweatshirt,2963,1,210201000000
210201000126,Toddler Footwear Socks with Knobs,2963,1,210201000000
210201000198,South Peak Junior Training Shoes,2963,1,210201000000
210201000199,Starlite Baby Shoes,2963,1,210201000000
210201100000,"Ypsilon, Kids",,2,210200000000
210201100004,Ypsilon Children's Sweat w/Big Logo,14624,1,210201100000
220000000000,Clothes & Shoes,,4,
220100000000,Clothes,,3,220000000000
220100100000,Eclipse Clothing,,2,220100000000
220100100019,Fit Racing Cap,1303,1,220100100000
220100100025,Knit Hat,1303,1,220100100000
220100100044,Sports glasses Satin Alumin.,1303,1,220100100000
220100100101,Big Guy Men's Chaser Poplin Pants,1303,1,220100100000
220100100105,Big Guy Men's Clima Fit Jacket,1303,1,220100100000
220100100125,Big Guy Men's Dri Fit Singlet,1303,1,220100100000
220100100153,Big Guy Men's Fresh Soft Nylon Pants,1303,1,220100100000
220100100185,Big Guy Men's Micro Fiber Full Zip Jacket,1303,1,220100100000
220100100189,Big Guy Men's Micro Fibre Jacket,1303,1,220100100000
220100100192,Big Guy Men's Micro Fibre Shorts XXL,1303,1,220100100000
220100100197,Big Guy Men's Mid Layer Jacket,1303,1,220100100000
220100100235,Big Guy Men's Running Shorts Dri.Fit,1303,1,220100100000
220100100241,Big Guy Men's Santos Shorts Dri Fit,1303,1,220100100000
220100100272,Big Guy Men's T-Shirt,1303,1,220100100000
220100100273,Big Guy Men's T-Shirt Dri Fit,1303,1,220100100000
220100100298,Big Guy Men's Twill Pants Golf,1303,1,220100100000
220100100304,Big Guy Men's Victory Peach Poplin Pants,1303,1,220100100000
220100100309,Big Guy Men's Woven Warm Up,1303,1,220100100000
220100100354,Insu F.I.T Basic,1303,1,220100100000
220100100371,Northern Fleece Scarf,1303,1,220100100000
220100100410,Toto Tube Socks,1303,1,220100100000
220100100421,Trois-fit Running Qtr Socks (Non-Cush),1303,1,220100100000
220100100513,Woman's Deception Dress,1303,1,220100100000
220100100516,Woman's Dri Fit Airborne Top,1303,1,220100100000
220100100523,Woman's Dri-Fit Scoop Neck Bra,1303,1,220100100000
220100100530,Woman's Emblished Work-Out Pants,1303,1,220100100000
220100100536,Woman's Foxhole Jacket,1303,1,220100100000
220100100553,Woman's Short Top Dri Fit,1303,1,220100100000
220100100568,Woman's Micro Fibre Anorak,1303,1,220100100000
220100100581,Woman's Out & Sew Airborn Top,1303,1,220100100000
220100100592,Woman's Short Tights,1303,1,220100100000
220100100609,Woman's Sweatshirt w/Hood,1303,1,220100100000
220100100617,Woman's T-Shirt w/Hood,1303,1,220100100000
220100100629,Woman's Winter Tights,1303,1,220100100000
220100100631,Woman's Work Out Pants Dri Fit,1303,1,220100100000
220100100635,Woman's Woven Warm Up,1303,1,220100100000
220100200000,Green Tomato,,2,220100000000
220100200004,Green Lime Atletic Socks,18139,1,220100200000
220100300000,Knitwear,,2,220100000000
220100300001,Fleece Jacket Compass,772,1,220100300000
220100300008,Dp Roller High-necked Knit,4646,1,220100300000
220100300019,Instyle Pullover Mid w/Small Zipper,772,1,220100300000
220100300020,Instyle T-Shirt,772,1,220100300000
220100300025,Lucky Knitwear Wool Sweater,772,1,220100300000
220100300037,Mayday Resque Fleece Pullover,4646,1,220100300000
220100300042,Truls Polar Fleece Cardigan,12869,1,220100300000
220100400000,LSF,,2,220100000000
220100400005,Big Guy Men's Air Force 1 Sc,1303,1,220100400000
220100400022,Ultra M803 Ng Men's Street Shoes,5503,1,220100400000
220100400023,Ultra W802 All Terrain Women's Shoes,5503,1,220100400000
220100500000,Leisure,,2,220100000000
220100600000,Massif,,2,220100000000
220100700000,Orion,,2,220100000000
220100700002,Dmx 10 Women's Aerobic Shoes,16733,1,220100700000
220100700022,Alexis Women's Classic Shoes,16733,1,220100700000
220100700023,Armadillo Road Dmx Men's Running Shoes,16733,1,220100700000
220100700024,Armadillo Road Dmx Women's Running Shoes,16733,1,220100700000
220100700027,Duration Women's Trainer Aerobic Shoes,16733,1,220100700000
220100700042,"Power Women's Dmx Wide, Walking Shoes",16733,1,220100700000
220100700046,Tcp 6 Men's Running Shoes,16733,1,220100700000
220100700052,Trooper Ii Dmx-2x Men's Walking Shoes,16733,1,220100700000
220100800000,Orion Clothing,,2,220100000000
220100800001,Bra Top Wom.Fitn.Cl,16733,1,220100800000
220100800009,Peacock Pants,16733,1,220100800000
220100800040,Mick's Men's Cl.Tracksuit,16733,1,220100800000
220100800071,Tx Tribe Tank Top,16733,1,220100800000
220100800096,Zx Women's Dance Pants,16733,1,220100800000
220100900000,Osprey,,2,220100000000
220100900006,Osprey Cabri Micro Suit,3664,1,220100900000
220100900029,Osprey Men's King T-Shirt w/Small Logo,3664,1,220100900000
220100900035,Osprey Shadow Indoor,3664,1,220100900000
220101000000,Shorts,,2,220100000000
220101000002,Carribian Women's Jersey Shorts,3298,1,220101000000
220101100000,Stockings & Socks,,2,220100000000
220101200000,Street Wear,,2,220100000000
220101200006,Anthony Bork Maggan 3/4 Long Pique,4646,1,220101200000
220101200020,Tyfoon Flex Shorts,11427,1,220101200000
220101200025,Tyfoon Ketch T-Shirt,11427,1,220101200000
220101200029,Tyfoon Oliver Sweatshirt,11427,1,220101200000
220101300000,T-Shirts,,2,220100000000
220101300001,"T-Shirt, Short-sleeved, Big Logo",3298,1,220101300000
220101300012,Men's T-Shirt Small Logo,3298,1,220101300000
220101300017,Toncot Beefy-T Emb T-Shirt,3298,1,220101300000
220101400000,Tracker Clothes,,2,220100000000
220101400004,Badminton Cotton,2963,1,220101400000
220101400017,Men's Cap,2963,1,220101400000
220101400018,Men's Running Tee Short Sleeves,2963,1,220101400000
220101400032,Socks Wmns'Fitness,1303,1,220101400000
220101400047,Swimming Trunks Struc,2963,1,220101400000
220101400060,2bwet 3 Cb Swimming Trunks,2963,1,220101400000
220101400061,2bwet 3 Solid Bikini,2963,1,220101400000
220101400088,Casual Genuine Polo-Shirt,2963,1,220101400000
220101400091,Casual Genuine Tee,2963,1,220101400000
220101400092,Casual Logo Men's Sweatshirt,2963,1,220101400000
220101400098,Casual Sport Shorts,2963,1,220101400000
220101400117,Casual.st.polo Long-sleeved Polo-shirt,2963,1,220101400000
220101400130,Comp. Women's Sleeveless Polo,2963,1,220101400000
220101400138,Dima 2-Layer Men's Suit,2963,1,220101400000
220101400145,Essence.baseball Cap,2963,1,220101400000
220101400148,Essence.cap Men's Bag,2963,1,220101400000
220101400150,Essential Suit 2 Swim Suit,2963,1,220101400000
220101400152,Essential Trunk 2 Swimming Trunks,2963,1,220101400000
220101400201,Kaitum Women's Swim Suit,2963,1,220101400000
220101400216,Mm Daypouch Shoulder Bag,2963,1,220101400000
220101400237,Mns.jacket Jacket,2963,1,220101400000
220101400238,Mns.long Tights,2963,1,220101400000
220101400265,Ottis Pes Men's Pants,2963,1,220101400000
220101400269,Outfit Women's Shirt,2963,1,220101400000
220101400276,Pine Sweat with Hood,2963,1,220101400000
220101400285,Quali Jacket with Hood,2963,1,220101400000
220101400289,Quali Sweatpant,2963,1,220101400000
220101400290,Quali Sweatshirt,2963,1,220101400000
220101400306,Sherpa Pes Shiny Cotton,2963,1,220101400000
220101400310,Short Women's Tights,2963,1,220101400000
220101400328,Stars Swim Suit,2963,1,220101400000
220101400339,Tims Shorts,2963,1,220101400000
220101400349,Tracker Fitness Stockings,2963,1,220101400000
220101400363,Brafit Swim Tights,4742,1,220101400000
220101400373,Jogging Pants  Men's Tracking Pants w/Small L,14682,1,220101400000
220101400385,N.d.gear Basic T-Shirt,14682,1,220101400000
220101400387,N.d.gear Cap,14682,1,220101400000
220101500000,Twain,,2,220100000000
220200000000,Shoes,,3,220000000000
220200100000,Eclipse Shoes,,2,220200000000
220200100002,Cnv Plus Men's Off Court Tennis,1303,1,220200100000
220200100009,Atmosphere Imara Women's Running Shoes,1303,1,220200100000
220200100012,Atmosphere Shatter Mid Shoes,1303,1,220200100000
220200100035,Big Guy Men's Air Deschutz Viii Shoes,1303,1,220200100000
220200100090,Big Guy Men's Air Terra Reach Shoes,1303,1,220200100000
220200100092,Big Guy Men's Air Terra Sebec Shoes,1303,1,220200100000
220200100129,Big Guy Men's International Triax Shoes,1303,1,220200100000
220200100137,Big Guy Men's Multicourt Ii Shoes,1303,1,220200100000
220200100171,Woman's Air Amend Mid,1303,1,220200100000
220200100179,Woman's Air Converge Triax X,1303,1,220200100000
220200100190,Woman's Air Imara,1303,1,220200100000
220200100202,Woman's Air Rasp Suede,1303,1,220200100000
220200100226,Woman's Air Zoom Drive,1303,1,220200100000
220200100229,Woman's Air Zoom Sterling,1303,1,220200100000
220200200000,Shoes,,2,220200000000
220200200014,Dubby Low Men's Street Shoes,109,1,220200200000
220200200018,Lulu Men's Street Shoes,109,1,220200200000
220200200022,Pro Fit Gel Ds Trainer Women's Running Shoes,1747,1,220200200000
220200200024,Pro Fit Gel Gt 2030 Women's Running Shoes,1747,1,220200200000
220200200035,Soft Alta Plus Women's Indoor Shoes,1747,1,220200200000
220200200036,Soft Astro Men's Running Shoes,1747,1,220200200000
220200200071,Twain Men's Exit Low 2000 Street Shoes,13198,1,220200200000
220200200073,Twain Stf6 Gtx M Men's Trekking Boot,13198,1,220200200000
220200200077,Twain Women's Exit Iii Mid Cd X-Hiking Shoes,13198,1,220200200000
220200200079,Twain Women's Expresso X-Hiking Shoes,13198,1,220200200000
220200300000,Tracker Shoes,,2,220200000000
220200300002,Pytossage Bathing Sandal,2963,1,220200300000
220200300005,Liga Football Boot,2963,1,220200300000
220200300015,Men's Running Shoes Piedmmont,2963,1,220200300000
220200300079,Hilly Women's Crosstrainer Shoes,2963,1,220200300000
220200300082,Indoor Handbold Special Shoes,2963,1,220200300000
220200300096,Mns.raptor Precision Sg Football,2963,1,220200300000
220200300116,South Peak Men's Running Shoes,2963,1,220200300000
220200300129,Torino Men's Leather Adventure Shoes,2963,1,220200300000
220200300154,Hardcore Junior/Women's Street Shoes Large,14682,1,220200300000
220200300157,Hardcore Men's Street Shoes Large,14682,1,220200300000
230000000000,Outdoors,,4,
230100000000,Outdoors,,3,230000000000
230100100000,Anoraks & Parkas,,2,230100000000
230100100006,Jacket Nome,4742,1,230100100000
230100100013,Jacket with Removable Fleece,772,1,230100100000
230100100015,Men's Jacket Caians,50,1,230100100000
230100100017,Men's Jacket Rem,50,1,230100100000
230100100018,Men's Jacket Sandy,4742,1,230100100000
230100100025,Women's Shorts,50,1,230100100000
230100100028,4men Men's Polar Down Jacket,772,1,230100100000
230100100033,Big Guy Men's Packable Hiking Shorts,15218,1,230100100000
230100100045,Duwall Pants,772,1,230100100000
230100100051,Lucky Voss Jacket,772,1,230100100000
230100100053,Monster Men's Pants with Zipper,50,1,230100100000
230100100062,Topper Pants,772,1,230100100000
230100100063,Tx Peak Parka,15218,1,230100100000
230100200000,Backpacks,,2,230100000000
230100200004,Black/Black,755,1,230100200000
230100200006,X-Large Bottlegreen/Black,755,1,230100200000
230100200019,Commanche Women's 6000 Q Backpack. Bark,755,1,230100200000
230100200022,Expedition Camp Duffle Medium Backpack,15218,1,230100200000
230100200025,Feelgood 55-75 Litre Black Women's Backpack,10692,1,230100200000
230100200029,Jaguar 50-75 Liter Blue Women's Backpack,10692,1,230100200000
230100200043,Medium Black/Bark Backpack,755,1,230100200000
230100200047,Medium Gold Black/Gold Backpack,755,1,230100200000
230100200048,Medium Olive Olive/Black Backpack,755,1,230100200000
230100200054,Trekker 65 Royal Men's Backpack,10692,1,230100200000
230100200056,Victor Grey/Olive Women's Backpack,755,1,230100200000
230100200059,Deer Backpack,4742,1,230100200000
230100200066,Deer Waist Bag,4742,1,230100200000
230100200073,Hammock Sports Bag,4742,1,230100200000
230100200074,Sioux Men's Backpack 26 Litre.,15218,1,230100200000
230100300000,Gloves & Mittens,,2,230100000000
230100300006,Gloves Le Fly Mitten,1684,1,230100300000
230100300010,Massif Dual Gloves,13199,1,230100300000
230100300013,Montana Adult Gloves,6355,1,230100300000
230100300023,Scania Unisex Gloves,6355,1,230100300000
230100400000,Knitted Accessories,,2,230100000000
230100400007,Breaker Commandos Cap,4793,1,230100400000
230100400010,Breaker Frozen Husky Hat,4793,1,230100400000
230100400012,Breaker Russia Cap,4793,1,230100400000
230100400025,Mayday Serious Headband,4646,1,230100400000
230100500000,Outdoor Gear,,2,230100000000
230100500004,"Backpack Flag, 6,5x9 Cm.",316,1,230100500000
230100500006,Collapsible Water Can,316,1,230100500000
230100500008,Dome Tent Monodome Alu,316,1,230100500000
230100500012,Inflatable 3.5,316,1,230100500000
230100500013,Lamp with Battery Box,316,1,230100500000
230100500016,"Money Purse, Black",755,1,230100500000
230100500020,Pocket Light with Crypton Bulb,316,1,230100500000
230100500023,Proofing Spray,316,1,230100500000
230100500024,"Small Belt Bag, Black",755,1,230100500000
230100500026,Trekking Tent,316,1,230100500000
230100500045,Cup Picnic Mug 25 Cl.,316,1,230100500000
230100500056,Knife,4718,1,230100500000
230100500058,Mattress with 5 channels 196x72,316,1,230100500000
230100500066,Outback Spirits Kitchen,316,1,230100500000
230100500068,Plate Picnic Deep,316,1,230100500000
230100500072,Single Full Box Madras honeycomb-weave,316,1,230100500000
230100500074,"Tent Milano Tent,4 Persons, about 4.8",316,1,230100500000
230100500077,Jl Legacy Curig I.A.Jacket,772,1,230100500000
230100500080,Jl Rainlight Essential Pants,772,1,230100500000
230100500081,Lucky Tech Classic Rain Pants,772,1,230100500000
230100500082,Lucky Tech Intergal Wp/B Rain Pants,772,1,230100500000
230100500087,Mayday Qd Zip Pants,4646,1,230100500000
230100500091,Mayday Soul Ht Jacket,4646,1,230100500000
230100500092,Mayday Sports Pullover,4646,1,230100500000
230100500093,Mayday W'S Sports Pullover,4646,1,230100500000
230100500094,"Men's Pants, Basic",4646,1,230100500000
230100500095,Men's Sports Pullover,4646,1,230100500000
230100500096,Rain Jacket,772,1,230100500000
230100500101,Ultra Ht Lightning Set,772,1,230100500000
230100600000,Sleepingbags,,2,230100000000
230100600003,"Sheet Sleeping Bag, Red",16422,1,230100600000
230100600005,"Basic 10, Left , Yellow/Black",755,1,230100600000
230100600015,"Expedition Zero,Medium,Left,Charcoal",755,1,230100600000
230100600016,"Expedition Zero,Medium,Right,Charcoal",755,1,230100600000
230100600017,"Expedition Zero,Small,Left,Charcoal",755,1,230100600000
230100600018,"Expedition Zero,Small,Right,Charcoal",755,1,230100600000
230100600022,"Expedition10,Medium,Right,Blue Ribbon",755,1,230100600000
230100600023,"Expedition 10,Small,Left,Blue Ribbon",755,1,230100600000
230100600024,"Expedition 10,Small,Right,Blue Ribbon",755,1,230100600000
230100600026,"Expedition 20,Large,Right,Forestgreen",755,1,230100600000
230100600028,"Expedition 20,Medium,Right,Forestgreen",755,1,230100600000
230100600030,"Outback Sleeping Bag, Large,Left,Blue/Black",755,1,230100600000
230100600031,"Outback Sleeping Bag, Large,Right, Blue/Black",755,1,230100600000
230100600035,"Polar Bear Sleeping mat, Olive Green",16422,1,230100600000
230100600036,Tent Summer 195 Twin Sleeping Bag,16422,1,230100600000
230100600038,Tipee Summer Sleeping Bag,16422,1,230100600000
230100600039,Tipee Twin Blue/Orange,16422,1,230100600000
230100700000,Tents,,2,230100000000
230100700002,Comfort Shelter,16422,1,230100700000
230100700004,Expedition Dome 3,16422,1,230100700000
230100700008,Family Holiday 4,109,1,230100700000
230100700009,Family Holiday 6,109,1,230100700000
230100700011,Hurricane 4,109,1,230100700000
240000000000,Sports,,4,
240100000000,Assorted Sports Articles,,3,240000000000
240100100000,Assorted Sports articles,,2,240100000000
240100100029,Buzz Saw,16814,1,240100100000
240100100031,Capsy Hood,6153,1,240100100000
240100100063,Grey Met.,16814,1,240100100000
240100100065,Grey,16814,1,240100100000
240100100148,Wood Box for 6 Balls,4514,1,240100100000
240100100159,A-team Smoothsport Bra,3298,1,240100100000
240100100184,Barret 2.12 Men's Softboot,3815,1,240100100000
240100100186,Barret 3.1 Women's Softboot,3815,1,240100100000
240100100232,Dartsharpener Key ring,4514,1,240100100000
240100100305,Hiclass Mundo 78a 36x72mm Pink-Swirl,3815,1,240100100000
240100100312,Hot Mini Backboard Bulls,2995,1,240100100000
240100100354,Mk Splinter 66 5m 88a Pea.,1684,1,240100100000
240100100365,Northern Coach,12283,1,240100100000
240100100366,Northern Liquid Belt with Bottle,12283,1,240100100000
240100100403,Proskater Viablade Tx Women's Fitness,3815,1,240100100000
240100100410,Prosoccer  Club Football 4/32 (Replica) Synth,5810,1,240100100000
240100100433,Shoelace White 150 Cm,5810,1,240100100000
240100100434,Shoeshine Black,16814,1,240100100000
240100100463,Sparkle Spray Orange,16814,1,240100100000
240100100477,Stout Brass 18 Gram,4514,1,240100100000
240100100508,Top Elite Kit Small,3815,1,240100100000
240100100535,Victor 76 76mm Optics Blue,1684,1,240100100000
240100100581,Eliza T-Shirt,4742,1,240100100000
240100100605,Fred T-Shirt,4742,1,240100100000
240100100610,Goodtime Bag,4742,1,240100100000
240100100615,Goodtime Toilet Bag,4742,1,240100100000
240100100646,Lyon Men's Jacket,4742,1,240100100000
240100100654,Montevideo Men's Shorts,4742,1,240100100000
240100100665,Pool Shorts,4742,1,240100100000
240100100672,Ribstop Jacket,4742,1,240100100000
240100100676,Roth T-Shirt,4742,1,240100100000
240100100679,Saturn Big Bag,4742,1,240100100000
240100100690,Shirt Termir,4742,1,240100100000
240100100703,Stream Sweatshirt with Tube,4742,1,240100100000
240100100714,Tybor Sweatshirt with Hood,4742,1,240100100000
240100100734,Wyoming Men's Socks,4742,1,240100100000
240100100737,Wyoming Men's T-Shirt with V-Neck,4742,1,240100100000
240100200000,Darts,,2,240100000000
240100200001,Aim4it 16 Gram Softtip Pil,4514,1,240100200000
240100200004,Aim4it 80% Tungsten 22 Gram,4514,1,240100200000
240100200014,Pacific 95% 23 Gram,4514,1,240100200000
240100300000,Petanque - Boule,,2,240100000000
240100400000,Skates,,2,240100000000
240100400004,Children's Roller Skates,1684,1,240100400000
240100400005,Cool Fit Men's Roller Skates,13198,1,240100400000
240100400006,Cool Fit Women's Roller Skates,13198,1,240100400000
240100400037,N.d.gear Roller Skates Ff80 80 millimetre78a,1684,1,240100400000
240100400043,Perfect Fit Men's  Roller Skates,13198,1,240100400000
240100400044,Perfect Fit Men's Roller Skates,13198,1,240100400000
240100400046,Perfect Fit Men's Stunt Skates,13198,1,240100400000
240100400049,Perfect Fit Women's Roller Skates Custom,13198,1,240100400000
240100400058,Pro-roll Hot Rod Roller Skates,1684,1,240100400000
240100400062,Pro-roll Lazer Roller Skates,1684,1,240100400000
240100400069,Pro-roll Panga Roller Skates,1684,1,240100400000
240100400070,Pro-roll Sabotage-Rp  Roller Skates,1684,1,240100400000
240100400076,Pro-roll Sq9 80-76mm/78a Roller Skates,1684,1,240100400000
240100400080,Proskater Kitalpha Gamma Roller Skates,3815,1,240100400000
240100400083,Proskater Viablade S Roller Skates,3815,1,240100400000
240100400085,Proskater W-500 Jr.Roller Skates,3815,1,240100400000
240100400095,Rollerskate Roller Skates Control Xi Adult,1684,1,240100400000
240100400098,Rollerskate  Roller Skates Ex9 76mm/78a Biofl,1684,1,240100400000
240100400100,Rollerskate Roller Skates Gretzky Mvp S.B.S,1684,1,240100400000
240100400112,Rollerskate Roller Skates Panga 72mm/78a,1684,1,240100400000
240100400125,Rollerskate Roller Skates Sq5 76mm/78a,1684,1,240100400000
240100400128,Rollerskate Roller Skates Sq7-Ls 76mm/78a,1684,1,240100400000
240100400129,Rollerskate Roller Skates Sq9 80-76mm/78a,1684,1,240100400000
240100400136,Rollerskate Roller Skates Xpander,1684,1,240100400000
240100400142,Twain Ac7/Ft7 Men's Roller Skates,13198,1,240100400000
240100400143,Twain Ac7/Ft7 Women's Roller Skates,13198,1,240100400000
240100400147,Twain Tr7 Men's Roller Skates,13198,1,240100400000
240100400151,Weston F4 Men's Hockey Skates,3815,1,240100400000
240200000000,Golf,,3,240000000000
240200100000,Golf,,2,240200000000
240200100007,Ball Bag,2995,1,240200100000
240200100020,Red/White/Black Staff 9 Bag,17832,1,240200100000
240200100021,Tee Holder,2995,1,240200100000
240200100034,Bb Softspikes - Xp 22-pack,15938,1,240200100000
240200100043,Bretagne Performance Tg Men's Golf Shoes L.,2995,1,240200100000
240200100046,"Bretagne Soft-Tech Men's Glove, left",2995,1,240200100000
240200100050,"Bretagne St2 Men's Golf Glove, left",2995,1,240200100000
240200100051,Bretagne Stabilites 2000 Goretex Shoes,2995,1,240200100000
240200100052,Bretagne Stabilities Tg Men's Golf Shoes,2995,1,240200100000
240200100053,Bretagne Stabilities Women's Golf Shoes,2995,1,240200100000
240200100056,Carolina,3808,1,240200100000
240200100057,Carolina II,3808,1,240200100000
240200100073,Donald Plush Headcover,15938,1,240200100000
240200100076,Expert Men's Firesole Driver,13198,1,240200100000
240200100081,Extreme Distance 90 3-pack,3808,1,240200100000
240200100095,Grandslam Staff Fs Copper Insert Putter,17832,1,240200100000
240200100098,Grandslam Staff Grip Llh Golf Gloves,3808,1,240200100000
240200100101,Grandslam Staff Tour Mhl Golf Gloves,3808,1,240200100000
240200100116,Hi-fly Intimidator Ti R80/10,2995,1,240200100000
240200100118,Hi-fly Intrepid Stand 8  Black,2995,1,240200100000
240200100124,Hi-fly Staff Towel Blue/Black,2995,1,240200100000
240200100131,Hi-fly Tour Advance Flex Steel,2995,1,240200100000
240200100154,"Men's.m Men's Winter Gloves, Medium",2995,1,240200100000
240200100157,Normal Standard,15938,1,240200100000
240200100164,Precision Jack 309 Lh Balata,17832,1,240200100000
240200100173,Proplay Executive Bi-Metal Graphite,2995,1,240200100000
240200100180,Proplay Men's Tour Force Lp 7-Wood,2995,1,240200100000
240200100181,Proplay Men's Tour Force Lp Driver,2995,1,240200100000
240200100183,Proplay Men's Tour Force Ti 5w,2995,1,240200100000
240200100207,Proplay Stand Black,2995,1,240200100000
240200100211,Proplay Women's Tour Force 7w,2995,1,240200100000
240200100221,Rosefinch Cart 8 1/2  Black,2995,1,240200100000
240200100225,Rubby Men's Golf Shoes w/Goretex,4168,1,240200100000
240200100226,Rubby Men's Golf Shoes w/Goretex Plain Toe,4168,1,240200100000
240200100227,Rubby Women's Golf Shoes w/Gore-Tex,4168,1,240200100000
240200100230,Score Counter Scoreboard De Luxe,2995,1,240200100000
240200100232,Tee18 Ascot Chipper,2995,1,240200100000
240200100233,Tee18 Troon 7  Black,2995,1,240200100000
240200100246,"White 90,Top.Flite Strata Tour 3-pack",2995,1,240200100000
240200200000,Golf Clothes,,2,240200000000
240200200007,Golf Polo(1/400),7511,1,240200200000
240200200011,Golf Windstopper,7511,1,240200200000
240200200013,Master Golf Rain Suit,7511,1,240200200000
240200200015,Tek Cap,13198,1,240200200000
240200200020,Big Boss Houston Pants,7511,1,240200200000
240200200024,Bogie Golf Fleece with small Zipper,7511,1,240200200000
240200200026,Eagle 5 Pocket Pants with Stretch,10225,1,240200200000
240200200035,Eagle Pants with Cross Pocket,10225,1,240200200000
240200200039,Eagle Plain Cap,10225,1,240200200000
240200200044,Eagle Polo-Shirt Interlock,10225,1,240200200000
240200200060,Eagle Windstopper Knit Neck,10225,1,240200200000
240200200061,Eagle Windstopper Sweat Neck,10225,1,240200200000
240200200068,Hi-fly Staff Rain Suit,2995,1,240200200000
240200200071,Hi-fly Strata Cap Offwhite/Green,2995,1,240200200000
240200200080,Release Golf Sweatshirt w/Logo(1/100),7511,1,240200200000
240200200081,Top (1/100),7511,1,240200200000
240200200091,Wind Proof Windstopper Merino/Acryl,10225,1,240200200000
240300000000,Indoor Sports,,3,240000000000
240300100000,Fitness,,2,240300000000
240300100001,Abdomen Shaper,16542,1,240300100000
240300100020,Fitness Dumbbell Foam 0.90,16542,1,240300100000
240300100028,Letour Heart Bike,16542,1,240300100000
240300100032,Letour Trimag Bike,16542,1,240300100000
240300100046,Weight  5.0 Kg,16542,1,240300100000
240300100048,Wrist Weight 1.10 Kg,16542,1,240300100000
240300100049,Wrist Weight  2.25 Kg,16542,1,240300100000
240300200000,Gymnastic Clothing,,2,240300000000
240300200009,Blues Jazz Pants Suplex,798,1,240300200000
240300200018,Cougar Fleece Jacket with Zipper,13710,1,240300200000
240300200058,Cougar Windbreaker Vest,13710,1,240300200000
240300300000,Top Trim,,2,240300000000
240300300024,Men's Summer Shorts,14648,1,240300300000
240300300065,Top Men's Goretex Ski Pants,14648,1,240300300000
240300300070,Top Men's R&D Ultimate Jacket,14648,1,240300300000
240300300071,Top Men's Retro T-Neck,14648,1,240300300000
240300300090,Top R&D Long Jacket,14648,1,240300300000
240400000000,Racket Sports,,3,240000000000
240400100000,Badminton,,2,240400000000
240400200000,Racket Sports,,2,240400000000
240400200003,Bat 5-Ply,3808,1,240400200000
240400200012,Sledgehammer 120 Ph Black,17832,1,240400200000
240400200022,Aftm 95 Vf Long Bg-65 White,1280,1,240400200000
240400200036,Bag  Tit.Weekend,13079,1,240400200000
240400200057,Grandslam Ultra Power Tennisketcher,17832,1,240400200000
240400200066,"Memhis 350,Yellow Medium, 6-pack tube",1280,1,240400200000
240400200091,Smasher Rd Ti 70 Tennis Racket,1280,1,240400200000
240400200093,Smasher Super Rq Ti 350 Tennis Racket,1280,1,240400200000
240400200094,Smasher Super Rq Ti 700 Long Tennis,1280,1,240400200000
240400200097,Smasher Tg 70 Tennis String Roll,1280,1,240400200000
240400300000,Tennis,,2,240400000000
240400300013,Anthony Women's Tennis Cable Vest,4646,1,240400300000
240400300033,Smasher Polo-Shirt w/V-Neck,1280,1,240400300000
240400300035,Smasher Shorts,1280,1,240400300000
240400300039,Smasher Tights,1280,1,240400300000
240500000000,Running - Jogging,,3,240000000000
240500100000,Jogging,,2,240500000000
240500100004,Pants N,4742,1,240500100000
240500100015,A-team Pants Taffeta,3298,1,240500100000
240500100017,"A-team Sweat Round Neck, Small Logo",3298,1,240500100000
240500100026,"Men's Sweat Pants without Rib, Small Logo",3298,1,240500100000
240500100029,Men's Sweatshirt w/Hood Big Logo,3298,1,240500100000
240500100039,Sweatshirt Women's Sweatshirt with O-Neck,3298,1,240500100000
240500100041,Triffy Jacket,13314,1,240500100000
240500100043,Triffy Logo T-Shirt with V-Neck,13314,1,240500100000
240500100057,"Woman Sweat with Round Neck, Big Logo",3298,1,240500100000
240500100062,Ypsilon Men's Sweatshirt w/Piping,14624,1,240500100000
240500200000,Running Clothes,,2,240500000000
240500200003,Men's Singlet,5922,1,240500200000
240500200007,Running Gloves,5922,1,240500200000
240500200016,T-Shirt,2963,1,240500200000
240500200042,Bike.Pants Short Biking Pants,5922,1,240500200000
240500200056,Breath-brief Long Underpants XXL,5922,1,240500200000
240500200073,Force Classic Men's Jacket,5922,1,240500200000
240500200081,Force Micro Men's Suit,5922,1,240500200000
240500200082,Force Short Sprinter Men's Tights,5922,1,240500200000
240500200083,Force Technical Jacket w/Coolmax,5922,1,240500200000
240500200093,Maxrun Running Tights,5922,1,240500200000
240500200100,Original Running Pants,5922,1,240500200000
240500200101,Polar Jacket,5922,1,240500200000
240500200121,Stout Running Shorts,5922,1,240500200000
240500200122,Stout Running Shorts Micro,5922,1,240500200000
240500200130,Topline Delphi Race Shorts,5922,1,240500200000
240600000000,Swim Sports,,3,240000000000
240600100000,Bathing Suits,,2,240600000000
240600100010,"Goggles, Assorted Colours",6153,1,240600100000
240600100016,Swim Suit Fabulo,6153,1,240600100000
240600100017,Swim Suit Laurel,4742,1,240600100000
240600100080,Sharky Swimming Trunks,16292,1,240600100000
240600100102,Sunfit Luffa Bikini,6153,1,240600100000
240600100181,Milan Swimming Trunks,4742,1,240600100000
240600100185,Pew Swimming Trunks,4742,1,240600100000
240700000000,Team Sports,,3,240000000000
240700100000,American Football,,2,240700000000
240700100001,Armour L,3298,1,240700100000
240700100004,Armour XL,3298,1,240700100000
240700100007,Football - Helmet M,3298,1,240700100000
240700100011,Football - Helmet Pro XL,3298,1,240700100000
240700100012,Football - Helmet S,3298,1,240700100000
240700100013,Football - Helmet XL,3298,1,240700100000
240700100017,Football Super Bowl,3808,1,240700100000
240700200000,Baseball,,2,240700000000
240700200004,Baseball Orange Small,14648,1,240700200000
240700200007,Baseball White Small,14648,1,240700200000
240700200009,Bat - Home Run M,15218,1,240700200000
240700200010,Bat - Home Run S,15218,1,240700200000
240700200018,Helmet L,15218,1,240700200000
240700200019,Helmet M,15218,1,240700200000
240700200021,Helmet XL,15218,1,240700200000
240700200024,Bat - Large,15218,1,240700200000
240700300000,Basket Ball,,2,240700000000
240700300002,Basket Ball Pro,10225,1,240700300000
240700400000,Soccer,,2,240700000000
240700400002,Stephens Shirt,5810,1,240700400000
240700400003,Red Cap,6071,1,240700400000
240700400004,Red Scarf,6071,1,240700400000
240700400017,Fga Home Shorts,14593,1,240700400000
240700400020,Norwood Player Shirt,14593,1,240700400000
240700400024,Prosoccer Away Shirt,14593,1,240700400000
240700400031,Soccer Fan Football Player Shirt,6071,1,240700400000
240800000000,Winter Sports,,3,240000000000
240800100000,Ski Dress,,2,240800000000
240800100026,Additive Women's Ski Pants Vent Air,50,1,240800100000
240800100039,Garbo Fleece Jacket,15218,1,240800100000
240800100041,Helmsdale Ski Jacket,772,1,240800100000
240800100042,Helmsdale Ski Pants,772,1,240800100000
240800100074,Mayday Soul Pro New Tech Ski Jacket,4646,1,240800100000
240800200000,Winter Sports,,2,240800000000
240800200002,Massif Bandit Ski Parcel Axial,13199,1,240800200000
240800200008,"Twain X-Scream 7.9 Ski,Sq 750 Dri",13198,1,240800200000
240800200009,Amber Cc,16814,1,240800200000
240800200010,Black Morphe,16814,1,240800200000
240800200020,"C.A.M.,Bone",16814,1,240800200000
240800200021,Cayenne Red,16814,1,240800200000
240800200030,"Ii Pmt,Bone",16814,1,240800200000
240800200034,"Regulator,Stopsign",16814,1,240800200000
240800200035,Shine Black PRO,16814,1,240800200000
240800200037,Coolman Pro 01 Neon Yellow,13198,1,240800200000
240800200062,Top Equipe 07 Green,13198,1,240800200000
240800200063,Top Equipe 99 Black,13198,1,240800200000
;;;;
run;

data ORION.QTR1_2007;
   attrib Order_ID length=8 label='Order ID' format=12.;
   attrib Order_Type length=8 label='Order Type';
   attrib Customer_ID length=8 label='Customer ID' format=12.;
   attrib Order_Date length=8 label='Date Order was placed by Customer' format=DATE9.;
   attrib Delivery_Date length=8 label='Date Order was Delivered' format=DATE9.;

   infile datalines dsd;
   input
      Order_ID
      Order_Type
      Customer_ID
      Order_Date
      Delivery_Date
   ;
datalines4;
1241054779,3,24,18629,18632
1241063739,1,89,18630,18631
1241066216,1,171,18631,18631
1241086052,3,53,18633,18636
1241147641,1,53,18640,18640
1241235281,1,171,18650,18657
1241244297,1,111,18651,18651
1241263172,3,3959,18652,18653
1241286432,3,27,18655,18660
1241298131,2,2806,18656,18666
1241359997,1,12,18663,18663
1241371145,1,171,18665,18665
1241390440,1,41,18667,18667
1241461856,1,18,18674,18675
1241561055,1,171,18686,18686
1241623505,3,24,18692,18695
1241645664,2,70100,18695,18699
1241652707,3,27,18695,18700
1241686210,1,10,18699,18705
1241715610,1,92,18702,18702
1241731828,1,31,18704,18704
1241789227,3,17023,18711,18716
;;;;
run;

data ORION.QTR1_2011;
   attrib Order_ID length=8 label='Order ID' format=12.;
   attrib Order_Type length=8 label='Order Type';
   attrib Customer_ID length=8 label='Customer ID' format=12.;
   attrib Order_Date length=8 label='Date Order was placed by Customer' format=DATE9.;
   attrib Delivery_Date length=8 label='Date Order was Delivered' format=DATE9.;

   infile datalines dsd;
   input
      Order_ID
      Order_Type
      Customer_ID
      Order_Date
      Delivery_Date
   ;
datalines4;
1241054779,3,24,18629,18632
1241063739,1,89,18630,18631
1241066216,1,171,18631,18631
1241086052,3,53,18633,18636
1241147641,1,53,18640,18640
1241235281,1,171,18650,18657
1241244297,1,111,18651,18651
1241263172,3,3959,18652,18653
1241286432,3,27,18655,18660
1241298131,2,2806,18656,18666
1241359997,1,12,18663,18663
1241371145,1,171,18665,18665
1241390440,1,41,18667,18667
1241461856,1,18,18674,18675
1241561055,1,171,18686,18686
1241623505,3,24,18692,18695
1241645664,2,70100,18695,18699
1241652707,3,27,18695,18700
1241686210,1,10,18699,18705
1241715610,1,92,18702,18702
1241731828,1,31,18704,18704
1241789227,3,17023,18711,18716
;;;;
run;

data ORION.QTR2_2007;
   attrib Order_ID length=8 label='Order ID' format=12.;
   attrib Order_Type length=8 label='Order Type';
   attrib Employee_ID length=8 label='Employee ID' format=12.;
   attrib Customer_ID length=8 label='Customer ID' format=12.;
   attrib Order_Date length=8 label='Date Order was placed by Customer' format=DATE9.;
   attrib Delivery_Date length=8 label='Date Order was Delivered' format=DATE9.;

   infile datalines dsd;
   input
      Order_ID
      Order_Type
      Employee_ID
      Customer_ID
      Order_Date
      Delivery_Date
   ;
datalines4;
1241895594,1,121051,56,18722,18726
1241909303,0,99999999,46966,18724,18725
1241930625,3,99999999,27,18726,18731
1241977403,1,120152,171,18732,18732
1242012259,1,121040,10,18735,18729
1242012269,1,121040,45,18735,18735
1242035131,1,120132,183,18738,18738
1242076538,3,99999999,31,18742,18746
1242130888,1,121086,92,18748,18748
1242140006,4,99999999,5,18749,18754
1242140009,2,99999999,90,18749,18751
1242149082,1,121032,90,18750,18750
1242159212,3,99999999,5,18751,18756
1242161468,3,99999999,2550,18751,18756
1242162201,3,99999999,46966,18752,18753
1242173926,3,99999999,1033,18753,18757
1242185055,1,120136,41,18755,18755
,3,99999999,70079,18758,18761
,1,120127,171,18760,18760
1242259863,2,99999999,70187,18763,18768
1242265757,1,121105,10,18763,18763
1242449327,3,99999999,27,18834,18834
1242458099,1,121071,10,18784,18784
1242467585,3,99999999,34,18785,18791
1242477751,3,99999999,31,18786,18790
1242493791,1,121056,5,18788,18788
1242502670,1,121067,31,18789,18789
1242515373,3,99999999,17023,18791,18796
1242534503,3,99999999,70165,18793,18800
1242557584,2,99999999,89,18795,18799
1242559569,1,120130,171,18796,18796
1242568696,2,99999999,2806,18796,18800
1242578860,2,99999999,70100,18798,18802
1242610991,1,121037,12,18801,18801
1242647539,1,121109,45,18805,18805
1242657273,1,121037,90,18806,18806
;;;;
run;

data ORION.QTR2_2011;
   attrib Order_ID length=8 label='Order ID' format=12.;
   attrib Order_Type length=8 label='Order Type';
   attrib Employee_ID length=8 label='Employee ID' format=12.;
   attrib Customer_ID length=8 label='Customer ID' format=12.;
   attrib Order_Date length=8 label='Date Order was placed by Customer' format=DATE9.;
   attrib Delivery_Date length=8 label='Date Order was Delivered' format=DATE9.;

   infile datalines dsd;
   input
      Order_ID
      Order_Type
      Employee_ID
      Customer_ID
      Order_Date
      Delivery_Date
   ;
datalines4;
1241895594,1,121051,56,18722,18726
1241909303,0,99999999,46966,18724,18725
1241930625,3,99999999,27,18726,18731
1241977403,1,120152,171,18732,18732
1242012259,1,121040,10,18735,18729
1242012269,1,121040,45,18735,18735
1242035131,1,120132,183,18738,18738
1242076538,3,99999999,31,18742,18746
1242130888,1,121086,92,18748,18748
1242140006,4,99999999,5,18749,18754
1242140009,2,99999999,90,18749,18751
1242149082,1,121032,90,18750,18750
1242159212,3,99999999,5,18751,18756
1242161468,3,99999999,2550,18751,18756
1242162201,3,99999999,46966,18752,18753
1242173926,3,99999999,1033,18753,18757
1242185055,1,120136,41,18755,18755
,3,99999999,70079,18758,18761
,1,120127,171,18760,18760
1242259863,2,99999999,70187,18763,18768
1242265757,1,121105,10,18763,18763
1242449327,3,99999999,27,18834,18834
1242458099,1,121071,10,18784,18784
1242467585,3,99999999,34,18785,18791
1242477751,3,99999999,31,18786,18790
1242493791,1,121056,5,18788,18788
1242502670,1,121067,31,18789,18789
1242515373,3,99999999,17023,18791,18796
1242534503,3,99999999,70165,18793,18800
1242557584,2,99999999,89,18795,18799
1242559569,1,120130,171,18796,18796
1242568696,2,99999999,2806,18796,18800
1242578860,2,99999999,70100,18798,18802
1242610991,1,121037,12,18801,18801
1242647539,1,121109,45,18805,18805
1242657273,1,121037,90,18806,18806
;;;;
run;

data ORION.SALES;
   attrib Employee_ID length=8 format=12.;
   attrib First_Name length=$12;
   attrib Last_Name length=$18;
   attrib Gender length=$1;
   attrib Salary length=8;
   attrib Job_Title length=$25;
   attrib Country length=$2;
   attrib Birth_Date length=8;
   attrib Hire_Date length=8;

   infile datalines dsd;
   input
      Employee_ID
      First_Name
      Last_Name
      Gender
      Salary
      Job_Title
      Country
      Birth_Date
      Hire_Date
   ;
datalines4;
120102,Tom,Zhou,M,108255,Sales Manager,AU,4971,12205
120103,Wilson,Dawes,M,87975,Sales Manager,AU,-2535,6575
120121,Irenie,Elvish,F,26600,Sales Rep. II,AU,-4169,6575
120122,Christina,Ngan,F,27475,Sales Rep. II,AU,-523,8217
120123,Kimiko,Hotstone,F,26190,Sales Rep. I,AU,3193,10866
120124,Lucian,Daymond,M,26480,Sales Rep. I,AU,1228,8460
120125,Fong,Hofmeister,M,32040,Sales Rep. IV,AU,-391,8460
120126,Satyakam,Denny,M,26780,Sales Rep. II,AU,11951,18475
120127,Sharryn,Clarkson,F,28100,Sales Rep. II,AU,8404,15645
120128,Monica,Kletschkus,F,30890,Sales Rep. IV,AU,11152,18567
120129,Alvin,Roebuck,M,30070,Sales Rep. III,AU,3248,10866
120130,Kevin,Lyon,M,26955,Sales Rep. I,AU,10575,18383
120131,Marinus,Surawski,M,26910,Sales Rep. I,AU,8668,17167
120132,Fancine,Kaiser,F,28525,Sales Rep. III,AU,-2462,8309
120133,Petrea,Soltau,F,27440,Sales Rep. II,AU,11069,18536
120134,Sian,Shannan,M,28015,Sales Rep. II,AU,-2400,6575
120135,Alexei,Platts,M,32490,Sales Rep. IV,AU,4774,15249
120136,Atul,Leyden,M,26605,Sales Rep. I,AU,8659,17198
120137,Marina,Iyengar,F,29715,Sales Rep. III,AU,8471,18322
120138,Shani,Duckett,F,25795,Sales Rep. I,AU,8592,18444
120139,Fang,Wilson,F,26810,Sales Rep. II,AU,11187,18506
120140,Michael,Minas,M,26970,Sales Rep. I,AU,11903,18536
120141,Amanda,Liebman,F,27465,Sales Rep. II,AU,11759,18383
120142,Vincent,Eastley,M,29695,Sales Rep. III,AU,11122,18444
120143,Phu,Sloey,M,26790,Sales Rep. II,AU,1232,9770
120144,Viney,Barbis,M,30265,Sales Rep. III,AU,11023,18536
120145,Sandy,Aisbitt,M,26060,Sales Rep. II,AU,2943,10744
120146,Wendall,Cederlund,M,25985,Sales Rep. I,AU,1370,8979
120147,Skev,Rusli,F,26580,Sales Rep. II,AU,11706,18536
120148,Michael,Zubak,M,28480,Sales Rep. III,AU,-2301,8187
120149,Judy,Chantharasy,F,26390,Sales Rep. I,AU,6899,13515
120150,John,Filo,M,29965,Sales Rep. III,AU,-541,9709
120151,Julianna,Phaiyakounh,F,26520,Sales Rep. II,AU,-4058,6575
120152,Sean,Dives,M,26515,Sales Rep. I,AU,8521,17988
120153,Samantha,Waal,F,27260,Sales Rep. I,AU,8527,15341
120154,Caterina,Hayawardhana,F,30490,Sales Rep. III,AU,-4182,6575
120155,Narelle,James,F,29990,Sales Rep. III,AU,10339,18353
120156,Gerry,Snellings,F,26445,Sales Rep. I,AU,11932,18322
120157,Leonid,Karavdic,M,27860,Sales Rep. II,AU,11009,18597
120158,Daniel,Pilgrim,M,36605,Sales Rep. III,AU,3117,11504
120159,Lynelle,Phoumirath,F,30765,Sales Rep. IV,AU,2976,11139
120160,Chuck,Segrave,M,27115,Sales Rep. I,AU,-479,6848
120161,Rosette,Martines,F,30785,Sales Rep. III,AU,11754,18536
120162,Randal,Scordia,M,27215,Sales Rep. I,AU,11936,18294
120163,Brett,Magrath,M,26735,Sales Rep. II,AU,3064,12784
120164,Ranj,Stamalis,F,27450,Sales Rep. II,AU,1425,9528
120165,Tadashi,Pretorius,M,27050,Sales Rep. I,AU,10305,18322
120166,Fadi,Nowd,M,30660,Sales Rep. IV,AU,-4218,6575
120167,Kimiko,Tilley,F,25185,Sales Rep. I,AU,-607,6606
120168,Selina,Barcoe,F,25275,Sales Rep. I,AU,10310,18567
120169,Cos,Tannous,M,28135,Sales Rep. III,AU,10228,18383
120170,Alban,Kingston,M,28830,Sales Rep. III,AU,6630,13423
120171,Alena,Moody,F,26205,Sales Rep. II,AU,10427,18506
120172,Edwin,Comber,M,28345,Sales Rep. III,AU,-4292,6575
120173,Hernani,Osborn,M,26715,Sales Rep. I,AU,-677,7822
120174,Doungkamol,Simms,F,26850,Sales Rep. I,AU,-4374,6575
120175,Andrew,Conolly,M,25745,Sales Rep. I,AU,11918,18536
120176,Koavea,Pa,M,26095,Sales Rep. I,AU,11270,18567
120177,Franca,Kierce,F,28745,Sales Rep. III,AU,8495,15372
120178,Billy,Plested,M,26165,Sales Rep. II,AU,-404,6665
120179,Matsuoka,Wills,M,28510,Sales Rep. III,AU,6648,17532
120180,Vino,George,M,26970,Sales Rep. II,AU,-553,8370
120198,Meera,Body,F,28025,Sales Rep. III,AU,11708,18597
120261,Harry,Highpoint,M,243190,Chief Sales Officer,US,4800,11535
121018,Julienne,Magolan,F,27560,Sales Rep. II,US,-4381,6575
121019,Scott,Desanctis,M,31320,Sales Rep. IV,US,11133,17684
121020,Cherda,Ridley,F,31750,Sales Rep. IV,US,10280,16922
121021,Priscilla,Farren,F,32985,Sales Rep. IV,US,6918,13939
121022,Robert,Stevens,M,32210,Sales Rep. IV,US,8701,16833
121023,Shawn,Fuller,M,26010,Sales Rep. I,US,2994,12174
121024,Michael,Westlund,M,26600,Sales Rep. II,US,10491,17653
121025,Barnaby,Cassey,M,28295,Sales Rep. II,US,-2274,7183
121026,Terrill,Jaime,M,31515,Sales Rep. IV,US,11269,18353
121027,Allan,Rudder,M,26165,Sales Rep. II,US,3047,12388
121028,William,Smades,M,26585,Sales Rep. I,US,11805,18567
121029,Kuo-Chung,Mcelwee,M,27225,Sales Rep. I,US,3278,12388
121030,Jeryl,Areu,M,26745,Sales Rep. I,US,8716,16468
121031,Scott,Filan,M,28060,Sales Rep. III,US,3112,10805
121032,Nasim,Smith,M,31335,Sales Rep. IV,US,11742,18322
121033,Kristie,Snitzer,F,29775,Sales Rep. III,US,11267,17684
121034,John,Kirkman,M,27110,Sales Rep. II,US,11923,18628
121035,James,Blackley,M,26460,Sales Rep. II,US,-4299,6575
121036,Teresa,Mesley,F,25965,Sales Rep. I,US,11887,17440
121037,Muthukumar,Miketa,M,28310,Sales Rep. III,US,6737,16861
121038,David,Anstey,M,25285,Sales Rep. I,US,11731,18475
121039,Donald,Washington,M,27460,Sales Rep. II,US,-577,8887
121040,Brienne,Darrohn,F,29525,Sales Rep. III,US,1282,9801
121041,Jaime,Wetherington,F,26120,Sales Rep. II,US,-4349,6575
121042,Joseph,Robbin-Coker,M,28845,Sales Rep. III,US,8494,16010
121043,Sigrid,Kagarise,F,28225,Sales Rep. II,US,5061,13209
121044,Ray,Abbott,M,25660,Sales Rep. I,US,-386,7152
121045,Cascile,Hampton,F,28560,Sales Rep. II,US,3086,13880
121046,Roger,Mandzak,M,25845,Sales Rep. I,US,10477,18444
121047,Karen,Grzebien,F,25820,Sales Rep. I,US,8730,18506
121048,Lawrie,Clark,F,26560,Sales Rep. I,US,10402,18506
121049,Perrior,Bataineh,F,26930,Sales Rep. I,US,11002,18597
121050,Patricia,Capristo-Abramczyk,F,26080,Sales Rep. II,US,10969,18597
121051,Glorina,Myers,F,26025,Sales Rep. I,US,-2435,8340
121052,Richard,Fay,M,26900,Sales Rep. II,US,10966,18567
121053,Tywanna,Mcdade,F,29955,Sales Rep. III,US,-4117,6606
121054,Daniel,Pulliam,M,29805,Sales Rep. III,US,-415,7610
121055,Clement,Davis,M,30185,Sales Rep. III,US,11695,18475
121056,Stacey,Lyszyk,F,28325,Sales Rep. II,US,10413,17287
121057,Tachaun,Voron,M,25125,Sales Rep. I,US,1455,9101
121058,Del,Kohake,M,26270,Sales Rep. I,US,6767,17075
121059,Jacqulin,Carhide,F,27425,Sales Rep. II,US,1393,9222
121060,Elizabeth,Spofford,F,28800,Sales Rep. III,US,-4224,6575
121061,Lauris,Hassam,M,29815,Sales Rep. III,US,-534,10409
121062,Debra,Armant,F,30305,Sales Rep. IV,US,10528,18475
121063,Regi,Kinol,M,35990,Sales Rep. II,US,8608,18110
121064,Asishana,Polky,M,25110,Sales Rep. I,US,2949,13027
121065,Corneille,Malta,F,28040,Sales Rep. III,US,10475,18353
121066,Ceresh,Norman,F,27250,Sales Rep. II,US,-4148,6575
121067,Jeanilla,Macnair,F,31865,Sales Rep. IV,US,10975,18322
121068,Salaheloin,Osuba,M,27550,Sales Rep. II,US,5084,13393
121069,Jason,Lapsley,M,26195,Sales Rep. II,US,4826,12692
121070,Agnieszka,Holthouse,F,29385,Sales Rep. III,US,10535,18294
121071,John,Hoppmann,M,28625,Sales Rep. III,US,1348,7914
121072,Christer,North,M,26105,Sales Rep. I,US,8410,17776
121073,Donald,Court,M,27100,Sales Rep. I,US,-2422,6575
121074,Eric,Michonski,M,26990,Sales Rep. I,US,1155,11962
121075,Kasha,Sugg,F,28395,Sales Rep. II,US,-4026,6575
121076,Micah,Cobb,M,26685,Sales Rep. II,US,3204,9862
121077,Bryce,Smotherly,M,28585,Sales Rep. III,US,10475,18536
121078,Lionel,Wende,M,27485,Sales Rep. I,US,-2436,8340
121079,Azmi,Mees,M,25770,Sales Rep. I,US,6728,15280
121080,Kumar,Chinnis,M,32235,Sales Rep. I,US,1119,11566
121081,Susie,Knudson,F,30235,Sales Rep. III,US,-2470,7396
121082,Richard,Debank,M,28510,Sales Rep. III,US,-2371,7944
121083,Tingmei,Sutton,F,27245,Sales Rep. I,US,1165,8460
121084,Tulsidas,Ould,M,22710,Sales Rep. I,US,3150,12784
121085,Rebecca,Huslage,M,32235,Sales Rep. IV,US,11273,18628
121086,John-Michael,Plybon,M,26820,Sales Rep. I,US,-4033,6575
121087,Virtina,O'Suilleabhain,F,28325,Sales Rep. II,US,6915,15765
121088,Momolu,Kernitzki,M,27240,Sales Rep. I,US,11849,18628
121089,Gregory,Sauder,M,28095,Sales Rep. II,US,-498,6756
121090,Betty,Klibbe,F,26600,Sales Rep. I,US,-561,8797
121091,Ernest,Kadiri,M,27325,Sales Rep. II,US,4798,12054
121092,Gynell,Pritt,F,25680,Sales Rep. I,US,6641,17014
121093,Carl,Vasconcellos,M,27410,Sales Rep. I,US,3121,13880
121094,Larry,Tate,M,26555,Sales Rep. I,US,-724,8279
121095,Sara,Kratzke,F,28010,Sales Rep. II,US,4852,12965
121096,Robert,Newstead,M,26335,Sales Rep. I,US,4886,14365
121097,Willeta,Chernega,F,26830,Sales Rep. II,US,6870,14518
121098,Hal,Heatwole,M,27475,Sales Rep. I,US,11769,18383
121099,Royall,Mrvichin,M,32725,Sales Rep. IV,US,8478,16192
121100,Tzue-Ing,Cormell,M,28135,Sales Rep. II,US,-2440,7396
121101,Burnetta,Buckner,F,25390,Sales Rep. I,US,11197,18567
121102,Rocheal,Flammia,F,27115,Sales Rep. I,US,8577,18414
121103,Brian,Farnsworth,M,27260,Sales Rep. I,US,11806,18506
121104,Leoma,Johnson,F,28315,Sales Rep. II,US,3238,11048
121105,Jessica,Savacool,F,29545,Sales Rep. III,US,8529,17167
121106,James,Hilburger,M,25880,Sales Rep. I,US,4781,14641
121107,Rose,Anger,F,31380,Sales Rep. IV,US,11071,18444
121108,Libby,Levi,F,25930,Sales Rep. I,US,11873,18567
121109,Harold,Boulus,M,26035,Sales Rep. I,US,5057,12539
121135,Tammy,Ruta,F,27010,Sales Rep. I,US,-573,6787
121136,Lesia,Galarneau,F,27460,Sales Rep. I,US,6770,17136
121137,Michael. R.,Boocks,M,27055,Sales Rep. I,US,11705,18353
121138,Hershell,Tolley,M,27265,Sales Rep. I,US,-2498,6575
121139,Diosdado,Mckee,F,27700,Sales Rep. II,US,1326,11504
121140,Saunders,Briggi,M,26335,Sales Rep. I,US,8423,16527
121143,Louis,Favaron,M,95090,Senior Sales Manager,US,5078,15157
121144,Renee,Capachietti,F,83505,Sales Manager,US,3101,13088
121145,Dennis,Lansberry,M,84260,Sales Manager,US,-2231,7396
;;;;
run;

data ORION.SALESQUIZ;
   attrib Employee_ID length=8 format=12.;
   attrib First_Name length=$12;
   attrib Last_Name length=$18;
   attrib Gender length=$1;
   attrib Salary length=8;
   attrib Job_Title length=$25;
   attrib Country length=$2;
   attrib Birth_Date length=8;
   attrib Hire_Date length=8;

   infile datalines dsd;
   input
      Employee_ID
      First_Name
      Last_Name
      Gender
      Salary
      Job_Title
      Country
      Birth_Date
      Hire_Date
   ;
datalines4;
120102,Tom,Zhou,M,108255,Sales Manager,AU,4971,12205
120103,Wilson,Dawes,M,87975,Sales Manager,AU,-2535,6575
120121,Irenie,Elvish,F,26600,Sales Rep. II,AU,-4169,6575
120122,Christina,Ngan,F,27475,Sales Rep. II,AU,-523,8217
120123,Kimiko,Hotstone,F,26190,Sales Rep. I,AU,3193,10866
120124,Lucian,Daymond,M,26480,Sales Rep. I,AU,1228,8460
120125,Fong,Hofmeister,M,32040,Sales Rep. IV,AU,-391,8460
120126,Satyakam,Denny,M,26780,Sales Rep. II,AU,11951,18475
120127,Sharryn,Clarkson,F,,Sales Rep. II,AU,8404,15645
120128,Monica,Kletschkus,F,30890,Sales Rep. IV,AU,11152,18567
120129,Alvin,Roebuck,M,30070,Sales Rep. III,AU,3248,10866
120130,Kevin,Lyon,M,26955,Sales Rep. I,AU,10575,18383
120131,Marinus,Surawski,M,26910,Sales Rep. I,AU,8668,17167
120132,Fancine,Kaiser,F,28525,Sales Rep. III,AU,-2462,8309
120133,Petrea,Soltau,F,27440,Sales Rep. II,AU,11069,18536
120134,Sian,Shannan,M,28015,Sales Rep. II,AU,-2400,6575
120135,Alexei,Platts,M,32490,Sales Rep. IV,AU,4774,15249
120136,Atul,Leyden,M,26605,Sales Rep. I,AU,8659,17198
120137,Marina,Iyengar,F,,Sales Rep. III,AU,8471,18322
120138,Shani,Duckett,F,25795,Sales Rep. I,AU,8592,18444
120139,Fang,Wilson,F,26810,Sales Rep. II,AU,11187,18506
120140,Michael,Minas,M,26970,Sales Rep. I,AU,11903,18536
120141,Amanda,Liebman,F,27465,Sales Rep. II,AU,11759,18383
120142,Vincent,Eastley,M,29695,Sales Rep. III,AU,11122,18444
120143,Phu,Sloey,M,26790,Sales Rep. II,AU,1232,9770
120144,Viney,Barbis,M,30265,Sales Rep. III,AU,11023,18536
120145,Sandy,Aisbitt,M,26060,Sales Rep. II,AU,2943,10744
120146,Wendall,Cederlund,M,25985,Sales Rep. I,AU,1370,8979
120147,Skev,Rusli,F,26580,Sales Rep. II,AU,11706,18536
120148,Michael,Zubak,M,28480,Sales Rep. III,AU,-2301,8187
120149,Judy,Chantharasy,F,26390,Sales Rep. I,AU,6899,13515
120150,John,Filo,M,29965,Sales Rep. III,AU,-541,9709
120151,Julianna,Phaiyakounh,F,26520,Sales Rep. II,AU,-4058,6575
120152,Sean,Dives,M,26515,Sales Rep. I,AU,8521,17988
120153,Samantha,Waal,F,27260,Sales Rep. I,AU,8527,15341
120154,Caterina,Hayawardhana,F,30490,Sales Rep. III,AU,-4182,6575
120155,Narelle,James,F,29990,Sales Rep. III,AU,10339,18353
120156,Gerry,Snellings,F,26445,Sales Rep. I,AU,11932,18322
120157,Leonid,Karavdic,M,27860,Sales Rep. II,AU,11009,18597
120158,Daniel,Pilgrim,M,36605,Sales Rep. III,AU,3117,11504
120159,Lynelle,Phoumirath,F,30765,Sales Rep. IV,AU,2976,11139
120160,Chuck,Segrave,M,27115,Sales Rep. I,AU,-479,6848
120161,Rosette,Martines,F,30785,Sales Rep. III,AU,11754,18536
120162,Randal,Scordia,M,27215,Sales Rep. I,AU,11936,18294
120163,Brett,Magrath,M,26735,Sales Rep. II,AU,3064,12784
120164,Ranj,Stamalis,F,27450,Sales Rep. II,AU,1425,9528
120165,Tadashi,Pretorius,M,27050,Sales Rep. I,AU,10305,18322
120166,Fadi,Nowd,M,30660,Sales Rep. IV,AU,-4218,6575
120167,Kimiko,Tilley,F,25185,Sales Rep. I,AU,-607,6606
120168,Selina,Barcoe,F,25275,Sales Rep. I,AU,10310,18567
120169,Cos,Tannous,M,28135,Sales Rep. III,AU,10228,18383
120170,Alban,Kingston,M,28830,Sales Rep. III,AU,6630,13423
120171,Alena,Moody,F,26205,Sales Rep. II,AU,10427,18506
120172,Edwin,Comber,M,28345,Sales Rep. III,AU,-4292,6575
120173,Hernani,Osborn,M,26715,Sales Rep. I,AU,-677,7822
120174,Doungkamol,Simms,F,26850,Sales Rep. I,AU,-4374,6575
120175,Andrew,Conolly,M,25745,Sales Rep. I,AU,11918,18536
120176,Koavea,Pa,M,26095,Sales Rep. I,AU,11270,18567
120177,Franca,Kierce,F,28745,Sales Rep. III,AU,8495,15372
120178,Billy,Plested,M,26165,Sales Rep. II,AU,-404,6665
120179,Matsuoka,Wills,M,28510,Sales Rep. III,AU,6648,17532
120180,Vino,George,M,26970,Sales Rep. II,AU,-553,8370
120198,Meera,Body,F,28025,Sales Rep. III,AU,11708,18597
120261,Harry,Highpoint,M,243190,Chief Sales Officer,US,4800,11535
121018,Julienne,Magolan,F,27560,Sales Rep. II,US,-4381,6575
121019,Scott,Desanctis,M,31320,Sales Rep. IV,US,11133,17684
121020,Cherda,Ridley,F,31750,Sales Rep. IV,US,10280,16922
121021,Priscilla,Farren,F,32985,Sales Rep. IV,US,6918,13939
121022,Robert,Stevens,M,32210,Sales Rep. IV,US,8701,16833
121023,Shawn,Fuller,M,26010,Sales Rep. I,US,2994,12174
121024,Michael,Westlund,M,26600,Sales Rep. II,US,10491,17653
121025,Barnaby,Cassey,M,28295,Sales Rep. II,US,-2274,7183
121026,Terrill,Jaime,M,31515,Sales Rep. IV,US,11269,18353
121027,Allan,Rudder,M,26165,Sales Rep. II,US,3047,12388
121028,William,Smades,M,26585,Sales Rep. I,US,11805,18567
121029,Kuo-Chung,Mcelwee,M,27225,Sales Rep. I,US,3278,12388
121030,Jeryl,Areu,M,26745,Sales Rep. I,US,8716,16468
121031,Scott,Filan,M,28060,Sales Rep. III,US,3112,10805
121032,Nasim,Smith,M,31335,Sales Rep. IV,US,11742,18322
121033,Kristie,Snitzer,F,29775,Sales Rep. III,US,11267,17684
121034,John,Kirkman,M,27110,Sales Rep. II,US,11923,18628
121035,James,Blackley,M,26460,Sales Rep. II,US,-4299,6575
121036,Teresa,Mesley,F,25965,Sales Rep. I,US,11887,17440
121037,Muthukumar,Miketa,M,28310,Sales Rep. III,US,6737,16861
121038,David,Anstey,M,25285,Sales Rep. I,US,11731,18475
121039,Donald,Washington,M,27460,Sales Rep. II,US,-577,8887
121040,Brienne,Darrohn,F,29525,Sales Rep. III,US,1282,9801
121041,Jaime,Wetherington,F,26120,Sales Rep. II,US,-4349,6575
121042,Joseph,Robbin-Coker,M,28845,Sales Rep. III,US,8494,16010
121043,Sigrid,Kagarise,F,28225,Sales Rep. II,US,5061,13209
121044,Ray,Abbott,M,25660,Sales Rep. I,US,-386,7152
121045,Cascile,Hampton,F,28560,Sales Rep. II,US,3086,13880
121046,Roger,Mandzak,M,25845,Sales Rep. I,US,10477,18444
121047,Karen,Grzebien,F,25820,Sales Rep. I,US,8730,18506
121048,Lawrie,Clark,F,26560,Sales Rep. I,US,10402,18506
121049,Perrior,Bataineh,F,26930,Sales Rep. I,US,11002,18597
121050,Patricia,Capristo-Abramczyk,F,26080,Sales Rep. II,US,10969,18597
121051,Glorina,Myers,F,26025,Sales Rep. I,US,-2435,8340
121052,Richard,Fay,M,26900,Sales Rep. II,US,10966,18567
121053,Tywanna,Mcdade,F,29955,Sales Rep. III,US,-4117,6606
121054,Daniel,Pulliam,M,29805,Sales Rep. III,US,-415,7610
121055,Clement,Davis,M,30185,Sales Rep. III,US,11695,18475
121056,Stacey,Lyszyk,F,28325,Sales Rep. II,US,10413,17287
121057,Tachaun,Voron,M,25125,Sales Rep. I,US,1455,9101
121058,Del,Kohake,M,26270,Sales Rep. I,US,6767,17075
121059,Jacqulin,Carhide,F,27425,Sales Rep. II,US,1393,9222
121060,Elizabeth,Spofford,F,28800,Sales Rep. III,US,-4224,6575
121061,Lauris,Hassam,M,29815,Sales Rep. III,US,-534,10409
121062,Debra,Armant,F,30305,Sales Rep. IV,US,10528,18475
121063,Regi,Kinol,M,35990,Sales Rep. II,US,8608,18110
121064,Asishana,Polky,M,25110,Sales Rep. I,US,2949,13027
121065,Corneille,Malta,F,28040,Sales Rep. III,US,10475,18353
121066,Ceresh,Norman,F,27250,Sales Rep. II,US,-4148,6575
121067,Jeanilla,Macnair,F,31865,Sales Rep. IV,US,10975,18322
121068,Salaheloin,Osuba,M,27550,Sales Rep. II,US,5084,13393
121069,Jason,Lapsley,M,26195,Sales Rep. II,US,4826,12692
121070,Agnieszka,Holthouse,F,29385,Sales Rep. III,US,10535,18294
121071,John,Hoppmann,M,28625,Sales Rep. III,US,1348,7914
121072,Christer,North,M,26105,Sales Rep. I,US,8410,17776
121073,Donald,Court,M,27100,Sales Rep. I,US,-2422,6575
121074,Eric,Michonski,M,26990,Sales Rep. I,US,1155,11962
121075,Kasha,Sugg,F,28395,Sales Rep. II,US,-4026,6575
121076,Micah,Cobb,M,26685,Sales Rep. II,US,3204,9862
121077,Bryce,Smotherly,M,28585,Sales Rep. III,US,10475,18536
121078,Lionel,Wende,M,27485,Sales Rep. I,US,-2436,8340
121079,Azmi,Mees,M,25770,Sales Rep. I,US,6728,15280
121080,Kumar,Chinnis,M,32235,Sales Rep. I,US,1119,11566
121081,Susie,Knudson,F,30235,Sales Rep. III,US,-2470,7396
121082,Richard,Debank,M,28510,Sales Rep. III,US,-2371,7944
121083,Tingmei,Sutton,F,27245,Sales Rep. I,US,1165,8460
121084,Tulsidas,Ould,M,22710,Sales Rep. I,US,3150,12784
121085,Rebecca,Huslage,M,32235,Sales Rep. IV,US,11273,18628
121086,John-Michael,Plybon,M,26820,Sales Rep. I,US,-4033,6575
121087,Virtina,O'Suilleabhain,F,28325,Sales Rep. II,US,6915,15765
121088,Momolu,Kernitzki,M,27240,Sales Rep. I,US,11849,18628
121089,Gregory,Sauder,M,28095,Sales Rep. II,US,-498,6756
121090,Betty,Klibbe,F,26600,Sales Rep. I,US,-561,8797
121091,Ernest,Kadiri,M,27325,Sales Rep. II,US,4798,12054
121092,Gynell,Pritt,F,25680,Sales Rep. I,US,6641,17014
121093,Carl,Vasconcellos,M,27410,Sales Rep. I,US,3121,13880
121094,Larry,Tate,M,26555,Sales Rep. I,US,-724,8279
121095,Sara,Kratzke,F,28010,Sales Rep. II,US,4852,12965
121096,Robert,Newstead,M,26335,Sales Rep. I,US,4886,14365
121097,Willeta,Chernega,F,26830,Sales Rep. II,US,6870,14518
121098,Hal,Heatwole,M,27475,Sales Rep. I,US,11769,18383
121099,Royall,Mrvichin,M,32725,Sales Rep. IV,US,8478,16192
121100,Tzue-Ing,Cormell,M,28135,Sales Rep. II,US,-2440,7396
121101,Burnetta,Buckner,F,25390,Sales Rep. I,US,11197,18567
121102,Rocheal,Flammia,F,27115,Sales Rep. I,US,8577,18414
121103,Brian,Farnsworth,M,27260,Sales Rep. I,US,11806,18506
121104,Leoma,Johnson,F,28315,Sales Rep. II,US,3238,11048
121105,Jessica,Savacool,F,29545,Sales Rep. III,US,8529,17167
121106,James,Hilburger,M,25880,Sales Rep. I,US,4781,14641
121107,Rose,Anger,F,31380,Sales Rep. IV,US,11071,18444
121108,Libby,Levi,F,25930,Sales Rep. I,US,11873,18567
121109,Harold,Boulus,M,26035,Sales Rep. I,US,5057,12539
121135,Tammy,Ruta,F,27010,Sales Rep. I,US,-573,6787
121136,Lesia,Galarneau,F,27460,Sales Rep. I,US,6770,17136
121137,Michael. R.,Boocks,M,27055,Sales Rep. I,US,11705,18353
121138,Hershell,Tolley,M,27265,Sales Rep. I,US,-2498,6575
121139,Diosdado,Mckee,F,27700,Sales Rep. II,US,1326,11504
121140,Saunders,Briggi,M,26335,Sales Rep. I,US,8423,16527
121143,Louis,Favaron,M,95090,Senior Sales Manager,US,5078,15157
121144,Renee,Capachietti,F,83505,Sales Manager,US,3101,13088
121145,Dennis,Lansberry,M,84260,Sales Manager,US,-2231,7396
;;;;
run;

data ORION.SHOES;
   attrib Product_Category length=$25 label='Product Category';
   attrib Product_Group length=$25 label='Product Group';
   attrib Product_Name length=$45 label='Product Name';
   attrib Supplier_Country length=$2 label='Supplier Country';
   attrib Supplier_ID length=8 label='Supplier ID' format=13.;

   infile datalines dsd;
   input
      Product_Category
      Product_Group
      Product_Name
      Supplier_Country
      Supplier_ID
   ;
datalines4;
Shoes,Shoes,Dubby Low Men's Street Shoes,SE,109
Shoes,Shoes,Lulu Men's Street Shoes,SE,109
Shoes,Shoes,Pro Fit Gel Ds Trainer Women's Running Shoes,US,1747
Shoes,Shoes,Pro Fit Gel Gt 2030 Women's Running Shoes,US,1747
Shoes,Shoes,Soft Alta Plus Women's Indoor Shoes,US,1747
Shoes,Shoes,Soft Astro Men's Running Shoes,US,1747
Shoes,Shoes,Twain Men's Exit Low 2000 Street Shoes,US,13198
Shoes,Shoes,Twain Stf6 Gtx M Men's Trekking Boot,US,13198
Shoes,Shoes,Twain Women's Exit Iii Mid Cd X-Hiking Shoes,US,13198
Shoes,Shoes,Twain Women's Expresso X-Hiking Shoes,US,13198
;;;;
run;

data ORION.SHOES_ECLIPSE;
   attrib Product_Category length=$25 label='Product Category';
   attrib Product_Group length=$25 label='Product Group';
   attrib Product_Name length=$45 label='Product Name';
   attrib Supplier_Country length=$2 label='Supplier Country';
   attrib Supplier_ID length=8 label='Supplier ID' format=13.;

   infile datalines dsd;
   input
      Product_Category
      Product_Group
      Product_Name
      Supplier_Country
      Supplier_ID
   ;
datalines4;
Shoes,Eclipse Shoes,Cnv Plus Men's Off Court Tennis,US,1303
Shoes,Eclipse Shoes,Atmosphere Imara Women's Running Shoes,US,1303
Shoes,Eclipse Shoes,Atmosphere Shatter Mid Shoes,US,1303
Shoes,Eclipse Shoes,Big Guy Men's Air Deschutz Viii Shoes,US,1303
Shoes,Eclipse Shoes,Big Guy Men's Air Terra Reach Shoes,US,1303
Shoes,Eclipse Shoes,Big Guy Men's Air Terra Sebec Shoes,US,1303
Shoes,Eclipse Shoes,Big Guy Men's International Triax Shoes,US,1303
Shoes,Eclipse Shoes,Big Guy Men's Multicourt Ii Shoes,US,1303
Shoes,Eclipse Shoes,Woman's Air Amend Mid,US,1303
Shoes,Eclipse Shoes,Woman's Air Converge Triax X,US,1303
Shoes,Eclipse Shoes,Woman's Air Imara,US,1303
Shoes,Eclipse Shoes,Woman's Air Rasp Suede,US,1303
Shoes,Eclipse Shoes,Woman's Air Zoom Drive,US,1303
Shoes,Eclipse Shoes,Woman's Air Zoom Sterling,US,1303
;;;;
run;

data ORION.SHOES_TRACKER;
   attrib Product_ID length=8 label='Product ID' format=13.;
   attrib Product_Category length=$25 label='Product Category';
   attrib Product_Group length=$25 label='Product Group';
   attrib Product_Name length=$45 label='Product Name';
   attrib Supplier_Country length=$2 label='Supplier Country';
   attrib Supplier_Name length=$30 label='Supplier Name';
   attrib Supplier_ID length=8 label='Supplier ID' format=13.;

   infile datalines dsd;
   input
      Product_ID
      Product_Category
      Product_Group
      Product_Name
      Supplier_Country
      Supplier_Name
      Supplier_ID
   ;
datalines4;
220200300002,Shoes,Tracker Shoes,Pytossage Bathing Sandal,us,3Top Sports,
220200300005,,Tracker Shoes,Liga Football Boot,US,3Top Sports,2963
220200300015,Shoes,Tracker Shoes,men's running shoes piedmont,US,3op Sports,2963
22020030007,Shoes,Tracker Shoes,Hilly Women's Crosstrainer Shoes,US,3Top Sports,2963
220200300082,Shoes,Tracker Shoes,Indoor Handbold Special Shoes,UT,3Top Sports,2963
220200300096,Shoes,Tracker Shoes,Mns.raptor Precision Sg Football,US,3Top Sports,2963
220200300116,Shoes,Tracker Shoes,South Peak Men's Running Shoes,US,3op Sports,2963
2202003001290,Shoes,Tracker Shoes,Torino Men's Leather Adventure Shoes,US,3Top Sports,2963
220200300154,Shoes,Tracker Shoes,Hardcore Junior/Women's Street Shoes Large,GB,3Top Sports,14682
220200300157,Shoes,Tracker Shoes,Hardcore Men's Street Shoes Large,gB,Greenline Sports Ltd,14682
;;;;
run;

data ORION.STAFF;
   attrib Employee_ID length=8 label='Employee ID' format=12.;
   attrib Start_Date length=8 label='Start Date' format=DATE9.;
   attrib End_Date length=8 label='End Date' format=DATE9.;
   attrib Job_Title length=$25 label='Employee Job Title';
   attrib Salary length=8 label='Employee Annual Salary' format=DOLLAR12.;
   attrib Gender length=$1 label='Employee Gender';
   attrib Birth_Date length=8 label='Employee Birth Date' format=DATE9.;
   attrib Emp_Hire_Date length=8 label='Employee Hire Date' format=DATE9. informat=DATE9.;
   attrib Emp_Term_Date length=8 label='Employee Termination Date' format=DATE9. informat=DATE9.;
   attrib Manager_ID length=8 label='Manager for Employee' format=12.;

   infile datalines dsd;
   input
      Employee_ID
      Start_Date
      End_Date
      Job_Title
      Salary
      Gender
      Birth_Date
      Emp_Hire_Date:BEST32.
      Emp_Term_Date:BEST32.
      Manager_ID
   ;
datalines4;
120101,17348,2938008,Director,163040,M,7535,17348,,120261
120102,12205,2938008,Sales Manager,108255,M,4971,12205,,120101
120103,6575,2938008,Sales Manager,87975,M,-2535,6575,,120101
120104,9132,2938008,Administration Manager,46230,F,-600,9132,,120101
120105,15826,2938008,Secretary I,27110,F,6929,15826,,120101
120106,6575,2938008,Office Assistant II,26960,M,-4026,6575,,120104
120107,6606,2938008,Office Assistant III,30475,F,-2536,6606,,120104
120108,18475,2938008,Warehouse Assistant II,27660,F,10280,18475,,120104
120109,18536,2938008,Warehouse Assistant I,26495,F,11306,18536,,120104
120110,8705,2938008,Warehouse Assistant III,28615,M,-2233,8705,,120104
120111,6879,2938008,Security Guard II,26895,M,-2353,6879,,120104
120112,12600,2938008,Security Guard I,26550,F,4796,12600,,120104
120113,6575,2938008,Security Guard II,26870,F,-4253,6575,,120104
120114,6575,2938008,Security Manager,31285,F,-4345,6575,,120104
120115,18110,2938008,Service Assistant I,26500,M,10355,18110,,120104
120116,8797,2938008,Service Assistant II,29250,M,1259,8797,,120104
120117,11048,2938008,Cabinet Maker III,31670,M,3176,11048,,120104
120118,10409,2938008,Cabinet Maker II,28090,M,1249,10409,,120104
120119,15341,2938008,Electrician IV,30255,M,5103,15341,,120104
120120,6575,2938008,Electrician II,27645,F,-4258,6575,,120104
120121,6575,2938008,Sales Rep. II,26600,F,-4169,6575,,120102
120122,8217,2938008,Sales Rep. II,27475,F,-523,8217,,120102
120123,10866,17928,Sales Rep. I,26190,F,3193,10866,17928,120102
120124,8460,2938008,Sales Rep. I,26480,M,1228,8460,,120102
120125,8460,17744,Sales Rep. IV,32040,M,-391,8460,17744,120102
120126,18475,2938008,Sales Rep. II,26780,M,11951,18475,,120102
120127,15645,2938008,Sales Rep. II,28100,F,8404,15645,,120102
120128,18567,2938008,Sales Rep. IV,30890,F,11152,18567,,120102
120129,10866,17256,Sales Rep. III,30070,M,3248,10866,17256,120102
120130,18383,2938008,Sales Rep. I,26955,M,10575,18383,,120102
120131,17167,2938008,Sales Rep. I,26910,M,8668,17167,,120102
120132,8309,2938008,Sales Rep. III,28525,F,-2462,8309,,120102
120133,18536,2938008,Sales Rep. II,27440,F,11069,18536,,120102
120134,6575,18443,Sales Rep. II,28015,M,-2400,6575,18443,120102
120135,15249,17652,Sales Rep. IV,32490,M,4774,15249,17652,120102
120136,17198,2938008,Sales Rep. I,26605,M,8659,17198,,120102
120137,18322,2938008,Sales Rep. III,29715,F,8471,18322,,120102
120138,18444,2938008,Sales Rep. I,25795,F,8592,18444,,120102
120139,18506,2938008,Sales Rep. II,26810,F,11187,18506,,120102
120140,18536,2938008,Sales Rep. I,26970,M,11903,18536,,120103
120141,18383,2938008,Sales Rep. II,27465,F,11759,18383,,120103
120142,18444,2938008,Sales Rep. III,29695,M,11122,18444,,120103
120143,9770,2938008,Sales Rep. II,26790,M,1232,9770,,120103
120144,18536,2938008,Sales Rep. III,30265,M,11023,18536,,120103
120145,10744,2938008,Sales Rep. II,26060,M,2943,10744,,120103
120146,8979,18170,Sales Rep. I,25985,M,1370,8979,18170,120103
120147,18536,2938008,Sales Rep. II,26580,F,11706,18536,,120103
120148,8187,2938008,Sales Rep. III,28480,M,-2301,8187,,120103
120149,13515,2938008,Sales Rep. I,26390,F,6899,13515,,120103
120150,9709,17652,Sales Rep. III,29965,M,-541,9709,17652,120103
120151,6575,2938008,Sales Rep. II,26520,F,-4058,6575,,120103
120152,17988,2938008,Sales Rep. I,26515,M,8521,17988,,120102
120153,15341,18293,Sales Rep. I,27260,F,8527,15341,18293,120102
120154,6575,2938008,Sales Rep. III,30490,F,-4182,6575,,120102
120155,18353,2938008,Sales Rep. III,29990,F,10339,18353,,120102
120156,18322,2938008,Sales Rep. I,26445,F,11932,18322,,120102
120157,18597,2938008,Sales Rep. II,27860,M,11009,18597,,120102
120158,11504,18140,Sales Rep. III,36605,M,3117,11504,18140,120102
120159,11139,2938008,Sales Rep. IV,30765,F,2976,11139,,120102
120160,6848,2938008,Sales Rep. I,27115,M,-479,6848,,120102
120161,18536,2938008,Sales Rep. III,30785,F,11754,18536,,120102
120162,18294,2938008,Sales Rep. I,27215,M,11936,18294,,120102
120163,12784,2938008,Sales Rep. II,26735,M,3064,12784,,120102
120164,9528,2938008,Sales Rep. II,27450,F,1425,9528,,120102
120165,18322,2938008,Sales Rep. I,27050,M,10305,18322,,120102
120166,6575,18505,Sales Rep. IV,30660,M,-4218,6575,18505,120102
120167,6606,18352,Sales Rep. I,25185,F,-607,6606,18352,120102
120168,18567,2938008,Sales Rep. I,25275,F,10310,18567,,120102
120169,18383,2938008,Sales Rep. III,28135,M,10228,18383,,120102
120170,13423,18566,Sales Rep. III,28830,M,6630,13423,18566,120102
120171,18506,2938008,Sales Rep. II,26205,F,10427,18506,,120102
120172,6575,2938008,Sales Rep. III,28345,M,-4292,6575,,120102
120173,7822,17744,Sales Rep. I,26715,M,-677,7822,17744,120102
120174,6575,18200,Sales Rep. I,26850,F,-4374,6575,18200,120102
120175,18536,2938008,Sales Rep. I,25745,M,11918,18536,,120102
120176,18567,2938008,Sales Rep. I,26095,M,11270,18567,,120102
120177,15372,2938008,Sales Rep. III,28745,F,8495,15372,,120102
120178,6665,2938008,Sales Rep. II,26165,M,-404,6665,,120102
120179,17532,17775,Sales Rep. III,28510,M,6648,17532,17775,120102
120180,8370,2938008,Sales Rep. II,26970,M,-553,8370,,120102
120181,18597,18717,Temp. Sales Rep.,27065,F,12020,18597,18717,120103
120182,18597,18627,Temp. Sales Rep.,25020,M,10505,18597,18627,120103
120183,18597,18627,Temp. Sales Rep.,26910,M,5001,18597,18627,120103
120184,18597,18747,Temp. Sales Rep.,25820,M,-2222,18597,18747,120103
120185,18597,18658,Temp. Sales Rep.,25080,F,6671,18597,18658,120103
120186,18597,18808,Temp. Sales Rep.,26795,F,8509,18597,18808,120103
120187,18597,18778,Temp. Sales Rep.,26665,F,10571,18597,18778,120103
120188,18597,18627,Temp. Sales Rep.,26715,F,-671,18597,18627,120103
120189,18597,18717,Temp. Sales Rep.,25180,M,10411,18597,18717,120103
120190,17837,18017,Trainee,24100,M,10566,17837,18017,120103
120191,17167,17347,Trainee,24015,F,1112,17167,17347,120103
120192,18049,18231,Trainee,26185,M,10355,18049,18231,120103
120193,18141,18321,Trainee,24515,M,10567,18141,18321,120103
120194,17929,18109,Trainee,25985,M,10493,17929,18109,120103
120195,18444,18627,Trainee,24990,F,10586,18444,18627,120103
120196,17167,17347,Trainee,24025,F,10257,17167,17347,120103
120197,17167,17347,Trainee,25580,F,-511,17167,17347,120103
120198,18597,2938008,Sales Rep. III,28025,F,11708,18597,,120103
120259,12297,2938008,Chief Executive Officer,433800,M,2946,12297,,
120260,10532,2938008,Chief Marketing Officer,207885,F,3258,10532,,120259
120261,11535,2938008,Chief Sales Officer,243190,M,4800,11535,,120259
120262,11932,2938008,Chief Financial Officer,268455,M,5042,11932,,120259
120263,10135,17531,Financial Analyst III,42605,M,2962,10135,17531,120262
120264,18597,2938008,Financial Analyst II,37510,F,10249,18597,,120262
120265,6575,17166,Auditor III,51950,F,-4106,6575,17166,120262
120266,12144,2938008,Secretary IV,31750,F,4930,12144,,120259
120267,17198,2938008,Secretary III,28585,F,11110,17198,,120259
120268,15096,2938008,Senior Strategist,76105,M,6818,15096,,120260
120269,6575,17652,Strategist II,52540,F,-4113,6575,17652,120260
120270,6575,2938008,Concession Director,48435,M,-647,6575,,120261
120271,11201,2938008,Concession Manager,43635,F,3140,11201,,120270
120272,6575,2938008,Concession Consultant II,34390,M,-4309,6575,,120271
120273,18322,2938008,Concession Assistant III,28455,F,11115,18322,,120271
120274,13849,2938008,Concession Assistant I,26840,F,2930,13849,,120271
120275,10501,2938008,Concession Consultant II,32195,F,1456,10501,,120271
120276,6575,17317,Concession Assistant II,28090,M,-4033,6575,17317,120271
120277,17653,18048,Concession Consultant I,32645,F,11916,17653,18048,120271
120278,18475,2938008,Concession Assistant III,27685,M,11308,18475,,120271
120279,14731,2938008,Concession Consultant I,32925,F,5041,14731,,120271
120280,11809,16982,Concession Consultant III,36930,F,3237,11809,16982,120271
120656,15765,2938008,Logistics Coordinator II,42570,F,6602,15765,,120660
120657,12723,2938008,Logistics Coordinator I,36110,F,2928,12723,,120660
120658,9163,2938008,Logistics Coordinator II,42485,M,-377,9163,,120660
120659,6575,2938008,Director,161290,M,-2360,6575,,120259
120660,17957,2938008,Logistics Manager,61125,M,8192,17957,,120659
120661,10227,17347,Senior Logistics Manager,85495,F,-400,10227,17347,120659
120662,18567,2938008,Secretary II,27045,M,11864,18567,,120659
120663,15035,2938008,Pricing Manager,56385,F,4833,15035,,120659
120664,7060,2938008,Pricing Specialist,47605,M,-682,7060,,120663
120665,16861,2938008,Senior Logistics Manager,80070,F,6871,16861,,120659
120666,13118,17652,Logistics Manager,64555,M,4921,13118,17652,120659
120667,18294,2938008,Office Assistant III,29980,M,8572,18294,,120666
120668,8370,2938008,Services Manager,47785,M,-2261,8370,,120659
120669,6575,2938008,Services Assistant IV,36370,M,-4179,6575,,120668
120670,6575,17166,Shipping Manager,65420,M,-4298,6575,17166,120659
120671,9893,2938008,Shipping Agent III,40080,M,-584,9893,,120670
120672,13209,2938008,Shipping Manager,60980,M,3159,13209,,120659
120673,6575,2938008,Shipping Agent II,35935,F,-4205,6575,,120672
120677,13546,2938008,Shipping Manager,65555,F,4993,13546,,120659
120678,8156,17409,Shipping Agent III,40035,F,-2545,8156,17409,120677
120679,16983,2938008,Shipping Manager,46190,F,7616,16983,,120659
120680,12904,2938008,Shipping Agent I,27295,F,4985,12904,,120679
120681,17623,2938008,Shipping Agent II,30950,M,8624,17623,,120679
120682,14701,2938008,Shipping Agent I,26760,F,5102,14701,,120679
120683,6575,17225,Shipping Agent III,36315,F,-415,6575,17225,120679
120684,18567,2938008,Warehouse Assistant I,26960,F,11287,18567,,120679
120685,18567,2938008,Warehouse Assistant I,25130,F,10287,18567,,120679
120686,6575,2938008,Warehouse Assistant II,26690,F,-4256,6575,,120679
120687,17745,17928,Warehouse Assistant I,26800,F,8545,17745,17928,120679
120688,6575,17044,Warehouse Assistant I,25905,F,-2198,6575,17044,120679
120689,18444,2938008,Warehouse Assistant III,27780,F,8601,18444,,120679
120690,17867,2938008,Warehouse Assistant I,25185,F,10243,17867,,120679
120691,6575,2938008,Shipping Manager,49240,M,-4125,6575,,120659
120692,9587,2938008,Shipping Agent II,32485,M,-405,9587,,120691
120693,8552,2938008,Shipping Agent I,26625,M,1217,8552,,120691
120694,18353,2938008,Warehouse Assistant I,27365,F,11916,18353,,120691
120695,12235,18474,Warehouse Assistant II,28180,M,3116,12235,18474,120691
120696,6634,18352,Warehouse Assistant I,26615,M,-505,6634,18352,120691
120697,18414,2938008,Warehouse Assistant IV,29625,F,11866,18414,,120691
120698,7518,17956,Warehouse Assistant I,26160,M,-594,7518,17956,120691
120710,15341,2938008,Business Analyst II,54840,M,6902,15341,,120719
120711,13939,2938008,Business Analyst III,59130,F,4896,13939,,120719
120712,6575,2938008,Marketing Manager,63640,F,-2394,6575,,120719
120713,6575,2938008,Marketing Assistant III,31630,M,-4330,6575,,120712
120714,15584,2938008,Marketing Manager,62625,M,7399,15584,,120719
120715,17929,2938008,Marketing Assistant II,28535,F,8563,17929,,120714
120716,13727,2938008,Events Manager,53015,M,6779,13727,,120719
120717,9344,2938008,Marketing Assistant II,30155,M,-722,9344,,120716
120718,12539,2938008,Marketing Assistant II,29190,M,3111,12539,,120716
120719,14641,2938008,Senior Marketing Manager,87420,F,4770,14641,,120260
120720,13240,2938008,Corp. Comm. Manager,46580,M,3049,13240,,120719
120721,6575,2938008,Marketing Assistant II,29870,F,-4089,6575,,120720
120722,10866,2938008,Corp. Comm. Specialist I,32460,M,1360,10866,,120720
120723,6575,2938008,Corp. Comm. Specialist II,33950,F,-2335,6575,,120720
120724,13240,2938008,Marketing Manager,63705,M,2948,13240,,120719
120725,17684,17897,Marketing Assistant II,29970,M,8697,17684,17897,120724
120726,18506,2938008,Marketing Assistant I,27380,F,11870,18506,,120724
120727,11109,2938008,Marketing Assistant IV,34925,M,3098,11109,,120724
120728,9497,2938008,Purchasing Agent II,35070,F,-393,9497,,120735
120729,17281,18163,Purchasing Agent I,31495,F,11781,17281,18163,120735
120730,11962,2938008,Purchasing Agent I,30195,M,3272,11962,,120735
120731,10105,2938008,Purchasing Agent II,34150,M,1169,10105,,120735
120732,6575,2938008,Purchasing Agent III,35870,M,-2331,6575,,120736
120733,12723,2938008,Purchasing Agent I,31760,M,3015,12723,,120736
120734,18322,2938008,Purchasing Agent III,34270,M,8516,18322,,120736
120735,8156,2938008,Purchasing Manager,61985,F,-567,8156,,120261
120736,13057,2938008,Purchasing Manager,63985,F,3253,13057,,120261
120737,11993,2938008,Purchasing Manager,63605,F,1182,11993,,120261
120738,6575,2938008,Purchasing Agent I,30025,F,-2370,6575,,120737
120739,18383,2938008,Purchasing Agent III,36970,M,11176,18383,,120737
120740,6575,17409,Purchasing Agent II,35110,F,-2265,6575,17409,120737
120741,6575,2938008,Purchasing Agent III,36365,F,-4051,6575,,120737
120742,6575,2938008,Purchasing Agent I,31020,M,-4349,6575,,120737
120743,15127,2938008,Purchasing Agent II,34620,F,4780,15127,,120737
120744,17714,18200,Purchasing Agent II,33490,F,11858,17714,18200,120737
120745,18414,2938008,Purchasing Agent I,31365,F,11143,18414,,120737
120746,16892,2938008,Account Manager,46090,M,6857,16892,,120262
120747,14457,2938008,Financial Controller I,43590,F,6745,14457,,120746
120748,17226,2938008,Building Admin. Manager,48380,F,7491,17226,,120262
120749,14884,2938008,Office Assistant II,26545,M,6837,14884,,120748
120750,8432,16832,Accountant I,32675,F,-573,8432,16832,120751
120751,11901,2938008,Finance Manager,58200,M,3017,11901,,120262
120752,7152,17286,Accountant I,30590,M,-683,7152,17286,120751
120753,14092,2938008,Financial Controller II,47000,M,7471,14092,,120751
120754,18383,2938008,Accountant II,34760,M,11841,18383,,120751
120755,10074,2938008,Accountant III,36440,F,3158,10074,,120751
120756,14792,2938008,Financial Controller III,52295,F,6625,14792,,120751
120757,6575,17713,Accountant III,38545,M,-4306,6575,17713,120751
120758,13423,2938008,Accountant II,34040,M,3217,13423,,120751
120759,9862,2938008,Accountant II,36230,M,3230,9862,,120746
120760,13635,2938008,Financial Controller III,53475,F,4754,13635,,120746
120761,18444,2938008,Accountant I,30960,F,11319,18444,,120746
120762,18322,2938008,Accountant I,30625,M,8706,18322,,120746
120763,6575,2938008,Auditor II,45100,M,-4084,6575,,120766
120764,17136,2938008,Auditor I,40450,M,6930,17136,,120766
120765,6575,2938008,Financial Controller III,51950,F,-380,6575,,120766
120766,16496,2938008,Auditing Manager,53400,F,6883,16496,,120262
120767,11413,2938008,Accountant I,32965,M,3051,11413,,120766
120768,9405,17500,Accountant II,44955,M,-528,9405,17500,120766
120769,14701,2938008,Auditor II,47990,M,6718,14701,,120766
120770,11413,17286,Auditor I,43930,F,3036,11413,17286,120766
120771,7640,2938008,Accountant II,36435,F,-515,7640,,120766
120772,18475,2938008,HR Generalist I,27365,M,11786,18475,,120780
120773,9222,2938008,HR Generalist II,27370,F,1148,9222,,120780
120774,16861,18201,HR Specialist II,45155,F,8295,16861,18201,120780
120775,14915,2938008,HR Analyst II,41580,F,4790,14915,,120780
120776,16527,2938008,HR Generalist III,32580,M,8664,16527,,120780
120777,14000,2938008,HR Specialist I,40955,M,4833,14000,,120780
120778,10258,2938008,HR Specialist I,43650,F,-389,10258,,120780
120779,15035,2938008,HR Analyst II,43690,F,7582,15035,,120780
120780,13057,2938008,HR Manager,62995,F,4992,13057,,120262
120781,17867,18262,Recruiter I,32620,F,11710,17867,18262,120782
120782,15857,2938008,Recruitment Manager,63915,F,6907,15857,,120262
120783,14610,2938008,Recruiter III,42975,M,6928,14610,,120782
120784,17776,2938008,Recruiter II,35715,F,8514,17776,,120782
120785,13666,2938008,Training Manager,48335,F,4769,13666,,120780
120786,6575,2938008,Trainer I,32650,F,-4306,6575,,120785
120787,14610,2938008,Trainer II,34000,M,4982,14610,,120785
120788,14214,2938008,Trainer I,33530,M,4912,14214,,120785
120789,9831,17317,Trainer III,39330,M,3117,9831,17317,120785
120790,14365,2938008,ETL Specialist II,53740,F,6915,14365,,120791
120791,11231,2938008,Systems Architect IV,61115,M,3129,11231,,120798
120792,15188,2938008,Systems Architect II,54760,F,7383,15188,,120791
120793,14762,2938008,ETL Specialist I,47155,M,4968,14762,,120791
120794,17348,2938008,Applications Developer IV,51265,F,8400,17348,,120800
120795,11901,17197,Applications Developer II,49105,M,4764,11901,17197,120794
120796,9921,2938008,Applications Developer II,47030,M,-599,9921,,120794
120797,8005,2938008,Applications Developer I,43385,F,-410,8005,,120794
120798,11323,2938008,Senior Project Manager,80755,F,1269,11323,,120800
120799,15645,2938008,Office Assistant III,29070,M,8482,15645,,120800
120800,15127,17197,IS Director,80210,M,6928,15127,17197,120262
120801,15887,2938008,Applications Developer I,40040,F,6639,15887,,120798
120802,8036,17713,Applications Developer IV,65125,F,-2426,8036,17713,120798
120803,8036,2938008,Applications Developer I,43630,M,-574,8036,,120798
120804,6575,2938008,IS Administrator III,55400,M,-4342,6575,,120798
120805,16162,2938008,BI Administrator IV,58530,M,8213,16162,,120798
120806,13180,2938008,IS Administrator II,47285,F,6630,13180,,120798
120807,9497,17775,IS Administrator I,43325,F,1443,9497,17775,120798
120808,10379,2938008,BI Specialist II,44425,M,3074,10379,,120798
120809,6575,2938008,BI Architect II,47155,F,-4370,6575,,120798
120810,8826,2938008,IS Architect III,58375,M,-454,8826,,120798
120811,13696,2938008,Applications Developer I,43985,M,5017,13696,,120814
120812,16649,2938008,Applications Developer II,45810,M,6624,16649,,120814
120813,13515,17531,Applications Developer IV,50865,M,5005,13515,17531,120814
120814,8644,2938008,Project Manager,59140,M,1249,8644,,120800
120815,18353,2938008,Service Administrator III,31590,M,12049,18353,,120719
120816,13727,2938008,Service Administrator I,30485,F,4871,13727,,120719
120992,16284,2938008,Office Assistant I,26940,F,8448,16284,,120996
120993,15035,2938008,Office Assistant I,26260,F,5100,15035,,120996
120994,14184,2938008,Office Administrator I,31645,F,6741,14184,,120996
120995,18475,2938008,Office Administrator II,34850,F,10391,18475,,120996
120996,17045,2938008,Office Assistant IV,32745,M,6776,17045,,121000
120997,14854,2938008,Shipping Administrator I,27420,F,6899,14854,,121000
120998,17988,2938008,Clerk I,26330,F,8740,17988,,120997
120999,10318,2938008,Clerk I,27215,F,1457,10318,,120997
121000,13849,2938008,Administration Manager,48600,M,2946,13849,,121141
121001,7914,2938008,Warehouse Manager,43615,M,1116,7914,,121000
121002,8735,17775,Warehouse Assistant II,26650,F,-470,8735,17775,121001
121003,18444,2938008,Warehouse Assistant I,26000,M,11813,18444,,121001
121004,6575,2938008,Security Manager,30895,M,-4168,6575,,121000
121005,17563,2938008,Security Guard I,25020,M,10423,17563,,121004
121006,17837,18201,Security Guard I,26145,M,11242,17837,18201,121004
121007,11354,2938008,Security Guard II,27290,M,3207,11354,,121004
121008,13727,2938008,Security Guard II,27875,M,4932,13727,,121004
121009,15918,2938008,Service Administrator I,32955,M,8738,15918,,121000
121010,18322,2938008,Service Assistant I,25195,M,10453,18322,,121009
121011,6575,2938008,Service Assistant I,25735,M,-4313,6575,,121009
121012,17410,17866,Service Assistant II,29575,M,10983,17410,17866,121009
121013,16162,2938008,Electrician II,26675,M,8518,16162,,121016
121014,15918,2938008,Electrician III,28510,F,6695,15918,,121016
121015,16315,2938008,Technician I,26140,M,8747,16315,,121016
121016,17776,2938008,Technical Manager,48075,F,7323,17776,,121000
121017,17957,2938008,Technician II,29225,M,10232,17957,,121016
121018,6575,17286,Sales Rep. II,27560,F,-4381,6575,17286,121144
121019,17684,18109,Sales Rep. IV,31320,M,11133,17684,18109,121144
121020,16922,2938008,Sales Rep. IV,31750,F,10280,16922,,121144
121021,13939,2938008,Sales Rep. IV,32985,F,6918,13939,,121144
121022,16833,17775,Sales Rep. IV,32210,M,8701,16833,17775,121144
121023,12174,18140,Sales Rep. I,26010,M,2994,12174,18140,121144
121024,17653,2938008,Sales Rep. II,26600,M,10491,17653,,121144
121025,7183,2938008,Sales Rep. II,28295,M,-2274,7183,,121144
121026,18353,2938008,Sales Rep. IV,31515,M,11269,18353,,121144
121027,12388,2938008,Sales Rep. II,26165,M,3047,12388,,121144
121028,18567,2938008,Sales Rep. I,26585,M,11805,18567,,121144
121029,12388,2938008,Sales Rep. I,27225,M,3278,12388,,121144
121030,16468,2938008,Sales Rep. I,26745,M,8716,16468,,121144
121031,10805,2938008,Sales Rep. III,28060,M,3112,10805,,121144
121032,18322,2938008,Sales Rep. IV,31335,M,11742,18322,,121144
121033,17684,2938008,Sales Rep. III,29775,F,11267,17684,,121144
121034,18628,2938008,Sales Rep. II,27110,M,11923,18628,,121144
121035,6575,2938008,Sales Rep. II,26460,M,-4299,6575,,121144
121036,17440,18201,Sales Rep. I,25965,F,11887,17440,18201,121144
121037,16861,2938008,Sales Rep. III,28310,M,6737,16861,,121144
121038,18475,18659,Sales Rep. I,25285,M,11731,18475,18659,121144
121039,8887,2938008,Sales Rep. II,27460,M,-577,8887,,121144
121040,9801,2938008,Sales Rep. III,29525,F,1282,9801,,121144
121041,6575,2938008,Sales Rep. II,26120,F,-4349,6575,,121144
121042,16010,2938008,Sales Rep. III,28845,M,8494,16010,,121144
121043,13209,2938008,Sales Rep. II,28225,F,5061,13209,,121144
121044,7152,2938008,Sales Rep. I,25660,M,-386,7152,,121144
121045,13880,17591,Sales Rep. II,28560,F,3086,13880,17591,121143
121046,18444,18628,Sales Rep. I,25845,M,10477,18444,18628,121143
121047,18506,18687,Sales Rep. I,25820,F,8730,18506,18687,121143
121048,18506,18687,Sales Rep. I,26560,F,10402,18506,18687,121143
121049,18597,2938008,Sales Rep. I,26930,F,11002,18597,,121143
121050,18597,2938008,Sales Rep. II,26080,F,10969,18597,,121143
121051,8340,2938008,Sales Rep. I,26025,F,-2435,8340,,121143
121052,18567,2938008,Sales Rep. II,26900,M,10966,18567,,121143
121053,6606,2938008,Sales Rep. III,29955,F,-4117,6606,,121143
121054,7610,2938008,Sales Rep. III,29805,M,-415,7610,,121143
121055,18475,2938008,Sales Rep. III,30185,M,11695,18475,,121143
121056,17287,2938008,Sales Rep. II,28325,F,10413,17287,,121143
121057,9101,2938008,Sales Rep. I,25125,M,1455,9101,,121143
121058,17075,2938008,Sales Rep. I,26270,M,6767,17075,,121143
121059,9222,17531,Sales Rep. II,27425,F,1393,9222,17531,121143
121060,6575,2938008,Sales Rep. III,28800,F,-4224,6575,,121143
121061,10409,2938008,Sales Rep. III,29815,M,-534,10409,,121143
121062,18475,2938008,Sales Rep. IV,30305,F,10528,18475,,121145
121063,18110,2938008,Sales Rep. II,35990,M,8608,18110,,121145
121064,13027,2938008,Sales Rep. I,25110,M,2949,13027,,121145
121065,18353,2938008,Sales Rep. III,28040,F,10475,18353,,121145
121066,6575,18201,Sales Rep. II,27250,F,-4148,6575,18201,121145
121067,18322,18506,Sales Rep. IV,31865,F,10975,18322,18506,121145
121068,13393,2938008,Sales Rep. II,27550,M,5084,13393,,121145
121069,12692,2938008,Sales Rep. II,26195,M,4826,12692,,121145
121070,18294,2938008,Sales Rep. III,29385,F,10535,18294,,121145
121071,7914,2938008,Sales Rep. III,28625,M,1348,7914,,121145
121072,17776,18201,Sales Rep. I,26105,M,8410,17776,18201,121145
121073,6575,2938008,Sales Rep. I,27100,M,-2422,6575,,121145
121074,11962,2938008,Sales Rep. I,26990,M,1155,11962,,121145
121075,6575,2938008,Sales Rep. II,28395,F,-4026,6575,,121145
121076,9862,17683,Sales Rep. II,26685,M,3204,9862,17683,121143
121077,18536,2938008,Sales Rep. III,28585,M,10475,18536,,121143
121078,8340,2938008,Sales Rep. I,27485,M,-2436,8340,,121143
121079,15280,2938008,Sales Rep. I,25770,M,6728,15280,,121143
121080,11566,2938008,Sales Rep. I,32235,M,1119,11566,,121143
121081,7396,2938008,Sales Rep. III,30235,F,-2470,7396,,121143
121082,7944,2938008,Sales Rep. III,28510,M,-2371,7944,,121143
121083,8460,2938008,Sales Rep. I,27245,F,1165,8460,,121143
121084,12784,2938008,Sales Rep. I,22710,M,3150,12784,,121143
121085,18628,2938008,Sales Rep. IV,32235,M,11273,18628,,121143
121086,6575,2938008,Sales Rep. I,26820,M,-4033,6575,,121143
121087,15765,18352,Sales Rep. II,28325,F,6915,15765,18352,121143
121088,18628,2938008,Sales Rep. I,27240,M,11849,18628,,121143
121089,6756,18566,Sales Rep. II,28095,M,-498,6756,18566,121143
121090,8797,2938008,Sales Rep. I,26600,F,-561,8797,,121143
121091,12054,2938008,Sales Rep. II,27325,M,4798,12054,,121143
121092,17014,2938008,Sales Rep. I,25680,F,6641,17014,,121143
121093,13880,17347,Sales Rep. I,27410,M,3121,13880,17347,121143
121094,8279,2938008,Sales Rep. I,26555,M,-724,8279,,121143
121095,12965,2938008,Sales Rep. II,28010,F,4852,12965,,121143
121096,14365,2938008,Sales Rep. I,26335,M,4886,14365,,121143
121097,14518,2938008,Sales Rep. II,26830,F,6870,14518,,121143
121098,18383,2938008,Sales Rep. I,27475,M,11769,18383,,121143
121099,16192,2938008,Sales Rep. IV,32725,M,8478,16192,,121143
121100,7396,2938008,Sales Rep. II,28135,M,-2440,7396,,121143
121101,18567,2938008,Sales Rep. I,25390,F,11197,18567,,121143
121102,18414,2938008,Sales Rep. I,27115,F,8577,18414,,121143
121103,18506,2938008,Sales Rep. I,27260,M,11806,18506,,121143
121104,11048,16832,Sales Rep. II,28315,F,3238,11048,16832,121143
121105,17167,2938008,Sales Rep. III,29545,F,8529,17167,,121143
121106,14641,2938008,Sales Rep. I,25880,M,4781,14641,,121143
121107,18444,2938008,Sales Rep. IV,31380,F,11071,18444,,121143
121108,18567,18748,Sales Rep. I,25930,F,11873,18567,18748,121143
121109,12539,2938008,Sales Rep. I,26035,M,5057,12539,,121143
121110,18597,18627,Temp. Sales Rep.,26370,M,-4279,18597,18627,121145
121111,18597,18747,Temp. Sales Rep.,26885,M,-4185,18597,18747,121145
121112,18597,18627,Temp. Sales Rep.,26855,M,11304,18597,18627,121145
121113,18597,18658,Temp. Sales Rep.,27480,F,-679,18597,18658,121145
121114,18597,18808,Temp. Sales Rep.,26515,F,-4075,18597,18808,121145
121115,18597,18747,Temp. Sales Rep.,26430,M,1139,18597,18747,121145
121116,18597,18717,Temp. Sales Rep.,26670,F,3188,18597,18717,121145
121117,18597,18627,Temp. Sales Rep.,26640,F,6651,18597,18627,121145
121118,18597,18778,Temp. Sales Rep.,25725,M,8460,18597,18778,121145
121119,18597,18686,Temp. Sales Rep.,25205,M,3229,18597,18686,121145
121120,18597,18686,Temp. Sales Rep.,25020,F,6872,18597,18686,121145
121121,18597,18778,Temp. Sales Rep.,25735,F,11021,18597,18778,121145
121122,18597,18717,Temp. Sales Rep.,26265,M,11017,18597,18717,121145
121123,18597,18717,Temp. Sales Rep.,26410,M,-4266,18597,18717,121145
121124,18597,18627,Temp. Sales Rep.,26925,M,4794,18597,18627,121145
121125,17167,17347,Trainee,25315,M,6681,17167,17347,121145
121126,17167,17347,Trainee,26015,M,-432,17167,17347,121145
121127,18049,18231,Trainee,25435,F,11203,18049,18231,121145
121128,17167,17347,Trainee,25405,F,6751,17167,17347,121145
121129,17167,17347,Trainee,30945,M,3043,17167,17347,121145
121130,17563,17744,Trainee,25255,M,10247,17563,17744,121145
121131,17167,17347,Trainee,25445,M,4929,17167,17347,121145
121132,17167,17347,Trainee,24390,M,-692,17167,17347,121145
121133,17167,17347,Trainee,25405,M,8714,17167,17347,121145
121134,17167,17347,Trainee,25585,M,3105,17167,17347,121145
121135,6787,2938008,Sales Rep. I,27010,F,-573,6787,,121145
121136,17136,17805,Sales Rep. I,27460,F,6770,17136,17805,121145
121137,18353,2938008,Sales Rep. I,27055,M,11705,18353,,121145
121138,6575,2938008,Sales Rep. I,27265,M,-2498,6575,,121145
121139,11504,2938008,Sales Rep. II,27700,F,1326,11504,,121145
121140,16527,18293,Sales Rep. I,26335,M,8423,16527,18293,121145
121141,6575,2938008,Vice President,194885,M,-4213,6575,,120261
121142,13635,2938008,Director,156065,M,4793,13635,,121141
121143,15157,2938008,Senior Sales Manager,95090,M,5078,15157,,121142
121144,13088,2938008,Sales Manager,83505,F,3101,13088,,121142
121145,7396,2938008,Sales Manager,84260,M,-2231,7396,,121142
121146,18353,2938008,Secretary III,29320,F,11300,18353,,121141
121147,11566,2938008,Secretary II,29145,F,4896,11566,,121142
121148,15341,17197,Business Analyst II,52930,M,4749,15341,17197,121141
;;;;
run;

data ORION.SUPPLIER;
   attrib Supplier_ID length=8 label='Supplier ID' format=12.;
   attrib Supplier_Name length=$30 label='Supplier Name';
   attrib Street_ID length=8 label='Street ID' format=12.;
   attrib Supplier_Address length=$45 label='Supplier Address';
   attrib Sup_Street_Number length=$8 label='Supplier Street Number';
   attrib Country length=$2 label='Country';

   infile datalines dsd;
   input
      Supplier_ID
      Supplier_Name
      Street_ID
      Supplier_Address
      Sup_Street_Number
      Country
   ;
datalines4;
50,Scandinavian Clothing A/S,6850100389,Kr. Augusts Gate 13,13,NO
109,Petterson AB,8500100286,Blasieholmstorg 1,1,SE
316,Prime Sports Ltd,9250103252,9 Carlisle Place,9,GB
755,Top Sports,3150108266,Jernbanegade 45,45,DK
772,AllSeasons Outdoor Clothing,9260115819,553 Cliffview Dr,553,US
798,Sportico,8300100454,C. Barquillo 1,1,ES
1280,British Sports Ltd,9250100844,85 Station Street,85,GB
1303,Eclipse Inc,9260107621,1218 Carriole Ct,1218,US
1684,Magnifico Sports,7350100062,Rua Costa Pinto 2,2,PT
1747,Pro Sportswear Inc,9260109782,2434 Edgebrook Dr,2434,US
2963,3Top Sports,9260111024,5033 Charles B Root Wynd,5033,US
2995,Van Dammeren International,6300100165,Transistorstraat 6,6,NL
3298,A Team Sports,9260125378,2687 Julie Ann Ct,2687,US
3664,Triple Sportswear Inc,9260104020,116 Irelan Dr,116,US
3808,Carolina Sports,9260124917,3860 Grand Ave,3860,US
3815,Roll-Over Inc,9260119457,150 Crestscene Trl,150,US
4168,Rubby Zapatos S.A.,8300100111,C. Casanova 1,1,ES
4514,Royal Darts Ltd,9250103387,347 City Road,347,GB
4646,Mayday Inc,9260106363,127 Bridgeford Dr,127,US
4718,KN Outdoor Trading Inc,9260100032,115 Davishire Dr,115,US
4742,Luna sastreria S.A.,8300100392,Av. De Burgos 12,12,ES
4793,Norsok A/S,3150105540,Jens Engbergs Alle 91,91,DK
5503,Ultra Sporting Goods Inc,9260115962,2214 Grand Pointe Dr,2214,US
5810,Teamsports Inc,9260105801,42 Farmlea Cir,42,US
5922,Force Sports,1900111322,Dr Vandeperreln 139,139,BE
6071,SportsFan Products Ltd,9250102901,50 Baker Street,50,GB
6153,Nautlius SportsWear Inc,9260112561,56 Bagwell Ave,56,US
6355,Svensson Trading AB,8500100026,Uddn�sv�gen 29,29,SE
7511,Mike Schaeffer Inc,9260113554,588 Battle Bridge Rd,588,US
10225,HighPoint Trading,9260116271,1731 Glenwood Ave,1731,US
10692,Toto Outdoor Gear,1600102926,44 Norway St Kelburn,44,AU
11427,Typhoon Clothing,1600102664,120 Station Street,120,AU
12283,EA Sports Limited,9250103700,6 Fenchurch Place,6,GB
12869,Truls Sporting Goods,6850100249,Akersgt. 1,1,NO
13079,Le Blanc S.A.,3500100333,Impasse de la Barriere 1,1,FR
13198,Twain Inc,9260128470,1648 Bloodworth St,1648,US
13199,Massif S.A.,3500100143,Bld de la Republique 2,2,FR
13314,Triffy B.V.,6300100301,Hogehilweg 16,16,NL
13710,SD Sporting Goods Inc,9260108085,5789 Hayden Ct,5789,US
14593,Fga Sports Inc,9260115242,41 Calvary Dr,41,US
14624,Ypsilon S.A.,3500100058,Av Aristide Briand 19,19,FR
14648,Top Sports Inc,9260112666,7 Cathedral Way,7,US
14682,Greenline Sports Ltd,9250101069,55 Boughton,55,GB
15218,Miller Trading Inc,9260122051,1460 Grande Meadow Way,1460,US
15938,TeeTime Ltd,9250106697,1 Bletchingley Road,1,GB
16292,Dolphin Sportswear Inc,9260102742,617 Chippendale Rd,617,US
16422,Outback Outfitters Ltd,9250103927,41 Grange Road,41,GB
16542,TrimSport B.V.,6300100742,Crabethpark 19,19,NL
16733,Fuller Trading Co.,2600100011,15 boul Wallberg,15,CA
16814,CrystalClear Optics Inc,2600100022,4697 rue Beaubien E,4697,CA
17832,GrandSlam Sporting Goods Ltd,9250101267,651 Mitcham Road,651,GB
18139,Green Lime Sports Inc,9260100299,1064 Lancashire Dr,1064,US
;;;;
run;

data ORION.US_SUPPLIERS;
   attrib Code length=$6;
   attrib Company length=$30;
   attrib ContactType length=$1;

   infile datalines dsd;
   input
      Code
      Company
      ContactType
   ;
datalines4;
ATS1,A TEAM SPORTS,1
CS1,CAROLINA SPORTS,1
DSI1,DOLPHIN SPORTSWEAR INC,1
ESL1,EA SPORTS LIMITED,1
HT1,HIGHPOINT TRADING,1
LBSA1,LE BLANC S.A.,1
MSI1,MIKE SCHAEFFER INC,1
NSI1,NAUTLIUS SPORTSWEAR INC,1
OOL1,OUTBACK OUTFITTERS LTD,1
ROI1,ROLL-OVER INC,1
STA1,SVENSSON TRADING AB,1
TSG1,TRULS SPORTING GOODS,1
TSI1,TRIPLE SPORTSWEAR INC,1
;;;;
run;


proc datasets lib=ORION nolist nowarn;
   modify COUNTRY ;
       ic create Primary Key (Country_ID );
   modify CUSTOMER_TYPE ;
       ic create Primary Key (Customer_Type_ID );
   modify ORGANIZATION_DIM ;
       ic create Primary Key (Employee_ID );
   modify PRODUCT_DIM ;
       ic create Primary Key (Product_ID );
   modify PRODUCT_LEVEL ;
       ic create Primary Key (Product_Level );
   modify PRODUCT_LIST ;
       ic create Primary Key (Product_ID );
   modify STAFF ;
       ic create Primary Key (Employee_ID Start_Date );
   modify SUPPLIER ;
       ic create Primary Key (Supplier_ID );
quit;

proc datasets lib=ORION nolist nowarn;
   modify COUNTRY ;
      index create Continent_ID ;
   modify PRODUCT_DIM ;
       index create Product_Category ;
      index create Product_Line ;
      index create Product_Group ;
   modify PRODUCT_LIST ;
      index create Product_Level ;
   modify STAFF ;
      index create Employee_ID ;
quit;

proc contents data=ORION._all_ nods;
run;


filename mydata "&rawdata";
data _null_;
infile datalines truncover length=length;
input;
file mydata(pricing.dat) lrecl=256;
put _infile_ $varying. length;
datalines4;
210200100009*09JUN2011*31DEC9999*$15.50*$34.70
210200100017*24JAN2011*31DEC9999*$17.80*22.80
210200200023*04JUL2011*31DEC9999*$8.25*$19.80
210200600067*27OCT2011*31DEC9999*$28.90*47.00
210200600085*28AUG2011*31DEC9999*$17.85*$39.40
210200600112*04JAN2011*31DEC9999*$9.25*$21.80
210200900033*17SEP2011*31DEC9999*$6.45*$14.20
210200900038*01FEB2011*31DEC9999*$9.30*$20.30
210201000050*02APR2011*31DEC9999*$9.00*$19.60
210201000126*22APR2011*31DEC9999*$2.30*$6.50
210201000198*07OCT2011*31DEC9999*$26.80*$60.10
210201100004*18APR2011*31DEC9999*$21.50*$49.20
220100100189*29JUL2011*31DEC9999*$47.45*$94.70
220100100192*13AUG2011*31DEC9999*$13.80*$27.40
220100100309*30MAY2011*31DEC9999*$48.25*$96.30
220100100354*08MAY2011*31DEC9999*$8.45*$10.50
;;;;
run;
data _null_;
infile datalines truncover length=length;
input;
file mydata(product.dat) lrecl=256;
put _infile_ $varying. length;
datalines4;
      63 220101300017       1   16.50
       5 230100500026       1  247.50
      45 240600100080       1   28.30
      41 240600100010       2   32.00
     183 240200200039       3   63.60
      79 240100400005       1  234.60
      23 240800200062       1   35.40
      23 240800200063       2   73.80
      45 240500100004       2  127.00
      45 240500200003       1   23.20
      56 220200300002       2   75.00
     183 230100600005       1  129.80
      16 230100600018       2  128.40
      79 240500200056       1   24.10
     183 240200100233       2   91.80
    2788 230100100025       2   60.60
      20 230100300006       1   68.50
   70046 240200100131       2  148.60
   12386 220101400310       1   31.80
      23 220200200024       3  178.50
      36 240500100039       1   34.50
      79 240200100076       4 1796.00
      61 220200100092       1   83.00
      61 220200300005       3  345.00
      13 230100500082       1  126.10
     171 240100100646       1  109.90
   11171 240200100043       2  282.40
   14703 220100100044       1  102.10
   14703 220100400005       1   81.30
      79 230100100006       1  176.00
      79 230100500045       2    2.60
      79 230100500068       2    3.40
     928 230100600026       2  237.20
   19444 220100700024       1   99.70
   19444 220101000002       1   17.70
      71 220200100179       1  134.50
      12 220100100272       3   68.40
      12 220101400269       4  268.00
     544 230100500012       3  221.70
     111 230100500096       1   35.50
      88 240400200097       3 1250.40
      23 240500200073       3  148.50
      71 230100500093       2  265.60
      23 240700400024       2  127.20
      75 240500100062       2  109.20
      75 240500200130       2   56.00
      56 220101300017       2   33.00
      56 220101400098       3   97.20
      18 240500200121       2   50.80
   17023 240200200007       2  166.80
   17023 240200200061       2  261.80
     171 220101200029       1   52.30
   70108 240200200039       2   42.40
    2806 240100400043       4 1064.00
     215 230100500024       1   22.90
     215 230100600015       1   78.20
      13 230100600023       2  146.80
      36 240400200057       2  257.00
      36 240400200066       2   27.60
      12 230100500095       2  193.80
      61 230100500074       4  544.00
      61 230100600005       2  259.60
      79 210200900004       2   92.00
      79 210201000050       2   39.00
      31 220200300157       3  220.20
     215 240500200100       2   45.40
     111 220100900029       1   30.80
    3959 240100100610       2  122.00
    3959 240100400143       2  330.00
      71 230100600017       2  111.40
     215 240200100232       1   28.20
   70187 240200200013       3 1266.00
      20 220101400306       2  145.20
      45 240200100051       3  420.90
      52 230100600022       2  168.20
      12 220101400060       3   96.30
      12 220101400117       2   91.20
      16 220200100035       2  125.20
      16 220200100090       2  177.20
      20 240700200024       2   32.00
    2806 240100400076       2  224.60
    2806 240100400143       2  330.00
      61 230100700002       2  440.00
      71 220200200018       2  132.80
      36 230100600023       2  146.80
      36 240800200008       1  150.25
   70046 240200100052       1   99.70
   70046 240200200015       1   24.00
      52 220100100153       1   50.00
   19444 220101200006       1   52.20
      88 220100700052       1  106.10
      52 240100100065       1   34.70
   14703 220101400385       1   24.80
   70108 220101200020       1   55.90
      61 230100600036       1  103.20
      11 230100200047       1   72.70
      63 220200300116       1   84.20
       5 240100100433       1    3.00
     544 230100500091       1  191.00
    1033 230100600005       1  129.80
      17 220100100568       1   84.10
   14703 220101400018       2   45.60
      71 240100400080       1  219.90
       5 240700300002       2   43.98
      45 220200300079       2  128.60
   70187 240200100154       2   53.20
      71 220101400091       2   65.60
      88 230100500087       1   93.80
     183 220101400289       4  240.80
     215 240200100180       2  243.20
      17 240100400070       1  175.90
     111 220100300008       4  342.80
     111 220101400017       2   22.20
       5 230100500093       2  265.60
       5 230100600030       1   86.30
     111 220100100298       2  105.80
   70210 240200100052       2  199.40
       5 220101400276       2  136.80
      19 240300100020       4   56.40
      19 240300100032       2 1200.20
     183 240400300033       3  107.10
     195 230100500008       1   38.00
   70046 240200100124       2   49.00
       5 240100400044       1  353.60
       5 240100400049       1  421.20
      45 230100100045       2  249.60
      45 230100200019       2  398.20
      45 230100500056       1    8.00
      53 230100600022       4  336.40
      49 220100200004       1    6.50
      49 220100900006       1   88.40
      49 220101400150       1   28.20
      34 220100100197       1  101.30
    2618 240100100581       1   28.00
    2618 240100400147       1  248.30
      89 230100100062       2  283.40
     195 230100200059       2   77.60
   70046 240200200039       1   22.20
     171 230100500081       2  146.00
      20 220100300025       2  206.00
      23 230100100051       2  369.80
      13 220200100229       1  165.50
       4 240800200030       1   47.70
       4 240600100017       1   53.00
   70201 240200100226       1  183.90
       4 240700200019       1   16.90
      49 220100100125       1   33.40
      49 220100100513       1   63.90
      49 220100300019       1   35.60
      92 230100600022       1   84.10
;;;;
run;
data _null_;
infile datalines truncover length=length;
input;
file mydata(salary.dat) lrecl=256;
put _infile_ $varying. length;
datalines4;
Donny 5MAY2008 25 FL $43,132.50
Margaret 20FEB2008 43 NC 65,150
Dan 1JUN2008 27 FL $40,000.00
Subash 2FEB2008 45 NC 75,750
Antonio 25MAY2008 35 FL $43,500.50
Jose 1AUG2008 33 NC 65,150
Victor 5MAY2008 29 FL $33,250.50
Marianna 2FEB2008 43 NC $65,150
;;;;
run;
data _null_;
infile datalines truncover length=length;
input;
file mydata(sales.dat) lrecl=256;
put _infile_ $varying. length;
datalines4;
120102 Tom        Zhou           Sales Manager       108255 AU
120103 Wilson     Dawes          Sales Manager       87975  AU
120121 Irenie     Elvish         Sales Rep. II       26600  AU
120122 Christina  Ngan           Sales Rep. II       27475  AU
120123 Kimiko     Hotstone       Sales Rep. I        26190  AU
120124 Lucian     Daymond        Sales Rep. I        26480  AU
120125 Fong       Hofmeister     Sales Rep. IV       32040  AU
120126 Satyakam   Denny          Sales Rep. II       26780  AU
120127 Sharryn    Clarkson       Sales Rep. II       28100  AU
120128 Monica     Kletschkus     Sales Rep. IV       30890  AU
120129 Alvin      Roebuck        Sales Rep. III      30070  AU
120130 Kevin      Lyon           Sales Rep. I        26955  AU
120131 Marinus    Surawski       Sales Rep. I        26910  AU
120132 Fancine    Kaiser         Sales Rep. III      28525  AU
120133 Petrea     Soltau         Sales Rep. II       27440  AU
120134 Sian       Shannan        Sales Rep. II       28015  AU
120135 Alexei     Platts         Sales Rep. IV       32490  AU
120136 Atul       Leyden         Sales Rep. I        26605  AU
120137 Marina     Iyengar        Sales Rep. III      29715  AU
120138 Shani      Duckett        Sales Rep. I        25795  AU
120139 Fang       Wilson         Sales Rep. II       26810  AU
120140 Michael    Minas          Sales Rep. I        26970  AU
120141 Amanda     Liebman        Sales Rep. II       27465  AU
120142 Vincent    Eastley        Sales Rep. III      29695  AU
120143 Phu        Sloey          Sales Rep. II       26790  AU
120144 Viney      Barbis         Sales Rep. III      30265  AU
120145 Sandy      Aisbitt        Sales Rep. II       26060  AU
120146 Wendall    Cederlund      Sales Rep. I        25985  AU
120147 Skev       Rusli          Sales Rep. II       26580  AU
120148 Michael    Zubak          Sales Rep. III      28480  AU
120149 Judy       Chantharasy    Sales Rep. I        26390  AU
120150 John       Filo           Sales Rep. III      29965  AU
120151 Julianna   Phaiyakounh    Sales Rep. II       26520  AU
120152 Sean       Dives          Sales Rep. I        26515  AU
120153 Samantha   Waal           Sales Rep. I        27260  AU
120154 Caterina   Hayawardhana a Sales Rep. III      30490  AU
120155 Narelle    James          Sales Rep. III      29990  AU
120156 Gerry      Snellings      Sales Rep. I        26445  AU
120157 Leonid     Karavdic       Sales Rep. II       27860  AU
120158 Daniel     Pilgrim        Sales Rep. III      36605  AU
120159 Lynelle    Phoumirath     Sales Rep. IV       30765  AU
120160 Chuck      Segrave        Sales Rep. I        27115  AU
120161 Rosette    Martines       Sales Rep. III      30785  AU
120162 Randal     Scordia        Sales Rep. I        27215  AU
120163 Brett      Magrath        Sales Rep. II       26735  AU
120164 Ranj       Stamalis       Sales Rep. II       27450  AU
120165 Tadashi    Pretorius      Sales Rep. I        27050  AU
120166 Fadi       Nowd           Sales Rep. IV       30660  AU
120167 Kimiko     Tilley         Sales Rep. I        25185  AU
120168 Selina     Barcoe         Sales Rep. I        25275  AU
;;;;
run;
data _null_;
infile datalines truncover length=length;
input;
file mydata(sales1.dat) lrecl=256;
put _infile_ $varying. length;
datalines4;
120102 Tom        Zhou           Sales Manager       108255 AU
120103 Wilson     Dawes          Sales Manager       87975  AU
120121 Irenie     Elvish         Sales Rep. II       26600  AU
120122 Christina  Ngan           Sales Rep. II       27475  AU
120123 Kimiko     Hotstone       Sales Rep. I        26190  AU
120124 Lucian     Daymond        Sales Rep. I        26480  AU
120125 Fong       Hofmeister     Sales Rep. IV       32040  AU
120126 Satyakam   Denny          Sales Rep. II       26780  AU
120127 Sharryn    Clarkson       Sales Rep. II       28100  AU
120128 Monica     Kletschkus     Sales Rep. IV       30890  AU
120129 Alvin      Roebuck        Sales Rep. III      30070  AU
120130 Kevin      Lyon           Sales Rep. I        26955  AU
120131 Marinus    Surawski       Sales Rep. I        26910  AU
120132 Fancine    Kaiser         Sales Rep. III      28525  AU
120133 Petrea     Soltau         Sales Rep. II       27440  AU
120134 Sian       Shannan        Sales Rep. II       28015  AU
120135 Alexei     Platts         Sales Rep. IV       32490  AU
120136 Atul       Leyden         Sales Rep. I        26605  AU
120137 Marina     Iyengar        Sales Rep. III      29715  AU
120138 Shani      Duckett        Sales Rep. I        25795  AU
120139 Fang       Wilson         Sales Rep. II       26810  AU
120140 Michael    Minas          Sales Rep. I        26970  AU
120141 Amanda     Liebman        Sales Rep. II       27465  AU
120142 Vincent    Eastley        Sales Rep. III      29695  AU
120143 Phu        Sloey          Sales Rep. II       26790  AU
120144 Viney      Barbis         Sales Rep. III      30265  AU
120145 Sandy      Aisbitt        Sales Rep. II       26060  AU
120146 Wendall    Cederlund      Sales Rep. I        25985  AU
120147 Skev       Rusli          Sales Rep. II       26580  AU
120148 Michael    Zubak          Sales Rep. III      28480  AU
120149 Judy       Chantharasy    Sales Rep. I        26390  AU
120150 John       Filo           Sales Rep. III      29965  AU
120151 Julianna   Phaiyakounh    Sales Rep. II       26520  AU
120152 Sean       Dives          Sales Rep. I        26515  AU
120153 Samantha   Waal           Sales Rep. I        27260  AU
120154 Caterina   Hayawardhana a Sales Rep. III      30490  AU
120155 Narelle    James          Sales Rep. III      29990  AU
120156 Gerry      Snellings      Sales Rep. I        26445  AU
120157 Leonid     Karavdic       Sales Rep. II       27860  AU
120158 Daniel     Pilgrim        Sales Rep. III      36605  AU
120159 Lynelle    Phoumirath     Sales Rep. IV       30765  AU
120160 Chuck      Segrave        Sales Rep. I        27115  AU
120161 Rosette    Martines       Sales Rep. III      30785  AU
120162 Randal     Scordia        Sales Rep. I        27215  AU
120163 Brett      Magrath        Sales Rep. II       26735  AU
120164 Ranj       Stamalis       Sales Rep. II       27450  AU
120165 Tadashi    Pretorius      Sales Rep. I        27050  AU
120166 Fadi       Nowd           Sales Rep. IV       30660  AU
120167 Kimiko     Tilley         Sales Rep. I        25185  AU
120168 Selina     Barcoe         Sales Rep. I        25275  AU
;;;;
run;
data _null_;
infile datalines truncover length=length;
input;
file mydata(sales2.dat) lrecl=256;
put _infile_ $varying. length;
datalines4;
120102 Tom        Zhou         M 108255 Sales Manager
120103 Wilson     Dawes        M 87975  Sales Manager
120121 Irenie     Elvish       F 26600  Sales Rep. II
120122 Christina  Ngan         F 27475  Sales Rep. II
120123 Kimiko     Hotstone     F 26190  Sales Rep. I
120124 Lucian     Daymond      M 26480  Sales Rep. I
120125 Fong       Hofmeister   M 32040  Sales Rep. IV
120126 Satyakam   Denny        M 26780  Sales Rep. II
120127 Sharryn    Clarkson     F 28100  Sales Rep. II
120128 Monica     Kletschkus   F 30890  Sales Rep. IV
120129 Alvin      Roebuck      M 30070  Sales Rep. III
120130 Kevin      Lyon         M 26955  Sales Rep. I
120131 Marinus    Surawski     M 26910  Sales Rep. I
120132 Fancine    Kaiser       F 28525  Sales Rep. III
120133 Petrea     Soltau       F 27440  Sales Rep. II
120134 Sian       Shannan      M 28015  Sales Rep. II
120135 Alexei     Platts       M 32490  Sales Rep. IV
120136 Atul       Leyden       M 26605  Sales Rep. I
120137 Marina     Iyengar      F 29715  Sales Rep. III
120138 Shani      Duckett      F 25795  Sales Rep. I
120139 Fang       Wilson       F 26810  Sales Rep. II
120140 Michael    Minas        M 26970  Sales Rep. I
120141 Amanda     Liebman      F 27465  Sales Rep. II
120142 Vincent    Eastley      M 29695  Sales Rep. III
120143 Phu        Sloey        M 26790  Sales Rep. II
120144 Viney      Barbis       M 30265  Sales Rep. III
120145 Sandy      Aisbitt      M 26060  Sales Rep. II
120146 Wendall    Cederlund    M 25985  Sales Rep. I
120147 Skev       Rusli        F 26580  Sales Rep. II
120148 Michael    Zubak        M 28480  Sales Rep. III
120149 Judy       Chantharasy  F 26390  Sales Rep. I
120150 John       Filo         M 29965  Sales Rep. III
120151 Julianna   Phaiyakounh  F 26520  Sales Rep. II
120152 Sean       Dives        M 26515  Sales Rep. I
120153 Samantha   Waal         F 27260  Sales Rep. I
120154 Caterina   Hayawardhana F 30490  Sales Rep. III
120155 Narelle    James        F 29990  Sales Rep. III
120156 Gerry      Snellings    F 26445  Sales Rep. I
120157 Leonid     Karavdic     M 27860  Sales Rep. II
120158 Daniel     Pilgrim      M 36605  Sales Rep. III
120159 Lynelle    Phoumirath   F 30765  Sales Rep. IV
120160 Chuck      Segrave      M 27115  Sales Rep. I
120161 Rosette    Martines     F 30785  Sales Rep. III
120162 Randal     Scordia      M 27215  Sales Rep. I
120163 Brett      Magrath      M 26735  Sales Rep. II
120164 Ranj       Stamalis     F 27450  Sales Rep. II
120165 Tadashi    Pretorius    M 27050  Sales Rep. I
120166 Fadi       Nowd         M 30660  Sales Rep. IV
120167 Kimiko     Tilley       F 25185  Sales Rep. I
120168 Selina     Barcoe       F 25275  Sales Rep. I
;;;;
run;
data _null_;
infile datalines truncover length=length;
input;
file mydata(sales3.dat) lrecl=256;
put _infile_ $varying. length;
datalines4;
120102,Tom,Zhou,Sales Manager,108255,AU
120103,Wilson,Dawes,Sales Manager,87975,AU
120121,Irenie,Elvish,Sales Rep. II,26600,AU
120122,Christina,Ngan,Sales Rep. II,n/a,AU
120123,Kimiko,Hotstone,Sales Rep. I,26190,AU
120124,Lucian,Daymond,Sales Rep. I,26480,12
120125,Fong,Hofmeister,Sales Rep. IV,32040,AU
120126,Satyakam,Denny,Sales Rep. II,26780,AU
120127,Sharryn,Clarkson,Sales Rep. II,28100,AU
120128,Monica,Kletschkus,Sales Rep. IV,30890,AU
120129,Alvin,Roebuck,Sales Rep. III,30070,AU
120130,Kevin,Lyon,Sales Rep. I,26955,AU
120131,Marinus,Surawski,Sales Rep. I,26910,AU
120132,Fancine,Kaiser,Sales Rep. III,28525,AU
120133,Petrea,Soltau,Sales Rep. II,27440,AU
120134,Sian,Shannan,Sales Rep. II,28015,AU
120135,Alexei,Platts,Sales Rep. IV,32490,AU
120136,Atul,Leyden,Sales Rep. I,26605,AU
120137,Marina,Iyengar,Sales Rep. III,29715,AU
120138,Shani,Duckett,Sales Rep. I,25795,AU
120139,Fang,Wilson,Sales Rep. II,26810,AU
120140,Michael,Minas,Sales Rep. I,26970,AU
120141,Amanda,Liebman,Sales Rep. II,27465,AU
120142,Vincent,Eastley,Sales Rep. III,29695,AU
;;;;
run;
data _null_;
infile datalines truncover length=length;
input;
file mydata(sales3invfixedcol.dat) lrecl=256;
put _infile_ $varying. length;
datalines4;
120102 Tom        Zhou           Sales Manager       108255 AU
120103 Wilson     Dawes          Sales Manager       87975  AU
120121 Irenie     Elvish         Sales Rep. II       26600  AU
120122 Christina  Ngan           Sales Rep. II       n/a    AU
120123 Kimiko     Hotstone       Sales Rep. I        26190  AU
120124 Lucian     Daymond        Sales Rep. I        26480  12
120125 Fong       Hofmeister     Sales Rep. IV       32040  AU
120126 Satyakam   Denny          Sales Rep. II       26780  AU
120127 Sharryn    Clarkson       Sales Rep. II       28100  AU
120128 Monica     Kletschkus     Sales Rep. IV       30890  AU
120129 Alvin      Roebuck        Sales Rep. III      30070  AU
120130 Kevin      Lyon           Sales Rep. I        26955  AU
120131 Marinus    Surawski       Sales Rep. I        26910  AU
120132 Fancine    Kaiser         Sales Rep. III      28525  AU
120133 Petrea     Soltau         Sales Rep. II       27440  AU
120134 Sian       Shannan        Sales Rep. II       28015  AU
120135 Alexei     Platts         Sales Rep. IV       32490  AU
120136 Atul       Leyden         Sales Rep. I        26605  AU
120137 Marina     Iyengar        Sales Rep. III      29715  AU
120138 Shani      Duckett        Sales Rep. I        25795  AU
120139 Fang       Wilson         Sales Rep. II       26810  AU
120140 Michael    Minas          Sales Rep. I        26970  AU
120141 Amanda     Liebman        Sales Rep. II       n/a    AU
120142 Vincent    Eastley        Sales Rep. III      29695  AU
120143 Phu        Sloey          Sales Rep. II       26790  AU
120144 Viney      Barbis         Sales Rep. III      30265  AU
120145 Sandy      Aisbitt        Sales Rep. II       26060  AU
120146 Wendall    Cederlund      Sales Rep. I        25985  AU
120147 Skev       Rusli          Sales Rep. II       .      AU
120148 Michael    Zubak          Sales Rep. III      28480  AU
120149 Judy       Chantharasy    Sales Rep. I        26390  AU
120150 John       Filo           Sales Rep. III      29965  AU
120151 Julianna   Phaiyakounh    Sales Rep. II       26520  AU
120152 Sean       Dives          Sales Rep. I        26515  AU
120153 Samantha   Waal           Sales Rep. I        27260  AU
120154 Caterina   Hayawardhana a Sales Rep. III      30490  AU
120155 Narelle    James          Sales Rep. III      29990  AU
120156 Gerry      Snellings      Sales Rep. I        26445  AU
120157 Leonid     Karavdic       Sales Rep. II       27860  AU
120158 Daniel     Pilgrim        Sales Rep. III      36605  AU
120159 Lynelle    Phoumirath     Sales Rep. IV       30765  AU
120160 Chuck      Segrave        Sales Rep. I        27115  AU
120161 Rosette    Martines       Sales Rep. III      n/a    AU
120162 Randal     Scordia        Sales Rep. I        27215  AU
120163 Brett      Magrath        Sales Rep. II       26735  AU
120164 Ranj       Stamalis       Sales Rep. II       27450  AU
120165 Tadashi    Pretorius      Sales Rep. I        27050  AU
120166 Fadi       Nowd           Sales Rep. IV       30660  AU
120167 Kimiko     Tilley         Sales Rep. I        25185  AU
120168 Selina     Barcoe         Sales Rep. I        25275  AU
;;;;
run;
data _null_;
infile datalines truncover length=length;
input;
file mydata(supplier.dat) lrecl=256;
put _infile_ $varying. length;
datalines4;
50     Scandinavian Clothing A/S       NO
109    Petterson AB                    SE
316    Prime Sports Ltd                GB
755    Top Sports                      DK
772    AllSeasons Outdoor Clothing     US
798    Sportico                        ES
1280   British Sports Ltd              GB
1303   Eclipse Inc                     US
1684   Magnifico Sports                PT
1747   Pro Sportswear Inc              US
2963   3Top Sports                     US
2995   Van Dammeren International      NL
3298   A Team Sports                   US
3664   Triple Sportswear Inc           US
3808   Carolina Sports                 US
3815   Roll-Over Inc                   US
4168   Rubby Zapatos S.A.              ES
4514   Royal Darts Ltd                 GB
4646   Mayday Inc                      US
4718   KN Outdoor Trading Inc          US
4742   Luna sastreria S.A.             ES
4793   Norsok A/S                      DK
5503   Ultra Sporting Goods Inc        US
5810   Teamsports Inc                  US
5922   Force Sports                    BE
6071   SportsFan Products Ltd          GB
6153   Nautlius SportsWear Inc         US
6355   Svensson Trading AB             SE
7511   Mike Schaeffer Inc              US
10225  HighPoint Trading               US
10692  Toto Outdoor Gear               AU
11427  Typhoon Clothing                AU
12283  EA Sports Limited               GB
12869  Truls Sporting Goods            NO
13079  Le Blanc S.A.                   FR
13198  Twain Inc                       US
13199  Massif S.A.                     FR
13314  Triffy B.V.                     NL
13710  SD Sporting Goods Inc           US
14593  Fga Sports Inc                  US
14624  Ypsilon S.A.                    FR
14648  Top Sports Inc                  US
14682  Greenline Sports Ltd            GB
15218  Miller Trading Inc              US
15938  TeeTime Ltd                     GB
16292  Dolphin Sportswear Inc          US
16422  Outback Outfitters Ltd          GB
16542  TrimSport B.V.                  NL
16733  Fuller Trading Co.              CA
16814  CrystalClear Optics Inc         CA
17832  GrandSlam Sporting Goods Ltd    GB
18139  Green Lime Sports Inc           US
;;;;
run;
data _null_;
infile datalines truncover length=length;
input;
file mydata(country.dat) lrecl=256;
put _infile_ $varying. length;
datalines4;
AD!Andorra
AE!United Arab Emirates
AF!Afghanistan
AG!Antigua/Barbuda
AI!Anguilla
AL!Albania
AM!Armenia
AN!Netherlands Antilles
AO!Angola
AQ!Antarctica
AR!Argentina
AS!American Samoa
AT!Austria
AU!Australia
AW!Aruba
AZ!Azerbaijan
BA!Bosnia/Herzegovina
BB!Barbados
BD!Bangladesh
BE!Belgium
BF!Burkina Faso
BG!Bulgaria
BH!Bahrain
BI!Burundi
BJ!Benin
BM!Bermuda
BN!Brunei
BO!Bolivia
BR!Brazil
BS!Bahamas
BT!Bhutan
BV!Bouvet Island
BW!Botswana
BY!Belarus
BZ!Belize
CA!Canada
CC!Cocos Islands
CD!Congo
CF!Central African Rep.
CG!Congo
CH!Switzerland
CI!Ivory Coast
CK!Cook Islands
CL!Chile
CM!Cameroon
CN!China
CO!Colombia
CR!Costa Rica
CU!Cuba
CV!Cape Verde
CX!Christmas Island
CY!Cyprus
CZ!Czech Republic
DA!Germany
DE!Germany
DJ!Djibouti
DK!Denmark
DM!Dominica
DO!Dominican Republic
DZ!Algeria
EC!Ecuador
EE!Estonia
EG!Egypt
EH!Western Sahara
ER!Eritrea
ES!Spain
ET!Ethiopia
FI!Finland
FJ!Fiji
FK!Falkland Islands
FM!Micronesia
FO!Faroe Islands
FR!France
GA!Gabon
GB!United Kingdom
GD!Grenada
GE!Georgia
GF!French Guiana
GH!Ghana
GI!Gibraltar
GL!Greenland
GM!Gambia
GN!Guinea
GP!Guadeloupe
GQ!Equatorial Guinea
GR!Greece
GT!Guatemala
GU!Guam
GW!Guinea-Bissau
GY!Guyana
HK!Hong Kong
HM!Heard/Mcdonald
HN!Honduras
HR!Croatia
HT!Haiti
HU!Hungary
ID!Indonesia
IE!Ireland
IL!Israel
IN!India
IO!British Indian Ocean
IQ!Iraq
IR!Iran
IS!Iceland
IT!Italy
JM!Jamaica
JO!Jordan
JP!Japan
KE!Kenya
KG!Kyrgyzstan
KH!Cambodia
KI!Kiribati
KM!Comoros
KN!Saint Kitts/Nevis
KP!Korea, North
KR!Korea, South
KW!Kuwait
KY!Cayman Islands
KZ!Kazakhstan
LA!Laos
LB!Lebanon
LC!St. Lucia
LI!Liechtenstein
LK!Sri Lanka
LR!Liberia
LS!Lesotho
LT!Lithuania
LU!Luxembourg
LV!Latvia
LY!Libya
MA!Morocco
MC!Monaco
MD!Moldova
MG!Madagascar
MH!Marshall Islands
MK!Macedonia
ML!Mali
MM!Myanmar
MN!Mongolia
MO!Macau
MP!Northern Mariana Islands
MQ!Martinique
MR!Mauritania
MS!Montserrat
MT!Malta
MU!Mauritius
MV!Maldives
MW!Malawi
MX!Mexico
MY!Malaysia
MZ!Mozambique
NA!Namibia
NC!New Caledonia
NE!Niger
NF!Norfolk Island
NG!Nigeria
NI!Nicaragua
NL!Netherlands
NO!Norway
NP!Nepal
NR!Nauru
NU!Niue
NZ!New Zealand
OM!Oman
PA!Panama
PE!Peru
PF!French Polynesia
PG!Papua New Guinea
PH!Philippines
PK!Pakistan
PL!Poland
PM!St. Pierre/Miquelon
PN!Pitcairn Islands
PR!Puerto Rico
PS!Gaza Strip
PT!Portugal
PW!Palau
PY!Paraguay
QA!Qatar
RE!Reunion
RO!Romania
RU!Russia
RW!Rwanda
SA!Saudi Arabia
SB!Solomon Islands
SC!Seychelles
SD!Sudan
SE!Sweden
SG!Singapore
SH!St. Helena
SI!Slovenia
SJ!Svalbard
SK!Slovakia
SL!Sierra Leone
SM!San Marino
SN!Senegal
SO!Somalia
SR!Suriname
ST!Sao Tome/Principe
SV!El Salvador
SY!Syria
SZ!Swaziland
TC!Turks/Caicos Islands
TD!Chad
TF!French Southern Terr.
TG!Togo
TH!Thailand
TJ!Tajikistan
TK!Tokelau
TM!Turkmenistan
TN!Tunisia
TO!Tonga
TP!East Timor
TR!Turkey
TT!Trinidad and Tobago
TV!Tuvalu
TW!Taiwan
TZ!Tanzania
UA!Ukraine
UG!Uganda
US!United States
UY!Uruguay
UZ!Uzbekistan
VC!Saint Vincent/Grenadines
VE!Venezuela
VG!British Virgin Islands
VI!Virgin Islands (U.S.)
VN!Vietnam
VU!Vanuatu
WF!Wallis/Futuna Islands
WS!Samoa
XX!Zaire
YE!Yemen
YT!Mayotte
YU!Yugoslavia
ZA!South Africa
ZM!Zambia
ZW!Zimbabwe
;;;;
run;
data _null_;
infile datalines truncover length=length;
input;
file mydata(custus.dat) lrecl=256;
put _infile_ $varying. length;
datalines4;
"James Kvarniq" 4 M 27JUN1978 33 "31-45 years"
"Sandrina Stephano" 5 F 09JUL1983 28 "15-30 years"
"Karen Ballinger" 10 F 18OCT1988 23 "15-30 years"
"David Black" 12 M 12APR1973 38 "31-45 years"
"Jimmie Evans" 17 M 17AUG1958 53 "46-60 years"
"Tonie Asmussen" 18 M 02FEB1958 53 "46-60 years"
"Michael Dineley" 20 M 17APR1963 48 "46-60 years"
"Tulio Devereaux" 23 M 02DEC1953 58 "46-60 years"
"Robyn Klem" 24 F 02JUN1963 48 "46-60 years"
"Cynthia Mccluney" 27 F 15APR1973 38 "31-45 years"
"Cynthia Martinez" 31 F 07AUG1963 48 "46-60 years"
"Alvan Goheen" 34 M 18JAN1988 23 "15-30 years"
"Phenix Hill" 36 M 02APR1968 44 "31-45 years"
"Alphone Greenwald" 39 M 25JUL1988 23 "15-30 years"
"Dianne Patchin" 45 F 06MAY1983 28 "15-30 years"
"Annmarie Leveille" 49 F 16JUL1988 23 "15-30 years"
"Yan Kozlowski" 52 M 06APR1973 38 "31-45 years"
"Roy Siferd" 56 M 01FEB1938 73 "61-75 years"
"Tedi Lanzarone" 60 F 23MAY1973 38 "31-45 years"
"James Klisurich" 63 M 25DEC1973 38 "31-45 years"
"Patricia Bertolozzi" 69 F 13MAY1983 28 "15-30 years"
"Viola Folsom" 71 F 23SEP1973 38 "15-30 years"
"Mikel Spetz" 75 M 18JUN1988 23 "15-30 years"
"Najma Hicks" 79 F 22JAN1990 21 "15-30 years"
"Attila Gibbs" 88 M 19FEB1963 48 "46-60 years"
"Wynella Lewis" 89 F 28SEP1938 73 "61-75 years"
"Kyndal Hooks" 90 F 01AUG1968 43 "31-45 years"
"Lendon Celii" 92 M 14SEP1948 63 "61-75 years"
;;;;
run;
data _null_;
infile datalines truncover length=length;
input;
file mydata(donation.dat) lrecl=256;
put _infile_ $varying. length;
datalines4;
120265 . . . 25
120267 15 15 15 15
120269 20 20 20 20
120270 20 10 5 .
120271 20 20 20 20
120272 10 10 10 10
120275 15 15 15 15
120660 25 25 25 25
120662 10 . 5 5
120663 . . 5 .
120668 10 10 10 10
120669 15 15 15 15
120671 20 20 20 20
120677 25 25 25 25
120678 10 10 . .
120679 . 20 5 15
120680 15 15 15 15
120681 10 10 5 15
120684 5 5 5 5
120686 15 15 15 15
120689 15 15 15 15
120713 15 15 15 15
120715 10 10 10 10
120721 5 5 5 5
120726 10 10 10 10
120734 . . 15 10
120736 25 . . 20
120740 15 15 15 15
120742 . . 10 10
120745 15 15 15 15
120746 20 20 20 20
120747 20 20 20 20
120748 20 20 20 20
120752 10 . . .
120753 25 25 25 25
120754 10 10 10 10
120757 . . 15 5
120759 15 20 5 .
120760 . 15 20 .
120761 10 10 10 10
120762 . . 5 5
120764 15 15 15 15
120766 25 25 25 25
120767 15 15 15 15
120768 20 20 20 .
120771 20 20 20 20
120773 10 10 10 10
120777 5 15 5 15
120778 15 15 15 15
120783 20 20 20 20
120789 5 . . .
120790 20 20 20 20
120791 30 30 30 30
120792 20 20 20 20
120793 15 15 15 15
120794 . . 20 20
120799 5 5 5 5
120801 20 20 20 20
120807 20 20 20 20
120808 . . 10 .
120813 20 20 20 .
120814 25 25 25 25
120815 15 15 15 15
120994 5 5 10 10
120995 15 15 15 15
120996 15 15 15 15
120999 5 5 5 5
121000 20 20 20 20
121002 10 10 10 10
121008 10 10 10 10
121009 15 15 15 15
121010 10 10 10 10
121012 . . 5 5
121013 10 5 . 5
121014 15 15 15 15
121018 10 . . .
121022 15 15 15 15
121025 10 10 10 10
121030 10 10 10 10
121031 10 10 10 10
121033 15 15 15 15
121036 . . . 10
121037 10 10 10 10
121039 10 10 10 10
121040 10 10 10 10
121044 10 10 10 10
121053 5 . 5 .
121054 15 15 15 15
121056 . 10 10 10
121058 10 10 10 10
121061 10 10 10 10
121062 15 15 15 15
121063 15 15 15 15
121065 10 10 10 10
121069 10 10 10 10
121074 10 10 10 10
121077 15 15 15 15
121078 15 15 15 15
121079 10 10 10 10
121083 15 15 15 15
121086 . 10 10 .
121089 15 15 15 15
121093 5 . . .
121097 10 10 10 10
121100 5 5 5 5
121101 5 . 10 5
121102 5 5 5 5
121103 10 10 10 10
121105 15 15 15 15
121125 10 . . .
121126 10 . . .
121128 10 . . .
121129 10 . . .
121131 10 . . .
121132 10 . . .
121133 5 . . .
121134 5 . . .
121136 5 5 5 5
121138 10 10 10 10
121140 10 10 10 10
121142 35 35 35 35
121143 35 35 35 35
121145 35 35 35 35
121147 10 10 10 10
;;;;
run;
data _null_;
infile datalines truncover length=length;
input;
file mydata(managers.dat) lrecl=256;
put _infile_ $varying. length;
datalines4;
120102/Tom/Zhou/M//Sales Manager/AU/11AUG1969/'06/01/1989'
120103/Wilson/Dawes/M/87975/Sales Manager/AU/22JAN1949/'01/01/1974'
120261/Harry/Highpoint/M/243190//US/21FEB1969/'08/01/1987'
121143/Louis/Favaron/M/95090/Senior Sales Manager/US/26NOV1969/'07/01/1997'
121144/Renee/Capachietti/F/83505/Sales Manager/US/28JUN1964
121145/Dennis/Lansberry/M/84260/Sales Manager/US/22NOV1949/'04/01/1976'
;;;;
run;
data _null_;
infile datalines truncover length=length;
input;
file mydata(managers2.dat) lrecl=256;
put _infile_ $varying. length;
datalines4;
120102	Tom	Zhou	M	108255	Sales Manager
120103	Wilson	Dawes	M	87975	Sales Manager
120261	Harry	Highpoint	M	243190	Chief Sales Officer
121143	Louis	Favaron	M	95090	Senior Sales Manager
121144	Renee	Capachietti	F	83505	Sales Manager
121145	Dennis	Lansberry	M	84260	Sales Manager
;;;;
run;
data _null_;
infile datalines truncover length=length;
input;
file mydata(nonsales.dat) lrecl=256;
put _infile_ $varying. length;
datalines4;
120102 Tom        Zhou         108255 Sales Manager  M
120103 Wilson     Dawes        87975  Sales Manager  M
120121 Irenie     Elvish       26600  Sales Rep. II  F
120122 Christina  Ngan         N/A    Sales Rep. II  F
120123 Kimiko     Hotstone     26190  Sales Rep. I   F
120124 Lucian     Daymond      26480  Sales Rep. I   1
120125 Fong       Hofmeister   32040  Sales Rep. IV  M
120126 Satyakam   Denny        26780  Sales Rep. II  M
120127 Sharryn    Clarkson     28100  Sales Rep. II  F
120128 Monica     Kletschkus   30890  Sales Rep. IV  F
120129 Alvin      Roebuck      30070  Sales Rep. III M
120130 Kevin      Lyon         26955  Sales Rep. I   M
120131 Marinus    Surawski     26910  Sales Rep. I   M
120132 Fancine    Kaiser       28525  Sales Rep. III F
120133 Petrea     Soltau       27440  Sales Rep. II  F
120134 Sian       Shannan      28015  Sales Rep. II  M
120135 Alexei     Platts       32490  Sales Rep. IV  M
120136 Atul       Leyden       26605  Sales Rep. I   M
120137 Marina     Iyengar      29715  Sales Rep. III F
120138 Shani      Duckett      25795  Sales Rep. I   F
120139 Fang       Wilson       26810  Sales Rep. II  F
120140 Michael    Minas        26970  Sales Rep. I   M
120141 Amanda     Liebman      27465  Sales Rep. II  F
120142 Vincent    Eastley      29695  Sales Rep. III M
120143 Phu        Sloey        26790  Sales Rep. II  M
120144 Viney      Barbis       30265  Sales Rep. III M
120145 Sandy      Aisbitt      26060  Sales Rep. II  M
120146 Wendall    Cederlund    25985  Sales Rep. I   M
120147 Skev       Rusli        26580  Sales Rep. II  F
120148 Michael    Zubak        28480  Sales Rep. III M
120149 Judy       Chantharasy  26390  Sales Rep. I   F
120150 John       Filo         29965  Sales Rep. III M
120151 Julianna   Phaiyakounh  26520  Sales Rep. II  F
120152 Sean       Dives        26515  Sales Rep. I   M
120153 Samantha   Waal         27260  Sales Rep. I   F
120154 Caterina   Hayawardhana 30490  Sales Rep. III F
120155 Narelle    James        29990  Sales Rep. III F
120156 Gerry      Snellings    26445  Sales Rep. I   F
120157 Leonid     Karavdic     27860  Sales Rep. II  M
120158 Daniel     Pilgrim      36605  Sales Rep. III M
120159 Lynelle    Phoumirath   30765  Sales Rep. IV  F
120160 Chuck      Segrave      27115  Sales Rep. I   M
120161 Rosette    Martines     30785  Sales Rep. III F
120162 Randal     Scordia      27215  Sales Rep. I   M
120163 Brett      Magrath      26735  Sales Rep. II  M
120164 Ranj       Stamalis     27450  Sales Rep. II  F
120165 Tadashi    Pretorius    27050  Sales Rep. I   M
120166 Fadi       Nowd         30660  Sales Rep. IV  M
120167 Kimiko     Tilley       25185  Sales Rep. I   F
120168 Selina     Barcoe       25275  Sales Rep. I   F
;;;;
run;
data _null_;
infile datalines truncover length=length;
input;
file mydata(prices.dat) lrecl=256;
put _infile_ $varying. length;
datalines4;
210200100009*09JUN2007*31DEC9999*$15.50*$34.70
210200100017*24JAN2007*31DEC9999*$17.80
210200200023*04JUL2007*31DEC9999*$8.25*$19.80
210200600067*27OCT2007*31DEC9999*$28.90
210200600085*28AUG2007*31DEC9999*$17.85*$39.40
210200600112*04JAN2007*31DEC9999*$9.25*$21.80
210200900033*17SEP2007*31DEC9999*$6.45*$14.20
210200900038*01FEB2007*31DEC9999*$9.30*$20.30
210201000050*02APR2007*31DEC9999*$9.00*$19.60
210201000126*22APR2007*31DEC9999*$2.30*$6.50
210201000198*07OCT2007*31DEC9999*$26.80*$60.10
210201100004*18APR2007*31DEC9999*$21.50*$49.20
220100100189*29JUL2007*31DEC9999*$47.45*$94.70
220100100192*13AUG2007*31DEC9999*$13.80*$27.40
220100100309*30MAY2007*31DEC9999*$48.25*$96.30
220100100354*08MAY2007*31DEC9999*$8.45
220100200004*29JUL2007*31DEC9999*$2.60*$6.50
220100300008*14APR2007*31DEC9999*$34.35*$85.70
220100300042*17FEB2007*31DEC9999*$84.35*$208.60
220100400023*19JUN2007*31DEC9999*$40.75*$93.60
220100700002*17OCT2007*31DEC9999*$89.95*$188.60
220100700022*08JAN2007*31DEC9999*$24.10*$56.90
220100700024*02SEP2007*31DEC9999*$49.80*$104.60
220100700027*04MAY2007*31DEC9999*$29.85*$59.50
220100700042*01DEC2007*31DEC9999*$38.45*$90.60
220100700046*12JAN2007*31DEC9999*$73.60*$154.40
220100700052*10MAY2007*31DEC9999*$57.85*$121.60
220100800001*09FEB2007*31DEC9999*$18.35*$38.60
220100800009*01DEC2007*31DEC9999*$24.95*$52.50
220100800040*17SEP2007*31DEC9999*$60.20*$126.50
220100800071*01DEC2007*31DEC9999*$16.15*$33.70
220100800096*10APR2007*31DEC9999*$35.30*$74.10
220100900006*08MAY2007*31DEC9999*$35.45*$88.40
220101200006*04JUN2007*31DEC9999*$22.15*$55.20
220101200025*13AUG2007*31DEC9999*$11.70*$26.90
220101200029*08JAN2007*31DEC9999*$23.75*$54.80
220101300001*02OCT2007*31DEC9999*$14.95*$33.60
220101300012*20MAY2007*31DEC9999*$8.80*$19.40
220101300017*24JUN2007*31DEC9999*$7.50*$16.60
220101400004*24JUL2007*31DEC9999*$48.15*$105.70
220101400017*25MAR2007*31DEC9999*$5.00*$11.10
220101400047*13AUG2007*31DEC9999*$11.10*$24.20
220101400060*14JUN2007*31DEC9999*$14.80*$32.40
220101400061*10MAY2007*31DEC9999*$23.30*$51.00
220101400088*01NOV2007*31DEC9999*$17.50*$38.40
220101400091*27OCT2007*31DEC9999*$15.60
220101400098*20APR2007*31DEC9999*$14.95*$32.70
220101400117*09FEB2007*31DEC9999*$21.25*$46.40
220101400130*08JAN2007*31DEC9999*$5.70*$16.90
220101400145*07SEP2007*31DEC9999*$7.75*$16.70
220101400148*21MAR2007*31DEC9999*$4.75*$10.50
220101400201*09MAR2007*31DEC9999*$18.05*$40.60
220101400216*17OCT2007*31DEC9999*$11.30*$24.60
220101400237*04MAY2007*31DEC9999*$46.90*$102.90
220101400238*30MAY2007*31DEC9999*$25.95*$56.90
220101400265*08AUG2007*31DEC9999*$16.55*$37.10
220101400269*06APR2007*31DEC9999*$29.80
220101400276*13AUG2007*31DEC9999*$31.20*$68.40
220101400285*04MAY2007*31DEC9999*$27.05*$59.40
220101400290*29MAR2007*31DEC9999*$34.10*$74.80
220101400306*18AUG2007*31DEC9999*$33.70
220101400310*11MAR2007*31DEC9999*$14.30*$32.10
220101400328*26APR2007*31DEC9999*$8.85
220101400339*02SEP2007*31DEC9999*$14.75*$32.30
220101400349*11NOV2007*31DEC9999*$4.80*$11.90
220101400363*27SEP2007*31DEC9999*$16.95*$39.00
220101400373*17OCT2007*31DEC9999*$23.65*$51.80
220101400385*04JUN2007*31DEC9999*$13.40*$26.90
220101400387*02SEP2007*31DEC9999*$5.85*$12.60
220200100009*22SEP2007*31DEC9999*$30.50*$63.40
220200100129*08MAY2007*31DEC9999*$39.45
220200100226*27OCT2007*31DEC9999*$66.70*$133.20
220200200022*25MAR2007*31DEC9999*$33.90*$57.30
220200200036*08JAN2007*31DEC9999*$27.40*$60.20
220200200071*16MAR2007*31DEC9999*$47.00*$108.20
220200200073*05FEB2007*31DEC9999*$66.35*$145.90
220200200077*05MAR2007*31DEC9999*$63.15*$138.80
220200200079*29JUN2007*31DEC9999*$64.85*$142.90
220200300002*05FEB2007*31DEC9999*$17.50*$38.50
220200300005*08MAY2007*31DEC9999*$52.35
220200300015*25APR2007*31DEC9999*$52.40
220200300079*22OCT2007*31DEC9999*$28.90*$64.90
220200300116*11MAR2007*31DEC9999*$38.35*$84.20
220200300157*26NOV2007*31DEC9999*$36.65*$73.40
230100100018*07SEP2007*31DEC9999*$67.40*$159.10
230100100033*09FEB2007*31DEC9999*$26.65*$57.80
230100100063*30APR2007*31DEC9999*$177.80*$387.70
230100200022*13AUG2007*31DEC9999*$58.00
230100200025*14JUN2007*31DEC9999*$125.25*$275.90
230100200059*07OCT2007*31DEC9999*$16.80*$39.10
230100200073*15APR2007*31DEC9999*$20.20*$46.90
230100200074*21MAR2007*31DEC9999*$26.45*$54.10
230100300006*19JUL2007*31DEC9999*$34.35*$68.50
230100300010*23AUG2007*31DEC9999*$19.80*$49.40
230100300013*17MAR2007*31DEC9999*$5.05
230100300023*31MAR2007*31DEC9999*$15.00
230100400010*04MAY2007*31DEC9999*$16.85*$40.20
230100400012*04JUL2007*31DEC9999*$12.15*$30.30
230100400025*25APR2007*31DEC9999*$6.60
230100500087*14JUN2007*31DEC9999*$40.55*$97.50
230100500092*26APR2007*31DEC9999*$49.05*$117.80
230100500093*30MAY2007*31DEC9999*$55.85*$132.80
230100500095*29JUN2007*31DEC9999*$42.00*$101.70
230100600035*03AUG2007*31DEC9999*$16.00*$33.20
230100600036*05APR2007*31DEC9999*$50.40*$103.20
230100600039*20MAY2007*31DEC9999*$60.80*$127.10
230100700002*25APR2007*31DEC9999*$135.00
230100700008*30APR2007*31DEC9999*$253.20*$519.30
230100700009*01MAR2007*31DEC9999*$289.95*$568.10
230100700011*17OCT2007*31DEC9999*$120.30*$291.70
240100100029*20APR2007*31DEC9999*$51.70*$119.50
240100100031*28AUG2007*31DEC9999*$1.30*$3.70
240100100063*23AUG2007*31DEC9999*$9.90*$24.60
240100100065*21FEB2007*31DEC9999*$13.80*$34.70
240100100159*17MAR2007*31DEC9999*$13.90*$31.40
240100100184*16MAY2007*31DEC9999*$88.80*$190.40
240100100232*28AUG2007*31DEC9999*$1.30*$3.20
240100100305*06MAR2007*31DEC9999*$4.10*$8.90
240100100312*14JUN2007*31DEC9999*$7.70*$18.10
240100100365*12JAN2007*31DEC9999*$87.40*$191.60
240100100410*27SEP2007*31DEC9999*$10.40*$22.70
240100100434*07SEP2007*31DEC9999*$8.05*$16.40
240100100463*22SEP2007*31DEC9999*$6.05*$14.70
240100100477*28JAN2007*31DEC9999*$3.30*$8.50
240100100581*19JUL2007*31DEC9999*$11.95
240100100605*25FEB2007*31DEC9999*$20.75*$48.20
240100100610*09JUN2007*31DEC9999*$29.45*$65.20
240100100665*01NOV2007*31DEC9999*$17.25*$41.50
240100100672*30APR2007*31DEC9999*$84.90*$197.90
240100100676*30APR2007*31DEC9999*$18.65*$43.40
240100100679*27OCT2007*31DEC9999*$19.50*$45.80
240100100690*21MAR2007*31DEC9999*$86.10*$201.50
240100100737*05MAY2007*31DEC9999*$20.65*$47.90
240100200001*06MAR2007*31DEC9999*$6.35
240100200004*11NOV2007*31DEC9999*$14.80*$35.20
240100400004*06MAR2007*31DEC9999*$51.15*$102.40
240100400005*30MAY2007*31DEC9999*$131.65*$266.40
240100400006*04MAY2007*31DEC9999*$117.75*$238.20
240100400037*16MAR2007*31DEC9999*$113.65
240100400043*17MAR2007*31DEC9999*$139.45*
240100400044*08MAY2007*31DEC9999*$194.60*$393.90
240100400062*16NOV2007*31DEC9999*$54.00*$113.20
240100400070*10MAY2007*31DEC9999*$127.95*$175.90
240100400080*13MAR2007*31DEC9999*$110.95
240100400083*16MAY2007*31DEC9999*$54.70*$109.50
240100400085*25MAR2007*31DEC9999*$30.95*$64.50
240100400129*11MAR2007*31DEC9999*$111.00*$237.40
240100400142*13MAR2007*31DEC9999*$90.80*$181.30
240100400143*20MAY2007*31DEC9999*$83.40*$166.60
240100400147*28JAN2007*31DEC9999*$131.50*$265.90
240100400151*10APR2007*31DEC9999*$209.45
240200100007*17MAR2007*31DEC9999*$11.80*$24.70
240200100020*25MAR2007*31DEC9999*$104.60*$197.10
240200100034*27OCT2007*31DEC9999*$4.45*$12.20
240200100051*24JUN2007*31DEC9999*$72.00*$140.30
240200100052*28JAN2007*31DEC9999*$51.90*$100.60
240200100053*13AUG2007*31DEC9999*$44.95*$87.20
240200100056*20JAN2007*31DEC9999*$19.90*$41.20
240200100057*20MAY2007*31DEC9999*$20.25
240200100073*09FEB2007*31DEC9999*$12.60*$22.30
240200100081*21NOV2007*31DEC9999*$3.65*$8.30
240200100098*16MAR2007*31DEC9999*$6.75*$14.60
240200100101*14JUN2007*31DEC9999*$10.30*$19.50
240200100116*09FEB2007*31DEC9999*$124.90*$219.50
240200100118*21NOV2007*31DEC9999*$89.55*$175.50
240200100124*24JUL2007*31DEC9999*$12.35*$24.50
240200100154*29MAR2007*31DEC9999*$11.95*$26.60
240200100164*24FEB2007*31DEC9999*$28.15*$56.10
240200100173*01MAR2007*31DEC9999*$247.70*$484.30
240200100181*02SEP2007*31DEC9999*$56.60*$109.30
240200100183*14JUL2007*31DEC9999*$47.95*$95.70
240200100207*27SEP2007*31DEC9999*$53.35*$107.90
240200100211*01MAR2007*31DEC9999*$60.65
240200100225*04MAY2007*31DEC9999*$77.85*$153.10
240200100226*25FEB2007*31DEC9999*$86.65*$183.90
240200100227*25MAY2007*31DEC9999*$75.90*$161.90
240200100230*18APR2007*31DEC9999*$6.65*$14.70
240200100232*18AUG2007*31DEC9999*$14.40*$28.60
240200100246*09JUL2007*31DEC9999*$7.90*$16.20
240200200007*24JAN2007*31DEC9999*$8.40*$84.20
240200200011*01DEC2007*31DEC9999*$13.00*$135.70
240200200013*31MAR2007*31DEC9999*$42.60*$426.20
240200200015*25MAR2007*31DEC9999*$12.25*$27.90
240200200020*25FEB2007*31DEC9999*$14.00*$150.10
240200200024*10APR2007*31DEC9999*$12.50*$125.40
240200200026*14JUL2007*31DEC9999*$41.65
240200200035*28AUG2007*31DEC9999*$39.65*$98.90
240200200039*05FEB2007*31DEC9999*$9.95*$24.10
240200200044*12JAN2007*31DEC9999*$19.60*$48.90
240200200061*11NOV2007*31DEC9999*$58.85*$147.10
240200200068*27OCT2007*31DEC9999*$159.15*$313.80
240200200081*13FEB2007*31DEC9999*$10.75*$107.30
240200200091*14FEB2007*31DEC9999*$72.60*$181.30
240300100028*10MAY2007*31DEC9999*$251.35*$533.20
240300100032*04JUN2007*31DEC9999*$315.15*$630.40
240300200018*19JUN2007*31DEC9999*$41.65*$91.50
240300200058*09FEB2007*31DEC9999*$41.70*$91.80
240300300024*25MAY2007*31DEC9999*$23.20*$54.60
240300300065*10MAY2007*31DEC9999*$146.35*$321.50
240300300070*06NOV2007*31DEC9999*$231.90*$509.80
240300300090*25APR2007*31DEC9999*$244.15*$536.30
240400200003*26NOV2007*31DEC9999*$3.00*$6.20
240400200012*09MAR2007*31DEC9999*$75.95*$175.70
240400200036*30APR2007*31DEC9999*$25.85*$57.10
240400200057*12MAY2007*31DEC9999*$65.85*$145.80
240400200097*10APR2007*31DEC9999*$124.20*$416.80
240400300013*02SEP2007*31DEC9999*$22.60*$54.30
240400300039*10APR2007*31DEC9999*$7.90*$19.60
240500100004*26MAR2007*31DEC9999*$28.00*$63.50
240500100015*25MAY2007*31DEC9999*$25.80*$58.10
240500100026*22OCT2007*31DEC9999*$24.50*$55.20
240500100029*16MAY2007*31DEC9999*$26.10*$58.90
240500100039*20APR2007*31DEC9999*$15.40*$34.50
240500100041*09FEB2007*31DEC9999*$51.70*$129.10
240500100043*30APR2007*31DEC9999*$8.85*$26.20
240500100057*17OCT2007*31DEC9999*$17.10*$38.40
240500100062*19JUL2007*31DEC9999*$24.05*$55.10
240500200003*08AUG2007*31DEC9999*$11.40*$23.80
240500200016*08AUG2007*31DEC9999*$14.50*$31.70
240500200042*06NOV2007*31DEC9999*$19.35*$40.60
240500200056*12JAN2007*31DEC9999*$11.75*$24.50
240500200081*08JAN2007*31DEC9999*$56.05*$134.50
240500200082*09MAR2007*31DEC9999*$16.45*$39.20
240500200093*01MAR2007*31DEC9999*$19.75*$41.70
240500200121*10APR2007*31DEC9999*$13.25*$27.80
240500200122*13FEB2007*31DEC9999*$11.50*$24.10
240500200130*01NOV2007*31DEC9999*$11.70
240600100010*12SEP2007*31DEC9999*$6.75*$16.70
240600100016*13MAR2007*31DEC9999*$22.10*$55.80
240600100080*16MAY2007*31DEC9999*$9.20*$30.40
240600100102*16MAR2007*31DEC9999*$19.70*$46.10
240600100181*14JUN2007*31DEC9999*$16.30*$37.40
240600100185*21MAR2007*31DEC9999*$15.60*$35.10
240700100001*21MAR2007*31DEC9999*$12.30*$23.60
240700100004*16MAY2007*31DEC9999*$13.75*$26.60
240700100017*01DEC2007*31DEC9999*$11.40*$26.60
240700200004*26NOV2007*31DEC9999*$2.20*$4.20
240700200007*24JUL2007*31DEC9999*$2.20*$5.10
240700200009*22APR2007*31DEC9999*$11.35
240700200010*21MAR2007*31DEC9999*$10.30*$26.90
240700200018*16NOV2007*31DEC9999*$10.30*$18.80
240700200021*25APR2007*31DEC9999*$10.55*$19.60
240700200024*16JAN2007*31DEC9999*$6.60*$16.70
240700400003*26NOV2007*31DEC9999*$5.60*$12.40
240700400017*03AUG2007*31DEC9999*$22.15*$47.30
240700400020*31MAR2007*31DEC9999*$41.30*$79.30
240700400031*01MAR2007*31DEC9999*$31.60
240800100074*26NOV2007*31DEC9999*$126.70*$316.60
240800200002*26APR2007*31DEC9999*$71.55*$178.88
240800200008*31MAR2007*31DEC9999*$68.20*$170.50
240800200009*04JUN2007*31DEC9999*$34.90*$87.20
240800200010*21FEB2007*31DEC9999*$49.95*$125.20
240800200020*14JUN2007*31DEC9999*$85.15*$187.20
240800200021*01MAR2007*31DEC9999*$42.45*$97.80
240800200030*28AUG2007*31DEC9999*$19.50*$49.50
240800200034*30MAY2007*31DEC9999*$35.70*$78.50
240800200037*25MAR2007*31DEC9999*$24.90*$57.50
240800200062*22OCT2007*31DEC9999*$16.75*$36.80
240800200063*24FEB2007*31DEC9999*$19.70*$43.40
;;;;
run;
data _null_;
infile datalines truncover length=length;
input;
file mydata(phone.csv) lrecl=256;
put _infile_ $varying. length;
datalines4;
James Kvarniq,(704) 293-8126,(701) 281-8923
Sandrina Stephano,(919) 871-7830
Cornelia Krahl,(212) 891-3241,(212) 233-5413
Karen Ballinger,(714) 344-4321
Elke Wallstab,(910) 763-5561,(910) 545-3421
;;;;
run;
data _null_;
infile datalines truncover length=length;
input;
file mydata(phone2.csv) lrecl=256;
put _infile_ $varying. length;
datalines4;
James Kvarniq,(704) 293-8126,(701) 281-8923
Sandrina Stephano,, (919) 271-4592
Cornelia Krahl,(212) 891-3241,(212) 233-5413
Karen Ballinger,, (714) 644-9090
Elke Wallstab,(910) 763-5561,(910) 545-3421
;;;;
run;
data _null_;
infile datalines truncover length=length;
input;
file mydata(sales.csv) lrecl=256;
put _infile_ $varying. length;
datalines4;
120102,Tom,Zhou,M,108255,Sales Manager,AU,11AUG1973,06/01/1993
120103,Wilson,Dawes,M,87975,Sales Manager,AU,22JAN1953,01/01/1978
120121,Irenie,Elvish,F,26600,Sales Rep. II,AU,02AUG1948,01/01/1978
120122,Christina,Ngan,F,27475,Sales Rep. II,AU,27JUL1958,07/01/1982
120123,Kimiko,Hotstone,F,26190,Sales Rep. I,AU,28SEP1968,10/01/1989
120124,Lucian,Daymond,M,26480,Sales Rep. I,AU,13MAY1963,03/01/1983
120125,Fong,Hofmeister,M,32040,Sales Rep. IV,AU,06DEC1958,03/01/1983
120126,Satyakam,Denny,M,26780,Sales Rep. II,AU,20SEP1992,08/01/2010
120127,Sharryn,Clarkson,F,28100,Sales Rep. II,AU,04JAN1983,11/01/2002
120128,Monica,Kletschkus,F,30890,Sales Rep. IV,AU,14JUL1990,11/01/2010
120129,Alvin,Roebuck,M,30070,Sales Rep. III,AU,22NOV1968,10/01/1989
120130,Kevin,Lyon,M,26955,Sales Rep. I,AU,14DEC1988,05/01/2010
120131,Marinus,Surawski,M,26910,Sales Rep. I,AU,25SEP1983,01/01/2007
120132,Fancine,Kaiser,F,28525,Sales Rep. III,AU,05APR1953,10/01/1982
120133,Petrea,Soltau,F,27440,Sales Rep. II,AU,22APR1990,10/01/2010
120134,Sian,Shannan,M,28015,Sales Rep. II,AU,06JUN1953,01/01/1978
120135,Alexei,Platts,M,32490,Sales Rep. IV,AU,26JAN1973,10/01/2001
120136,Atul,Leyden,M,26605,Sales Rep. I,AU,16SEP1983,02/01/2007
120137,Marina,Iyengar,F,29715,Sales Rep. III,AU,12MAR1983,03/01/2010
120138,Shani,Duckett,F,25795,Sales Rep. I,AU,11JUL1983,07/01/2010
120139,Fang,Wilson,F,26810,Sales Rep. II,AU,18AUG1990,09/01/2010
120140,Michael,Minas,M,26970,Sales Rep. I,AU,03AUG1992,10/01/2010
120141,Amanda,Liebman,F,27465,Sales Rep. II,AU,12MAR1992,05/01/2010
120142,Vincent,Eastley,M,29695,Sales Rep. III,AU,14JUN1990,07/01/2010
120143,Phu,Sloey,M,26790,Sales Rep. II,AU,17MAY1963,10/01/1986
120144,Viney,Barbis,M,30265,Sales Rep. III,AU,07MAR1990,10/01/2010
120145,Sandy,Aisbitt,M,26060,Sales Rep. II,AU,22JAN1968,06/01/1989
120146,Wendall,Cederlund,M,25985,Sales Rep. I,AU,02OCT1963,08/01/1984
120147,Skev,Rusli,F,26580,Sales Rep. II,AU,19JAN1992,10/01/2010
120148,Michael,Zubak,M,28480,Sales Rep. III,AU,13SEP1953,06/01/1982
120149,Judy,Chantharasy,F,26390,Sales Rep. I,AU,21NOV1978,01/01/1997
120150,John,Filo,M,29965,Sales Rep. III,AU,09JUL1958,08/01/1986
120151,Julianna,Phaiyakounh,F,26520,Sales Rep. II,AU,21NOV1948,01/01/1978
120152,Sean,Dives,M,26515,Sales Rep. I,AU,01MAY1983,04/01/2009
120153,Samantha,Waal,F,27260,Sales Rep. I,AU,07MAY1983,01/01/2002
120154,Caterina,Hayawardhana,F,30490,Sales Rep. III,AU,20JUL1948,01/01/1978
120155,Narelle,James,F,29990,Sales Rep. III,AU,22APR1988,04/01/2010
120156,Gerry,Snellings,F,26445,Sales Rep. I,AU,01SEP1992,03/01/2010
120157,Leonid,Karavdic,M,27860,Sales Rep. II,AU,21FEB1990,12/01/2010
120158,Daniel,Pilgrim,M,36605,Sales Rep. III,AU,14JUL1968,07/01/1991
120159,Lynelle,Phoumirath,F,30765,Sales Rep. IV,AU,24FEB1968,07/01/1990
120160,Chuck,Segrave,M,27115,Sales Rep. I,AU,09SEP1958,10/01/1978
120161,Rosette,Martines,F,30785,Sales Rep. III,AU,07MAR1992,10/01/2010
120162,Randal,Scordia,M,27215,Sales Rep. I,AU,05SEP1992,02/01/2010
120163,Brett,Magrath,M,26735,Sales Rep. II,AU,22MAY1968,01/01/1995
120164,Ranj,Stamalis,F,27450,Sales Rep. II,AU,26NOV1963,02/01/1986
120165,Tadashi,Pretorius,M,27050,Sales Rep. I,AU,19MAR1988,03/01/2010
120166,Fadi,Nowd,M,30660,Sales Rep. IV,AU,14JUN1948,01/01/1978
120167,Kimiko,Tilley,F,25185,Sales Rep. I,AU,04MAY1958,02/01/1978
120168,Selina,Barcoe,F,25275,Sales Rep. I,AU,24MAR1988,11/01/2010
120169,Cos,Tannous,M,28135,Sales Rep. III,AU,02JAN1988,05/01/2010
120170,Alban,Kingston,M,28830,Sales Rep. III,AU,25FEB1978,10/01/1996
120171,Alena,Moody,F,26205,Sales Rep. II,AU,19JUL1988,09/01/2010
120172,Edwin,Comber,M,28345,Sales Rep. III,AU,01APR1948,01/01/1978
120173,Hernani,Osborn,M,26715,Sales Rep. I,AU,23FEB1958,06/01/1981
120174,Doungkamol,Simms,F,26850,Sales Rep. I,AU,10JAN1948,01/01/1978
120175,Andrew,Conolly,M,25745,Sales Rep. I,AU,18AUG1992,10/01/2010
120176,Koavea,Pa,M,26095,Sales Rep. I,AU,09NOV1990,11/01/2010
120177,Franca,Kierce,F,28745,Sales Rep. III,AU,05APR1983,02/01/2002
120178,Billy,Plested,M,26165,Sales Rep. II,AU,23NOV1958,04/01/1978
120179,Matsuoka,Wills,M,28510,Sales Rep. III,AU,15MAR1978,01/01/2008
120180,Vino,George,M,26970,Sales Rep. II,AU,27JUN1958,12/01/1982
120198,Meera,Body,F,28025,Sales Rep. III,AU,21JAN1992,12/01/2010
120261,Harry,Highpoint,M,243190,Chief Sales Officer,US,21FEB1973,08/01/1991
121018,Julienne,Magolan,F,27560,Sales Rep. II,US,03JAN1948,01/01/1978
121019,Scott,Desanctis,M,31320,Sales Rep. IV,US,25JUN1990,06/01/2008
121020,Cherda,Ridley,F,31750,Sales Rep. IV,US,23FEB1988,05/01/2006
121021,Priscilla,Farren,F,32985,Sales Rep. IV,US,10DEC1978,03/01/1998
121022,Robert,Stevens,M,32210,Sales Rep. IV,US,28OCT1983,02/01/2006
121023,Shawn,Fuller,M,26010,Sales Rep. I,US,13MAR1968,05/01/1993
121024,Michael,Westlund,M,26600,Sales Rep. II,US,21SEP1988,05/01/2008
121025,Barnaby,Cassey,M,28295,Sales Rep. II,US,10OCT1953,09/01/1979
121026,Terrill,Jaime,M,31515,Sales Rep. IV,US,08NOV1990,04/01/2010
121027,Allan,Rudder,M,26165,Sales Rep. II,US,05MAY1968,12/01/1993
121028,William,Smades,M,26585,Sales Rep. I,US,27APR1992,11/01/2010
121029,Kuo-Chung,Mcelwee,M,27225,Sales Rep. I,US,22DEC1968,12/01/1993
121030,Jeryl,Areu,M,26745,Sales Rep. I,US,12NOV1983,02/01/2005
121031,Scott,Filan,M,28060,Sales Rep. III,US,09JUL1968,08/01/1989
121032,Nasim,Smith,M,31335,Sales Rep. IV,US,24FEB1992,03/01/2010
121033,Kristie,Snitzer,F,29775,Sales Rep. III,US,06NOV1990,06/01/2008
121034,John,Kirkman,M,27110,Sales Rep. II,US,23AUG1992,01/01/2011
121035,James,Blackley,M,26460,Sales Rep. II,US,25MAR1948,01/01/1978
121036,Teresa,Mesley,F,25965,Sales Rep. I,US,18JUL1992,10/01/2007
121037,Muthukumar,Miketa,M,28310,Sales Rep. III,US,12JUN1978,03/01/2006
121038,David,Anstey,M,25285,Sales Rep. I,US,13FEB1992,08/01/2010
121039,Donald,Washington,M,27460,Sales Rep. II,US,03JUN1958,05/01/1984
121040,Brienne,Darrohn,F,29525,Sales Rep. III,US,06JUL1963,11/01/1986
121041,Jaime,Wetherington,F,26120,Sales Rep. II,US,04FEB1948,01/01/1978
121042,Joseph,Robbin-Coker,M,28845,Sales Rep. III,US,04APR1983,11/01/2003
121043,Sigrid,Kagarise,F,28225,Sales Rep. II,US,09NOV1973,03/01/1996
121044,Ray,Abbott,M,25660,Sales Rep. I,US,11DEC1958,08/01/1979
121045,Cascile,Hampton,F,28560,Sales Rep. II,US,13JUN1968,01/01/1998
121046,Roger,Mandzak,M,25845,Sales Rep. I,US,07SEP1988,07/01/2010
121047,Karen,Grzebien,F,25820,Sales Rep. I,US,26NOV1983,09/01/2010
121048,Lawrie,Clark,F,26560,Sales Rep. I,US,24JUN1988,09/01/2010
121049,Perrior,Bataineh,F,26930,Sales Rep. I,US,14FEB1990,12/01/2010
121050,Patricia,Capristo-Abramczyk,F,26080,Sales Rep. II,US,12JAN1990,12/01/2010
121051,Glorina,Myers,F,26025,Sales Rep. I,US,02MAY1953,11/01/1982
121052,Richard,Fay,M,26900,Sales Rep. II,US,09JAN1990,11/01/2010
121053,Tywanna,Mcdade,F,29955,Sales Rep. III,US,23SEP1948,02/01/1978
121054,Daniel,Pulliam,M,29805,Sales Rep. III,US,12NOV1958,11/01/1980
121055,Clement,Davis,M,30185,Sales Rep. III,US,08JAN1992,08/01/2010
121056,Stacey,Lyszyk,F,28325,Sales Rep. II,US,05JUL1988,05/01/2007
121057,Tachaun,Voron,M,25125,Sales Rep. I,US,26DEC1963,12/01/1984
121058,Del,Kohake,M,26270,Sales Rep. I,US,12JUL1978,10/01/2006
121059,Jacqulin,Carhide,F,27425,Sales Rep. II,US,25OCT1963,04/01/1985
121060,Elizabeth,Spofford,F,28800,Sales Rep. III,US,08JUN1948,01/01/1978
121061,Lauris,Hassam,M,29815,Sales Rep. III,US,16JUL1958,07/01/1988
121062,Debra,Armant,F,30305,Sales Rep. IV,US,28OCT1988,08/01/2010
121063,Regi,Kinol,M,35990,Sales Rep. II,US,27JUL1983,08/01/2009
121064,Asishana,Polky,M,25110,Sales Rep. I,US,28JAN1968,09/01/1995
121065,Corneille,Malta,F,28040,Sales Rep. III,US,05SEP1988,04/01/2010
121066,Ceresh,Norman,F,27250,Sales Rep. II,US,23AUG1948,01/01/1978
121067,Jeanilla,Macnair,F,31865,Sales Rep. IV,US,18JAN1990,03/01/2010
121068,Salaheloin,Osuba,M,27550,Sales Rep. II,US,02DEC1973,09/01/1996
121069,Jason,Lapsley,M,26195,Sales Rep. II,US,19MAR1973,10/01/1994
121070,Agnieszka,Holthouse,F,29385,Sales Rep. III,US,04NOV1988,02/01/2010
121071,John,Hoppmann,M,28625,Sales Rep. III,US,10SEP1963,09/01/1981
121072,Christer,North,M,26105,Sales Rep. I,US,10JAN1983,09/01/2008
121073,Donald,Court,M,27100,Sales Rep. I,US,15MAY1953,01/01/1978
121074,Eric,Michonski,M,26990,Sales Rep. I,US,01MAR1963,10/01/1992
121075,Kasha,Sugg,F,28395,Sales Rep. II,US,23DEC1948,01/01/1978
121076,Micah,Cobb,M,26685,Sales Rep. II,US,09OCT1968,01/01/1987
121077,Bryce,Smotherly,M,28585,Sales Rep. III,US,05SEP1988,10/01/2010
121078,Lionel,Wende,M,27485,Sales Rep. I,US,01MAY1953,11/01/1982
121079,Azmi,Mees,M,25770,Sales Rep. I,US,03JUN1978,11/01/2001
121080,Kumar,Chinnis,M,32235,Sales Rep. I,US,24JAN1963,09/01/1991
121081,Susie,Knudson,F,30235,Sales Rep. III,US,28MAR1953,04/01/1980
121082,Richard,Debank,M,28510,Sales Rep. III,US,05JUL1953,10/01/1981
121083,Tingmei,Sutton,F,27245,Sales Rep. I,US,11MAR1963,03/01/1983
121084,Tulsidas,Ould,M,22710,Sales Rep. I,US,16AUG1968,01/01/1995
121085,Rebecca,Huslage,M,32235,Sales Rep. IV,US,12NOV1990,01/01/2011
121086,John-Michael,Plybon,M,26820,Sales Rep. I,US,16DEC1948,01/01/1978
121087,Virtina,O'Suilleabhain,F,28325,Sales Rep. II,US,07DEC1978,03/01/2003
121088,Momolu,Kernitzki,M,27240,Sales Rep. I,US,10JUN1992,01/01/2011
121089,Gregory,Sauder,M,28095,Sales Rep. II,US,21AUG1958,07/01/1978
121090,Betty,Klibbe,F,26600,Sales Rep. I,US,19JUN1958,02/01/1984
121091,Ernest,Kadiri,M,27325,Sales Rep. II,US,19FEB1973,01/01/1993
121092,Gynell,Pritt,F,25680,Sales Rep. I,US,08MAR1978,08/01/2006
121093,Carl,Vasconcellos,M,27410,Sales Rep. I,US,18JUL1968,01/01/1998
121094,Larry,Tate,M,26555,Sales Rep. I,US,07JAN1958,09/01/1982
121095,Sara,Kratzke,F,28010,Sales Rep. II,US,14APR1973,07/01/1995
121096,Robert,Newstead,M,26335,Sales Rep. I,US,18MAY1973,05/01/1999
121097,Willeta,Chernega,F,26830,Sales Rep. II,US,23OCT1978,10/01/1999
121098,Hal,Heatwole,M,27475,Sales Rep. I,US,22MAR1992,05/01/2010
121099,Royall,Mrvichin,M,32725,Sales Rep. IV,US,19MAR1983,05/01/2004
121100,Tzue-Ing,Cormell,M,28135,Sales Rep. II,US,27APR1953,04/01/1980
121101,Burnetta,Buckner,F,25390,Sales Rep. I,US,28AUG1990,11/01/2010
121102,Rocheal,Flammia,F,27115,Sales Rep. I,US,26JUN1983,06/01/2010
121103,Brian,Farnsworth,M,27260,Sales Rep. I,US,28APR1992,09/01/2010
121104,Leoma,Johnson,F,28315,Sales Rep. II,US,12NOV1968,04/01/1990
121105,Jessica,Savacool,F,29545,Sales Rep. III,US,09MAY1983,01/01/2007
121106,James,Hilburger,M,25880,Sales Rep. I,US,02FEB1973,02/01/2000
121107,Rose,Anger,F,31380,Sales Rep. IV,US,24APR1990,07/01/2010
121108,Libby,Levi,F,25930,Sales Rep. I,US,04JUL1992,11/01/2010
121109,Harold,Boulus,M,26035,Sales Rep. I,US,05NOV1973,05/01/1994
121135,Tammy,Ruta,F,27010,Sales Rep. I,US,07JUN1958,08/01/1978
121136,Lesia,Galarneau,F,27460,Sales Rep. I,US,15JUL1978,12/01/2006
121137,Michael. R.,Boocks,M,27055,Sales Rep. I,US,18JAN1992,04/01/2010
121138,Hershell,Tolley,M,27265,Sales Rep. I,US,28FEB1953,01/01/1978
121139,Diosdado,Mckee,F,27700,Sales Rep. II,US,19AUG1963,07/01/1991
121140,Saunders,Briggi,M,26335,Sales Rep. I,US,23JAN1983,04/01/2005
121143,Louis,Favaron,M,95090,Senior Sales Manager,US,26NOV1973,07/01/2001
121144,Renee,Capachietti,F,83505,Sales Manager,US,28JUN1968,11/01/1995
121145,Dennis,Lansberry,M,84260,Sales Manager,US,22NOV1953,04/01/1980
;;;;
run;
data _null_;
infile datalines truncover length=length;
input;
file mydata(sales3inv.csv) lrecl=256;
put _infile_ $varying. length;
datalines4;
120102,Tom,Zhou,Manager,108255,AU
120103,Wilson,Dawes,Manager,87975,AU
120121,Irenie,Elvish,Rep. II,26600,AU
120122,Christina,Ngan,Rep. II,n/a,AU
120123,Kimiko,Hotstone,Rep. I,26190,AU
120124,Lucian,Daymond,Rep. I,26480,12
120125,Fong,Hofmeister,Rep. IV,32040,AU
120126,Satyakam,Denny,Rep. II,26780,AU
120127,Sharryn,Clarkson,Rep. II,28100,AU
120128,Monica,Kletschkus,Rep. IV,30890,AU
120129,Alvin,Roebuck,Rep. III,30070,AU
120130,Kevin,Lyon,Rep. I,26955,AU
120131,Marinus,Surawski,Rep. I,26910,AU
120132,Fancine,Kaiser,Rep. III,28525,AU
120133,Petrea,Soltau,Rep. II,27440,AU
120134,Sian,Shannan,Rep. II,28015,AU
120135,Alexei,Platts,Rep. IV,32490,AU
120136,Atul,Leyden,Rep. I,26605,AU
120137,Marina,Iyengar,Rep. III,29715,AU
120138,Shani,Duckett,Rep. I,25795,AU
120139,Fang,Wilson,Rep. II,26810,AU
120140,Michael,Minas,Rep. I,26970,AU
120141,Amanda,Liebman,Rep. II,n/a,AU
120142,Vincent,Eastley,Rep. III,29695,AU
120143,Phu,Sloey,Rep. II,26790,AU
120144,Viney,Barbis,Rep. III,30265,AU
120145,Sandy,Aisbitt,Rep. II,26060,AU
120146,Wendall,Cederlund,Rep. I,25985,AU
120147,Skev,Rusli,Rep. II,28000,AU
120148,Michael,Zubak,Rep. III,28480,AU
120149,Judy,Chantharasy,Rep. I,26390,AU
120150,John,Filo,Rep. III,29965,AU
120151,Julianna,Phaiyakounh,Rep. II,26520,AU
120152,Sean,Dives,Rep. I,26515,AU
120153,Samantha,Waal,Rep. I,27260,AU
120154,Caterina,Hayawardhana,Rep. III,30490,AU
120155,Narelle,James,Rep. III,29990,AU
120156,Gerry,Snellings,Rep. I,26445,AU
120157,Leonid,Karavdic,Rep. II,27860,AU
120158,Daniel,Pilgrim,Rep. III,36605,AU
120159,Lynelle,Phoumirath,Rep. IV,30765,AU
120160,Chuck,Segrave,Rep. I,27115,AU
120161,Rosette,Martines,Rep. III,n/a,AU
120162,Randal,Scordia,Rep. I,27215,AU
120163,Brett,Magrath,Rep. II,26735,AU
120164,Ranj,Stamalis,Rep. II,27450,AU
120165,Tadashi,Pretorius,Rep. I,.,AU
120166,Fadi,Nowd,Rep. IV,30660,AU
120167,Kimiko,Tilley,Rep. I,25185,AU
120168,Selina,Barcoe,Rep. I,25275,AU
;;;;
run;
data _null_;
infile datalines truncover length=length;
input;
file mydata(custca.csv) lrecl=256;
put _infile_ $varying. length;
datalines4;
Bill,Cuddy,11171,M,16/10/1986,21,15-30 years
Susan,Krasowski,17023,F,09/07/1959,48,46-60 years
Andreas,Rennie,26148,M,18/07/1934,73,61-75 years
Lauren,Krasowski,46966,F,24/10/1986,21,15-30 years
Lauren,Marx,54655,F,18/08/1969,38,31-45 years
Tommy,Mcdonald,70046,M,20/01/1959,48,46-60 years
Colin,Byarley,70059,M,20/01/1934,73,61-75 years
Lera,Knott,70079,F,11/07/1986,21,15-30 years
Wilma,Yeargan,70100,F,23/06/1984,23,15-30 years
Patrick,Leach,70108,M,14/04/1939,68,61-75 years
Portia,Reynoso,70165,F,11/02/1964,43,31-45 years
Soberina,Berent,70187,F,27/09/1986,21,15-30 years
Angel,Borwick,70201,F,19/12/1969,38,31-45 years
Alex,Santinello,70210,M,22/04/1986,21,15-30 years
Kenan,Talarr,70221,M,10/02/1964,43,31-45 years
;;;;
run;
data _null_;
infile datalines truncover length=length;
input;
file mydata(customers.csv) lrecl=256;
put _infile_ $varying. length;
datalines4;
Customer Type Definitions

"Obs","Customer_Type_ID","Customer_Type","Customer_Group_ID","Customer_Group"
"1",1010,"Orion Club members inactive",10,"Orion Club members"
"2",1020,"Orion Club members low activity",10,"Orion Club members"
"3",1030,"Orion  Club members medium activity",10,"Orion Club members"
"4",1040,"Orion  Club members high activity",10,"Orion Club members"
"5",2010,"Orion Club Gold members low activity",20,"Orion Club Gold members"
"6",2020,"Orion Club Gold members medium activity",20,"Orion Club Gold members"
"7",2030,"Orion Club Gold members high activity",20,"Orion Club Gold members"
"8",3010,"Internet/Catalog Customers",30,"Internet/Catalog Customers"

Country Definitions

"Obs","Country","Country_Name","Population","Country_ID","Continent_ID","Country_FormerName"
"1","AU","Australia",20,000,000,160,96,""
"2","CA","Canada",.,260,91,""
"3","DE","Germany",80,000,000,394,93,"East/West Germany"
"4","IL","Israel",5,000,000,475,95,""
"5","TR","Turkey",70,000,000,905,95,""
"6","US","United States",280,000,000,926,91,""
"7","ZA","South Africa",43,000,000,801,94,""

;;;;
run;
data _null_;
infile datalines truncover length=length;
input;
file mydata(donation.csv) lrecl=256;
put _infile_ $varying. length;
datalines4;
120265,,,,25
120267,15,15,15,15
120269,20,20,20,20
120270,20,10,5
120271,20,20,20,20
120272,10,10,10,10
120275,15,15,15,15
120660,25,25,25,25
120662,10,,5,5
120663,,,5
120668,10,10,10,10
120669,15,15,15,15
120671,20,20,20,20
120677,25,25,25,25
120678,10,10
120679,,20,5,15
120680,15,15,15,15
120681,10,10,5,15
120684,5,5,5,5
120686,15,15,15,15
120689,15,15,15,15
120713,15,15,15,15
120715,10,10,10,10
120721,5,5,5,5
120726,10,10,10,10
120734,,,15,10
120736,25,,,20
120740,15,15,15,15
120742,,,10,10
120745,15,15,15,15
120746,20,20,20,20
120747,20,20,20,20
120748,20,20,20,20
120752,10
120753,25,25,25,25
120754,10,10,10,10
120757,,,15,5
120759,15,20,5
120760,,15,20
120761,10,10,10,10
120762,,,5,5
120764,15,15,15,15
120766,25,25,25,25
120767,15,15,15,15
120768,20,20,20
120771,20,20,20,20
120773,10,10,10,10
120777,5,15,5,15
120778,15,15,15,15
120783,20,20,20,20
120789,5
120790,20,20,20,20
120791,30,30,30,30
120792,20,20,20,20
120793,15,15,15,15
120794,,,20,20
120799,5,5,5,5
120801,20,20,20,20
120807,20,20,20,20
120808,,,10
120813,20,20,20
120814,25,25,25,25
120815,15,15,15,15
120994,5,5,10,10
120995,15,15,15,15
120996,15,15,15,15
120999,5,5,5,5
121000,20,20,20,20
121002,10,10,10,10
121008,10,10,10,10
121009,15,15,15,15
121010,10,10,10,10
121012,,,5,5
121013,10,5,,5
121014,15,15,15,15
121018,10
121022,15,15,15,15
121025,10,10,10,10
121030,10,10,10,10
121031,10,10,10,10
121033,15,15,15,15
121036,,,,10
121037,10,10,10,10
121039,10,10,10,10
121040,10,10,10,10
121044,10,10,10,10
121053,5,,5
121054,15,15,15,15
121056,,10,10,10
121058,10,10,10,10
121061,10,10,10,10
121062,15,15,15,15
121063,15,15,15,15
121065,10,10,10,10
121069,10,10,10,10
121074,10,10,10,10
121077,15,15,15,15
121078,15,15,15,15
121079,10,10,10,10
121083,15,15,15,15
121086,,10,10
121089,15,15,15,15
121093,5
121097,10,10,10,10
121100,5,5,5,5
121101,5,,10,5
121102,5,5,5,5
121103,10,10,10,10
121105,15,15,15,15
121125,10
121126,10
121128,10
121129,10
121131,10
121132,10
121133,5
121134,5
121136,5,5,5,5
121138,10,10,10,10
121140,10,10,10,10
121142,35,35,35,35
121143,35,35,35,35
121145,35,35,35,35
121147,10,10,10,10
;;;;
run;
data _null_;
infile datalines truncover length=length;
input;
file mydata(newemps.csv) lrecl=256;
put _infile_ $varying. length;
datalines4;
Satyakam,Denny,Sales Rep. II,26780
Monica,Kletschkus,Sales Rep. IV,30890
Kevin,Lyon,Sales Rep. I,26955
Petrea,Soltau,Sales Rep. II,27440
Marina,Iyengar,Sales Rep. III,29715
Shani,Duckett,Sales Rep. I,25795
Fang,Wilson,Sales Rep. II,26810
Michael,Minas,Sales Rep. I,26970
Amanda,Liebman,Sales Rep. II,27465
Vincent,Eastley,Sales Rep. III,29695
Viney,Barbis,Sales Rep. III,30265
Skev,Rusli,Sales Rep. II,26580
Narelle,James,Sales Rep. III,29990
Gerry,Snellings,Sales Rep. I,26445
Leonid,Karavdic,Sales Rep. II,27860
Rosette,Martines,Sales Rep. III,30785
Randal,Scordia,Sales Rep. I,27215
Tadashi,Pretorius,Sales Rep. I,27050
Selina,Barcoe,Sales Rep. I,25275
Cos,Tannous,Sales Rep. III,28135
Alena,Moody,Sales Rep. II,26205
Andrew,Conolly,Sales Rep. I,25745
Koavea,Pa,Sales Rep. I,26095
Lorian,Cantatore,Temp. Sales Rep.,27065
Geok-Seng,Barreto,Temp. Sales Rep.,25020
Brig,Blanton,Temp. Sales Rep.,26910
Ari,Moore,Temp. Sales Rep.,25820
Sharon,Bahlman,Temp. Sales Rep.,25080
Merryn,Quinby,Temp. Sales Rep.,26795
Reyne,Catenacci,Temp. Sales Rep.,26665
Shanmuganath,Baran,Temp. Sales Rep.,26715
Mihailo,Lachlan,Temp. Sales Rep.,25180
Meera,Body,Sales Rep. III,28025
Terrill,Jaime,Sales Rep. IV,31515
William,Smades,Sales Rep. I,26585
Nasim,Smith,Sales Rep. IV,31335
David,Anstey,Sales Rep. I,25285
Roger,Mandzak,Sales Rep. I,25845
Karen,Grzebien,Sales Rep. I,25820
Lawrie,Clark,Sales Rep. I,26560
Perrior,Bataineh,Sales Rep. I,26930
Patricia,Capristo-Abramczyk,Sales Rep. II,26080
Richard,Fay,Sales Rep. II,26900
Clement,Davis,Sales Rep. III,30185
Debra,Armant,Sales Rep. IV,30305
Corneille,Malta,Sales Rep. III,28040
Jeanilla,Macnair,Sales Rep. IV,31865
Agnieszka,Holthouse,Sales Rep. III,29385
Bryce,Smotherly,Sales Rep. III,28585
Hal,Heatwole,Sales Rep. I,27475
Burnetta,Buckner,Sales Rep. I,25390
Rocheal,Flammia,Sales Rep. I,27115
Brian,Farnsworth,Sales Rep. I,27260
Rose,Anger,Sales Rep. IV,31380
Libby,Levi,Sales Rep. I,25930
Albert,Knapp,Temp. Sales Rep.,26370
Salim,Maholo,Temp. Sales Rep.,26885
Lee,Stouchko,Temp. Sales Rep.,26855
Karen,Costine,Temp. Sales Rep.,27480
Okema,Whipkey,Temp. Sales Rep.,26515
Aquilla,O'Carroll,Temp. Sales Rep.,26430
Mary,Bond-Teague,Temp. Sales Rep.,26670
Teresa,Sergi,Temp. Sales Rep.,26640
Paul,Lawson,Temp. Sales Rep.,25725
Bruce,Armogida,Temp. Sales Rep.,25205
Susan,Labach,Temp. Sales Rep.,25020
Halouise,Cassone,Temp. Sales Rep.,25735
Stancey,Scarbrough,Temp. Sales Rep.,26265
Randy,Helyar,Temp. Sales Rep.,26410
Deginald,Gonzalez,Temp. Sales Rep.,26925
Michael. R.,Boocks,Sales Rep. I,27055
;;;;
run;
data _null_;
infile datalines truncover length=length;
input;
file mydata(nonsales.csv) lrecl=256;
put _infile_ $varying. length;
datalines4;
120101,Patrick,Lu,M,163040,Director,AU,18AUG1980,01JUL2007
120104,Kareen,Billington,F,46230,Administration Manager,au,11MAY1958,01JAN1985
120105,Liz,Povey,F,27110,Secretary I,AU,21DEC1978,01MAY2003
120106,John,Hornsey,M,unknown,Office Assistant II,AU,23DEC1948,01JAN1978
120107,Sherie,Sheedy,F,30475,Office Assistant III,AU,01FEB1982,21JAN1957
120108,Gladys,Gromek,F,27660,Warehouse Assistant II,AU,23FEB1988,01AUG2010
120108,Gabriele,Baker,F,26495,Warehouse Assistant I,AU,15DEC1990,01OCT2010
120110,Dennis,Entwisle,M,28615,Warehouse Assistant III,AU,20NOV1953,01NOV1983
120111,Ubaldo,Spillane,M,26895,Security Guard II,AU,23JUL1953,99NOV1978
120112,Ellis,Glattback,F,26550, ,AU,17FEB1973,01JUL1994
120113,Riu,Horsey,F,26870,Security Guard II,AU,10MAY1948,01JAN1978
120114,Jeannette,Buddery,G,31285,Security Manager,AU,08FEB1948,01JAN1978
120115,Hugh,Nichollas,M,2650,Service Assistant I,AU,08MAY1988,01AUG2009
.,Austen,Ralston,M,29250,Service Assistant II,AU,13JUN1963,01FEB1984
120117,Bill,Mccleary,M,31670,Cabinet Maker III,AU,11SEP1968,01APR1990
120118,Darshi,Hartshorn,M,28090,Cabinet Maker II,AU,03JUN1963,01JUL1988
120119,Lal,Elleman,M,30255,Electrician IV,AU,21DEC1973,01JAN2002
120120,Krishna,Peiris,F,27645,Electrician II,AU,05MAY1948,01JAN1978
120190,Ivor,Czernezkyi,M,24100,Trainee,AU,05DEC1988,01NOV2008
120191,Jannene,Graham-Rowe,F,2401,Trainee,AU,17JAN1963,01JAN2007
120192,Anthony,Nichollas,M,26185,Trainee,AU,08MAY1988,01JUN2009
120193,Russell,Streit,M,24515,Trainee,AU,06DEC1988,01SEP2009
120194,Reece,Harwood,M,25985,Trainee,AU,23SEP1988,01FEB2009
120195,Jina,Fiocca,F,24990,Trainee,AU,25DEC1988,01JUL2010
120196,Merle,Hieds,F,24025,Trainee,AU,31JAN1988,01JAN2007
120197,Kerrin,Dillin,F,25580,Trainee,AU,08AUG1958,01JAN2007
120259,Anthony,Miller,M,433800,Chief Executive Officer,US,25JAN1968,01SEP1993
120260,Christine,Fletcher,F,207885,Chief Marketing Officer,US,02DEC1968,01NOV1988
120262,Max,Crown,M,268455,Chief Financial Officer,US,21OCT1973,01SEP1992
120263,Bobby,Cleverley,M,42605,Financial Analyst III,US,10FEB1968,01OCT1987
120264,Latonya,Croome,F,37510,Financial Analyst II,US,23JAN1988,01DEC2010
120265,Wanda,Branly,F,51950,Auditor III,US,04OCT1948,01JAN1978
120266,Bao,Krafve,F,31750,Secretary IV,US,01JUL1973,01APR1993
120267,Belanda,Rink,F,28585,Secretary III,US,02JUN1990,01FEB2007
120268,Jacques,Villeneuve,M,76105,Senior Strategist,US,01SEP1978,01MAY2001
120269,Shrimatee,Kagolanu,F,52540,Strategist II,US,27SEP1948,01JAN1978
120270,Grezegorz,Nuss,M,48435,Concession Director,US,25MAR1958,01JAN1978
120271,Kenisha,Winge,F,43635,Concession Manager,US,06AUG1968,01SEP1990
120272,Febin,Flow,M,34390,Concession Consultant II,US,15MAR1948,01JAN1978
120273,Doris,Antonini,F,28455,Concession Assistant III,US,07JUN1990,01MAR2010
120274,Angela,Landry,F,26840,Concession Assistant I,US,09JAN1968,01DEC1997
120275,Brandy,Lattimer,F,32195,Concession Consultant II,US,27DEC1963,01OCT1988
120276,Nicholas,Plybon,M,28090,Concession Assistant II,US,16DEC1948,01JAN1978
120277,Wesley,Shirts,F,32645,Concession Consultant I,US,16AUG1992,01MAY2008
120278,Binit,Jongleux,M,27685,Concession Assistant III,US,17DEC1990,01AUG2010
120279,Kareema,Dunlap,F,32925,Concession Consultant I,US,20OCT1973,01MAY2000
120280,Jaime,Laurer,F,36930,Concession Consultant III,US,11NOV1968,01MAY1992
120656,Salley,Amos,F,42570,Logistics Coordinator II,US,28JAN1978,01MAR2003
120657,Theresa,Weisbarth,F,36110,Logistics Coordinator I,US,07JAN1968,01NOV1994
120658,Kenneth,Kennedy,M,42485,Logistics Coordinator II,US,20DEC1958,01FEB1985
120659,Jay,Havasy,M,161290,Director,US,16JUL1953,01JAN1978
120660,Robert,Smith,M,61125,Logistics Manager,US,06JUN1982,01MAR2009
120661,Cynthia,Racine,F,85495,Senior Logistics Manager,US,27NOV1958,01JAN1988
120662,Lemonica,Burroughs,M,27045,Secretary II,US,25JUN1992,01NOV2010
120663,Anglar,Kornblith,F,56385,Pricing Manager,US,26MAR1973,01MAR2001
120664,Brock,Senchak,M,47605,Pricing Specialist,US,18FEB1958,01MAY1979
120665,Jill,Leacock,F,80070,Senior Logistics Manager,US,24OCT1978,01MAR2006
120666,John,Onuscheck,M,64555,Logistics Manager,US,22JUN1973,01DEC1995
120667,Edwin,Droste,M,29980,Office Assistant III,US,21JUN1983,01FEB2010
120668,Thyland,Dolan,M,47785,Services Manager,US,23OCT1953,01DEC1982
120669,Ronald,Hill,M,36370,Services Assistant IV,US,23JUL1948,01JAN1978
120670,Odudu,Zisek,M,65420,Shipping Manager,US,26MAR1948,01JAN1978
120671,William,Latty,M,40080,Shipping Agent III,US,27MAY1958,01FEB1987
120672,Verne,Guscott,M,60980,Shipping Manager,AU,25AUG1968,01MAR1996
120673,Pearl,Santomaggio,F,35935,Shipping Agent II,AU,27JUN1948,01JAN1978
120677,Suad,Sochacki,F,65555,Shipping Manager,US,02SEP1973,01FEB1997
120678,Lucretta,Octetree,F,40035,Shipping Agent III,US,12JAN1953,01MAY1982
120679,Chrisy,Cutucache,F,46190,Shipping Manager,US,07NOV1980,01JUL2006
120680,Raymondria,Desaulniers,F,27295,Shipping Agent I,US,25AUG1973,01MAY1995
120681,Elery,Tolbet,M,30950,Shipping Agent II,US,12AUG1983,01APR2008
120682,Barbara,Kennedy,F,26760,Shipping Agent I,US,20DEC1973,01APR2000
120683,Deven,Kochneff,F,36315,Shipping Agent III,US,12NOV1958,01JAN1978
120684,Suzon,Woyach,F,26960,Warehouse Assistant I,US,26NOV1990,01NOV2010
120685,Anita,Howard,F,25130,Warehouse Assistant I,US,01MAR1988,01NOV2010
120686,Berether,Tucker,F,26690,Warehouse Assistant II,US,07MAY1948,01JAN1978
120687,Freda,Dannin,F,26800,Warehouse Assistant I,US,25MAY1983,01AUG2008
120688,Lisa,Carcaterra,F,25905,Warehouse Assistant I,US,25DEC1953,01JAN1978
120689,Katherine,Pongor,F,27780,Warehouse Assistant III,US,20JUL1983,01JUL2010
120690,Taronda,Langston,F,25185,Warehouse Assistant I,US,17JAN1988,01DEC2008
120691,Sek,Habres,M,49240,Shipping Manager,AU,15SEP1948,01JAN1978
120692,Rit,Tregonning,M,32485,Shipping Agent II,AU,22NOV1958,01APR1986
120693,Diaz,Tellam,M,26625,Shipping Agent I,AU,02MAY1963,01JUN1983
120694,Sharon,Leazer,F,27365,Warehouse Assistant I,AU,16AUG1992,01APR2010
120695,Trent,Moffat,M,28180,Warehouse Assistant II,au,13JUL1968,01JUL1993
120696,Peter,Pettolino,M,26615,Warehouse Assistant I,AU,14AUG1958,01MAR1978
120697,Madelaine,Fouche,F,29625,Warehouse Assistant IV,AU,27JUN1992,01JUN2010
120698,Geoff,Kistanna,M,26160,Warehouse Assistant I,au,17MAY1958,01AUG1980
120710,Timothy,Baltzell,M,54840,Business Analyst II,US,24NOV1978,01JAN2002
120711,Gloria,Drew,F,59130,Business Analyst III,US,28MAY1973,01MAR1998
120712,Elisabeth,Motashaw,F,63640,Marketing Manager,US,12JUN1953,01JAN1978
120713,Carston,Campbell,M,31630,Marketing Assistant III,US,23FEB1948,01JAN1978
120714,Robert,Dinley,M,62625,Marketing Manager,US,04APR1980,01SEP2002
120715,Angelia,Neal,F,28535,Marketing Assistant II,US,12JUN1983,01FEB2009
120716,Kenneth,Juif,M,53015,Events Manager,US,24JUL1978,01AUG1997
120717,Jon,Sleva,M,30155,Marketing Assistant II,US,09JAN1958,01AUG1985
120718,Charles,Hennington,M,29190,Marketing Assistant II,US,08JUL1968,01MAY1994
120719,Roya,Ridley,F,87420,Senior Marketing Manager,US,22JAN1973,01FEB2000
120720,John,Spingola,M,46580,Corp. Comm. Manager,US,07MAY1968,01APR1996
120721,Dlutomi,Knust,F,29870,Marketing Assistant II,US,21OCT1948,01JAN1978
120722,Ishmar,Sheffield,M,32460,Corp. Comm. Specialist I,US,22SEP1963,01OCT1989
120723,Deanna,Olsen, ,33950,Corp. Comm. Specialist II,US,10AUG1953,01JAN1978
120724,Hampie,Brown,M,63705,Marketing Manager,US,27JAN1968,01APR1996
120725,Robert,Whitlock,M,29970,Marketing Assistant II,US,24OCT1983,01JUN2008
120726,Lutezenia,Obermeyer,F,27380,Marketing Assistant I,US,01JUL1992,01SEP2010
120727,Donald,Marples,M,34925,Marketing Assistant IV,US,25JUN1968,01JUN1990
120728,Kathryn,Borge,F,35070,Purchasing Agent II,US,04DEC1958,01JAN1986
120729,Kimberly,Howell,F,31495,Purchasing Agent I,US,03APR1992,25APR2007
120730,Woodson,Burt,M,30195,Purchasing Agent I,US,16DEC1968,01OCT1992
120731,Robert,Lerew,M,34150,Purchasing Agent II,US,15MAR1963,01SEP1987
120732,Kent,Uenking,M,35870,Purchasing Agent III,US,14AUG1953,01JAN1978
120733,Michael,Bezinque,M,31760,Purchasing Agent I,US,03APR1968,01NOV1994
120734,Svein,Saylor,M,34270,Purchasing Agent III,US,26APR1983,01MAR2010
120735,Brenda,Bilobran,F,61985,Purchasing Manager,US,13JUN1958,01MAY1982
120736,Parie,Kiemle,F,63985,Purchasing Manager,US,27NOV1968,01OCT1995
120737,Brenner,Toner,F,63605,Purchasing Manager,US,28MAR1963,01NOV1992
120738,Huilun,Swaiti,F,30025,Purchasing Agent I,US,06JUL1953,01JAN1978
120739,Bryon,Cooper,M,36970,Purchasing Agent III,US,07AUG1990,01MAY2010
120740,Lisa,Koonce,F,35110,Purchasing Agent II,US,19OCT1953,01JAN1978
120741,Keisha,Court,F,36365,Purchasing Agent III,US,28NOV1948,01JAN1978
120742,Ronald,Shewitz,M,31020,Purchasing Agent I,US,04FEB1948,01JAN1978
120743,Chimena,Harrison,F,34620,Purchasing Agent II,US,01FEB1973,01JUN2001
120744,Alden,Feigenbaum,F,33490,Purchasing Agent II,US,19JUN1992,01JUL2008
120745,Barbara,Harvill,F,31365,Purchasing Agent I,US,05JUL1990,01JUN2010
120746,Kevie,Kimmerle,M,46090,Account Manager,US,10OCT1978,01APR2006
120747,Zashia,Farthing,F,43590,Financial Controller I,us,20JUN1978,01AUG1999
120748,Nahliah,Post,F,48380,Building Admin. Manager,US,05JUL1980,01MAR2007
120749,Kevin,Niemann,M,26545,Office Assistant II,US,20SEP1978,01OCT2000
120750,Connie,Woods,F,32675,Accountant I,US,07JUN1958,01FEB1983
120751,Azavi0us,Mea,M,58200,Finance Manager,US,05APR1968,01AUG1992
120752,Jean-Claude,Van Damme,M,30590,Accountant I,US,17FEB1958,01AUG1979
120753,Ralph,Ferrari,M,47000,Financial Controller II,US,15JUN1980,01AUG1998
120754,John,Atkins,M,34760,Accountant II,US,02JUN1992,01MAY2010
120755,Elizabeth,Thoits,F,36440,Accountant III,US,24AUG1968,01AUG1987
120756,Wendy,Asta,F,52295,Financial Controller III,US,20FEB1978,01JUL2000
120757,Paul,Knopfmacher,M,38545,Accountant III,US,18MAR1948,01JAN1978
120758,Sal,Voltz,M,34040,Accountant II,US,22OCT1968,01OCT1996
120759,Nishan,Apr,M,36230,Accountant II,US,04NOV1968,01JAN1987
120760,Pamela,Miller,F,53475,Financial Controller III,US,06JAN1973,01MAY1997
120761,Tameaka,Akinfolarin,F,30960,Accountant I,US,28DEC1990,01JUL2010
120762,Marvin,Leone,M,30625,Accountant I,US,02NOV1983,01MAR2010
120763,Ramond,Capps,M,45100,Auditor II,US,26OCT1948,01JAN1978
120764,Steven,Worton,M,40450,Auditor I,US,22DEC1978,01DEC2006
120765,Nikeisha,Kokoszka,F,51950,Financial Controller III,US,17DEC1958,01JAN1978
120766,Janelle,Kempster,F,53400,Auditing Manager,US,05NOV1978,01MAR2005
120767,Legette,Terricciano,M,32965,Accountant I,US,09MAY1968,01APR1991
120768,Roland,Rayburn,M,44955,Accountant II,US,22JUL1958,01OCT1985
120769,Abelino,Lightbourne,M,47990,Auditor II,US,24MAY1978,01APR2000
120770,Julia,Pascoe,F,43930,Auditor I,US,24APR1968,01APR1991
120771,Wei,Xing Moore,F,36435,Accountant II,US,04AUG1958,01DEC1980
120772,Erich,Overdorff,M,27365,HR Generalist I,US,08APR1992,01AUG2010
120773,Entrisse,Horne,F,27370,HR Generalist II,US,22FEB1963,01APR1985
120774,Sue,El-Amin,F,45155,HR Specialist II,US,17SEP1982,01MAR2006
120775,Tanya,Thompson,F,41580,HR Analyst II,US,11FEB1973,01NOV2000
120776,Ratna,Silverthorne,M,32580,HR Generalist III,US,21SEP1983,01APR2005
120777,Kary,Sacher,M,40955,HR Specialist I,US,26MAR1973,01MAY1998
120778,Angela,Gardner,F,43650,HR Specialist I,US,08DEC1958,01FEB1988
120779,Jennifer,Eggleston,F,43690,HR Analyst II,US,04OCT1980,01MAR2001
120780,Kimberly,Walcott,F,62995,HR Manager,US,01SEP1973,01OCT1995
120781,Sarah,Sitnik,F,32620,Recruiter I,US,23JAN1992,01DEC2008
120782,Rilma,Sines,F,63915,Recruitment Manager,US,29NOV1978,01JUN2003
120783,Davis,Karp,M,42975,Recruiter III,US,20DEC1978,01JAN2000
120784,Jennifer,Pinol,F,35715,Recruiter II,US,24APR1983,01SEP2008
120785,Damesha,Donnell,F,48335,Training Manager,US,21JAN1973,01JUN1997
120786,Chris-Anne,Delafuente,F,32650,Trainer I,US,18MAR1948,01JAN1978
120787,Carl,Peachey,M,34000,Trainer II,US,22AUG1973,01JAN2000
120788,Smitty,Lisowe,M,33530,Trainer I,US,13JUN1973,01DEC1998
120789,Julius,Denhollem,M,39330,Trainer III,US,14JUL1968,01DEC1986
120790,Tara,O'Toole,F,53740,ETL Specialist II,US,07DEC1978,01MAY1999
120791,Richard,Chiseloff,M,61115,Systems Architect IV,US,26JUL1968,01OCT1990
120792,Omeba,Horne,F,54760,Systems Architect II,US,19MAR1980,01AUG2001
120793,William,Mamo,M,47155,ETL Specialist I,US,08AUG1973,01JUN2000
120794,Samantha,Cross,F,51265,Applications Developer IV,US,31DEC1982,01JUL2007
120795,David,Deacon,M,49105,Applications Developer II,US,16JAN1973,01AUG1992
120796,Philip,Kellis,M,47030,Applications Developer II,US,12MAY1958,01MAR1987
120797,Sherrie,Jones,F,43385,Applications Developer I,US,17NOV1958,01DEC1981
120798,Elizabeth,Ardskin,F,80755,Senior Project Manager,US,23JUN1963,01JAN1991
120799,Jeffery,Stefandonovan,M,29070,Office Assistant III,US,23MAR1983,01NOV2002
120800,Fred,Benyami,M,80210,IS Director,US,20DEC1978,01JUN2001
120801,Kathryn,Kennedy,F,40040,Applications Developer I,US,06MAR1978,01JUL2003
120802,U'Vonda,Parker,F,65125,Applications Developer IV,US,11MAY1953,01JAN1982
120803,Victor,Droste,M,43630,Applications Developer I,US,06JUN1958,01JAN1982
120804,Ahmed,Zied,M,55400,IS Administrator III,US,11FEB1948,01JAN1978
120805,Robert,Walker,M,58530,BI Administrator IV,US,27JUN1982,01APR2004
120806,Lorna,Ousley,F,47285,IS Administrator II,US,25FEB1978,01FEB1996
120807,Gerlinde,Peppers,F,43325,IS Administrator I,US,14DEC1963,01JAN1986
120808,Marcel,Dupree,M,44425,BI Specialist II,US,01JUN1968,01JUN1988
120809,Chiorene,Marion,F,47155,BI Architect II,US,14JAN1948,01JAN1978
120810,Loyal,Esguerra,M,58375,IS Architect III,US,04OCT1958,01MAR1984
120811,Dale,Bergeron-Jeter,M,43985,Applications Developer I,US,26SEP1973,01JUL1997
120812,Fauver,Arruza,M,45810,Applications Developer II,US,19FEB1978,01AUG2005
120813,John,Heinsler,M,50865,Applications Developer IV,US,14SEP1973,01JAN1997
120814,Victor,Scroggin,M,59140,Project Manager,US,03JUN1963,01SEP1983
120815,Craig,Honore,M,31590,Service Administrator III,US,27DEC1992,01APR2010
120816,Tessia,Hart,F,30485,Service Administrator I,US,03MAY1973,01AUG1997
120992,Lisa,Kicak,F,26940,Office Assistant I,US,17FEB1983,01AUG2004
120993,Lorraine,Boatright,F,26260,Office Assistant I,US,18DEC1973,01MAR2001
120994,Danelle,Sergeant,F,31645,Office Administrator I,us,16JUN1978,01NOV1998
120995,Lily-Ann,Gordo,F,34850,Office Administrator II,US,13JUN1988,01AUG2010
120996,Johannes,Wade,M,32745,Office Assistant IV,US,21JUL1978,01SEP2006
120997,Mary,Donathan,F,27420,Shipping Administrator I,us,21NOV1978,01SEP2000
120998,Tondelayo,Benedicto,F,26330,Clerk I,US,06DEC1983,01APR2009
120999,Sherelyn,Heilmann,F,27215,Clerk I,US,28DEC1963,01APR1988
121000,Herman,Supple,M,48600,Administration Manager,US,25JAN1968,01DEC1997
121001,Tony,House,M,43615,Warehouse Manager,US,21JAN1963,01SEP1981
121002,Terry-Ann,Clark,F,26650,Warehouse Assistant II,US,18SEP1958,01DEC1983
121003,Troyce Van,Der Wiele,M,26000,Warehouse Assistant I,US,05MAY1992,01JUL2010
121004,Kellen,Smith,M,30895,Security Manager,US,03AUG1948,01JAN1978
121005,Yuh-Lang,Mclamb,M,25020,Security Guard I,US,15JUL1988,01FEB2008
121006,Bernard,Bolster,M,26145,Security Guard I,US,12OCT1990,01NOV2008
121007,John,Banaszak,M,27290,Security Guard II,US,12OCT1968,01FEB1991
121008,Eron,Mckenzie,M,27875,Security Guard II,US,03JUL1973,01AUG1997
121009,Robert,Goodwin,M,32955,Service Administrator I,US,04DEC1983,01AUG2003
121010,Donald,Lamp,M,25195,Service Assistant I,US,14AUG1988,01MAR2010
121011,Steven,Banchi,M,25735,Service Assistant I,US,11MAR1948,01JAN1972
121012,Carmelo,Broome,M,29575,Service Assistant II,US,26JAN1990,01SEP2007
121013,Seco,Hargrave,M,26675,Electrician II,US,28APR1983,01APR2004
121014,Donelle,Liguori,F,28510,Electrician III,US,01MAY1978,01AUG2003
121015,Wilson,Elmoslamy,M,26140,Technician I,US,13DEC1983,01SEP2004
121016,Lutezenia,Sullivan,F,48075,Technical Manager,US,19JAN1980,01SEP2008
121017,Gilbert,Arizmendi,M,29225,Technician II,US,06JAN1988,01MAR2009
121125,Michael,Holt,M,25315,Trainee,US,17APR1978,01JAN2007
121126,James,Penhale,M,26015,Trainee,US,26OCT1958,01JAN2007
121127,Keyna,Mangini,F,25435,Trainee,US,03SEP1990,01JUN2009
121128,Glacia,Nazar,F,25405,Trainee,US,26JUN1978,01JAN2007
121129,Yusef,Hafley,M,30945,Trainee,US,01MAY1968,01JAN2007
121130,Gary,Herndon,M,25255,Trainee,US,21JAN1988,01FEB2008
121131,William,Pantages,M,25445,Trainee,US,30JUN1973,01JAN2007
121132,Shia-Ling,Digiorgio,M,24390,Trainee,US,08FEB1958,01JAN2007
121133,Peter,Pringley,M,25405,Trainee,US,10NOV1983,01JAN2007
121134,Paul,Tacosa,M,25585,Trainee,US,02JUL1968,01JAN2007
121141,Henri Le,Bleu,M,194885,Vice President,US,19JUN1948,01JAN1978
121142,Reginald,Steiber,M,156065,Director,US,14FEB1973,01MAY1997
121146,Julieanne,Sangiorgio,F,29320,Secretary III,US,09DEC1990,01APR2010
121147,Christine,Sneed,F,29145,Secretary II,US,28MAY1973,01SEP1991
121148,Shane,Sadig,M,52930,Business Analyst II,US,01JAN1973,01JAN2002
;;;;
run;
filename mydata clear;
/****************************************************************************************************************************/


data work.country2;
   length Country_Code $ 2 Country_Name $ 48;
   infile "&path/country.dat" dlm='!'; 
   input Country_Code $ Country_Name $;
run;

proc print data=work.country2;
run;

proc contents data = work.country2 nods;
run;

proc print data = orion.country;
run;

proc contents data = orion._all_;
run;

proc contents data = orion.sales;
run;

proc print data = orion.sales;
run;

data work.donations;
infile "&path/donation.dat";
input Employee_ID Qtr1 Qtr2 Qtr3 Qtr4;
total = sum(Qtr1,Qtr2,Qtr3,Qtr4);
run;

proc print data = work.donations;
run;

proc print data = orion.sales;
var last_name first_name salary;
run;

proc print data=orion.sales;
var last_name first_name salary;
sum salary;
run; 

proc print data=orion.sales noobs;
var last_name first_name salary country;
where gender="F" and salary <= 25500 and country in ('IN','US');
run;

proc print data=orion.sales;
var last_name first_name salary;
where gender = "F";
where gender = "M";
run;

/* to resolve the above query - use the following */

proc print data = orion.sales;
var last_name first_name salary country;
where gender = "F";
where same and country = "AU";
run;

proc print data = orion.sales;
var last_name first_name salary;
where employee_id is missing;
run;



proc print data=orion.sales;
var last_name first_name salary;
where country in('AU','US') and job_title ? "Rep";
run;

proc print data=orion.sales;
var last_name first_name salary job_title;
where country = "AU" and job_title contains 'Rep' and 25000<=salary<=50000;
run;

proc print data=orion.sales;
var last_name first_name salary job_title;
where country = "AU" and last_name like 'J_m%' and job_title contains 'Rep' and 25000<=salary<=50000;
run;

proc print data = orion.customer_dim;
var customer_Country customer_gender customer_name customer_Birthdate;
where customer_age = 21;
*id customer_id;
id customer_name;
run;

********************************************************************************;
proc print data = orion.order_fact noobs;
sum total_retail_price;
where total_retail_price > 500;
id Customer_ID;
var Order_ID Order_Type Quantity Total_Retail_Price;
run;

proc sort data = orion.sales out=work.sales_sort;
by salary;
run;

proc print data = work.sales_sort;
run;

proc sort data = orion.sales out = work.sales_sort;
by country descending salary ;
run;

proc print data = work.sales_sort;
by country;
run;

proc sort data = orion.employee_payroll out=work.sort_salary;
by salary;
run;

title1 "Orion Star Sales Staff";
title2 "Salary Report";

footnote "Confidential";
proc print data = work.sort_salary;
run;

title1 "Orion Star Sales Staff";
title2 "Salary Report";
Footnote1 "Confidential";
proc print data=orion.sales label;
var Employee_ID last_name salary;
label Employee_ID = "Sales ID"
		Last_Name = "Last Name"
		Salary = "Annual Salary";
run;
title;
footnote;

title1 "Orion Star Sales Staff";
title2 "Salary Report";
Footnote1 "Confidential";
proc print data=orion.sales split = "*";
var Employee_ID last_name salary;
label Employee_ID = "Sales ID"
		Last_Name = "Last Name"
		Salary = "Annual*Salary";
run;
title;
footnote;

title1 "Orion Star Sales Staff";
title2 "Salary Report";
Footnote1 "Confidential";
proc print data = orion.sales noobs;
var Employee_ID First_Name Last_Name Gender Salary;
where country = "AU" and Job_title contains 'Rep. IV';
run;
title;
footnote;

proc print data = orion.sales noobs label;
where country = "AU" and Job_title contains "Rep";
label Job_title = "Sales Title" Hire_date="Date Hired";
format Salary dollar8. Hire_Date yymmdd10.;
var Last_Name First_Name Country Job_Title Salary Hire_Date;
run;

proc print data=orion.employee_payroll;
var Employee_ID Salary Birth_date Employee_Hire_Date;
format salary dollar11.2 birth_date mmddyy10. Employee_Hire_date date9.;
run;


proc format;

value $ctryfmt 	"AU" = "Australia"
				"US" = "United States"
				"other" = "Miscoded";

value $sports 	"FB" = "Football"
				"BK" = "Basketball"
				"BS" = "Baseball";

value tiers 	20000-<50000 = "Tier1"
				50000-<100000 = "Tier2"
				100000-250000 = "Tier3";

value tier_Int 	low-<50000 = "Tier1"
 				50000-100000 = "Tier2"
				100000<-high = "Tier3";
run;

proc print data = orion.sales label;
var Last_Name First_Name Country Job_Title Salary Hire_Date;
label Job_title = "Sales Title" Hire_date="Date Hired";
format salary tier_Int.
birth_date hire_date monyy7. country $ctryfmt.;
run;

data q1birthdays;
set orion.employee_payroll;
birthMonth = month(Birth_date);
if BirthMonth le 3;
run;

proc format;

value $Gender	"F" = "Female"
				"M" = "Male";

value M_Name	1 = "January"
				2 = "February"
				3 = "March";
run;

proc print data = work.q1birthdays noobs split = "*";

Label Employee_gender = "Employee * Gender";
var Employee_Id Employee_gender Birthmonth;
format Employee_gender $Gender. birthmonth M_Name. ;
run;

data work.subset;
set orion.sales;
where country = "AU" and job_title contains "Rep";
run;

proc print data = work.subset;
Label Employee_gender = "Employee * Gender";
format gender $Gender. Birth_date mmddyy10. hire_date mmddyy10.;
var Employee_Id gender Birth_date hire_date;
run;

data work.subset1;
set orion.sales;
where country = "AU" and job_title contains 'Rep' and Hire_date < '01jan2000'd; * date constant;
run;

proc print data =work.subset1;
run;

data work.subset1;
set orion.sales;
where country = "AU" and Job_Title contains 'Rep' and Hire_date <'01jan2000'd;
bonus = salary * .10;
run;

proc print data =work.subset1 noobs;
var first_name last_name salary job_title bonus hire_date;
label first_name = "First Name" last_name = "Last Name" job_title = "Job Title" hire_date = "Hire Date";
format hire_date date9.;
run;

proc print data = orion.customer_dim label;

run;

data work.youngadult;

set orion.customer_dim;
where Customer_Gender = "F" and 17<customer_age<37 and Customer_group contains "Gold";
discount = .25;

run;

proc print data = work.youngadult;
 var Customer_Name Customer_Age  
       Customer_Gender Customer_Group Discount;
ID Customer_ID;

run;

data work.subset1;
set orion.sales;
where country = "AU" and Job_title contains 'Rep';

run;

data work.subset1;
set orion.sales;
where country = "AU" and job_Title contains "Rep";
Bonus = salary * .10;
drop Employee_ID gender country birth_date;
run;

proc print data = work.subset1;
run;


data work.auemps;
set orion.sales;
where country = "AU";
bonus = salary * .10;
if bonus >=3000;
run;

proc print data = work.auemps;
run;

data work.subset1;
set orion.sales;
where country ="AU" and job_title contains 'Rep';
Bonus = Salary * .10;
label job_title = "Sales Title"
Hire_date = "Date Hired"
First_name = "First Name"
Last_Name = "Last Name";
drop Employee_ID Gender Country Birth_Date;
format Salary Bonus dollar12.;
format Hire_Date ddmmyy10.;
run;

proc print data = work.subset1 label;

run;


data work.increase;
   set orion.staff;
   where Emp_Hire_Date>='01JUL2010'd;
   Increase=Salary*0.10;
   if Increase>3000;
   NewSalary=Salary+Increase;
   label Employee_ID='Employee ID'
         Emp_Hire_Date='Hire Date'
         NewSalary='New Annual Salary';
   format Salary NewSalary dollar10.2 
          Increase comma5.;
   keep Employee_ID Emp_Hire_Date Salary 
        Increase NewSalary;
run;

proc contents data=work.increase;
run;

proc setinit;
run;

*****Libname librey <engine> "workbook-name" <options>;
libname orionx pcfiles path = "&path/sales.xls";

proc contents data = orionx._all_;
run;

proc print data = orionx.'Australia$'n noobs;
where job_title ? 'IV';
var Employee_ID Last_Name Job_Title Salary;
libname orionx clear;
run;

data work.subset1;
set orionx."Australia"$n;
where job_title contains 'Rep';
Bonus = Salary * .10;
label Job_title = "Sales Title"
Hire_date = "Date Hired";
format salary comma10. hire_date mmddyy10.
bonus comma8.2;
run;


proc contents data = work.subset1;
run;

proc print data = work.subset1 label;
run;

libname orionx clear;

**Exercise**;

proc contents data=custfm._all_;
run;

data work.males;
   set custfm."$males$"n;
   keep First_Name Last_Name Birth_Date;
   format Birth_Date year4.;
   label Birth_Date='Birth Year';
run;

proc print data=work.males label;
run;

libname custfm clear;

libname oralib oracle user = edu101 pw=edu101 path = dbmssrv schema = educ;

data work.sales1;
infile "&path/sales.csv" dlm = ",";
input Employee_ID First_name $ 
last_name $ gender $ salary jobtitle $ country $; * Salary is integer, while others are characters;
length jobtitle $ 25;
run;

data work.sales3;
length Employee_ID 8 First_name $ 12 Last_name $ 18 Salary 8 Gender $ 1 Job_Title $ 25 Country $ 2;
infile "&path/sales.csv" dlm=",";
input Employee_ID First_Name $ Last_Name $ Gender $ Salary Job_title $ Country $;
run;

proc contents data = work.sales3 varnum;

run;

proc print data = work.sales3;

run;

data work.newemployees;
infile "&path/newemps.csv" dlm=",";
length first  12 last  18 Title  25 Salary 8 ; 
input First $ Last $ Title $ Salary;
run;

proc print data=work.newemployees;
run;

* format non standard data values - need extra instruction;

data work.sales2;
infile "&path/sales.csv" dlm=",";
input Employee_ID First_Name :$12. Last_Name :$18. Gender :$1. Salary Job_Title :$25. Country :$2.
birth_Date :date. Hire_Date :mmddyy.;
if country="AU";
keep First_name last_name salary Job_title Hire_date;
label 	job_title = "Sales Title"
		Hire__date = "Date Hired";
format Salary dollar12. Hire_Date monyy7.;

*":" will put the delim after first name is complete; 
run;

proc print data = work.sales2 label;
run;

proc print data = work.sales2;
run;

data work.newemps;
infile datalines dlm = ",";
input First_name $ Last_name $ Job_title $ Salary :dollar8.;
datalines;
steven, worton, Auditor, $40450
Merla, Hieds, Trainee, $24025
Martha, Bamburg, Manager, $32000
;
run;

proc print data = work.newemps;
run;
	
data work.canada_customers;
infile "&path/custca.csv" dlm = ",";
Input First $ Last $ ID Gender $ Birthdate :ddmmyy. Age AgeGroup $;
Length First $ 20 Last $ 20 Gender $ 1 AgeGroup $ 12; * only use the length with String characters.;
Format Birthdate monyy7.;
drop ID Age; 

run;

proc print data = work.canada_customers;
run;

* invalid data values;
data work.contacts;
   length Name $ 20 Phone Mobile $ 14;
   infile "&path/phone2.csv" dlm=',';
   input Name $ Phone $ Mobile $;
run;

proc print data=work.contacts noobs;
run;

data work.contacts;
length Name  $ 20 Phone Mobile $ 14;
infile "&path/phone2.csv";
input Name $ Phone $ Mobile $;
run;

proc print data = work.contacts noobs;
run;

data work.contacts2;
length Name $ 20 phone mobile $ 14; 
infile "&path/phone.csv" dlm = "," missover;
input Name $ Phone $ mobile $;
run;

proc print data = work.contacts2;
run;

data work.donations;
   infile "&path/donation.csv" dsd missover; * dsd will treat two cumulative ,, as a missing value;
   input EmpID Q1 Q2 Q3 Q4;
run;

proc print data=work.donations;
run;
*********Chapter 9*************;
data work.comp;
set orion.sales;
Bonus = 500;
Compensation = sum(salary,bonus);
BonusMonth = month(Hire_Date);
run;

proc print data = work.comp;
var Employee_ID First_Name Last_Name Salary Bonus Compensation BonusMonth;
run;

data work.increase;
set orion.staff;
increase = salary *.10;
NewSalary = sum(Salary,increase);
BdayQtr = qtr(Birth_Date);
keep Employee_ID Salary Birth_Date increase NewSalary BdayQtr;
format Salary Increase NewSalary comma8.;
run;

proc print data = work.increase label;
run;

data work.comp;
set orion.sales;

if job_title = "Sales Rep. IV" then
Bonus = 1000;
if job_title = "Sales Manager" then
Bonus = 1500;
if job_title = "Senior Sales Manager" then
Bonus = 2000;
if job_title = "Chief Sales Officer" then
Bonus = 2500;
run;

data work.bonus;
length Freq $ 12;
set orion.sales;
if country = "US" then
do
bonus = 500;
freq = "Once a year";
end;
else if country = "AU" then
do
bonus = 300;
Freq = "Twice a year";
end;
run;

proc print data = work.comp;
var Last_name job_title bonus;
run;

proc print data = work.bonus;
var First_Name Last_Name Country bonus Freq;

run;

data work.region;
set orion.supplier;
label Supplier_Name = "Supplier Name";
length Region $ 18;
if country in ("CA", "US") then
do;
discount = .10;
discountType = "Required";
Region = "North America";
end;
else do;
discount = .05;
discountType = "Optional";
Region = "Not North America";
end;
keep Supplier_Name Country Discount DiscountType Region;
run;

proc print data = work.region label;


run;
***************Chapter 10************;

data empsall;
set empsdk empsfr;
run;

proc print data = empsall;
run;

**different variables;

data empsall2;
set empscn empsjpl(Rename=("Region" = "Country"));
run;

data work.thirdqtr;
set orion.mnth7_2011 orion.mnth8_2011 orion.mnth9_2011; 
run;

proc print data = work.thirdqtr;
run;

**joins in SAS - one to one;

proc sort data = orion.employee_payroll out = work.payroll;
by employee_id;
run;

proc sort data = orion.employee_addresses out = work.addresses;
by employee_id;
run;

data work.payadd;
MERGE work.payroll work.addresses;
by employee_id;
run;

proc print data = work.payadd;
var Employee_ID Employee_Name Birth_Date Salary;
format birth_date Weekdate.;
run;

proc contents data=orion.sales;
run;

proc contents data=orion.nonsales;
run;

data work.allorders;
merge orion.orders orion.order_item;
by Order_ID;
  keep Order_ID Order_Item_Num Order_Type 
        Order_Date Quantity Total_Retail_Price;
run;

data work.allemployees;
   set orion.sales 
       orion.nonsales
       (rename=(First=First_Name Last=Last_Name));
   keep Employee_ID First_Name Last_Name 
        Job_Title Salary;
run;

proc print data=work.allorders noobs;
   where Order_Date between 
        '01Oct2011'd and '31Dec2011'd;
run;

proc print data=work.allemployees;
run;

data empsauc3;
merge empsau (in = Emps)
	  phonec (in = cell);
by empid;
if Emps=1 and Cell=1;
run;

proc print data = empsauc3;
run;

  data mergedata.emppay;
          merge sales.reps(rename=(office=OfficeNumber) in=inreps)
                empinfo.sales(in=insales) 
                empinfo.bonuses(in=inbonus); 
          by Emp_ID;              
		if officeNumber = 1 and insales = 1 and inbonus = 1;
  run;

proc sort data=orion.product_list
          out=work.product;
   by Supplier_ID;
run;

data work.prodsup;

merge work.product (in = "P") orion.supplier (in="S");
by Supplier_Id;
if P=1 and S=0;
run;
proc print data=work.prodsup;
   var Product_ID Product_Name Supplier_ID 
       Supplier_Name;
run;

proc freq data = orion.sales;
tables Country Gender/nocum nopercent;
where country = "AU";
Run;

proc format;

value tiers low-25000 = "Tier1"
			25000<-50000 = "Tier2"
			50000<-100000 = "Tier3"
			100000<-high = "Tier4";
run;

proc sort data = orion.sales out = sorted;
by country;
run;

proc freq data = sorted;
tables Gender;
by country;
run;

proc freq data = orion.sales;
tables Salary;
format salary tiers.;
by country;
run;

* two way cross tab;
proc freq data = orion.sales;
tables gender * country / nopercent;
run;

proc format;
   value ordertypes
         1='Retail'
         2='Catalog'
         3='Internet';
run;

proc freq data=orion.orders;
tables Order_Date;
format ordertype year4.;
tables order_type/nocum;
format order_type ordertypes.;
tables Order_Date*Order_Type/nopercent 
          norow nocol;
run;

proc freq data = orion.nonsales2 order=freq nlevels;
tables Gender Country Employee_ID/nocum nopercent noprint;
run;

proc print data = orion.nonsales2;
where gender not in ("F","M") or
job_title is NULL or country not in ("AU", "US") or 
salary not between 24000 and 500000 or 
Employee_ID is missing or
Employee_ID = 120108;
run;

proc freq data=orion.orders;
   tables Customer_ID Employee_ID;
run;

proc freq data=orion.orders nlevels; * number of levels';
   where Order_Type=1;
   tables Customer_ID Employee_ID/noprint;
run;

title1 'Catalog and Internet Customers';
proc freq data=orion.orders order=freq;
   where Order_Type ne 1;
   tables Customer_ID/nocum;
run;
title;

proc means data = orion.sales;
var salary;
run;

proc means data = orion.sales min max sum n mean maxdec = 2 nonobs;
var salary;
class gender country;
run;

proc means data = orion.nonsales2 n min max nmiss; * i value with missing;
var salary;
run;

proc univariate data=orion.nonsales2;
var salary;
id Employee_id;
run;

proc means data=orion.order_fact sum;
   var Total_Retail_Price;
   class Order_Date Order_Type;
   format Order_Date year4. 
          Order_Type ordertypes.;
run;
* ods will be used to export the destination file;
ods pdf file = "c:\output/salaries.pdf";
ods pdf close;

* csvall and rtf for csv and rich text format 


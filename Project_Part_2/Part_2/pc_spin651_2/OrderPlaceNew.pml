1	mtype {SEE_MENU,ADD_FOOD1}
2	mtype {ADD_FOOD2,ORDER_PLACE}
3	
4	chan toS1 = [2] of {mtype,bit};
5	chan toA1= [2] of {mtype,bit};
6	chan toA2 = [2] of {mtype,bit};
7	chan toO2= [2] of {mtype,bit};
8	
9	proctype Food1(chan in, out)
10	{
11		bit sendbit,recvbit;
12		do 
13		:: out !SEE_MENU, sendbit ->
14			in ? ADD_FOOD1,recvbit;
15			if
16			:: recvbit == sendbit ->
17				sendbit = 1-sendbit
18			:: else
19			fi
20		od
21	}
22	
23	proctype Order1(chan in, out)
24	{
25		bit recvbit
26		do
27		:: in ? SEE_MENU(recvbit) ->
28			out ! ADD_FOOD1(recvbit);
29		od
30	}
31	proctype Food2(chan in, out)
32	{
33		bit sendbit,recvbit;
34		do 
35		:: out !ADD_FOOD2, sendbit ->
36			in ? ORDER_PLACE,recvbit;
37			if
38			:: recvbit == sendbit ->
39				sendbit = 1-sendbit
40			:: else
41			fi
42		od
43	}
44	
45	proctype Order2(chan in, out)
46	{
47		bit recvbit
48		do
49		:: in ? ADD_FOOD2(recvbit) ->
50			out ! ORDER_PLACE(recvbit);
51		od
52	}
53	init
54	{
55		
56		 run Food1(toS1, toA1);
57	                run Order1(toA1, toS1);
58	                run Food2(toA2, toO2);
59	                run Order2(toO2, toA2);
60	}


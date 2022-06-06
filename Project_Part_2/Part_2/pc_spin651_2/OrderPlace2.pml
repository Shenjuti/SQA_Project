mtype {SEE_MENU,ADD_FOOD1}
mtype {ADD_FOOD2,ORDER_PLACE}

chan toS1 = [2] of {mtype,bit};
chan toA1= [2] of {mtype,bit};
chan toA2 = [2] of {mtype,bit};
chan toO2= [2] of {mtype,bit};

proctype Food1(chan in, out)
{
	bit sendbit,recvbit;
	do 
	:: out !SEE_MENU, sendbit ->
		in ? ADD_FOOD1,recvbit;
		if
		:: recvbit == sendbit ->
			sendbit = 1-sendbit
		:: else
		fi
	od
}

proctype Order1(chan in, out)
{
	bit recvbit
	do
	:: in ? SEE_MENU(recvbit) ->
		out ! ADD_FOOD1(recvbit);
	od
}
proctype Food2(chan in, out)
{
	bit sendbit,recvbit;
	do 
	:: out !ADD_FOOD2, sendbit ->
		in ? ORDER_PLACE,recvbit;
		if
		:: recvbit == sendbit ->
			sendbit = 1-sendbit
		:: else
		fi
	od
}

proctype Order2(chan in, out)
{
	bit recvbit
	do
	:: in ? ADD_FOOD2(recvbit) ->
		out ! ORDER_PLACE(recvbit);
	od
}
init
{
	
	run Food1(toS1, toA1);
                run Order1(toA1, toS1);
                run Food2(toA2, toO2);
                run Order2(toO2, toA2);
}

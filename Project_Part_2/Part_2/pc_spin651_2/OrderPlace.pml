mtype {SEE_MENU,ADD_FOOD,ORDER_PLACE}


chan toS = [3] of {mtype,bit,bit};
chan toR = [3] of {mtype,bit,bit};

proctype Customer(chan in, out)
{
	bit sendbit,recvbit;
	do 
	:: out !SEE_MENU, sendbit ->
		in ? ADD_FOOD,recvbit;
		if
		:: recvbit == sendbit ->
			sendbit = 1-sendbit
		:: else
		fi
	od
}
proctype Food1(chan in, out)
{
	bit sendbit,recvbit;
	do 
	:: out !ADD_FOOD, sendbit ->
		in ? ORDER_PLACE,recvbit;
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
		out ! ORDER_PLACE(recvbit);
	od
}
init
{
	run Customer(toS, toR);
	run Food1(toS, toR);
	run Order1(toR, toS);
}

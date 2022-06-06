mtype {RESERVATION, BOOKING_SUCCESSFULLY, ALREADY_BOOKED}
chan toS = [3] of {mtype,bit,bit};
chan toR = [3] of {mtype,bit,bit};

proctype Customer(chan in, out)
{
	bit sendbit,recvbit,elsebit;
	do 
	:: out !RESERVATION, sendbit ->
		in ? BOOKING_SUCCESSFULLY,recvbit;
		if
		:: recvbit == sendbit ->
			sendbit = 2-sendbit
		:: else -> elsebit == sendbit ->
			sendbit = 1-sendbit
		fi
	od
}
proctype Reserve1(chan in, out)
{
	bit recvbit
	do
	:: in ? RESERVATION(recvbit) ->
		out ! BOOKING_SUCCESSFULLY(recvbit);
	od
}
proctype Reserve2(chan in, out)
{
	bit elsebit
	do
	:: in ? RESERVATION(elsebit) ->
		out ! ALREADY_BOOKED(elsebit);
	od
}
init
{
	run Customer(toS, toR);
	run Reserve1(toR, toS);
	run Reserve2(toR, toS);
}
	
	

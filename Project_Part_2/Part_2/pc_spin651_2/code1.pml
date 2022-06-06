mtype {req_membership, ACK};
chan toA = [1] of {mtype, bit};
chan toG = [1] of {mtype, bit};

proctype Actor(chan in, out)
{
	bit sendbit, recvbit;
	do
	:: out ! req_membership, sendbit ->
		in ? ACK, recvbit;
		if
		:: recvbit == sendbit ->
			sendbit = 1-sendbit;
		:: else
		fi
	od
}

proctype Group(chan in, out)
{
	bit recvbit;
	do
	:: in ? req_membership(recvbit) -> 
	   out ! ACK(recvbit);	
	od
}

init
{
	run Actor(toA, toG);
	run Group(toG, toA);
}
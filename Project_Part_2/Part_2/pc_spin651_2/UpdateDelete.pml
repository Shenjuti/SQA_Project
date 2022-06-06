mtype {UPDATE, UPDATE_SUCCESSFULLY}
mtype {DELETE, DELETE_SUCCESSFULLY}
chan toAu = [2] of {mtype,bit};
chan toFu = [2] of {mtype,bit};
chan toAd = [2] of {mtype,bit};
chan toFd = [2] of {mtype,bit};
proctype Adminu(chan in, out)
{
	bit sendbit,recvbit;
	do 
	:: out !UPDATE, sendbit ->
		in ? UPDATE_SUCCESSFULLY,recvbit;
		if
		:: recvbit == sendbit ->
			sendbit = 1-sendbit
		:: else
		fi
	od
}

proctype Foodu(chan in, out)
{
	bit recvbit
	do
	:: in ? UPDATE(recvbit) ->
		out ! UPDATE_SUCCESSFULLY(recvbit);
	od
}
proctype Admind(chan in, out)
{
	bit sendbit,recvbit;
	do 
	:: out !DELETE, sendbit ->
		in ? DELETE_SUCCESSFULLY,recvbit;
		if
		:: recvbit == sendbit ->
			sendbit = 1-sendbit
		:: else
		fi
	od
}

proctype Foodd(chan in, out)
{
	bit recvbit
	do
	:: in ? DELETE(recvbit) ->
		out ! DELETE_SUCCESSFULLY(recvbit);
	od
}
init
{
	run Adminu(toAu, toFu);
	run Foodu(toFu, toAu);
	run Admind(toAd, toFd);
	run Foodd(toFd, toAd);
}
	
	




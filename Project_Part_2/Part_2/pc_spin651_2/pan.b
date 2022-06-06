	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* PROC :init: */

	case 3: // STATE 1
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 4: // STATE 2
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 5: // STATE 3
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 6: // STATE 4
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC Reserve2 */

	case 7: // STATE 1
		;
		XX = 1;
		unrecv(((P2 *)_this)->in, XX-1, 0, 3, 1);
		unrecv(((P2 *)_this)->in, XX-1, 1, ((int)((P2 *)_this)->elsebit), 0);
		((P2 *)_this)->elsebit = trpt->bup.oval;
		;
		;
		goto R999;

	case 8: // STATE 2
		;
		_m = unsend(((P2 *)_this)->out);
		;
		goto R999;

	case 9: // STATE 6
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC Reserve1 */

	case 10: // STATE 1
		;
		XX = 1;
		unrecv(((P1 *)_this)->in, XX-1, 0, 3, 1);
		unrecv(((P1 *)_this)->in, XX-1, 1, ((int)((P1 *)_this)->recvbit), 0);
		((P1 *)_this)->recvbit = trpt->bup.oval;
		;
		;
		goto R999;

	case 11: // STATE 2
		;
		_m = unsend(((P1 *)_this)->out);
		;
		goto R999;

	case 12: // STATE 6
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC Customer */

	case 13: // STATE 1
		;
		_m = unsend(((P0 *)_this)->out);
		;
		goto R999;

	case 14: // STATE 2
		;
		XX = 1;
		unrecv(((P0 *)_this)->in, XX-1, 0, 2, 1);
		unrecv(((P0 *)_this)->in, XX-1, 1, ((int)((P0 *)_this)->recvbit), 0);
		((P0 *)_this)->recvbit = trpt->bup.oval;
		;
		;
		goto R999;

	case 15: // STATE 3
		;
	/* 0 */	((P0 *)_this)->recvbit = trpt->bup.oval;
		;
		;
		goto R999;

	case 16: // STATE 4
		;
		((P0 *)_this)->sendbit = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 18: // STATE 7
		;
		((P0 *)_this)->sendbit = trpt->bup.oval;
		;
		goto R999;

	case 19: // STATE 13
		;
		p_restor(II);
		;
		;
		goto R999;
	}


#define rand	pan_rand
#define pthread_equal(a,b)	((a)==(b))
#if defined(HAS_CODE) && defined(VERBOSE)
	#ifdef BFS_PAR
		bfs_printf("Pr: %d Tr: %d\n", II, t->forw);
	#else
		cpu_printf("Pr: %d Tr: %d\n", II, t->forw);
	#endif
#endif
	switch (t->forw) {
	default: Uerror("bad forward move");
	case 0:	/* if without executable clauses */
		continue;
	case 1: /* generic 'goto' or 'skip' */
		IfNotBlocked
		_m = 3; goto P999;
	case 2: /* generic 'else' */
		IfNotBlocked
		if (trpt->o_pm&1) continue;
		_m = 3; goto P999;

		 /* PROC :init: */
	case 3: // STATE 1 - Reservation.pml:37 - [(run Customer(toS,toR))] (0:0:0 - 0)
		IfNotBlocked
		reached[3][1] = 1;
		if (!(addproc(II, 1, 0, now.toS, now.toR)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 4: // STATE 2 - Reservation.pml:38 - [(run Reserve1(toR,toS))] (0:0:0 - 0)
		IfNotBlocked
		reached[3][2] = 1;
		if (!(addproc(II, 1, 1, now.toR, now.toS)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 5: // STATE 3 - Reservation.pml:39 - [(run Reserve2(toR,toS))] (0:0:0 - 0)
		IfNotBlocked
		reached[3][3] = 1;
		if (!(addproc(II, 1, 2, now.toR, now.toS)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 6: // STATE 4 - Reservation.pml:40 - [-end-] (0:0:0 - 0)
		IfNotBlocked
		reached[3][4] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC Reserve2 */
	case 7: // STATE 1 - Reservation.pml:31 - [in?RESERVATION,elsebit] (0:0:1 - 0)
		reached[2][1] = 1;
		if (q_len(((P2 *)_this)->in) == 0) continue;

		XX=1;
		if (3 != qrecv(((P2 *)_this)->in, 0, 0, 0)) continue;
		(trpt+1)->bup.oval = ((int)((P2 *)_this)->elsebit);
		;
		((P2 *)_this)->elsebit = qrecv(((P2 *)_this)->in, XX-1, 1, 1);
#ifdef VAR_RANGES
		logval("Reserve2:elsebit", ((int)((P2 *)_this)->elsebit));
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", ((P2 *)_this)->in);
			sprintf(simtmp, "%d", 3); strcat(simvals, simtmp);
			strcat(simvals, ",");
			sprintf(simtmp, "%d", ((int)((P2 *)_this)->elsebit)); strcat(simvals, simtmp);
		}
#endif
		;
		_m = 4; goto P999; /* 0 */
	case 8: // STATE 2 - Reservation.pml:32 - [out!ALREADY_BOOKED,elsebit] (0:0:0 - 0)
		IfNotBlocked
		reached[2][2] = 1;
		if (q_full(((P2 *)_this)->out))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", ((P2 *)_this)->out);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P2 *)_this)->elsebit)); strcat(simvals, simtmp);		}
#endif
		
		qsend(((P2 *)_this)->out, 0, 1, ((int)((P2 *)_this)->elsebit), 0, 2);
		_m = 2; goto P999; /* 0 */
	case 9: // STATE 6 - Reservation.pml:34 - [-end-] (0:0:0 - 0)
		IfNotBlocked
		reached[2][6] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC Reserve1 */
	case 10: // STATE 1 - Reservation.pml:23 - [in?RESERVATION,recvbit] (0:0:1 - 0)
		reached[1][1] = 1;
		if (q_len(((P1 *)_this)->in) == 0) continue;

		XX=1;
		if (3 != qrecv(((P1 *)_this)->in, 0, 0, 0)) continue;
		(trpt+1)->bup.oval = ((int)((P1 *)_this)->recvbit);
		;
		((P1 *)_this)->recvbit = qrecv(((P1 *)_this)->in, XX-1, 1, 1);
#ifdef VAR_RANGES
		logval("Reserve1:recvbit", ((int)((P1 *)_this)->recvbit));
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", ((P1 *)_this)->in);
			sprintf(simtmp, "%d", 3); strcat(simvals, simtmp);
			strcat(simvals, ",");
			sprintf(simtmp, "%d", ((int)((P1 *)_this)->recvbit)); strcat(simvals, simtmp);
		}
#endif
		;
		_m = 4; goto P999; /* 0 */
	case 11: // STATE 2 - Reservation.pml:24 - [out!BOOKING_SUCCESSFULLY,recvbit] (0:0:0 - 0)
		IfNotBlocked
		reached[1][2] = 1;
		if (q_full(((P1 *)_this)->out))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", ((P1 *)_this)->out);
		sprintf(simtmp, "%d", 2); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P1 *)_this)->recvbit)); strcat(simvals, simtmp);		}
#endif
		
		qsend(((P1 *)_this)->out, 0, 2, ((int)((P1 *)_this)->recvbit), 0, 2);
		_m = 2; goto P999; /* 0 */
	case 12: // STATE 6 - Reservation.pml:26 - [-end-] (0:0:0 - 0)
		IfNotBlocked
		reached[1][6] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC Customer */
	case 13: // STATE 1 - Reservation.pml:9 - [out!RESERVATION,sendbit] (0:0:0 - 0)
		IfNotBlocked
		reached[0][1] = 1;
		if (q_full(((P0 *)_this)->out))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", ((P0 *)_this)->out);
		sprintf(simtmp, "%d", 3); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->sendbit)); strcat(simvals, simtmp);		}
#endif
		
		qsend(((P0 *)_this)->out, 0, 3, ((int)((P0 *)_this)->sendbit), 0, 2);
		_m = 2; goto P999; /* 0 */
	case 14: // STATE 2 - Reservation.pml:10 - [in?BOOKING_SUCCESSFULLY,recvbit] (0:0:1 - 0)
		reached[0][2] = 1;
		if (q_len(((P0 *)_this)->in) == 0) continue;

		XX=1;
		if (2 != qrecv(((P0 *)_this)->in, 0, 0, 0)) continue;
		(trpt+1)->bup.oval = ((int)((P0 *)_this)->recvbit);
		;
		((P0 *)_this)->recvbit = qrecv(((P0 *)_this)->in, XX-1, 1, 1);
#ifdef VAR_RANGES
		logval("Customer:recvbit", ((int)((P0 *)_this)->recvbit));
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", ((P0 *)_this)->in);
			sprintf(simtmp, "%d", 2); strcat(simvals, simtmp);
			strcat(simvals, ",");
			sprintf(simtmp, "%d", ((int)((P0 *)_this)->recvbit)); strcat(simvals, simtmp);
		}
#endif
		;
		_m = 4; goto P999; /* 0 */
	case 15: // STATE 3 - Reservation.pml:12 - [((recvbit==sendbit))] (0:0:1 - 0)
		IfNotBlocked
		reached[0][3] = 1;
		if (!((((int)((P0 *)_this)->recvbit)==((int)((P0 *)_this)->sendbit))))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: recvbit */  (trpt+1)->bup.oval = ((P0 *)_this)->recvbit;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)_this)->recvbit = 0;
		_m = 3; goto P999; /* 0 */
	case 16: // STATE 4 - Reservation.pml:13 - [sendbit = (2-sendbit)] (0:0:1 - 0)
		IfNotBlocked
		reached[0][4] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)_this)->sendbit);
		((P0 *)_this)->sendbit = (2-((int)((P0 *)_this)->sendbit));
#ifdef VAR_RANGES
		logval("Customer:sendbit", ((int)((P0 *)_this)->sendbit));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 17: // STATE 6 - Reservation.pml:14 - [((elsebit==sendbit))] (0:0:0 - 0)
		IfNotBlocked
		reached[0][6] = 1;
		if (!((((int)((P0 *)_this)->elsebit)==((int)((P0 *)_this)->sendbit))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 18: // STATE 7 - Reservation.pml:15 - [sendbit = (1-sendbit)] (0:0:1 - 0)
		IfNotBlocked
		reached[0][7] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)_this)->sendbit);
		((P0 *)_this)->sendbit = (1-((int)((P0 *)_this)->sendbit));
#ifdef VAR_RANGES
		logval("Customer:sendbit", ((int)((P0 *)_this)->sendbit));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 19: // STATE 13 - Reservation.pml:18 - [-end-] (0:0:0 - 0)
		IfNotBlocked
		reached[0][13] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */
	case  _T5:	/* np_ */
		if (!((!(trpt->o_pm&4) && !(trpt->tau&128))))
			continue;
		/* else fall through */
	case  _T2:	/* true */
		_m = 3; goto P999;
#undef rand
	}


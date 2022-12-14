PGDMP     9    
            	    z            ejercicio_integrador    14.2    14.2 W   ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ?           1262    17288    ejercicio_integrador    DATABASE     t   CREATE DATABASE ejercicio_integrador WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Argentina.1252';
 $   DROP DATABASE ejercicio_integrador;
                postgres    false                        2615    17289    sc_e001    SCHEMA        CREATE SCHEMA sc_e001;
    DROP SCHEMA sc_e001;
                postgres    false            ?           0    0    SCHEMA sc_e001    COMMENT     G   COMMENT ON SCHEMA sc_e001 IS 'Ent.Desarrollo  ( Datos y Ejecutables)';
                   postgres    false    6            
            2615    17290    sc_e002    SCHEMA        CREATE SCHEMA sc_e002;
    DROP SCHEMA sc_e002;
                postgres    false            ?           0    0    SCHEMA sc_e002    COMMENT     G   COMMENT ON SCHEMA sc_e002 IS 'Ent.UAT         ( Datos y Ejecutables)';
                   postgres    false    10                        2615    17291    sc_e003    SCHEMA        CREATE SCHEMA sc_e003;
    DROP SCHEMA sc_e003;
                postgres    false            ?           0    0    SCHEMA sc_e003    COMMENT     G   COMMENT ON SCHEMA sc_e003 IS 'Ent.Produccion  ( Datos y Ejecutables)';
                   postgres    false    4                        2615    17292    sc_e004    SCHEMA        CREATE SCHEMA sc_e004;
    DROP SCHEMA sc_e004;
                postgres    false            ?           0    0    SCHEMA sc_e004    COMMENT     G   COMMENT ON SCHEMA sc_e004 IS 'Ent.Produccion  ( Datos y Ejecutables)';
                   postgres    false    5                        2615    17293    sc_e005    SCHEMA        CREATE SCHEMA sc_e005;
    DROP SCHEMA sc_e005;
                postgres    false            ?           0    0    SCHEMA sc_e005    COMMENT     G   COMMENT ON SCHEMA sc_e005 IS 'Ent.Historicos          ( Fuera linea)';
                   postgres    false    8            ?           1247    17296    t_icrmsg    TYPE     ?   CREATE TYPE sc_e001.t_icrmsg AS (
	tbinroau bigint,
	ttiapals text,
	tticoper text,
	tiiusrnv integer,
	ttptblnm text,
	ttpschnm text,
	ttpart01 text,
	ttpart02 text,
	ttpart03 text
);
    DROP TYPE sc_e001.t_icrmsg;
       sc_e001          postgres    false    6            ?           0    0    TYPE t_icrmsg    COMMENT     5   COMMENT ON TYPE sc_e001.t_icrmsg IS 'Type t_icrmsg';
          sc_e001          postgres    false    915            ?           1247    17299    t_logcmp    TYPE       CREATE TYPE sc_e003.t_logcmp AS (
	tinpid integer,
	ttuser text,
	tafcin timestamp with time zone,
	tafccr timestamp with time zone,
	tbseqn bigint,
	ttpgin text,
	ttpgcr text,
	tlcncl boolean,
	ttlogd text,
	tlpubl boolean,
	ttapus text,
	ttaprl text,
	ttlfin boolean
);
    DROP TYPE sc_e003.t_logcmp;
       sc_e003          postgres    false    4            ?           0    0    TYPE t_logcmp    COMMENT     5   COMMENT ON TYPE sc_e003.t_logcmp IS 'Type t_logcmp';
          sc_e003          postgres    false    918            ?           1247    17302    t_logfin    TYPE     E   CREATE TYPE sc_e003.t_logfin AS (
	tlejfn boolean,
	tbejer bigint
);
    DROP TYPE sc_e003.t_logfin;
       sc_e003          postgres    false    4            ?           0    0    TYPE t_logfin    COMMENT     5   COMMENT ON TYPE sc_e003.t_logfin IS 'Type t_logfin';
          sc_e003          postgres    false    921            ?           1247    17305    t_logpet    TYPE     =  CREATE TYPE sc_e003.t_logpet AS (
	ttschnm text,
	tttabnm text,
	tvotnam character varying(5),
	tvotrtn character varying(30),
	tinvlop integer,
	tlrtchk boolean,
	tbrtcnt bigint,
	ttmsg01 text,
	ttmsg02 text,
	ttmsg03 text,
	ttsentn text,
	tbnrautre bigint,
	tvapalsre character varying(5),
	tvotalsre character varying(5),
	tvtbalsre character varying(5),
	ttmsg01re text,
	ttmsg02re text,
	ttmsg03re text,
	tvapnam character varying(5),
	tbapusr bigint,
	tinvlus integer,
	tbnraut bigint,
	tinpid integer,
	ttuser text,
	tafcin timestamp with time zone,
	ttpgin text
);
    DROP TYPE sc_e003.t_logpet;
       sc_e003          postgres    false    4            ?           0    0    TYPE t_logpet    COMMENT     5   COMMENT ON TYPE sc_e003.t_logpet IS 'Type t_logpet';
          sc_e003          postgres    false    924            ?           1247    17308    t_icrmsg    TYPE     ?   CREATE TYPE sc_e004.t_icrmsg AS (
	tbinroau bigint,
	ttiapals text,
	tticoper text,
	tiiusrnv integer,
	ttptblnm text,
	ttpschnm text,
	ttpart01 text,
	ttpart02 text,
	ttpart03 text
);
    DROP TYPE sc_e004.t_icrmsg;
       sc_e004          postgres    false    5            ?           0    0    TYPE t_icrmsg    COMMENT     5   COMMENT ON TYPE sc_e004.t_icrmsg IS 'Type t_icrmsg';
          sc_e004          postgres    false    927                        1255    17309    icr_arm_sent(sc_e003.t_logpet)    FUNCTION      >  CREATE FUNCTION sc_e001.icr_arm_sent(sc_e003.t_logpet) RETURNS record
    LANGUAGE plpgsql SECURITY DEFINER
    AS $_$
DECLARE
  t_rtrn             text              ;
  t_au01             text              ;
  t_vu01             text              ;
  b_au01             integer           ;
  d_au01             date              ;
  i_au01             integer           ;
  l_ok01             boolean           ;
  
  t_sn01             text              ;
  t_sn02             text              ;
  
  i_lv01             integer           ;
  i_lv02             integer           ;
  i_lfld             integer           ;
  i_lf01             integer           ;
  i_lf02             integer           ;
 
  at_a01             text[]            ; 
  at_v01             text[]            ; 
  at_v02             text[]            ; 
 
  at_fld             text[]            ;
  at_pre             text[]            ;
  at_sub             text[]            ;
  ab_nul             boolean[]         ;
 
  at_fl01            text[]            ;
  at_pr01            text[]            ;
  at_va01            text[]            ;
  at_su01            text[]            ;
 
  at_fl02            text[]            ;
  at_pr02            text[]            ;
  at_va02            text[]            ;
  at_su02            text[]            ;
  
  at_sn01            text[]            ;
  at_sn02            text[]            ;
   
  lp           t_logpet%ROWTYPE ;   
  lg           t_logcmp%ROWTYPE ;
  ej           t_logfin%ROWTYPE ;

BEGIN
  lg                 := log_ini()                                    ;
  lp                 := $1                                           ;
  l_ok01             := FALSE                                        ;
  
  CASE       
  WHEN       UPPER( TRIM( lp.tvotnam)) = 'D'
  THEN
    at_v01           := STRING_TO_ARRAY( lp.ttmsg03, ';', 'NULL')    ; 
   
  WHEN       UPPER( TRIM( lp.tvotnam)) = 'I'
  THEN 
    at_v01           := STRING_TO_ARRAY( lp.ttmsg01, ';', 'NULL')    ; 
	l_ok01           := TRUE                                         ;
	 
  WHEN       UPPER( TRIM( lp.tvotnam)) = 'S'
  THEN
    at_v01           := STRING_TO_ARRAY( lp.ttmsg02, ';', 'NULL')    ; 
	
  WHEN       UPPER( TRIM( lp.tvotnam)) = 'U'
  THEN
    at_v01           := STRING_TO_ARRAY( lp.ttmsg01, ';', 'NULL')    ; 
	at_v02           := STRING_TO_ARRAY( lp.ttmsg03, ';', 'NULL')    ; 
	
  WHEN       UPPER( TRIM( lp.tvotnam)) = 'W'
  THEN
    at_v01           := STRING_TO_ARRAY( lp.ttmsg02, ';', 'NULL')    ; 

  ELSE
    lg.tlcncl        := TRUE                                         ;
    lg.ttlogd        := CONCAT('ERR No puede armar ' , UPPER( TRIM( lp.tvotnam))) ;
    lg               := log_msg( lg)                                 ;  
  END CASE           ;
  
  i_lv01             := ARRAY_LENGTH( at_v01, 1)                     ;
  i_lv02             := ARRAY_LENGTH( at_v02, 1)                     ;
 
  IF         lg.tlcncl = FALSE 
  AND        i_lv01    = 0
  THEN
    lg.tlcncl        := TRUE                                         ;
    lg.ttlogd        := 'ERR No informo ningun datos '               ;
    lg               := log_msg( lg)                                 ; 
  END IF             ;	
  
  IF         lg.tlcncl = FALSE 
  AND        UPPER( TRIM( lp.tvotnam)) = 'U'
  AND        i_lv02    = 0
  THEN
    lg.tlcncl        := TRUE                                         ;
    lg.ttlogd        := 'ERR No informo ningun datos '               ;
    lg               := log_msg( lg)                                 ; 
  END IF             ;	
  
  IF         lg.tlcncl = FALSE
  THEN  
    t_au01           := utl_rtv_tbl_fld( lp.ttschnm, lp.tttabnm)     ;
    at_a01           := STRING_TO_ARRAY( t_au01, '#', 'NULL')        ; 
    t_au01           := at_a01[1]                                    ;
    at_fld           := STRING_TO_ARRAY( t_au01, ';', 'NULL')        ; 
    t_au01           := at_a01[2]                                    ;
    at_pre           := STRING_TO_ARRAY( t_au01, ';', 'NULL')        ;
    t_au01           := at_a01[3]                                    ;
    at_sub           := STRING_TO_ARRAY( t_au01, ';', 'NULL')        ; 
    t_au01           := at_a01[4]                                    ;
    ab_nul           := STRING_TO_ARRAY( t_au01, ';', 'NULL')        ; 
    i_lfld           := ARRAY_LENGTH( at_fld,1)                      ;
    lg.tlcncl        := log_cncl( lg)                                ;
  END IF             ;
 
  IF         lg.tlcncl = FALSE
  AND        l_ok01    = TRUE
  THEN
    i_au01           := 0                                            ;
	
	WHILE    i_lfld   > i_au01
	LOOP
	  i_au01         := i_au01 + 1                                   ;
	  t_au01         := TRIM( at_fld[i_au01])                        ; 
	  
	  CASE
	  WHEN   i_lv01   <  i_au01   AND  ab_nul[i_au01] = FALSE 
	  THEN
	    lg.tlcncl    := TRUE                                         ;
	    lg.ttlogd    := CONCAT('ERR Debe informar :', t_au01)        ;
        lg           := log_msg( lg)                                 ;  

	  WHEN   i_lv01   >= i_au01   AND  ab_nul[i_au01] = FALSE 
	   AND   CHARACTER_LENGTH( TRIM( at_v01[i_au01])) = 0
	  THEN
	    lg.tlcncl    := TRUE                                         ;
	    lg.ttlogd    := CONCAT('ERR No se informo ', t_au01)         ;
        lg           := log_msg( lg)                                 ; 
		
	  ELSE
      END CASE       ;		
    END LOOP         ;
  END IF             ;

  IF         lg.tlcncl = FALSE	
  THEN
    i_au01           := 0                                            ;
	
	WHILE    i_lfld   > i_au01
	LOOP
	  i_au01         := i_au01 + 1                                   ;
	  
	  IF     i_lv01  >= i_au01
      AND 	 CHARACTER_LENGTH( TRIM( at_v01[i_au01])) > 0 
	  THEN
        at_fl01      := ARRAY_APPEND( at_fl01, at_fld[i_au01])       ;
		at_pr01      := ARRAY_APPEND( at_pr01, at_pre[i_au01])       ;
        at_va01      := ARRAY_APPEND( at_va01, at_v01[i_au01])       ;
        at_su01      := ARRAY_APPEND( at_su01, at_sub[i_au01])       ; 
	  END IF         ;
	  
	  IF     i_lv02  >= i_au01
      AND 	 CHARACTER_LENGTH( TRIM( at_v02[i_au01])) > 0 
	  THEN
        at_fl02      := ARRAY_APPEND( at_fl02, at_fld[i_au01])       ;
		at_pr02      := ARRAY_APPEND( at_pr02, at_pre[i_au01])       ;
        at_va02      := ARRAY_APPEND( at_va02, at_v02[i_au01])       ;
        at_su02      := ARRAY_APPEND( at_su02, at_sub[i_au01])       ; 
	  END IF         ;
	END LOOP         ;

    i_lf01           := ARRAY_LENGTH( at_fl01, 1)                    ;
	i_lf02           := ARRAY_LENGTH( at_fl02, 1)                    ;	
	
	IF       i_lv01  >  0
    AND      i_lf01  =  0
	THEN
	  lg.tlcncl      := TRUE                                         ;
	  lg.ttlogd      := 'ERR No se omitieron los datos informados'   ;
	  lg             := log_msg( lg)                                 ; 
	END IF           ;
	
  	IF       i_lv02  >  0
    AND      i_lf02  =  0
	THEN
	  lg.tlcncl      := TRUE                                         ;
	  lg.ttlogd      := 'ERR No se omitieron los datos informados'   ;
	  lg             := log_msg( lg)                                 ; 
	END IF           ;
  END IF             ;

  IF         lg.tlcncl = FALSE	
  THEN
    i_lv01           := ARRAY_LENGTH( at_fl01, 1)                    ;
	i_lv02           := ARRAY_LENGTH( at_fl02, 1)                    ;
	i_au01           := 0                                            ;
	
	WHILE    i_lf01   > 0
	AND      i_lf01   > i_au01
	LOOP
	  i_au01         := i_au01 + 1                                   ;
	  t_vu01         := CONCAT( TRIM( at_pr01[i_au01]), TRIM( at_va01[i_au01]), TRIM( at_su01[i_au01])) ;
	  t_au01         := CONCAT( TRIM( at_fl01[i_au01]), ' # '                 , TRIM( at_va01[i_au01])) ;
	  
	  IF     CHARACTER_LENGTH( TRIM( at_su01[i_au01])) = 0
	  THEN
	    BEGIN
		  b_au01     := t_vu01                                       ;
		  
		  EXCEPTION WHEN OTHERS 
	      THEN
	        lg.tlcncl:= TRUE                                         ;
	        lg.ttlogd:= CONCAT( 'ERR ', t_au01)                      ;
	        lg       := log_msg( lg)                                 ; 			  
		END          ;
      END IF         ;

	  IF     STRPOS( at_su01[i_au01], 'date') > 0			  
	  THEN
	    BEGIN
		  d_au01     := at_va01[i_au01] :: date                      ;
		  
		  EXCEPTION WHEN OTHERS 
	      THEN
	        lg.tlcncl:= TRUE                                         ;
	        lg.ttlogd:= CONCAT( 'ERR ', t_au01)                      ;
	        lg       := log_msg( lg)                                 ; 			  
		END          ;
      END IF         ;
    END LOOP         ;
	
	i_au01           := 0                                            ;
	
	WHILE    i_lf02   > 0
	AND      i_lf02   > i_au01
	LOOP
	  i_au01         := i_au01 + 1                                   ;
	  t_vu01         := CONCAT( TRIM( at_pr02[i_au01]), TRIM( at_va02[i_au01]), TRIM( at_su02[i_au01])) ;  
	  t_au01         := CONCAT( TRIM( at_fl02[i_au01]), ' # '                 , TRIM( at_va02[i_au01])) ;
	  
	  IF     CHARACTER_LENGTH( TRIM( at_su02[i_au01])) = 0
	  THEN
	    BEGIN
		  b_au01     := t_vu01                                       ;
		  
		  EXCEPTION WHEN OTHERS 
	      THEN
	        lg.tlcncl:= TRUE                                         ;
	        lg.ttlogd:= CONCAT( 'ERR ', t_au01)                      ;
	        lg       := log_msg( lg)                                 ; 			  
		END          ;
      END IF         ;
	  
	  IF     STRPOS( at_su01[i_au01], 'date') > 0			 
	  THEN
	    BEGIN
		  d_au01     := at_va02[i_au01] :: date                      ;
		  
		  EXCEPTION WHEN OTHERS 
	      THEN
	        lg.tlcncl:= TRUE                                         ;
	        lg.ttlogd:= CONCAT( 'ERR ', t_au01)                      ;
	        lg       := log_msg( lg)                                 ; 			  
		END          ;
      END IF         ;
    END LOOP         ;
  END IF             ;
	
  IF                         lg.tlcncl = FALSE
  AND        UPPER( TRIM( lp.tvotnam)) = 'D'
  THEN
    i_au01           := 0                                            ;
	
	WHILE    i_lv01   > i_au01
	LOOP
	  i_au01         := i_au01 + 1                                   ;
	  t_au01         := CONCAT( TRIM(at_fl01[i_au01]), ' = '       , TRIM(at_pr01[i_au01]));
	  t_au01         := CONCAT( TRIM(t_au01), TRIM(at_va01[i_au01]), TRIM(at_su01[i_au01])); 
	  at_sn01        := ARRAY_APPEND( at_sn01, t_au01)                                     ;
	END LOOP         ;
	
	t_au01           := ARRAY_TO_STRING( at_sn01, ' AND ', 'NULO')      ; 
    t_sn01           := CONCAT( 'DELETE FROM ', TRIM( lp.ttschnm), '.' ); 
	t_sn01           := CONCAT(  TRIM( t_sn01), TRIM( lp.tttabnm)      );
	t_sn01           := CONCAT(  TRIM( t_sn01), ' WHERE'               );
	t_sn01           := CONCAT(  TRIM( t_sn01), ' ', TRIM( t_au01)     );
	lp.ttsentn       := TRIM( t_sn01)                                   ;      
  END IF             ;
  
  IF                         lg.tlcncl = FALSE
  AND        UPPER( TRIM( lp.tvotnam)) = 'I'
  THEN
    i_au01           := 0                                            ;
	
	WHILE    i_lv01   > i_au01
	LOOP
	  i_au01         := i_au01 + 1                                   ;
	  t_au01         := CONCAT( TRIM(at_pr01[i_au01]), TRIM(at_va01[i_au01]));
	  t_au01         := CONCAT( TRIM(t_au01)         , TRIM(at_su01[i_au01])); 
	  at_sn01        := ARRAY_APPEND( at_sn01, t_au01)               ;
	END LOOP         ;
	
	t_au01           := ARRAY_TO_STRING( at_fl01, ' , ', 'NULO')     ; 
    t_sn01           := CONCAT( 'INSERT INTO '       , TRIM( lp.ttschnm), '.' ); 
	t_sn01           := CONCAT(  TRIM( t_sn01)       , TRIM( lp.tttabnm)      );
	t_sn01           := CONCAT(  TRIM( t_sn01), ' ( ', TRIM( t_au01)          );
	
	t_au01           := ARRAY_TO_STRING( at_sn01, ' , ', 'NULO')     ; 
	t_sn01           := CONCAT(  TRIM( t_sn01), ') VALUES( ', TRIM( t_au01), ')');
	
	lp.ttsentn       := TRIM( t_sn01)                                ;      
  END IF             ;
  
  IF                         lg.tlcncl = FALSE
  AND        UPPER( TRIM( lp.tvotnam)) = 'S'
  THEN
    t_au01           := ARRAY_TO_STRING( at_fl01, ' , ', 'NULO')     ; 
	t_sn01           := CONCAT( 'SELECT '                , TRIM( t_au01)    ); 
    t_sn01           := CONCAT( TRIM( t_sn01) , ' FROM ' , TRIM( lp.ttschnm)); 
	t_sn01           := CONCAT( TRIM( t_sn01) , '.'      , TRIM( lp.tttabnm));
		
	lp.ttsentn       := TRIM( t_sn01)                                ;      
  END IF             ;
  
  IF                         lg.tlcncl = FALSE
  AND        UPPER( TRIM( lp.tvotnam)) = 'U'
  THEN
    i_au01           := 0                                            ;
	
	WHILE    i_lv01   > i_au01
	LOOP
	  i_au01         := i_au01 + 1                                   ;
	  t_au01         := CONCAT( TRIM(at_fl01[i_au01]), ' ='                      );
	  t_au01         := CONCAT( TRIM(t_au01)         , ' '          , TRIM(at_pr01[i_au01]));
	  t_au01         := CONCAT( TRIM(t_au01) , TRIM(at_va01[i_au01]), TRIM(at_su01[i_au01])); 
	  at_sn01        := ARRAY_APPEND( at_sn01, t_au01)               ;
	END LOOP         ;
  
    i_au01           := 0                                            ;
	
	WHILE    i_lv02   > i_au01
	LOOP
	  i_au01         := i_au01 + 1                                   ;
	  t_au01         := CONCAT( TRIM(at_fl02[i_au01]), ' ='                                );
	  t_au01         := CONCAT( TRIM(t_au01)         , ' '          , TRIM(at_pr02[i_au01]));
	  t_au01         := CONCAT( TRIM(t_au01) , TRIM(at_va02[i_au01]), TRIM(at_su02[i_au01])); 
	  at_sn02        := ARRAY_APPEND( at_sn02, t_au01)               ;
	END LOOP         ;

    t_au01           := ARRAY_TO_STRING( at_sn01, ' , ', 'NULO')     ; 
	t_sn01           := CONCAT( 'UPDATE ', TRIM( lp.ttschnm), '.', TRIM( lp.tttabnm)); 
	t_sn01           := CONCAT( TRIM( t_sn01) , ' SET '          , TRIM( t_au01)    );

    t_au01           := ARRAY_TO_STRING( at_sn02, ' AND ', 'NULO')   ; 
	t_sn01           := CONCAT( TRIM( t_sn01) , ' WHERE '        , TRIM( t_au01)    );
		
	lp.ttsentn       := TRIM( t_sn01)                                ;  
  END IF             ;
  
  IF                         lg.tlcncl = FALSE
  AND        UPPER( TRIM( lp.tvotnam)) = 'W'
  THEN
    i_au01           := 0                                            ;
	
	WHILE    i_lv01   > i_au01
	LOOP
	  i_au01         := i_au01 + 1                                   ;
	  t_au01         := CONCAT( TRIM(at_fl01[i_au01]), ' ='                      );
	  t_au01         := CONCAT( TRIM(t_au01)         , ' '          , TRIM(at_pr01[i_au01]));
	  t_au01         := CONCAT( TRIM(t_au01) , TRIM(at_va01[i_au01]), TRIM(at_su01[i_au01])); 
	  at_sn01        := ARRAY_APPEND( at_sn01, t_au01)               ;
	END LOOP         ;
	
	t_au01           := ARRAY_TO_STRING( at_fl01, ' , ', 'NULO')     ; 
	t_sn01           := CONCAT( 'SELECT '                , TRIM( t_au01)    ); 
    t_sn01           := CONCAT( TRIM( t_sn01) , ' FROM ' , TRIM( lp.ttschnm)); 
	t_sn01           := CONCAT( TRIM( t_sn01) , '.'      , TRIM( lp.tttabnm));
	
	t_au01           := ARRAY_TO_STRING( at_sn01, ' AND ', 'NULO')   ; 
	t_sn01           := CONCAT( TRIM( t_sn01) , ' WHERE ' , TRIM( t_au01)); 
		
	lp.ttsentn       := TRIM( t_sn01)                                ;  
  END IF             ;      

  lg.ttlogd          := ''                                           ;
  ej                 := log_fin( lg)                                 ; 
  
  IF         lg.tlcncl= TRUE
  AND        ej.tlejfn= TRUE  
  THEN 
    RAISE NOTICE 'Cancela %', lg.ttpgin                              ;
  END IF             ;
  RETURN( lp)        ;
END                  ;
$_$;
 6   DROP FUNCTION sc_e001.icr_arm_sent(sc_e003.t_logpet);
       sc_e001          postgres    false    6    924            ?           0    0 '   FUNCTION icr_arm_sent(sc_e003.t_logpet)    COMMENT     W   COMMENT ON FUNCTION sc_e001.icr_arm_sent(sc_e003.t_logpet) IS 'Armar sentencia field';
          sc_e001          postgres    false    256                       1255    17311    icr_chk_msg(sc_e003.t_logpet)    FUNCTION     "  CREATE FUNCTION sc_e001.icr_chk_msg(sc_e003.t_logpet) RETURNS record
    LANGUAGE plpgsql SECURITY DEFINER
    AS $_$
DECLARE
  t_scnm             text              ;
  t_tbnm             text              ;
  t_au01             text              ;
  b_cont             bigint            ;
  i_au01             integer           ;
  
  at_i01             text[]            ;
  at_o01             text[]            ;
   
  vm          vi_apptbo%ROWTYPE ;  

  lp           t_logpet%ROWTYPE ;   
  lg           t_logcmp%ROWTYPE ;
  ej           t_logfin%ROWTYPE ;

BEGIN
  lg                 := log_ini()                                    ;
  lp                 := $1                                           ;
    
-- Chequeos 01 
--    datos recibido vs reales

-- Chequeos 02
  IF         lg.tlcncl= FALSE
  THEN
  
    SELECT   INTO  b_cont COUNT(0)
	         FROM  p_apptbo
            WHERE  fvapals = lp.tvapalsre
              AND  fvtbals = lp.tvtbalsre
			  AND  fvotals = lp.tvotalsre
			  AND  finvlus = lp.tinvlus	                             ;

    IF       b_cont   = 0
    THEN
	  lg.tlcncl      := TRUE                                         ;
	  lg.tlpubl      := TRUE                                         ;
	  lg.ttlogd      := 'Error en los datos de conexion'             ;
	  
	  t_au01         := CONCAT(                  'tvapalsre/', lp.tvapalsre);
	  t_au01         := CONCAT( TRIM( t_au01), '/ tvtbalsre/', lp.tvtbalsre);
	  t_au01         := CONCAT( TRIM( t_au01), '/ tvotalsre/', lp.tvotalsre);
	  t_au01         := CONCAT( TRIM( t_au01),   '/ tinvlus/', lp.tinvlus  );
	  
      lg             := log_msg( lg)                                 ;  
	  lg.ttlogd      := CONCAT( 'ERR Tabla p_apptbo ', TRIM( t_au01));
	  lg             := log_msg( lg)                                 ;  
	  
	ELSE  
	  SELECT INTO  vm  * 
	         FROM  vi_apptbo
            WHERE  fvapals = lp.tvapalsre
              AND  fvtbals = lp.tvtbalsre
			  AND  fvotals = lp.tvotalsre
			  AND  finvlus = lp.tinvlus	                             ;	  
  
 	  lp.ttschnm     := utl_rtv_sch_tbl( vm.fvtbnam)                 ;
      lp.tttabnm     := vm.fvtbnam                                   ;
	  lp.tlrtchk     := vm.flrtchk                                   ;
	  lp.tbrtcnt     := vm.fbrtcnt                                   ;
	  lp.tvotnam     := vm.fvotnam                                   ;
	  lg.tlcncl      := log_cncl( lg)                                ;
    END IF           ;	  
  END IF             ;

-- Chequeos 03
  IF         lg.tlcncl= FALSE
  THEN
    at_i01[1]        := lp.ttmsg01re                                 ;
	at_i01[2]        := lp.ttmsg02re                                 ;
	at_i01[3]        := lp.ttmsg03re                                 ;
	at_o01[1]        := ' '                                          ;
	at_o01[2]        := ' '                                          ;
	at_o01[3]        := ' '                                          ;
	
	IF       vm.fiotv01 > 0
	THEN 
	  i_au01         := vm.fiotv01                                   ;
	  t_au01         := TRIM( at_i01[i_au01])                        ;
	  at_o01[1]      := t_au01                                       ;
	END IF           ;
	
	IF       vm.fiotv02 > 0
	THEN 
	  i_au01         := vm.fiotv02                                   ;
	  t_au01         := TRIM( at_i01[i_au01])                        ;
	  at_o01[2]      := t_au01                                       ;
	END IF           ;
	
	IF       vm.fiotv03 > 0
	THEN 
	  i_au01         := vm.fiotv03                                   ;
	  t_au01         := TRIM( at_i01[i_au01])                        ;
	  at_o01[3]      := t_au01                                       ;
	END IF           ;

    lp.ttmsg01       := at_o01[1]                                    ;
	lp.ttmsg02       := at_o01[2]                                    ;
	lp.ttmsg03       := at_o01[3]                                    ;
	lp               := icr_arm_sent( lp)                            ;
	lg.tlcncl        := log_cncl( lg)                                ;
  END IF            ;
  
  lg.ttlogd          := CONCAT( 'REC t_logpet ', lp)                 ;	 
  lg                 := log_msg( lg)                                 ;	    	
 
  lg.ttlogd          := ''                                           ;
  ej                 := log_fin( lg)                                 ; 
  
  IF         lg.tlcncl= TRUE
  AND        ej.tlejfn= TRUE  
  THEN 
    RAISE NOTICE 'Cancela %', lg.ttpgin                              ;
  END IF             ;
  RETURN( lp)        ;
END                  ;
$_$;
 5   DROP FUNCTION sc_e001.icr_chk_msg(sc_e003.t_logpet);
       sc_e001          postgres    false    6    924            ?           0    0 &   FUNCTION icr_chk_msg(sc_e003.t_logpet)    COMMENT     Q   COMMENT ON FUNCTION sc_e001.icr_chk_msg(sc_e003.t_logpet) IS 'Chequear Mensaje';
          sc_e001          postgres    false    263                       1255    17312 "   icr_ejecutar_sol(sc_e003.t_logpet) 	   PROCEDURE     ?  CREATE PROCEDURE sc_e001.icr_ejecutar_sol(IN sc_e003.t_logpet)
    LANGUAGE plpgsql SECURITY DEFINER
    AS $_$
DECLARE
  t_estt             text              ;
  t_emsg             text              ;
  t_edtl             text              ;
  t_ehnt             text              ;
  t_ecnt             text              ;
  b_pcnt             bigint            ;
 
  lp           t_logpet%ROWTYPE ;   
  lg           t_logcmp%ROWTYPE ;
  ej           t_logfin%ROWTYPE ;
   	
BEGIN
  lg                 := log_ini()                                    ;
  lp                 := $1                                           ;
  lg.ttlogd          := CONCAT( 'SNT ', TRIM( lp.ttsentn))           ;	 
  lg                 := log_msg( lg)                                 ;

  BEGIN
	EXECUTE  lp.ttsentn                                              ;
	GET DIAGNOSTICS b_pcnt =  ROW_COUNT                              ;
	  
	EXCEPTION WHEN OTHERS 
	THEN
      GET STACKED DIAGNOSTICS t_estt = RETURNED_SQLSTATE,
                              t_emsg = MESSAGE_TEXT,
                              t_edtl = PG_EXCEPTION_DETAIL,
                              t_ehnt = PG_EXCEPTION_HINT,
                              t_ecnt = PG_EXCEPTION_CONTEXT          ;
	  lg.tlcncl      := TRUE                                         ;    
  END                ;
	
  IF         lg.tlcncl= TRUE
  THEN
    IF       LEFT( t_emsg, 1) = '('
	THEN
	  CALL   p_logcmp_insert( t_emsg)                                ;

    ELSE
	  lg.ttlogd      := t_emsg                                       ;
	  lg             := log_msg( lg)                                 ;	
	END IF           ;
	  
  ELSE
    lg.ttlogd        := CONCAT( '# ', b_pcnt, ' procesadas')         ;  
    lg               := log_msg( lg)                                 ;		  
  END IF             ;   

  lg.ttlogd          := ''                                           ;
  ej                 := log_fin( lg)                                 ; 
  
  IF         lg.tlcncl= TRUE
  AND        ej.tlejfn= TRUE  
  THEN 
    RAISE NOTICE 'Cancela %', lg.ttpgin                              ;
  END IF             ;
END                  ;
$_$;
 >   DROP PROCEDURE sc_e001.icr_ejecutar_sol(IN sc_e003.t_logpet);
       sc_e001          postgres    false    924    6            ?           0    0 /   PROCEDURE icr_ejecutar_sol(IN sc_e003.t_logpet)    COMMENT     \   COMMENT ON PROCEDURE sc_e001.icr_ejecutar_sol(IN sc_e003.t_logpet) IS 'Ejecutar Solicitud';
          sc_e001          postgres    false    272                       1255    17313    icr_err(bigint)    FUNCTION     I  CREATE FUNCTION sc_e001.icr_err(bigint) RETURNS SETOF text
    LANGUAGE plpgsql SECURITY DEFINER
    AS $_$
DECLARE
  t_rtrn             text              ;
  i_au01             integer           ;
   	
BEGIN
  i_au01             := 0                                            ;
  
  FOR        t_rtrn  IN  SELECT  CONCAT( fafccr, ';', TRIM( ftlogd))
                           FROM  p_logpub
						  WHERE  fberrn = $1
					   ORDER BY  fbseqn
  LOOP
    i_au01           := 1                                            ;
	RETURN NEXT t_rtrn                                               ;
  END LOOP           ;
  
  IF         i_au01   = 0
  THEN
    t_rtrn           := '--- Sin Datos de Errores ---'               ;
	RETURN NEXT t_rtrn                                               ;
  END IF             ;
END                  ;
$_$;
 '   DROP FUNCTION sc_e001.icr_err(bigint);
       sc_e001          postgres    false    6            ?           0    0    FUNCTION icr_err(bigint)    COMMENT     H   COMMENT ON FUNCTION sc_e001.icr_err(bigint) IS 'Errores Ejecucion ICR';
          sc_e001          postgres    false    273                       1255    17314    icr_procesar_sol(text) 	   PROCEDURE     ?  CREATE PROCEDURE sc_e001.icr_procesar_sol(IN text)
    LANGUAGE plpgsql SECURITY DEFINER
    AS $_$
DECLARE
 
  lp           t_logpet%ROWTYPE ;   
  lg           t_logcmp%ROWTYPE ;
  ej           t_logfin%ROWTYPE ;
   	
BEGIN
  lg                 := log_ini()                                    ;
  lp                 := icr_trd_msg( $1)                             ;
  lg.tlcncl          := log_cncl( lg)                                ;
  
  IF         lg.tlcncl= FALSE
  THEN
    lp               := icr_chk_msg( lp)                             ;
	lg.tlcncl        := log_cncl( lg)                                ;
	
	IF       lg.tlcncl= FALSE
	THEN
	  CALL   icr_ejecutar_sol( lp)                                   ;
	  lg.tlcncl      := log_cncl( lg)                                ;
	END IF           ;
  END IF             ;
 
  lg.ttlogd          := ''                                           ;
  ej                 := log_fin( lg)                                 ; 
  
  IF         lg.tlcncl= TRUE
  AND        ej.tlejfn= TRUE  
  THEN 
    RAISE NOTICE 'Cancela %', lg.ttpgin                              ;
  END IF             ;
END                  ;
$_$;
 2   DROP PROCEDURE sc_e001.icr_procesar_sol(IN text);
       sc_e001          postgres    false    6            ?           0    0 #   PROCEDURE icr_procesar_sol(IN text)    COMMENT     P   COMMENT ON PROCEDURE sc_e001.icr_procesar_sol(IN text) IS 'Procesar Solicitud';
          sc_e001          postgres    false    274                       1255    17315    icr_sol(text)    FUNCTION     ?  CREATE FUNCTION sc_e001.icr_sol(text) RETURNS bigint
    LANGUAGE plpgsql SECURITY DEFINER
    AS $_$
DECLARE
  b_rtrn             bigint            ;
  t_au01             text              ;
  i_ln01             integer           ;
       
  lg         t_logcmp%ROWTYPE ;
  ej         t_logfin%ROWTYPE ;
   	
BEGIN
  lg                 := log_ini()                                    ;
  b_rtrn             := 0                                            ;
  lg.ttlogd          := CONCAT('PARM /', TRIM( $1), '/')             ;	
  lg                 := log_msg( lg)                                 ;  
 
  IF         CHARACTER_LENGTH( TRIM( $1))  <  3
  THEN
    lg.tlcncl        := TRUE                                         ;
	lg.tlpubl        := TRUE                                         ;
	lg.ttlogd        := CONCAT('# Se recibieron datos erroneos.')    ;
    lg               := log_msg( lg)                                 ;  
	
  ELSE 
    CALL     icr_procesar_sol( $1)                                   ;
	lg.tlcncl        := log_cncl( lg)                                ;
  END IF             ;	

  lg.ttlogd          := ''                                           ;
  ej                 := log_fin( lg)                                 ;
  
  IF         lg.tlcncl= TRUE
  AND        ej.tlejfn= TRUE  
  THEN 
    b_rtrn           := ej.tbejer                                    ;
  END IF             ;
  RETURN( b_rtrn)    ;
END                  ;
$_$;
 %   DROP FUNCTION sc_e001.icr_sol(text);
       sc_e001          postgres    false    6            ?           0    0    FUNCTION icr_sol(text)    COMMENT     >   COMMENT ON FUNCTION sc_e001.icr_sol(text) IS 'Solicitud ICR';
          sc_e001          postgres    false    276                       1255    17316    icr_trd_msg(text)    FUNCTION     ?  CREATE FUNCTION sc_e001.icr_trd_msg(text) RETURNS record
    LANGUAGE plpgsql SECURITY DEFINER
    AS $_$
DECLARE
  t_au01             text              ;  
  i_ln01             integer           ;

  at_a01             text[]            ;

  lp           t_logpet%ROWTYPE ;   
  lg           t_logcmp%ROWTYPE ;
  ej           t_logfin%ROWTYPE ;

BEGIN
  lg                 := log_ini()                                    ;
  lp.tinpid          := lg.tinpid                                    ;
  lp.ttuser          := lg.ttuser                                    ;
  lp.tafcin          := lg.tafcin                                    ;
  lp.ttpgin          := lg.ttpgin                                    ;
  lp.tinvlus         := 10                                           ;
  i_ln01             := CHARACTER_LENGTH( TRIM( $1))                 ;

-- Control 01 
     
  IF         i_ln01   = 0
  THEN
    lg.tlcncl        := TRUE                                         ;
    lg.ttlogd        := 'ERR Mensaje Vacio'                          ;	 
	lg               := log_msg( lg)                                 ;
  ELSE 
  
    IF       STRPOS( $1, '#/') = 0         
    THEN
      lg.tlcncl      := TRUE                                         ;
      lg.ttlogd      := 'ERR No tiene partes de Mensaje'             ;	 
	  lg             := log_msg( lg)                                 ;
    END IF           ;	  
  END IF             ;
 
-- Control 02
 
  IF         lg.tlcncl= FALSE 
  THEN
    at_a01           := STRING_TO_ARRAY( $1, '#/', 'NULO')           ;
	i_ln01           := ARRAY_LENGTH( at_a01, 1)                     ;
	
	IF       i_ln01   < 3
	THEN
      lg.tlcncl      := TRUE                                         ;
      lg.ttlogd      := CONCAT( 'ERR Falta ', 3 - i_ln01, ' partes') ;
  	  lg             := log_msg( lg)                                 ;
    END IF           ;
  END IF 	         ;
 
-- Control 03

  IF         lg.tlcncl= FALSE 
  THEN
    t_au01           := at_a01[1]                                    ; 
	i_ln01           := CHARACTER_LENGTH( TRIM( t_au01))             ;
	
	IF       i_ln01   = 0
	THEN
	  lg.tlcncl      := TRUE                                         ;
      lg.ttlogd      := 'ERR longitud parte 1 - Nula'                ;	 
	  lg             := log_msg( lg)                                 ;
	ELSE 
	  lp             := icr_trd_msg01( t_au01, lp)                   ;
	END IF           ;
	
    t_au01           := at_a01[2]                                    ; 
	i_ln01           := CHARACTER_LENGTH( TRIM( t_au01))             ;
	
	IF       i_ln01   = 0
	THEN
	  lg.tlcncl      := TRUE                                         ;
      lg.ttlogd      := 'ERR longitud parte 2 - Nula'                ;	 
	  lg             := log_msg( lg)                                 ;
	ELSE 
	   lp            := icr_trd_msg02( t_au01, lp)                   ;
	END IF           ;
	
	t_au01           := at_a01[3]                                    ; 
	i_ln01           := CHARACTER_LENGTH( TRIM( t_au01))             ;
	
	IF       i_ln01   = 0
	THEN
	  lg.tlcncl      := TRUE                                         ;
      lg.ttlogd      := 'ERR longitud parte 3 - Nula'                ;		 
	  lg             := log_msg( lg)                                 ;
	ELSE 
	  lp             := icr_trd_msg03( t_au01, lp)                   ;
	END IF           ;	
  END IF             ;
 
-- Control 04

  IF         lg.tlcncl= FALSE 
  THEN 
    lg.tlcncl        := log_cncl( lg)                                ;
  END IF             ;
  
  lg.ttlogd          := CONCAT( 'REC t_logpet ', lp)                 ;	 
  lg                 := log_msg( lg)                                 ;	    	
  
  lg.ttlogd          := ''                                           ;
  ej                 := log_fin( lg)                                 ; 
  
  IF         lg.tlcncl= TRUE
  AND        ej.tlejfn= TRUE  
  THEN 
    RAISE NOTICE 'Cancela %', lg.ttpgin                              ;
  END IF             ;
  RETURN ( lp)       ;
END                  ;
$_$;
 )   DROP FUNCTION sc_e001.icr_trd_msg(text);
       sc_e001          postgres    false    6            ?           0    0    FUNCTION icr_trd_msg(text)    COMMENT     M   COMMENT ON FUNCTION sc_e001.icr_trd_msg(text) IS 'Traducir Mensaje Inicial';
          sc_e001          postgres    false    277                       1255    17317 %   icr_trd_msg01(text, sc_e003.t_logpet)    FUNCTION       CREATE FUNCTION sc_e001.icr_trd_msg01(text, sc_e003.t_logpet) RETURNS record
    LANGUAGE plpgsql SECURITY DEFINER
    AS $_$
DECLARE
  t_au01             text              ;  
  i_ln01             integer           ;

  at_a01             text[]            ;

  lp           t_logpet%ROWTYPE ;   
  lg           t_logcmp%ROWTYPE ;
  ej           t_logfin%ROWTYPE ;

BEGIN
  lg                 := log_ini()                                    ;
  at_a01             := STRING_TO_ARRAY( $1, ';', 'NULO')            ;
  lp                 := $2                                           ;
  i_ln01             := ARRAY_LENGTH( at_a01, 1)                     ;
 
  IF         i_ln01   < 2
  THEN
	lg.tlcncl        := TRUE                                         ;
    lg.ttlogd        := 'ERR Falta Nro Autenticacion'                ;	 
	lg               := log_msg( lg)                                 ;
  
  ELSE
    t_au01           := TRIM( at_a01[2])                             ; 
	i_ln01           := CHARACTER_LENGTH( t_au01)                    ;
	  
	IF       i_ln01   = 0
	THEN
	  lg.tlcncl      := TRUE                                         ;
      lg.ttlogd      := 'ERR Nro Autenticacion en blanco'            ;	 
	  lg             := log_msg( lg)                                 ;	
	  
    ELSE
	  BEGIN
	    lp.tbnrautre := t_au01 :: bigint                             ;
		EXCEPTION WHEN OTHERS 
	    THEN
		  lg.tlcncl  := TRUE                                         ;
          lg.ttlogd  := 'ERR Nro Autenticacion'                      ;	 
	      lg         := log_msg( lg)                                 ;	 
	  END          ; 
    END IF         ;	  
  END IF           ;  
  
  lg.ttlogd          := ''                                           ;
  ej                 := log_fin( lg)                                 ; 
  
  IF         lg.tlcncl= TRUE
  AND        ej.tlejfn= TRUE  
  THEN 
    RAISE NOTICE 'Cancela %', lg.ttpgin                              ;
  END IF             ;
  RETURN( lp)        ;
END                  ;
$_$;
 =   DROP FUNCTION sc_e001.icr_trd_msg01(text, sc_e003.t_logpet);
       sc_e001          postgres    false    924    6            ?           0    0 .   FUNCTION icr_trd_msg01(text, sc_e003.t_logpet)    COMMENT     b   COMMENT ON FUNCTION sc_e001.icr_trd_msg01(text, sc_e003.t_logpet) IS 'Traducir Mensaje Parte 01';
          sc_e001          postgres    false    278                       1255    17318 %   icr_trd_msg02(text, sc_e003.t_logpet)    FUNCTION     ?
  CREATE FUNCTION sc_e001.icr_trd_msg02(text, sc_e003.t_logpet) RETURNS record
    LANGUAGE plpgsql SECURITY DEFINER
    AS $_$
DECLARE
  t_au01             text              ;  
  i_ln01             integer           ;

  at_a01             text[]            ;

  lp           t_logpet%ROWTYPE ;   
  lg           t_logcmp%ROWTYPE ;
  ej           t_logfin%ROWTYPE ;

BEGIN
  lg                 := log_ini()                                    ;
  at_a01             := STRING_TO_ARRAY( $1, ';', 'NULO')            ;
  lp                 := $2                                           ;
  i_ln01             := ARRAY_LENGTH( at_a01, 1)                     ;
 
  IF         i_ln01   < 4
  THEN
	lg.tlcncl        := TRUE                                         ;
    lg.ttlogd        := 'ERR Falta datos en Parte 02 del Mensje'     ;	 
	lg               := log_msg( lg)                                 ;
  
  ELSE
    t_au01           := TRIM( at_a01[2])                             ; 
	i_ln01           := CHARACTER_LENGTH( t_au01)                    ;
	  
	IF       i_ln01   = 0
	THEN
	  lg.tlcncl      := TRUE                                         ;
      lg.ttlogd      := 'ERR Falta Codigo operacion'                 ;	 
	  lg             := log_msg( lg)                                 ;	
	  
    ELSE
	  lp.tvotalsre   := t_au01                                       ;
    END IF           ;
	
    t_au01           := TRIM( at_a01[3])                             ; 
	i_ln01           := CHARACTER_LENGTH( t_au01)                    ;
	  
	IF       i_ln01   = 0
	THEN
	  lg.tlcncl      := TRUE                                         ;
      lg.ttlogd      := 'ERR Falta Alias de la tabla'                ;	 
	  lg             := log_msg( lg)                                 ;	
	  
    ELSE
	  lp.tvtbalsre   := t_au01                                       ;
    END IF           ;	

    t_au01           := TRIM( at_a01[4])                             ; 
	i_ln01           := CHARACTER_LENGTH( t_au01)                    ;
	  
	IF       i_ln01   = 0
	THEN
	  lg.tlcncl      := TRUE                                         ;
      lg.ttlogd      := 'ERR Falta Alias de la Appp'                 ;	 
	  lg             := log_msg( lg)                                 ;	
	  
    ELSE
	  lp.tvapalsre   := t_au01                                       ;
    END IF           ;	
  END IF             ;  
  
  lg.ttlogd          := ''                                           ;
  ej                 := log_fin( lg)                                 ; 
  
  IF         lg.tlcncl= TRUE
  AND        ej.tlejfn= TRUE  
  THEN 
    RAISE NOTICE 'Cancela %', lg.ttpgin                              ;
  END IF             ;
  RETURN( lp)        ;
END                  ;
$_$;
 =   DROP FUNCTION sc_e001.icr_trd_msg02(text, sc_e003.t_logpet);
       sc_e001          postgres    false    924    6            ?           0    0 .   FUNCTION icr_trd_msg02(text, sc_e003.t_logpet)    COMMENT     b   COMMENT ON FUNCTION sc_e001.icr_trd_msg02(text, sc_e003.t_logpet) IS 'Traducir Mensaje Parte 02';
          sc_e001          postgres    false    279                       1255    17319 %   icr_trd_msg03(text, sc_e003.t_logpet)    FUNCTION     ?  CREATE FUNCTION sc_e001.icr_trd_msg03(text, sc_e003.t_logpet) RETURNS record
    LANGUAGE plpgsql SECURITY DEFINER
    AS $_$
DECLARE
  t_au01             text              ;  
  t_va01             text              ;
  t_va02             text              ;
  t_va03             text              ;
  i_ln01             integer           ;

  at_a01             text[]            ;

  lp           t_logpet%ROWTYPE ;   
  lg           t_logcmp%ROWTYPE ;
  ej           t_logfin%ROWTYPE ;

BEGIN
  lg                 := log_ini()                                    ;
  at_a01             := STRING_TO_ARRAY( $1, '/#', 'NULO')           ;
  lp                 := $2                                           ;
  i_ln01             := ARRAY_LENGTH( at_a01, 1)                     ;
  
  IF         i_ln01   < 4
  THEN
    lg.tlcncl        := TRUE                                         ;
    lg.ttlogd        := CONCAT( 'ERR Falta ', 3 - i_ln01, ' valores');
  	lg               := log_msg( lg)                                 ;
  
  ELSE
    t_va01           := TRIM( at_a01[1])                             ;
	t_va02           := TRIM( at_a01[3])                             ;
	t_va03           := TRIM( at_a01[4])                             ;
	lp.ttmsg01re     := t_va01                                       ;
	lp.ttmsg02re     := t_va02                                       ;
	lp.ttmsg03re     := t_va03                                       ;
	
	IF       CHARACTER_LENGTH( t_va01) = 0
	AND      CHARACTER_LENGTH( t_va02) = 0
	AND      CHARACTER_LENGTH( t_va03) = 0
	THEN
	  lg.tlcncl      := TRUE                                         ;
      lg.ttlogd      := CONCAT( 'ERR Los valores no estan')          ;
  	  lg             := log_msg( lg)                                 ;
	END IF           ;
  END IF             ;
 
  lg.ttlogd          := ''                                           ;
  ej                 := log_fin( lg)                                 ; 
  
  IF         lg.tlcncl= TRUE
  AND        ej.tlejfn= TRUE  
  THEN 
    RAISE NOTICE 'Cancela %', lg.ttpgin                              ;
  END IF             ;
  RETURN( lp)        ;
END                  ;
$_$;
 =   DROP FUNCTION sc_e001.icr_trd_msg03(text, sc_e003.t_logpet);
       sc_e001          postgres    false    924    6            ?           0    0 .   FUNCTION icr_trd_msg03(text, sc_e003.t_logpet)    COMMENT     b   COMMENT ON FUNCTION sc_e001.icr_trd_msg03(text, sc_e003.t_logpet) IS 'Traducir Mensaje Parte 03';
          sc_e001          postgres    false    280            ?            1259    17320    p_icrad    TABLE     ?   CREATE TABLE sc_e001.p_icrad (
    fbc01 bigint NOT NULL,
    fvc02 character varying(50) NOT NULL,
    fdc03d date NOT NULL,
    fdc04h date,
    fbc11 bigint NOT NULL,
    fdc05 date
);
    DROP TABLE sc_e001.p_icrad;
       sc_e001         heap    postgres    false    6            ?           0    0    TABLE p_icrad    COMMENT     3   COMMENT ON TABLE sc_e001.p_icrad IS 'ICR Datos a';
          sc_e001          postgres    false    219            ?           0    0    COLUMN p_icrad.fbc01    COMMENT     8   COMMENT ON COLUMN sc_e001.p_icrad.fbc01 IS 'Campo C01';
          sc_e001          postgres    false    219            ?           0    0    COLUMN p_icrad.fvc02    COMMENT     8   COMMENT ON COLUMN sc_e001.p_icrad.fvc02 IS 'Campo C02';
          sc_e001          postgres    false    219            ?           0    0    COLUMN p_icrad.fdc03d    COMMENT     ?   COMMENT ON COLUMN sc_e001.p_icrad.fdc03d IS 'Campo C03 Desde';
          sc_e001          postgres    false    219            ?           0    0    COLUMN p_icrad.fdc04h    COMMENT     ?   COMMENT ON COLUMN sc_e001.p_icrad.fdc04h IS 'Campo C04 Hasta';
          sc_e001          postgres    false    219            ?           0    0    COLUMN p_icrad.fbc11    COMMENT     8   COMMENT ON COLUMN sc_e001.p_icrad.fbc11 IS 'Campo C11';
          sc_e001          postgres    false    219            ?           0    0    COLUMN p_icrad.fdc05    COMMENT     8   COMMENT ON COLUMN sc_e001.p_icrad.fdc05 IS 'Campo C05';
          sc_e001          postgres    false    219                       1255    17323 $   p_icrad_delete_chek(sc_e001.p_icrad) 	   PROCEDURE       CREATE PROCEDURE sc_e001.p_icrad_delete_chek(IN sc_e001.p_icrad)
    LANGUAGE plpgsql
    AS $_$
DECLARE
  a_fccr             timestamp with time zone ;
  t_au01             text                     ;
  
  lg           t_logcmp%ROWTYPE ;
  ej           t_logfin%ROWTYPE ;
   	
BEGIN
  a_fccr             := CLOCK_TIMESTAMP()                            ;
  lg                 := log_ini( 'P')                                ;
  
  IF         $1.fdc04h IS NULL
  AND        $1.fdc03d <= CURRENT_DATE
  THEN
    lg.tlcncl        := TRUE                                         ;
    lg.ttlogd        := 'Registro vigente '                          ;	 
	lg               := log_msg( lg)                                 ;
  END  IF            ;
  
  IF         $1.fdc04h  IS NOT NULL
  AND        $1.fdc03d  <= CURRENT_DATE 
  AND        $1.fdc04h  >= CURRENT_DATE
  THEN
    lg.tlcncl        := TRUE                                         ;
    lg.ttlogd        := 'Registro vigente '                          ;	 
	lg               := log_msg( lg)                                 ;
  END  IF            ;
 
  lg.ttlogd          := ''                                           ;
  ej                 := log_fin( lg)                                 ;

  IF         lg.tlcncl = TRUE  
  THEN
    lg.tafccr        := a_fccr                                       ; 
    t_au01           := log_rcp( lg)                                 ;
    RAISE EXCEPTION '%', t_au01                                      ;
  END IF             ;
END                  ;
$_$;
 @   DROP PROCEDURE sc_e001.p_icrad_delete_chek(IN sc_e001.p_icrad);
       sc_e001          postgres    false    219    6            ?           0    0 1   PROCEDURE p_icrad_delete_chek(IN sc_e001.p_icrad)    COMMENT     `   COMMENT ON PROCEDURE sc_e001.p_icrad_delete_chek(IN sc_e001.p_icrad) IS 'Check Delete p_icrad';
          sc_e001          postgres    false    281                       1255    17324 $   p_icrad_insert_chek(sc_e001.p_icrad) 	   PROCEDURE     	  CREATE PROCEDURE sc_e001.p_icrad_insert_chek(IN sc_e001.p_icrad)
    LANGUAGE plpgsql
    AS $_$
DECLARE
  a_fccr             timestamp with time zone ;
  t_au01             text                     ;
  b_cn01             bigint            ;
  b_cn02             bigint            ;
  
  lg           t_logcmp%ROWTYPE ;
  ej           t_logfin%ROWTYPE ;
    	
BEGIN
  a_fccr             := CLOCK_TIMESTAMP()                            ;
  lg                 := log_ini( 'P')                                ;
  
  SELECT     INTO  b_cn01  COUNT(1)
             FROM  p_icrbd 
		    WHERE  fbc11 = $1.fbc11                            
			  AND  fdc14 IS NOT NULL                                 ;
			  
  IF         b_cn01   = 1
  THEN
    SELECT   INTO  b_cn02  COUNT(1)
             FROM  p_icrbd
			WHERE  fbc11 = $1.fbc11                            
			  AND  fdc14 < CURRENT_DATE                              ;
						   
    IF       b_con01  = 0
	THEN 
	  lg.tlcncl      := TRUE                                         ;
      lg.ttlogd      := 'tabla_c.fbc11 tiene fdc14 < Current_date'   ;	 
	  lg             := log_msg( lg)                                 ;
    END IF           ;
  END IF             ;	
  
  IF         $1.fdc04h IS NULL
  AND        $1.fdc05  IS NOT NULL
  THEN
 	lg.tlcncl        := TRUE                                         ;
    lg.ttlogd        := 'p_icrad.fbc04h Null no puede informar fdc05';	
    lg               := log_msg( lg)                                 ;	
  END IF             ;	
  
  IF         $1.fdc04h IS NOT NULL
  AND        $1.fdc05  IS NOT NULL
  AND        $1.fdc04h > $1.fdc05
  THEN
  	lg.tlcncl        := TRUE                                         ;
    lg.ttlogd        := 'tabla no puede informar fdc05 < fdc04h'     ;	
    lg               := log_msg( lg)                                 ;		
  END IF             ;	
  
  lg.ttlogd          := ''                                           ;
  ej                 := log_fin( lg)                                 ;
  
  IF         lg.tlcncl = TRUE  
  THEN
    lg.tafccr        := a_fccr                                       ; 
    t_au01           := log_rcp( lg)                                 ;
    RAISE EXCEPTION '%', t_au01                                      ;
  END IF             ;
END                  ;
$_$;
 @   DROP PROCEDURE sc_e001.p_icrad_insert_chek(IN sc_e001.p_icrad);
       sc_e001          postgres    false    6    219            ?           0    0 1   PROCEDURE p_icrad_insert_chek(IN sc_e001.p_icrad)    COMMENT     `   COMMENT ON PROCEDURE sc_e001.p_icrad_insert_chek(IN sc_e001.p_icrad) IS 'Check Insert p_icrad';
          sc_e001          postgres    false    282                       1255    17325 5   p_icrad_update_chek(sc_e001.p_icrad, sc_e001.p_icrad) 	   PROCEDURE     {  CREATE PROCEDURE sc_e001.p_icrad_update_chek(IN sc_e001.p_icrad, IN sc_e001.p_icrad)
    LANGUAGE plpgsql
    AS $$
DECLARE
  a_fccr             timestamp with time zone ;
  t_au01             text                     ;
 
  lg           t_logcmp%ROWTYPE ;
  ej           t_logfin%ROWTYPE ;
   	
BEGIN
  a_fccr             := CLOCK_TIMESTAMP()                            ;
  lg                 := log_ini( 'P')                                ;
 
  lg.ttlogd          := ''                                           ;
  ej                 := log_fin( lg)                                 ;

  IF         lg.tlcncl = TRUE  
  THEN
    lg.tafccr        := a_fccr                                       ; 
    t_au01           := log_rcp( lg)                                 ;
    RAISE EXCEPTION '%', t_au01                                      ;
  END IF             ;
END                  ;
$$;
 T   DROP PROCEDURE sc_e001.p_icrad_update_chek(IN sc_e001.p_icrad, IN sc_e001.p_icrad);
       sc_e001          postgres    false    6    219            ?           0    0 E   PROCEDURE p_icrad_update_chek(IN sc_e001.p_icrad, IN sc_e001.p_icrad)    COMMENT     t   COMMENT ON PROCEDURE sc_e001.p_icrad_update_chek(IN sc_e001.p_icrad, IN sc_e001.p_icrad) IS 'Check Update p_icrad';
          sc_e001          postgres    false    275            9           1255    17735 "   copy_table(text, text, text, text)    FUNCTION     ?  CREATE FUNCTION sc_e002.copy_table(sc_origen text, sc_destino text, t_origen text, t_destino text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
	declare
	contador bigint; 
	error_1 boolean= sc_e002.tbl_check(t_origen, sc_origen);
	error_2  boolean= sc_e002.tbl_empty(t_origen);

	begin
	
	-- Chequea que el schema sea valido
	
	SELECT into contador COUNT(1) 
	FROM sc_e004.vi_anl_schs
	WHERE sch_nam = sc_origen;
	IF contador = 0 
	THEN 
	RAISE notice '% no es válido', sc_origen; 
	RETURN (FALSE);
	END IF;
	IF error_1 = TRUE THEN 
		IF error_2 = TRUE THEN
					CALL monitoreo_insert(sc_origen, sc_destino, t_origen, t_destino);
					
		END IF;
	END IF;
	RETURN TRUE;
	end;
	
$$;
 b   DROP FUNCTION sc_e002.copy_table(sc_origen text, sc_destino text, t_origen text, t_destino text);
       sc_e002          postgres    false    10                       1255    17327 (   monitoreo_insert(text, text, text, text) 	   PROCEDURE     ?  CREATE PROCEDURE sc_e002.monitoreo_insert(IN sc_origen text, IN sc_destino text, IN t_origen text, IN t_destino text)
    LANGUAGE plpgsql
    AS $$
DECLARE
  t_estt             text              ;
  t_emsg             text              ;
  t_edtl             text              ;
  t_ehnt             text              ;
  t_ecnt             text              ;
  b_pcnt             bigint            ;
  destino text = CONCAT(' INSERT INTO ', sc_destino,'.',t_destino);
  origen text = CONCAT(' SELECT * FROM ', sc_origen, '.', t_origen);
	BEGIN
		EXECUTE 
			destino;
		SELECT * FROM sc_origen.t_origen;
		
		GET DIAGNOSTICS b_pcnt =  ROW_COUNT;
		
		EXCEPTION WHEN OTHERS 
		THEN
      	GET STACKED DIAGNOSTICS t_estt = RETURNED_SQLSTATE,
                              t_emsg = MESSAGE_TEXT,
                              t_edtl = PG_EXCEPTION_DETAIL,
                              t_ehnt = PG_EXCEPTION_HINT,
                              t_ecnt = PG_EXCEPTION_CONTEXT;
	END;
$$;
 u   DROP PROCEDURE sc_e002.monitoreo_insert(IN sc_origen text, IN sc_destino text, IN t_origen text, IN t_destino text);
       sc_e002          postgres    false    10                       1255    17328    p_icrad_trigger_before()    FUNCTION     ?	  CREATE FUNCTION sc_e002.p_icrad_trigger_before() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
  
DECLARE
  a_fccr             timestamp with time zone ;
  t_au01             text              ;

  ro            p_icrad%ROWTYPE ;
  rn            p_icrad%ROWTYPE ;
  
  lg           t_logcmp%ROWTYPE ;
  ej           t_logfin%ROWTYPE ;

BEGIN
  a_fccr             := CLOCK_TIMESTAMP()                            ;
  lg                 := log_ini( 'F')                                ;
  
  CASE 
  WHEN       TG_TABLE_NAME = 'p_icrad'
  AND        TG_OP         = 'DELETE'
  AND        TG_WHEN       = 'BEFORE'
  THEN
    ro               := OLD                                          ;
	call     p_icrad_delete_chek( ro)                                ;
	lg.tlcncl        := log_cncl( lg)                                ;
	
  WHEN       TG_TABLE_NAME = 'p_icrad'
  AND        TG_OP         = 'INSERT'
  AND        TG_WHEN       = 'BEFORE'
  THEN
    rn               := NEW                                          ;
	call     p_icrad_insert_chek( rn)                                ;
	lg.tlcncl        := log_cncl( lg)                                ;
	
  WHEN       TG_TABLE_NAME = 'p_icrad'
  AND        TG_OP         = 'UPDATE'
  AND        TG_WHEN       = 'BEFORE'
  THEN
    ro               := OLD                                          ;
    rn               := NEW                                          ;
	call     p_icrad_update_chek( rn, ro)                            ;
	lg.tlcncl        := log_cncl( lg)                                ;
		
  ElSE
 	lg.ttlogd        := 'Trigger no soporta'                         ;
	lg.ttlogd        := CONCAT( TRIM( lg.ttlogd), ' ', TRIM( TG_TABLE_NAME)) ;
	lg.ttlogd        := CONCAT( TRIM( lg.ttlogd), '-', TRIM( TG_OP))         ;
	lg.ttlogd        := CONCAT( TRIM( lg.ttlogd), '-', TRIM( TG_WHEN))       ;
	lg               := log_msg( lg)                                 ;
	lg.tlcncl        := TRUE                                         ;	
  END CASE           ;	
  
  lg.ttlogd          := ''                                           ;
  ej                 := log_fin( lg)                                 ;
  
  IF        lg.tlcncl = TRUE
  THEN
    lg.tafccr        := a_fccr                                       ; 
    t_au01           := log_rcp( lg)                                 ;
    RAISE EXCEPTION '%', t_au01                                      ;
  END IF             ;
  RETURN NEW         ;
END                  ;
$$;
 0   DROP FUNCTION sc_e002.p_icrad_trigger_before();
       sc_e002          postgres    false    10            ?           0    0 !   FUNCTION p_icrad_trigger_before()    COMMENT     R   COMMENT ON FUNCTION sc_e002.p_icrad_trigger_before() IS 'Trigger p_icrad before';
          sc_e002          postgres    false    284                       1255    17329    tbl_check(text, text)    FUNCTION     ?  CREATE FUNCTION sc_e002.tbl_check(tbl_name text, sch_name text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$

DECLARE
 contador bigint;
BEGIN 

SELECT INTO contador COUNT(1)
	FROM sc_e004.vv_anl_objs
	WHERE 
		obj_typ = 'tabla' AND 
		obj_sch = sch_name AND
		obj_nam = tbl_name;
	IF contador = 0 THEN
	RAISE NOTICE 'La tabla %, no se encuentra en el Schema %', tbl_name, sch_name;
	RETURN (FALSE);
	END IF;
	
	RETURN (TRUE);

END;
$$;
 ?   DROP FUNCTION sc_e002.tbl_check(tbl_name text, sch_name text);
       sc_e002          postgres    false    10                       1255    17330    tbl_empty(text)    FUNCTION     ?  CREATE FUNCTION sc_e002.tbl_empty(tbl_name text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
	DECLARE 
	contador bigint;
	snt_sql text ;
	BEGIN 
	snt_sql = CONCAT( ' SELECT count(0)	FROM ',  tbl_name) ;
	RAISE NOTICE '%', snt_sql;
	FOR contador IN execute snt_sql
	LOOP
	END LOOP ;
	
	IF contador = 0 THEN 
	RAISE NOTICE 'La tabla % se encuentra vacía', tbl_name;
	RETURN (FALSE);
	END IF;
	
	RETURN (TRUE);
	END;
	
$$;
 0   DROP FUNCTION sc_e002.tbl_empty(tbl_name text);
       sc_e002          postgres    false    10                       1255    17331    log_cncl(sc_e003.t_logcmp)    FUNCTION     ?  CREATE FUNCTION sc_e003.log_cncl(sc_e003.t_logcmp) RETURNS boolean
    LANGUAGE plpgsql SECURITY DEFINER
    AS $_$
DECLARE
  l_rtrn             boolean           ;
  b_cont             bigint            ;
 
BEGIN
  l_rtrn             := FALSE                                        ;	
  SELECT     INTO  b_cont  COUNT(0) 
             FROM  p_logcmp
  		    WHERE  finpid  = $1.tinpid 
		      AND  ftuser  = $1.ttuser
		      AND  fafcin  = $1.tafcin
		      AND  ftpgin  = $1.ttpgin 
		      AND  flcncl  = TRUE                                    ;

  IF         b_cont   > 0
  THEN
    l_rtrn           := TRUE                                         ;	 
  END IF             ;	
  RETURN( l_rtrn)    ;				   
END                  ;
$_$;
 2   DROP FUNCTION sc_e003.log_cncl(sc_e003.t_logcmp);
       sc_e003          postgres    false    918    4            ?           0    0 #   FUNCTION log_cncl(sc_e003.t_logcmp)    COMMENT     X   COMMENT ON FUNCTION sc_e003.log_cncl(sc_e003.t_logcmp) IS 'Recuperar Cancel desde Log';
          sc_e003          postgres    false    287                        1255    17332    log_fin(sc_e003.t_logcmp)    FUNCTION     j  CREATE FUNCTION sc_e003.log_fin(sc_e003.t_logcmp) RETURNS record
    LANGUAGE plpgsql SECURITY DEFINER
    AS $_$
DECLARE
  a_fcin             timestamp with time zone ;  
  b_rtrn             bigint            ;
 
  t_au01             text              ;   
  t_au02             text              ;    
    
  at_a01             text[]            ;
  
  lg                 t_logcmp%ROWTYPE ;
  ej                 t_logfin%ROWTYPE ;
         
BEGIN
  ej.tlejfn          := FALSE                                        ;
  ej.tbejer          := 0                                            ;
  lg.tinpid          := $1.tinpid                                    ;
  lg.ttuser          := $1.ttuser                                    ;
  lg.tafcin          := $1.tafcin                                    ;
  lg.tafccr          := CLOCK_TIMESTAMP()                            ;
  lg.tbseqn          := $1.tbseqn                                    ;
  lg.ttpgin          := $1.ttpgin                                    ;
  lg.ttpgcr          := $1.ttpgcr                                    ;
  lg.tlcncl          := $1.tlcncl                                    ;
  lg.ttlogd          := $1.ttlogd                                    ;
  lg.tlpubl          := $1.tlpubl                                    ;
  lg.ttapus          := $1.ttapus                                    ;
  lg.ttaprl          := $1.ttaprl                                    ;
  lg.ttlfin          := FALSE                                        ;
  
  IF         CHARACTER_LENGTH( TRIM( lg.ttlogd)) > 0
  THEN 
    lg.ttlfin        := FALSE                                        ;
    CALL     p_logcmp_insert( lg)                                    ;
	lg.tafccr        := CLOCK_TIMESTAMP()                            ;
	lg.tbseqn        := lg.tbseqn + 1                                ;
	lg.tlpubl        := FALSE                                        ;
  END IF             ;
  
  lg.tafccr          := CLOCK_TIMESTAMP()                            ;
   
  at_a01             := STRING_TO_ARRAY( lg.ttpgcr, '(', 'NULL')     ; 
  t_au01             := utl_rtv_prc_cmnt( TRIM( at_a01[1]))          ; 
  at_a01             := STRING_TO_ARRAY( t_au01, ';', 'NULL')        ; 
  
  t_au01             := INITCAP( at_a01[1])                          ; 
  t_au02             := INITCAP( at_a01[2])                          ; 
  lg.ttlogd          := CONCAT( '# Final '  , TRIM( t_au02))         ;
    
  IF         lg.tlcncl  = TRUE
  THEN
    lg.ttlogd        := CONCAT( '# Cancelo '  , TRIM( t_au02));
  END IF             ;
  
  a_fcin             := $1.tafccr                                    ;
  IF         lg.ttpgin = lg.ttpgcr
  THEN
    ej.tlejfn        := TRUE                                         ;
    a_fcin           := $1.tafcin                                    ;
  END IF             ;
 
  lg.tlpubl          := TRUE                                           ;
  lg.ttlfin          := TRUE                                           ;
  t_au02             := CONCAT( '#T : ', lg.tafccr - a_fcin)           ;
  lg.ttlogd          := CONCAT( TRIM( lg.ttlogd) , ' ', TRIM( t_au02)) ;
  CALL       p_logcmp_insert( lg)                                      ;
  
  IF         ej.tlejfn = TRUE 	
  AND        lg.tlcncl = TRUE  
  THEN
	ej.tbejer        := log_gen_publ( lg)                           ;
  END IF             ;
  RETURN( ej)        ;
END;
$_$;
 1   DROP FUNCTION sc_e003.log_fin(sc_e003.t_logcmp);
       sc_e003          postgres    false    918    4            ?           0    0 "   FUNCTION log_fin(sc_e003.t_logcmp)    COMMENT     H   COMMENT ON FUNCTION sc_e003.log_fin(sc_e003.t_logcmp) IS 'Msg Fin Log';
          sc_e003          postgres    false    288            !           1255    17333    log_gen_publ(sc_e003.t_logcmp)    FUNCTION     ;  CREATE FUNCTION sc_e003.log_gen_publ(sc_e003.t_logcmp) RETURNS bigint
    LANGUAGE plpgsql SECURITY DEFINER
    AS $_$
DECLARE
  b_rtrn             bigint            ;
  b_seqn             bigint            ;

  lc                 p_logcmp%ROWTYPE ;   
  lp                 p_logpub%ROWTYPE ;
         
BEGIN
  SELECT     INTO  b_rtrn  COALESCE(MAX(fberrn), 0)
	         FROM  p_logpub
			 WHERE finpid = $1.tinpid                                ;
  b_rtrn             := b_rtrn + 1                                   ;
  b_seqn             := 0                                            ;
  
  FOR        lc      IN SELECT  *
                          FROM  p_logcmp
                         WHERE  finpid  =  $1.tinpid  
                           AND  ftuser  =  $1.ttuser
                           AND  fafcin  =  $1.tafcin
                           AND  ftpgcr  =  $1.ttpgcr
						   AND  flpubl  =  TRUE
					  ORDER BY  fafccr, fbseqn 
  LOOP
    b_seqn           := b_seqn + 1                                   ;
    lp.finpid        := lc.finpid                                    ;     
	lp.fberrn        := b_rtrn                                       ;
	lp.fbseqn        := b_seqn                                       ;
	lp.fafccr        := lc.fafccr                                    ;
	lp.ftlogd        := lc.ftlogd                                    ;
	
	INSERT   INTO p_logpub(   finpid,    fberrn,    fbseqn,    fafccr,    ftlogd)
	                      VALUES (lp.finpid, lp.fberrn, lp.fbseqn, lp.fafccr, lp.ftlogd);
  END LOOP           ;
  RETURN( b_rtrn)    ;
END;
$_$;
 6   DROP FUNCTION sc_e003.log_gen_publ(sc_e003.t_logcmp);
       sc_e003          postgres    false    918    4            ?           0    0 '   FUNCTION log_gen_publ(sc_e003.t_logcmp)    COMMENT     U   COMMENT ON FUNCTION sc_e003.log_gen_publ(sc_e003.t_logcmp) IS 'Generar Log Publico';
          sc_e003          postgres    false    289            "           1255    17334    log_get_stack()    FUNCTION       CREATE FUNCTION sc_e003.log_get_stack() RETURNS text
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
  t_rtrn             text              ;
  t_func             text              ;
  t_au01             text              ;
  t_au02             text              ;
  t_au03             text              ;
  i_ln01             integer           ;
  i_la01             integer           ;
  i_au01             integer           ;
  i_au02             integer           ;

  at_a01             text[]            ;
  at_a02             text[]            ;  
     
BEGIN
  GET DIAGNOSTICS t_au01 = PG_CONTEXT                                ;
    
  t_func             := '.log_get_stack()'                           ;
  at_a01             := STRING_TO_ARRAY( t_au01, '/pgSQL', 'NULL')   ;
  i_la01             := ARRAY_LENGTH( at_a01, 1)                     ;
  i_au01             := 0                                            ;
    
  WHILE      i_la01  >  i_au01
  LOOP
    i_au01           := i_au01 + 1                                   ;
    t_au02           := at_a01[i_au01]                               ;
	i_au02           := POSITION( ')' IN t_au02)                     ;
	
	IF       i_au02  >  0
	THEN
      t_au03         := TRIM(SUBSTRING( t_au02 FROM 1 FOR  i_au02))  ;
	  i_au02         := POSITION( '.' IN t_au03)                     ;
	  
	  IF     i_au02  =  0
	  THEN
        t_au03       := CONCAT( TRIM( CURRENT_SCHEMA), '.', TRIM( t_au03)) ;
	  END IF         ;
	  
	  IF     STRPOS( t_au03, t_func) = 0
	  THEN 
	    at_a02       := ARRAY_PREPEND( t_au03, at_a02 )              ;  
      END IF         ;		
	END IF           ;
  END LOOP           ;

-- Prepara para Log
  t_au01             := ARRAY_TO_STRING( at_a02, ';', 'NULL')        ;	
  at_a01             := STRING_TO_ARRAY( t_au01, ';', 'NULL')        ; 
  i_ln01             := ARRAY_LENGTH( at_a01, 1)                     ;
  t_au02             := 'in;cr;0'                                    ;
  at_a02             := STRING_TO_ARRAY( t_au02, ';', 'NULL')        ; 
   
  CASE
  WHEN       i_ln01   = 0
  THEN 
    at_a02[1]        := CONCAT( 'Session ', pg_backend_pid() )       ;
	at_a02[2]        := 'pgm 0'                                      ;
  WHEN       i_ln01   = 1  
  THEN
    at_a02[1]        := CONCAT( 'Session ', pg_backend_pid() )       ;
	at_a02[2]        := at_a01[1]                                    ; 
  ELSE
    i_ln01           := i_ln01 - 1                                   ;
	at_a02[1]        := at_a01[1]                                    ;
	at_a02[2]        := at_a01[i_ln01]                               ;  
	at_a02[3]        := i_ln01                                       ;
  END CASE           ;
  
  t_rtrn             := ARRAY_TO_STRING( at_a02, ';', 'NULL')        ;	 
  RETURN t_rtrn      ;
END;
$$;
 '   DROP FUNCTION sc_e003.log_get_stack();
       sc_e003          postgres    false    4            ?           0    0    FUNCTION log_get_stack()    COMMENT     P   COMMENT ON FUNCTION sc_e003.log_get_stack() IS 'Recuperar Func/Proc del Stack';
          sc_e003          postgres    false    290            #           1255    17335 	   log_ini()    FUNCTION     ?  CREATE FUNCTION sc_e003.log_ini() RETURNS record
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
  t_au01             text              ;
  i_ln01             integer           ;
  i_fact             integer           ;
  
  at_a01             text[]            ;
  
  lg                 t_logcmp%ROWTYPE ;
      
BEGIN
  lg.tinpid          := pg_backend_pid()                             ;
  lg.ttuser          := SESSION_USER                                 ;
  lg.tafcin          := CLOCK_TIMESTAMP()                            ;
  lg.tafccr          := CLOCK_TIMESTAMP()                            ;
  lg.tlcncl          := FALSE                                        ;
  lg.ttlogd          := ''                                           ;       
  lg.tlpubl          := FALSE                                        ;
  lg.ttapus          := ''                                           ;
  lg.ttaprl          := ''                                           ; 
  lg.ttlfin          := FALSE                                        ;

  t_au01             := log_get_stack()                              ;
  at_a01             := STRING_TO_ARRAY( t_au01, ';', 'NULL')        ; 
  lg.ttpgin          := at_a01[1]                                    ;
  lg.ttpgcr          := at_a01[2]                                    ;
  i_fact             := at_a01[3]                                    ;
  
  IF         i_fact   > 1
  THEN
    lg.tbseqn        := ( 10 ^ i_fact) + 1                           ;  
  ELSE 
    lg.tbseqn        := 1                                            ;	
  END IF             ;
  
  at_a01             := STRING_TO_ARRAY( lg.ttpgcr, '(', 'NULL')     ; 
  t_au01             := utl_rtv_prc_cmnt( TRIM( at_a01[1]))          ; 
  at_a01             := STRING_TO_ARRAY( t_au01, ';', 'NULL')        ; 
  
  IF         lg.ttpgin  = lg.ttpgcr  
  THEN
    t_au01           := INITCAP( at_a01[2])                          ; 
    lg.ttlogd        := CONCAT('# Inicio :', TRIM( t_au01))          ;
	lg.tlpubl        := TRUE                                         ;  
 
  ELSE
    t_au01           := INITCAP( at_a01[1])                          ; 
    lg.ttlogd        := CONCAT( '# Inicio ', TRIM( t_au01), ' : ')   ;
    t_au01           := INITCAP( at_a01[2])                          ; 
    lg.ttlogd        := CONCAT( TRIM( lg.ttlogd), ' ', TRIM( t_au01));

    SELECT   INTO  lg.tafcin  MAX( fafcin)  
	         FROM  p_logcmp
		    WHERE  finpid = lg.tinpid
		      AND  ftuser = lg.ttuser 
		      AND  ftpgin = lg.ttpgin 
		      AND  ftpgcr = lg.ttpgin  
		      AND  fbseqn = 1                                        ;
  END IF             ;
   
  CALL       p_logcmp_insert( lg)                                    ;
  lg.tbseqn          := lg.tbseqn + 1                                ;
  lg.tlpubl          := FALSE                                        ;  
  RETURN( lg)        ;
END                  ;
$$;
 !   DROP FUNCTION sc_e003.log_ini();
       sc_e003          postgres    false    4            ?           0    0    FUNCTION log_ini()    COMMENT     8   COMMENT ON FUNCTION sc_e003.log_ini() IS 'Iniciar Log';
          sc_e003          postgres    false    291            $           1255    17336    log_msg(sc_e003.t_logcmp)    FUNCTION     ?  CREATE FUNCTION sc_e003.log_msg(sc_e003.t_logcmp) RETURNS record
    LANGUAGE plpgsql SECURITY DEFINER
    AS $_$
DECLARE 
  a_fccr             timestamp with time zone ; 
  
  lg                 t_logcmp%ROWTYPE ;
 
BEGIN
  lg                 := $1                                           ;
  
  SELECT     INTO  a_fccr MAX( fafccr)
             FROM  p_logcmp
            WHERE  finpid  = lg.tinpid
		      AND  ftuser  = lg.ttuser 
		      AND  ftpgin  = lg.ttpgin 
		      AND  fafcin  = lg.tafcin
              AND  fafccr >= lg.tafccr                               ;

  IF 	     a_fccr   > lg.tafccr     
  THEN
    lg.tafccr        := CLOCK_TIMESTAMP()                            ;	
  END IF             ;
  
  CALL       p_logcmp_insert( lg)                             ;
  lg.tbseqn          := lg.tbseqn + 1                                ;
  lg.tlpubl          := FALSE                                        ;    
  RETURN( lg)        ; 
END                  ;
$_$;
 1   DROP FUNCTION sc_e003.log_msg(sc_e003.t_logcmp);
       sc_e003          postgres    false    4    918            ?           0    0 "   FUNCTION log_msg(sc_e003.t_logcmp)    COMMENT     H   COMMENT ON FUNCTION sc_e003.log_msg(sc_e003.t_logcmp) IS 'Mensaje Log';
          sc_e003          postgres    false    292            %           1255    17337    log_rcp(sc_e003.t_logcmp)    FUNCTION     ?  CREATE FUNCTION sc_e003.log_rcp(sc_e003.t_logcmp) RETURNS text
    LANGUAGE plpgsql SECURITY DEFINER
    AS $_$  
DECLARE
  t_rtrn             text              ;
  t_au01             text              ;
  i_au01             integer           ;
  
  at_a01             text[]            ;
   
  lg                 t_logcmp%ROWTYPE ;

BEGIN
  t_rtrn             := 'Cancelo'                                    ;
  i_au01             := 0                                            ;
  
  FOR        lg      IN  SELECT  *
                           FROM  p_logcmp
						  WHERE  finpid  = $1.tinpid
						    AND  ftuser  = $1.ttuser
							AND  fafcin  = $1.tafcin
							AND  ftpgin  = $1.ttpgin
							AND  ftpgcr  = $1.ttpgcr
							AND  fafccr >= $1.tafccr
  LOOP
    i_au01           := 1                                            ;
    t_au01           := lg                                           ;
	at_a01           := ARRAY_APPEND( at_a01, t_au01)                ;
  END LOOP           ;
  
  IF         i_au01   > 0
  THEN 
    t_rtrn           := ARRAY_TO_STRING( at_a01, ';', 'NULL')        ;
  END IF             ;
 
  RETURN( t_rtrn)    ;
END                  ;
$_$;
 1   DROP FUNCTION sc_e003.log_rcp(sc_e003.t_logcmp);
       sc_e003          postgres    false    918    4            ?           0    0 "   FUNCTION log_rcp(sc_e003.t_logcmp)    COMMENT     Y   COMMENT ON FUNCTION sc_e003.log_rcp(sc_e003.t_logcmp) IS 'Recuperar Log para Execption';
          sc_e003          postgres    false    293            &           1255    17338    p_logcmp_insert(text) 	   PROCEDURE       CREATE PROCEDURE sc_e003.p_logcmp_insert(IN text)
    LANGUAGE plpgsql SECURITY DEFINER
    AS $_$
DECLARE
  i_au01             integer           ;
  i_ln01             integer           ;
 
  at_a01             text[]            ;
  
  lg                 t_logcmp%ROWTYPE ;
   	
BEGIN
  at_a01             := STRING_TO_ARRAY( $1, ';', 'NULL')            ;
  i_ln01             := ARRAY_LENGTH( at_a01, 1)                     ;
  i_au01             := 0                                            ;
  
  WHILE      i_ln01   > i_au01
  LOOP
    i_au01           := i_au01 + 1                                   ;
	lg               := at_a01[i_au01]                               ;
	CALL     p_logcmp_insert( lg)                             ;
  END LOOP           ;
END                  ;
$_$;
 1   DROP PROCEDURE sc_e003.p_logcmp_insert(IN text);
       sc_e003          postgres    false    4            ?           0    0 "   PROCEDURE p_logcmp_insert(IN text)    COMMENT     W   COMMENT ON PROCEDURE sc_e003.p_logcmp_insert(IN text) IS 'Insertar p_logcmp ( array)';
          sc_e003          postgres    false    294            '           1255    17339 !   p_logcmp_insert(sc_e003.t_logcmp) 	   PROCEDURE     E  CREATE PROCEDURE sc_e003.p_logcmp_insert(IN sc_e003.t_logcmp)
    LANGUAGE plpgsql SECURITY DEFINER
    AS $_$
DECLARE
        
BEGIN
  INSERT     INTO p_logcmp(    finpid,    ftuser,    fafcin,    fafccr,    fbseqn,    
                               ftpgin,    ftpgcr,    flcncl,    ftlogd,    flpubl,    
					           ftapus,    ftaprl,    ftlfin)
	               VALUES ( $1.tinpid, $1.ttuser, $1.tafcin, $1.tafccr, $1.tbseqn, 
					        $1.ttpgin, $1.ttpgcr, $1.tlcncl, $1.ttlogd, $1.tlpubl, 
					        $1.ttapus, $1.ttaprl, $1.ttlfin) ;

END                  ;
$_$;
 =   DROP PROCEDURE sc_e003.p_logcmp_insert(IN sc_e003.t_logcmp);
       sc_e003          postgres    false    918    4            ?           0    0 .   PROCEDURE p_logcmp_insert(IN sc_e003.t_logcmp)    COMMENT     Z   COMMENT ON PROCEDURE sc_e003.p_logcmp_insert(IN sc_e003.t_logcmp) IS 'Insertar p_logcmp';
          sc_e003          postgres    false    295            (           1255    17340    utl_acm_pronam(text)    FUNCTION     h  CREATE FUNCTION sc_e003.utl_acm_pronam(text) RETURNS text
    LANGUAGE plpgsql SECURITY DEFINER
    AS $_$
DECLARE
  t_rtrn             text              ;
  t_au01             text              ; 
  i_ln01             integer           ;
  i_au01             integer           ; 
  i_au02             integer           ;  
   	
BEGIN
  t_au01             := TRIM( REPLACE( $1, ')', ' '))                ;
  i_ln01             := CHARACTER_LENGTH( t_au01)                    ;
  
  IF         i_ln01   > 0
  THEN
    i_au01           := STRPOS( t_au01, '.')                         ;
  
    IF       i_au01   > 0
    THEN
	  i_au02         := i_ln01 - i_au01                              ;
	  t_au01         := TRIM( RIGHT( t_au01, i_au02))                ;
	  i_ln01         := CHARACTER_LENGTH( t_au01)                    ;
    END IF           ;
  END IF             ;
  
  IF         i_ln01   > 0
  THEN
    i_au01           := STRPOS( t_au01, '(')                         ;
	
	IF       i_au01   > 0
	THEN
	  i_au02         := i_au01 - 1                                   ;
	  t_au01         := TRIM( LEFT( t_au01, i_au02))                 ;
	  i_ln01         := CHARACTER_LENGTH( t_au01)                    ;
    END IF           ;
  END IF             ;

  t_rtrn             := t_au01                                       ;	
  RETURN( t_rtrn)    ;
END                  ;
$_$;
 ,   DROP FUNCTION sc_e003.utl_acm_pronam(text);
       sc_e003          postgres    false    4            ?           0    0    FUNCTION utl_acm_pronam(text)    COMMENT     P   COMMENT ON FUNCTION sc_e003.utl_acm_pronam(text) IS 'Acomoda nombre proc/func';
          sc_e003          postgres    false    296            )           1255    17341 !   utl_arm_snt_sql(text, text, text)    FUNCTION     ?"  CREATE FUNCTION sc_e003.utl_arm_snt_sql(text, text, text) RETURNS text
    LANGUAGE plpgsql SECURITY DEFINER
    AS $_$
  
DECLARE
  t_rtrn             text                   ;
  t_oper             text                   ;
  t_sn01             text                   ;
  t_sn02             text                   ;
  t_sepr             text                   ;
  t_seps             text                   ;
  t_au01             text                   ;
  t_au02             text                   ;
  t_au03             text                   ;
  t_au04             text                   ;
  t_au05             text                   ;
  l_ejec             boolean                ;
  i_au01             integer                ;
  i_ln01             integer                ;
  i_indv             integer                ;
  i_lfld             integer                ;
  i_lv01             integer                ;
  i_lv02             integer                ;
  
  c_q                character(1)           ;
  
  at_a01             text[]                 ;
  at_v01             text[]                 ;
  at_v02             text[]                 ;  
  at_fld             text[]                 ;
  at_pre             text[]                 ;
  at_sub             text[]                 ;
  
  rl     information_schema.columns%ROWTYPE ;
  
  lg                t_logcmp%ROWTYPE ;
  ej                t_logfin%ROWTYPE ;

BEGIN
  lg                 := log_ini( 'F')                                ;
  t_rtrn             := ' '                                          ;
  c_q                := ''''                                         ;
   
  t_au01             := utl_rtv_tbl_fld( $1, $2)                     ;
  at_a01             := STRING_TO_ARRAY( t_au01, '#', 'NULL')        ; 
  t_au01             := at_a01[1]                                    ;
  at_fld             := STRING_TO_ARRAY( t_au01, ';', 'NULL')        ; 
  t_au01             := at_a01[2]                                    ;
  at_pre             := STRING_TO_ARRAY( t_au01, ';', 'NULL')        ;
  t_au01             := at_a01[3]                                    ;
  at_sub             := STRING_TO_ARRAY( t_au01, ';', 'NULL')        ; 
  i_lfld             := ARRAY_LENGTH( at_fld,1)                      ;
   
  at_a01             := STRING_TO_ARRAY( $3, ';', 'NULL')            ;
  i_ln01             := ARRAY_LENGTH( at_a01,1)                      ;
  l_ejec             := FALSE                                        ;
  
  IF         i_ln01   > 3
  THEN 
    t_au01           := at_a01[2]                                    ; 
    t_oper           := UPPER( LEFT( TRIM( t_au01), 1))              ;
 
    IF         t_oper = 'I'
    OR         t_oper = 'U'
    OR         t_oper = 'D'
    THEN
	  l_ejec         := TRUE                                         ;
    END IF           ;
  END IF             ;

  IF         l_ejec   = TRUE
  THEN 
    i_indv           := 1                                            ;  
    i_lv01           := 0                                            ;
    i_lv02           := 0                                            ;
   	i_au01           := 2                                            ;
	
	WHILE    i_ln01   > i_au01 
    LOOP
	  i_au01         := i_au01 + 1                                   ;
      t_au01         := at_a01[i_au01]                               ;  
	  
	  CASE
	  WHEN   t_au01   = '#'
	  THEN
	    i_indv       := i_indv + 1                                   ;
		
	  WHEN   i_indv   = 1  AND  i_lfld  > i_lv01
	  THEN 
	    at_v01       := ARRAY_APPEND( at_v01, t_au01)                ;
	    i_lv01       := i_lv01 + 1                                   ;
		
	  WHEN   i_indv   = 2  AND  i_lfld  > i_lv02
	  THEN 
	    at_v02       := ARRAY_APPEND( at_v02, t_au01)                ;
	    i_lv02       := i_lv02 + 1                                   ;	
		
      ELSE
      END CASE       ;	  
    END LOOP         ;
	
	WHILE    i_lfld   > i_lv01
	LOOP
	  at_v01         := ARRAY_APPEND( at_v01, ' ')                   ;
	  i_lv01         := i_lv01 + 1                                   ;
	END LOOP         ;
	
	WHILE    i_lfld   > i_lv02
	LOOP
	  at_v02         := ARRAY_APPEND( at_v02, ' ')                   ;
	  i_lv02         := i_lv02 + 1                                   ;
	END LOOP         ;
  END IF             ;  

  IF         l_ejec   = TRUE
  AND        t_oper   = 'D'
  THEN
    t_sn01           := CONCAT('DELETE FROM ', TRIM( $1), '.')       ;
	t_sn01           := CONCAT( TRIM( t_sn01), TRIM( $2), ' WHERE')  ;
	t_sepr           := ' '                                          ;
	i_au01           := 0                                            ;
	
	WHILE    i_lfld   > i_au01 
	LOOP
	  i_au01         := i_au01 + 1                                   ;
	  t_au01         := at_fld[i_au01]                               ; 
	  t_au02         := at_pre[i_au01]                               ; 
	  t_au03         := at_sub[i_au01]                               ; 
	  t_au04         := at_v02[i_au01]                               ; 
	  
	  IF     CHARACTER_LENGTH( TRIM( t_au04)) > 0
	  THEN
	    t_sn01       := CONCAT( TRIM( t_sn01), t_sepr, TRIM( t_au01));
		t_sn01       := CONCAT( TRIM( t_sn01), ' = ' , TRIM( t_au02));
		t_sn01       := CONCAT( TRIM( t_sn01), TRIM( t_au04), TRIM( t_au03)) ;
		t_sepr       := ' AND '                                              ;
      END IF         ;	
    END LOOP         ;
	
	t_rtrn           := TRIM( t_sn01)                                ;
  END IF             ;
  

  IF         l_ejec   = TRUE
  AND        t_oper   = 'I'
  THEN 
    t_sn01           := CONCAT('INSERT INTO ', TRIM( $1), '.')       ;
	t_sn01           := CONCAT( TRIM( t_sn01), TRIM( $2), '(')       ;
	t_sn02           := ') VALUES ('                                 ;
	t_sepr           := ' '                                          ;
	i_au01           := 0                                            ;
	
	WHILE    i_lfld   > i_au01 
	LOOP
	  i_au01         := i_au01 + 1                                   ;
	  t_au01         := at_fld[i_au01]                               ; 
	  t_au02         := at_pre[i_au01]                               ; 
	  t_au03         := at_sub[i_au01]                               ; 
	  t_au04         := at_v01[i_au01]                               ; 
	  
	  IF     CHARACTER_LENGTH( TRIM( t_au04)) > 0
	  THEN
	    t_sn01       := CONCAT( TRIM( t_sn01), TRIM( t_sepr), TRIM( t_au01)) ;
		t_sn02       := CONCAT( TRIM( t_sn02), TRIM( t_sepr), TRIM( t_au02)) ;
		t_sn02       := CONCAT( TRIM( t_sn02), TRIM( t_au04), TRIM( t_au03)) ;
		t_sepr       := ','                                                  ;
      END IF         ;
    END LOOP         ;
	
    t_rtrn           := CONCAT( TRIM( t_sn01), TRIM( t_sn02), ')')   ;
  END IF             ;   

  
  IF         l_ejec   = TRUE
  AND        t_oper   = 'U'
  THEN
    t_sn01           := CONCAT('UPDATE ', TRIM( $1), '.'          )  ;
	t_sn01           := CONCAT( TRIM( t_sn01), TRIM( $2), ' SET'  )  ;
	t_sn02           := 'WHERE'                                      ;
	t_sepr           := ' '                                          ;
	t_seps           := ' '                                          ;
	i_au01           := 0                                            ;
	
	WHILE    i_lfld   > i_au01 
	LOOP
	  i_au01         := i_au01 + 1                                   ;
	  t_au01         := at_fld[i_au01]                               ; 
	  t_au02         := at_pre[i_au01]                               ; 
	  t_au03         := at_sub[i_au01]                               ; 
	  t_au04         := at_v01[i_au01]                               ; 
	  t_au05         := at_v02[i_au01]                               ; 
	  
	  IF     CHARACTER_LENGTH( TRIM( t_au04)) > 0
	  THEN
	    t_sn01       := CONCAT( TRIM( t_sn01), t_sepr, TRIM( t_au01)) ;
		t_sn01       := CONCAT( TRIM( t_sn01),  ' = ', TRIM( t_au02)) ;
		t_sn01       := CONCAT( TRIM( t_sn01),         TRIM( t_au04)) ;
		t_sn01       := CONCAT( TRIM( t_sn01),         TRIM( t_au03)) ;
		t_sepr       := ', '                                          ;
      END IF         ;
	  
	  IF     CHARACTER_LENGTH( TRIM( t_au05)) > 0
	  THEN
	    t_sn02       := CONCAT( TRIM( t_sn02), t_seps, TRIM( t_au01)) ;
		t_sn02       := CONCAT( TRIM( t_sn02),  ' = ', TRIM( t_au02)) ;
		t_sn02       := CONCAT( TRIM( t_sn02),         TRIM( t_au05)) ;
		t_sn02       := CONCAT( TRIM( t_sn02),         TRIM( t_au03)) ;
		t_seps       := ' AND '                                       ;
      END IF         ;
    END LOOP         ;
	
    t_rtrn           := CONCAT( TRIM( t_sn01), ' ', TRIM( t_sn02))   ;	
  END IF             ;
  
  lg.ttlogd          := ''                                           ;
  ej                 := log_fin( lg)                                 ;
  RETURN( t_rtrn)    ;
END                  ;
$_$;
 9   DROP FUNCTION sc_e003.utl_arm_snt_sql(text, text, text);
       sc_e003          postgres    false    4            ?           0    0 *   FUNCTION utl_arm_snt_sql(text, text, text)    COMMENT     g   COMMENT ON FUNCTION sc_e003.utl_arm_snt_sql(text, text, text) IS 'Armar Sentencia Sql para una Tabla';
          sc_e003          postgres    false    297                       1255    17342    utl_dsc_contype(text)    FUNCTION     !  CREATE FUNCTION sc_e003.utl_dsc_contype(text) RETURNS text
    LANGUAGE sql SECURITY DEFINER
    AS $_$
 SELECT  CASE $1  WHEN 'c'::"char" THEN 'Check constraint'::text
                  WHEN 'f'::"char" THEN 'FK constraint'::text
                  WHEN 'p'::"char" THEN 'PK constraint'::text
                  WHEN 'u'::"char" THEN 'Unique constraint'::text
                  WHEN 't'::"char" THEN 'constraint trigger'::text
                  WHEN 'x'::"char" THEN 'Exclusion constraint'::text
                  ELSE 'No se'::text  END  ;
$_$;
 -   DROP FUNCTION sc_e003.utl_dsc_contype(text);
       sc_e003          postgres    false    4            ?           0    0    FUNCTION utl_dsc_contype(text)    COMMENT     e   COMMENT ON FUNCTION sc_e003.utl_dsc_contype(text) IS 'Descripcion pg_catalog.pg_constraint.contype';
          sc_e003          postgres    false    257                       1255    17343    utl_dsc_prokind(text)    FUNCTION     r  CREATE FUNCTION sc_e003.utl_dsc_prokind(text) RETURNS text
    LANGUAGE sql SECURITY DEFINER
    AS $_$
 SELECT  CASE $1  WHEN 'a'::"char"    THEN '?a? ' ::text  
                  WHEN 'f'::"char"    THEN 'funcion'   ::text
				  WHEN 'p'::"char"    THEN 'procedure' ::text
				  WHEN 'w'::"char"    THEN '?w? ' ::text
                  ELSE 'No se'::text  END  ;
$_$;
 -   DROP FUNCTION sc_e003.utl_dsc_prokind(text);
       sc_e003          postgres    false    4            ?           0    0    FUNCTION utl_dsc_prokind(text)    COMMENT     _   COMMENT ON FUNCTION sc_e003.utl_dsc_prokind(text) IS 'Descripcion pg_catalog.pg_proc.prokind';
          sc_e003          postgres    false    258                       1255    17344    utl_dsc_relkind(text)    FUNCTION     J  CREATE FUNCTION sc_e003.utl_dsc_relkind(text) RETURNS text
    LANGUAGE sql SECURITY DEFINER
    AS $_$
 SELECT  CASE $1  WHEN 'c'::"char"    THEN 'type'::text  
                  WHEN 'i'::"char"    THEN 'index'::text
				  WHEN 'f'::"char"    THEN 'tabla externa'::text
				  WHEN 'm'::"char"    THEN 'materialize view'::text
                  WHEN 'r'::"char"    THEN 'tabla'::text
				  WHEN 'S'::"char"    THEN 'sequence'::text
				  WHEN 't'::"char"    THEN 'special'::text
                  WHEN 'v'::"char"    THEN 'view'::text
                  ELSE 'No se'::text  END  ;
$_$;
 -   DROP FUNCTION sc_e003.utl_dsc_relkind(text);
       sc_e003          postgres    false    4            ?           0    0    FUNCTION utl_dsc_relkind(text)    COMMENT     `   COMMENT ON FUNCTION sc_e003.utl_dsc_relkind(text) IS 'Descripcion pg_catalog.pg_class.relkind';
          sc_e003          postgres    false    259            *           1255    17345    utl_dsp_t_logpet(record)    FUNCTION     n  CREATE FUNCTION sc_e003.utl_dsp_t_logpet(record) RETURNS text
    LANGUAGE plpgsql SECURITY DEFINER
    AS $_$
  
DECLARE
  t_rtrn             text                   ;
  t_au01             text                   ;
  t_au02             text                   ;
  i_ln01             integer                ;
  i_au01             integer                ;
 
  at_a01             text[]                 ;
  at_a02             text[]                 ;
  at_a03             text[]                 ;
  at_a04             text[]                 ;
 
BEGIN
  t_au01             := $1                                           ;
  t_rtrn             := 'Ver mensaje'                                ;
  at_a01             := STRING_TO_ARRAY( t_au01, ',', 'NULO')        ;
  i_ln01             := 0                                            ;
  
  FOR        t_au02  IN SELECT CONCAT( att.attname::text, ';',
                                       format_type(att.atttypid, att.atttypmod))
	                      FROM  pg_attribute att
                          JOIN  pg_class     cls ON cls.relname  = 't_logpet' 
			                                    AND att.attrelid = cls.oid
                          JOIN  pg_namespace nsp ON nsp.nspname  = 'sc_e003'
			                                    AND nsp.oid = cls.relnamespace
                         WHERE  att.attstattarget <> 0 
		                   AND  cls.relkind NOT IN ('S', 'i')
		                   AND att.attnum > 0
		              ORDER BY cls.relname, att.attnum
  LOOP
    i_ln01           := i_ln01 + 1                                   ;
    at_a02           := STRING_TO_ARRAY( t_au02, ';', 'NULO')        ;
	at_a03           := ARRAY_APPEND( at_a03, at_a02[1])             ; 
	at_a04           := ARRAY_APPEND( at_a03, at_a02[2])             ; 
  END LOOP           ;
  
  i_au01             := 0                                            ;
  
  WHILE      i_ln01   > i_au01
  LOOP
    i_au01           := i_au01 + 1                                   ;
	RAISE NOTICE ' % % % ', i_au01, at_a03[i_au01], at_a01[i_au01]   ;
  END LOOP           ;
   
  RETURN( t_rtrn)    ;
END                  ;
$_$;
 0   DROP FUNCTION sc_e003.utl_dsp_t_logpet(record);
       sc_e003          postgres    false    4            +           1255    17346 "   utl_dsp_t_logpet(sc_e003.t_logpet)    FUNCTION     x  CREATE FUNCTION sc_e003.utl_dsp_t_logpet(sc_e003.t_logpet) RETURNS text
    LANGUAGE plpgsql SECURITY DEFINER
    AS $_$
  
DECLARE
  t_rtrn             text                   ;
  t_au01             text                   ;
  t_au02             text                   ;
  i_ln01             integer                ;
  i_au01             integer                ;
 
  at_a01             text[]                 ;
  at_a02             text[]                 ;
  at_a03             text[]                 ;
  at_a04             text[]                 ;
 
BEGIN
  t_au01             := TRIM( $1)                                    ;
  t_rtrn             := 'Ver mensaje'                                ;
  at_a01             := STRING_TO_ARRAY( t_au01, ',', 'NULO')        ;
  i_ln01             := 0                                            ;
  
  FOR        t_au02  IN SELECT CONCAT( att.attname::text, ';',
                                       format_type(att.atttypid, att.atttypmod))
	                      FROM  pg_attribute att
                          JOIN  pg_class     cls ON cls.relname  = 't_logpet' 
			                                    AND att.attrelid = cls.oid
                          JOIN  pg_namespace nsp ON nsp.nspname  = 'sc_e003'
			                                    AND nsp.oid = cls.relnamespace
                         WHERE  att.attstattarget <> 0 
		                   AND  cls.relkind NOT IN ('S', 'i')
		                   AND att.attnum > 0
		              ORDER BY cls.relname, att.attnum
  LOOP
    i_ln01           := i_ln01 + 1                                   ;
    at_a02           := STRING_TO_ARRAY( t_au02, ';', 'NULO')        ;
	at_a03           := ARRAY_APPEND( at_a03, at_a02[1])             ; 
	at_a04           := ARRAY_APPEND( at_a03, at_a02[2])             ; 
  END LOOP           ;
  
  i_au01             := 0                                            ;
  
  WHILE      i_ln01   > i_au01
  LOOP
    i_au01           := i_au01 + 1                                   ;
	RAISE NOTICE ' % % % ', i_au01, at_a03[i_au01], at_a01[i_au01]   ;
  END LOOP           ;
   
  RETURN( t_rtrn)    ;
END                  ;
$_$;
 :   DROP FUNCTION sc_e003.utl_dsp_t_logpet(sc_e003.t_logpet);
       sc_e003          postgres    false    924    4            ?           0    0 +   FUNCTION utl_dsp_t_logpet(sc_e003.t_logpet)    COMMENT     `   COMMENT ON FUNCTION sc_e003.utl_dsp_t_logpet(sc_e003.t_logpet) IS 'Display datos del t_logpet';
          sc_e003          postgres    false    299            ,           1255    17347    utl_prueba(text)    FUNCTION       CREATE FUNCTION sc_e003.utl_prueba(text) RETURNS text
    LANGUAGE plpgsql SECURITY DEFINER
    AS $_$
  
DECLARE
  t_rtrn             text                   ;
  t_vu01             text                   ;
  c_q                character(1)           ;
  d_au01             date                   ;
  
  v_state   text;
  v_msg     text;
  v_detail  text;
  v_hint    text;
  v_context text;
 
BEGIN
  t_rtrn             := 'No'                                         ;
  c_q                := ''''                                         ;
  t_vu01             := CONCAT( c_q, TRIM( $1), c_q, ' :: date')     ; 

  BEGIN 
--    EXECUTE t_vu01  ;
    d_au01         := $1 :: date ;
	
    EXCEPTION WHEN OTHERS 
	THEN
	 GET STACKED DIAGNOSTICS
            v_state   = RETURNED_SQLSTATE,
            v_msg     = MESSAGE_TEXT,
            v_detail  = PG_EXCEPTION_DETAIL,
            v_hint    = PG_EXCEPTION_HINT,
            v_context = PG_EXCEPTION_CONTEXT;
        raise notice E'Got exception:
            state  : %
            message: %
            detail : %
            hint   : %
            context: %', v_state, v_msg, v_detail, v_hint, v_context;
	  RAISE NOTICE ' lo agarre' ;
	  
	  t_rtrn   := 'Si';
  END          ;
  
  RETURN( t_rtrn)    ;
END                  ;
$_$;
 (   DROP FUNCTION sc_e003.utl_prueba(text);
       sc_e003          postgres    false    4            ?           0    0    FUNCTION utl_prueba(text)    COMMENT     :   COMMENT ON FUNCTION sc_e003.utl_prueba(text) IS 'Prueba';
          sc_e003          postgres    false    300            -           1255    17348    utl_rtv_app(text)    FUNCTION       CREATE FUNCTION sc_e003.utl_rtv_app(text) RETURNS text
    LANGUAGE plpgsql SECURITY DEFINER
    AS $_$
  
DECLARE
  t_rtrn             text                   ;
  t_au01             text                   ;
  i_au01             integer                ;
  i_la01             integer                ;
  i_ln01             integer                ;
   
  at_a01             text[]                 ;
 
BEGIN
  t_rtrn             := 'nn.'                                        ;
  i_ln01             := CHARACTER_LENGTH( TRIM( $1))                 ;
  
  IF         i_ln01   > 3
  THEN
    t_au01           := TRIM( $1)                                    ;
	i_ln01           := CHARACTER_LENGTH( TRIM( t_au01))             ;
  
    IF       STRPOS( t_au01, '.')  >  0
    THEN
      at_a01         := STRING_TO_ARRAY( t_au01, '.', 'NULL')        ;
      t_au01         := TRIM( at_a01[2])                             ;
	  i_ln01         := CHARACTER_LENGTH( TRIM( t_au01))             ;
    END IF           ;

    IF       i_ln01                >  3
    AND      STRPOS( t_au01, '_')  >  0
    THEN
      at_a01         := STRING_TO_ARRAY( t_au01, '_', 'NULL')        ;
	  i_la01         := ARRAY_LENGTH( at_a01, 1)                     ;
	  t_au01         := TRIM( at_a01[1])                             ;
	  i_ln01         := CHARACTER_LENGTH( TRIM( t_au01))             ;
	  
	  IF       i_la01   > 1
	  AND      i_ln01   < 3
	  THEN
	    t_au01       := TRIM( at_a01[2])                             ;
		i_ln01       := CHARACTER_LENGTH( TRIM( t_au01))             ;
      END IF         ;
	END IF           ;
  END IF             ;

  IF         i_ln01   > 0
  THEN
    t_rtrn           := LEFT( TRIM( t_au01), 3)                      ;
  END IF             ;
  RETURN( t_rtrn)    ;
END                  ;
$_$;
 )   DROP FUNCTION sc_e003.utl_rtv_app(text);
       sc_e003          postgres    false    4            ?           0    0    FUNCTION utl_rtv_app(text)    COMMENT     A   COMMENT ON FUNCTION sc_e003.utl_rtv_app(text) IS 'Recupera APP';
          sc_e003          postgres    false    301            .           1255    17349    utl_rtv_prc_cmnt(text)    FUNCTION     [  CREATE FUNCTION sc_e003.utl_rtv_prc_cmnt(text) RETURNS text
    LANGUAGE plpgsql SECURITY DEFINER
    AS $_$
DECLARE 
  t_rtrn             text              ; 
  t_au01             text              ;
  t_scnm             text              ;
  t_prnm             text              ;  
  i_ln01             integer           ;
  i_au01             integer           ;  
 
BEGIN
  t_rtrn             := ''                                           ;
  t_au01             := REPLACE( $1, '()', '  ')                     ;
  t_au01             := TRIM( t_au01)                                ;
  i_ln01             := CHARACTER_LENGTH( t_au01)                    ;
  
  IF         i_ln01  >  0
  THEN
 	i_au01           := STRPOS( t_au01, '.')                         ;
	
    IF       i_au01  >  1
	AND      i_au01  <  i_ln01
	THEN 
	  t_scnm         := LEFT(  t_au01, i_au01 - 1)                    ;
      t_prnm         := RIGHT( t_au01, i_ln01 - i_au01)               ;
	  
	  SELECT INTO  t_rtrn  
	               CONCAT( utl_dsc_prokind(prc.prokind::text) , ';', obj_description(prc.oid, 'pg_proc'::name))
             FROM  pg_namespace nsp 
             JOIN  pg_proc      prc ON nsp.nspname = t_scnm
                                   AND prc.proname = t_prnm          ;
	END IF           ;
  END IF             ;
  RETURN(t_rtrn)     ; 
END                  ;
$_$;
 .   DROP FUNCTION sc_e003.utl_rtv_prc_cmnt(text);
       sc_e003          postgres    false    4            ?           0    0    FUNCTION utl_rtv_prc_cmnt(text)    COMMENT     V   COMMENT ON FUNCTION sc_e003.utl_rtv_prc_cmnt(text) IS 'Recupera pg_desc Commentario';
          sc_e003          postgres    false    302            /           1255    17350    utl_rtv_sch_tbl(text)    FUNCTION     )
  CREATE FUNCTION sc_e003.utl_rtv_sch_tbl(text) RETURNS text
    LANGUAGE plpgsql SECURITY DEFINER
    AS $_$
DECLARE
  t_rtrn             text              ; 
  t_tabl             text              ;
  t_schm             text              ;
  t_spth             text              ;  
  i_au01             integer           ;
  i_ln01             integer           ;
  b_cont             bigint            ;
  
  at_a01             text[]            ;
  
  lg           t_logcmp%ROWTYPE ;
  ej           t_logfin%ROWTYPE ;
  
BEGIN
  lg                 := log_ini()                                    ;
  t_tabl             := TRIM( $1)                                    ;
  t_rtrn             := ''                                           ;
  
  SELECT     INTO  t_spth  setting 
             FROM  pg_settings 
			WHERE  name = 'search_path'                              ;

  IF         CHARACTER_LENGTH( TRIM( t_spth))  = 0
  THEN
    t_spth           := CURRENT_SCHEMA()                             ;
  END IF             ;
  
  IF         CHARACTER_LENGTH( TRIM( t_spth))  > 0
  THEN
    at_a01           := STRING_TO_ARRAY( t_spth, ',', 'NULO')        ;
	i_ln01           := ARRAY_LENGTH( at_a01, 1)                     ;
	i_au01           := 0                                            ;
	b_cont           := 0                                            ;
	
	WHILE    i_ln01   > i_au01
	AND      b_cont   = 0
	LOOP
	  i_au01         := i_au01 + 1                                   ;
	  t_schm         := TRIM( at_a01[i_au01])                        ;   
	  
	  SELECT INTO  b_cont COUNT(0)
	         FROM pg_class     cls
             JOIN pg_namespace nsp ON cls.relname = t_tabl
			                      AND nsp.nspname = t_schm
			                      AND nsp.oid     = cls.relnamespace ;
    END LOOP         ;

    IF       b_cont   > 0
	THEN
	  t_rtrn         := t_schm                                       ;
	END IF           ;
  END IF             ; 
  
  IF         CHARACTER_LENGTH( TRIM( t_rtrn))  = 0 
  THEN
  	lg.tlcncl        := TRUE                                         ;
    lg.ttlogd        := CONCAT( 'ERR Tabla ', TRIM( t_tabl))         ;
	lg.ttlogd        := CONCAT( TRIM( lg.ttlogd), ' No se encontro en');
	lg.ttlogd        := CONCAT( TRIM( lg.ttlogd), ' ', TRIM( t_spth));
	lg               := log_msg( lg)                                 ;  
  END IF             ;
  
  lg.ttlogd          := ''                                           ;
  ej                 := log_fin( lg)                                 ; 
  RETURN ( t_rtrn)   ;
END                  ;
$_$;
 -   DROP FUNCTION sc_e003.utl_rtv_sch_tbl(text);
       sc_e003          postgres    false    4            ?           0    0    FUNCTION utl_rtv_sch_tbl(text)    COMMENT     T   COMMENT ON FUNCTION sc_e003.utl_rtv_sch_tbl(text) IS 'Recupera Schema de la tabla';
          sc_e003          postgres    false    303            0           1255    17351    utl_rtv_tbl_fld(text, text)    FUNCTION     ?  CREATE FUNCTION sc_e003.utl_rtv_tbl_fld(text, text) RETURNS text
    LANGUAGE plpgsql SECURITY DEFINER
    AS $_$
  
DECLARE
  t_rtrn             text                   ;
  t_au01             text                   ;
  i_au01             integer                ;
  b_au01             boolean                ;
  c_q                character(1)           ;
  
  at_a01             text[]                 ;
  at_a02             text[]                 ;
  at_a03             text[]                 ;
  at_a04             text[]                 ;
  ab_a05             boolean[]              ;
   
  lg                t_logcmp%ROWTYPE ;
  ej                t_logfin%ROWTYPE ;
  
  rl     information_schema.columns%ROWTYPE ;

BEGIN
  lg                 := log_ini()                                    ;
  t_rtrn             := ' '                                          ;
  c_q                := ''''                                         ;
  i_au01             := 0                                            ;
  
  FOR        rl      IN SELECT  *
                          FROM  information_schema.columns
						 WHERE  table_schema = $1
						   AND    table_name = $2
					  ORDER BY  ordinal_position
  LOOP
    i_au01           := i_au01 + 1                                   ;
	at_a02           := ARRAY_APPEND( at_a02, rl.column_name)        ;
	
	CASE     
	WHEN     rl.data_type = '"char"' OR rl.data_type = 'character varying' 
	  OR     rl.data_type = 'name'   OR rl.data_type = 'text'
	THEN
	  at_a03         := ARRAY_APPEND( at_a03, c_q)                   ;
	  at_a04         := ARRAY_APPEND( at_a04, c_q)                   ;
	
	WHEN     rl.data_type = 'date'
	THEN
	  t_au01         := CONCAT( c_q, ':: date')                      ;
	  at_a03         := ARRAY_APPEND( at_a03, c_q   )                ;
	  at_a04         := ARRAY_APPEND( at_a04, t_au01)                ;
	  
	WHEN     rl.data_type = 'timestamp with time zone'
	THEN
	  t_au01         := CONCAT( c_q, ':: timestamp with time zone')  ;
	  at_a03         := ARRAY_APPEND( at_a03, c_q   )                ;
	  at_a04         := ARRAY_APPEND( at_a04, t_au01)                ;
	
	ELSE
	  at_a03         := ARRAY_APPEND( at_a03, ' ')                   ;
	  at_a04         := ARRAY_APPEND( at_a04, ' ')                   ;
    END CASE         ;
	
	b_au01           := FALSE                                        ;
	
	IF       TRIM(rl.is_nullable) = 'YES'
	THEN
	  b_au01         := TRUE                                         ;
	END IF           ;
	
	ab_a05           := ARRAY_APPEND( ab_a05, b_au01)                ;
  END LOOP           ;
   
  IF         i_au01   > 0
  THEN
    t_au01           := ARRAY_TO_STRING( at_a02, ';', 'NULL')        ;
	at_a01           := ARRAY_APPEND( at_a01, t_au01)                ;
	t_au01           := ARRAY_TO_STRING( at_a03, ';', 'NULL')        ;
	at_a01           := ARRAY_APPEND( at_a01, t_au01)                ;
	t_au01           := ARRAY_TO_STRING( at_a04, ';', 'NULL')        ;
	at_a01           := ARRAY_APPEND( at_a01, t_au01)                ;
	t_au01           := ARRAY_TO_STRING( ab_a05, ';', 'NULL')        ;
	at_a01           := ARRAY_APPEND( at_a01, t_au01)                ;
	t_rtrn           := ARRAY_TO_STRING( at_a01, '#', 'NULL')        ;
  END IF             ;
 
  lg.ttlogd          := ''                                           ;
  ej                 := log_fin( lg)                                 ;
  RETURN( t_rtrn)    ;
END                  ;
$_$;
 3   DROP FUNCTION sc_e003.utl_rtv_tbl_fld(text, text);
       sc_e003          postgres    false    4            ?           0    0 $   FUNCTION utl_rtv_tbl_fld(text, text)    COMMENT     a   COMMENT ON FUNCTION sc_e003.utl_rtv_tbl_fld(text, text) IS 'Recuperar Desc Fields de una Tabla';
          sc_e003          postgres    false    304            1           1255    17352    anl_dsp_fnc_prc()    FUNCTION     4  CREATE FUNCTION sc_e004.anl_dsp_fnc_prc() RETURNS TABLE(obj_sch text, obj_typ text, obj_nam text, obj_desc text)
    LANGUAGE sql SECURITY DEFINER
    AS $$
  SELECT  obj_sch, obj_typ,obj_nam, obj_desc
	FROM  vv_anl_objs
   WHERE  obj_typ IN ('funcion', 'procedure')
ORDER BY  obj_sch, obj_typ, obj_nam;
$$;
 )   DROP FUNCTION sc_e004.anl_dsp_fnc_prc();
       sc_e004          postgres    false    5            ?           0    0    FUNCTION anl_dsp_fnc_prc()    COMMENT     R   COMMENT ON FUNCTION sc_e004.anl_dsp_fnc_prc() IS 'Display Funciones y Procedure';
          sc_e004          postgres    false    305            2           1255    17353    anl_nrm_linea_src(text)    FUNCTION     	  CREATE FUNCTION sc_e004.anl_nrm_linea_src(text) RETURNS text
    LANGUAGE plpgsql SECURITY DEFINER
    AS $_$
DECLARE
  t_rtrn             text                   ; 
  t_au01             text                   ;
  t_au02             text                   ;
  i_ln01             integer                ;
  i_ln02             integer                ;
  i_au01             integer                ;
  i_au02             integer                ;
  
  at_a01             text[]                 ;
  ai_a01             integer[]              ;
   
BEGIN
  t_rtrn             := ' '                                          ;
  t_au01             := TRIM( $1)                                    ;
  i_ln01             := CHARACTER_LENGTH( t_au01)                    ;
  
  IF         i_ln01   = 1
  AND        9       <> ASCII( LEFT( t_au01, 1))
  THEN     
    i_ln01            = 0                                            ;
    t_rtrn            = LEFT( t_au01, 1)                             ;	
  END IF             ;
  
  IF         i_ln01   > 0
  THEN
    i_au01           := 0                                            ;

    WHILE    i_ln01   > i_au01
    LOOP
      i_au01         := i_au01 + 1                                   ;
	  t_au02         := RIGHT( t_au01, i_au01)                       ;
	  
	  IF     9       <> ASCII( LEFT( t_au02, 1))  
      THEN  
        at_a01       := ARRAY_PREPEND( LEFT( t_au02, 1), at_a01)         ;
        ai_a01       := ARRAY_PREPEND( ASCII( LEFT( t_au02, 1)), ai_a01) ;
	  END IF         ;
	END LOOP         ;
	
	i_ln01           := ARRAY_LENGTH(ai_a01,1)                       ;
	IF       i_ln01   > 0
	THEN
      t_au02         := ARRAY_TO_STRING( at_a01, '', 'NULL')         ;
	  t_rtrn         := TRIM( t_au02)                                ;	  
    END IF           ;
  END IF             ;
  
  i_ln01             := CHARACTER_LENGTH( TRIM( t_rtrn))             ;
  
  IF         i_ln01   > 0
  THEN
    IF       ';'      = RIGHT( TRIM( t_rtrn), 1)
    THEN
	  i_ln01         := i_ln01 - 1                                   ;
      t_rtrn         := LEFT( TRIM( t_rtrn), i_ln01)                 ;
      t_rtrn         := TRIM( t_rtrn)                                ;
    END IF           ;	   
  END IF             ;
  RETURN(t_rtrn)     ;  
END                  ;
$_$;
 /   DROP FUNCTION sc_e004.anl_nrm_linea_src(text);
       sc_e004          postgres    false    5            ?           0    0     FUNCTION anl_nrm_linea_src(text)    COMMENT     U   COMMENT ON FUNCTION sc_e004.anl_nrm_linea_src(text) IS 'Normalizar linea de fuente';
          sc_e004          postgres    false    306            3           1255    17354    anl_omt_linea_src(text)    FUNCTION     (  CREATE FUNCTION sc_e004.anl_omt_linea_src(text) RETURNS integer
    LANGUAGE sql SECURITY DEFINER
    AS $_$

 SELECT STRPOS(
        'DECLARE-BEGIN-CASE-LOOP-ELSE-THEN-COMMIT-ROLLBACK-END-END CASE-END IF-END LOOP-EXCEPT-EXCEPTION-UNION'
        , UPPER( TRIM( REPLACE( $1, ';', ' '))));	  
$_$;
 /   DROP FUNCTION sc_e004.anl_omt_linea_src(text);
       sc_e004          postgres    false    5            ?           0    0     FUNCTION anl_omt_linea_src(text)    COMMENT     Q   COMMENT ON FUNCTION sc_e004.anl_omt_linea_src(text) IS 'Omitir linea de fuente';
          sc_e004          postgres    false    307            4           1255    17355 !   anl_scn_relkind(text, text, text)    FUNCTION     ?  CREATE FUNCTION sc_e004.anl_scn_relkind(text, text, text) RETURNS text
    LANGUAGE sql SECURITY DEFINER
    AS $_$
 SELECT  CASE $1  WHEN 'c'::"char"    THEN CONCAT( TRIM( $2), '.', TRIM( $3))
                  WHEN 'i'::"char"    THEN NULL :: text 
				  WHEN 'f'::"char"    THEN CONCAT( TRIM( $2), '.', TRIM( $3))
				  WHEN 'm'::"char"    THEN CONCAT( TRIM( $2), '.', TRIM( $3))
                  WHEN 'r'::"char"    THEN CONCAT( TRIM( $2), '.', TRIM( $3))
				  WHEN 'S'::"char"    THEN CONCAT( TRIM( $2), '.', TRIM( $3))
				  WHEN 't'::"char"    THEN NULL :: text 
                  WHEN 'v'::"char"    THEN CONCAT( TRIM( $2), '.', TRIM( $3))
                  ELSE 'No se'::text  END  ;
$_$;
 9   DROP FUNCTION sc_e004.anl_scn_relkind(text, text, text);
       sc_e004          postgres    false    5            ?           0    0 *   FUNCTION anl_scn_relkind(text, text, text)    COMMENT     o   COMMENT ON FUNCTION sc_e004.anl_scn_relkind(text, text, text) IS 'Scan obj segun pg_catalog.pg_class.relkind';
          sc_e004          postgres    false    308            5           1255    17356    app_path_entorno(text)    FUNCTION     G  CREATE FUNCTION sc_e004.app_path_entorno(text) RETURNS boolean
    LANGUAGE plpgsql SECURITY DEFINER
    AS $_$
DECLARE
  l_rtrn             boolean           ;
  t_au01             text              ;
     	
BEGIN
  l_rtrn             := FALSE                                        ;
  t_au01             := UPPER( LEFT( TRIM( $1)), 1)                  ;
  
  CASE
  WHEN       t_au01   = 'P'
  THEN
    CALL     app_path_prod()                                         ;
  WHEN       t_au01   = 'T'
  THEN
    CALL     app_path_test()                                         ;
  WHEN       t_au01   = 'U'
  THEN
    CALL     app_path_uat()                                          ;
  ELSE
    l_rtrn           := TRUE                                         ;
  END CASE           ; 

  RETURN( l_rtrn)    ;
END                  ;
$_$;
 .   DROP FUNCTION sc_e004.app_path_entorno(text);
       sc_e004          postgres    false    5            ?           0    0    FUNCTION app_path_entorno(text)    COMMENT     J   COMMENT ON FUNCTION sc_e004.app_path_entorno(text) IS 'Prod Search Path';
          sc_e004          postgres    false    309            6           1255    17357    app_path_prod() 	   PROCEDURE     ?   CREATE PROCEDURE sc_e004.app_path_prod()
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
     	
BEGIN
  SET search_path TO sc_e004, sc_e005                                ;
END                  ;
$$;
 (   DROP PROCEDURE sc_e004.app_path_prod();
       sc_e004          postgres    false    5            ?           0    0    PROCEDURE app_path_prod()    COMMENT     D   COMMENT ON PROCEDURE sc_e004.app_path_prod() IS 'Prod Search Path';
          sc_e004          postgres    false    310            7           1255    17358    app_path_test() 	   PROCEDURE     ?   CREATE PROCEDURE sc_e004.app_path_test()
    LANGUAGE plpgsql
    AS $$
DECLARE
     	
BEGIN
  SET search_path TO sc_e001, sc_e003, sc_e004, sc_e005              ;
END                  ;
$$;
 (   DROP PROCEDURE sc_e004.app_path_test();
       sc_e004          postgres    false    5            ?           0    0    PROCEDURE app_path_test()    COMMENT     D   COMMENT ON PROCEDURE sc_e004.app_path_test() IS 'Test Search Path';
          sc_e004          postgres    false    311            8           1255    17359    app_path_uat() 	   PROCEDURE     ?   CREATE PROCEDURE sc_e004.app_path_uat()
    LANGUAGE plpgsql
    AS $$
DECLARE
     	
BEGIN
  SET search_path TO sc_e002, sc_e003, sc_e004, sc_e005              ; 
END                  ;
$$;
 '   DROP PROCEDURE sc_e004.app_path_uat();
       sc_e004          postgres    false    5            ?           0    0    PROCEDURE app_path_uat()    COMMENT     C   COMMENT ON PROCEDURE sc_e004.app_path_uat() IS 'UAT  Search Path';
          sc_e004          postgres    false    312            ?            1259    17360    p_icrbd    TABLE     ?   CREATE TABLE sc_e001.p_icrbd (
    fbc11 bigint NOT NULL,
    fvc12 character varying(50) NOT NULL,
    fdc13 date DEFAULT CURRENT_DATE NOT NULL,
    fdc14 date
);
    DROP TABLE sc_e001.p_icrbd;
       sc_e001         heap    postgres    false    6            ?           0    0    TABLE p_icrbd    COMMENT     3   COMMENT ON TABLE sc_e001.p_icrbd IS 'ICR Datos b';
          sc_e001          postgres    false    220            ?           0    0    COLUMN p_icrbd.fbc11    COMMENT     8   COMMENT ON COLUMN sc_e001.p_icrbd.fbc11 IS 'Campo C11';
          sc_e001          postgres    false    220            ?           0    0    COLUMN p_icrbd.fvc12    COMMENT     8   COMMENT ON COLUMN sc_e001.p_icrbd.fvc12 IS 'Campo C12';
          sc_e001          postgres    false    220            ?           0    0    COLUMN p_icrbd.fdc13    COMMENT     8   COMMENT ON COLUMN sc_e001.p_icrbd.fdc13 IS 'Campo C13';
          sc_e001          postgres    false    220            ?           0    0    COLUMN p_icrbd.fdc14    COMMENT     8   COMMENT ON COLUMN sc_e001.p_icrbd.fdc14 IS 'Campo C14';
          sc_e001          postgres    false    220            ?            1259    17364    p_icrcd    TABLE     ?   CREATE TABLE sc_e001.p_icrcd (
    fbc21 bigint NOT NULL,
    fvc22 character varying(50) NOT NULL,
    fdc23 date NOT NULL,
    fbc11 bigint NOT NULL,
    fdc24 date
);
    DROP TABLE sc_e001.p_icrcd;
       sc_e001         heap    postgres    false    6            ?           0    0    TABLE p_icrcd    COMMENT     3   COMMENT ON TABLE sc_e001.p_icrcd IS 'ICR Datos c';
          sc_e001          postgres    false    221            ?           0    0    COLUMN p_icrcd.fbc21    COMMENT     8   COMMENT ON COLUMN sc_e001.p_icrcd.fbc21 IS 'Campo C21';
          sc_e001          postgres    false    221            ?           0    0    COLUMN p_icrcd.fvc22    COMMENT     8   COMMENT ON COLUMN sc_e001.p_icrcd.fvc22 IS 'Campo C22';
          sc_e001          postgres    false    221            ?           0    0    COLUMN p_icrcd.fdc23    COMMENT     8   COMMENT ON COLUMN sc_e001.p_icrcd.fdc23 IS 'Campo C23';
          sc_e001          postgres    false    221            ?           0    0    COLUMN p_icrcd.fbc11    COMMENT     8   COMMENT ON COLUMN sc_e001.p_icrcd.fbc11 IS 'Campo C11';
          sc_e001          postgres    false    221            ?           0    0    COLUMN p_icrcd.fdc24    COMMENT     8   COMMENT ON COLUMN sc_e001.p_icrcd.fdc24 IS 'Campo C24';
          sc_e001          postgres    false    221            ?            1259    17367    p_icrdd    TABLE     ?   CREATE TABLE sc_e001.p_icrdd (
    fbc01 bigint NOT NULL,
    fbc21 bigint NOT NULL,
    fdc41 date DEFAULT CURRENT_DATE NOT NULL,
    fbc42 bigint NOT NULL,
    fbc11 bigint,
    fdc43 date
);
    DROP TABLE sc_e001.p_icrdd;
       sc_e001         heap    postgres    false    6            ?           0    0    TABLE p_icrdd    COMMENT     3   COMMENT ON TABLE sc_e001.p_icrdd IS 'ICR Datos d';
          sc_e001          postgres    false    222            ?           0    0    COLUMN p_icrdd.fbc01    COMMENT     8   COMMENT ON COLUMN sc_e001.p_icrdd.fbc01 IS 'Campo C01';
          sc_e001          postgres    false    222            ?           0    0    COLUMN p_icrdd.fbc21    COMMENT     8   COMMENT ON COLUMN sc_e001.p_icrdd.fbc21 IS 'Campo C21';
          sc_e001          postgres    false    222            ?           0    0    COLUMN p_icrdd.fdc41    COMMENT     8   COMMENT ON COLUMN sc_e001.p_icrdd.fdc41 IS 'Campo C41';
          sc_e001          postgres    false    222            ?           0    0    COLUMN p_icrdd.fbc42    COMMENT     8   COMMENT ON COLUMN sc_e001.p_icrdd.fbc42 IS 'Campo C42';
          sc_e001          postgres    false    222            ?           0    0    COLUMN p_icrdd.fbc11    COMMENT     8   COMMENT ON COLUMN sc_e001.p_icrdd.fbc11 IS 'Campo C11';
          sc_e001          postgres    false    222            ?           0    0    COLUMN p_icrdd.fdc43    COMMENT     8   COMMENT ON COLUMN sc_e001.p_icrdd.fdc43 IS 'Campo C43';
          sc_e001          postgres    false    222            ?            1259    17371    p_icrad    TABLE     ?   CREATE TABLE sc_e002.p_icrad (
    fbc01 bigint NOT NULL,
    fvc02 character varying(50) NOT NULL,
    fdc03d date NOT NULL,
    fdc04h date,
    fbc11 bigint NOT NULL,
    fdc05 date
);
    DROP TABLE sc_e002.p_icrad;
       sc_e002         heap    postgres    false    10            ?           0    0    TABLE p_icrad    COMMENT     3   COMMENT ON TABLE sc_e002.p_icrad IS 'ICR Datos a';
          sc_e002          postgres    false    223            ?           0    0    COLUMN p_icrad.fbc01    COMMENT     8   COMMENT ON COLUMN sc_e002.p_icrad.fbc01 IS 'Campo C01';
          sc_e002          postgres    false    223            ?           0    0    COLUMN p_icrad.fvc02    COMMENT     8   COMMENT ON COLUMN sc_e002.p_icrad.fvc02 IS 'Campo C02';
          sc_e002          postgres    false    223            ?           0    0    COLUMN p_icrad.fdc03d    COMMENT     ?   COMMENT ON COLUMN sc_e002.p_icrad.fdc03d IS 'Campo C03 Desde';
          sc_e002          postgres    false    223            ?           0    0    COLUMN p_icrad.fdc04h    COMMENT     ?   COMMENT ON COLUMN sc_e002.p_icrad.fdc04h IS 'Campo C04 Hasta';
          sc_e002          postgres    false    223            ?           0    0    COLUMN p_icrad.fbc11    COMMENT     8   COMMENT ON COLUMN sc_e002.p_icrad.fbc11 IS 'Campo C11';
          sc_e002          postgres    false    223            ?           0    0    COLUMN p_icrad.fdc05    COMMENT     8   COMMENT ON COLUMN sc_e002.p_icrad.fdc05 IS 'Campo C05';
          sc_e002          postgres    false    223            ?            1259    17374    p_icrbd    TABLE     ?   CREATE TABLE sc_e002.p_icrbd (
    fbc11 bigint NOT NULL,
    fvc12 character varying(50) NOT NULL,
    fdc13 date DEFAULT CURRENT_DATE NOT NULL,
    fdc14 date
);
    DROP TABLE sc_e002.p_icrbd;
       sc_e002         heap    postgres    false    10            ?           0    0    TABLE p_icrbd    COMMENT     3   COMMENT ON TABLE sc_e002.p_icrbd IS 'ICR Datos b';
          sc_e002          postgres    false    224            ?           0    0    COLUMN p_icrbd.fbc11    COMMENT     8   COMMENT ON COLUMN sc_e002.p_icrbd.fbc11 IS 'Campo C11';
          sc_e002          postgres    false    224            ?           0    0    COLUMN p_icrbd.fvc12    COMMENT     8   COMMENT ON COLUMN sc_e002.p_icrbd.fvc12 IS 'Campo C12';
          sc_e002          postgres    false    224            ?           0    0    COLUMN p_icrbd.fdc13    COMMENT     8   COMMENT ON COLUMN sc_e002.p_icrbd.fdc13 IS 'Campo C13';
          sc_e002          postgres    false    224            ?           0    0    COLUMN p_icrbd.fdc14    COMMENT     8   COMMENT ON COLUMN sc_e002.p_icrbd.fdc14 IS 'Campo C14';
          sc_e002          postgres    false    224            ?            1259    17378    p_icrcd    TABLE     ?   CREATE TABLE sc_e002.p_icrcd (
    fbc21 bigint NOT NULL,
    fvc22 character varying(50) NOT NULL,
    fdc23 date NOT NULL,
    fbc11 bigint NOT NULL,
    fdc24 date
);
    DROP TABLE sc_e002.p_icrcd;
       sc_e002         heap    postgres    false    10            ?           0    0    TABLE p_icrcd    COMMENT     3   COMMENT ON TABLE sc_e002.p_icrcd IS 'ICR Datos c';
          sc_e002          postgres    false    225            ?           0    0    COLUMN p_icrcd.fbc21    COMMENT     8   COMMENT ON COLUMN sc_e002.p_icrcd.fbc21 IS 'Campo C21';
          sc_e002          postgres    false    225            ?           0    0    COLUMN p_icrcd.fvc22    COMMENT     8   COMMENT ON COLUMN sc_e002.p_icrcd.fvc22 IS 'Campo C22';
          sc_e002          postgres    false    225            ?           0    0    COLUMN p_icrcd.fdc23    COMMENT     8   COMMENT ON COLUMN sc_e002.p_icrcd.fdc23 IS 'Campo C23';
          sc_e002          postgres    false    225            ?           0    0    COLUMN p_icrcd.fbc11    COMMENT     8   COMMENT ON COLUMN sc_e002.p_icrcd.fbc11 IS 'Campo C11';
          sc_e002          postgres    false    225            ?           0    0    COLUMN p_icrcd.fdc24    COMMENT     8   COMMENT ON COLUMN sc_e002.p_icrcd.fdc24 IS 'Campo C24';
          sc_e002          postgres    false    225            ?            1259    17381    p_icrdd    TABLE     ?   CREATE TABLE sc_e002.p_icrdd (
    fbc01 bigint NOT NULL,
    fbc21 bigint NOT NULL,
    fdc41 date DEFAULT CURRENT_DATE NOT NULL,
    fbc42 bigint NOT NULL,
    fbc11 bigint,
    fdc43 date
);
    DROP TABLE sc_e002.p_icrdd;
       sc_e002         heap    postgres    false    10            ?           0    0    TABLE p_icrdd    COMMENT     3   COMMENT ON TABLE sc_e002.p_icrdd IS 'ICR Datos d';
          sc_e002          postgres    false    226            ?           0    0    COLUMN p_icrdd.fbc01    COMMENT     8   COMMENT ON COLUMN sc_e002.p_icrdd.fbc01 IS 'Campo C01';
          sc_e002          postgres    false    226            ?           0    0    COLUMN p_icrdd.fbc21    COMMENT     8   COMMENT ON COLUMN sc_e002.p_icrdd.fbc21 IS 'Campo C21';
          sc_e002          postgres    false    226            ?           0    0    COLUMN p_icrdd.fdc41    COMMENT     8   COMMENT ON COLUMN sc_e002.p_icrdd.fdc41 IS 'Campo C41';
          sc_e002          postgres    false    226            ?           0    0    COLUMN p_icrdd.fbc42    COMMENT     8   COMMENT ON COLUMN sc_e002.p_icrdd.fbc42 IS 'Campo C42';
          sc_e002          postgres    false    226            ?           0    0    COLUMN p_icrdd.fbc11    COMMENT     8   COMMENT ON COLUMN sc_e002.p_icrdd.fbc11 IS 'Campo C11';
          sc_e002          postgres    false    226            ?           0    0    COLUMN p_icrdd.fdc43    COMMENT     8   COMMENT ON COLUMN sc_e002.p_icrdd.fdc43 IS 'Campo C43';
          sc_e002          postgres    false    226            ?            1259    17385    p_logcmp    TABLE       CREATE TABLE sc_e003.p_logcmp (
    finpid integer DEFAULT pg_backend_pid() NOT NULL,
    ftuser text DEFAULT SESSION_USER NOT NULL,
    fafcin timestamp with time zone DEFAULT clock_timestamp() NOT NULL,
    fafccr timestamp with time zone DEFAULT clock_timestamp() NOT NULL,
    fbseqn bigint NOT NULL,
    ftpgin text NOT NULL,
    ftpgcr text NOT NULL,
    flcncl boolean DEFAULT false NOT NULL,
    ftlogd text,
    flpubl boolean DEFAULT false NOT NULL,
    ftapus text,
    ftaprl text,
    ftlfin boolean DEFAULT false NOT NULL
);
    DROP TABLE sc_e003.p_logcmp;
       sc_e003         heap    postgres    false    4            ?           0    0    TABLE p_logcmp    COMMENT     9   COMMENT ON TABLE sc_e003.p_logcmp IS 'Log de Ejecucion';
          sc_e003          postgres    false    227            ?           0    0    COLUMN p_logcmp.finpid    COMMENT     >   COMMENT ON COLUMN sc_e003.p_logcmp.finpid IS 'PID   Session';
          sc_e003          postgres    false    227            ?           0    0    COLUMN p_logcmp.ftuser    COMMENT     >   COMMENT ON COLUMN sc_e003.p_logcmp.ftuser IS 'User  Session';
          sc_e003          postgres    false    227            ?           0    0    COLUMN p_logcmp.fafcin    COMMENT     >   COMMENT ON COLUMN sc_e003.p_logcmp.fafcin IS 'Fecha Inicial';
          sc_e003          postgres    false    227            ?           0    0    COLUMN p_logcmp.fafccr    COMMENT     >   COMMENT ON COLUMN sc_e003.p_logcmp.fafccr IS 'Fecha Evento ';
          sc_e003          postgres    false    227            ?           0    0    COLUMN p_logcmp.fbseqn    COMMENT     >   COMMENT ON COLUMN sc_e003.p_logcmp.fbseqn IS 'Nro Sequencia';
          sc_e003          postgres    false    227            ?           0    0    COLUMN p_logcmp.ftpgin    COMMENT     B   COMMENT ON COLUMN sc_e003.p_logcmp.ftpgin IS 'Func/Proc.Inicial';
          sc_e003          postgres    false    227            ?           0    0    COLUMN p_logcmp.ftpgcr    COMMENT     A   COMMENT ON COLUMN sc_e003.p_logcmp.ftpgcr IS 'Func/Proc.Evento';
          sc_e003          postgres    false    227            ?           0    0    COLUMN p_logcmp.flcncl    COMMENT     <   COMMENT ON COLUMN sc_e003.p_logcmp.flcncl IS 'Ind Cancela';
          sc_e003          postgres    false    227            ?           0    0    COLUMN p_logcmp.ftlogd    COMMENT     <   COMMENT ON COLUMN sc_e003.p_logcmp.ftlogd IS 'Msg Log    ';
          sc_e003          postgres    false    227            ?           0    0    COLUMN p_logcmp.flpubl    COMMENT     <   COMMENT ON COLUMN sc_e003.p_logcmp.flpubl IS 'Ind Publico';
          sc_e003          postgres    false    227            ?           0    0    COLUMN p_logcmp.ftapus    COMMENT     <   COMMENT ON COLUMN sc_e003.p_logcmp.ftapus IS 'App Usuario';
          sc_e003          postgres    false    227            ?           0    0    COLUMN p_logcmp.ftaprl    COMMENT     <   COMMENT ON COLUMN sc_e003.p_logcmp.ftaprl IS 'App Rol    ';
          sc_e003          postgres    false    227            ?           0    0    COLUMN p_logcmp.ftlfin    COMMENT     <   COMMENT ON COLUMN sc_e003.p_logcmp.ftlfin IS 'Ind Fin    ';
          sc_e003          postgres    false    227            ?            1259    17397    p_logpub    TABLE     ?   CREATE TABLE sc_e003.p_logpub (
    finpid integer DEFAULT pg_backend_pid() NOT NULL,
    fberrn bigint NOT NULL,
    fbseqn bigint NOT NULL,
    fafccr timestamp with time zone NOT NULL,
    ftlogd text
);
    DROP TABLE sc_e003.p_logpub;
       sc_e003         heap    postgres    false    4            ?           0    0    TABLE p_logpub    COMMENT     A   COMMENT ON TABLE sc_e003.p_logpub IS 'Log Publico de Ejecucion';
          sc_e003          postgres    false    228            ?           0    0    COLUMN p_logpub.finpid    COMMENT     >   COMMENT ON COLUMN sc_e003.p_logpub.finpid IS 'PID Session  ';
          sc_e003          postgres    false    228            ?           0    0    COLUMN p_logpub.fberrn    COMMENT     >   COMMENT ON COLUMN sc_e003.p_logpub.fberrn IS 'Nro.Error    ';
          sc_e003          postgres    false    228                        0    0    COLUMN p_logpub.fbseqn    COMMENT     >   COMMENT ON COLUMN sc_e003.p_logpub.fbseqn IS 'Nro Sequencia';
          sc_e003          postgres    false    228                       0    0    COLUMN p_logpub.fafccr    COMMENT     >   COMMENT ON COLUMN sc_e003.p_logpub.fafccr IS 'Fecha Evento ';
          sc_e003          postgres    false    228                       0    0    COLUMN p_logpub.ftlogd    COMMENT     >   COMMENT ON COLUMN sc_e003.p_logpub.ftlogd IS 'Msg Log      ';
          sc_e003          postgres    false    228            ?            1259    17403    p_anlsco    TABLE     <   CREATE TABLE sc_e004.p_anlsco (
    ftscnm text NOT NULL
);
    DROP TABLE sc_e004.p_anlsco;
       sc_e004         heap    postgres    false    5                       0    0    TABLE p_anlsco    COMMENT     :   COMMENT ON TABLE sc_e004.p_anlsco IS 'Esquemas a omitir';
          sc_e004          postgres    false    229                       0    0    COLUMN p_anlsco.ftscnm    COMMENT     F   COMMENT ON COLUMN sc_e004.p_anlsco.ftscnm IS 'Nombre esquema Omitir';
          sc_e004          postgres    false    229            ?            1259    17408    p_appapp    TABLE     h   CREATE TABLE sc_e004.p_appapp (
    fvapnam character varying(5) NOT NULL,
    ftscprd text NOT NULL
);
    DROP TABLE sc_e004.p_appapp;
       sc_e004         heap    postgres    false    5                       0    0    TABLE p_appapp    COMMENT     9   COMMENT ON TABLE sc_e004.p_appapp IS 'App Aplicaciones';
          sc_e004          postgres    false    230                       0    0    COLUMN p_appapp.fvapnam    COMMENT     B   COMMENT ON COLUMN sc_e004.p_appapp.fvapnam IS 'App Nombre      ';
          sc_e004          postgres    false    230                       0    0    COLUMN p_appapp.ftscprd    COMMENT     B   COMMENT ON COLUMN sc_e004.p_appapp.ftscprd IS 'Schema Prod     ';
          sc_e004          postgres    false    230            ?            1259    17413    p_appnvu    TABLE     @   CREATE TABLE sc_e004.p_appnvu (
    finvlus integer NOT NULL
);
    DROP TABLE sc_e004.p_appnvu;
       sc_e004         heap    postgres    false    5                       0    0    TABLE p_appnvu    COMMENT     *   COMMENT ON TABLE sc_e004.p_appnvu IS 'a';
          sc_e004          postgres    false    231            	           0    0    COLUMN p_appnvu.finvlus    COMMENT     I   COMMENT ON COLUMN sc_e004.p_appnvu.finvlus IS 'Nivel Funcional Usuario';
          sc_e004          postgres    false    231            ?            1259    17416    p_appopt    TABLE       CREATE TABLE sc_e004.p_appopt (
    fvotnam character varying(5) NOT NULL,
    ftotdsc text NOT NULL,
    fvotrtn character varying(30),
    fiotv01 integer DEFAULT 0 NOT NULL,
    fiotv02 integer DEFAULT 0 NOT NULL,
    fiotv03 integer DEFAULT 0 NOT NULL
);
    DROP TABLE sc_e004.p_appopt;
       sc_e004         heap    postgres    false    5            
           0    0    TABLE p_appopt    COMMENT     8   COMMENT ON TABLE sc_e004.p_appopt IS 'App Oper.Tablas';
          sc_e004          postgres    false    232                       0    0    COLUMN p_appopt.fvotnam    COMMENT     A   COMMENT ON COLUMN sc_e004.p_appopt.fvotnam IS 'Op.Nombre      ';
          sc_e004          postgres    false    232                       0    0    COLUMN p_appopt.ftotdsc    COMMENT     A   COMMENT ON COLUMN sc_e004.p_appopt.ftotdsc IS 'Op.Descripcion ';
          sc_e004          postgres    false    232                       0    0    COLUMN p_appopt.fvotrtn    COMMENT     A   COMMENT ON COLUMN sc_e004.p_appopt.fvotrtn IS 'Op.Retorno     ';
          sc_e004          postgres    false    232                       0    0    COLUMN p_appopt.fiotv01    COMMENT     A   COMMENT ON COLUMN sc_e004.p_appopt.fiotv01 IS 'Val.Operacion 1';
          sc_e004          postgres    false    232                       0    0    COLUMN p_appopt.fiotv02    COMMENT     A   COMMENT ON COLUMN sc_e004.p_appopt.fiotv02 IS 'Val.Operacion 2';
          sc_e004          postgres    false    232                       0    0    COLUMN p_appopt.fiotv03    COMMENT     A   COMMENT ON COLUMN sc_e004.p_appopt.fiotv03 IS 'Val.Operacion 3';
          sc_e004          postgres    false    232            ?            1259    17424    p_apptbl    TABLE     N   CREATE TABLE sc_e004.p_apptbl (
    fvtbnam character varying(50) NOT NULL
);
    DROP TABLE sc_e004.p_apptbl;
       sc_e004         heap    postgres    false    5                       0    0    TABLE p_apptbl    COMMENT     8   COMMENT ON TABLE sc_e004.p_apptbl IS 'App Tablas     ';
          sc_e004          postgres    false    233                       0    0    COLUMN p_apptbl.fvtbnam    COMMENT     A   COMMENT ON COLUMN sc_e004.p_apptbl.fvtbnam IS 'Tabla Nombre   ';
          sc_e004          postgres    false    233            ?            1259    17427    p_apptbo    TABLE     ?  CREATE TABLE sc_e004.p_apptbo (
    fvapnam character varying(5) NOT NULL,
    fvapals character varying(5) NOT NULL,
    fvtbnam character varying(50) NOT NULL,
    fvtbals character varying(5) NOT NULL,
    fvotnam character varying(5) NOT NULL,
    fvotals character varying(5) NOT NULL,
    finvlus integer NOT NULL,
    fiotv01 integer,
    fiotv02 integer,
    fiotv03 integer,
    flrtchk boolean,
    fbrtcnt bigint
);
    DROP TABLE sc_e004.p_apptbo;
       sc_e004         heap    postgres    false    5                       0    0    TABLE p_apptbo    COMMENT     =   COMMENT ON TABLE sc_e004.p_apptbo IS 'App Tablas Operacion';
          sc_e004          postgres    false    234                       0    0    COLUMN p_apptbo.fvapnam    COMMENT     B   COMMENT ON COLUMN sc_e004.p_apptbo.fvapnam IS 'App Nombre      ';
          sc_e004          postgres    false    234                       0    0    COLUMN p_apptbo.fvapals    COMMENT     B   COMMENT ON COLUMN sc_e004.p_apptbo.fvapals IS 'App Alias       ';
          sc_e004          postgres    false    234                       0    0    COLUMN p_apptbo.fvtbnam    COMMENT     B   COMMENT ON COLUMN sc_e004.p_apptbo.fvtbnam IS 'Tabla Nombre    ';
          sc_e004          postgres    false    234                       0    0    COLUMN p_apptbo.fvtbals    COMMENT     B   COMMENT ON COLUMN sc_e004.p_apptbo.fvtbals IS 'Tabla Alias     ';
          sc_e004          postgres    false    234                       0    0    COLUMN p_apptbo.fvotnam    COMMENT     B   COMMENT ON COLUMN sc_e004.p_apptbo.fvotnam IS 'Op.Nombre       ';
          sc_e004          postgres    false    234                       0    0    COLUMN p_apptbo.fvotals    COMMENT     B   COMMENT ON COLUMN sc_e004.p_apptbo.fvotals IS 'Op.Alias        ';
          sc_e004          postgres    false    234                       0    0    COLUMN p_apptbo.finvlus    COMMENT     ?   COMMENT ON COLUMN sc_e004.p_apptbo.finvlus IS 'Nivel Usuario';
          sc_e004          postgres    false    234                       0    0    COLUMN p_apptbo.fiotv01    COMMENT     B   COMMENT ON COLUMN sc_e004.p_apptbo.fiotv01 IS 'Val.Operacion 1 ';
          sc_e004          postgres    false    234                       0    0    COLUMN p_apptbo.fiotv02    COMMENT     B   COMMENT ON COLUMN sc_e004.p_apptbo.fiotv02 IS 'Val.Operacion 2 ';
          sc_e004          postgres    false    234                       0    0    COLUMN p_apptbo.fiotv03    COMMENT     B   COMMENT ON COLUMN sc_e004.p_apptbo.fiotv03 IS 'Val.Operacion 3 ';
          sc_e004          postgres    false    234                       0    0    COLUMN p_apptbo.flrtchk    COMMENT     B   COMMENT ON COLUMN sc_e004.p_apptbo.flrtchk IS 'Retorno Check   ';
          sc_e004          postgres    false    234                       0    0    COLUMN p_apptbo.fbrtcnt    COMMENT     B   COMMENT ON COLUMN sc_e004.p_apptbo.fbrtcnt IS 'Retorno Cantidad';
          sc_e004          postgres    false    234            ?            1259    17430    p_icrad    TABLE     ?   CREATE TABLE sc_e004.p_icrad (
    fbc01 bigint NOT NULL,
    fvc02 character varying(50) NOT NULL,
    fdc03d date NOT NULL,
    fdc04h date,
    fbc11 bigint NOT NULL,
    fdc05 date
);
    DROP TABLE sc_e004.p_icrad;
       sc_e004         heap    postgres    false    5                        0    0    TABLE p_icrad    COMMENT     3   COMMENT ON TABLE sc_e004.p_icrad IS 'ICR Datos a';
          sc_e004          postgres    false    235            !           0    0    COLUMN p_icrad.fbc01    COMMENT     8   COMMENT ON COLUMN sc_e004.p_icrad.fbc01 IS 'Campo C01';
          sc_e004          postgres    false    235            "           0    0    COLUMN p_icrad.fvc02    COMMENT     8   COMMENT ON COLUMN sc_e004.p_icrad.fvc02 IS 'Campo C02';
          sc_e004          postgres    false    235            #           0    0    COLUMN p_icrad.fdc03d    COMMENT     ?   COMMENT ON COLUMN sc_e004.p_icrad.fdc03d IS 'Campo C03 Desde';
          sc_e004          postgres    false    235            $           0    0    COLUMN p_icrad.fdc04h    COMMENT     ?   COMMENT ON COLUMN sc_e004.p_icrad.fdc04h IS 'Campo C04 Hasta';
          sc_e004          postgres    false    235            %           0    0    COLUMN p_icrad.fbc11    COMMENT     8   COMMENT ON COLUMN sc_e004.p_icrad.fbc11 IS 'Campo C11';
          sc_e004          postgres    false    235            &           0    0    COLUMN p_icrad.fdc05    COMMENT     8   COMMENT ON COLUMN sc_e004.p_icrad.fdc05 IS 'Campo C05';
          sc_e004          postgres    false    235            ?            1259    17433    p_icrah    TABLE     ?   CREATE TABLE sc_e004.p_icrah (
    fbc01 bigint NOT NULL,
    fdc03d date NOT NULL,
    fvc02 character varying(50) NOT NULL,
    fdc04h date NOT NULL,
    fbc11 bigint NOT NULL,
    fvc12 character varying(50) NOT NULL,
    fdc05 date NOT NULL
);
    DROP TABLE sc_e004.p_icrah;
       sc_e004         heap    postgres    false    5            '           0    0    TABLE p_icrah    COMMENT     7   COMMENT ON TABLE sc_e004.p_icrah IS 'ICR Historico a';
          sc_e004          postgres    false    236            (           0    0    COLUMN p_icrah.fbc01    COMMENT     8   COMMENT ON COLUMN sc_e004.p_icrah.fbc01 IS 'Campo C01';
          sc_e004          postgres    false    236            )           0    0    COLUMN p_icrah.fdc03d    COMMENT     ?   COMMENT ON COLUMN sc_e004.p_icrah.fdc03d IS 'Campo C03 Desde';
          sc_e004          postgres    false    236            *           0    0    COLUMN p_icrah.fvc02    COMMENT     8   COMMENT ON COLUMN sc_e004.p_icrah.fvc02 IS 'Campo C02';
          sc_e004          postgres    false    236            +           0    0    COLUMN p_icrah.fdc04h    COMMENT     ?   COMMENT ON COLUMN sc_e004.p_icrah.fdc04h IS 'Campo C04 Hasta';
          sc_e004          postgres    false    236            ,           0    0    COLUMN p_icrah.fbc11    COMMENT     8   COMMENT ON COLUMN sc_e004.p_icrah.fbc11 IS 'Campo C11';
          sc_e004          postgres    false    236            -           0    0    COLUMN p_icrah.fvc12    COMMENT     8   COMMENT ON COLUMN sc_e004.p_icrah.fvc12 IS 'Campo C12';
          sc_e004          postgres    false    236            .           0    0    COLUMN p_icrah.fdc05    COMMENT     8   COMMENT ON COLUMN sc_e004.p_icrah.fdc05 IS 'Campo C05';
          sc_e004          postgres    false    236            ?            1259    17436    p_icrbd    TABLE     ?   CREATE TABLE sc_e004.p_icrbd (
    fbc11 bigint NOT NULL,
    fvc12 character varying(50) NOT NULL,
    fdc13 date DEFAULT CURRENT_DATE NOT NULL,
    fdc14 date
);
    DROP TABLE sc_e004.p_icrbd;
       sc_e004         heap    postgres    false    5            /           0    0    TABLE p_icrbd    COMMENT     3   COMMENT ON TABLE sc_e004.p_icrbd IS 'ICR Datos b';
          sc_e004          postgres    false    237            0           0    0    COLUMN p_icrbd.fbc11    COMMENT     8   COMMENT ON COLUMN sc_e004.p_icrbd.fbc11 IS 'Campo C11';
          sc_e004          postgres    false    237            1           0    0    COLUMN p_icrbd.fvc12    COMMENT     8   COMMENT ON COLUMN sc_e004.p_icrbd.fvc12 IS 'Campo C12';
          sc_e004          postgres    false    237            2           0    0    COLUMN p_icrbd.fdc13    COMMENT     8   COMMENT ON COLUMN sc_e004.p_icrbd.fdc13 IS 'Campo C13';
          sc_e004          postgres    false    237            3           0    0    COLUMN p_icrbd.fdc14    COMMENT     8   COMMENT ON COLUMN sc_e004.p_icrbd.fdc14 IS 'Campo C14';
          sc_e004          postgres    false    237            ?            1259    17440    p_icrcd    TABLE     ?   CREATE TABLE sc_e004.p_icrcd (
    fbc21 bigint NOT NULL,
    fvc22 character varying(50) NOT NULL,
    fdc23 date NOT NULL,
    fbc11 bigint NOT NULL,
    fdc24 date
);
    DROP TABLE sc_e004.p_icrcd;
       sc_e004         heap    postgres    false    5            4           0    0    TABLE p_icrcd    COMMENT     3   COMMENT ON TABLE sc_e004.p_icrcd IS 'ICR Datos c';
          sc_e004          postgres    false    238            5           0    0    COLUMN p_icrcd.fbc21    COMMENT     8   COMMENT ON COLUMN sc_e004.p_icrcd.fbc21 IS 'Campo C21';
          sc_e004          postgres    false    238            6           0    0    COLUMN p_icrcd.fvc22    COMMENT     8   COMMENT ON COLUMN sc_e004.p_icrcd.fvc22 IS 'Campo C22';
          sc_e004          postgres    false    238            7           0    0    COLUMN p_icrcd.fdc23    COMMENT     8   COMMENT ON COLUMN sc_e004.p_icrcd.fdc23 IS 'Campo C23';
          sc_e004          postgres    false    238            8           0    0    COLUMN p_icrcd.fbc11    COMMENT     8   COMMENT ON COLUMN sc_e004.p_icrcd.fbc11 IS 'Campo C11';
          sc_e004          postgres    false    238            9           0    0    COLUMN p_icrcd.fdc24    COMMENT     8   COMMENT ON COLUMN sc_e004.p_icrcd.fdc24 IS 'Campo C24';
          sc_e004          postgres    false    238            ?            1259    17443    p_icrch    TABLE     ?   CREATE TABLE sc_e004.p_icrch (
    fbc21 bigint NOT NULL,
    fdc24 date NOT NULL,
    fvc22 character varying(50) NOT NULL,
    fdc23 date NOT NULL,
    fbc11 bigint NOT NULL,
    fvc12 character varying(50) NOT NULL
);
    DROP TABLE sc_e004.p_icrch;
       sc_e004         heap    postgres    false    5            :           0    0    TABLE p_icrch    COMMENT     7   COMMENT ON TABLE sc_e004.p_icrch IS 'ICR Historico c';
          sc_e004          postgres    false    239            ;           0    0    COLUMN p_icrch.fbc21    COMMENT     8   COMMENT ON COLUMN sc_e004.p_icrch.fbc21 IS 'Campo C21';
          sc_e004          postgres    false    239            <           0    0    COLUMN p_icrch.fdc24    COMMENT     8   COMMENT ON COLUMN sc_e004.p_icrch.fdc24 IS 'Campo C24';
          sc_e004          postgres    false    239            =           0    0    COLUMN p_icrch.fvc22    COMMENT     8   COMMENT ON COLUMN sc_e004.p_icrch.fvc22 IS 'Campo C22';
          sc_e004          postgres    false    239            >           0    0    COLUMN p_icrch.fdc23    COMMENT     8   COMMENT ON COLUMN sc_e004.p_icrch.fdc23 IS 'Campo C23';
          sc_e004          postgres    false    239            ?           0    0    COLUMN p_icrch.fbc11    COMMENT     8   COMMENT ON COLUMN sc_e004.p_icrch.fbc11 IS 'Campo C11';
          sc_e004          postgres    false    239            @           0    0    COLUMN p_icrch.fvc12    COMMENT     8   COMMENT ON COLUMN sc_e004.p_icrch.fvc12 IS 'Campo C12';
          sc_e004          postgres    false    239            ?            1259    17446    p_icrdd    TABLE     ?   CREATE TABLE sc_e004.p_icrdd (
    fbc01 bigint NOT NULL,
    fbc21 bigint NOT NULL,
    fdc41 date DEFAULT CURRENT_DATE NOT NULL,
    fbc42 bigint NOT NULL,
    fbc11 bigint,
    fdc43 date
);
    DROP TABLE sc_e004.p_icrdd;
       sc_e004         heap    postgres    false    5            A           0    0    TABLE p_icrdd    COMMENT     3   COMMENT ON TABLE sc_e004.p_icrdd IS 'ICR Datos d';
          sc_e004          postgres    false    240            B           0    0    COLUMN p_icrdd.fbc01    COMMENT     8   COMMENT ON COLUMN sc_e004.p_icrdd.fbc01 IS 'Campo C01';
          sc_e004          postgres    false    240            C           0    0    COLUMN p_icrdd.fbc21    COMMENT     8   COMMENT ON COLUMN sc_e004.p_icrdd.fbc21 IS 'Campo C21';
          sc_e004          postgres    false    240            D           0    0    COLUMN p_icrdd.fdc41    COMMENT     8   COMMENT ON COLUMN sc_e004.p_icrdd.fdc41 IS 'Campo C41';
          sc_e004          postgres    false    240            E           0    0    COLUMN p_icrdd.fbc42    COMMENT     8   COMMENT ON COLUMN sc_e004.p_icrdd.fbc42 IS 'Campo C42';
          sc_e004          postgres    false    240            F           0    0    COLUMN p_icrdd.fbc11    COMMENT     8   COMMENT ON COLUMN sc_e004.p_icrdd.fbc11 IS 'Campo C11';
          sc_e004          postgres    false    240            G           0    0    COLUMN p_icrdd.fdc43    COMMENT     8   COMMENT ON COLUMN sc_e004.p_icrdd.fdc43 IS 'Campo C43';
          sc_e004          postgres    false    240            ?            1259    17450    p_icrdh    TABLE     ?   CREATE TABLE sc_e004.p_icrdh (
    fbc01 bigint NOT NULL,
    fbc21 bigint NOT NULL,
    fdc03d date NOT NULL,
    fdc41 date NOT NULL,
    fbc42 bigint NOT NULL,
    fbc11 bigint NOT NULL,
    fvc12 character varying(50) NOT NULL,
    fdc43 date
);
    DROP TABLE sc_e004.p_icrdh;
       sc_e004         heap    postgres    false    5            H           0    0    TABLE p_icrdh    COMMENT     7   COMMENT ON TABLE sc_e004.p_icrdh IS 'ICR Historico d';
          sc_e004          postgres    false    241            I           0    0    COLUMN p_icrdh.fbc01    COMMENT     8   COMMENT ON COLUMN sc_e004.p_icrdh.fbc01 IS 'Campo C01';
          sc_e004          postgres    false    241            J           0    0    COLUMN p_icrdh.fbc21    COMMENT     8   COMMENT ON COLUMN sc_e004.p_icrdh.fbc21 IS 'Campo C21';
          sc_e004          postgres    false    241            K           0    0    COLUMN p_icrdh.fdc03d    COMMENT     ?   COMMENT ON COLUMN sc_e004.p_icrdh.fdc03d IS 'Campo C03 Desde';
          sc_e004          postgres    false    241            L           0    0    COLUMN p_icrdh.fdc41    COMMENT     8   COMMENT ON COLUMN sc_e004.p_icrdh.fdc41 IS 'Campo C41';
          sc_e004          postgres    false    241            M           0    0    COLUMN p_icrdh.fbc42    COMMENT     8   COMMENT ON COLUMN sc_e004.p_icrdh.fbc42 IS 'Campo C42';
          sc_e004          postgres    false    241            N           0    0    COLUMN p_icrdh.fbc11    COMMENT     8   COMMENT ON COLUMN sc_e004.p_icrdh.fbc11 IS 'Campo C11';
          sc_e004          postgres    false    241            O           0    0    COLUMN p_icrdh.fvc12    COMMENT     8   COMMENT ON COLUMN sc_e004.p_icrdh.fvc12 IS 'Campo C12';
          sc_e004          postgres    false    241            P           0    0    COLUMN p_icrdh.fdc43    COMMENT     8   COMMENT ON COLUMN sc_e004.p_icrdh.fdc43 IS 'Campo C43';
          sc_e004          postgres    false    241            ?            1259    17453    vi_anl_schs    VIEW     <  CREATE VIEW sc_e004.vi_anl_schs AS
 SELECT nsp.oid AS sch_oid,
    nsp.nspname AS sch_nam,
    obj_description(nsp.oid, 'pg_namespace'::name) AS sch_desc
   FROM (pg_namespace nsp
     LEFT JOIN sc_e004.p_anlsco omt ON ((nsp.nspname = omt.ftscnm)))
  WHERE ((omt.ftscnm IS NULL) AND (nsp.nspname !~~ 'pg_%'::text));
    DROP VIEW sc_e004.vi_anl_schs;
       sc_e004          postgres    false    229    5            Q           0    0    VIEW vi_anl_schs    COMMENT     <   COMMENT ON VIEW sc_e004.vi_anl_schs IS 'Esquemas Analizar';
          sc_e004          postgres    false    242            ?            1259    17457 	   vi_apptbo    VIEW     ?  CREATE VIEW sc_e004.vi_apptbo AS
 SELECT a.fvapnam,
    d.fvapals,
    d.fvtbnam,
    d.fvtbals,
    d.fvotnam,
    d.fvotals,
    d.finvlus,
    b.fvotrtn,
    COALESCE(d.fiotv01, b.fiotv01) AS fiotv01,
    COALESCE(d.fiotv02, b.fiotv02) AS fiotv02,
    COALESCE(d.fiotv03, b.fiotv03) AS fiotv03,
    d.flrtchk,
    d.fbrtcnt
   FROM ((sc_e004.p_apptbo d
     JOIN sc_e004.p_appapp a ON (((a.fvapnam)::text = (d.fvapnam)::text)))
     JOIN sc_e004.p_appopt b ON (((b.fvotnam)::text = (d.fvotnam)::text)));
    DROP VIEW sc_e004.vi_apptbo;
       sc_e004          postgres    false    234    234    234    234    234    234    232    232    232    232    232    230    234    234    234    234    234    234    5            R           0    0    VIEW vi_apptbo    COMMENT     *   COMMENT ON VIEW sc_e004.vi_apptbo IS 'a';
          sc_e004          postgres    false    243            ?            1259    17462    vi_seg_rol_usr    VIEW       CREATE VIEW sc_e004.vi_seg_rol_usr AS
 SELECT pa1.oid AS rol_oid,
    pa1.rolname AS rol_name,
    pa2.oid AS usr_oid,
    pa2.rolname AS usr_name
   FROM ((pg_auth_members pam
     JOIN pg_authid pa1 ON ((pam.roleid = pa1.oid)))
     JOIN pg_authid pa2 ON ((pam.member = pa2.oid)));
 "   DROP VIEW sc_e004.vi_seg_rol_usr;
       sc_e004          postgres    false    5            S           0    0    VIEW vi_seg_rol_usr    COMMENT     <   COMMENT ON VIEW sc_e004.vi_seg_rol_usr IS 'Roles Usuarios';
          sc_e004          postgres    false    244            ?            1259    17467    vv_anl_flds    VIEW     ?  CREATE VIEW sc_e004.vv_anl_flds AS
 SELECT psp.fld_sch,
    psp.fld_nam,
    psp.fld_typ
   FROM ( SELECT (nsp.nspname)::text AS fld_sch,
            (att.attname)::text AS fld_nam,
            format_type(att.atttypid, att.atttypmod) AS fld_typ
           FROM (((pg_attribute att
             JOIN pg_class cls ON ((att.attrelid = cls.oid)))
             JOIN pg_namespace nsp ON ((nsp.oid = cls.relnamespace)))
             JOIN sc_e004.vi_anl_schs ans ON ((ans.sch_oid = nsp.oid)))
          WHERE ((att.attstattarget <> 0) AND (NOT (cls.relkind = ANY (ARRAY['S'::"char", 'i'::"char"]))))) psp
  GROUP BY psp.fld_sch, psp.fld_nam, psp.fld_typ;
    DROP VIEW sc_e004.vv_anl_flds;
       sc_e004          postgres    false    242    5            T           0    0    VIEW vv_anl_flds    COMMENT     <   COMMENT ON VIEW sc_e004.vv_anl_flds IS 'Fields   Analizar';
          sc_e004          postgres    false    245            ?            1259    17472    vv_anl_objs    VIEW     n  CREATE VIEW sc_e004.vv_anl_objs AS
 SELECT cls.oid AS obj_oid,
    cls.relkind AS obj_ind,
    nsp.nspname AS obj_sch,
    cls.relname AS obj_nam,
    sc_e003.utl_dsc_relkind((cls.relkind)::text) AS obj_typ,
    obj_description(cls.oid, 'pg_class'::name) AS obj_desc,
    sc_e004.anl_scn_relkind((cls.relkind)::text, (nsp.nspname)::text, (cls.relname)::text) AS obj_scan
   FROM ((pg_class cls
     JOIN pg_namespace nsp ON ((nsp.oid = cls.relnamespace)))
     JOIN sc_e004.vi_anl_schs ans ON ((ans.sch_oid = nsp.oid)))
UNION
 SELECT prc.oid AS obj_oid,
    prc.prokind AS obj_ind,
    nsp.nspname AS obj_sch,
    prc.proname AS obj_nam,
    sc_e003.utl_dsc_prokind((prc.prokind)::text) AS obj_typ,
    obj_description(prc.oid, 'pg_proc'::name) AS obj_desc,
    concat(TRIM(BOTH FROM nsp.nspname), '.', TRIM(BOTH FROM prc.proname), '(') AS obj_scan
   FROM ((pg_proc prc
     JOIN pg_namespace nsp ON ((nsp.oid = prc.pronamespace)))
     JOIN sc_e004.vi_anl_schs ans ON ((ans.sch_oid = nsp.oid)))
UNION
 SELECT pgc.oid AS obj_oid,
    pgc.contype AS obj_ind,
    nsp.nspname AS obj_sch,
    pgc.conname AS obj_nam,
    sc_e003.utl_dsc_contype((pgc.contype)::text) AS obj_typ,
    obj_description(pgc.oid, 'pg_constraint'::name) AS obj_desc,
    NULL::text AS obj_scan
   FROM ((pg_constraint pgc
     JOIN pg_namespace nsp ON ((nsp.oid = pgc.connamespace)))
     JOIN sc_e004.vi_anl_schs ans ON ((ans.sch_oid = nsp.oid)))
UNION
 SELECT trg.oid AS obj_oid,
    NULL::"char" AS obj_ind,
    nsp.nspname AS obj_sch,
    trg.tgname AS obj_nam,
    'Trigger'::text AS obj_typ,
    obj_description(trg.oid, 'pg_trigger'::name) AS obj_desc,
    NULL::text AS obj_scan
   FROM (((pg_trigger trg
     JOIN pg_class cls ON ((trg.tgrelid = cls.oid)))
     JOIN pg_namespace nsp ON ((cls.relnamespace = nsp.oid)))
     JOIN sc_e004.vi_anl_schs ans ON ((ans.sch_oid = nsp.oid)))
  WHERE (trg.tgisinternal = false);
    DROP VIEW sc_e004.vv_anl_objs;
       sc_e004          postgres    false    259    308    242    257    258    5            U           0    0    VIEW vv_anl_objs    COMMENT     <   COMMENT ON VIEW sc_e004.vv_anl_objs IS 'Objetos  Analizar';
          sc_e004          postgres    false    246            ?            1259    17477    vv_anl_objs_flds    VIEW     ?  CREATE VIEW sc_e004.vv_anl_objs_flds AS
 SELECT cls.oid AS obj_oid,
    nsp.nspname AS obj_sch,
    cls.relname AS obj_nam,
    cls.relkind AS obj_ind,
    sc_e003.utl_dsc_relkind((cls.relkind)::text) AS obj_typ,
    obj_description(cls.oid, 'pg_class'::name) AS obj_desc,
    att.attnum AS fld_ord,
    (att.attname)::text AS fld_nam,
    format_type(att.atttypid, att.atttypmod) AS fld_tip
   FROM (((pg_attribute att
     JOIN pg_class cls ON ((cls.oid = att.attrelid)))
     JOIN pg_namespace nsp ON ((nsp.oid = cls.relnamespace)))
     JOIN sc_e004.vi_anl_schs ans ON ((ans.sch_oid = nsp.oid)))
  WHERE ((att.attnum > 0) AND (cls.relkind <> 'S'::"char") AND (NOT att.attisdropped));
 $   DROP VIEW sc_e004.vv_anl_objs_flds;
       sc_e004          postgres    false    259    242    5            V           0    0    VIEW vv_anl_objs_flds    COMMENT     I   COMMENT ON VIEW sc_e004.vv_anl_objs_flds IS 'Obj Relacion Fld Analizar';
          sc_e004          postgres    false    247            ?            1259    17482    vv_anl_objs_objs    VIEW     ?  CREATE VIEW sc_e004.vv_anl_objs_objs AS
 SELECT clo.oid AS obj_oid,
    nso.nspname AS obj_sch,
    clo.relname AS obj_nam,
    clo.relkind AS obj_ind,
    sc_e003.utl_dsc_relkind((clo.relkind)::text) AS obj_typ,
    clr.oid AS rel_oid,
    nsr.nspname AS rel_sch,
    clr.relname AS rel_nam,
    clr.relkind AS rel_ind,
    sc_e003.utl_dsc_relkind((clr.relkind)::text) AS rel_typ
   FROM (((((pg_index inx
     JOIN pg_class clo ON ((clo.oid = inx.indrelid)))
     JOIN pg_class clr ON ((clr.oid = inx.indexrelid)))
     JOIN pg_namespace nso ON ((nso.oid = clr.relnamespace)))
     JOIN pg_namespace nsr ON ((nsr.oid = clr.relnamespace)))
     JOIN sc_e004.vi_anl_schs ans ON ((ans.sch_oid = nsr.oid)))
UNION
 SELECT clo.oid AS obj_oid,
    nso.nspname AS obj_sch,
    clo.relname AS obj_nam,
    clo.relkind AS obj_ind,
    sc_e003.utl_dsc_relkind((clo.relkind)::text) AS obj_typ,
    cnt.oid AS rel_oid,
    nsr.nspname AS rel_sch,
    cnt.conname AS rel_nam,
    cnt.contype AS rel_ind,
    sc_e003.utl_dsc_contype((cnt.contype)::text) AS rel_typ
   FROM ((((pg_constraint cnt
     JOIN pg_class clo ON ((clo.oid = cnt.conrelid)))
     JOIN pg_namespace nso ON ((nso.oid = cnt.connamespace)))
     JOIN pg_namespace nsr ON ((nsr.oid = clo.relnamespace)))
     JOIN sc_e004.vi_anl_schs ans ON ((ans.sch_oid = nsr.oid)))
UNION
 SELECT cnt.oid AS obj_oid,
    nso.nspname AS obj_sch,
    cnt.conname AS obj_nam,
    cnt.contype AS obj_ind,
    sc_e003.utl_dsc_contype((cnt.contype)::text) AS obj_typ,
    clr.oid AS rel_oid,
    nsr.nspname AS rel_sch,
    clr.relname AS rel_nam,
    clr.relkind AS rel_ind,
    sc_e003.utl_dsc_relkind((clr.relkind)::text) AS rel_typ
   FROM ((((pg_constraint cnt
     JOIN pg_class clr ON ((clr.oid = cnt.conindid)))
     JOIN pg_namespace nso ON ((nso.oid = cnt.connamespace)))
     JOIN pg_namespace nsr ON ((nsr.oid = clr.relnamespace)))
     JOIN sc_e004.vi_anl_schs ans ON ((ans.sch_oid = nsr.oid)))
UNION
 SELECT clo.oid AS obj_oid,
    nso.nspname AS obj_sch,
    clo.relname AS obj_nam,
    clo.relkind AS obj_ind,
    sc_e003.utl_dsc_relkind((clo.relkind)::text) AS obj_typ,
    clr.oid AS rel_oid,
    nsr.nspname AS rel_sch,
    clr.relname AS rel_nam,
    clr.relkind AS rel_ind,
    sc_e003.utl_dsc_relkind((clr.relkind)::text) AS rel_typ
   FROM ((((((pg_constraint cnt
     JOIN pg_index inx ON ((inx.indexrelid = cnt.conindid)))
     JOIN pg_class clo ON ((clo.oid = cnt.conrelid)))
     JOIN pg_class clr ON ((clr.oid = inx.indrelid)))
     JOIN pg_namespace nso ON ((nso.oid = clo.relnamespace)))
     JOIN pg_namespace nsr ON ((nsr.oid = clr.relnamespace)))
     JOIN sc_e004.vi_anl_schs ans ON ((ans.sch_oid = nso.oid)))
  WHERE (cnt.contype = 'f'::"char")
UNION
 SELECT clo.oid AS obj_oid,
    nso.nspname AS obj_sch,
    clo.relname AS obj_nam,
    clo.relkind AS obj_ind,
    sc_e003.utl_dsc_relkind((clo.relkind)::text) AS obj_typ,
    trg.oid AS rel_oid,
    nso.nspname AS rel_sch,
    trg.tgname AS rel_nam,
    NULL::"char" AS rel_ind,
    'Trigger'::text AS rel_typ
   FROM (((pg_trigger trg
     JOIN pg_class clo ON ((clo.oid = trg.tgrelid)))
     JOIN pg_namespace nso ON ((nso.oid = clo.relnamespace)))
     JOIN sc_e004.vi_anl_schs ans ON ((ans.sch_oid = nso.oid)))
  WHERE (trg.tgconstraint = (0)::oid)
UNION
 SELECT clo.oid AS obj_oid,
    nso.nspname AS obj_sch,
    clo.relname AS obj_nam,
    clo.relkind AS obj_ind,
    sc_e003.utl_dsc_relkind((clo.relkind)::text) AS obj_typ,
    prc.oid AS rel_oid,
    nsr.nspname AS rel_sch,
    prc.proname AS rel_nam,
    prc.prokind AS rel_ind,
    sc_e003.utl_dsc_prokind((prc.prokind)::text) AS rel_typ
   FROM (((((pg_trigger trg
     JOIN pg_class clo ON ((clo.oid = trg.tgrelid)))
     JOIN pg_proc prc ON ((prc.oid = trg.tgfoid)))
     JOIN pg_namespace nso ON ((nso.oid = clo.relnamespace)))
     JOIN pg_namespace nsr ON ((nsr.oid = prc.pronamespace)))
     JOIN sc_e004.vi_anl_schs ans ON ((ans.sch_oid = nso.oid)))
  WHERE (trg.tgconstraint = (0)::oid);
 $   DROP VIEW sc_e004.vv_anl_objs_objs;
       sc_e004          postgres    false    257    242    259    258    5            W           0    0    VIEW vv_anl_objs_objs    COMMENT     I   COMMENT ON VIEW sc_e004.vv_anl_objs_objs IS 'Obj Relacion Obj Analizar';
          sc_e004          postgres    false    248            ?            1259    17487    vv_anl_srcs    VIEW     
  CREATE VIEW sc_e004.vv_anl_srcs AS
 SELECT pas.src_oid,
    pas.src_ind,
    pas.src_sch,
    pas.src_nam,
    pas.src_typ,
    pas.src_lin,
    TRIM(BOTH FROM sc_e004.anl_nrm_linea_src(pas.src_lin)) AS src_scan
   FROM ( SELECT prc.oid AS src_oid,
            nsp.nspname AS src_sch,
            prc.proname AS src_nam,
            prc.prokind AS src_ind,
            unnest(string_to_array(prc.prosrc, chr(10))) AS src_lin,
            sc_e003.utl_dsc_prokind((prc.prokind)::text) AS src_typ
           FROM ((pg_proc prc
             JOIN pg_namespace nsp ON ((nsp.oid = prc.pronamespace)))
             JOIN sc_e004.vi_anl_schs ans ON ((ans.sch_oid = nsp.oid)))) pas
  WHERE ((character_length(TRIM(BOTH FROM sc_e004.anl_nrm_linea_src(pas.src_lin))) > 0) AND (sc_e004.anl_omt_linea_src(sc_e004.anl_nrm_linea_src(pas.src_lin)) = 0))
UNION
 SELECT cls.oid AS src_oid,
    pbs.src_ind,
    pbs.src_sch,
    pbs.src_nam,
    pbs.src_typ,
    pbs.src_lin,
    TRIM(BOTH FROM sc_e004.anl_nrm_linea_src(pbs.src_lin)) AS src_scan
   FROM (( SELECT anl.sch_oid,
            vws.schemaname AS src_sch,
            vws.viewname AS src_nam,
            'v'::text AS src_ind,
            unnest(string_to_array(vws.definition, chr(10))) AS src_lin,
            sc_e003.utl_dsc_relkind('v'::text) AS src_typ
           FROM (pg_views vws
             JOIN sc_e004.vi_anl_schs anl ON ((anl.sch_nam = vws.schemaname)))) pbs
     JOIN pg_class cls ON (((cls.relnamespace = pbs.sch_oid) AND (cls.relname = pbs.src_nam) AND (cls.relkind = 'v'::"char"))))
  WHERE ((character_length(TRIM(BOTH FROM sc_e004.anl_nrm_linea_src(pbs.src_lin))) > 0) AND (sc_e004.anl_omt_linea_src(sc_e004.anl_nrm_linea_src(pbs.src_lin)) = 0))
UNION
 SELECT cls.oid AS src_oid,
    pcs.src_ind,
    pcs.src_sch,
    pcs.src_nam,
    pcs.src_typ,
    pcs.src_lin,
    TRIM(BOTH FROM sc_e004.anl_nrm_linea_src(pcs.src_lin)) AS src_scan
   FROM (( SELECT anl.sch_oid,
            mvw.schemaname AS src_sch,
            mvw.matviewname AS src_nam,
            'm'::text AS src_ind,
            unnest(string_to_array(mvw.definition, chr(10))) AS src_lin,
            sc_e003.utl_dsc_relkind('m'::text) AS src_typ
           FROM (pg_matviews mvw
             JOIN sc_e004.vi_anl_schs anl ON ((anl.sch_nam = mvw.schemaname)))) pcs
     JOIN pg_class cls ON (((cls.relnamespace = pcs.sch_oid) AND (cls.relname = pcs.src_nam) AND (cls.relkind = 'm'::"char"))))
  WHERE ((character_length(TRIM(BOTH FROM sc_e004.anl_nrm_linea_src(pcs.src_lin))) > 0) AND (sc_e004.anl_omt_linea_src(sc_e004.anl_nrm_linea_src(pcs.src_lin)) = 0));
    DROP VIEW sc_e004.vv_anl_srcs;
       sc_e004          postgres    false    242    306    307    242    258    259    5            X           0    0    VIEW vv_anl_srcs    COMMENT     <   COMMENT ON VIEW sc_e004.vv_anl_srcs IS 'Sources  Analizar';
          sc_e004          postgres    false    249            ?            1259    17492    vv_anl_srcs_objs    VIEW     y  CREATE VIEW sc_e004.vv_anl_srcs_objs AS
 SELECT src.src_oid,
    src.src_ind,
    src.src_sch,
    src.src_nam,
    src.src_typ,
    obj.obj_oid,
    obj.obj_ind,
    obj.obj_sch,
    obj.obj_nam,
    obj.obj_typ
   FROM sc_e004.vv_anl_srcs src,
    sc_e004.vv_anl_objs obj
  WHERE ((strpos(src.src_scan, obj.obj_scan) > 0) OR (strpos(src.src_scan, (obj.obj_nam)::text) > 0));
 $   DROP VIEW sc_e004.vv_anl_srcs_objs;
       sc_e004          postgres    false    249    249    249    246    246    249    249    246    246    246    249    246    5            Y           0    0    VIEW vv_anl_srcs_objs    COMMENT     J   COMMENT ON VIEW sc_e004.vv_anl_srcs_objs IS 'Src Relacion Obj Analizar ';
          sc_e004          postgres    false    250            ?            1259    17496    vv_anl_tbls_flds    VIEW     ?  CREATE VIEW sc_e004.vv_anl_tbls_flds AS
 SELECT cls.oid AS tbl_oid,
    nsp.nspname AS tbl_sch,
    cls.relname AS tbl_nam,
    cls.relkind AS tbl_ind,
    sc_e003.utl_dsc_relkind((cls.relkind)::text) AS tbl_typ,
    obj_description(cls.oid, 'pg_class'::name) AS tbl_desc,
    att.attnum AS fld_ord,
    (att.attname)::text AS fld_nam,
    format_type(att.atttypid, att.atttypmod) AS fld_tip,
    (NOT att.attnotnull) AS fld_nul,
    pg_get_expr(def.adbin, def.adrelid) AS fld_dft,
    col_description(att.attrelid, (att.attnum)::integer) AS fld_desc
   FROM ((((pg_attribute att
     JOIN pg_class cls ON ((cls.oid = att.attrelid)))
     JOIN pg_namespace nsp ON ((nsp.oid = cls.relnamespace)))
     JOIN sc_e004.vi_anl_schs ans ON ((ans.sch_oid = nsp.oid)))
     LEFT JOIN pg_attrdef def ON (((att.attrelid = def.adrelid) AND (att.attnum = def.adnum))))
  WHERE ((att.attnum > 0) AND (cls.relkind = 'r'::"char") AND (NOT att.attisdropped));
 $   DROP VIEW sc_e004.vv_anl_tbls_flds;
       sc_e004          postgres    false    242    259    5            Z           0    0    VIEW vv_anl_tbls_flds    COMMENT     I   COMMENT ON VIEW sc_e004.vv_anl_tbls_flds IS 'Tbl Relacion Fld Analizar';
          sc_e004          postgres    false    251            ?            1259    17501    p_appapp_dat    TABLE     Z   CREATE TABLE sc_e005.p_appapp_dat (
    fvapnam character varying(5),
    ftscprd text
);
 !   DROP TABLE sc_e005.p_appapp_dat;
       sc_e005         heap    postgres    false    8            ?            1259    17506    p_icrah    TABLE     ?   CREATE TABLE sc_e005.p_icrah (
    fbc01 bigint NOT NULL,
    fdc03d date NOT NULL,
    fvc02 character varying(50) NOT NULL,
    fdc04h date NOT NULL,
    fbc11 bigint NOT NULL,
    fvc12 character varying(50) NOT NULL,
    fdc05 date NOT NULL
);
    DROP TABLE sc_e005.p_icrah;
       sc_e005         heap    postgres    false    8            [           0    0    TABLE p_icrah    COMMENT     7   COMMENT ON TABLE sc_e005.p_icrah IS 'ICR Historico a';
          sc_e005          postgres    false    253            \           0    0    COLUMN p_icrah.fbc01    COMMENT     8   COMMENT ON COLUMN sc_e005.p_icrah.fbc01 IS 'Campo C01';
          sc_e005          postgres    false    253            ]           0    0    COLUMN p_icrah.fdc03d    COMMENT     ?   COMMENT ON COLUMN sc_e005.p_icrah.fdc03d IS 'Campo C03 Desde';
          sc_e005          postgres    false    253            ^           0    0    COLUMN p_icrah.fvc02    COMMENT     8   COMMENT ON COLUMN sc_e005.p_icrah.fvc02 IS 'Campo C02';
          sc_e005          postgres    false    253            _           0    0    COLUMN p_icrah.fdc04h    COMMENT     ?   COMMENT ON COLUMN sc_e005.p_icrah.fdc04h IS 'Campo C04 Hasta';
          sc_e005          postgres    false    253            `           0    0    COLUMN p_icrah.fbc11    COMMENT     8   COMMENT ON COLUMN sc_e005.p_icrah.fbc11 IS 'Campo C11';
          sc_e005          postgres    false    253            a           0    0    COLUMN p_icrah.fvc12    COMMENT     8   COMMENT ON COLUMN sc_e005.p_icrah.fvc12 IS 'Campo C12';
          sc_e005          postgres    false    253            b           0    0    COLUMN p_icrah.fdc05    COMMENT     8   COMMENT ON COLUMN sc_e005.p_icrah.fdc05 IS 'Campo C05';
          sc_e005          postgres    false    253            ?            1259    17509    p_icrch    TABLE     ?   CREATE TABLE sc_e005.p_icrch (
    fbc21 bigint NOT NULL,
    fdc24 date NOT NULL,
    fvc22 character varying(50) NOT NULL,
    fdc23 date NOT NULL,
    fbc11 bigint NOT NULL,
    fvc12 character varying(50) NOT NULL
);
    DROP TABLE sc_e005.p_icrch;
       sc_e005         heap    postgres    false    8            c           0    0    TABLE p_icrch    COMMENT     7   COMMENT ON TABLE sc_e005.p_icrch IS 'ICR Historico c';
          sc_e005          postgres    false    254            d           0    0    COLUMN p_icrch.fbc21    COMMENT     8   COMMENT ON COLUMN sc_e005.p_icrch.fbc21 IS 'Campo C21';
          sc_e005          postgres    false    254            e           0    0    COLUMN p_icrch.fdc24    COMMENT     8   COMMENT ON COLUMN sc_e005.p_icrch.fdc24 IS 'Campo C24';
          sc_e005          postgres    false    254            f           0    0    COLUMN p_icrch.fvc22    COMMENT     8   COMMENT ON COLUMN sc_e005.p_icrch.fvc22 IS 'Campo C22';
          sc_e005          postgres    false    254            g           0    0    COLUMN p_icrch.fdc23    COMMENT     8   COMMENT ON COLUMN sc_e005.p_icrch.fdc23 IS 'Campo C23';
          sc_e005          postgres    false    254            h           0    0    COLUMN p_icrch.fbc11    COMMENT     8   COMMENT ON COLUMN sc_e005.p_icrch.fbc11 IS 'Campo C11';
          sc_e005          postgres    false    254            i           0    0    COLUMN p_icrch.fvc12    COMMENT     8   COMMENT ON COLUMN sc_e005.p_icrch.fvc12 IS 'Campo C12';
          sc_e005          postgres    false    254            ?            1259    17512    p_icrdh    TABLE     ?   CREATE TABLE sc_e005.p_icrdh (
    fbc01 bigint NOT NULL,
    fbc21 bigint NOT NULL,
    fdc03d date NOT NULL,
    fdc41 date NOT NULL,
    fbc42 bigint NOT NULL,
    fbc11 bigint NOT NULL,
    fvc12 character varying(50) NOT NULL,
    fdc43 date
);
    DROP TABLE sc_e005.p_icrdh;
       sc_e005         heap    postgres    false    8            j           0    0    TABLE p_icrdh    COMMENT     7   COMMENT ON TABLE sc_e005.p_icrdh IS 'ICR Historico d';
          sc_e005          postgres    false    255            k           0    0    COLUMN p_icrdh.fbc01    COMMENT     8   COMMENT ON COLUMN sc_e005.p_icrdh.fbc01 IS 'Campo C01';
          sc_e005          postgres    false    255            l           0    0    COLUMN p_icrdh.fbc21    COMMENT     8   COMMENT ON COLUMN sc_e005.p_icrdh.fbc21 IS 'Campo C21';
          sc_e005          postgres    false    255            m           0    0    COLUMN p_icrdh.fdc03d    COMMENT     ?   COMMENT ON COLUMN sc_e005.p_icrdh.fdc03d IS 'Campo C03 Desde';
          sc_e005          postgres    false    255            n           0    0    COLUMN p_icrdh.fdc41    COMMENT     8   COMMENT ON COLUMN sc_e005.p_icrdh.fdc41 IS 'Campo C41';
          sc_e005          postgres    false    255            o           0    0    COLUMN p_icrdh.fbc42    COMMENT     8   COMMENT ON COLUMN sc_e005.p_icrdh.fbc42 IS 'Campo C42';
          sc_e005          postgres    false    255            p           0    0    COLUMN p_icrdh.fbc11    COMMENT     8   COMMENT ON COLUMN sc_e005.p_icrdh.fbc11 IS 'Campo C11';
          sc_e005          postgres    false    255            q           0    0    COLUMN p_icrdh.fvc12    COMMENT     8   COMMENT ON COLUMN sc_e005.p_icrdh.fvc12 IS 'Campo C12';
          sc_e005          postgres    false    255            r           0    0    COLUMN p_icrdh.fdc43    COMMENT     8   COMMENT ON COLUMN sc_e005.p_icrdh.fdc43 IS 'Campo C43';
          sc_e005          postgres    false    255            h          0    17320    p_icrad 
   TABLE DATA           N   COPY sc_e001.p_icrad (fbc01, fvc02, fdc03d, fdc04h, fbc11, fdc05) FROM stdin;
    sc_e001          postgres    false    219   ??      i          0    17360    p_icrbd 
   TABLE DATA           >   COPY sc_e001.p_icrbd (fbc11, fvc12, fdc13, fdc14) FROM stdin;
    sc_e001          postgres    false    220   ?      j          0    17364    p_icrcd 
   TABLE DATA           E   COPY sc_e001.p_icrcd (fbc21, fvc22, fdc23, fbc11, fdc24) FROM stdin;
    sc_e001          postgres    false    221   6?      k          0    17367    p_icrdd 
   TABLE DATA           L   COPY sc_e001.p_icrdd (fbc01, fbc21, fdc41, fbc42, fbc11, fdc43) FROM stdin;
    sc_e001          postgres    false    222   S?      l          0    17371    p_icrad 
   TABLE DATA           N   COPY sc_e002.p_icrad (fbc01, fvc02, fdc03d, fdc04h, fbc11, fdc05) FROM stdin;
    sc_e002          postgres    false    223   p?      m          0    17374    p_icrbd 
   TABLE DATA           >   COPY sc_e002.p_icrbd (fbc11, fvc12, fdc13, fdc14) FROM stdin;
    sc_e002          postgres    false    224   ??      n          0    17378    p_icrcd 
   TABLE DATA           E   COPY sc_e002.p_icrcd (fbc21, fvc22, fdc23, fbc11, fdc24) FROM stdin;
    sc_e002          postgres    false    225   ??      o          0    17381    p_icrdd 
   TABLE DATA           L   COPY sc_e002.p_icrdd (fbc01, fbc21, fdc41, fbc42, fbc11, fdc43) FROM stdin;
    sc_e002          postgres    false    226   ??      p          0    17385    p_logcmp 
   TABLE DATA           ?   COPY sc_e003.p_logcmp (finpid, ftuser, fafcin, fafccr, fbseqn, ftpgin, ftpgcr, flcncl, ftlogd, flpubl, ftapus, ftaprl, ftlfin) FROM stdin;
    sc_e003          postgres    false    227   ??      q          0    17397    p_logpub 
   TABLE DATA           K   COPY sc_e003.p_logpub (finpid, fberrn, fbseqn, fafccr, ftlogd) FROM stdin;
    sc_e003          postgres    false    228   ?      r          0    17403    p_anlsco 
   TABLE DATA           +   COPY sc_e004.p_anlsco (ftscnm) FROM stdin;
    sc_e004          postgres    false    229   ?      s          0    17408    p_appapp 
   TABLE DATA           5   COPY sc_e004.p_appapp (fvapnam, ftscprd) FROM stdin;
    sc_e004          postgres    false    230   N?      t          0    17413    p_appnvu 
   TABLE DATA           ,   COPY sc_e004.p_appnvu (finvlus) FROM stdin;
    sc_e004          postgres    false    231   ??      u          0    17416    p_appopt 
   TABLE DATA           Y   COPY sc_e004.p_appopt (fvotnam, ftotdsc, fvotrtn, fiotv01, fiotv02, fiotv03) FROM stdin;
    sc_e004          postgres    false    232   ??      v          0    17424    p_apptbl 
   TABLE DATA           ,   COPY sc_e004.p_apptbl (fvtbnam) FROM stdin;
    sc_e004          postgres    false    233   (?      w          0    17427    p_apptbo 
   TABLE DATA           ?   COPY sc_e004.p_apptbo (fvapnam, fvapals, fvtbnam, fvtbals, fvotnam, fvotals, finvlus, fiotv01, fiotv02, fiotv03, flrtchk, fbrtcnt) FROM stdin;
    sc_e004          postgres    false    234   Z?      x          0    17430    p_icrad 
   TABLE DATA           N   COPY sc_e004.p_icrad (fbc01, fvc02, fdc03d, fdc04h, fbc11, fdc05) FROM stdin;
    sc_e004          postgres    false    235   ??      y          0    17433    p_icrah 
   TABLE DATA           U   COPY sc_e004.p_icrah (fbc01, fdc03d, fvc02, fdc04h, fbc11, fvc12, fdc05) FROM stdin;
    sc_e004          postgres    false    236   ??      z          0    17436    p_icrbd 
   TABLE DATA           >   COPY sc_e004.p_icrbd (fbc11, fvc12, fdc13, fdc14) FROM stdin;
    sc_e004          postgres    false    237   ??      {          0    17440    p_icrcd 
   TABLE DATA           E   COPY sc_e004.p_icrcd (fbc21, fvc22, fdc23, fbc11, fdc24) FROM stdin;
    sc_e004          postgres    false    238   ?      |          0    17443    p_icrch 
   TABLE DATA           L   COPY sc_e004.p_icrch (fbc21, fdc24, fvc22, fdc23, fbc11, fvc12) FROM stdin;
    sc_e004          postgres    false    239   3?      }          0    17446    p_icrdd 
   TABLE DATA           L   COPY sc_e004.p_icrdd (fbc01, fbc21, fdc41, fbc42, fbc11, fdc43) FROM stdin;
    sc_e004          postgres    false    240   P?      ~          0    17450    p_icrdh 
   TABLE DATA           [   COPY sc_e004.p_icrdh (fbc01, fbc21, fdc03d, fdc41, fbc42, fbc11, fvc12, fdc43) FROM stdin;
    sc_e004          postgres    false    241   m?                0    17501    p_appapp_dat 
   TABLE DATA           9   COPY sc_e005.p_appapp_dat (fvapnam, ftscprd) FROM stdin;
    sc_e005          postgres    false    252   ??      ?          0    17506    p_icrah 
   TABLE DATA           U   COPY sc_e005.p_icrah (fbc01, fdc03d, fvc02, fdc04h, fbc11, fvc12, fdc05) FROM stdin;
    sc_e005          postgres    false    253   ??      ?          0    17509    p_icrch 
   TABLE DATA           L   COPY sc_e005.p_icrch (fbc21, fdc24, fvc22, fdc23, fbc11, fvc12) FROM stdin;
    sc_e005          postgres    false    254   ??      ?          0    17512    p_icrdh 
   TABLE DATA           [   COPY sc_e005.p_icrdh (fbc01, fbc21, fdc03d, fdc41, fbc42, fbc11, fvc12, fdc43) FROM stdin;
    sc_e005          postgres    false    255   ??      3           2606    17515    p_icrad p_icrad_ck_fdc03d    CHECK CONSTRAINT     ?   ALTER TABLE sc_e001.p_icrad
    ADD CONSTRAINT p_icrad_ck_fdc03d CHECK (((fdc03d IS NULL) OR (fdc03d > CURRENT_DATE))) NOT VALID;
 ?   ALTER TABLE sc_e001.p_icrad DROP CONSTRAINT p_icrad_ck_fdc03d;
       sc_e001          postgres    false    219    219            s           0    0 '   CONSTRAINT p_icrad_ck_fdc03d ON p_icrad    COMMENT     Q   COMMENT ON CONSTRAINT p_icrad_ck_fdc03d ON sc_e001.p_icrad IS 'CK p_icrad C03D';
          sc_e001          postgres    false    3379            4           2606    17516    p_icrad p_icrad_ck_fdc04h    CHECK CONSTRAINT     ?   ALTER TABLE sc_e001.p_icrad
    ADD CONSTRAINT p_icrad_ck_fdc04h CHECK (((fdc04h IS NULL) OR ((fdc04h > CURRENT_DATE) AND (fdc04h > fdc03d)))) NOT VALID;
 ?   ALTER TABLE sc_e001.p_icrad DROP CONSTRAINT p_icrad_ck_fdc04h;
       sc_e001          postgres    false    219    219    219    219            t           0    0 '   CONSTRAINT p_icrad_ck_fdc04h ON p_icrad    COMMENT     Q   COMMENT ON CONSTRAINT p_icrad_ck_fdc04h ON sc_e001.p_icrad IS 'CK p_icrad C04H';
          sc_e001          postgres    false    3380            5           2606    17517    p_icrad p_icrad_ck_fdc05    CHECK CONSTRAINT     ?   ALTER TABLE sc_e001.p_icrad
    ADD CONSTRAINT p_icrad_ck_fdc05 CHECK (((fdc05 IS NULL) OR ((fdc05 > CURRENT_DATE) AND (fdc05 > fdc04h)))) NOT VALID;
 >   ALTER TABLE sc_e001.p_icrad DROP CONSTRAINT p_icrad_ck_fdc05;
       sc_e001          postgres    false    219    219    219    219            u           0    0 &   CONSTRAINT p_icrad_ck_fdc05 ON p_icrad    COMMENT     O   COMMENT ON CONSTRAINT p_icrad_ck_fdc05 ON sc_e001.p_icrad IS 'CK p_icrad C05';
          sc_e001          postgres    false    3381            ]           2606    17519    p_icrad p_icrad_pk 
   CONSTRAINT     T   ALTER TABLE ONLY sc_e001.p_icrad
    ADD CONSTRAINT p_icrad_pk PRIMARY KEY (fbc01);
 =   ALTER TABLE ONLY sc_e001.p_icrad DROP CONSTRAINT p_icrad_pk;
       sc_e001            postgres    false    219            v           0    0     CONSTRAINT p_icrad_pk ON p_icrad    COMMENT     E   COMMENT ON CONSTRAINT p_icrad_pk ON sc_e001.p_icrad IS 'PK p_icrad';
          sc_e001          postgres    false    3421            7           2606    17520    p_icrbd p_icrbd_ck_fdc13    CHECK CONSTRAINT     k   ALTER TABLE sc_e001.p_icrbd
    ADD CONSTRAINT p_icrbd_ck_fdc13 CHECK ((fdc13 <> CURRENT_DATE)) NOT VALID;
 >   ALTER TABLE sc_e001.p_icrbd DROP CONSTRAINT p_icrbd_ck_fdc13;
       sc_e001          postgres    false    220    220            w           0    0 &   CONSTRAINT p_icrbd_ck_fdc13 ON p_icrbd    COMMENT     O   COMMENT ON CONSTRAINT p_icrbd_ck_fdc13 ON sc_e001.p_icrbd IS 'CK p_icrbd C13';
          sc_e001          postgres    false    3383            8           2606    17521    p_icrbd p_icrbd_ck_fdc14    CHECK CONSTRAINT     ?   ALTER TABLE sc_e001.p_icrbd
    ADD CONSTRAINT p_icrbd_ck_fdc14 CHECK (((fdc14 > fdc13) AND (fdc14 >= CURRENT_DATE))) NOT VALID;
 >   ALTER TABLE sc_e001.p_icrbd DROP CONSTRAINT p_icrbd_ck_fdc14;
       sc_e001          postgres    false    220    220    220    220            x           0    0 &   CONSTRAINT p_icrbd_ck_fdc14 ON p_icrbd    COMMENT     O   COMMENT ON CONSTRAINT p_icrbd_ck_fdc14 ON sc_e001.p_icrbd IS 'CK p_icrbd C14';
          sc_e001          postgres    false    3384            a           2606    17523    p_icrbd p_icrbd_pk 
   CONSTRAINT     T   ALTER TABLE ONLY sc_e001.p_icrbd
    ADD CONSTRAINT p_icrbd_pk PRIMARY KEY (fbc11);
 =   ALTER TABLE ONLY sc_e001.p_icrbd DROP CONSTRAINT p_icrbd_pk;
       sc_e001            postgres    false    220            y           0    0     CONSTRAINT p_icrbd_pk ON p_icrbd    COMMENT     E   COMMENT ON CONSTRAINT p_icrbd_pk ON sc_e001.p_icrbd IS 'PK p_icrbd';
          sc_e001          postgres    false    3425            9           2606    17524    p_icrcd p_icrcd_ck_fdc24    CHECK CONSTRAINT     ?   ALTER TABLE sc_e001.p_icrcd
    ADD CONSTRAINT p_icrcd_ck_fdc24 CHECK (((fdc24 > fdc23) AND (fdc24 >= CURRENT_DATE))) NOT VALID;
 >   ALTER TABLE sc_e001.p_icrcd DROP CONSTRAINT p_icrcd_ck_fdc24;
       sc_e001          postgres    false    221    221    221    221            z           0    0 &   CONSTRAINT p_icrcd_ck_fdc24 ON p_icrcd    COMMENT     O   COMMENT ON CONSTRAINT p_icrcd_ck_fdc24 ON sc_e001.p_icrcd IS 'CK p_icrcd C24';
          sc_e001          postgres    false    3385            g           2606    17526    p_icrcd p_icrcd_pk 
   CONSTRAINT     T   ALTER TABLE ONLY sc_e001.p_icrcd
    ADD CONSTRAINT p_icrcd_pk PRIMARY KEY (fbc21);
 =   ALTER TABLE ONLY sc_e001.p_icrcd DROP CONSTRAINT p_icrcd_pk;
       sc_e001            postgres    false    221            {           0    0     CONSTRAINT p_icrcd_pk ON p_icrcd    COMMENT     E   COMMENT ON CONSTRAINT p_icrcd_pk ON sc_e001.p_icrcd IS 'PK p_icrcd';
          sc_e001          postgres    false    3431            ;           2606    17527    p_icrdd p_icrdd_ck_fdc43    CHECK CONSTRAINT     ?   ALTER TABLE sc_e001.p_icrdd
    ADD CONSTRAINT p_icrdd_ck_fdc43 CHECK (((fdc43 > fdc41) AND (fdc43 >= CURRENT_DATE))) NOT VALID;
 >   ALTER TABLE sc_e001.p_icrdd DROP CONSTRAINT p_icrdd_ck_fdc43;
       sc_e001          postgres    false    222    222    222    222            |           0    0 &   CONSTRAINT p_icrdd_ck_fdc43 ON p_icrdd    COMMENT     O   COMMENT ON CONSTRAINT p_icrdd_ck_fdc43 ON sc_e001.p_icrdd IS 'CK p_icrdd C43';
          sc_e001          postgres    false    3387            m           2606    17529    p_icrdd p_icrdd_pk 
   CONSTRAINT     [   ALTER TABLE ONLY sc_e001.p_icrdd
    ADD CONSTRAINT p_icrdd_pk PRIMARY KEY (fbc01, fbc21);
 =   ALTER TABLE ONLY sc_e001.p_icrdd DROP CONSTRAINT p_icrdd_pk;
       sc_e001            postgres    false    222    222            }           0    0     CONSTRAINT p_icrdd_pk ON p_icrdd    COMMENT     E   COMMENT ON CONSTRAINT p_icrdd_pk ON sc_e001.p_icrdd IS 'PK p_icrdd';
          sc_e001          postgres    false    3437            <           2606    17530    p_icrad p_icrad_ck_fdc03d    CHECK CONSTRAINT     ?   ALTER TABLE sc_e002.p_icrad
    ADD CONSTRAINT p_icrad_ck_fdc03d CHECK (((fdc03d IS NULL) OR (fdc03d > CURRENT_DATE))) NOT VALID;
 ?   ALTER TABLE sc_e002.p_icrad DROP CONSTRAINT p_icrad_ck_fdc03d;
       sc_e002          postgres    false    223    223            ~           0    0 '   CONSTRAINT p_icrad_ck_fdc03d ON p_icrad    COMMENT     Q   COMMENT ON CONSTRAINT p_icrad_ck_fdc03d ON sc_e002.p_icrad IS 'CK p_icrad C03D';
          sc_e002          postgres    false    3388            =           2606    17531    p_icrad p_icrad_ck_fdc04h    CHECK CONSTRAINT     ?   ALTER TABLE sc_e002.p_icrad
    ADD CONSTRAINT p_icrad_ck_fdc04h CHECK (((fdc04h IS NULL) OR ((fdc04h > CURRENT_DATE) AND (fdc04h > fdc03d)))) NOT VALID;
 ?   ALTER TABLE sc_e002.p_icrad DROP CONSTRAINT p_icrad_ck_fdc04h;
       sc_e002          postgres    false    223    223    223    223                       0    0 '   CONSTRAINT p_icrad_ck_fdc04h ON p_icrad    COMMENT     Q   COMMENT ON CONSTRAINT p_icrad_ck_fdc04h ON sc_e002.p_icrad IS 'CK p_icrad C04H';
          sc_e002          postgres    false    3389            >           2606    17532    p_icrad p_icrad_ck_fdc05    CHECK CONSTRAINT     ?   ALTER TABLE sc_e002.p_icrad
    ADD CONSTRAINT p_icrad_ck_fdc05 CHECK (((fdc05 IS NULL) OR ((fdc05 > CURRENT_DATE) AND (fdc05 > fdc04h)))) NOT VALID;
 >   ALTER TABLE sc_e002.p_icrad DROP CONSTRAINT p_icrad_ck_fdc05;
       sc_e002          postgres    false    223    223    223    223            ?           0    0 &   CONSTRAINT p_icrad_ck_fdc05 ON p_icrad    COMMENT     O   COMMENT ON CONSTRAINT p_icrad_ck_fdc05 ON sc_e002.p_icrad IS 'CK p_icrad C05';
          sc_e002          postgres    false    3390            r           2606    17534    p_icrad p_icrad_pk 
   CONSTRAINT     T   ALTER TABLE ONLY sc_e002.p_icrad
    ADD CONSTRAINT p_icrad_pk PRIMARY KEY (fbc01);
 =   ALTER TABLE ONLY sc_e002.p_icrad DROP CONSTRAINT p_icrad_pk;
       sc_e002            postgres    false    223            ?           0    0     CONSTRAINT p_icrad_pk ON p_icrad    COMMENT     E   COMMENT ON CONSTRAINT p_icrad_pk ON sc_e002.p_icrad IS 'PK p_icrad';
          sc_e002          postgres    false    3442            @           2606    17535    p_icrbd p_icrbd_ck_fdc13    CHECK CONSTRAINT     k   ALTER TABLE sc_e002.p_icrbd
    ADD CONSTRAINT p_icrbd_ck_fdc13 CHECK ((fdc13 <> CURRENT_DATE)) NOT VALID;
 >   ALTER TABLE sc_e002.p_icrbd DROP CONSTRAINT p_icrbd_ck_fdc13;
       sc_e002          postgres    false    224    224            ?           0    0 &   CONSTRAINT p_icrbd_ck_fdc13 ON p_icrbd    COMMENT     O   COMMENT ON CONSTRAINT p_icrbd_ck_fdc13 ON sc_e002.p_icrbd IS 'CK p_icrbd C13';
          sc_e002          postgres    false    3392            A           2606    17536    p_icrbd p_icrbd_ck_fdc14    CHECK CONSTRAINT     ?   ALTER TABLE sc_e002.p_icrbd
    ADD CONSTRAINT p_icrbd_ck_fdc14 CHECK (((fdc14 > fdc13) AND (fdc14 >= CURRENT_DATE))) NOT VALID;
 >   ALTER TABLE sc_e002.p_icrbd DROP CONSTRAINT p_icrbd_ck_fdc14;
       sc_e002          postgres    false    224    224    224    224            ?           0    0 &   CONSTRAINT p_icrbd_ck_fdc14 ON p_icrbd    COMMENT     O   COMMENT ON CONSTRAINT p_icrbd_ck_fdc14 ON sc_e002.p_icrbd IS 'CK p_icrbd C14';
          sc_e002          postgres    false    3393            v           2606    17538    p_icrbd p_icrbd_pk 
   CONSTRAINT     T   ALTER TABLE ONLY sc_e002.p_icrbd
    ADD CONSTRAINT p_icrbd_pk PRIMARY KEY (fbc11);
 =   ALTER TABLE ONLY sc_e002.p_icrbd DROP CONSTRAINT p_icrbd_pk;
       sc_e002            postgres    false    224            ?           0    0     CONSTRAINT p_icrbd_pk ON p_icrbd    COMMENT     E   COMMENT ON CONSTRAINT p_icrbd_pk ON sc_e002.p_icrbd IS 'PK p_icrbd';
          sc_e002          postgres    false    3446            B           2606    17539    p_icrcd p_icrcd_ck_fdc24    CHECK CONSTRAINT     ?   ALTER TABLE sc_e002.p_icrcd
    ADD CONSTRAINT p_icrcd_ck_fdc24 CHECK (((fdc24 > fdc23) AND (fdc24 >= CURRENT_DATE))) NOT VALID;
 >   ALTER TABLE sc_e002.p_icrcd DROP CONSTRAINT p_icrcd_ck_fdc24;
       sc_e002          postgres    false    225    225    225    225            ?           0    0 &   CONSTRAINT p_icrcd_ck_fdc24 ON p_icrcd    COMMENT     O   COMMENT ON CONSTRAINT p_icrcd_ck_fdc24 ON sc_e002.p_icrcd IS 'CK p_icrcd C24';
          sc_e002          postgres    false    3394            |           2606    17541    p_icrcd p_icrcd_pk 
   CONSTRAINT     T   ALTER TABLE ONLY sc_e002.p_icrcd
    ADD CONSTRAINT p_icrcd_pk PRIMARY KEY (fbc21);
 =   ALTER TABLE ONLY sc_e002.p_icrcd DROP CONSTRAINT p_icrcd_pk;
       sc_e002            postgres    false    225            ?           0    0     CONSTRAINT p_icrcd_pk ON p_icrcd    COMMENT     E   COMMENT ON CONSTRAINT p_icrcd_pk ON sc_e002.p_icrcd IS 'PK p_icrcd';
          sc_e002          postgres    false    3452            D           2606    17542    p_icrdd p_icrdd_ck_fdc43    CHECK CONSTRAINT     ?   ALTER TABLE sc_e002.p_icrdd
    ADD CONSTRAINT p_icrdd_ck_fdc43 CHECK (((fdc43 > fdc41) AND (fdc43 >= CURRENT_DATE))) NOT VALID;
 >   ALTER TABLE sc_e002.p_icrdd DROP CONSTRAINT p_icrdd_ck_fdc43;
       sc_e002          postgres    false    226    226    226    226            ?           0    0 &   CONSTRAINT p_icrdd_ck_fdc43 ON p_icrdd    COMMENT     O   COMMENT ON CONSTRAINT p_icrdd_ck_fdc43 ON sc_e002.p_icrdd IS 'CK p_icrdd C43';
          sc_e002          postgres    false    3396            ?           2606    17544    p_icrdd p_icrdd_pk 
   CONSTRAINT     [   ALTER TABLE ONLY sc_e002.p_icrdd
    ADD CONSTRAINT p_icrdd_pk PRIMARY KEY (fbc01, fbc21);
 =   ALTER TABLE ONLY sc_e002.p_icrdd DROP CONSTRAINT p_icrdd_pk;
       sc_e002            postgres    false    226    226            ?           0    0     CONSTRAINT p_icrdd_pk ON p_icrdd    COMMENT     E   COMMENT ON CONSTRAINT p_icrdd_pk ON sc_e002.p_icrdd IS 'PK p_icrdd';
          sc_e002          postgres    false    3458            ?           2606    17546    p_appapp p_appapp_pk 
   CONSTRAINT     X   ALTER TABLE ONLY sc_e004.p_appapp
    ADD CONSTRAINT p_appapp_pk PRIMARY KEY (fvapnam);
 ?   ALTER TABLE ONLY sc_e004.p_appapp DROP CONSTRAINT p_appapp_pk;
       sc_e004            postgres    false    230            ?           0    0 "   CONSTRAINT p_appapp_pk ON p_appapp    COMMENT     H   COMMENT ON CONSTRAINT p_appapp_pk ON sc_e004.p_appapp IS 'PK p_appapp';
          sc_e004          postgres    false    3464            ?           2606    17548    p_appnvu p_appnvu_pk 
   CONSTRAINT     X   ALTER TABLE ONLY sc_e004.p_appnvu
    ADD CONSTRAINT p_appnvu_pk PRIMARY KEY (finvlus);
 ?   ALTER TABLE ONLY sc_e004.p_appnvu DROP CONSTRAINT p_appnvu_pk;
       sc_e004            postgres    false    231            ?           0    0 "   CONSTRAINT p_appnvu_pk ON p_appnvu    COMMENT     >   COMMENT ON CONSTRAINT p_appnvu_pk ON sc_e004.p_appnvu IS 'a';
          sc_e004          postgres    false    3467            ?           2606    17550    p_appopt p_appopt_pk 
   CONSTRAINT     X   ALTER TABLE ONLY sc_e004.p_appopt
    ADD CONSTRAINT p_appopt_pk PRIMARY KEY (fvotnam);
 ?   ALTER TABLE ONLY sc_e004.p_appopt DROP CONSTRAINT p_appopt_pk;
       sc_e004            postgres    false    232            ?           0    0 "   CONSTRAINT p_appopt_pk ON p_appopt    COMMENT     H   COMMENT ON CONSTRAINT p_appopt_pk ON sc_e004.p_appopt IS 'PK p_appopt';
          sc_e004          postgres    false    3470            ?           2606    17552    p_apptbl p_apptbl_pk 
   CONSTRAINT     X   ALTER TABLE ONLY sc_e004.p_apptbl
    ADD CONSTRAINT p_apptbl_pk PRIMARY KEY (fvtbnam);
 ?   ALTER TABLE ONLY sc_e004.p_apptbl DROP CONSTRAINT p_apptbl_pk;
       sc_e004            postgres    false    233            ?           0    0 "   CONSTRAINT p_apptbl_pk ON p_apptbl    COMMENT     H   COMMENT ON CONSTRAINT p_apptbl_pk ON sc_e004.p_apptbl IS 'PK p_apptbl';
          sc_e004          postgres    false    3473            ?           2606    17554    p_apptbo p_apptbo_pk 
   CONSTRAINT     s   ALTER TABLE ONLY sc_e004.p_apptbo
    ADD CONSTRAINT p_apptbo_pk PRIMARY KEY (fvapals, fvtbals, fvotals, finvlus);
 ?   ALTER TABLE ONLY sc_e004.p_apptbo DROP CONSTRAINT p_apptbo_pk;
       sc_e004            postgres    false    234    234    234    234            ?           0    0 "   CONSTRAINT p_apptbo_pk ON p_apptbo    COMMENT     H   COMMENT ON CONSTRAINT p_apptbo_pk ON sc_e004.p_apptbo IS 'PK p_apptbo';
          sc_e004          postgres    false    3480            P           2606    17555    p_icrad p_icrad_ck_fdc03d    CHECK CONSTRAINT     ?   ALTER TABLE sc_e004.p_icrad
    ADD CONSTRAINT p_icrad_ck_fdc03d CHECK (((fdc03d IS NULL) OR (fdc03d > CURRENT_DATE))) NOT VALID;
 ?   ALTER TABLE sc_e004.p_icrad DROP CONSTRAINT p_icrad_ck_fdc03d;
       sc_e004          postgres    false    235    235            ?           0    0 '   CONSTRAINT p_icrad_ck_fdc03d ON p_icrad    COMMENT     Q   COMMENT ON CONSTRAINT p_icrad_ck_fdc03d ON sc_e004.p_icrad IS 'CK p_icrad C03D';
          sc_e004          postgres    false    3408            Q           2606    17556    p_icrad p_icrad_ck_fdc04h    CHECK CONSTRAINT     ?   ALTER TABLE sc_e004.p_icrad
    ADD CONSTRAINT p_icrad_ck_fdc04h CHECK (((fdc04h IS NULL) OR ((fdc04h > CURRENT_DATE) AND (fdc04h > fdc03d)))) NOT VALID;
 ?   ALTER TABLE sc_e004.p_icrad DROP CONSTRAINT p_icrad_ck_fdc04h;
       sc_e004          postgres    false    235    235    235    235            ?           0    0 '   CONSTRAINT p_icrad_ck_fdc04h ON p_icrad    COMMENT     Q   COMMENT ON CONSTRAINT p_icrad_ck_fdc04h ON sc_e004.p_icrad IS 'CK p_icrad C04H';
          sc_e004          postgres    false    3409            R           2606    17557    p_icrad p_icrad_ck_fdc05    CHECK CONSTRAINT     ?   ALTER TABLE sc_e004.p_icrad
    ADD CONSTRAINT p_icrad_ck_fdc05 CHECK (((fdc05 IS NULL) OR ((fdc05 > CURRENT_DATE) AND (fdc05 > fdc04h)))) NOT VALID;
 >   ALTER TABLE sc_e004.p_icrad DROP CONSTRAINT p_icrad_ck_fdc05;
       sc_e004          postgres    false    235    235    235    235            ?           0    0 &   CONSTRAINT p_icrad_ck_fdc05 ON p_icrad    COMMENT     O   COMMENT ON CONSTRAINT p_icrad_ck_fdc05 ON sc_e004.p_icrad IS 'CK p_icrad C05';
          sc_e004          postgres    false    3410            ?           2606    17559    p_icrad p_icrad_pk 
   CONSTRAINT     T   ALTER TABLE ONLY sc_e004.p_icrad
    ADD CONSTRAINT p_icrad_pk PRIMARY KEY (fbc01);
 =   ALTER TABLE ONLY sc_e004.p_icrad DROP CONSTRAINT p_icrad_pk;
       sc_e004            postgres    false    235            ?           0    0     CONSTRAINT p_icrad_pk ON p_icrad    COMMENT     E   COMMENT ON CONSTRAINT p_icrad_pk ON sc_e004.p_icrad IS 'PK p_icrad';
          sc_e004          postgres    false    3485            ?           2606    17561    p_icrah p_icrah_pk 
   CONSTRAINT     \   ALTER TABLE ONLY sc_e004.p_icrah
    ADD CONSTRAINT p_icrah_pk PRIMARY KEY (fbc01, fdc03d);
 =   ALTER TABLE ONLY sc_e004.p_icrah DROP CONSTRAINT p_icrah_pk;
       sc_e004            postgres    false    236    236            ?           0    0     CONSTRAINT p_icrah_pk ON p_icrah    COMMENT     E   COMMENT ON CONSTRAINT p_icrah_pk ON sc_e004.p_icrah IS 'PK p_icrah';
          sc_e004          postgres    false    3488            T           2606    17562    p_icrbd p_icrbd_ck_fdc13    CHECK CONSTRAINT     k   ALTER TABLE sc_e004.p_icrbd
    ADD CONSTRAINT p_icrbd_ck_fdc13 CHECK ((fdc13 <> CURRENT_DATE)) NOT VALID;
 >   ALTER TABLE sc_e004.p_icrbd DROP CONSTRAINT p_icrbd_ck_fdc13;
       sc_e004          postgres    false    237    237            ?           0    0 &   CONSTRAINT p_icrbd_ck_fdc13 ON p_icrbd    COMMENT     O   COMMENT ON CONSTRAINT p_icrbd_ck_fdc13 ON sc_e004.p_icrbd IS 'CK p_icrbd C13';
          sc_e004          postgres    false    3412            U           2606    17563    p_icrbd p_icrbd_ck_fdc14    CHECK CONSTRAINT     ?   ALTER TABLE sc_e004.p_icrbd
    ADD CONSTRAINT p_icrbd_ck_fdc14 CHECK (((fdc14 > fdc13) AND (fdc14 >= CURRENT_DATE))) NOT VALID;
 >   ALTER TABLE sc_e004.p_icrbd DROP CONSTRAINT p_icrbd_ck_fdc14;
       sc_e004          postgres    false    237    237    237    237            ?           0    0 &   CONSTRAINT p_icrbd_ck_fdc14 ON p_icrbd    COMMENT     O   COMMENT ON CONSTRAINT p_icrbd_ck_fdc14 ON sc_e004.p_icrbd IS 'CK p_icrbd C14';
          sc_e004          postgres    false    3413            ?           2606    17565    p_icrbd p_icrbd_pk 
   CONSTRAINT     T   ALTER TABLE ONLY sc_e004.p_icrbd
    ADD CONSTRAINT p_icrbd_pk PRIMARY KEY (fbc11);
 =   ALTER TABLE ONLY sc_e004.p_icrbd DROP CONSTRAINT p_icrbd_pk;
       sc_e004            postgres    false    237            ?           0    0     CONSTRAINT p_icrbd_pk ON p_icrbd    COMMENT     E   COMMENT ON CONSTRAINT p_icrbd_pk ON sc_e004.p_icrbd IS 'PK p_icrbd';
          sc_e004          postgres    false    3492            V           2606    17566    p_icrcd p_icrcd_ck_fdc24    CHECK CONSTRAINT     ?   ALTER TABLE sc_e004.p_icrcd
    ADD CONSTRAINT p_icrcd_ck_fdc24 CHECK (((fdc24 > fdc23) AND (fdc24 >= CURRENT_DATE))) NOT VALID;
 >   ALTER TABLE sc_e004.p_icrcd DROP CONSTRAINT p_icrcd_ck_fdc24;
       sc_e004          postgres    false    238    238    238    238            ?           0    0 &   CONSTRAINT p_icrcd_ck_fdc24 ON p_icrcd    COMMENT     O   COMMENT ON CONSTRAINT p_icrcd_ck_fdc24 ON sc_e004.p_icrcd IS 'CK p_icrcd C24';
          sc_e004          postgres    false    3414            ?           2606    17568    p_icrcd p_icrcd_pk 
   CONSTRAINT     T   ALTER TABLE ONLY sc_e004.p_icrcd
    ADD CONSTRAINT p_icrcd_pk PRIMARY KEY (fbc21);
 =   ALTER TABLE ONLY sc_e004.p_icrcd DROP CONSTRAINT p_icrcd_pk;
       sc_e004            postgres    false    238            ?           0    0     CONSTRAINT p_icrcd_pk ON p_icrcd    COMMENT     E   COMMENT ON CONSTRAINT p_icrcd_pk ON sc_e004.p_icrcd IS 'PK p_icrcd';
          sc_e004          postgres    false    3498            ?           2606    17570    p_icrch p_icrch_pk 
   CONSTRAINT     [   ALTER TABLE ONLY sc_e004.p_icrch
    ADD CONSTRAINT p_icrch_pk PRIMARY KEY (fbc21, fdc24);
 =   ALTER TABLE ONLY sc_e004.p_icrch DROP CONSTRAINT p_icrch_pk;
       sc_e004            postgres    false    239    239            ?           0    0     CONSTRAINT p_icrch_pk ON p_icrch    COMMENT     E   COMMENT ON CONSTRAINT p_icrch_pk ON sc_e004.p_icrch IS 'PK p_icrch';
          sc_e004          postgres    false    3501            X           2606    17571    p_icrdd p_icrdd_ck_fdc43    CHECK CONSTRAINT     ?   ALTER TABLE sc_e004.p_icrdd
    ADD CONSTRAINT p_icrdd_ck_fdc43 CHECK (((fdc43 > fdc41) AND (fdc43 >= CURRENT_DATE))) NOT VALID;
 >   ALTER TABLE sc_e004.p_icrdd DROP CONSTRAINT p_icrdd_ck_fdc43;
       sc_e004          postgres    false    240    240    240    240            ?           0    0 &   CONSTRAINT p_icrdd_ck_fdc43 ON p_icrdd    COMMENT     O   COMMENT ON CONSTRAINT p_icrdd_ck_fdc43 ON sc_e004.p_icrdd IS 'CK p_icrdd C43';
          sc_e004          postgres    false    3416            ?           2606    17573    p_icrdd p_icrdd_pk 
   CONSTRAINT     [   ALTER TABLE ONLY sc_e004.p_icrdd
    ADD CONSTRAINT p_icrdd_pk PRIMARY KEY (fbc01, fbc21);
 =   ALTER TABLE ONLY sc_e004.p_icrdd DROP CONSTRAINT p_icrdd_pk;
       sc_e004            postgres    false    240    240            ?           0    0     CONSTRAINT p_icrdd_pk ON p_icrdd    COMMENT     E   COMMENT ON CONSTRAINT p_icrdd_pk ON sc_e004.p_icrdd IS 'PK p_icrdd';
          sc_e004          postgres    false    3507            ?           2606    17575    p_icrdh p_icrdh_pk 
   CONSTRAINT     c   ALTER TABLE ONLY sc_e004.p_icrdh
    ADD CONSTRAINT p_icrdh_pk PRIMARY KEY (fbc01, fbc21, fdc03d);
 =   ALTER TABLE ONLY sc_e004.p_icrdh DROP CONSTRAINT p_icrdh_pk;
       sc_e004            postgres    false    241    241    241            ?           0    0     CONSTRAINT p_icrdh_pk ON p_icrdh    COMMENT     E   COMMENT ON CONSTRAINT p_icrdh_pk ON sc_e004.p_icrdh IS 'PK p_icrdh';
          sc_e004          postgres    false    3510            ?           2606    17577    p_icrah p_icrah_pk 
   CONSTRAINT     \   ALTER TABLE ONLY sc_e005.p_icrah
    ADD CONSTRAINT p_icrah_pk PRIMARY KEY (fbc01, fdc03d);
 =   ALTER TABLE ONLY sc_e005.p_icrah DROP CONSTRAINT p_icrah_pk;
       sc_e005            postgres    false    253    253            ?           0    0     CONSTRAINT p_icrah_pk ON p_icrah    COMMENT     E   COMMENT ON CONSTRAINT p_icrah_pk ON sc_e005.p_icrah IS 'PK p_icrah';
          sc_e005          postgres    false    3513            ?           2606    17579    p_icrch p_icrch_pk 
   CONSTRAINT     [   ALTER TABLE ONLY sc_e005.p_icrch
    ADD CONSTRAINT p_icrch_pk PRIMARY KEY (fbc21, fdc24);
 =   ALTER TABLE ONLY sc_e005.p_icrch DROP CONSTRAINT p_icrch_pk;
       sc_e005            postgres    false    254    254            ?           0    0     CONSTRAINT p_icrch_pk ON p_icrch    COMMENT     E   COMMENT ON CONSTRAINT p_icrch_pk ON sc_e005.p_icrch IS 'PK p_icrch';
          sc_e005          postgres    false    3516            ?           2606    17581    p_icrdh p_icrdh_pk 
   CONSTRAINT     c   ALTER TABLE ONLY sc_e005.p_icrdh
    ADD CONSTRAINT p_icrdh_pk PRIMARY KEY (fbc01, fbc21, fdc03d);
 =   ALTER TABLE ONLY sc_e005.p_icrdh DROP CONSTRAINT p_icrdh_pk;
       sc_e005            postgres    false    255    255    255            ?           0    0     CONSTRAINT p_icrdh_pk ON p_icrdh    COMMENT     E   COMMENT ON CONSTRAINT p_icrdh_pk ON sc_e005.p_icrdh IS 'PK p_icrdh';
          sc_e005          postgres    false    3519            Y           1259    17582    p_icrad_in_fk_p_icrbd_fbc11    INDEX     Q   CREATE INDEX p_icrad_in_fk_p_icrbd_fbc11 ON sc_e001.p_icrad USING btree (fbc11);
 0   DROP INDEX sc_e001.p_icrad_in_fk_p_icrbd_fbc11;
       sc_e001            postgres    false    219            ?           0    0 !   INDEX p_icrad_in_fk_p_icrbd_fbc11    COMMENT     R   COMMENT ON INDEX sc_e001.p_icrad_in_fk_p_icrbd_fbc11 IS 'FK p_icrad p_icrbd C11';
          sc_e001          postgres    false    3417            Z           1259    17583    p_icrad_iu_fvc02    INDEX     M   CREATE UNIQUE INDEX p_icrad_iu_fvc02 ON sc_e001.p_icrad USING btree (fvc02);
 %   DROP INDEX sc_e001.p_icrad_iu_fvc02;
       sc_e001            postgres    false    219            ?           0    0    INDEX p_icrad_iu_fvc02    COMMENT     ?   COMMENT ON INDEX sc_e001.p_icrad_iu_fvc02 IS 'IU p_icrad C02';
          sc_e001          postgres    false    3418            [           1259    17584    p_icrad_iu_pk    INDEX     J   CREATE UNIQUE INDEX p_icrad_iu_pk ON sc_e001.p_icrad USING btree (fbc01);
 "   DROP INDEX sc_e001.p_icrad_iu_pk;
       sc_e001            postgres    false    219            ?           0    0    INDEX p_icrad_iu_pk    COMMENT     8   COMMENT ON INDEX sc_e001.p_icrad_iu_pk IS 'PK p_icrad';
          sc_e001          postgres    false    3419            b           1259    17585    p_icrbd_in_fk_p_icrcd_fbc11    INDEX     Q   CREATE INDEX p_icrbd_in_fk_p_icrcd_fbc11 ON sc_e001.p_icrcd USING btree (fbc11);
 0   DROP INDEX sc_e001.p_icrbd_in_fk_p_icrcd_fbc11;
       sc_e001            postgres    false    221            ?           0    0 !   INDEX p_icrbd_in_fk_p_icrcd_fbc11    COMMENT     R   COMMENT ON INDEX sc_e001.p_icrbd_in_fk_p_icrcd_fbc11 IS 'FK p_icrbd p_icrcd C11';
          sc_e001          postgres    false    3426            ^           1259    17586    p_icrbd_iu_fvc12    INDEX     M   CREATE UNIQUE INDEX p_icrbd_iu_fvc12 ON sc_e001.p_icrbd USING btree (fvc12);
 %   DROP INDEX sc_e001.p_icrbd_iu_fvc12;
       sc_e001            postgres    false    220            ?           0    0    INDEX p_icrbd_iu_fvc12    COMMENT     ?   COMMENT ON INDEX sc_e001.p_icrbd_iu_fvc12 IS 'IU p_icrbd C12';
          sc_e001          postgres    false    3422            _           1259    17587    p_icrbd_iu_pk    INDEX     J   CREATE UNIQUE INDEX p_icrbd_iu_pk ON sc_e001.p_icrbd USING btree (fbc11);
 "   DROP INDEX sc_e001.p_icrbd_iu_pk;
       sc_e001            postgres    false    220            ?           0    0    INDEX p_icrbd_iu_pk    COMMENT     8   COMMENT ON INDEX sc_e001.p_icrbd_iu_pk IS 'PK p_icrbd';
          sc_e001          postgres    false    3423            c           1259    17588    p_icrcd_in_fk_p_icrbd_fbc11    INDEX     Q   CREATE INDEX p_icrcd_in_fk_p_icrbd_fbc11 ON sc_e001.p_icrcd USING btree (fbc11);
 0   DROP INDEX sc_e001.p_icrcd_in_fk_p_icrbd_fbc11;
       sc_e001            postgres    false    221            ?           0    0 !   INDEX p_icrcd_in_fk_p_icrbd_fbc11    COMMENT     R   COMMENT ON INDEX sc_e001.p_icrcd_in_fk_p_icrbd_fbc11 IS 'FK p_icrcd p_icrbd C11';
          sc_e001          postgres    false    3427            d           1259    17589    p_icrcd_iu_fvc22    INDEX     M   CREATE UNIQUE INDEX p_icrcd_iu_fvc22 ON sc_e001.p_icrcd USING btree (fvc22);
 %   DROP INDEX sc_e001.p_icrcd_iu_fvc22;
       sc_e001            postgres    false    221            ?           0    0    INDEX p_icrcd_iu_fvc22    COMMENT     ?   COMMENT ON INDEX sc_e001.p_icrcd_iu_fvc22 IS 'IU p_icrcd C22';
          sc_e001          postgres    false    3428            e           1259    17590    p_icrcd_iu_pk    INDEX     J   CREATE UNIQUE INDEX p_icrcd_iu_pk ON sc_e001.p_icrcd USING btree (fbc21);
 "   DROP INDEX sc_e001.p_icrcd_iu_pk;
       sc_e001            postgres    false    221            ?           0    0    INDEX p_icrcd_iu_pk    COMMENT     8   COMMENT ON INDEX sc_e001.p_icrcd_iu_pk IS 'PK p_icrcd';
          sc_e001          postgres    false    3429            h           1259    17591    p_icrdd_in_fk_p_icrad_fbc01    INDEX     Q   CREATE INDEX p_icrdd_in_fk_p_icrad_fbc01 ON sc_e001.p_icrdd USING btree (fbc01);
 0   DROP INDEX sc_e001.p_icrdd_in_fk_p_icrad_fbc01;
       sc_e001            postgres    false    222            ?           0    0 !   INDEX p_icrdd_in_fk_p_icrad_fbc01    COMMENT     R   COMMENT ON INDEX sc_e001.p_icrdd_in_fk_p_icrad_fbc01 IS 'FK p_icrcd p_icrad C01';
          sc_e001          postgres    false    3432            i           1259    17592    p_icrdd_in_fk_p_icrbd_fbc11    INDEX     Q   CREATE INDEX p_icrdd_in_fk_p_icrbd_fbc11 ON sc_e001.p_icrdd USING btree (fbc11);
 0   DROP INDEX sc_e001.p_icrdd_in_fk_p_icrbd_fbc11;
       sc_e001            postgres    false    222            ?           0    0 !   INDEX p_icrdd_in_fk_p_icrbd_fbc11    COMMENT     R   COMMENT ON INDEX sc_e001.p_icrdd_in_fk_p_icrbd_fbc11 IS 'FK p_icrcd p_icrbd C11';
          sc_e001          postgres    false    3433            j           1259    17593    p_icrdd_in_fk_p_icrcd_fbc21    INDEX     Q   CREATE INDEX p_icrdd_in_fk_p_icrcd_fbc21 ON sc_e001.p_icrdd USING btree (fbc21);
 0   DROP INDEX sc_e001.p_icrdd_in_fk_p_icrcd_fbc21;
       sc_e001            postgres    false    222            ?           0    0 !   INDEX p_icrdd_in_fk_p_icrcd_fbc21    COMMENT     R   COMMENT ON INDEX sc_e001.p_icrdd_in_fk_p_icrcd_fbc21 IS 'FK p_icrcd p_icrcd C21';
          sc_e001          postgres    false    3434            k           1259    17594    p_icrdd_iu_pk    INDEX     Q   CREATE UNIQUE INDEX p_icrdd_iu_pk ON sc_e001.p_icrdd USING btree (fbc01, fbc21);
 "   DROP INDEX sc_e001.p_icrdd_iu_pk;
       sc_e001            postgres    false    222    222            ?           0    0    INDEX p_icrdd_iu_pk    COMMENT     8   COMMENT ON INDEX sc_e001.p_icrdd_iu_pk IS 'PK p_icrdd';
          sc_e001          postgres    false    3435            n           1259    17595    p_icrad_in_fk_p_icrbd_fbc11    INDEX     Q   CREATE INDEX p_icrad_in_fk_p_icrbd_fbc11 ON sc_e002.p_icrad USING btree (fbc11);
 0   DROP INDEX sc_e002.p_icrad_in_fk_p_icrbd_fbc11;
       sc_e002            postgres    false    223            ?           0    0 !   INDEX p_icrad_in_fk_p_icrbd_fbc11    COMMENT     R   COMMENT ON INDEX sc_e002.p_icrad_in_fk_p_icrbd_fbc11 IS 'FK p_icrad p_icrbd C11';
          sc_e002          postgres    false    3438            o           1259    17596    p_icrad_iu_fvc02    INDEX     M   CREATE UNIQUE INDEX p_icrad_iu_fvc02 ON sc_e002.p_icrad USING btree (fvc02);
 %   DROP INDEX sc_e002.p_icrad_iu_fvc02;
       sc_e002            postgres    false    223            ?           0    0    INDEX p_icrad_iu_fvc02    COMMENT     ?   COMMENT ON INDEX sc_e002.p_icrad_iu_fvc02 IS 'IU p_icrad C02';
          sc_e002          postgres    false    3439            p           1259    17597    p_icrad_iu_pk    INDEX     J   CREATE UNIQUE INDEX p_icrad_iu_pk ON sc_e002.p_icrad USING btree (fbc01);
 "   DROP INDEX sc_e002.p_icrad_iu_pk;
       sc_e002            postgres    false    223            ?           0    0    INDEX p_icrad_iu_pk    COMMENT     8   COMMENT ON INDEX sc_e002.p_icrad_iu_pk IS 'PK p_icrad';
          sc_e002          postgres    false    3440            w           1259    17598    p_icrbd_in_fk_p_icrcd_fbc11    INDEX     Q   CREATE INDEX p_icrbd_in_fk_p_icrcd_fbc11 ON sc_e002.p_icrcd USING btree (fbc11);
 0   DROP INDEX sc_e002.p_icrbd_in_fk_p_icrcd_fbc11;
       sc_e002            postgres    false    225            ?           0    0 !   INDEX p_icrbd_in_fk_p_icrcd_fbc11    COMMENT     R   COMMENT ON INDEX sc_e002.p_icrbd_in_fk_p_icrcd_fbc11 IS 'FK p_icrbd p_icrcd C11';
          sc_e002          postgres    false    3447            s           1259    17599    p_icrbd_iu_fvc12    INDEX     M   CREATE UNIQUE INDEX p_icrbd_iu_fvc12 ON sc_e002.p_icrbd USING btree (fvc12);
 %   DROP INDEX sc_e002.p_icrbd_iu_fvc12;
       sc_e002            postgres    false    224            ?           0    0    INDEX p_icrbd_iu_fvc12    COMMENT     ?   COMMENT ON INDEX sc_e002.p_icrbd_iu_fvc12 IS 'IU p_icrbd C12';
          sc_e002          postgres    false    3443            t           1259    17600    p_icrbd_iu_pk    INDEX     J   CREATE UNIQUE INDEX p_icrbd_iu_pk ON sc_e002.p_icrbd USING btree (fbc11);
 "   DROP INDEX sc_e002.p_icrbd_iu_pk;
       sc_e002            postgres    false    224            ?           0    0    INDEX p_icrbd_iu_pk    COMMENT     8   COMMENT ON INDEX sc_e002.p_icrbd_iu_pk IS 'PK p_icrbd';
          sc_e002          postgres    false    3444            x           1259    17601    p_icrcd_in_fk_p_icrbd_fbc11    INDEX     Q   CREATE INDEX p_icrcd_in_fk_p_icrbd_fbc11 ON sc_e002.p_icrcd USING btree (fbc11);
 0   DROP INDEX sc_e002.p_icrcd_in_fk_p_icrbd_fbc11;
       sc_e002            postgres    false    225            ?           0    0 !   INDEX p_icrcd_in_fk_p_icrbd_fbc11    COMMENT     R   COMMENT ON INDEX sc_e002.p_icrcd_in_fk_p_icrbd_fbc11 IS 'FK p_icrcd p_icrbd C11';
          sc_e002          postgres    false    3448            y           1259    17602    p_icrcd_iu_fvc22    INDEX     M   CREATE UNIQUE INDEX p_icrcd_iu_fvc22 ON sc_e002.p_icrcd USING btree (fvc22);
 %   DROP INDEX sc_e002.p_icrcd_iu_fvc22;
       sc_e002            postgres    false    225            ?           0    0    INDEX p_icrcd_iu_fvc22    COMMENT     ?   COMMENT ON INDEX sc_e002.p_icrcd_iu_fvc22 IS 'IU p_icrcd C22';
          sc_e002          postgres    false    3449            z           1259    17603    p_icrcd_iu_pk    INDEX     J   CREATE UNIQUE INDEX p_icrcd_iu_pk ON sc_e002.p_icrcd USING btree (fbc21);
 "   DROP INDEX sc_e002.p_icrcd_iu_pk;
       sc_e002            postgres    false    225            ?           0    0    INDEX p_icrcd_iu_pk    COMMENT     8   COMMENT ON INDEX sc_e002.p_icrcd_iu_pk IS 'PK p_icrcd';
          sc_e002          postgres    false    3450            }           1259    17604    p_icrdd_in_fk_p_icrad_fbc01    INDEX     Q   CREATE INDEX p_icrdd_in_fk_p_icrad_fbc01 ON sc_e002.p_icrdd USING btree (fbc01);
 0   DROP INDEX sc_e002.p_icrdd_in_fk_p_icrad_fbc01;
       sc_e002            postgres    false    226            ?           0    0 !   INDEX p_icrdd_in_fk_p_icrad_fbc01    COMMENT     R   COMMENT ON INDEX sc_e002.p_icrdd_in_fk_p_icrad_fbc01 IS 'FK p_icrcd p_icrad C01';
          sc_e002          postgres    false    3453            ~           1259    17605    p_icrdd_in_fk_p_icrbd_fbc11    INDEX     Q   CREATE INDEX p_icrdd_in_fk_p_icrbd_fbc11 ON sc_e002.p_icrdd USING btree (fbc11);
 0   DROP INDEX sc_e002.p_icrdd_in_fk_p_icrbd_fbc11;
       sc_e002            postgres    false    226            ?           0    0 !   INDEX p_icrdd_in_fk_p_icrbd_fbc11    COMMENT     R   COMMENT ON INDEX sc_e002.p_icrdd_in_fk_p_icrbd_fbc11 IS 'FK p_icrcd p_icrbd C11';
          sc_e002          postgres    false    3454                       1259    17606    p_icrdd_in_fk_p_icrcd_fbc21    INDEX     Q   CREATE INDEX p_icrdd_in_fk_p_icrcd_fbc21 ON sc_e002.p_icrdd USING btree (fbc21);
 0   DROP INDEX sc_e002.p_icrdd_in_fk_p_icrcd_fbc21;
       sc_e002            postgres    false    226            ?           0    0 !   INDEX p_icrdd_in_fk_p_icrcd_fbc21    COMMENT     R   COMMENT ON INDEX sc_e002.p_icrdd_in_fk_p_icrcd_fbc21 IS 'FK p_icrcd p_icrcd C21';
          sc_e002          postgres    false    3455            ?           1259    17607    p_icrdd_iu_pk    INDEX     Q   CREATE UNIQUE INDEX p_icrdd_iu_pk ON sc_e002.p_icrdd USING btree (fbc01, fbc21);
 "   DROP INDEX sc_e002.p_icrdd_iu_pk;
       sc_e002            postgres    false    226    226            ?           0    0    INDEX p_icrdd_iu_pk    COMMENT     8   COMMENT ON INDEX sc_e002.p_icrdd_iu_pk IS 'PK p_icrdd';
          sc_e002          postgres    false    3456            ?           1259    17608    p_logcmp_iu_pk    INDEX     m   CREATE UNIQUE INDEX p_logcmp_iu_pk ON sc_e003.p_logcmp USING btree (finpid, ftuser, fafcin, fafccr, fbseqn);
 #   DROP INDEX sc_e003.p_logcmp_iu_pk;
       sc_e003            postgres    false    227    227    227    227    227            ?           0    0    INDEX p_logcmp_iu_pk    COMMENT     :   COMMENT ON INDEX sc_e003.p_logcmp_iu_pk IS 'PK p_logcmp';
          sc_e003          postgres    false    3459            ?           1259    17609    p_logpub_iu_pk    INDEX     ]   CREATE UNIQUE INDEX p_logpub_iu_pk ON sc_e003.p_logpub USING btree (finpid, fberrn, fbseqn);
 #   DROP INDEX sc_e003.p_logpub_iu_pk;
       sc_e003            postgres    false    228    228    228            ?           0    0    INDEX p_logpub_iu_pk    COMMENT     :   COMMENT ON INDEX sc_e003.p_logpub_iu_pk IS 'PK p_logpub';
          sc_e003          postgres    false    3460            ?           1259    17610    p_anlsco_iu_pk    INDEX     M   CREATE UNIQUE INDEX p_anlsco_iu_pk ON sc_e004.p_anlsco USING btree (ftscnm);
 #   DROP INDEX sc_e004.p_anlsco_iu_pk;
       sc_e004            postgres    false    229            ?           0    0    INDEX p_anlsco_iu_pk    COMMENT     :   COMMENT ON INDEX sc_e004.p_anlsco_iu_pk IS 'PK p_anlsco';
          sc_e004          postgres    false    3461            ?           1259    17611    p_appapp_iu_pk    INDEX     N   CREATE UNIQUE INDEX p_appapp_iu_pk ON sc_e004.p_appapp USING btree (fvapnam);
 #   DROP INDEX sc_e004.p_appapp_iu_pk;
       sc_e004            postgres    false    230            ?           0    0    INDEX p_appapp_iu_pk    COMMENT     :   COMMENT ON INDEX sc_e004.p_appapp_iu_pk IS 'p_appapp PK';
          sc_e004          postgres    false    3462            ?           1259    17612    p_appnvu_iu_pk    INDEX     N   CREATE UNIQUE INDEX p_appnvu_iu_pk ON sc_e004.p_appnvu USING btree (finvlus);
 #   DROP INDEX sc_e004.p_appnvu_iu_pk;
       sc_e004            postgres    false    231            ?           0    0    INDEX p_appnvu_iu_pk    COMMENT     0   COMMENT ON INDEX sc_e004.p_appnvu_iu_pk IS 'a';
          sc_e004          postgres    false    3465            ?           1259    17613    p_appopt_iu_pk    INDEX     N   CREATE UNIQUE INDEX p_appopt_iu_pk ON sc_e004.p_appopt USING btree (fvotnam);
 #   DROP INDEX sc_e004.p_appopt_iu_pk;
       sc_e004            postgres    false    232            ?           0    0    INDEX p_appopt_iu_pk    COMMENT     :   COMMENT ON INDEX sc_e004.p_appopt_iu_pk IS 'p_appopt PK';
          sc_e004          postgres    false    3468            ?           1259    17614    p_apptbl_iu_pk    INDEX     N   CREATE UNIQUE INDEX p_apptbl_iu_pk ON sc_e004.p_apptbl USING btree (fvtbnam);
 #   DROP INDEX sc_e004.p_apptbl_iu_pk;
       sc_e004            postgres    false    233            ?           0    0    INDEX p_apptbl_iu_pk    COMMENT     :   COMMENT ON INDEX sc_e004.p_apptbl_iu_pk IS 'p_apptbl PK';
          sc_e004          postgres    false    3471            ?           1259    17615    p_apptbo_in_finvlus    INDEX     L   CREATE INDEX p_apptbo_in_finvlus ON sc_e004.p_apptbo USING btree (finvlus);
 (   DROP INDEX sc_e004.p_apptbo_in_finvlus;
       sc_e004            postgres    false    234            ?           0    0    INDEX p_apptbo_in_finvlus    COMMENT     G   COMMENT ON INDEX sc_e004.p_apptbo_in_finvlus IS 'p_apptbo in finvlus';
          sc_e004          postgres    false    3474            ?           1259    17616    p_apptbo_in_fvapnam    INDEX     L   CREATE INDEX p_apptbo_in_fvapnam ON sc_e004.p_apptbo USING btree (fvapnam);
 (   DROP INDEX sc_e004.p_apptbo_in_fvapnam;
       sc_e004            postgres    false    234            ?           0    0    INDEX p_apptbo_in_fvapnam    COMMENT     G   COMMENT ON INDEX sc_e004.p_apptbo_in_fvapnam IS 'p_apptbo in fvapnam';
          sc_e004          postgres    false    3475            ?           1259    17617    p_apptbo_in_fvotnam    INDEX     L   CREATE INDEX p_apptbo_in_fvotnam ON sc_e004.p_apptbo USING btree (fvotnam);
 (   DROP INDEX sc_e004.p_apptbo_in_fvotnam;
       sc_e004            postgres    false    234            ?           0    0    INDEX p_apptbo_in_fvotnam    COMMENT     G   COMMENT ON INDEX sc_e004.p_apptbo_in_fvotnam IS 'p_apptbo in fvotnam';
          sc_e004          postgres    false    3476            ?           1259    17618    p_apptbo_in_fvtbnam    INDEX     L   CREATE INDEX p_apptbo_in_fvtbnam ON sc_e004.p_apptbo USING btree (fvtbnam);
 (   DROP INDEX sc_e004.p_apptbo_in_fvtbnam;
       sc_e004            postgres    false    234            ?           0    0    INDEX p_apptbo_in_fvtbnam    COMMENT     G   COMMENT ON INDEX sc_e004.p_apptbo_in_fvtbnam IS 'p_apptbo in fvtbnam';
          sc_e004          postgres    false    3477            ?           1259    17619    p_apptbo_iu_pk    INDEX     i   CREATE UNIQUE INDEX p_apptbo_iu_pk ON sc_e004.p_apptbo USING btree (fvapals, fvtbals, fvotals, finvlus);
 #   DROP INDEX sc_e004.p_apptbo_iu_pk;
       sc_e004            postgres    false    234    234    234    234            ?           0    0    INDEX p_apptbo_iu_pk    COMMENT     :   COMMENT ON INDEX sc_e004.p_apptbo_iu_pk IS 'p_apptbo PK';
          sc_e004          postgres    false    3478            ?           1259    17620    p_icrad_in_fk_p_icrbd_fbc11    INDEX     Q   CREATE INDEX p_icrad_in_fk_p_icrbd_fbc11 ON sc_e004.p_icrad USING btree (fbc11);
 0   DROP INDEX sc_e004.p_icrad_in_fk_p_icrbd_fbc11;
       sc_e004            postgres    false    235            ?           0    0 !   INDEX p_icrad_in_fk_p_icrbd_fbc11    COMMENT     R   COMMENT ON INDEX sc_e004.p_icrad_in_fk_p_icrbd_fbc11 IS 'FK p_icrad p_icrbd C11';
          sc_e004          postgres    false    3481            ?           1259    17621    p_icrad_iu_fvc02    INDEX     M   CREATE UNIQUE INDEX p_icrad_iu_fvc02 ON sc_e004.p_icrad USING btree (fvc02);
 %   DROP INDEX sc_e004.p_icrad_iu_fvc02;
       sc_e004            postgres    false    235            ?           0    0    INDEX p_icrad_iu_fvc02    COMMENT     ?   COMMENT ON INDEX sc_e004.p_icrad_iu_fvc02 IS 'IU p_icrad C02';
          sc_e004          postgres    false    3482            ?           1259    17622    p_icrad_iu_pk    INDEX     J   CREATE UNIQUE INDEX p_icrad_iu_pk ON sc_e004.p_icrad USING btree (fbc01);
 "   DROP INDEX sc_e004.p_icrad_iu_pk;
       sc_e004            postgres    false    235            ?           0    0    INDEX p_icrad_iu_pk    COMMENT     8   COMMENT ON INDEX sc_e004.p_icrad_iu_pk IS 'PK p_icrad';
          sc_e004          postgres    false    3483            ?           1259    17623    p_icrah_iu_pk    INDEX     R   CREATE UNIQUE INDEX p_icrah_iu_pk ON sc_e004.p_icrah USING btree (fbc01, fdc03d);
 "   DROP INDEX sc_e004.p_icrah_iu_pk;
       sc_e004            postgres    false    236    236            ?           0    0    INDEX p_icrah_iu_pk    COMMENT     8   COMMENT ON INDEX sc_e004.p_icrah_iu_pk IS 'PK p_icrah';
          sc_e004          postgres    false    3486            ?           1259    17624    p_icrbd_in_fk_p_icrcd_fbc11    INDEX     Q   CREATE INDEX p_icrbd_in_fk_p_icrcd_fbc11 ON sc_e004.p_icrcd USING btree (fbc11);
 0   DROP INDEX sc_e004.p_icrbd_in_fk_p_icrcd_fbc11;
       sc_e004            postgres    false    238            ?           0    0 !   INDEX p_icrbd_in_fk_p_icrcd_fbc11    COMMENT     R   COMMENT ON INDEX sc_e004.p_icrbd_in_fk_p_icrcd_fbc11 IS 'FK p_icrbd p_icrcd C11';
          sc_e004          postgres    false    3493            ?           1259    17625    p_icrbd_iu_fvc12    INDEX     M   CREATE UNIQUE INDEX p_icrbd_iu_fvc12 ON sc_e004.p_icrbd USING btree (fvc12);
 %   DROP INDEX sc_e004.p_icrbd_iu_fvc12;
       sc_e004            postgres    false    237            ?           0    0    INDEX p_icrbd_iu_fvc12    COMMENT     ?   COMMENT ON INDEX sc_e004.p_icrbd_iu_fvc12 IS 'IU p_icrbd C12';
          sc_e004          postgres    false    3489            ?           1259    17626    p_icrbd_iu_pk    INDEX     J   CREATE UNIQUE INDEX p_icrbd_iu_pk ON sc_e004.p_icrbd USING btree (fbc11);
 "   DROP INDEX sc_e004.p_icrbd_iu_pk;
       sc_e004            postgres    false    237            ?           0    0    INDEX p_icrbd_iu_pk    COMMENT     8   COMMENT ON INDEX sc_e004.p_icrbd_iu_pk IS 'PK p_icrbd';
          sc_e004          postgres    false    3490            ?           1259    17627    p_icrcd_in_fk_p_icrbd_fbc11    INDEX     Q   CREATE INDEX p_icrcd_in_fk_p_icrbd_fbc11 ON sc_e004.p_icrcd USING btree (fbc11);
 0   DROP INDEX sc_e004.p_icrcd_in_fk_p_icrbd_fbc11;
       sc_e004            postgres    false    238            ?           0    0 !   INDEX p_icrcd_in_fk_p_icrbd_fbc11    COMMENT     R   COMMENT ON INDEX sc_e004.p_icrcd_in_fk_p_icrbd_fbc11 IS 'FK p_icrcd p_icrbd C11';
          sc_e004          postgres    false    3494            ?           1259    17628    p_icrcd_iu_fvc22    INDEX     M   CREATE UNIQUE INDEX p_icrcd_iu_fvc22 ON sc_e004.p_icrcd USING btree (fvc22);
 %   DROP INDEX sc_e004.p_icrcd_iu_fvc22;
       sc_e004            postgres    false    238            ?           0    0    INDEX p_icrcd_iu_fvc22    COMMENT     ?   COMMENT ON INDEX sc_e004.p_icrcd_iu_fvc22 IS 'IU p_icrcd C22';
          sc_e004          postgres    false    3495            ?           1259    17629    p_icrcd_iu_pk    INDEX     J   CREATE UNIQUE INDEX p_icrcd_iu_pk ON sc_e004.p_icrcd USING btree (fbc21);
 "   DROP INDEX sc_e004.p_icrcd_iu_pk;
       sc_e004            postgres    false    238            ?           0    0    INDEX p_icrcd_iu_pk    COMMENT     8   COMMENT ON INDEX sc_e004.p_icrcd_iu_pk IS 'PK p_icrcd';
          sc_e004          postgres    false    3496            ?           1259    17630    p_icrch_iu_pk    INDEX     Q   CREATE UNIQUE INDEX p_icrch_iu_pk ON sc_e004.p_icrch USING btree (fbc21, fdc24);
 "   DROP INDEX sc_e004.p_icrch_iu_pk;
       sc_e004            postgres    false    239    239            ?           0    0    INDEX p_icrch_iu_pk    COMMENT     8   COMMENT ON INDEX sc_e004.p_icrch_iu_pk IS 'PK p_icrch';
          sc_e004          postgres    false    3499            ?           1259    17631    p_icrdd_in_fk_p_icrad_fbc01    INDEX     Q   CREATE INDEX p_icrdd_in_fk_p_icrad_fbc01 ON sc_e004.p_icrdd USING btree (fbc01);
 0   DROP INDEX sc_e004.p_icrdd_in_fk_p_icrad_fbc01;
       sc_e004            postgres    false    240            ?           0    0 !   INDEX p_icrdd_in_fk_p_icrad_fbc01    COMMENT     R   COMMENT ON INDEX sc_e004.p_icrdd_in_fk_p_icrad_fbc01 IS 'FK p_icrcd p_icrad C01';
          sc_e004          postgres    false    3502            ?           1259    17632    p_icrdd_in_fk_p_icrbd_fbc11    INDEX     Q   CREATE INDEX p_icrdd_in_fk_p_icrbd_fbc11 ON sc_e004.p_icrdd USING btree (fbc11);
 0   DROP INDEX sc_e004.p_icrdd_in_fk_p_icrbd_fbc11;
       sc_e004            postgres    false    240            ?           0    0 !   INDEX p_icrdd_in_fk_p_icrbd_fbc11    COMMENT     R   COMMENT ON INDEX sc_e004.p_icrdd_in_fk_p_icrbd_fbc11 IS 'FK p_icrcd p_icrbd C11';
          sc_e004          postgres    false    3503            ?           1259    17633    p_icrdd_in_fk_p_icrcd_fbc21    INDEX     Q   CREATE INDEX p_icrdd_in_fk_p_icrcd_fbc21 ON sc_e004.p_icrdd USING btree (fbc21);
 0   DROP INDEX sc_e004.p_icrdd_in_fk_p_icrcd_fbc21;
       sc_e004            postgres    false    240            ?           0    0 !   INDEX p_icrdd_in_fk_p_icrcd_fbc21    COMMENT     R   COMMENT ON INDEX sc_e004.p_icrdd_in_fk_p_icrcd_fbc21 IS 'FK p_icrcd p_icrcd C21';
          sc_e004          postgres    false    3504            ?           1259    17634    p_icrdd_iu_pk    INDEX     Q   CREATE UNIQUE INDEX p_icrdd_iu_pk ON sc_e004.p_icrdd USING btree (fbc01, fbc21);
 "   DROP INDEX sc_e004.p_icrdd_iu_pk;
       sc_e004            postgres    false    240    240            ?           0    0    INDEX p_icrdd_iu_pk    COMMENT     8   COMMENT ON INDEX sc_e004.p_icrdd_iu_pk IS 'PK p_icrdd';
          sc_e004          postgres    false    3505            ?           1259    17635    p_icrdh_iu_pk    INDEX     Y   CREATE UNIQUE INDEX p_icrdh_iu_pk ON sc_e004.p_icrdh USING btree (fbc01, fbc21, fdc03d);
 "   DROP INDEX sc_e004.p_icrdh_iu_pk;
       sc_e004            postgres    false    241    241    241            ?           0    0    INDEX p_icrdh_iu_pk    COMMENT     8   COMMENT ON INDEX sc_e004.p_icrdh_iu_pk IS 'PK p_icrdh';
          sc_e004          postgres    false    3508            ?           1259    17636    p_icrah_iu_pk    INDEX     R   CREATE UNIQUE INDEX p_icrah_iu_pk ON sc_e005.p_icrah USING btree (fbc01, fdc03d);
 "   DROP INDEX sc_e005.p_icrah_iu_pk;
       sc_e005            postgres    false    253    253            ?           0    0    INDEX p_icrah_iu_pk    COMMENT     8   COMMENT ON INDEX sc_e005.p_icrah_iu_pk IS 'PK p_icrah';
          sc_e005          postgres    false    3511            ?           1259    17637    p_icrch_iu_pk    INDEX     Q   CREATE UNIQUE INDEX p_icrch_iu_pk ON sc_e005.p_icrch USING btree (fbc21, fdc24);
 "   DROP INDEX sc_e005.p_icrch_iu_pk;
       sc_e005            postgres    false    254    254            ?           0    0    INDEX p_icrch_iu_pk    COMMENT     8   COMMENT ON INDEX sc_e005.p_icrch_iu_pk IS 'PK p_icrch';
          sc_e005          postgres    false    3514            ?           1259    17638    p_icrdh_iu_pk    INDEX     Y   CREATE UNIQUE INDEX p_icrdh_iu_pk ON sc_e005.p_icrdh USING btree (fbc01, fbc21, fdc03d);
 "   DROP INDEX sc_e005.p_icrdh_iu_pk;
       sc_e005            postgres    false    255    255    255            ?           0    0    INDEX p_icrdh_iu_pk    COMMENT     8   COMMENT ON INDEX sc_e005.p_icrdh_iu_pk IS 'PK p_icrdh';
          sc_e005          postgres    false    3517            ?           2606    17639     p_icrad p_icrad_fk_p_icrbd_fbc11    FK CONSTRAINT     ?   ALTER TABLE ONLY sc_e001.p_icrad
    ADD CONSTRAINT p_icrad_fk_p_icrbd_fbc11 FOREIGN KEY (fbc11) REFERENCES sc_e001.p_icrbd(fbc11) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 K   ALTER TABLE ONLY sc_e001.p_icrad DROP CONSTRAINT p_icrad_fk_p_icrbd_fbc11;
       sc_e001          postgres    false    3425    219    220            ?           0    0 .   CONSTRAINT p_icrad_fk_p_icrbd_fbc11 ON p_icrad    COMMENT     b   COMMENT ON CONSTRAINT p_icrad_fk_p_icrbd_fbc11 ON sc_e001.p_icrad IS 'FK p_icrad -- p_icrbd C11';
          sc_e001          postgres    false    3520            ?           2606    17644     p_icrcd p_icrcd_fk_p_icrbd_fbc11    FK CONSTRAINT     ?   ALTER TABLE ONLY sc_e001.p_icrcd
    ADD CONSTRAINT p_icrcd_fk_p_icrbd_fbc11 FOREIGN KEY (fbc11) REFERENCES sc_e001.p_icrbd(fbc11) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 K   ALTER TABLE ONLY sc_e001.p_icrcd DROP CONSTRAINT p_icrcd_fk_p_icrbd_fbc11;
       sc_e001          postgres    false    221    220    3425            ?           0    0 .   CONSTRAINT p_icrcd_fk_p_icrbd_fbc11 ON p_icrcd    COMMENT     b   COMMENT ON CONSTRAINT p_icrcd_fk_p_icrbd_fbc11 ON sc_e001.p_icrcd IS 'FK p_icrcd -- p_icrbd C11';
          sc_e001          postgres    false    3521            ?           2606    17649     p_icrdd p_icrdd_fk_p_icrad_fbc01    FK CONSTRAINT     ?   ALTER TABLE ONLY sc_e001.p_icrdd
    ADD CONSTRAINT p_icrdd_fk_p_icrad_fbc01 FOREIGN KEY (fbc01) REFERENCES sc_e001.p_icrad(fbc01) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 K   ALTER TABLE ONLY sc_e001.p_icrdd DROP CONSTRAINT p_icrdd_fk_p_icrad_fbc01;
       sc_e001          postgres    false    3421    222    219            ?           0    0 .   CONSTRAINT p_icrdd_fk_p_icrad_fbc01 ON p_icrdd    COMMENT     b   COMMENT ON CONSTRAINT p_icrdd_fk_p_icrad_fbc01 ON sc_e001.p_icrdd IS 'FK p_icrdd -- p_icrad C01';
          sc_e001          postgres    false    3522            ?           2606    17654     p_icrdd p_icrdd_fk_p_icrbd_fbc11    FK CONSTRAINT     ?   ALTER TABLE ONLY sc_e001.p_icrdd
    ADD CONSTRAINT p_icrdd_fk_p_icrbd_fbc11 FOREIGN KEY (fbc11) REFERENCES sc_e001.p_icrbd(fbc11) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 K   ALTER TABLE ONLY sc_e001.p_icrdd DROP CONSTRAINT p_icrdd_fk_p_icrbd_fbc11;
       sc_e001          postgres    false    3425    222    220            ?           0    0 .   CONSTRAINT p_icrdd_fk_p_icrbd_fbc11 ON p_icrdd    COMMENT     b   COMMENT ON CONSTRAINT p_icrdd_fk_p_icrbd_fbc11 ON sc_e001.p_icrdd IS 'FK p_icrdd -- p_icrbd C11';
          sc_e001          postgres    false    3523            ?           2606    17659     p_icrdd p_icrdd_fk_p_icrcd_fbc21    FK CONSTRAINT     ?   ALTER TABLE ONLY sc_e001.p_icrdd
    ADD CONSTRAINT p_icrdd_fk_p_icrcd_fbc21 FOREIGN KEY (fbc21) REFERENCES sc_e001.p_icrcd(fbc21) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 K   ALTER TABLE ONLY sc_e001.p_icrdd DROP CONSTRAINT p_icrdd_fk_p_icrcd_fbc21;
       sc_e001          postgres    false    221    3431    222            ?           0    0 .   CONSTRAINT p_icrdd_fk_p_icrcd_fbc21 ON p_icrdd    COMMENT     b   COMMENT ON CONSTRAINT p_icrdd_fk_p_icrcd_fbc21 ON sc_e001.p_icrdd IS 'FK p_icrdd -- p_icrcd C21';
          sc_e001          postgres    false    3524            ?           2606    17664     p_icrad p_icrad_fk_p_icrbd_fbc11    FK CONSTRAINT     ?   ALTER TABLE ONLY sc_e002.p_icrad
    ADD CONSTRAINT p_icrad_fk_p_icrbd_fbc11 FOREIGN KEY (fbc11) REFERENCES sc_e002.p_icrbd(fbc11) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 K   ALTER TABLE ONLY sc_e002.p_icrad DROP CONSTRAINT p_icrad_fk_p_icrbd_fbc11;
       sc_e002          postgres    false    3446    224    223            ?           0    0 .   CONSTRAINT p_icrad_fk_p_icrbd_fbc11 ON p_icrad    COMMENT     b   COMMENT ON CONSTRAINT p_icrad_fk_p_icrbd_fbc11 ON sc_e002.p_icrad IS 'FK p_icrad -- p_icrbd C11';
          sc_e002          postgres    false    3525            ?           2606    17669     p_icrcd p_icrcd_fk_p_icrbd_fbc11    FK CONSTRAINT     ?   ALTER TABLE ONLY sc_e002.p_icrcd
    ADD CONSTRAINT p_icrcd_fk_p_icrbd_fbc11 FOREIGN KEY (fbc11) REFERENCES sc_e002.p_icrbd(fbc11) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 K   ALTER TABLE ONLY sc_e002.p_icrcd DROP CONSTRAINT p_icrcd_fk_p_icrbd_fbc11;
       sc_e002          postgres    false    224    3446    225            ?           0    0 .   CONSTRAINT p_icrcd_fk_p_icrbd_fbc11 ON p_icrcd    COMMENT     b   COMMENT ON CONSTRAINT p_icrcd_fk_p_icrbd_fbc11 ON sc_e002.p_icrcd IS 'FK p_icrcd -- p_icrbd C11';
          sc_e002          postgres    false    3526            ?           2606    17674     p_icrdd p_icrdd_fk_p_icrad_fbc01    FK CONSTRAINT     ?   ALTER TABLE ONLY sc_e002.p_icrdd
    ADD CONSTRAINT p_icrdd_fk_p_icrad_fbc01 FOREIGN KEY (fbc01) REFERENCES sc_e002.p_icrad(fbc01) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 K   ALTER TABLE ONLY sc_e002.p_icrdd DROP CONSTRAINT p_icrdd_fk_p_icrad_fbc01;
       sc_e002          postgres    false    226    3442    223            ?           0    0 .   CONSTRAINT p_icrdd_fk_p_icrad_fbc01 ON p_icrdd    COMMENT     b   COMMENT ON CONSTRAINT p_icrdd_fk_p_icrad_fbc01 ON sc_e002.p_icrdd IS 'FK p_icrdd -- p_icrad C01';
          sc_e002          postgres    false    3527            ?           2606    17679     p_icrdd p_icrdd_fk_p_icrbd_fbc11    FK CONSTRAINT     ?   ALTER TABLE ONLY sc_e002.p_icrdd
    ADD CONSTRAINT p_icrdd_fk_p_icrbd_fbc11 FOREIGN KEY (fbc11) REFERENCES sc_e002.p_icrbd(fbc11) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 K   ALTER TABLE ONLY sc_e002.p_icrdd DROP CONSTRAINT p_icrdd_fk_p_icrbd_fbc11;
       sc_e002          postgres    false    3446    226    224            ?           0    0 .   CONSTRAINT p_icrdd_fk_p_icrbd_fbc11 ON p_icrdd    COMMENT     b   COMMENT ON CONSTRAINT p_icrdd_fk_p_icrbd_fbc11 ON sc_e002.p_icrdd IS 'FK p_icrdd -- p_icrbd C11';
          sc_e002          postgres    false    3528            ?           2606    17684     p_icrdd p_icrdd_fk_p_icrcd_fbc21    FK CONSTRAINT     ?   ALTER TABLE ONLY sc_e002.p_icrdd
    ADD CONSTRAINT p_icrdd_fk_p_icrcd_fbc21 FOREIGN KEY (fbc21) REFERENCES sc_e002.p_icrcd(fbc21) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 K   ALTER TABLE ONLY sc_e002.p_icrdd DROP CONSTRAINT p_icrdd_fk_p_icrcd_fbc21;
       sc_e002          postgres    false    226    3452    225            ?           0    0 .   CONSTRAINT p_icrdd_fk_p_icrcd_fbc21 ON p_icrdd    COMMENT     b   COMMENT ON CONSTRAINT p_icrdd_fk_p_icrcd_fbc21 ON sc_e002.p_icrdd IS 'FK p_icrdd -- p_icrcd C21';
          sc_e002          postgres    false    3529            ?           2606    17689 %   p_apptbo p_apptbo_fk_p_appapp_fvapnam    FK CONSTRAINT     ?   ALTER TABLE ONLY sc_e004.p_apptbo
    ADD CONSTRAINT p_apptbo_fk_p_appapp_fvapnam FOREIGN KEY (fvapnam) REFERENCES sc_e004.p_appapp(fvapnam) ON UPDATE CASCADE ON DELETE RESTRICT;
 P   ALTER TABLE ONLY sc_e004.p_apptbo DROP CONSTRAINT p_apptbo_fk_p_appapp_fvapnam;
       sc_e004          postgres    false    234    3464    230            ?           0    0 3   CONSTRAINT p_apptbo_fk_p_appapp_fvapnam ON p_apptbo    COMMENT     l   COMMENT ON CONSTRAINT p_apptbo_fk_p_appapp_fvapnam ON sc_e004.p_apptbo IS 'FK p_apptbo / p_appapp fvapnam';
          sc_e004          postgres    false    3530            ?           2606    17694 %   p_apptbo p_apptbo_fk_p_appnvu_finvlus    FK CONSTRAINT     ?   ALTER TABLE ONLY sc_e004.p_apptbo
    ADD CONSTRAINT p_apptbo_fk_p_appnvu_finvlus FOREIGN KEY (finvlus) REFERENCES sc_e004.p_appnvu(finvlus) ON UPDATE CASCADE ON DELETE RESTRICT;
 P   ALTER TABLE ONLY sc_e004.p_apptbo DROP CONSTRAINT p_apptbo_fk_p_appnvu_finvlus;
       sc_e004          postgres    false    231    234    3467            ?           0    0 3   CONSTRAINT p_apptbo_fk_p_appnvu_finvlus ON p_apptbo    COMMENT     l   COMMENT ON CONSTRAINT p_apptbo_fk_p_appnvu_finvlus ON sc_e004.p_apptbo IS 'FK p_apptbo / p_appnvu finvlur';
          sc_e004          postgres    false    3531            ?           2606    17699 %   p_apptbo p_apptbo_fk_p_appopt_fvotnam    FK CONSTRAINT     ?   ALTER TABLE ONLY sc_e004.p_apptbo
    ADD CONSTRAINT p_apptbo_fk_p_appopt_fvotnam FOREIGN KEY (fvotnam) REFERENCES sc_e004.p_appopt(fvotnam) ON UPDATE CASCADE ON DELETE RESTRICT;
 P   ALTER TABLE ONLY sc_e004.p_apptbo DROP CONSTRAINT p_apptbo_fk_p_appopt_fvotnam;
       sc_e004          postgres    false    232    3470    234            ?           0    0 3   CONSTRAINT p_apptbo_fk_p_appopt_fvotnam ON p_apptbo    COMMENT     l   COMMENT ON CONSTRAINT p_apptbo_fk_p_appopt_fvotnam ON sc_e004.p_apptbo IS 'FK p_apptbo / p_appopt fvotnam';
          sc_e004          postgres    false    3532            ?           2606    17704 %   p_apptbo p_apptbo_fk_p_apptbl_fvtbnam    FK CONSTRAINT     ?   ALTER TABLE ONLY sc_e004.p_apptbo
    ADD CONSTRAINT p_apptbo_fk_p_apptbl_fvtbnam FOREIGN KEY (fvtbnam) REFERENCES sc_e004.p_apptbl(fvtbnam) ON UPDATE CASCADE ON DELETE RESTRICT;
 P   ALTER TABLE ONLY sc_e004.p_apptbo DROP CONSTRAINT p_apptbo_fk_p_apptbl_fvtbnam;
       sc_e004          postgres    false    233    3473    234            ?           0    0 3   CONSTRAINT p_apptbo_fk_p_apptbl_fvtbnam ON p_apptbo    COMMENT     l   COMMENT ON CONSTRAINT p_apptbo_fk_p_apptbl_fvtbnam ON sc_e004.p_apptbo IS 'FK p_apptbo / p_apptbl fvtbnam';
          sc_e004          postgres    false    3533            ?           2606    17709     p_icrad p_icrad_fk_p_icrbd_fbc11    FK CONSTRAINT     ?   ALTER TABLE ONLY sc_e004.p_icrad
    ADD CONSTRAINT p_icrad_fk_p_icrbd_fbc11 FOREIGN KEY (fbc11) REFERENCES sc_e004.p_icrbd(fbc11) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 K   ALTER TABLE ONLY sc_e004.p_icrad DROP CONSTRAINT p_icrad_fk_p_icrbd_fbc11;
       sc_e004          postgres    false    237    3492    235            ?           0    0 .   CONSTRAINT p_icrad_fk_p_icrbd_fbc11 ON p_icrad    COMMENT     b   COMMENT ON CONSTRAINT p_icrad_fk_p_icrbd_fbc11 ON sc_e004.p_icrad IS 'FK p_icrad -- p_icrbd C11';
          sc_e004          postgres    false    3534            ?           2606    17714     p_icrcd p_icrcd_fk_p_icrbd_fbc11    FK CONSTRAINT     ?   ALTER TABLE ONLY sc_e004.p_icrcd
    ADD CONSTRAINT p_icrcd_fk_p_icrbd_fbc11 FOREIGN KEY (fbc11) REFERENCES sc_e004.p_icrbd(fbc11) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 K   ALTER TABLE ONLY sc_e004.p_icrcd DROP CONSTRAINT p_icrcd_fk_p_icrbd_fbc11;
       sc_e004          postgres    false    3492    237    238            ?           0    0 .   CONSTRAINT p_icrcd_fk_p_icrbd_fbc11 ON p_icrcd    COMMENT     b   COMMENT ON CONSTRAINT p_icrcd_fk_p_icrbd_fbc11 ON sc_e004.p_icrcd IS 'FK p_icrcd -- p_icrbd C11';
          sc_e004          postgres    false    3535            ?           2606    17719     p_icrdd p_icrdd_fk_p_icrad_fbc01    FK CONSTRAINT     ?   ALTER TABLE ONLY sc_e004.p_icrdd
    ADD CONSTRAINT p_icrdd_fk_p_icrad_fbc01 FOREIGN KEY (fbc01) REFERENCES sc_e004.p_icrad(fbc01) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 K   ALTER TABLE ONLY sc_e004.p_icrdd DROP CONSTRAINT p_icrdd_fk_p_icrad_fbc01;
       sc_e004          postgres    false    235    240    3485            ?           0    0 .   CONSTRAINT p_icrdd_fk_p_icrad_fbc01 ON p_icrdd    COMMENT     b   COMMENT ON CONSTRAINT p_icrdd_fk_p_icrad_fbc01 ON sc_e004.p_icrdd IS 'FK p_icrdd -- p_icrad C01';
          sc_e004          postgres    false    3536            ?           2606    17724     p_icrdd p_icrdd_fk_p_icrbd_fbc11    FK CONSTRAINT     ?   ALTER TABLE ONLY sc_e004.p_icrdd
    ADD CONSTRAINT p_icrdd_fk_p_icrbd_fbc11 FOREIGN KEY (fbc11) REFERENCES sc_e004.p_icrbd(fbc11) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 K   ALTER TABLE ONLY sc_e004.p_icrdd DROP CONSTRAINT p_icrdd_fk_p_icrbd_fbc11;
       sc_e004          postgres    false    3492    237    240            ?           0    0 .   CONSTRAINT p_icrdd_fk_p_icrbd_fbc11 ON p_icrdd    COMMENT     b   COMMENT ON CONSTRAINT p_icrdd_fk_p_icrbd_fbc11 ON sc_e004.p_icrdd IS 'FK p_icrdd -- p_icrbd C11';
          sc_e004          postgres    false    3537            ?           2606    17729     p_icrdd p_icrdd_fk_p_icrcd_fbc21    FK CONSTRAINT     ?   ALTER TABLE ONLY sc_e004.p_icrdd
    ADD CONSTRAINT p_icrdd_fk_p_icrcd_fbc21 FOREIGN KEY (fbc21) REFERENCES sc_e004.p_icrcd(fbc21) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 K   ALTER TABLE ONLY sc_e004.p_icrdd DROP CONSTRAINT p_icrdd_fk_p_icrcd_fbc21;
       sc_e004          postgres    false    238    240    3498            ?           0    0 .   CONSTRAINT p_icrdd_fk_p_icrcd_fbc21 ON p_icrdd    COMMENT     b   COMMENT ON CONSTRAINT p_icrdd_fk_p_icrcd_fbc21 ON sc_e004.p_icrdd IS 'FK p_icrdd -- p_icrcd C21';
          sc_e004          postgres    false    3538            h      x?????? ? ?      i   "   x?3???/N?4202?54?50????????? M?      j      x?????? ? ?      k      x?????? ? ?      l      x?????? ? ?      m      x?????? ? ?      n      x?????? ? ?      o      x?????? ? ?      p      x?????? ? ?      q      x?????? ? ?      r       x???K?/?M,??ϋ/N?H?M?????? wk)      s   2   x?K???,N?O500??L.??s?ӡlc?Ă?xiI\<??&F??? ???      t      x?34?22?26?2?????? ?'      u   `   x?????v
Q???????4?4?4?
?pqq? ??F\????y???ye ?`?`WW???1Pc8g??k?+?$N??W??=... 3??      v   "   x?+??L.JL?* ?IP:J??pp??qqq Y      w   U   x??L.??-J???,??L.JL?LI,??????44?4?4 ?4???L?B??sg?!???CFH??Ms?LI?F??P?l?c???? ?+?      x      x?????? ? ?      y      x?????? ? ?      z      x?????? ? ?      {      x?????? ? ?      |      x?????? ? ?      }      x?????? ? ?      ~      x?????? ? ?         )   x?K???,N?O500?J,(????2????9??p?=... ?t?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?     
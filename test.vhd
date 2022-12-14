ENTITY test IS

END test;

ARCHITECTURE struct OF test IS

	COMPONENT numarator IS
		GENERIC( delay: TIME := 10 ns; MAX_VAL: INTEGER := 16);
		PORT(clock, reset, load: IN BIT;
			minus2: IN BIT;
			intrare_paralela: IN INTEGER;
			iesire: OUT INTEGER);
	END COMPONENT;

	COMPONENT  clk_gen IS
		GENERIC(t_high: TIME:=30 ns; t_period: TIME:=50 ns; t_reset: TIME:=10 ns);
		PORT(clock: OUT BIT:='1'; reset : OUT BIT);
	END COMPONENT;

	SIGNAL clock_s, reset_s, load_s : BIT;
	
	SIGNAL minus2_s : BIT;

	SIGNAL intrare_paralela_s: INTEGER := -5;

	SIGNAL iesire_s : INTEGER;
BEGIN

et1: numarator GENERIC MAP(delay => 5ns, MAX_VAL => 16) 
	PORT MAP ( clock => clock_s, reset => reset_s, load => load_s, minus2 => minus2_s, intrare_paralela => intrare_paralela_s, iesire => iesire_s);

et2: clk_gen GENERIC MAP (t_high => 40ns, t_period => 100ns, t_reset => 30ns) PORT MAP (clock => clock_s, reset => reset_s );

load_s <='0', '1' after 240 ns, '0' AFTER 440 ns;

minus2_s <='0', '1' after 5 us;

intrare_paralela_s <= 10 AFTER 150 ns;

END struct; 

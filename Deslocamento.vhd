LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Deslocamento IS 
	PORT(din, rst, clk: IN STD_LOGIC;
	dout: OUT STD_LOGIC;
	qout: OUT STD_LOGIC_VECTOR(0 TO 3) );
END ENTITY;

ARCHITECTURE Flip OF Deslocamento IS	
BEGIN
	PROCESS(clk, rst)
		variable q: STD_LOGIC_VECTOR(0 TO 3);
	BEGIN
		IF (rst = '1') THEN
			q := (OTHERS => '0');
		ELSIF(clk'EVENT AND clk = '1') THEN
			q := din & q(0 TO 2);
		END IF;
			qout(3) <= q(3);
			qout(2) <= q(2);
			qout(1) <= q(1);
			qout(0) <= q(0);			
	END PROCESS;
END;
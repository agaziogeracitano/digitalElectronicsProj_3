library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity FullAdder is
    port (A,B,Cin: in STD_LOGIC;
             Cout,S: out STD_LOGIC);
end FullAdder;

architecture Behavioral of FullAdder is
signal p,g: STD_LOGIC;
begin
    Cout<=g when p='0' else Cin;
    S<= p xor Cin;
    p<=a xor b;
    g<= a and b;

end Behavioral;

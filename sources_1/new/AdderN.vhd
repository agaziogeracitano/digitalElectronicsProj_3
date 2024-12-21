
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AdderN is
    generic(n:Integer:=16);
    port(A,B : in STD_LOGIC_VECTOR(n-1 downto 0);
         Somma: out STD_LOGIC_VECTOR(n downto 0));
end AdderN;

architecture Behavioral of AdderN is
    signal p,g : STD_LOGIC_VECTOR(n downto 0);
    signal carry: STD_LOGIC_VECTOR(n+1 downto 0);
begin
    p<=( B(n-1) xor A(n-1)) & (B xor A);
    g<=( B(n-1) and A(n-1)) & (B and A);
    carry(0)<='0';
    carry(n+1 downto 1)<= g or (p and carry(n downto 0));
    Somma<=p xor carry(n downto 0);

end Behavioral;
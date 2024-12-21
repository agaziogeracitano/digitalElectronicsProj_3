library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CarrySave is
    generic(n:Integer:=16);
    port(A,B,C : in STD_LOGIC_VECTOR(n-1 downto 0);
         Somma: out STD_LOGIC_VECTOR(n+1 downto 0);
         clk : in STD_LOGIC;
         clear: in STD_LOGIC);
         
end CarrySave;

architecture Behavioral of CarrySave is

component Registro is
    generic (n:integer:=16);
    Port ( clk : in STD_LOGIC;
           clear : in STD_LOGIC;
           D : in STD_LOGIC_VECTOR (n-1 downto 0);
           Q : out STD_LOGIC_VECTOR (n-1 downto 0));
end component;

component Sommatore is
    generic(n:Integer:=16);
    port(A,B,C : in STD_LOGIC_VECTOR(n-1 downto 0);
         Somma: out STD_LOGIC_VECTOR(n+1 downto 0));
end component;

signal IA, IB, IC: STD_LOGIC_VECTOR(n-1 downto 0);
signal Isomma:STD_LOGIC_VECTOR(n+1 downto 0);

begin
RegA: Registro generic map(n) port map(clk, clear, A, Ia);
RegB: Registro generic map(n) port map(clk, clear, B, Ib);
RegC: Registro generic map(n) port map(clk, clear, C, Ic);

SommaABC: Sommatore generic map(n) port map(IA,IB,IC, Isomma);

RegSomma: Registro generic map(n+2) port map(clk, clear, ISomma, SOmma);

end Behavioral;

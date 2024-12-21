library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity Sommatore is
    generic(n:Integer:=16);
    port(A,B,C : in STD_LOGIC_VECTOR(n-1 downto 0);
         Somma: out STD_LOGIC_VECTOR(n+1 downto 0));
end Sommatore;

architecture Behavioral of Sommatore is
   
    component FullAdder is
        port (A,B,Cin: in STD_LOGIC;
             Cout,S: out STD_LOGIC);
    end component;
    
    component AdderN is
        generic(n:Integer:=16);
        port(A,B : in STD_LOGIC_VECTOR(n-1 downto 0);
            Somma: out STD_LOGIC_VECTOR(n downto 0));
    end component;

signal SP, VR: STD_LOGIC_VECTOR(n-1 downto 0);
signal VR_shift, SP_esteso:STD_LOGIC_VECTOR(n downto 0);
signal IA, IB: STD_LOGIC_VECTOR(n+1 downto 0);
signal sum: STD_LOGIC_VECTOR(n+2 downto 0);

begin

    myFor: for i in 0 to n-1 generate
        Fax: FullAdder port map(A(i), B(i), C(i), VR(i), SP(i));
    end generate;
    
    --shift sx VR
    VR_shift(n downto 1)<=VR(n-1 downto 0);
    VR_shift(0)<='0';
    
    --estendo SP
    SP_esteso(n)<=SP(n-1);
    SP_esteso(n-1 downto 0)<=SP(n-1 downto 0);
    
    --estendo entrambi i vettori
    IA(n+1)<=SP_esteso(n);
    IA(n downto 0)<=SP_esteso(n downto 0);
    
    IB(n+1)<=VR_shift(n);
    IB(n downto 0)<=VR_shift(n downto 0);
    
    --sommo i due vettori
    SommaAB: AdderN generic map(n+2) port map(IA,IB,sum);
    
    Somma<= sum(n+1 downto 0);


end Behavioral;

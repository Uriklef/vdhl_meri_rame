library IEEE;
use IEEE.std_logic_1164.all;
-- Déclaration d'une entité pour la simulation sans ports d'entrées et de sorties
entity myET2testbench is
end myET2testbench;
architecture myET2testbench_Arch of myET2testbench is
-- Déclaration du composant à tester -> renvoie vers l'entité ET2
component ET2 is
port (
e1 : in std_logic;
e2 : in std_logic;
s1 : out std_logic
);
end component;
-- Déclaration des signaux internes à l'architecture pour réaliser les simulations
signal e1_sim, e2_sim : std_logic := '0';
signal s1_sim : std_logic := '0';
begin
-- Instanciation du composant à tester
MyComponentET2underTest : ET2
--raccordement des ports du composant aux signaux dans l'architecture
port map (
e1 => e1_sim,
e2 => e2_sim,
s1 => s1_sim
);
-- Définition du process permettant de faire évoluer les signaux d'entrée du composant à tester
MyStimulus_Proc2 : process -- pas de liste de sensibilité
begin
e1_sim <= '0';
e2_sim <= '0';
wait for 100 us;
e1_sim <= '0';
e2_sim <= '1';
wait for 100 us;
e1_sim <= '1';
e2_sim <= '0';
wait for 100 us;
e1_sim <= '1';
e2_sim <= '1';
wait for 100 us;
end process;
end myET2testbench_Arch;
library IEEE;
use IEEE.std_logic_1164.all;

-- Déclaration de l'entité pour la simulation
entity myET2testbench is
end myET2testbench;

architecture myET2testbench_Arch of myET2testbench is

    -- Déclaration du composant à tester
    component ET2 is
        port (
            e1 : in std_logic;
            e2 : in std_logic;
            s1 : out std_logic
        );
    end component;

    -- Déclaration des signaux internes
    signal e1_sim, e2_sim : std_logic := '0';
    signal s1_sim : std_logic := '0';

begin

    -- Instanciation du composant ET2
    MyComponentET2underTest : ET2
    port map (
        e1 => e1_sim,
        e2 => e2_sim,
        s1 => s1_sim
    );

    -- Processus de simulation
    MyStimulus_Proc2 : process
    begin

        -- Premier cas : e1 = 0, e2 = 0
        e1_sim <= '0';
        e2_sim <= '0';
        wait for 100 us;

        assert s1_sim=(e1_sim and e2_sim) report "e1_sim = " & std_logic'image(e1_sim) &
               " | e2_sim = " & std_logic'image(e2_sim) &
               " | s1_sim = " & std_logic'image(s1_sim) severity failure;

        -- Deuxième cas : e1 = 0, e2 = 1
        e1_sim <= '0';
        e2_sim <= '1';
        wait for 100 us;

        assert s1_sim=(e1_sim and e2_sim) report "e1_sim = " & std_logic'image(e1_sim) &
               " | e2_sim = " & std_logic'image(e2_sim) &
               " | s1_sim = " & std_logic'image(s1_sim) severity failure;

        -- Troisième cas : e1 = 1, e2 = 0
        e1_sim <= '1';
        e2_sim <= '0';
        wait for 100 us;

        assert s1_sim=(e1_sim and e2_sim) report "e1_sim = " & std_logic'image(e1_sim) &
               " | e2_sim = " & std_logic'image(e2_sim) &
               " | s1_sim = " & std_logic'image(s1_sim) severity failure;

        -- Quatrième cas : e1 = 1, e2 = 1
        e1_sim <= '1';
        e2_sim <= '1';
        wait for 100 us;

        assert s1_sim=(e1_sim and e2_sim) report "e1_sim = " & std_logic'image(e1_sim) & " | e2_sim = " & std_logic'image(e2_sim) & " | s1_sim = " & std_logic'image(s1_sim) severity failure;
        report "Test ok (no assert...)";
        wait;
    end process;

end myET2testbench_Arch;
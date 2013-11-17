library verilog;
use verilog.vl_types.all;
entity scorer is
    port(
        winrnd          : in     vl_logic;
        right           : in     vl_logic;
        tie             : in     vl_logic;
        leds_on         : in     vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        score           : out    vl_logic_vector(6 downto 0)
    );
end scorer;

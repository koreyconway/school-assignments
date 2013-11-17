library verilog;
use verilog.vl_types.all;
entity ledmux is
    port(
        leds_ctrl       : in     vl_logic_vector(1 downto 0);
        score           : in     vl_logic_vector(6 downto 0);
        leds_out        : out    vl_logic_vector(6 downto 0)
    );
end ledmux;

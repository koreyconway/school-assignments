library verilog;
use verilog.vl_types.all;
entity top is
    port(
        pbr             : in     vl_logic;
        pbl             : in     vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        leds_out        : out    vl_logic_vector(6 downto 0)
    );
end top;

library verilog;
use verilog.vl_types.all;
entity MC is
    port(
        slowenable      : in     vl_logic;
        rout            : in     vl_logic;
        winrnd          : in     vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        leds_on         : out    vl_logic;
        leds_ctrl       : out    vl_logic_vector(1 downto 0);
        clear           : out    vl_logic
    );
end MC;

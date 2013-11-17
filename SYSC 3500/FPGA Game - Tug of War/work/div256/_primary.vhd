library verilog;
use verilog.vl_types.all;
entity div256 is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        slowenable      : out    vl_logic
    );
end div256;

library verilog;
use verilog.vl_types.all;
entity OPP is
    port(
        sypush          : in     vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        winrnd          : out    vl_logic
    );
end OPP;

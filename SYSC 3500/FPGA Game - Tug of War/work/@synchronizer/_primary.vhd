library verilog;
use verilog.vl_types.all;
entity Synchronizer is
    port(
        push            : in     vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        sypush          : out    vl_logic
    );
end Synchronizer;

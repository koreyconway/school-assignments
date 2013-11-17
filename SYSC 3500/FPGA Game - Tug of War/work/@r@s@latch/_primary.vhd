library verilog;
use verilog.vl_types.all;
entity RSLatch is
    port(
        trigger         : in     vl_logic;
        clear           : in     vl_logic;
        rst             : in     vl_logic;
        q               : out    vl_logic
    );
end RSLatch;

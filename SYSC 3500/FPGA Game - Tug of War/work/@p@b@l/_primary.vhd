library verilog;
use verilog.vl_types.all;
entity PBL is
    port(
        pbl             : in     vl_logic;
        pbr             : in     vl_logic;
        clear           : in     vl_logic;
        rst             : in     vl_logic;
        push            : out    vl_logic;
        tie             : out    vl_logic;
        right           : out    vl_logic
    );
end PBL;

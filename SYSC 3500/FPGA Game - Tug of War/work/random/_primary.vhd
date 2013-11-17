library verilog;
use verilog.vl_types.all;
entity random is
    port(
        slowenable      : in     vl_logic;
        rst             : in     vl_logic;
        rout            : out    vl_logic
    );
end random;

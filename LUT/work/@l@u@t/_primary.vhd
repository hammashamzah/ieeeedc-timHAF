library verilog;
use verilog.vl_types.all;
entity LUT is
    generic(
        n               : integer := 87
    );
    port(
        clock           : in     vl_logic;
        code            : in     vl_logic_vector(7 downto 0);
        theta           : out    vl_logic_vector(7 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of n : constant is 1;
end LUT;

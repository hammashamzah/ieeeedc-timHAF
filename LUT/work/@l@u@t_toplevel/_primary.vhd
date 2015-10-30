library verilog;
use verilog.vl_types.all;
entity LUT_toplevel is
    port(
        clock           : in     vl_logic;
        code_x1         : in     vl_logic_vector(7 downto 0);
        code_x2         : in     vl_logic_vector(7 downto 0);
        code_y1         : in     vl_logic_vector(7 downto 0);
        code_y2         : in     vl_logic_vector(7 downto 0);
        theta           : out    vl_logic_vector(8 downto 0)
    );
end LUT_toplevel;

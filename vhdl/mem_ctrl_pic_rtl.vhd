----------------------------------------------------------------------------
-- Title      : Picture Memory Controller
-- Project    : VGA Controller
----------------------------------------------------------------------------
-- File       : mem_ctrl_pic_rtl.vhd
-- Author     : Lucas Ullrich
-- Company    : FH Technikum Wien, BEL
-- Last update: <date>
-- Platform   : ModelSim, Xilinx Vivado, Basys3
----------------------------------------------------------------------------
-- Description: <What is this code for?>
----------------------------------------------------------------------------
-- Revisions  :
-- Date         Version       Author          Description
-- <date>       <nr.>         Lucas Ullrich   <changes done>
----------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

architecture rtl of mem_ctrl_pic is

signal s_address_ready : std_logic;
signal s_pixel_to_read : std_logic_vector(11 downto 0);

  begin
    P_read_data : process(s_clk_i, s_reset_i)
    begin
      if s_reset_i = '1' then
        s_rgb_o <= B"0000_0000_0000";
        s_addr_o <= B"0_0000_0000_0000_0000";
      elsif s_clk_i'event and s_clk_i = '1' then
        if s_address_ready = '1' then

        end if;
      end if;
    end process;

    P_set_addr : process(s_clk_i, s_reset_i)
    begin
      if s_reset_i = '1' then

      elsif s_clk_i'event and s_clk_i = '1' then
        if s_pixel_counter_i < 320 then
          if s_line_counter_i < 240 then
            v_pixel_to_read := std_logic_vector(
                (unsigned(s_pixel_counter_i) + 1) *
                (unsigned(s_line_counter_i) + 1));
            v_pixel_to_read := std_logic_vector(unsigned(v_pixel_to_read) - 1);
          elsif s_line_counter_i < 480 then
            v_pixel_to_read := std_logic_vector(
                (unsigned(s_pixel_counter_i) - 319) *
                (unsigned(s_line_counter_i) - 239));
            v_pixel_to_read := std_logic_vector(unsigned(v_pixel_to_read) - 1);
          end if;
        elsif s_pixel_counter_i < 640 then

        end if;
      end if;
    end process;

end rtl;

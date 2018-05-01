----------------------------------------------------------------------------
-- Title      : Prescaler
-- Project    : VGA Controller
----------------------------------------------------------------------------
-- File       : prescaler.vhd
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
use IEEE.numeric_std.all;

architecture rtl of prescaler is
begin
  P_pixel_enable : process (s_clk_i, s_reset_i)

  variable v_clk_counter : integer := 0;

  begin
    if s_reset_i = '1' then
      v_clk_counter := 0;
      s_pixel_enable_o <= '0';
    elsif s_clk_i'event and s_clk_i = '1' then
      s_pixel_enable_o <= '0';
      if v_clk_counter < 3 then
        v_clk_counter := v_clk_counter + 1;
      else
        v_clk_counter := 0;
        s_pixel_enable_o <= '1';
      end if;
    end if;
  end process P_pixel_enable;
end rtl;

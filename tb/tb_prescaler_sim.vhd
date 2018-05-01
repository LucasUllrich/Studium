----------------------------------------------------------------------------
-- Title      : Prescaler
-- Project    : VGA Controller
----------------------------------------------------------------------------
-- File       : tb_prescaler_sim.vhd
-- Author     : Lucas Ullrich
-- Company 	  : FH Technikum Wien, BEL
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

architecture sim of tb_prescaler is
component prescaler
port(
  s_reset_i         : in std_logic;
  s_clk_i           : in std_logic;
  s_pixel_enable_o  : out std_logic
);
end component;

signal s_reset_i        : std_logic;
signal s_clk_i          : std_logic;
signal s_pixel_enable_o : std_logic;

begin
  i_prescaler : prescaler
  port map
  (s_reset_i        => s_reset_i,
   s_clk_i          => s_clk_i,
   s_pixel_enable_o => s_pixel_enable_o);

   P_reset : process
   begin
     s_reset_i <= '1';
     wait for 5 ns;
     s_reset_i <= '0';
     wait;
   end process;


   P_clock : process
   begin
    s_clk_i <= '0';
    wait for 5 ns;
    s_clk_i <= '1';
    wait for 5 ns;
  end process;

end sim;

----------------------------------------------------------------------------
-- Title      : Prescaler
-- Project    : VGA Controller
----------------------------------------------------------------------------
-- File       : prescaler.vhd
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

entity prescaler is
  port(
    s_reset_i         : in std_logic;
    s_clk_i           : in std_logic;
    s_pixel_enable_o  : out std_logic
  );
end prescaler;

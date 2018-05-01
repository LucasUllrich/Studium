----------------------------------------------------------------------------
-- Title      : VGA Control
-- Project    : VGA Controller
----------------------------------------------------------------------------
-- File       : vga_control.vhd
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

entity vga_control is
  port(
    s_reset_i           : in std_logic;
    s_clk_i             : in std_logic;
    s_pixel_enable_i    : in std_logic;
    s_red_i             : in std_logic_vector(3 downto 0);
    s_green_i           : in std_logic_vector(3 downto 0);
    s_blue_i            : in std_logic_vector(3 downto 0);
    s_red_o             : out std_logic_vector(3 downto 0);
    s_green_o           : out std_logic_vector(3 downto 0);
    s_blue_o            : out std_logic_vector(3 downto 0);
    s_h_sync_o          : out std_logic;
    s_v_sync_o          : out std_logic;
    s_pixel_counter_o   : out std_logic_vector(9 downto 0);
    s_line_counter_o    : out std_logic_vector(8 downto 0)
  );
end vga_control;

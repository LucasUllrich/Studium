----------------------------------------------------------------------------
-- Title      : Picture Memory Controller
-- Project    : VGA Controller
----------------------------------------------------------------------------
-- File       : mem_ctrl_pic.vhd
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

entity mem_ctrl_pic is
  port(
    s_clk_i           : in std_logic;
    s_reset_i         : in std_logic;
    s_data_i          : in std_logic_vector(11 downto 0);
    s_addr_o          : out std_logic_vector(16 downto 0);
    -- 17 Bit for 76800 Values
    s_rgb_o           : out std_logic_vector(11 downto 0);
    s_pixel_counter_i : in std_logic_vector(9 downto 0);
    s_line_counter_i  : in std_logic_vector(8 downto 0)
  );
end mem_ctrl_pic;

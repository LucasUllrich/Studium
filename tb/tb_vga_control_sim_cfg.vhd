----------------------------------------------------------------------------
-- Title      : VGA Control
-- Project    : VGA Controller
----------------------------------------------------------------------------
-- File       : tb_vga_control_sim_cfg.vhd
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

configuration tb_vga_control_sim_cfg of tb_vga_control is
  for sim
    for i_vga_control : vga_control
      use configuration work.vga_control_rtl_cfg;
    end for;
  end for;
end tb_vga_control_sim_cfg;

----------------------------------------------------------------------------
-- Title      : Picture Memory Controller
-- Project    : VGA Controller
----------------------------------------------------------------------------
-- File       : tb_mem_ctrl_pic_sim.vhd
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

architecture sim of tb_mem_ctrl_pic is
  component mem_ctrl_pic is
    port(
      s_clk_i           : in std_logic;
      s_reset_i         : in std_logic;
      s_data_i          : in std_logic_vector(11 downto 0);
      s_addr_o          : out std_logic_vector(16 downto 0);
      s_rgb_o           : out std_logic_vector(11 downto 0);
      s_pixel_counter_i : in std_logic_vector(9 downto 0);
      s_line_counter_i  : in std_logic_vector(8 downto 0)
    );
  end component;

  signal s_clk_i           : std_logic;
  signal s_reset_i         : std_logic;
  signal s_data_i          : std_logic_vector(11 downto 0);
  signal s_addr_o          : std_logic_vector(16 downto 0);
  signal s_rgb_o           : std_logic_vector(11 downto 0);
  signal s_pixel_counter_i : std_logic_vector(9 downto 0);
  signal s_line_counter_i  : std_logic_vector(8 downto 0);

  begin
    i_mem_ctrl_pic : mem_ctrl_pic
    port map(
    s_clk_i           => s_clk_i,
    s_reset_i         => s_reset_i,
    s_data_i          => s_data_i,
    s_addr_o          => s_addr_o,
    s_rgb_o           => s_rgb_o,
    s_pixel_counter_i => s_pixel_counter_i,
    s_line_counter_i  => s_line_counter_i
    );

    P_reset : process
    begin
      s_reset_i <= '1';
      wait for 5 ns;
      s_reset_i <= '0';
      wait;
    end process;


    P_

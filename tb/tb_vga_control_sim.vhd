----------------------------------------------------------------------------
-- Title      : VGA Control
-- Project    : VGA Controller
----------------------------------------------------------------------------
-- File       : tb_vga_control_sim.vhd
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

architecture sim of tb_vga_control is

component vga_control
port(
  s_reset_i         : in std_logic;
  s_clk_i           : in std_logic;
  s_pixel_enable_i  : in std_logic;
  s_red_i           : in std_logic_vector(3 downto 0);
  s_green_i         : in std_logic_vector(3 downto 0);
  s_blue_i          : in std_logic_vector(3 downto 0);
  s_red_o           : out std_logic_vector(3 downto 0);
  s_green_o         : out std_logic_vector(3 downto 0);
  s_blue_o          : out std_logic_vector(3 downto 0);
  s_h_sync_o        : out std_logic;
  s_v_sync_o        : out std_logic;
  s_pixel_counter_o : out std_logic_vector(9 downto 0);
  s_line_counter_o  : out std_logic_vector(8 downto 0)
);
end component;

signal s_reset_i         : std_logic;
signal s_clk_i           : std_logic;
signal s_pixel_enable_i  : std_logic;
signal s_red_i           : std_logic_vector(3 downto 0) := "0000";
signal s_green_i         : std_logic_vector(3 downto 0) := "0000";
signal s_blue_i          : std_logic_vector(3 downto 0) := "0000";
signal s_red_o           : std_logic_vector(3 downto 0);
signal s_green_o         : std_logic_vector(3 downto 0);
signal s_blue_o          : std_logic_vector(3 downto 0);
signal s_h_sync_o        : std_logic;
signal s_v_sync_o        : std_logic;
signal s_pixel_counter_o : std_logic_vector(9 downto 0);
signal s_line_counter_o  : std_logic_vector(8 downto 0);

begin
  i_vga_control : vga_control
  port map (
  s_reset_i         => s_reset_i,
  s_clk_i           => s_clk_i,
  s_pixel_enable_i  => s_pixel_enable_i,
  s_red_i           => s_red_i,
  s_green_i         => s_green_i,
  s_blue_i          => s_blue_i,
  s_red_o           => s_red_o,
  s_green_o         => s_green_o,
  s_blue_o          => s_blue_o,
  s_h_sync_o        => s_h_sync_o,
  s_v_sync_o        => s_v_sync_o,
  s_pixel_counter_o => s_pixel_counter_o,
  s_line_counter_o  => s_line_counter_o
  );

  P_reset : process
  begin
    s_reset_i <= '1';
    wait for 5 ns;
    s_reset_i <= '0';
    wait;
  end process;

  P_clk : process
  begin
    s_clk_i <= '1';
    wait for 5 ns;
    s_clk_i <= '0';
    wait for 5 ns;
  end process;

  P_pixel_enable : process
  begin
    s_pixel_enable_i <= '1';
    wait for 10 ns;
    s_pixel_enable_i <= '0';
    wait for 30 ns;
  end process;

  P_rgb_set : process
  begin
    s_red_i <= std_logic_vector(unsigned(s_red_i) + 1);
    s_green_i <= std_logic_vector(unsigned(s_green_i) + 1);
    s_blue_i <= std_logic_vector(unsigned(s_blue_i) + 1);
    wait for 40 ns;
  end process;

end sim;

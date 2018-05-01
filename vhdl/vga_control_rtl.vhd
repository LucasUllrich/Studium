----------------------------------------------------------------------------
-- Title      : VGA Control
-- Project    : VGA Controller
----------------------------------------------------------------------------
-- File       : vga_control_rtl.vhd
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

architecture rtl of vga_control is

constant C_h_sync_period_encountval : std_logic_vector(9 downto 0) :=
    B"11_0001_1111";              -- subtracted 1 due to restart structure
constant C_h_sync_pulse_encountval  : std_logic_vector(6 downto 0)  :=
    B"110_0000";
constant C_v_sync_period_encountval : std_logic_vector(18 downto 0) :=
    B"110_0110_1000_1001_1111";   -- subtracted 1 due to restart structure
constant C_v_sync_pulse_encountval  : std_logic_vector(10 downto 0) :=
    B"110_0100_0000";
constant C_line_numbers             : std_logic_vector(8 downto 0) :=
    B"1_1101_1111";
constant C_h_back_porch_encount     : std_logic_vector(7 downto 0) :=
    B"1000_1111";                 -- subtracted 0 due to stop/restart structure
constant C_h_front_porch_encount    : std_logic_vector(9 downto 0) :=
    B"11_0001_0000";              -- subtracted 1 due to restart structure
constant C_v_back_porch_encount     : std_logic_vector(14 downto 0) :=
    B"110_1101_0101_1111";
constant C_v_front_porch_encount    : std_logic_vector(18 downto 0) :=
    B"110_0100_1001_0110_0000";


signal s_h_sync_counter : std_logic_vector(9 downto 0) := B"00_0000_0000";
signal s_v_sync_counter : std_logic_vector(18 downto 0) :=
    B"000_0000_0000_0000_0000";
signal s_line_counter : std_logic_vector(8 downto 0) := B"0_0000_0000";
signal s_pixel_counter : std_logic_vector(9 downto 0) := B"00_0000_0000";
signal s_rgb_data_active  : std_logic;
signal s_lines_active     : std_logic;

begin
  P_h_sync : process (s_clk_i, s_reset_i)
  begin
    if s_reset_i = '1' then
      s_h_sync_counter <= B"00_0000_0000";
      s_h_sync_o <= '1';
      s_rgb_data_active <= '0';
    elsif s_clk_i'event and s_clk_i = '1' then
      if s_pixel_enable_i = '1' then
        s_h_sync_counter <= std_logic_vector(unsigned(s_h_sync_counter) + 1);

        if unsigned(s_h_sync_counter) < unsigned(C_h_sync_pulse_encountval) then
          --
          s_h_sync_o <= '1';
        elsif unsigned(s_h_sync_counter) <
            unsigned(C_h_sync_period_encountval) then
              -- and < C_h_sync_period_encountval is ensured by elsif and the
              -- order of if conditions
          s_h_sync_o <= '0';
        else
          -- ***** Line finished *****
          -- Incrementing line counter after every finished line
          s_line_counter <= B"0_0000_0000";
          if s_lines_active = '1' then
            s_line_counter <= std_logic_vector(unsigned(s_line_counter) + 1);
          end if;
          if s_line_counter >= C_line_numbers then
            s_line_counter <= B"0_0000_0000";
          end if;
          -- Resetting pixel counter (incl porches) per line
          s_h_sync_counter <= B"00_0000_0000";
          s_h_sync_o <= '0';
        end if;

        -- Counting pixel according to data flow
        if s_rgb_data_active = '1' then
          s_pixel_counter <= std_logic_vector(unsigned(s_pixel_counter) + 1);
        end if;

        -- Enabling and disabling data flow
        if unsigned(s_h_sync_counter) > unsigned(C_h_back_porch_encount) and
            unsigned(s_h_sync_counter) < unsigned(C_h_front_porch_encount) then
          s_rgb_data_active <= '1';
        else
          s_rgb_data_active <= '0';
          s_pixel_counter <= B"00_0000_0000";
        end if;
      end if;
    end if;
  end process P_h_sync;
  s_pixel_counter_o <= s_pixel_counter;
  s_line_counter_o <= s_line_counter;

  P_v_sync : process (s_clk_i, s_reset_i)
  begin
    if s_reset_i = '1' then
      s_v_sync_counter <= B"000_0000_0000_0000_0000";
      s_v_sync_o <= '1';
      s_lines_active <= '0';
    elsif s_clk_i'event and s_clk_i = '1' then
      if s_pixel_enable_i = '1' then
        s_v_sync_counter <= std_logic_vector(unsigned(s_v_sync_counter) + 1);
        if unsigned(s_v_sync_counter) < unsigned(C_v_sync_pulse_encountval) then
          s_v_sync_o <= '1';
        elsif unsigned(s_v_sync_counter) <
            unsigned(C_v_sync_period_encountval) then
              -- and < C_v_sync_period_encountval is ensured by elsif and the
              -- order of if conditions
          s_v_sync_o <= '0';
        else
          s_v_sync_counter <= B"000_0000_0000_0000_0000";
          s_v_sync_o <= '0';
        end if;

        if unsigned(s_v_sync_counter) > unsigned(C_v_back_porch_encount) and
            unsigned(s_v_sync_counter) < unsigned(C_v_front_porch_encount) then
          s_lines_active <= '1';
        else
          s_lines_active <= '0';
        end if;
      end if;
    end if;
  end process P_v_sync;

  P_rgb : process (s_clk_i, s_reset_i)
  begin
    if s_reset_i = '1' then
      s_red_o <= "0000";
      s_green_o <= "0000";
      s_blue_o <= "0000";
    elsif s_clk_i'event and s_clk_i = '1' then
      if s_pixel_enable_i = '1' then
        if s_rgb_data_active = '1' and s_lines_active = '1' then
          s_red_o <= s_red_i;
          s_green_o <= s_green_i;
          s_blue_o <= s_blue_i;
        else
          s_red_o <= "0000";
          s_green_o <= "0000";
          s_blue_o <= "0000";
        end if;
      end if;
    end if;
  end process;

end rtl;

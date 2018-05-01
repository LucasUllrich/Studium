onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /tb_vga_control/s_reset_i
add wave -noupdate -format Logic /tb_vga_control/s_clk_i
add wave -noupdate -format Logic /tb_vga_control/s_pixel_enable_i

add wave -divider PixelInput
add wave -noupdate -format Logic /tb_vga_control/s_red_i
add wave -noupdate -format Logic /tb_vga_control/s_green_i
add wave -noupdate -format Logic /tb_vga_control/s_blue_i

add wave -divider PixelOutput
add wave -noupdate -format Logic /tb_vga_control/s_red_o
add wave -noupdate -format Logic /tb_vga_control/s_green_o
add wave -noupdate -format Logic /tb_vga_control/s_blue_o
add wave -noupdate -format Logic /tb_vga_control/s_pixel_counter_o
add wave -noupdate -format Logic /tb_vga_control/s_line_counter_o

add wave -divider H_SYNC
add wave -noupdate -format Logic /tb_vga_control/s_h_sync_o
add wave -noupdate -radix unsigned -format Logic /tb_vga_control/i_vga_control/s_h_sync_counter
add wave -noupdate -radix unsigned -format Logic /tb_vga_control/s_pixel_counter_o
add wave -noupdate -format Logic /tb_vga_control/i_vga_control/s_rgb_data_active

add wave -divider V_SYNC
add wave -noupdate -format Logic /tb_vga_control/s_v_sync_o
add wave -noupdate -radix unsigned -format Logic /tb_vga_control/i_vga_control/s_v_sync_counter
add wave -noupdate -radix unsigned -format Logic /tb_vga_control/s_line_counter_o
add wave -noupdate -format Logic /tb_vga_control/i_vga_control/s_lines_active

add wave -divider Constants-H_SYNC
add wave -noupdate -radix unsigned -format Logic /tb_vga_control/i_vga_control/C_h_sync_pulse_encountval
add wave -noupdate -radix unsigned -format Logic /tb_vga_control/i_vga_control/C_h_sync_period_encountval

add wave -divider Constants-RGB_Data-H_SYNC
add wave -noupdate -radix unsigned -format Logic /tb_vga_control/i_vga_control/C_h_back_porch_encount
add wave -noupdate -radix unsigned -format Logic /tb_vga_control/i_vga_control/C_h_front_porch_encount


add wave -divider CombinedSignals

TreeUpdate [SetDefaultTree]
WaveRestoreCursors {0 ps}
WaveRestoreZoom {0 ps} {75 ms}
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -signalnamewidth 0
configure wave -justifyvalue left

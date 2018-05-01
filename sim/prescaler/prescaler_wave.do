onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /tb_prescaler/s_reset_i
add wave -noupdate -format Logic /tb_prescaler/s_clk_i
add wave -noupdate -format Logic /tb_prescaler/s_pixel_enable_o

TreeUpdate [SetDefaultTree]
WaveRestoreCursors {0 ps}
WaveRestoreZoom {0 ps} {170 ns}
configure wave -namecolwidth 200
configure wave -valuecolwidth 100
configure wave -signalnamewidth 0
configure wave -justifyvalue left

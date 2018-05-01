vsim -t ns -novopt -lib work work.tb_vga_control_sim_cfg
log -r /*
view *
do vga_control_wave.do
run 70 ms

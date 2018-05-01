onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+spaceinvader -L unisims_ver -L unimacro_ver -L secureip -L xil_defaultlib -L xpm -L blk_mem_gen_v8_3_2 -O5 xil_defaultlib.spaceinvader xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {spaceinvader.udo}

run -all

endsim

quit -force

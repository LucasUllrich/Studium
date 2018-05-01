onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib spaceinvader_opt

do {wave.do}

view wave
view structure
view signals

do {spaceinvader.udo}

run -all

quit -force

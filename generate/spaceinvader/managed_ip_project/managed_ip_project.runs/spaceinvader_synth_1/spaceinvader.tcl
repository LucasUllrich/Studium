# 
# Synthesis run script generated by Vivado
# 

create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir /home/lullrich/Dokumente/Studium/4_Semester/Chip_Design/Project/VGA_Controller/generate/spaceinvader/managed_ip_project/managed_ip_project.cache/wt [current_project]
set_property parent.project_path /home/lullrich/Dokumente/Studium/4_Semester/Chip_Design/Project/VGA_Controller/generate/spaceinvader/managed_ip_project/managed_ip_project.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
read_ip -quiet /home/lullrich/Dokumente/Studium/4_Semester/Chip_Design/Project/VGA_Controller/generate/spaceinvader/spaceinvader/spaceinvader.xci
set_property is_locked true [get_files /home/lullrich/Dokumente/Studium/4_Semester/Chip_Design/Project/VGA_Controller/generate/spaceinvader/spaceinvader/spaceinvader.xci]

foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]

synth_design -top spaceinvader -part xc7a35tcpg236-1 -mode out_of_context

rename_ref -prefix_all spaceinvader_

write_checkpoint -force -noxdef spaceinvader.dcp

catch { report_utilization -file spaceinvader_utilization_synth.rpt -pb spaceinvader_utilization_synth.pb }

if { [catch {
  file copy -force /home/lullrich/Dokumente/Studium/4_Semester/Chip_Design/Project/VGA_Controller/generate/spaceinvader/managed_ip_project/managed_ip_project.runs/spaceinvader_synth_1/spaceinvader.dcp /home/lullrich/Dokumente/Studium/4_Semester/Chip_Design/Project/VGA_Controller/generate/spaceinvader/spaceinvader/spaceinvader.dcp
} _RESULT ] } { 
  send_msg_id runtcl-3 error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
  error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
}

if { [catch {
  write_verilog -force -mode synth_stub /home/lullrich/Dokumente/Studium/4_Semester/Chip_Design/Project/VGA_Controller/generate/spaceinvader/spaceinvader/spaceinvader_stub.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a Verilog synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  write_vhdl -force -mode synth_stub /home/lullrich/Dokumente/Studium/4_Semester/Chip_Design/Project/VGA_Controller/generate/spaceinvader/spaceinvader/spaceinvader_stub.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a VHDL synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  write_verilog -force -mode funcsim /home/lullrich/Dokumente/Studium/4_Semester/Chip_Design/Project/VGA_Controller/generate/spaceinvader/spaceinvader/spaceinvader_sim_netlist.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the Verilog functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

if { [catch {
  write_vhdl -force -mode funcsim /home/lullrich/Dokumente/Studium/4_Semester/Chip_Design/Project/VGA_Controller/generate/spaceinvader/spaceinvader/spaceinvader_sim_netlist.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the VHDL functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

if {[file isdir /home/lullrich/Dokumente/Studium/4_Semester/Chip_Design/Project/VGA_Controller/generate/spaceinvader/ip_user_files/ip/spaceinvader]} {
  catch { 
    file copy -force /home/lullrich/Dokumente/Studium/4_Semester/Chip_Design/Project/VGA_Controller/generate/spaceinvader/spaceinvader/spaceinvader_stub.v /home/lullrich/Dokumente/Studium/4_Semester/Chip_Design/Project/VGA_Controller/generate/spaceinvader/ip_user_files/ip/spaceinvader
  }
}

if {[file isdir /home/lullrich/Dokumente/Studium/4_Semester/Chip_Design/Project/VGA_Controller/generate/spaceinvader/ip_user_files/ip/spaceinvader]} {
  catch { 
    file copy -force /home/lullrich/Dokumente/Studium/4_Semester/Chip_Design/Project/VGA_Controller/generate/spaceinvader/spaceinvader/spaceinvader_stub.vhdl /home/lullrich/Dokumente/Studium/4_Semester/Chip_Design/Project/VGA_Controller/generate/spaceinvader/ip_user_files/ip/spaceinvader
  }
}

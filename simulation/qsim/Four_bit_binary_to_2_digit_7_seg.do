onerror {exit -code 1}
vlib work
vcom -work work Four_bit_binary_to_2_digit_7_seg.vho
vcom -work work Waveform4.vwf.vht
vsim -c -t 1ps -L cyclonev -L altera -L altera_mf -L 220model -L sgate -L altera_lnsim work.Four_bit_binary_to_2_digit_7_seg_vhd_vec_tst
vcd file -direction Four_bit_binary_to_2_digit_7_seg.msim.vcd
vcd add -internal Four_bit_binary_to_2_digit_7_seg_vhd_vec_tst/*
vcd add -internal Four_bit_binary_to_2_digit_7_seg_vhd_vec_tst/i1/*
proc simTimestamp {} {
    echo "Simulation time: $::now ps"
    if { [string equal running [runStatus]] } {
        after 2500 simTimestamp
    }
}
after 2500 simTimestamp
run -all
quit -f

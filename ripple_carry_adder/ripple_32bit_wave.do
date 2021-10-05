onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /ripple_carry_adder_32_bit_testbench/clk
add wave -noupdate -radix hexadecimal /ripple_carry_adder_32_bit_testbench/A
add wave -noupdate -radix hexadecimal /ripple_carry_adder_32_bit_testbench/B
add wave -noupdate -radix hexadecimal /ripple_carry_adder_32_bit_testbench/Cin
add wave -noupdate -radix hexadecimal /ripple_carry_adder_32_bit_testbench/Cout
add wave -noupdate -radix hexadecimal /ripple_carry_adder_32_bit_testbench/expected_Cout
add wave -noupdate -color Orange -radix hexadecimal /ripple_carry_adder_32_bit_testbench/Cout_check
add wave -noupdate -radix hexadecimal /ripple_carry_adder_32_bit_testbench/S
add wave -noupdate -radix hexadecimal /ripple_carry_adder_32_bit_testbench/expected_S
add wave -noupdate -color Orange -radix hexadecimal /ripple_carry_adder_32_bit_testbench/S_check
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {49231 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 402
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {39930 ps} {119800 ps}

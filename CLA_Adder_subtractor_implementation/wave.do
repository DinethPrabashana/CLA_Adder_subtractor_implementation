onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -height 40 /tb_CLA/A
add wave -noupdate -height 40 /tb_CLA/B
add wave -noupdate -height 40 /tb_CLA/SEL
add wave -noupdate -height 40 /tb_CLA/SUM
add wave -noupdate -height 40 /tb_CLA/C_OUT
add wave -noupdate -height 40 /tb_CLA/OVERFLOW
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 143
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
WaveRestoreZoom {0 ps} {35 ps}

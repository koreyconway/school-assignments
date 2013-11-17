onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /top_tb/pbr
add wave -noupdate -format Logic /top_tb/pbl
add wave -noupdate -format Logic /top_tb/clk
add wave -noupdate -format Logic /top_tb/rst
add wave -noupdate -format Literal /top_tb/leds_out
add wave -noupdate -format Logic /glbl/GSR
add wave -noupdate -format Logic /top_tb/pbr
add wave -noupdate -format Logic /top_tb/pbl
add wave -noupdate -format Logic /top_tb/clk
add wave -noupdate -format Logic /top_tb/rst
add wave -noupdate -format Literal /top_tb/leds_out
add wave -noupdate -format Logic /top_tb/uut/pbr
add wave -noupdate -format Logic /top_tb/uut/pbl
add wave -noupdate -format Logic /top_tb/uut/clk
add wave -noupdate -format Logic /top_tb/uut/rst
add wave -noupdate -format Literal /top_tb/uut/leds_out
add wave -noupdate -format Literal /top_tb/uut/leds_ctrl
add wave -noupdate -format Literal /top_tb/uut/score
add wave -noupdate -format Logic /top_tb/uut/slowenable
add wave -noupdate -format Logic /top_tb/uut/rout
add wave -noupdate -format Logic /top_tb/uut/winrnd
add wave -noupdate -format Logic /top_tb/uut/leds_on
add wave -noupdate -format Logic /top_tb/uut/clear
add wave -noupdate -format Logic /top_tb/uut/push
add wave -noupdate -format Logic /top_tb/uut/tie
add wave -noupdate -format Logic /top_tb/uut/right
add wave -noupdate -format Logic /top_tb/uut/sypush
add wave -noupdate -format Logic /top_tb/uut/div256/clk
add wave -noupdate -format Logic /top_tb/uut/div256/rst
add wave -noupdate -format Logic /top_tb/uut/div256/slowenable
add wave -noupdate -format Logic /top_tb/uut/div256/senable
add wave -noupdate -format Literal /top_tb/uut/div256/count
add wave -noupdate -format Logic /top_tb/uut/random/slowenable
add wave -noupdate -format Logic /top_tb/uut/random/rst
add wave -noupdate -format Logic /top_tb/uut/random/rout
add wave -noupdate -format Literal /top_tb/uut/random/lfsr
add wave -noupdate -format Logic /top_tb/uut/mc/slowenable
add wave -noupdate -format Logic /top_tb/uut/mc/rout
add wave -noupdate -format Logic /top_tb/uut/mc/winrnd
add wave -noupdate -format Logic /top_tb/uut/mc/clk
add wave -noupdate -format Logic /top_tb/uut/mc/rst
add wave -noupdate -format Logic /top_tb/uut/mc/leds_on
add wave -noupdate -format Literal /top_tb/uut/mc/leds_ctrl
add wave -noupdate -format Logic /top_tb/uut/mc/clear
add wave -noupdate -format Logic /top_tb/uut/mc/reg_leds_on
add wave -noupdate -format Literal /top_tb/uut/mc/reg_leds_ctrl
add wave -noupdate -format Logic /top_tb/uut/mc/reg_clear
add wave -noupdate -format Literal /top_tb/uut/mc/state
add wave -noupdate -format Literal /top_tb/uut/mc/nxtstate
add wave -noupdate -format Logic /top_tb/uut/pushbuttonlatch/pbl
add wave -noupdate -format Logic /top_tb/uut/pushbuttonlatch/pbr
add wave -noupdate -format Logic /top_tb/uut/pushbuttonlatch/clear
add wave -noupdate -format Logic /top_tb/uut/pushbuttonlatch/rst
add wave -noupdate -format Logic /top_tb/uut/pushbuttonlatch/push
add wave -noupdate -format Logic /top_tb/uut/pushbuttonlatch/tie
add wave -noupdate -format Logic /top_tb/uut/pushbuttonlatch/right
add wave -noupdate -format Logic /top_tb/uut/pushbuttonlatch/qr
add wave -noupdate -format Logic /top_tb/uut/pushbuttonlatch/ql
add wave -noupdate -format Logic /top_tb/uut/pushbuttonlatch/tiggerR
add wave -noupdate -format Logic /top_tb/uut/pushbuttonlatch/triggerL
add wave -noupdate -format Logic /top_tb/uut/pushbuttonlatch/triggerR
add wave -noupdate -format Logic /top_tb/uut/pushbuttonlatch/latchR/trigger
add wave -noupdate -format Logic /top_tb/uut/pushbuttonlatch/latchR/clear
add wave -noupdate -format Logic /top_tb/uut/pushbuttonlatch/latchR/rst
add wave -noupdate -format Logic /top_tb/uut/pushbuttonlatch/latchR/q
add wave -noupdate -format Logic /top_tb/uut/pushbuttonlatch/latchR/qx
add wave -noupdate -format Logic /top_tb/uut/pushbuttonlatch/latchL/trigger
add wave -noupdate -format Logic /top_tb/uut/pushbuttonlatch/latchL/clear
add wave -noupdate -format Logic /top_tb/uut/pushbuttonlatch/latchL/rst
add wave -noupdate -format Logic /top_tb/uut/pushbuttonlatch/latchL/q
add wave -noupdate -format Logic /top_tb/uut/pushbuttonlatch/latchL/qx
add wave -noupdate -format Logic /top_tb/uut/sync/push
add wave -noupdate -format Logic /top_tb/uut/sync/clk
add wave -noupdate -format Logic /top_tb/uut/sync/rst
add wave -noupdate -format Logic /top_tb/uut/sync/sypush
add wave -noupdate -format Logic /top_tb/uut/sync/regsyspush
add wave -noupdate -format Logic /top_tb/uut/opp/sypush
add wave -noupdate -format Logic /top_tb/uut/opp/clk
add wave -noupdate -format Logic /top_tb/uut/opp/rst
add wave -noupdate -format Logic /top_tb/uut/opp/winrnd
add wave -noupdate -format Logic /top_tb/uut/opp/regwinrnd
add wave -noupdate -format Logic /top_tb/uut/scorer/clk
add wave -noupdate -format Logic /top_tb/uut/scorer/rst
add wave -noupdate -format Logic /top_tb/uut/scorer/right
add wave -noupdate -format Logic /top_tb/uut/scorer/tie
add wave -noupdate -format Logic /top_tb/uut/scorer/leds_on
add wave -noupdate -format Logic /top_tb/uut/scorer/winrnd
add wave -noupdate -format Literal /top_tb/uut/scorer/score
add wave -noupdate -format Literal /top_tb/uut/scorer/state
add wave -noupdate -format Literal /top_tb/uut/scorer/nxtstate
add wave -noupdate -format Logic /top_tb/uut/scorer/mr
add wave -noupdate -format Literal /top_tb/uut/ledmux/leds_ctrl
add wave -noupdate -format Literal /top_tb/uut/ledmux/score
add wave -noupdate -format Literal /top_tb/uut/ledmux/leds_out
add wave -noupdate -format Literal /top_tb/uut/ledmux/leds_out_reg
add wave -noupdate -format Logic /glbl/GSR
add wave -noupdate -format Logic /glbl/GTS
add wave -noupdate -format Logic /glbl/GWE
add wave -noupdate -format Logic /glbl/PRLD
add wave -noupdate -format Logic /glbl/p_up_tmp
add wave -noupdate -format Logic /glbl/PLL_LOCKG
add wave -noupdate -format Logic /glbl/GSR_int
add wave -noupdate -format Logic /glbl/GTS_int
add wave -noupdate -format Logic /glbl/PRLD_int
add wave -noupdate -format Logic /glbl/JTAG_TDO_GLBL
add wave -noupdate -format Logic /glbl/JTAG_TCK_GLBL
add wave -noupdate -format Logic /glbl/JTAG_TDI_GLBL
add wave -noupdate -format Logic /glbl/JTAG_TMS_GLBL
add wave -noupdate -format Logic /glbl/JTAG_TRST_GLBL
add wave -noupdate -format Logic /glbl/JTAG_CAPTURE_GLBL
add wave -noupdate -format Logic /glbl/JTAG_RESET_GLBL
add wave -noupdate -format Logic /glbl/JTAG_SHIFT_GLBL
add wave -noupdate -format Logic /glbl/JTAG_UPDATE_GLBL
add wave -noupdate -format Logic /glbl/JTAG_RUNTEST_GLBL
add wave -noupdate -format Logic /glbl/JTAG_SEL1_GLBL
add wave -noupdate -format Logic /glbl/JTAG_SEL2_GLBL
add wave -noupdate -format Logic /glbl/JTAG_SEL3_GLBL
add wave -noupdate -format Logic /glbl/JTAG_SEL4_GLBL
add wave -noupdate -format Logic /glbl/JTAG_USER_TDO1_GLBL
add wave -noupdate -format Logic /glbl/JTAG_USER_TDO2_GLBL
add wave -noupdate -format Logic /glbl/JTAG_USER_TDO3_GLBL
add wave -noupdate -format Logic /glbl/JTAG_USER_TDO4_GLBL
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {6836 ps} 0}
configure wave -namecolwidth 150
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
configure wave -timelineunits ps
update
WaveRestoreZoom {9961035 ps} {10002051 ps}

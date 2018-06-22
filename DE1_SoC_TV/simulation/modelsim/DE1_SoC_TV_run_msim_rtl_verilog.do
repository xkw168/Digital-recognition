transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+E:/quartus_prj/EXP_code/digital_recognition_of_fpga/DE1_SoC_TV/Sdram_Control_4Port {E:/quartus_prj/EXP_code/digital_recognition_of_fpga/DE1_SoC_TV/Sdram_Control_4Port/Sdram_PLL.vo}
vlib Sdram_PLL
vmap Sdram_PLL Sdram_PLL
vlog -vlog01compat -work Sdram_PLL +incdir+E:/quartus_prj/EXP_code/digital_recognition_of_fpga/DE1_SoC_TV/Sdram_Control_4Port {E:/quartus_prj/EXP_code/digital_recognition_of_fpga/DE1_SoC_TV/Sdram_Control_4Port/Sdram_PLL.v}
vlog -vlog01compat -work work +incdir+E:/quartus_prj/EXP_code/digital_recognition_of_fpga/DE1_SoC_TV/v {E:/quartus_prj/EXP_code/digital_recognition_of_fpga/DE1_SoC_TV/v/MAC_3.vo}
vlib MAC_3
vmap MAC_3 MAC_3
vlog -vlog01compat -work MAC_3 +incdir+E:/quartus_prj/EXP_code/digital_recognition_of_fpga/DE1_SoC_TV/v {E:/quartus_prj/EXP_code/digital_recognition_of_fpga/DE1_SoC_TV/v/MAC_3.v}
vlog -vlog01compat -work work +incdir+E:/quartus_prj/EXP_code/digital_recognition_of_fpga/DE1_SoC_TV/img_src {E:/quartus_prj/EXP_code/digital_recognition_of_fpga/DE1_SoC_TV/img_src/img_data9.v}
vlog -vlog01compat -work work +incdir+E:/quartus_prj/EXP_code/digital_recognition_of_fpga/DE1_SoC_TV/img_src {E:/quartus_prj/EXP_code/digital_recognition_of_fpga/DE1_SoC_TV/img_src/img_data5.v}
vlog -vlog01compat -work work +incdir+E:/quartus_prj/EXP_code/digital_recognition_of_fpga/DE1_SoC_TV/dsp {E:/quartus_prj/EXP_code/digital_recognition_of_fpga/DE1_SoC_TV/dsp/edge_detection.v}
vlog -vlog01compat -work work +incdir+E:/quartus_prj/EXP_code/digital_recognition_of_fpga/DE1_SoC_TV/dsp {E:/quartus_prj/EXP_code/digital_recognition_of_fpga/DE1_SoC_TV/dsp/digital_recognition.v}
vlog -vlog01compat -work work +incdir+E:/quartus_prj/EXP_code/digital_recognition_of_fpga/DE1_SoC_TV/dsp {E:/quartus_prj/EXP_code/digital_recognition_of_fpga/DE1_SoC_TV/dsp/rectangle.v}
vlog -vlog01compat -work work +incdir+E:/quartus_prj/EXP_code/digital_recognition_of_fpga/DE1_SoC_TV/img_src {E:/quartus_prj/EXP_code/digital_recognition_of_fpga/DE1_SoC_TV/img_src/img_src_xkw.v}
vlog -vlog01compat -work work +incdir+E:/quartus_prj/EXP_code/digital_recognition_of_fpga/DE1_SoC_TV/dsp {E:/quartus_prj/EXP_code/digital_recognition_of_fpga/DE1_SoC_TV/dsp/img_process_xkw.v}
vlog -vlog01compat -work work +incdir+E:/quartus_prj/EXP_code/digital_recognition_of_fpga/DE1_SoC_TV {E:/quartus_prj/EXP_code/digital_recognition_of_fpga/DE1_SoC_TV/DE1_SoC_TV.v}
vlog -vlog01compat -work work +incdir+E:/quartus_prj/EXP_code/digital_recognition_of_fpga/DE1_SoC_TV/chunklib {E:/quartus_prj/EXP_code/digital_recognition_of_fpga/DE1_SoC_TV/chunklib/freq_meters.v}
vlog -vlog01compat -work work +incdir+E:/quartus_prj/EXP_code/digital_recognition_of_fpga/DE1_SoC_TV/chunklib {E:/quartus_prj/EXP_code/digital_recognition_of_fpga/DE1_SoC_TV/chunklib/div_odd.v}
vlog -vlog01compat -work work +incdir+E:/quartus_prj/EXP_code/digital_recognition_of_fpga/DE1_SoC_TV/chunklib {E:/quartus_prj/EXP_code/digital_recognition_of_fpga/DE1_SoC_TV/chunklib/div_even.v}
vlog -vlog01compat -work work +incdir+E:/quartus_prj/EXP_code/digital_recognition_of_fpga/DE1_SoC_TV/chunklib {E:/quartus_prj/EXP_code/digital_recognition_of_fpga/DE1_SoC_TV/chunklib/clk_div.v}
vlog -vlog01compat -work work +incdir+E:/quartus_prj/EXP_code/digital_recognition_of_fpga/DE1_SoC_TV/Sobel {E:/quartus_prj/EXP_code/digital_recognition_of_fpga/DE1_SoC_TV/Sobel/RGB2GREY.v}
vlog -vlog01compat -work work +incdir+E:/quartus_prj/EXP_code/digital_recognition_of_fpga/DE1_SoC_TV/Sdram_Control_4Port {E:/quartus_prj/EXP_code/digital_recognition_of_fpga/DE1_SoC_TV/Sdram_Control_4Port/Sdram_WR_FIFO.v}
vlog -vlog01compat -work work +incdir+E:/quartus_prj/EXP_code/digital_recognition_of_fpga/DE1_SoC_TV/Sdram_Control_4Port {E:/quartus_prj/EXP_code/digital_recognition_of_fpga/DE1_SoC_TV/Sdram_Control_4Port/Sdram_RD_FIFO.v}
vlog -vlog01compat -work work +incdir+E:/quartus_prj/EXP_code/digital_recognition_of_fpga/DE1_SoC_TV/v {E:/quartus_prj/EXP_code/digital_recognition_of_fpga/DE1_SoC_TV/v/YUV422_to_444.v}
vlog -vlog01compat -work work +incdir+E:/quartus_prj/EXP_code/digital_recognition_of_fpga/DE1_SoC_TV/v {E:/quartus_prj/EXP_code/digital_recognition_of_fpga/DE1_SoC_TV/v/YCbCr2RGB.v}
vlog -vlog01compat -work work +incdir+E:/quartus_prj/EXP_code/digital_recognition_of_fpga/DE1_SoC_TV/v {E:/quartus_prj/EXP_code/digital_recognition_of_fpga/DE1_SoC_TV/v/VGA_Ctrl.v}
vlog -vlog01compat -work work +incdir+E:/quartus_prj/EXP_code/digital_recognition_of_fpga/DE1_SoC_TV/v {E:/quartus_prj/EXP_code/digital_recognition_of_fpga/DE1_SoC_TV/v/TD_Detect.v}
vlog -vlog01compat -work work +incdir+E:/quartus_prj/EXP_code/digital_recognition_of_fpga/DE1_SoC_TV/v {E:/quartus_prj/EXP_code/digital_recognition_of_fpga/DE1_SoC_TV/v/SEG7_LUT.v}
vlog -vlog01compat -work work +incdir+E:/quartus_prj/EXP_code/digital_recognition_of_fpga/DE1_SoC_TV/v {E:/quartus_prj/EXP_code/digital_recognition_of_fpga/DE1_SoC_TV/v/Reset_Delay.v}
vlog -vlog01compat -work work +incdir+E:/quartus_prj/EXP_code/digital_recognition_of_fpga/DE1_SoC_TV/v {E:/quartus_prj/EXP_code/digital_recognition_of_fpga/DE1_SoC_TV/v/ITU_656_Decoder.v}
vlog -vlog01compat -work work +incdir+E:/quartus_prj/EXP_code/digital_recognition_of_fpga/DE1_SoC_TV/v {E:/quartus_prj/EXP_code/digital_recognition_of_fpga/DE1_SoC_TV/v/I2C_Controller.v}
vlog -vlog01compat -work work +incdir+E:/quartus_prj/EXP_code/digital_recognition_of_fpga/DE1_SoC_TV/v {E:/quartus_prj/EXP_code/digital_recognition_of_fpga/DE1_SoC_TV/v/I2C_AV_Config.v}
vlog -vlog01compat -work work +incdir+E:/quartus_prj/EXP_code/digital_recognition_of_fpga/DE1_SoC_TV/v {E:/quartus_prj/EXP_code/digital_recognition_of_fpga/DE1_SoC_TV/v/Line_Buffer.v}
vlog -vlog01compat -work work +incdir+E:/quartus_prj/EXP_code/digital_recognition_of_fpga/DE1_SoC_TV/v {E:/quartus_prj/EXP_code/digital_recognition_of_fpga/DE1_SoC_TV/v/DIV.v}
vlog -vlog01compat -work work +incdir+E:/quartus_prj/EXP_code/digital_recognition_of_fpga/DE1_SoC_TV/v {E:/quartus_prj/EXP_code/digital_recognition_of_fpga/DE1_SoC_TV/v/AUDIO_DAC.v}
vlog -vlog01compat -work work +incdir+E:/quartus_prj/EXP_code/digital_recognition_of_fpga/DE1_SoC_TV/db {E:/quartus_prj/EXP_code/digital_recognition_of_fpga/DE1_SoC_TV/db/altera_mult_add_3rkg.v}
vlog -vlog01compat -work work +incdir+E:/quartus_prj/EXP_code/digital_recognition_of_fpga/DE1_SoC_TV/Sdram_Control_4Port {E:/quartus_prj/EXP_code/digital_recognition_of_fpga/DE1_SoC_TV/Sdram_Control_4Port/Sdram_Control_4Port.v}
vlog -vlog01compat -work work +incdir+E:/quartus_prj/EXP_code/digital_recognition_of_fpga/DE1_SoC_TV/Sdram_Control_4Port {E:/quartus_prj/EXP_code/digital_recognition_of_fpga/DE1_SoC_TV/Sdram_Control_4Port/sdr_data_path.v}
vlog -vlog01compat -work work +incdir+E:/quartus_prj/EXP_code/digital_recognition_of_fpga/DE1_SoC_TV/Sdram_Control_4Port {E:/quartus_prj/EXP_code/digital_recognition_of_fpga/DE1_SoC_TV/Sdram_Control_4Port/control_interface.v}
vlog -vlog01compat -work work +incdir+E:/quartus_prj/EXP_code/digital_recognition_of_fpga/DE1_SoC_TV/Sdram_Control_4Port {E:/quartus_prj/EXP_code/digital_recognition_of_fpga/DE1_SoC_TV/Sdram_Control_4Port/command.v}
vlog -vlog01compat -work Sdram_PLL +incdir+E:/quartus_prj/EXP_code/digital_recognition_of_fpga/DE1_SoC_TV/Sdram_Control_4Port/Sdram_PLL {E:/quartus_prj/EXP_code/digital_recognition_of_fpga/DE1_SoC_TV/Sdram_Control_4Port/Sdram_PLL/Sdram_PLL_0002.v}
vlog -vlog01compat -work MAC_3 +incdir+E:/quartus_prj/EXP_code/digital_recognition_of_fpga/DE1_SoC_TV/v/MAC_3 {E:/quartus_prj/EXP_code/digital_recognition_of_fpga/DE1_SoC_TV/v/MAC_3/MAC_3_0002.v}


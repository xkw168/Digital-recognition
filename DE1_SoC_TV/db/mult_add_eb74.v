//altmult_add ADDNSUB_MULTIPLIER_ACLR1="ACLR0" ADDNSUB_MULTIPLIER_PIPELINE_ACLR1="ACLR0" ADDNSUB_MULTIPLIER_PIPELINE_REGISTER1="CLOCK0" ADDNSUB_MULTIPLIER_REGISTER1="CLOCK0" CBX_DECLARE_ALL_CONNECTED_PORTS="OFF" DEDICATED_MULTIPLIER_CIRCUITRY="AUTO" DEVICE_FAMILY="Cyclone V" DSP_BLOCK_BALANCING="Auto" INPUT_ACLR_A0="ACLR0" INPUT_ACLR_A1="ACLR0" INPUT_ACLR_A2="ACLR0" INPUT_ACLR_B0="ACLR0" INPUT_ACLR_B1="ACLR0" INPUT_ACLR_B2="ACLR0" INPUT_REGISTER_A0="CLOCK0" INPUT_REGISTER_A1="CLOCK0" INPUT_REGISTER_A2="CLOCK0" INPUT_REGISTER_B0="CLOCK0" INPUT_REGISTER_B1="CLOCK0" INPUT_REGISTER_B2="CLOCK0" INPUT_SOURCE_A0="DATAA" INPUT_SOURCE_A1="SCANA" INPUT_SOURCE_A2="SCANA" INPUT_SOURCE_B0="DATAB" INPUT_SOURCE_B1="DATAB" INPUT_SOURCE_B2="DATAB" MULTIPLIER1_DIRECTION="ADD" MULTIPLIER_ACLR0="ACLR0" MULTIPLIER_ACLR1="ACLR0" MULTIPLIER_ACLR2="ACLR0" MULTIPLIER_REGISTER0="CLOCK0" MULTIPLIER_REGISTER1="CLOCK0" MULTIPLIER_REGISTER2="CLOCK0" NUMBER_OF_MULTIPLIERS=3 OUTPUT_ACLR="ACLR0" OUTPUT_REGISTER="CLOCK0" port_addnsub1="PORT_UNUSED" port_signa="PORT_UNUSED" port_signb="PORT_UNUSED" REPRESENTATION_A="UNSIGNED" REPRESENTATION_B="SIGNED" SIGNED_ACLR_A="ACLR0" SIGNED_ACLR_B="ACLR0" SIGNED_PIPELINE_ACLR_A="ACLR0" SIGNED_PIPELINE_ACLR_B="ACLR0" SIGNED_PIPELINE_REGISTER_A="CLOCK0" SIGNED_PIPELINE_REGISTER_B="CLOCK0" SIGNED_REGISTER_A="CLOCK0" SIGNED_REGISTER_B="CLOCK0" WIDTH_A=8 WIDTH_B=8 WIDTH_RESULT=18 aclr0 clock0 dataa datab result CARRY_CHAIN="MANUAL" CARRY_CHAIN_LENGTH=48
//VERSION_BEGIN 16.1 cbx_alt_ded_mult_y 2017:01:18:18:20:37:SJ cbx_altera_mult_add 2017:01:18:18:20:37:SJ cbx_altera_mult_add_rtl 2017:01:18:18:20:37:SJ cbx_altmult_add 2017:01:18:18:20:37:SJ cbx_cycloneii 2017:01:18:18:20:37:SJ cbx_lpm_add_sub 2017:01:18:18:20:37:SJ cbx_lpm_mult 2017:01:18:18:20:37:SJ cbx_mgl 2017:01:18:18:27:06:SJ cbx_nadder 2017:01:18:18:20:37:SJ cbx_padd 2017:01:18:18:20:37:SJ cbx_parallel_add 2017:01:18:18:20:37:SJ cbx_stratix 2017:01:18:18:20:37:SJ cbx_stratixii 2017:01:18:18:20:37:SJ cbx_util_mgl 2017:01:18:18:20:37:SJ  VERSION_END
// synthesis VERILOG_INPUT_VERSION VERILOG_2001
// altera message_off 10463



// Copyright (C) 2017  Intel Corporation. All rights reserved.
//  Your use of Intel Corporation's design tools, logic functions 
//  and other software and tools, and its AMPP partner logic 
//  functions, and any output files from any of the foregoing 
//  (including device programming or simulation files), and any 
//  associated documentation or information are expressly subject 
//  to the terms and conditions of the Intel Program License 
//  Subscription Agreement, the Intel Quartus Prime License Agreement,
//  the Intel MegaCore Function License Agreement, or other 
//  applicable license agreement, including, without limitation, 
//  that your use is for the sole purpose of programming logic 
//  devices manufactured by Intel and sold by Intel or its 
//  authorized distributors.  Please refer to the applicable 
//  agreement for further details.




//altera_mult_add ACCUM_DIRECTION="ADD" ACCUM_SLOAD_ACLR="ACLR0" ACCUM_SLOAD_PIPELINE_ACLR="ACLR0" ACCUM_SLOAD_PIPELINE_REGISTER="CLOCK0" ACCUM_SLOAD_REGISTER="CLOCK0" ACCUMULATOR="NO" ADDER1_ROUNDING="NO" ADDER3_ROUNDING="NO" ADDNSUB1_ROUND_ACLR="ACLR0" ADDNSUB1_ROUND_PIPELINE_ACLR="ACLR0" ADDNSUB1_ROUND_PIPELINE_REGISTER="CLOCK0" ADDNSUB1_ROUND_REGISTER="CLOCK0" ADDNSUB3_ROUND_ACLR="ACLR0" ADDNSUB3_ROUND_PIPELINE_ACLR="ACLR0" ADDNSUB3_ROUND_PIPELINE_REGISTER="CLOCK0" ADDNSUB3_ROUND_REGISTER="CLOCK0" ADDNSUB_MULTIPLIER_ACLR1="ACLR0" ADDNSUB_MULTIPLIER_ACLR3="ACLR0" ADDNSUB_MULTIPLIER_PIPELINE_ACLR1="ACLR0" ADDNSUB_MULTIPLIER_PIPELINE_ACLR3="ACLR0" ADDNSUB_MULTIPLIER_PIPELINE_REGISTER1="CLOCK0" ADDNSUB_MULTIPLIER_PIPELINE_REGISTER3="CLOCK0" ADDNSUB_MULTIPLIER_REGISTER1="CLOCK0" ADDNSUB_MULTIPLIER_REGISTER3="CLOCK0" CBX_DECLARE_ALL_CONNECTED_PORTS="OFF" CHAINOUT_ACLR="ACLR0" CHAINOUT_ADDER="NO" CHAINOUT_REGISTER="CLOCK0" CHAINOUT_ROUND_ACLR="ACLR0" CHAINOUT_ROUND_OUTPUT_ACLR="ACLR0" CHAINOUT_ROUND_OUTPUT_REGISTER="CLOCK0" CHAINOUT_ROUND_PIPELINE_ACLR="ACLR0" CHAINOUT_ROUND_PIPELINE_REGISTER="CLOCK0" CHAINOUT_ROUND_REGISTER="CLOCK0" CHAINOUT_ROUNDING="NO" CHAINOUT_SATURATE_ACLR="ACLR0" CHAINOUT_SATURATE_OUTPUT_ACLR="ACLR0" CHAINOUT_SATURATE_OUTPUT_REGISTER="CLOCK0" CHAINOUT_SATURATE_PIPELINE_ACLR="ACLR0" CHAINOUT_SATURATE_PIPELINE_REGISTER="CLOCK0" CHAINOUT_SATURATE_REGISTER="CLOCK0" CHAINOUT_SATURATION="NO" COEF0_0=0 COEF0_1=0 COEF0_2=0 COEF0_3=0 COEF0_4=0 COEF0_5=0 COEF0_6=0 COEF0_7=0 COEF1_0=0 COEF1_1=0 COEF1_2=0 COEF1_3=0 COEF1_4=0 COEF1_5=0 COEF1_6=0 COEF1_7=0 COEF2_0=0 COEF2_1=0 COEF2_2=0 COEF2_3=0 COEF2_4=0 COEF2_5=0 COEF2_6=0 COEF2_7=0 COEF3_0=0 COEF3_1=0 COEF3_2=0 COEF3_3=0 COEF3_4=0 COEF3_5=0 COEF3_6=0 COEF3_7=0 COEFSEL0_ACLR="ACLR0" COEFSEL0_REGISTER="CLOCK0" COEFSEL1_ACLR="ACLR0" COEFSEL1_REGISTER="CLOCK0" COEFSEL2_ACLR="ACLR0" COEFSEL2_REGISTER="CLOCK0" COEFSEL3_ACLR="ACLR0" COEFSEL3_REGISTER="CLOCK0" DEDICATED_MULTIPLIER_CIRCUITRY="AUTO" DEVICE_FAMILY="Cyclone V" DOUBLE_ACCUM="NO" DSP_BLOCK_BALANCING="Auto" EXTRA_LATENCY=0 INPUT_ACLR_A0="ACLR0" INPUT_ACLR_A1="ACLR0" INPUT_ACLR_A2="ACLR0" INPUT_ACLR_A3="ACLR0" INPUT_ACLR_B0="ACLR0" INPUT_ACLR_B1="ACLR0" INPUT_ACLR_B2="ACLR0" INPUT_ACLR_B3="ACLR0" INPUT_ACLR_C0="ACLR0" INPUT_ACLR_C1="ACLR0" INPUT_ACLR_C2="ACLR0" INPUT_ACLR_C3="ACLR0" INPUT_REGISTER_A0="CLOCK0" INPUT_REGISTER_A1="CLOCK0" INPUT_REGISTER_A2="CLOCK0" INPUT_REGISTER_A3="CLOCK0" INPUT_REGISTER_B0="CLOCK0" INPUT_REGISTER_B1="CLOCK0" INPUT_REGISTER_B2="CLOCK0" INPUT_REGISTER_B3="CLOCK0" INPUT_REGISTER_C0="CLOCK0" INPUT_REGISTER_C1="CLOCK0" INPUT_REGISTER_C2="CLOCK0" INPUT_REGISTER_C3="CLOCK0" INPUT_SOURCE_A0="DATAA" INPUT_SOURCE_A1="SCANA" INPUT_SOURCE_A2="SCANA" INPUT_SOURCE_A3="DATAA" INPUT_SOURCE_B0="DATAB" INPUT_SOURCE_B1="DATAB" INPUT_SOURCE_B2="DATAB" INPUT_SOURCE_B3="DATAB" LOADCONST_CONTROL_ACLR="ACLR0" LOADCONST_CONTROL_REGISTER="CLOCK0" LOADCONST_VALUE=64 MULT01_ROUND_ACLR="ACLR0" MULT01_ROUND_REGISTER="CLOCK0" MULT01_SATURATION_ACLR="ACLR1" MULT01_SATURATION_REGISTER="CLOCK0" MULT23_ROUND_ACLR="ACLR0" MULT23_ROUND_REGISTER="CLOCK0" MULT23_SATURATION_ACLR="ACLR0" MULT23_SATURATION_REGISTER="CLOCK0" MULTIPLIER01_ROUNDING="NO" MULTIPLIER01_SATURATION="NO" MULTIPLIER1_DIRECTION="ADD" MULTIPLIER23_ROUNDING="NO" MULTIPLIER23_SATURATION="NO" MULTIPLIER3_DIRECTION="ADD" MULTIPLIER_ACLR0="ACLR0" MULTIPLIER_ACLR1="ACLR0" MULTIPLIER_ACLR2="ACLR0" MULTIPLIER_ACLR3="ACLR0" MULTIPLIER_REGISTER0="CLOCK0" MULTIPLIER_REGISTER1="CLOCK0" MULTIPLIER_REGISTER2="CLOCK0" MULTIPLIER_REGISTER3="CLOCK0" NUMBER_OF_MULTIPLIERS=3 OUTPUT_ACLR="ACLR0" OUTPUT_REGISTER="CLOCK0" OUTPUT_ROUND_ACLR="ACLR0" OUTPUT_ROUND_PIPELINE_ACLR="ACLR0" OUTPUT_ROUND_PIPELINE_REGISTER="CLOCK0" OUTPUT_ROUND_REGISTER="CLOCK0" OUTPUT_ROUND_TYPE="NEAREST_INTEGER" OUTPUT_ROUNDING="NO" OUTPUT_SATURATE_ACLR="ACLR0" OUTPUT_SATURATE_PIPELINE_ACLR="ACLR0" OUTPUT_SATURATE_PIPELINE_REGISTER="CLOCK0" OUTPUT_SATURATE_REGISTER="CLOCK0" OUTPUT_SATURATE_TYPE="ASYMMETRIC" OUTPUT_SATURATION="NO" port_addnsub1="PORT_UNUSED" port_addnsub3="PORT_UNUSED" PORT_CHAINOUT_SAT_IS_OVERFLOW="PORT_UNUSED" PORT_OUTPUT_IS_OVERFLOW="PORT_UNUSED" port_signa="PORT_UNUSED" port_signb="PORT_UNUSED" PREADDER_DIRECTION_0="ADD" PREADDER_DIRECTION_1="ADD" PREADDER_DIRECTION_2="ADD" PREADDER_DIRECTION_3="ADD" PREADDER_MODE="SIMPLE" REPRESENTATION_A="UNSIGNED" REPRESENTATION_B="SIGNED" ROTATE_ACLR="ACLR0" ROTATE_OUTPUT_ACLR="ACLR0" ROTATE_OUTPUT_REGISTER="CLOCK0" ROTATE_PIPELINE_ACLR="ACLR0" ROTATE_PIPELINE_REGISTER="CLOCK0" ROTATE_REGISTER="CLOCK0" SCANOUTA_ACLR="ACLR0" SCANOUTA_REGISTER="UNREGISTERED" SELECTED_DEVICE_FAMILY="Cyclone V" SHIFT_MODE="NO" SHIFT_RIGHT_ACLR="ACLR0" SHIFT_RIGHT_OUTPUT_ACLR="ACLR0" SHIFT_RIGHT_OUTPUT_REGISTER="CLOCK0" SHIFT_RIGHT_PIPELINE_ACLR="ACLR0" SHIFT_RIGHT_PIPELINE_REGISTER="CLOCK0" SHIFT_RIGHT_REGISTER="CLOCK0" SIGNED_ACLR_A="ACLR0" SIGNED_ACLR_B="ACLR0" SIGNED_PIPELINE_ACLR_A="ACLR0" SIGNED_PIPELINE_ACLR_B="ACLR0" SIGNED_PIPELINE_REGISTER_A="CLOCK0" SIGNED_PIPELINE_REGISTER_B="CLOCK0" SIGNED_REGISTER_A="CLOCK0" SIGNED_REGISTER_B="CLOCK0" SYSTOLIC_ACLR1="ACLR0" SYSTOLIC_ACLR3="ACLR0" SYSTOLIC_DELAY1="UNREGISTERED" SYSTOLIC_DELAY3="UNREGISTERED" WIDTH_A=8 WIDTH_B=8 WIDTH_C=22 WIDTH_CHAININ=1 WIDTH_COEF=18 WIDTH_MSB=17 WIDTH_RESULT=18 WIDTH_SATURATE_SIGN=1 ZERO_CHAINOUT_OUTPUT_ACLR="ACLR0" ZERO_CHAINOUT_OUTPUT_REGISTER="CLOCK0" ZERO_LOOPBACK_ACLR="ACLR0" ZERO_LOOPBACK_OUTPUT_ACLR="ACLR0" ZERO_LOOPBACK_OUTPUT_REGISTER="CLOCK0" ZERO_LOOPBACK_PIPELINE_ACLR="ACLR0" ZERO_LOOPBACK_PIPELINE_REGISTER="CLOCK0" ZERO_LOOPBACK_REGISTER="CLOCK0" aclr0 clock0 dataa datab ena0 ena1 ena2 ena3 result
//VERSION_BEGIN 16.1 cbx_altera_mult_add 2017:01:18:18:20:37:SJ cbx_altera_mult_add_rtl 2017:01:18:18:20:37:SJ cbx_mgl 2017:01:18:18:27:06:SJ  VERSION_END

//synthesis_resources = altera_mult_add_rtl 1 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  mult_add_eb74_altera_mult_add_116g
	( 
	aclr0,
	clock0,
	dataa,
	datab,
	ena0,
	ena1,
	ena2,
	ena3,
	result) /* synthesis synthesis_clearbox=1 */;
	input   aclr0;
	input   clock0;
	input   [23:0]  dataa;
	input   [23:0]  datab;
	input   ena0;
	input   ena1;
	input   ena2;
	input   ena3;
	output   [17:0]  result;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   aclr0;
	tri1   clock0;
	tri0   [23:0]  dataa;
	tri0   [23:0]  datab;
	tri1   ena0;
	tri1   ena1;
	tri1   ena2;
	tri1   ena3;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  [17:0]   wire_altera_mult_add_rtl2_result;

	altera_mult_add_rtl   altera_mult_add_rtl2
	( 
	.aclr0(aclr0),
	.chainout_sat_overflow(),
	.clock0(clock0),
	.dataa(dataa),
	.datab(datab),
	.ena0(ena0),
	.ena1(ena1),
	.ena2(ena2),
	.ena3(ena3),
	.mult0_is_saturated(),
	.mult1_is_saturated(),
	.mult2_is_saturated(),
	.mult3_is_saturated(),
	.overflow(),
	.result(wire_altera_mult_add_rtl2_result),
	.scanouta(),
	.scanoutb(),
	.accum_sload(1'b0),
	.aclr1(1'b0),
	.aclr2(1'b0),
	.aclr3(1'b0),
	.addnsub1(1'b1),
	.addnsub1_round(1'b0),
	.addnsub3(1'b1),
	.addnsub3_round(1'b0),
	.chainin({1{1'b0}}),
	.chainout_round(1'b0),
	.chainout_saturate(1'b0),
	.clock1(1'b1),
	.clock2(1'b1),
	.clock3(1'b1),
	.coefsel0({3{1'b0}}),
	.coefsel1({3{1'b0}}),
	.coefsel2({3{1'b0}}),
	.coefsel3({3{1'b0}}),
	.datac({66{1'b0}}),
	.mult01_round(1'b0),
	.mult01_saturation(1'b0),
	.mult23_round(1'b0),
	.mult23_saturation(1'b0),
	.negate(1'b0),
	.output_round(1'b0),
	.output_saturate(1'b0),
	.rotate(1'b0),
	.scanina({8{1'b0}}),
	.scaninb({8{1'b0}}),
	.sclr0(1'b0),
	.sclr1(1'b0),
	.sclr2(1'b0),
	.sclr3(1'b0),
	.shift_right(1'b0),
	.signa(1'b0),
	.signb(1'b0),
	.sload_accum(1'b0),
	.sourcea({3{1'b0}}),
	.sourceb({3{1'b0}}),
	.zero_chainout(1'b0),
	.zero_loopback(1'b0)
	);
	defparam
		altera_mult_add_rtl2.accum_direction = "ADD",
		altera_mult_add_rtl2.accum_sload_aclr = "ACLR0",
		altera_mult_add_rtl2.accum_sload_latency_aclr = "NONE",
		altera_mult_add_rtl2.accum_sload_latency_clock = "UNREGISTERED",
		altera_mult_add_rtl2.accum_sload_latency_sclr = "NONE",
		altera_mult_add_rtl2.accum_sload_register = "CLOCK0",
		altera_mult_add_rtl2.accum_sload_sclr = "NONE",
		altera_mult_add_rtl2.accumulator = "NO",
		altera_mult_add_rtl2.adder1_rounding = "NO",
		altera_mult_add_rtl2.adder3_rounding = "NO",
		altera_mult_add_rtl2.addnsub1_round_aclr = "ACLR0",
		altera_mult_add_rtl2.addnsub1_round_pipeline_aclr = "ACLR0",
		altera_mult_add_rtl2.addnsub1_round_pipeline_register = "CLOCK0",
		altera_mult_add_rtl2.addnsub1_round_pipeline_sclr = "NONE",
		altera_mult_add_rtl2.addnsub1_round_register = "CLOCK0",
		altera_mult_add_rtl2.addnsub1_round_sclr = "NONE",
		altera_mult_add_rtl2.addnsub3_round_aclr = "ACLR0",
		altera_mult_add_rtl2.addnsub3_round_pipeline_aclr = "ACLR0",
		altera_mult_add_rtl2.addnsub3_round_pipeline_register = "CLOCK0",
		altera_mult_add_rtl2.addnsub3_round_pipeline_sclr = "NONE",
		altera_mult_add_rtl2.addnsub3_round_register = "CLOCK0",
		altera_mult_add_rtl2.addnsub3_round_sclr = "NONE",
		altera_mult_add_rtl2.addnsub_multiplier_aclr1 = "ACLR0",
		altera_mult_add_rtl2.addnsub_multiplier_aclr3 = "ACLR0",
		altera_mult_add_rtl2.addnsub_multiplier_latency_aclr1 = "NONE",
		altera_mult_add_rtl2.addnsub_multiplier_latency_aclr3 = "NONE",
		altera_mult_add_rtl2.addnsub_multiplier_latency_clock1 = "UNREGISTERED",
		altera_mult_add_rtl2.addnsub_multiplier_latency_clock3 = "UNREGISTERED",
		altera_mult_add_rtl2.addnsub_multiplier_latency_sclr1 = "NONE",
		altera_mult_add_rtl2.addnsub_multiplier_latency_sclr3 = "NONE",
		altera_mult_add_rtl2.addnsub_multiplier_register1 = "CLOCK0",
		altera_mult_add_rtl2.addnsub_multiplier_register3 = "CLOCK0",
		altera_mult_add_rtl2.addnsub_multiplier_sclr1 = "NONE",
		altera_mult_add_rtl2.addnsub_multiplier_sclr3 = "NONE",
		altera_mult_add_rtl2.chainout_aclr = "ACLR0",
		altera_mult_add_rtl2.chainout_adder = "NO",
		altera_mult_add_rtl2.chainout_adder_direction = "ADD",
		altera_mult_add_rtl2.chainout_register = "CLOCK0",
		altera_mult_add_rtl2.chainout_round_aclr = "ACLR0",
		altera_mult_add_rtl2.chainout_round_output_aclr = "ACLR0",
		altera_mult_add_rtl2.chainout_round_output_register = "CLOCK0",
		altera_mult_add_rtl2.chainout_round_output_sclr = "NONE",
		altera_mult_add_rtl2.chainout_round_pipeline_aclr = "ACLR0",
		altera_mult_add_rtl2.chainout_round_pipeline_register = "CLOCK0",
		altera_mult_add_rtl2.chainout_round_pipeline_sclr = "NONE",
		altera_mult_add_rtl2.chainout_round_register = "CLOCK0",
		altera_mult_add_rtl2.chainout_round_sclr = "NONE",
		altera_mult_add_rtl2.chainout_rounding = "NO",
		altera_mult_add_rtl2.chainout_saturate_aclr = "ACLR0",
		altera_mult_add_rtl2.chainout_saturate_output_aclr = "ACLR0",
		altera_mult_add_rtl2.chainout_saturate_output_register = "CLOCK0",
		altera_mult_add_rtl2.chainout_saturate_output_sclr = "NONE",
		altera_mult_add_rtl2.chainout_saturate_pipeline_aclr = "ACLR0",
		altera_mult_add_rtl2.chainout_saturate_pipeline_register = "CLOCK0",
		altera_mult_add_rtl2.chainout_saturate_pipeline_sclr = "NONE",
		altera_mult_add_rtl2.chainout_saturate_register = "CLOCK0",
		altera_mult_add_rtl2.chainout_saturate_sclr = "NONE",
		altera_mult_add_rtl2.chainout_saturation = "NO",
		altera_mult_add_rtl2.chainout_sclr = "NONE",
		altera_mult_add_rtl2.coef0_0 = 0,
		altera_mult_add_rtl2.coef0_1 = 0,
		altera_mult_add_rtl2.coef0_2 = 0,
		altera_mult_add_rtl2.coef0_3 = 0,
		altera_mult_add_rtl2.coef0_4 = 0,
		altera_mult_add_rtl2.coef0_5 = 0,
		altera_mult_add_rtl2.coef0_6 = 0,
		altera_mult_add_rtl2.coef0_7 = 0,
		altera_mult_add_rtl2.coef1_0 = 0,
		altera_mult_add_rtl2.coef1_1 = 0,
		altera_mult_add_rtl2.coef1_2 = 0,
		altera_mult_add_rtl2.coef1_3 = 0,
		altera_mult_add_rtl2.coef1_4 = 0,
		altera_mult_add_rtl2.coef1_5 = 0,
		altera_mult_add_rtl2.coef1_6 = 0,
		altera_mult_add_rtl2.coef1_7 = 0,
		altera_mult_add_rtl2.coef2_0 = 0,
		altera_mult_add_rtl2.coef2_1 = 0,
		altera_mult_add_rtl2.coef2_2 = 0,
		altera_mult_add_rtl2.coef2_3 = 0,
		altera_mult_add_rtl2.coef2_4 = 0,
		altera_mult_add_rtl2.coef2_5 = 0,
		altera_mult_add_rtl2.coef2_6 = 0,
		altera_mult_add_rtl2.coef2_7 = 0,
		altera_mult_add_rtl2.coef3_0 = 0,
		altera_mult_add_rtl2.coef3_1 = 0,
		altera_mult_add_rtl2.coef3_2 = 0,
		altera_mult_add_rtl2.coef3_3 = 0,
		altera_mult_add_rtl2.coef3_4 = 0,
		altera_mult_add_rtl2.coef3_5 = 0,
		altera_mult_add_rtl2.coef3_6 = 0,
		altera_mult_add_rtl2.coef3_7 = 0,
		altera_mult_add_rtl2.coefsel0_aclr = "ACLR0",
		altera_mult_add_rtl2.coefsel0_latency_aclr = "NONE",
		altera_mult_add_rtl2.coefsel0_latency_clock = "UNREGISTERED",
		altera_mult_add_rtl2.coefsel0_latency_sclr = "NONE",
		altera_mult_add_rtl2.coefsel0_register = "CLOCK0",
		altera_mult_add_rtl2.coefsel0_sclr = "NONE",
		altera_mult_add_rtl2.coefsel1_aclr = "ACLR0",
		altera_mult_add_rtl2.coefsel1_latency_aclr = "NONE",
		altera_mult_add_rtl2.coefsel1_latency_clock = "UNREGISTERED",
		altera_mult_add_rtl2.coefsel1_latency_sclr = "NONE",
		altera_mult_add_rtl2.coefsel1_register = "CLOCK0",
		altera_mult_add_rtl2.coefsel1_sclr = "NONE",
		altera_mult_add_rtl2.coefsel2_aclr = "ACLR0",
		altera_mult_add_rtl2.coefsel2_latency_aclr = "NONE",
		altera_mult_add_rtl2.coefsel2_latency_clock = "UNREGISTERED",
		altera_mult_add_rtl2.coefsel2_latency_sclr = "NONE",
		altera_mult_add_rtl2.coefsel2_register = "CLOCK0",
		altera_mult_add_rtl2.coefsel2_sclr = "NONE",
		altera_mult_add_rtl2.coefsel3_aclr = "ACLR0",
		altera_mult_add_rtl2.coefsel3_latency_aclr = "NONE",
		altera_mult_add_rtl2.coefsel3_latency_clock = "UNREGISTERED",
		altera_mult_add_rtl2.coefsel3_latency_sclr = "NONE",
		altera_mult_add_rtl2.coefsel3_register = "CLOCK0",
		altera_mult_add_rtl2.coefsel3_sclr = "NONE",
		altera_mult_add_rtl2.dedicated_multiplier_circuitry = "AUTO",
		altera_mult_add_rtl2.double_accum = "NO",
		altera_mult_add_rtl2.dsp_block_balancing = "Auto",
		altera_mult_add_rtl2.extra_latency = 0,
		altera_mult_add_rtl2.input_a0_latency_aclr = "NONE",
		altera_mult_add_rtl2.input_a0_latency_clock = "UNREGISTERED",
		altera_mult_add_rtl2.input_a0_latency_sclr = "NONE",
		altera_mult_add_rtl2.input_a1_latency_aclr = "NONE",
		altera_mult_add_rtl2.input_a1_latency_clock = "UNREGISTERED",
		altera_mult_add_rtl2.input_a1_latency_sclr = "NONE",
		altera_mult_add_rtl2.input_a2_latency_aclr = "NONE",
		altera_mult_add_rtl2.input_a2_latency_clock = "UNREGISTERED",
		altera_mult_add_rtl2.input_a2_latency_sclr = "NONE",
		altera_mult_add_rtl2.input_a3_latency_aclr = "NONE",
		altera_mult_add_rtl2.input_a3_latency_clock = "UNREGISTERED",
		altera_mult_add_rtl2.input_a3_latency_sclr = "NONE",
		altera_mult_add_rtl2.input_aclr_a0 = "ACLR0",
		altera_mult_add_rtl2.input_aclr_a1 = "ACLR0",
		altera_mult_add_rtl2.input_aclr_a2 = "ACLR0",
		altera_mult_add_rtl2.input_aclr_a3 = "ACLR0",
		altera_mult_add_rtl2.input_aclr_b0 = "ACLR0",
		altera_mult_add_rtl2.input_aclr_b1 = "ACLR0",
		altera_mult_add_rtl2.input_aclr_b2 = "ACLR0",
		altera_mult_add_rtl2.input_aclr_b3 = "ACLR0",
		altera_mult_add_rtl2.input_aclr_c0 = "ACLR0",
		altera_mult_add_rtl2.input_aclr_c1 = "ACLR0",
		altera_mult_add_rtl2.input_aclr_c2 = "ACLR0",
		altera_mult_add_rtl2.input_aclr_c3 = "ACLR0",
		altera_mult_add_rtl2.input_b0_latency_aclr = "NONE",
		altera_mult_add_rtl2.input_b0_latency_clock = "UNREGISTERED",
		altera_mult_add_rtl2.input_b0_latency_sclr = "NONE",
		altera_mult_add_rtl2.input_b1_latency_aclr = "NONE",
		altera_mult_add_rtl2.input_b1_latency_clock = "UNREGISTERED",
		altera_mult_add_rtl2.input_b1_latency_sclr = "NONE",
		altera_mult_add_rtl2.input_b2_latency_aclr = "NONE",
		altera_mult_add_rtl2.input_b2_latency_clock = "UNREGISTERED",
		altera_mult_add_rtl2.input_b2_latency_sclr = "NONE",
		altera_mult_add_rtl2.input_b3_latency_aclr = "NONE",
		altera_mult_add_rtl2.input_b3_latency_clock = "UNREGISTERED",
		altera_mult_add_rtl2.input_b3_latency_sclr = "NONE",
		altera_mult_add_rtl2.input_c0_latency_aclr = "NONE",
		altera_mult_add_rtl2.input_c0_latency_clock = "UNREGISTERED",
		altera_mult_add_rtl2.input_c0_latency_sclr = "NONE",
		altera_mult_add_rtl2.input_c1_latency_aclr = "NONE",
		altera_mult_add_rtl2.input_c1_latency_clock = "UNREGISTERED",
		altera_mult_add_rtl2.input_c1_latency_sclr = "NONE",
		altera_mult_add_rtl2.input_c2_latency_aclr = "NONE",
		altera_mult_add_rtl2.input_c2_latency_clock = "UNREGISTERED",
		altera_mult_add_rtl2.input_c2_latency_sclr = "NONE",
		altera_mult_add_rtl2.input_c3_latency_aclr = "NONE",
		altera_mult_add_rtl2.input_c3_latency_clock = "UNREGISTERED",
		altera_mult_add_rtl2.input_c3_latency_sclr = "NONE",
		altera_mult_add_rtl2.input_register_a0 = "CLOCK0",
		altera_mult_add_rtl2.input_register_a1 = "CLOCK0",
		altera_mult_add_rtl2.input_register_a2 = "CLOCK0",
		altera_mult_add_rtl2.input_register_a3 = "CLOCK0",
		altera_mult_add_rtl2.input_register_b0 = "CLOCK0",
		altera_mult_add_rtl2.input_register_b1 = "CLOCK0",
		altera_mult_add_rtl2.input_register_b2 = "CLOCK0",
		altera_mult_add_rtl2.input_register_b3 = "CLOCK0",
		altera_mult_add_rtl2.input_register_c0 = "CLOCK0",
		altera_mult_add_rtl2.input_register_c1 = "CLOCK0",
		altera_mult_add_rtl2.input_register_c2 = "CLOCK0",
		altera_mult_add_rtl2.input_register_c3 = "CLOCK0",
		altera_mult_add_rtl2.input_sclr_a0 = "NONE",
		altera_mult_add_rtl2.input_sclr_a1 = "NONE",
		altera_mult_add_rtl2.input_sclr_a2 = "NONE",
		altera_mult_add_rtl2.input_sclr_a3 = "NONE",
		altera_mult_add_rtl2.input_sclr_b0 = "NONE",
		altera_mult_add_rtl2.input_sclr_b1 = "NONE",
		altera_mult_add_rtl2.input_sclr_b2 = "NONE",
		altera_mult_add_rtl2.input_sclr_b3 = "NONE",
		altera_mult_add_rtl2.input_sclr_c0 = "NONE",
		altera_mult_add_rtl2.input_sclr_c1 = "NONE",
		altera_mult_add_rtl2.input_sclr_c2 = "NONE",
		altera_mult_add_rtl2.input_sclr_c3 = "NONE",
		altera_mult_add_rtl2.input_source_a0 = "DATAA",
		altera_mult_add_rtl2.input_source_a1 = "SCANA",
		altera_mult_add_rtl2.input_source_a2 = "SCANA",
		altera_mult_add_rtl2.input_source_a3 = "DATAA",
		altera_mult_add_rtl2.input_source_b0 = "DATAB",
		altera_mult_add_rtl2.input_source_b1 = "DATAB",
		altera_mult_add_rtl2.input_source_b2 = "DATAB",
		altera_mult_add_rtl2.input_source_b3 = "DATAB",
		altera_mult_add_rtl2.latency = 0,
		altera_mult_add_rtl2.loadconst_control_aclr = "ACLR0",
		altera_mult_add_rtl2.loadconst_control_register = "CLOCK0",
		altera_mult_add_rtl2.loadconst_control_sclr = "NONE",
		altera_mult_add_rtl2.loadconst_value = 64,
		altera_mult_add_rtl2.mult01_round_aclr = "ACLR0",
		altera_mult_add_rtl2.mult01_round_register = "CLOCK0",
		altera_mult_add_rtl2.mult01_round_sclr = "NONE",
		altera_mult_add_rtl2.mult01_saturation_aclr = "ACLR1",
		altera_mult_add_rtl2.mult01_saturation_register = "CLOCK0",
		altera_mult_add_rtl2.mult01_saturation_sclr = "ACLR0",
		altera_mult_add_rtl2.mult23_round_aclr = "ACLR0",
		altera_mult_add_rtl2.mult23_round_register = "CLOCK0",
		altera_mult_add_rtl2.mult23_round_sclr = "NONE",
		altera_mult_add_rtl2.mult23_saturation_aclr = "ACLR0",
		altera_mult_add_rtl2.mult23_saturation_register = "CLOCK0",
		altera_mult_add_rtl2.mult23_saturation_sclr = "NONE",
		altera_mult_add_rtl2.multiplier01_rounding = "NO",
		altera_mult_add_rtl2.multiplier01_saturation = "NO",
		altera_mult_add_rtl2.multiplier1_direction = "ADD",
		altera_mult_add_rtl2.multiplier23_rounding = "NO",
		altera_mult_add_rtl2.multiplier23_saturation = "NO",
		altera_mult_add_rtl2.multiplier3_direction = "ADD",
		altera_mult_add_rtl2.multiplier_aclr0 = "ACLR0",
		altera_mult_add_rtl2.multiplier_aclr1 = "ACLR0",
		altera_mult_add_rtl2.multiplier_aclr2 = "ACLR0",
		altera_mult_add_rtl2.multiplier_aclr3 = "ACLR0",
		altera_mult_add_rtl2.multiplier_register0 = "CLOCK0",
		altera_mult_add_rtl2.multiplier_register1 = "CLOCK0",
		altera_mult_add_rtl2.multiplier_register2 = "CLOCK0",
		altera_mult_add_rtl2.multiplier_register3 = "CLOCK0",
		altera_mult_add_rtl2.multiplier_sclr0 = "NONE",
		altera_mult_add_rtl2.multiplier_sclr1 = "NONE",
		altera_mult_add_rtl2.multiplier_sclr2 = "NONE",
		altera_mult_add_rtl2.multiplier_sclr3 = "NONE",
		altera_mult_add_rtl2.negate_aclr = "NONE",
		altera_mult_add_rtl2.negate_latency_aclr = "NONE",
		altera_mult_add_rtl2.negate_latency_clock = "UNREGISTERED",
		altera_mult_add_rtl2.negate_latency_sclr = "NONE",
		altera_mult_add_rtl2.negate_register = "UNREGISTERED",
		altera_mult_add_rtl2.negate_sclr = "NONE",
		altera_mult_add_rtl2.number_of_multipliers = 3,
		altera_mult_add_rtl2.output_aclr = "ACLR0",
		altera_mult_add_rtl2.output_register = "CLOCK0",
		altera_mult_add_rtl2.output_round_aclr = "ACLR0",
		altera_mult_add_rtl2.output_round_pipeline_aclr = "ACLR0",
		altera_mult_add_rtl2.output_round_pipeline_register = "CLOCK0",
		altera_mult_add_rtl2.output_round_pipeline_sclr = "NONE",
		altera_mult_add_rtl2.output_round_register = "CLOCK0",
		altera_mult_add_rtl2.output_round_sclr = "NONE",
		altera_mult_add_rtl2.output_round_type = "NEAREST_INTEGER",
		altera_mult_add_rtl2.output_rounding = "NO",
		altera_mult_add_rtl2.output_saturate_aclr = "ACLR0",
		altera_mult_add_rtl2.output_saturate_pipeline_aclr = "ACLR0",
		altera_mult_add_rtl2.output_saturate_pipeline_register = "CLOCK0",
		altera_mult_add_rtl2.output_saturate_pipeline_sclr = "NONE",
		altera_mult_add_rtl2.output_saturate_register = "CLOCK0",
		altera_mult_add_rtl2.output_saturate_sclr = "NONE",
		altera_mult_add_rtl2.output_saturate_type = "ASYMMETRIC",
		altera_mult_add_rtl2.output_saturation = "NO",
		altera_mult_add_rtl2.output_sclr = "NONE",
		altera_mult_add_rtl2.port_addnsub1 = "PORT_UNUSED",
		altera_mult_add_rtl2.port_addnsub3 = "PORT_UNUSED",
		altera_mult_add_rtl2.port_chainout_sat_is_overflow = "PORT_UNUSED",
		altera_mult_add_rtl2.port_negate = "PORT_UNUSED",
		altera_mult_add_rtl2.port_output_is_overflow = "PORT_UNUSED",
		altera_mult_add_rtl2.port_signa = "PORT_UNUSED",
		altera_mult_add_rtl2.port_signb = "PORT_UNUSED",
		altera_mult_add_rtl2.preadder_direction_0 = "ADD",
		altera_mult_add_rtl2.preadder_direction_1 = "ADD",
		altera_mult_add_rtl2.preadder_direction_2 = "ADD",
		altera_mult_add_rtl2.preadder_direction_3 = "ADD",
		altera_mult_add_rtl2.preadder_mode = "SIMPLE",
		altera_mult_add_rtl2.representation_a = "UNSIGNED",
		altera_mult_add_rtl2.representation_b = "SIGNED",
		altera_mult_add_rtl2.rotate_aclr = "ACLR0",
		altera_mult_add_rtl2.rotate_output_aclr = "ACLR0",
		altera_mult_add_rtl2.rotate_output_register = "CLOCK0",
		altera_mult_add_rtl2.rotate_output_sclr = "NONE",
		altera_mult_add_rtl2.rotate_pipeline_aclr = "ACLR0",
		altera_mult_add_rtl2.rotate_pipeline_register = "CLOCK0",
		altera_mult_add_rtl2.rotate_pipeline_sclr = "NONE",
		altera_mult_add_rtl2.rotate_register = "CLOCK0",
		altera_mult_add_rtl2.rotate_sclr = "NONE",
		altera_mult_add_rtl2.scanouta_aclr = "ACLR0",
		altera_mult_add_rtl2.scanouta_register = "UNREGISTERED",
		altera_mult_add_rtl2.scanouta_sclr = "NONE",
		altera_mult_add_rtl2.selected_device_family = "Cyclone V",
		altera_mult_add_rtl2.shift_mode = "NO",
		altera_mult_add_rtl2.shift_right_aclr = "ACLR0",
		altera_mult_add_rtl2.shift_right_output_aclr = "ACLR0",
		altera_mult_add_rtl2.shift_right_output_register = "CLOCK0",
		altera_mult_add_rtl2.shift_right_output_sclr = "NONE",
		altera_mult_add_rtl2.shift_right_pipeline_aclr = "ACLR0",
		altera_mult_add_rtl2.shift_right_pipeline_register = "CLOCK0",
		altera_mult_add_rtl2.shift_right_pipeline_sclr = "NONE",
		altera_mult_add_rtl2.shift_right_register = "CLOCK0",
		altera_mult_add_rtl2.shift_right_sclr = "NONE",
		altera_mult_add_rtl2.signed_aclr_a = "ACLR0",
		altera_mult_add_rtl2.signed_aclr_b = "ACLR0",
		altera_mult_add_rtl2.signed_latency_aclr_a = "NONE",
		altera_mult_add_rtl2.signed_latency_aclr_b = "NONE",
		altera_mult_add_rtl2.signed_latency_clock_a = "UNREGISTERED",
		altera_mult_add_rtl2.signed_latency_clock_b = "UNREGISTERED",
		altera_mult_add_rtl2.signed_latency_sclr_a = "NONE",
		altera_mult_add_rtl2.signed_latency_sclr_b = "NONE",
		altera_mult_add_rtl2.signed_register_a = "CLOCK0",
		altera_mult_add_rtl2.signed_register_b = "CLOCK0",
		altera_mult_add_rtl2.signed_sclr_a = "NONE",
		altera_mult_add_rtl2.signed_sclr_b = "NONE",
		altera_mult_add_rtl2.systolic_aclr1 = "ACLR0",
		altera_mult_add_rtl2.systolic_aclr3 = "ACLR0",
		altera_mult_add_rtl2.systolic_delay1 = "UNREGISTERED",
		altera_mult_add_rtl2.systolic_delay3 = "UNREGISTERED",
		altera_mult_add_rtl2.systolic_sclr1 = "NONE",
		altera_mult_add_rtl2.systolic_sclr3 = "NONE",
		altera_mult_add_rtl2.use_sload_accum_port = "NO",
		altera_mult_add_rtl2.use_subnadd = "NO",
		altera_mult_add_rtl2.width_a = 8,
		altera_mult_add_rtl2.width_b = 8,
		altera_mult_add_rtl2.width_c = 22,
		altera_mult_add_rtl2.width_chainin = 1,
		altera_mult_add_rtl2.width_coef = 18,
		altera_mult_add_rtl2.width_msb = 17,
		altera_mult_add_rtl2.width_result = 18,
		altera_mult_add_rtl2.width_saturate_sign = 1,
		altera_mult_add_rtl2.zero_chainout_output_aclr = "ACLR0",
		altera_mult_add_rtl2.zero_chainout_output_register = "CLOCK0",
		altera_mult_add_rtl2.zero_chainout_output_sclr = "NONE",
		altera_mult_add_rtl2.zero_loopback_aclr = "ACLR0",
		altera_mult_add_rtl2.zero_loopback_output_aclr = "ACLR0",
		altera_mult_add_rtl2.zero_loopback_output_register = "CLOCK0",
		altera_mult_add_rtl2.zero_loopback_output_sclr = "NONE",
		altera_mult_add_rtl2.zero_loopback_pipeline_aclr = "ACLR0",
		altera_mult_add_rtl2.zero_loopback_pipeline_register = "CLOCK0",
		altera_mult_add_rtl2.zero_loopback_pipeline_sclr = "NONE",
		altera_mult_add_rtl2.zero_loopback_register = "CLOCK0",
		altera_mult_add_rtl2.zero_loopback_sclr = "NONE",
		altera_mult_add_rtl2.lpm_type = "altera_mult_add_rtl";
	assign
		result = wire_altera_mult_add_rtl2_result;
endmodule //mult_add_eb74_altera_mult_add_116g

//synthesis_resources = altera_mult_add_rtl 1 dsp_mac 1 reg 18 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  mult_add_eb74
	( 
	aclr0,
	clock0,
	dataa,
	datab,
	result) /* synthesis synthesis_clearbox=1 */;
	input   aclr0;
	input   clock0;
	input   [23:0]  dataa;
	input   [23:0]  datab;
	output   [17:0]  result;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   aclr0;
	tri1   clock0;
	tri0   [23:0]  dataa;
	tri0   [23:0]  datab;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  [17:0]   wire_altera_mult_add1_result;
	wire ena0;
	wire ena1;
	wire ena2;
	wire ena3;

	mult_add_eb74_altera_mult_add_116g   altera_mult_add1
	( 
	.aclr0(aclr0),
	.clock0(clock0),
	.dataa(dataa),
	.datab(datab),
	.ena0(ena0),
	.ena1(ena1),
	.ena2(ena2),
	.ena3(ena3),
	.result(wire_altera_mult_add1_result));
	assign
		ena0 = 1'b1,
		ena1 = 1'b1,
		ena2 = 1'b1,
		ena3 = 1'b1,
		result = wire_altera_mult_add1_result;
endmodule //mult_add_eb74
//VALID FILE

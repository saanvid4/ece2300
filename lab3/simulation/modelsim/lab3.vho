-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 18.1.0 Build 625 09/12/2018 SJ Lite Edition"

-- DATE "10/17/2023 17:37:42"

-- 
-- Device: Altera 5CEBA4F23C7 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	lab3_top IS
    PORT (
	CLK50 : IN std_logic;
	SW : IN std_logic_vector(9 DOWNTO 0);
	KEY : IN std_logic_vector(3 DOWNTO 0);
	RESET_N : IN std_logic;
	LEDR : BUFFER std_logic_vector(9 DOWNTO 0);
	HEX5 : BUFFER std_logic_vector(6 DOWNTO 0);
	HEX4 : BUFFER std_logic_vector(6 DOWNTO 0);
	HEX3 : BUFFER std_logic_vector(6 DOWNTO 0);
	HEX2 : BUFFER std_logic_vector(6 DOWNTO 0);
	HEX1 : BUFFER std_logic_vector(6 DOWNTO 0);
	HEX0 : BUFFER std_logic_vector(6 DOWNTO 0)
	);
END lab3_top;

-- Design Ports Information
-- SW[0]	=>  Location: PIN_U13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- SW[1]	=>  Location: PIN_V13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- SW[2]	=>  Location: PIN_T13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- SW[3]	=>  Location: PIN_T12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- SW[4]	=>  Location: PIN_AA15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- SW[5]	=>  Location: PIN_AB15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- SW[6]	=>  Location: PIN_AA14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- KEY[1]	=>  Location: PIN_W9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- LEDR[0]	=>  Location: PIN_AA2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- LEDR[1]	=>  Location: PIN_AA1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- LEDR[2]	=>  Location: PIN_W2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- LEDR[3]	=>  Location: PIN_Y3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- LEDR[4]	=>  Location: PIN_N2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- LEDR[5]	=>  Location: PIN_N1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- LEDR[6]	=>  Location: PIN_U2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- LEDR[7]	=>  Location: PIN_U1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- LEDR[8]	=>  Location: PIN_L2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- LEDR[9]	=>  Location: PIN_L1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- HEX5[0]	=>  Location: PIN_N9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- HEX5[1]	=>  Location: PIN_M8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- HEX5[2]	=>  Location: PIN_T14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- HEX5[3]	=>  Location: PIN_P14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- HEX5[4]	=>  Location: PIN_C1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- HEX5[5]	=>  Location: PIN_C2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- HEX5[6]	=>  Location: PIN_W19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- HEX4[0]	=>  Location: PIN_U20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- HEX4[1]	=>  Location: PIN_Y20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- HEX4[2]	=>  Location: PIN_V20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- HEX4[3]	=>  Location: PIN_U16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- HEX4[4]	=>  Location: PIN_U15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- HEX4[5]	=>  Location: PIN_Y15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- HEX4[6]	=>  Location: PIN_P9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- HEX3[0]	=>  Location: PIN_Y16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- HEX3[1]	=>  Location: PIN_W16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- HEX3[2]	=>  Location: PIN_Y17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- HEX3[3]	=>  Location: PIN_V16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- HEX3[4]	=>  Location: PIN_U17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- HEX3[5]	=>  Location: PIN_V18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- HEX3[6]	=>  Location: PIN_V19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- HEX2[0]	=>  Location: PIN_Y19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- HEX2[1]	=>  Location: PIN_AB17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- HEX2[2]	=>  Location: PIN_AA10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- HEX2[3]	=>  Location: PIN_Y14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- HEX2[4]	=>  Location: PIN_V14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- HEX2[5]	=>  Location: PIN_AB22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- HEX2[6]	=>  Location: PIN_AB21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- HEX1[0]	=>  Location: PIN_AA20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- HEX1[1]	=>  Location: PIN_AB20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- HEX1[2]	=>  Location: PIN_AA19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- HEX1[3]	=>  Location: PIN_AA18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- HEX1[4]	=>  Location: PIN_AB18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- HEX1[5]	=>  Location: PIN_AA17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- HEX1[6]	=>  Location: PIN_U22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- HEX0[0]	=>  Location: PIN_U21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- HEX0[1]	=>  Location: PIN_V21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- HEX0[2]	=>  Location: PIN_W22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- HEX0[3]	=>  Location: PIN_W21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- HEX0[4]	=>  Location: PIN_Y22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- HEX0[5]	=>  Location: PIN_Y21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- HEX0[6]	=>  Location: PIN_AA22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
-- RESET_N	=>  Location: PIN_P22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- KEY[0]	=>  Location: PIN_U7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- KEY[3]	=>  Location: PIN_M6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- KEY[2]	=>  Location: PIN_M7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- CLK50	=>  Location: PIN_M9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- SW[9]	=>  Location: PIN_AB12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- SW[8]	=>  Location: PIN_AB13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- SW[7]	=>  Location: PIN_AA13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF lab3_top IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_CLK50 : std_logic;
SIGNAL ww_SW : std_logic_vector(9 DOWNTO 0);
SIGNAL ww_KEY : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_RESET_N : std_logic;
SIGNAL ww_LEDR : std_logic_vector(9 DOWNTO 0);
SIGNAL ww_HEX5 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX4 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX3 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX2 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX1 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX0 : std_logic_vector(6 DOWNTO 0);
SIGNAL \SW[0]~input_o\ : std_logic;
SIGNAL \SW[1]~input_o\ : std_logic;
SIGNAL \SW[2]~input_o\ : std_logic;
SIGNAL \SW[3]~input_o\ : std_logic;
SIGNAL \SW[4]~input_o\ : std_logic;
SIGNAL \SW[5]~input_o\ : std_logic;
SIGNAL \SW[6]~input_o\ : std_logic;
SIGNAL \KEY[1]~input_o\ : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \CLK50~input_o\ : std_logic;
SIGNAL \CLK50~inputCLKENA0_outclk\ : std_logic;
SIGNAL \clockGenerator|counter_10MHz|count~0_combout\ : std_logic;
SIGNAL \clockGenerator|counter_10MHz|count~2_combout\ : std_logic;
SIGNAL \clockGenerator|counter_10MHz|count~1_combout\ : std_logic;
SIGNAL \clockGenerator|counter_10MHz|count[1]~DUPLICATE_q\ : std_logic;
SIGNAL \clockGenerator|counter_10MHz|count[2]~DUPLICATE_q\ : std_logic;
SIGNAL \clockGenerator|counter_10MHz|count[0]~DUPLICATE_q\ : std_logic;
SIGNAL \clockGenerator|counter_10MHz|LessThan1~0_combout\ : std_logic;
SIGNAL \clockGenerator|counter_100kHz|count~0_combout\ : std_logic;
SIGNAL \clockGenerator|counter_10MHz|Equal0~0_combout\ : std_logic;
SIGNAL \clockGenerator|counter_1MHz|count~3_combout\ : std_logic;
SIGNAL \clockGenerator|counter_1MHz|count[0]~DUPLICATE_q\ : std_logic;
SIGNAL \clockGenerator|counter_1MHz|count~2_combout\ : std_logic;
SIGNAL \clockGenerator|counter_1MHz|count[1]~DUPLICATE_q\ : std_logic;
SIGNAL \clockGenerator|counter_1MHz|count~0_combout\ : std_logic;
SIGNAL \clockGenerator|counter_1MHz|count[3]~DUPLICATE_q\ : std_logic;
SIGNAL \clockGenerator|counter_1MHz|count~1_combout\ : std_logic;
SIGNAL \clockGenerator|counter_1MHz|count[2]~DUPLICATE_q\ : std_logic;
SIGNAL \clockGenerator|counter_1MHz|rco_out~0_combout\ : std_logic;
SIGNAL \clockGenerator|counter_1MHz|rco_out~combout\ : std_logic;
SIGNAL \clockGenerator|counter_100kHz|count~1_combout\ : std_logic;
SIGNAL \clockGenerator|counter_100kHz|count~3_combout\ : std_logic;
SIGNAL \clockGenerator|counter_100kHz|count[0]~DUPLICATE_q\ : std_logic;
SIGNAL \clockGenerator|counter_100kHz|count~2_combout\ : std_logic;
SIGNAL \clockGenerator|counter_100kHz|count[2]~DUPLICATE_q\ : std_logic;
SIGNAL \clockGenerator|counter_100kHz|LessThan1~0_combout\ : std_logic;
SIGNAL \clockGenerator|counter_1MHz|LessThan1~0_combout\ : std_logic;
SIGNAL \SW[9]~input_o\ : std_logic;
SIGNAL \SW[8]~input_o\ : std_logic;
SIGNAL \clockGenerator|counter_100kHz|rco_out~0_combout\ : std_logic;
SIGNAL \clockGenerator|counter_100kHz|rco_out~combout\ : std_logic;
SIGNAL \clockGenerator|counter_10kHz|count~1_combout\ : std_logic;
SIGNAL \clockGenerator|counter_10kHz|count[2]~DUPLICATE_q\ : std_logic;
SIGNAL \clockGenerator|counter_10kHz|count~3_combout\ : std_logic;
SIGNAL \clockGenerator|counter_10kHz|count[0]~DUPLICATE_q\ : std_logic;
SIGNAL \clockGenerator|counter_10kHz|count~0_combout\ : std_logic;
SIGNAL \clockGenerator|counter_10kHz|count~2_combout\ : std_logic;
SIGNAL \clockGenerator|counter_10kHz|count[1]~DUPLICATE_q\ : std_logic;
SIGNAL \clockGenerator|counter_10kHz|rco_out~0_combout\ : std_logic;
SIGNAL \clockGenerator|counter_10kHz|rco_out~combout\ : std_logic;
SIGNAL \clockGenerator|counter_1kHz|count[0]~DUPLICATE_q\ : std_logic;
SIGNAL \clockGenerator|counter_1kHz|count~0_combout\ : std_logic;
SIGNAL \clockGenerator|counter_1kHz|count[3]~DUPLICATE_q\ : std_logic;
SIGNAL \clockGenerator|counter_1kHz|count~2_combout\ : std_logic;
SIGNAL \clockGenerator|counter_1kHz|count[1]~DUPLICATE_q\ : std_logic;
SIGNAL \clockGenerator|counter_1kHz|count~3_combout\ : std_logic;
SIGNAL \clockGenerator|counter_1kHz|count~1_combout\ : std_logic;
SIGNAL \clockGenerator|counter_1kHz|LessThan1~0_combout\ : std_logic;
SIGNAL \clockGenerator|counter_1kHz|rco_out~0_combout\ : std_logic;
SIGNAL \clockGenerator|counter_1kHz|rco_out~combout\ : std_logic;
SIGNAL \clockGenerator|counter_100Hz|count[3]~DUPLICATE_q\ : std_logic;
SIGNAL \clockGenerator|counter_100Hz|count[2]~DUPLICATE_q\ : std_logic;
SIGNAL \clockGenerator|counter_100Hz|count~3_combout\ : std_logic;
SIGNAL \clockGenerator|counter_100Hz|count[0]~DUPLICATE_q\ : std_logic;
SIGNAL \clockGenerator|counter_100Hz|count~2_combout\ : std_logic;
SIGNAL \clockGenerator|counter_100Hz|count~0_combout\ : std_logic;
SIGNAL \clockGenerator|counter_100Hz|count~1_combout\ : std_logic;
SIGNAL \clockGenerator|counter_100Hz|LessThan1~0_combout\ : std_logic;
SIGNAL \clockGenerator|counter_100Hz|rco_out~0_combout\ : std_logic;
SIGNAL \clockGenerator|counter_100Hz|rco_out~combout\ : std_logic;
SIGNAL \clockGenerator|counter_10Hz|count~2_combout\ : std_logic;
SIGNAL \clockGenerator|counter_10Hz|count[1]~DUPLICATE_q\ : std_logic;
SIGNAL \clockGenerator|counter_10Hz|count~1_combout\ : std_logic;
SIGNAL \clockGenerator|counter_10Hz|count~0_combout\ : std_logic;
SIGNAL \clockGenerator|counter_10Hz|count~3_combout\ : std_logic;
SIGNAL \clockGenerator|counter_10Hz|count[0]~DUPLICATE_q\ : std_logic;
SIGNAL \clockGenerator|counter_10Hz|count[2]~DUPLICATE_q\ : std_logic;
SIGNAL \clockGenerator|counter_10Hz|count[3]~DUPLICATE_q\ : std_logic;
SIGNAL \clockGenerator|counter_10Hz|LessThan1~0_combout\ : std_logic;
SIGNAL \SW[7]~input_o\ : std_logic;
SIGNAL \clockGenerator|counter_10Hz|rco_out~combout\ : std_logic;
SIGNAL \clockGenerator|counter_1Hz|count~0_combout\ : std_logic;
SIGNAL \clockGenerator|counter_1Hz|count~3_combout\ : std_logic;
SIGNAL \clockGenerator|counter_1Hz|count~2_combout\ : std_logic;
SIGNAL \clockGenerator|counter_1Hz|count~1_combout\ : std_logic;
SIGNAL \clockGenerator|counter_1Hz|count[2]~DUPLICATE_q\ : std_logic;
SIGNAL \clockGenerator|counter_1Hz|count[3]~DUPLICATE_q\ : std_logic;
SIGNAL \clockGenerator|counter_1Hz|count[0]~DUPLICATE_q\ : std_logic;
SIGNAL \clockGenerator|counter_1Hz|count[1]~DUPLICATE_q\ : std_logic;
SIGNAL \clockGenerator|counter_1Hz|LessThan1~0_combout\ : std_logic;
SIGNAL \clockGenerator|Mux0~4_combout\ : std_logic;
SIGNAL \clockGenerator|counter_10kHz|LessThan1~0_combout\ : std_logic;
SIGNAL \clockGenerator|Mux0~0_combout\ : std_logic;
SIGNAL \clockGenerator|var_clock~q\ : std_logic;
SIGNAL \RESET_N~input_o\ : std_logic;
SIGNAL \KEY[0]~input_o\ : std_logic;
SIGNAL \KEY[3]~input_o\ : std_logic;
SIGNAL \KEY[2]~input_o\ : std_logic;
SIGNAL \theLab|SCURR~23_combout\ : std_logic;
SIGNAL \theLab|SCURR.a_won~q\ : std_logic;
SIGNAL \theLab|b_count_score|COUNT~0_combout\ : std_logic;
SIGNAL \theLab|SCURR~28_combout\ : std_logic;
SIGNAL \theLab|SCURR.init~q\ : std_logic;
SIGNAL \theLab|SCURR~27_combout\ : std_logic;
SIGNAL \theLab|SCURR.b_false~q\ : std_logic;
SIGNAL \theLab|WideOr3~0_combout\ : std_logic;
SIGNAL \theLab|a_count_score|COUNT~0_combout\ : std_logic;
SIGNAL \theLab|a_count_score|COUNT[2]~1_combout\ : std_logic;
SIGNAL \theLab|a_count_score|Add0~0_combout\ : std_logic;
SIGNAL \theLab|a_count_score|Add0~1_combout\ : std_logic;
SIGNAL \theLab|a_count_score|Add0~2_combout\ : std_logic;
SIGNAL \theLab|Equal1~0_combout\ : std_logic;
SIGNAL \theLab|Selector5~0_combout\ : std_logic;
SIGNAL \theLab|SCURR.false_win~q\ : std_logic;
SIGNAL \theLab|LOAD~1_combout\ : std_logic;
SIGNAL \theLab|Selector0~0_combout\ : std_logic;
SIGNAL \theLab|Selector0~1_combout\ : std_logic;
SIGNAL \theLab|SCURR.start~q\ : std_logic;
SIGNAL \theLab|SCURR~24_combout\ : std_logic;
SIGNAL \theLab|SCURR.led~q\ : std_logic;
SIGNAL \theLab|SCURR~25_combout\ : std_logic;
SIGNAL \theLab|SCURR.countdown~q\ : std_logic;
SIGNAL \theLab|SCURR~26_combout\ : std_logic;
SIGNAL \theLab|SCURR.a_false~q\ : std_logic;
SIGNAL \theLab|b_count_score|COUNT[0]~1_combout\ : std_logic;
SIGNAL \theLab|b_count_score|Add0~0_combout\ : std_logic;
SIGNAL \theLab|b_count_score|Add0~1_combout\ : std_logic;
SIGNAL \theLab|b_count_score|Add0~2_combout\ : std_logic;
SIGNAL \theLab|Equal2~0_combout\ : std_logic;
SIGNAL \theLab|Selector8~0_combout\ : std_logic;
SIGNAL \theLab|SCURR.normal_win~q\ : std_logic;
SIGNAL \theLab|Selector9~0_combout\ : std_logic;
SIGNAL \theLab|SCURR.a_normal_win~q\ : std_logic;
SIGNAL \theLab|Selector10~0_combout\ : std_logic;
SIGNAL \theLab|SCURR.b_normal_win~q\ : std_logic;
SIGNAL \theLab|WideOr3~combout\ : std_logic;
SIGNAL \theLab|LOAD~combout\ : std_logic;
SIGNAL \theLab|Selector6~0_combout\ : std_logic;
SIGNAL \theLab|SCURR.a_false_win~q\ : std_logic;
SIGNAL \theLab|Selector7~0_combout\ : std_logic;
SIGNAL \theLab|SCURR.b_false_win~q\ : std_logic;
SIGNAL \theLab|WideOr4~1_combout\ : std_logic;
SIGNAL \theLab|WideOr5~0_combout\ : std_logic;
SIGNAL \theLab|WideOr4~0_combout\ : std_logic;
SIGNAL \theLab|WideOr0~0_combout\ : std_logic;
SIGNAL \theLab|WideOr5~1_combout\ : std_logic;
SIGNAL \theLab|Equal0~0_combout\ : std_logic;
SIGNAL \theLab|a|ADDRESS~0_combout\ : std_logic;
SIGNAL \theLab|a|Add0~1_combout\ : std_logic;
SIGNAL \theLab|a|Add0~0_combout\ : std_logic;
SIGNAL \theLab|a|ADDRESS[2]~feeder_combout\ : std_logic;
SIGNAL \theLab|c|timer~14_combout\ : std_logic;
SIGNAL \theLab|c|timer~12_combout\ : std_logic;
SIGNAL \theLab|c|timer~10_combout\ : std_logic;
SIGNAL \theLab|c|timer~5_combout\ : std_logic;
SIGNAL \theLab|c|timer~0_combout\ : std_logic;
SIGNAL \theLab|c|Add0~13_sumout\ : std_logic;
SIGNAL \theLab|c|timer~4_combout\ : std_logic;
SIGNAL \theLab|c|Add0~14\ : std_logic;
SIGNAL \theLab|c|Add0~1_sumout\ : std_logic;
SIGNAL \theLab|c|timer~1_combout\ : std_logic;
SIGNAL \theLab|c|Add0~2\ : std_logic;
SIGNAL \theLab|c|Add0~5_sumout\ : std_logic;
SIGNAL \theLab|c|timer~16_combout\ : std_logic;
SIGNAL \theLab|c|Add0~6\ : std_logic;
SIGNAL \theLab|c|Add0~17_sumout\ : std_logic;
SIGNAL \theLab|c|timer~6_combout\ : std_logic;
SIGNAL \theLab|c|Add0~18\ : std_logic;
SIGNAL \theLab|c|Add0~21_sumout\ : std_logic;
SIGNAL \theLab|c|timer~7_combout\ : std_logic;
SIGNAL \theLab|c|timer~8_combout\ : std_logic;
SIGNAL \theLab|c|Add0~22\ : std_logic;
SIGNAL \theLab|c|Add0~25_sumout\ : std_logic;
SIGNAL \theLab|c|timer~9_combout\ : std_logic;
SIGNAL \theLab|c|Add0~26\ : std_logic;
SIGNAL \theLab|c|Add0~29_sumout\ : std_logic;
SIGNAL \theLab|c|timer~11_combout\ : std_logic;
SIGNAL \theLab|c|Add0~30\ : std_logic;
SIGNAL \theLab|c|Add0~33_sumout\ : std_logic;
SIGNAL \theLab|c|timer~13_combout\ : std_logic;
SIGNAL \theLab|c|Add0~34\ : std_logic;
SIGNAL \theLab|c|Add0~37_sumout\ : std_logic;
SIGNAL \theLab|c|timer~15_combout\ : std_logic;
SIGNAL \theLab|c|Add0~38\ : std_logic;
SIGNAL \theLab|c|Add0~9_sumout\ : std_logic;
SIGNAL \theLab|c|timer~2_combout\ : std_logic;
SIGNAL \theLab|c|timer~3_combout\ : std_logic;
SIGNAL \theLab|c|DONE~0_combout\ : std_logic;
SIGNAL \theLab|c|DONE~1_combout\ : std_logic;
SIGNAL \theLab|c|DONE~q\ : std_logic;
SIGNAL \theLab|SCURR~22_combout\ : std_logic;
SIGNAL \theLab|SCURR.ready~q\ : std_logic;
SIGNAL \theLab|SCURR~21_combout\ : std_logic;
SIGNAL \theLab|SCURR.b_won~q\ : std_logic;
SIGNAL \theLab|SIGNAL~combout\ : std_logic;
SIGNAL \theLab|WideOr6~combout\ : std_logic;
SIGNAL \scoreADisplay|WideOr6~0_combout\ : std_logic;
SIGNAL \scoreADisplay|WideOr5~0_combout\ : std_logic;
SIGNAL \scoreADisplay|WideOr4~0_combout\ : std_logic;
SIGNAL \scoreADisplay|WideOr3~0_combout\ : std_logic;
SIGNAL \scoreADisplay|WideOr2~0_combout\ : std_logic;
SIGNAL \scoreADisplay|WideOr1~0_combout\ : std_logic;
SIGNAL \scoreADisplay|WideOr0~0_combout\ : std_logic;
SIGNAL \scoreBDisplay|WideOr6~0_combout\ : std_logic;
SIGNAL \scoreBDisplay|WideOr5~0_combout\ : std_logic;
SIGNAL \scoreBDisplay|WideOr4~0_combout\ : std_logic;
SIGNAL \scoreBDisplay|WideOr3~0_combout\ : std_logic;
SIGNAL \scoreBDisplay|WideOr2~0_combout\ : std_logic;
SIGNAL \scoreBDisplay|WideOr1~0_combout\ : std_logic;
SIGNAL \scoreBDisplay|WideOr0~0_combout\ : std_logic;
SIGNAL \theLab|WideOr1~0_combout\ : std_logic;
SIGNAL \winnerDisplay|Decoder0~0_combout\ : std_logic;
SIGNAL \winnerDisplay|WideOr3~0_combout\ : std_logic;
SIGNAL \theLab|WideOr0~combout\ : std_logic;
SIGNAL \theLab|WideOr5~combout\ : std_logic;
SIGNAL \theLab|WideOr4~combout\ : std_logic;
SIGNAL \theLab|WideOr2~combout\ : std_logic;
SIGNAL \stateDisplay|WideOr6~0_combout\ : std_logic;
SIGNAL \stateDisplay|WideOr5~0_combout\ : std_logic;
SIGNAL \stateDisplay|WideOr4~0_combout\ : std_logic;
SIGNAL \stateDisplay|WideOr3~0_combout\ : std_logic;
SIGNAL \stateDisplay|WideOr2~0_combout\ : std_logic;
SIGNAL \stateDisplay|WideOr1~0_combout\ : std_logic;
SIGNAL \stateDisplay|WideOr0~0_combout\ : std_logic;
SIGNAL \clockGenerator|counter_10MHz|count\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \theLab|a_count_score|COUNT\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clockGenerator|counter_100kHz|count\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \theLab|b_count_score|COUNT\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clockGenerator|counter_10kHz|count\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \theLab|c|timer\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \theLab|a|ADDRESS\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \clockGenerator|counter_10Hz|count\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clockGenerator|counter_1MHz|count\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clockGenerator|counter_1kHz|count\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clockGenerator|counter_1Hz|count\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clockGenerator|counter_100Hz|count\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \theLab|c|ALT_INV_Add0~25_sumout\ : std_logic;
SIGNAL \theLab|c|ALT_INV_Add0~21_sumout\ : std_logic;
SIGNAL \theLab|c|ALT_INV_Add0~17_sumout\ : std_logic;
SIGNAL \theLab|c|ALT_INV_Add0~13_sumout\ : std_logic;
SIGNAL \theLab|c|ALT_INV_Add0~9_sumout\ : std_logic;
SIGNAL \theLab|c|ALT_INV_Add0~5_sumout\ : std_logic;
SIGNAL \theLab|a|ALT_INV_ADDRESS\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \theLab|c|ALT_INV_Add0~1_sumout\ : std_logic;
SIGNAL \clockGenerator|ALT_INV_Mux0~4_combout\ : std_logic;
SIGNAL \theLab|c|ALT_INV_timer\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \theLab|c|ALT_INV_DONE~q\ : std_logic;
SIGNAL \theLab|ALT_INV_SCURR.start~q\ : std_logic;
SIGNAL \theLab|ALT_INV_SCURR.a_normal_win~q\ : std_logic;
SIGNAL \theLab|ALT_INV_SCURR.b_normal_win~q\ : std_logic;
SIGNAL \theLab|b_count_score|ALT_INV_COUNT\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \theLab|a_count_score|ALT_INV_COUNT\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \theLab|ALT_INV_SCURR.b_false_win~q\ : std_logic;
SIGNAL \theLab|ALT_INV_SCURR.a_false_win~q\ : std_logic;
SIGNAL \theLab|ALT_INV_SCURR.normal_win~q\ : std_logic;
SIGNAL \theLab|ALT_INV_SCURR.false_win~q\ : std_logic;
SIGNAL \clockGenerator|counter_100Hz|ALT_INV_count[0]~DUPLICATE_q\ : std_logic;
SIGNAL \clockGenerator|counter_100Hz|ALT_INV_count[2]~DUPLICATE_q\ : std_logic;
SIGNAL \clockGenerator|counter_100Hz|ALT_INV_count[3]~DUPLICATE_q\ : std_logic;
SIGNAL \clockGenerator|counter_1Hz|ALT_INV_count[0]~DUPLICATE_q\ : std_logic;
SIGNAL \clockGenerator|counter_1Hz|ALT_INV_count[1]~DUPLICATE_q\ : std_logic;
SIGNAL \clockGenerator|counter_1Hz|ALT_INV_count[2]~DUPLICATE_q\ : std_logic;
SIGNAL \clockGenerator|counter_1Hz|ALT_INV_count[3]~DUPLICATE_q\ : std_logic;
SIGNAL \clockGenerator|counter_1kHz|ALT_INV_count[0]~DUPLICATE_q\ : std_logic;
SIGNAL \clockGenerator|counter_1kHz|ALT_INV_count[1]~DUPLICATE_q\ : std_logic;
SIGNAL \clockGenerator|counter_1kHz|ALT_INV_count[3]~DUPLICATE_q\ : std_logic;
SIGNAL \clockGenerator|counter_10Hz|ALT_INV_count[0]~DUPLICATE_q\ : std_logic;
SIGNAL \clockGenerator|counter_10Hz|ALT_INV_count[1]~DUPLICATE_q\ : std_logic;
SIGNAL \clockGenerator|counter_10Hz|ALT_INV_count[2]~DUPLICATE_q\ : std_logic;
SIGNAL \clockGenerator|counter_10Hz|ALT_INV_count[3]~DUPLICATE_q\ : std_logic;
SIGNAL \clockGenerator|counter_1MHz|ALT_INV_count[0]~DUPLICATE_q\ : std_logic;
SIGNAL \clockGenerator|counter_1MHz|ALT_INV_count[1]~DUPLICATE_q\ : std_logic;
SIGNAL \clockGenerator|counter_1MHz|ALT_INV_count[2]~DUPLICATE_q\ : std_logic;
SIGNAL \clockGenerator|counter_1MHz|ALT_INV_count[3]~DUPLICATE_q\ : std_logic;
SIGNAL \clockGenerator|counter_10kHz|ALT_INV_count[0]~DUPLICATE_q\ : std_logic;
SIGNAL \clockGenerator|counter_10kHz|ALT_INV_count[1]~DUPLICATE_q\ : std_logic;
SIGNAL \clockGenerator|counter_10kHz|ALT_INV_count[2]~DUPLICATE_q\ : std_logic;
SIGNAL \clockGenerator|counter_10MHz|ALT_INV_count[0]~DUPLICATE_q\ : std_logic;
SIGNAL \clockGenerator|counter_10MHz|ALT_INV_count[1]~DUPLICATE_q\ : std_logic;
SIGNAL \clockGenerator|counter_10MHz|ALT_INV_count[2]~DUPLICATE_q\ : std_logic;
SIGNAL \clockGenerator|counter_100kHz|ALT_INV_count[0]~DUPLICATE_q\ : std_logic;
SIGNAL \clockGenerator|counter_100kHz|ALT_INV_count[2]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_SW[7]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[8]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[9]~input_o\ : std_logic;
SIGNAL \ALT_INV_KEY[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_KEY[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_KEY[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_RESET_N~input_o\ : std_logic;
SIGNAL \clockGenerator|counter_100Hz|ALT_INV_rco_out~combout\ : std_logic;
SIGNAL \clockGenerator|counter_100Hz|ALT_INV_rco_out~0_combout\ : std_logic;
SIGNAL \clockGenerator|counter_1kHz|ALT_INV_rco_out~0_combout\ : std_logic;
SIGNAL \clockGenerator|counter_10kHz|ALT_INV_rco_out~0_combout\ : std_logic;
SIGNAL \theLab|a|ALT_INV_Add0~0_combout\ : std_logic;
SIGNAL \clockGenerator|counter_100Hz|ALT_INV_LessThan1~0_combout\ : std_logic;
SIGNAL \clockGenerator|counter_100Hz|ALT_INV_count\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clockGenerator|counter_1Hz|ALT_INV_LessThan1~0_combout\ : std_logic;
SIGNAL \clockGenerator|counter_1Hz|ALT_INV_count\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clockGenerator|counter_1kHz|ALT_INV_LessThan1~0_combout\ : std_logic;
SIGNAL \clockGenerator|counter_1kHz|ALT_INV_count\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clockGenerator|counter_10Hz|ALT_INV_LessThan1~0_combout\ : std_logic;
SIGNAL \clockGenerator|counter_10Hz|ALT_INV_count\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clockGenerator|counter_100kHz|ALT_INV_rco_out~0_combout\ : std_logic;
SIGNAL \clockGenerator|counter_1MHz|ALT_INV_rco_out~0_combout\ : std_logic;
SIGNAL \clockGenerator|counter_10MHz|ALT_INV_Equal0~0_combout\ : std_logic;
SIGNAL \theLab|c|ALT_INV_timer~14_combout\ : std_logic;
SIGNAL \theLab|c|ALT_INV_timer~12_combout\ : std_logic;
SIGNAL \theLab|c|ALT_INV_timer~10_combout\ : std_logic;
SIGNAL \theLab|c|ALT_INV_timer~7_combout\ : std_logic;
SIGNAL \theLab|c|ALT_INV_timer~5_combout\ : std_logic;
SIGNAL \theLab|c|ALT_INV_timer~2_combout\ : std_logic;
SIGNAL \theLab|ALT_INV_Equal0~0_combout\ : std_logic;
SIGNAL \theLab|ALT_INV_WideOr4~1_combout\ : std_logic;
SIGNAL \theLab|ALT_INV_WideOr5~1_combout\ : std_logic;
SIGNAL \theLab|ALT_INV_WideOr0~0_combout\ : std_logic;
SIGNAL \theLab|c|ALT_INV_timer~0_combout\ : std_logic;
SIGNAL \clockGenerator|counter_1MHz|ALT_INV_LessThan1~0_combout\ : std_logic;
SIGNAL \clockGenerator|counter_1MHz|ALT_INV_count\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clockGenerator|counter_10kHz|ALT_INV_LessThan1~0_combout\ : std_logic;
SIGNAL \clockGenerator|counter_10kHz|ALT_INV_count\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clockGenerator|counter_10MHz|ALT_INV_LessThan1~0_combout\ : std_logic;
SIGNAL \clockGenerator|counter_10MHz|ALT_INV_count\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \clockGenerator|counter_100kHz|ALT_INV_LessThan1~0_combout\ : std_logic;
SIGNAL \clockGenerator|counter_100kHz|ALT_INV_count\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \theLab|c|ALT_INV_DONE~0_combout\ : std_logic;
SIGNAL \theLab|ALT_INV_LOAD~combout\ : std_logic;
SIGNAL \theLab|ALT_INV_SCURR.init~q\ : std_logic;
SIGNAL \theLab|ALT_INV_Selector0~0_combout\ : std_logic;
SIGNAL \theLab|ALT_INV_Equal2~0_combout\ : std_logic;
SIGNAL \theLab|ALT_INV_Equal1~0_combout\ : std_logic;
SIGNAL \stateDisplay|ALT_INV_WideOr0~0_combout\ : std_logic;
SIGNAL \theLab|ALT_INV_WideOr2~combout\ : std_logic;
SIGNAL \theLab|ALT_INV_LOAD~1_combout\ : std_logic;
SIGNAL \theLab|ALT_INV_WideOr3~combout\ : std_logic;
SIGNAL \theLab|ALT_INV_WideOr3~0_combout\ : std_logic;
SIGNAL \theLab|ALT_INV_WideOr4~combout\ : std_logic;
SIGNAL \theLab|ALT_INV_WideOr5~combout\ : std_logic;
SIGNAL \theLab|ALT_INV_WideOr5~0_combout\ : std_logic;
SIGNAL \theLab|ALT_INV_WideOr0~combout\ : std_logic;
SIGNAL \theLab|ALT_INV_WideOr1~0_combout\ : std_logic;
SIGNAL \scoreBDisplay|ALT_INV_WideOr0~0_combout\ : std_logic;
SIGNAL \scoreADisplay|ALT_INV_WideOr0~0_combout\ : std_logic;
SIGNAL \theLab|ALT_INV_WideOr6~combout\ : std_logic;
SIGNAL \theLab|ALT_INV_SCURR.b_false~q\ : std_logic;
SIGNAL \theLab|ALT_INV_SCURR.a_false~q\ : std_logic;
SIGNAL \theLab|ALT_INV_WideOr4~0_combout\ : std_logic;
SIGNAL \theLab|ALT_INV_SCURR.countdown~q\ : std_logic;
SIGNAL \theLab|ALT_INV_SCURR.led~q\ : std_logic;
SIGNAL \theLab|ALT_INV_SCURR.a_won~q\ : std_logic;
SIGNAL \theLab|ALT_INV_SCURR.ready~q\ : std_logic;
SIGNAL \theLab|ALT_INV_SCURR.b_won~q\ : std_logic;
SIGNAL \theLab|c|ALT_INV_Add0~37_sumout\ : std_logic;
SIGNAL \theLab|c|ALT_INV_Add0~33_sumout\ : std_logic;
SIGNAL \theLab|c|ALT_INV_Add0~29_sumout\ : std_logic;

BEGIN

ww_CLK50 <= CLK50;
ww_SW <= SW;
ww_KEY <= KEY;
ww_RESET_N <= RESET_N;
LEDR <= ww_LEDR;
HEX5 <= ww_HEX5;
HEX4 <= ww_HEX4;
HEX3 <= ww_HEX3;
HEX2 <= ww_HEX2;
HEX1 <= ww_HEX1;
HEX0 <= ww_HEX0;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\theLab|c|ALT_INV_Add0~25_sumout\ <= NOT \theLab|c|Add0~25_sumout\;
\theLab|c|ALT_INV_Add0~21_sumout\ <= NOT \theLab|c|Add0~21_sumout\;
\theLab|c|ALT_INV_Add0~17_sumout\ <= NOT \theLab|c|Add0~17_sumout\;
\theLab|c|ALT_INV_Add0~13_sumout\ <= NOT \theLab|c|Add0~13_sumout\;
\theLab|c|ALT_INV_Add0~9_sumout\ <= NOT \theLab|c|Add0~9_sumout\;
\theLab|c|ALT_INV_Add0~5_sumout\ <= NOT \theLab|c|Add0~5_sumout\;
\theLab|a|ALT_INV_ADDRESS\(1) <= NOT \theLab|a|ADDRESS\(1);
\theLab|a|ALT_INV_ADDRESS\(2) <= NOT \theLab|a|ADDRESS\(2);
\theLab|c|ALT_INV_Add0~1_sumout\ <= NOT \theLab|c|Add0~1_sumout\;
\clockGenerator|ALT_INV_Mux0~4_combout\ <= NOT \clockGenerator|Mux0~4_combout\;
\theLab|c|ALT_INV_timer\(0) <= NOT \theLab|c|timer\(0);
\theLab|c|ALT_INV_DONE~q\ <= NOT \theLab|c|DONE~q\;
\theLab|ALT_INV_SCURR.start~q\ <= NOT \theLab|SCURR.start~q\;
\theLab|ALT_INV_SCURR.a_normal_win~q\ <= NOT \theLab|SCURR.a_normal_win~q\;
\theLab|ALT_INV_SCURR.b_normal_win~q\ <= NOT \theLab|SCURR.b_normal_win~q\;
\theLab|b_count_score|ALT_INV_COUNT\(3) <= NOT \theLab|b_count_score|COUNT\(3);
\theLab|b_count_score|ALT_INV_COUNT\(2) <= NOT \theLab|b_count_score|COUNT\(2);
\theLab|b_count_score|ALT_INV_COUNT\(1) <= NOT \theLab|b_count_score|COUNT\(1);
\theLab|a_count_score|ALT_INV_COUNT\(3) <= NOT \theLab|a_count_score|COUNT\(3);
\theLab|a_count_score|ALT_INV_COUNT\(2) <= NOT \theLab|a_count_score|COUNT\(2);
\theLab|a_count_score|ALT_INV_COUNT\(1) <= NOT \theLab|a_count_score|COUNT\(1);
\theLab|ALT_INV_SCURR.b_false_win~q\ <= NOT \theLab|SCURR.b_false_win~q\;
\theLab|ALT_INV_SCURR.a_false_win~q\ <= NOT \theLab|SCURR.a_false_win~q\;
\theLab|ALT_INV_SCURR.normal_win~q\ <= NOT \theLab|SCURR.normal_win~q\;
\theLab|ALT_INV_SCURR.false_win~q\ <= NOT \theLab|SCURR.false_win~q\;
\clockGenerator|counter_100Hz|ALT_INV_count[0]~DUPLICATE_q\ <= NOT \clockGenerator|counter_100Hz|count[0]~DUPLICATE_q\;
\clockGenerator|counter_100Hz|ALT_INV_count[2]~DUPLICATE_q\ <= NOT \clockGenerator|counter_100Hz|count[2]~DUPLICATE_q\;
\clockGenerator|counter_100Hz|ALT_INV_count[3]~DUPLICATE_q\ <= NOT \clockGenerator|counter_100Hz|count[3]~DUPLICATE_q\;
\clockGenerator|counter_1Hz|ALT_INV_count[0]~DUPLICATE_q\ <= NOT \clockGenerator|counter_1Hz|count[0]~DUPLICATE_q\;
\clockGenerator|counter_1Hz|ALT_INV_count[1]~DUPLICATE_q\ <= NOT \clockGenerator|counter_1Hz|count[1]~DUPLICATE_q\;
\clockGenerator|counter_1Hz|ALT_INV_count[2]~DUPLICATE_q\ <= NOT \clockGenerator|counter_1Hz|count[2]~DUPLICATE_q\;
\clockGenerator|counter_1Hz|ALT_INV_count[3]~DUPLICATE_q\ <= NOT \clockGenerator|counter_1Hz|count[3]~DUPLICATE_q\;
\clockGenerator|counter_1kHz|ALT_INV_count[0]~DUPLICATE_q\ <= NOT \clockGenerator|counter_1kHz|count[0]~DUPLICATE_q\;
\clockGenerator|counter_1kHz|ALT_INV_count[1]~DUPLICATE_q\ <= NOT \clockGenerator|counter_1kHz|count[1]~DUPLICATE_q\;
\clockGenerator|counter_1kHz|ALT_INV_count[3]~DUPLICATE_q\ <= NOT \clockGenerator|counter_1kHz|count[3]~DUPLICATE_q\;
\clockGenerator|counter_10Hz|ALT_INV_count[0]~DUPLICATE_q\ <= NOT \clockGenerator|counter_10Hz|count[0]~DUPLICATE_q\;
\clockGenerator|counter_10Hz|ALT_INV_count[1]~DUPLICATE_q\ <= NOT \clockGenerator|counter_10Hz|count[1]~DUPLICATE_q\;
\clockGenerator|counter_10Hz|ALT_INV_count[2]~DUPLICATE_q\ <= NOT \clockGenerator|counter_10Hz|count[2]~DUPLICATE_q\;
\clockGenerator|counter_10Hz|ALT_INV_count[3]~DUPLICATE_q\ <= NOT \clockGenerator|counter_10Hz|count[3]~DUPLICATE_q\;
\clockGenerator|counter_1MHz|ALT_INV_count[0]~DUPLICATE_q\ <= NOT \clockGenerator|counter_1MHz|count[0]~DUPLICATE_q\;
\clockGenerator|counter_1MHz|ALT_INV_count[1]~DUPLICATE_q\ <= NOT \clockGenerator|counter_1MHz|count[1]~DUPLICATE_q\;
\clockGenerator|counter_1MHz|ALT_INV_count[2]~DUPLICATE_q\ <= NOT \clockGenerator|counter_1MHz|count[2]~DUPLICATE_q\;
\clockGenerator|counter_1MHz|ALT_INV_count[3]~DUPLICATE_q\ <= NOT \clockGenerator|counter_1MHz|count[3]~DUPLICATE_q\;
\clockGenerator|counter_10kHz|ALT_INV_count[0]~DUPLICATE_q\ <= NOT \clockGenerator|counter_10kHz|count[0]~DUPLICATE_q\;
\clockGenerator|counter_10kHz|ALT_INV_count[1]~DUPLICATE_q\ <= NOT \clockGenerator|counter_10kHz|count[1]~DUPLICATE_q\;
\clockGenerator|counter_10kHz|ALT_INV_count[2]~DUPLICATE_q\ <= NOT \clockGenerator|counter_10kHz|count[2]~DUPLICATE_q\;
\clockGenerator|counter_10MHz|ALT_INV_count[0]~DUPLICATE_q\ <= NOT \clockGenerator|counter_10MHz|count[0]~DUPLICATE_q\;
\clockGenerator|counter_10MHz|ALT_INV_count[1]~DUPLICATE_q\ <= NOT \clockGenerator|counter_10MHz|count[1]~DUPLICATE_q\;
\clockGenerator|counter_10MHz|ALT_INV_count[2]~DUPLICATE_q\ <= NOT \clockGenerator|counter_10MHz|count[2]~DUPLICATE_q\;
\clockGenerator|counter_100kHz|ALT_INV_count[0]~DUPLICATE_q\ <= NOT \clockGenerator|counter_100kHz|count[0]~DUPLICATE_q\;
\clockGenerator|counter_100kHz|ALT_INV_count[2]~DUPLICATE_q\ <= NOT \clockGenerator|counter_100kHz|count[2]~DUPLICATE_q\;
\ALT_INV_SW[7]~input_o\ <= NOT \SW[7]~input_o\;
\ALT_INV_SW[8]~input_o\ <= NOT \SW[8]~input_o\;
\ALT_INV_SW[9]~input_o\ <= NOT \SW[9]~input_o\;
\ALT_INV_KEY[2]~input_o\ <= NOT \KEY[2]~input_o\;
\ALT_INV_KEY[3]~input_o\ <= NOT \KEY[3]~input_o\;
\ALT_INV_KEY[0]~input_o\ <= NOT \KEY[0]~input_o\;
\ALT_INV_RESET_N~input_o\ <= NOT \RESET_N~input_o\;
\clockGenerator|counter_100Hz|ALT_INV_rco_out~combout\ <= NOT \clockGenerator|counter_100Hz|rco_out~combout\;
\clockGenerator|counter_100Hz|ALT_INV_rco_out~0_combout\ <= NOT \clockGenerator|counter_100Hz|rco_out~0_combout\;
\clockGenerator|counter_1kHz|ALT_INV_rco_out~0_combout\ <= NOT \clockGenerator|counter_1kHz|rco_out~0_combout\;
\clockGenerator|counter_10kHz|ALT_INV_rco_out~0_combout\ <= NOT \clockGenerator|counter_10kHz|rco_out~0_combout\;
\theLab|a|ALT_INV_Add0~0_combout\ <= NOT \theLab|a|Add0~0_combout\;
\clockGenerator|counter_100Hz|ALT_INV_LessThan1~0_combout\ <= NOT \clockGenerator|counter_100Hz|LessThan1~0_combout\;
\clockGenerator|counter_100Hz|ALT_INV_count\(0) <= NOT \clockGenerator|counter_100Hz|count\(0);
\clockGenerator|counter_100Hz|ALT_INV_count\(1) <= NOT \clockGenerator|counter_100Hz|count\(1);
\clockGenerator|counter_100Hz|ALT_INV_count\(2) <= NOT \clockGenerator|counter_100Hz|count\(2);
\clockGenerator|counter_100Hz|ALT_INV_count\(3) <= NOT \clockGenerator|counter_100Hz|count\(3);
\clockGenerator|counter_1Hz|ALT_INV_LessThan1~0_combout\ <= NOT \clockGenerator|counter_1Hz|LessThan1~0_combout\;
\clockGenerator|counter_1Hz|ALT_INV_count\(0) <= NOT \clockGenerator|counter_1Hz|count\(0);
\clockGenerator|counter_1Hz|ALT_INV_count\(1) <= NOT \clockGenerator|counter_1Hz|count\(1);
\clockGenerator|counter_1Hz|ALT_INV_count\(2) <= NOT \clockGenerator|counter_1Hz|count\(2);
\clockGenerator|counter_1Hz|ALT_INV_count\(3) <= NOT \clockGenerator|counter_1Hz|count\(3);
\clockGenerator|counter_1kHz|ALT_INV_LessThan1~0_combout\ <= NOT \clockGenerator|counter_1kHz|LessThan1~0_combout\;
\clockGenerator|counter_1kHz|ALT_INV_count\(0) <= NOT \clockGenerator|counter_1kHz|count\(0);
\clockGenerator|counter_1kHz|ALT_INV_count\(1) <= NOT \clockGenerator|counter_1kHz|count\(1);
\clockGenerator|counter_1kHz|ALT_INV_count\(2) <= NOT \clockGenerator|counter_1kHz|count\(2);
\clockGenerator|counter_1kHz|ALT_INV_count\(3) <= NOT \clockGenerator|counter_1kHz|count\(3);
\clockGenerator|counter_10Hz|ALT_INV_LessThan1~0_combout\ <= NOT \clockGenerator|counter_10Hz|LessThan1~0_combout\;
\clockGenerator|counter_10Hz|ALT_INV_count\(0) <= NOT \clockGenerator|counter_10Hz|count\(0);
\clockGenerator|counter_10Hz|ALT_INV_count\(1) <= NOT \clockGenerator|counter_10Hz|count\(1);
\clockGenerator|counter_10Hz|ALT_INV_count\(2) <= NOT \clockGenerator|counter_10Hz|count\(2);
\clockGenerator|counter_10Hz|ALT_INV_count\(3) <= NOT \clockGenerator|counter_10Hz|count\(3);
\clockGenerator|counter_100kHz|ALT_INV_rco_out~0_combout\ <= NOT \clockGenerator|counter_100kHz|rco_out~0_combout\;
\clockGenerator|counter_1MHz|ALT_INV_rco_out~0_combout\ <= NOT \clockGenerator|counter_1MHz|rco_out~0_combout\;
\clockGenerator|counter_10MHz|ALT_INV_Equal0~0_combout\ <= NOT \clockGenerator|counter_10MHz|Equal0~0_combout\;
\theLab|c|ALT_INV_timer~14_combout\ <= NOT \theLab|c|timer~14_combout\;
\theLab|c|ALT_INV_timer~12_combout\ <= NOT \theLab|c|timer~12_combout\;
\theLab|c|ALT_INV_timer~10_combout\ <= NOT \theLab|c|timer~10_combout\;
\theLab|c|ALT_INV_timer~7_combout\ <= NOT \theLab|c|timer~7_combout\;
\theLab|c|ALT_INV_timer~5_combout\ <= NOT \theLab|c|timer~5_combout\;
\theLab|c|ALT_INV_timer~2_combout\ <= NOT \theLab|c|timer~2_combout\;
\theLab|ALT_INV_Equal0~0_combout\ <= NOT \theLab|Equal0~0_combout\;
\theLab|ALT_INV_WideOr4~1_combout\ <= NOT \theLab|WideOr4~1_combout\;
\theLab|ALT_INV_WideOr5~1_combout\ <= NOT \theLab|WideOr5~1_combout\;
\theLab|ALT_INV_WideOr0~0_combout\ <= NOT \theLab|WideOr0~0_combout\;
\theLab|c|ALT_INV_timer~0_combout\ <= NOT \theLab|c|timer~0_combout\;
\theLab|a|ALT_INV_ADDRESS\(0) <= NOT \theLab|a|ADDRESS\(0);
\clockGenerator|counter_1MHz|ALT_INV_LessThan1~0_combout\ <= NOT \clockGenerator|counter_1MHz|LessThan1~0_combout\;
\clockGenerator|counter_1MHz|ALT_INV_count\(0) <= NOT \clockGenerator|counter_1MHz|count\(0);
\clockGenerator|counter_1MHz|ALT_INV_count\(1) <= NOT \clockGenerator|counter_1MHz|count\(1);
\clockGenerator|counter_1MHz|ALT_INV_count\(2) <= NOT \clockGenerator|counter_1MHz|count\(2);
\clockGenerator|counter_1MHz|ALT_INV_count\(3) <= NOT \clockGenerator|counter_1MHz|count\(3);
\clockGenerator|counter_10kHz|ALT_INV_LessThan1~0_combout\ <= NOT \clockGenerator|counter_10kHz|LessThan1~0_combout\;
\clockGenerator|counter_10kHz|ALT_INV_count\(0) <= NOT \clockGenerator|counter_10kHz|count\(0);
\clockGenerator|counter_10kHz|ALT_INV_count\(1) <= NOT \clockGenerator|counter_10kHz|count\(1);
\clockGenerator|counter_10kHz|ALT_INV_count\(2) <= NOT \clockGenerator|counter_10kHz|count\(2);
\clockGenerator|counter_10kHz|ALT_INV_count\(3) <= NOT \clockGenerator|counter_10kHz|count\(3);
\clockGenerator|counter_10MHz|ALT_INV_LessThan1~0_combout\ <= NOT \clockGenerator|counter_10MHz|LessThan1~0_combout\;
\clockGenerator|counter_10MHz|ALT_INV_count\(0) <= NOT \clockGenerator|counter_10MHz|count\(0);
\clockGenerator|counter_10MHz|ALT_INV_count\(1) <= NOT \clockGenerator|counter_10MHz|count\(1);
\clockGenerator|counter_10MHz|ALT_INV_count\(2) <= NOT \clockGenerator|counter_10MHz|count\(2);
\clockGenerator|counter_100kHz|ALT_INV_LessThan1~0_combout\ <= NOT \clockGenerator|counter_100kHz|LessThan1~0_combout\;
\clockGenerator|counter_100kHz|ALT_INV_count\(0) <= NOT \clockGenerator|counter_100kHz|count\(0);
\clockGenerator|counter_100kHz|ALT_INV_count\(1) <= NOT \clockGenerator|counter_100kHz|count\(1);
\clockGenerator|counter_100kHz|ALT_INV_count\(2) <= NOT \clockGenerator|counter_100kHz|count\(2);
\clockGenerator|counter_100kHz|ALT_INV_count\(3) <= NOT \clockGenerator|counter_100kHz|count\(3);
\theLab|c|ALT_INV_DONE~0_combout\ <= NOT \theLab|c|DONE~0_combout\;
\theLab|c|ALT_INV_timer\(8) <= NOT \theLab|c|timer\(8);
\theLab|c|ALT_INV_timer\(7) <= NOT \theLab|c|timer\(7);
\theLab|c|ALT_INV_timer\(6) <= NOT \theLab|c|timer\(6);
\theLab|c|ALT_INV_timer\(5) <= NOT \theLab|c|timer\(5);
\theLab|c|ALT_INV_timer\(4) <= NOT \theLab|c|timer\(4);
\theLab|c|ALT_INV_timer\(3) <= NOT \theLab|c|timer\(3);
\theLab|ALT_INV_LOAD~combout\ <= NOT \theLab|LOAD~combout\;
\theLab|c|ALT_INV_timer\(9) <= NOT \theLab|c|timer\(9);
\theLab|c|ALT_INV_timer\(2) <= NOT \theLab|c|timer\(2);
\theLab|c|ALT_INV_timer\(1) <= NOT \theLab|c|timer\(1);
\theLab|ALT_INV_SCURR.init~q\ <= NOT \theLab|SCURR.init~q\;
\theLab|ALT_INV_Selector0~0_combout\ <= NOT \theLab|Selector0~0_combout\;
\theLab|ALT_INV_Equal2~0_combout\ <= NOT \theLab|Equal2~0_combout\;
\theLab|ALT_INV_Equal1~0_combout\ <= NOT \theLab|Equal1~0_combout\;
\stateDisplay|ALT_INV_WideOr0~0_combout\ <= NOT \stateDisplay|WideOr0~0_combout\;
\theLab|ALT_INV_WideOr2~combout\ <= NOT \theLab|WideOr2~combout\;
\theLab|ALT_INV_LOAD~1_combout\ <= NOT \theLab|LOAD~1_combout\;
\theLab|ALT_INV_WideOr3~combout\ <= NOT \theLab|WideOr3~combout\;
\theLab|ALT_INV_WideOr3~0_combout\ <= NOT \theLab|WideOr3~0_combout\;
\theLab|ALT_INV_WideOr4~combout\ <= NOT \theLab|WideOr4~combout\;
\theLab|ALT_INV_WideOr5~combout\ <= NOT \theLab|WideOr5~combout\;
\theLab|ALT_INV_WideOr5~0_combout\ <= NOT \theLab|WideOr5~0_combout\;
\theLab|ALT_INV_WideOr0~combout\ <= NOT \theLab|WideOr0~combout\;
\theLab|ALT_INV_WideOr1~0_combout\ <= NOT \theLab|WideOr1~0_combout\;
\scoreBDisplay|ALT_INV_WideOr0~0_combout\ <= NOT \scoreBDisplay|WideOr0~0_combout\;
\theLab|b_count_score|ALT_INV_COUNT\(0) <= NOT \theLab|b_count_score|COUNT\(0);
\scoreADisplay|ALT_INV_WideOr0~0_combout\ <= NOT \scoreADisplay|WideOr0~0_combout\;
\theLab|a_count_score|ALT_INV_COUNT\(0) <= NOT \theLab|a_count_score|COUNT\(0);
\theLab|ALT_INV_WideOr6~combout\ <= NOT \theLab|WideOr6~combout\;
\theLab|ALT_INV_SCURR.b_false~q\ <= NOT \theLab|SCURR.b_false~q\;
\theLab|ALT_INV_SCURR.a_false~q\ <= NOT \theLab|SCURR.a_false~q\;
\theLab|ALT_INV_WideOr4~0_combout\ <= NOT \theLab|WideOr4~0_combout\;
\theLab|ALT_INV_SCURR.countdown~q\ <= NOT \theLab|SCURR.countdown~q\;
\theLab|ALT_INV_SCURR.led~q\ <= NOT \theLab|SCURR.led~q\;
\theLab|ALT_INV_SCURR.a_won~q\ <= NOT \theLab|SCURR.a_won~q\;
\theLab|ALT_INV_SCURR.ready~q\ <= NOT \theLab|SCURR.ready~q\;
\theLab|ALT_INV_SCURR.b_won~q\ <= NOT \theLab|SCURR.b_won~q\;
\theLab|c|ALT_INV_Add0~37_sumout\ <= NOT \theLab|c|Add0~37_sumout\;
\theLab|c|ALT_INV_Add0~33_sumout\ <= NOT \theLab|c|Add0~33_sumout\;
\theLab|c|ALT_INV_Add0~29_sumout\ <= NOT \theLab|c|Add0~29_sumout\;

-- Location: IOOBUF_X0_Y18_N79
\LEDR[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \theLab|SIGNAL~combout\,
	devoe => ww_devoe,
	o => ww_LEDR(0));

-- Location: IOOBUF_X0_Y18_N96
\LEDR[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \theLab|SIGNAL~combout\,
	devoe => ww_devoe,
	o => ww_LEDR(1));

-- Location: IOOBUF_X0_Y18_N62
\LEDR[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \theLab|SIGNAL~combout\,
	devoe => ww_devoe,
	o => ww_LEDR(2));

-- Location: IOOBUF_X0_Y18_N45
\LEDR[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \theLab|SIGNAL~combout\,
	devoe => ww_devoe,
	o => ww_LEDR(3));

-- Location: IOOBUF_X0_Y19_N39
\LEDR[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \theLab|SIGNAL~combout\,
	devoe => ww_devoe,
	o => ww_LEDR(4));

-- Location: IOOBUF_X0_Y19_N56
\LEDR[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \theLab|SIGNAL~combout\,
	devoe => ww_devoe,
	o => ww_LEDR(5));

-- Location: IOOBUF_X0_Y19_N5
\LEDR[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \theLab|SIGNAL~combout\,
	devoe => ww_devoe,
	o => ww_LEDR(6));

-- Location: IOOBUF_X0_Y19_N22
\LEDR[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \theLab|SIGNAL~combout\,
	devoe => ww_devoe,
	o => ww_LEDR(7));

-- Location: IOOBUF_X0_Y20_N39
\LEDR[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \theLab|SIGNAL~combout\,
	devoe => ww_devoe,
	o => ww_LEDR(8));

-- Location: IOOBUF_X0_Y20_N56
\LEDR[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \theLab|SIGNAL~combout\,
	devoe => ww_devoe,
	o => ww_LEDR(9));

-- Location: IOOBUF_X29_Y0_N2
\HEX5[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \theLab|ALT_INV_WideOr6~combout\,
	devoe => ww_devoe,
	o => ww_HEX5(0));

-- Location: IOOBUF_X22_Y0_N19
\HEX5[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_HEX5(1));

-- Location: IOOBUF_X43_Y0_N19
\HEX5[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_HEX5(2));

-- Location: IOOBUF_X50_Y0_N19
\HEX5[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_HEX5(3));

-- Location: IOOBUF_X0_Y21_N56
\HEX5[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \theLab|ALT_INV_WideOr6~combout\,
	devoe => ww_devoe,
	o => ww_HEX5(4));

-- Location: IOOBUF_X0_Y21_N39
\HEX5[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \theLab|ALT_INV_WideOr6~combout\,
	devoe => ww_devoe,
	o => ww_HEX5(5));

-- Location: IOOBUF_X44_Y0_N2
\HEX5[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \theLab|ALT_INV_WideOr6~combout\,
	devoe => ww_devoe,
	o => ww_HEX5(6));

-- Location: IOOBUF_X52_Y0_N36
\HEX4[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_HEX4(0));

-- Location: IOOBUF_X48_Y0_N59
\HEX4[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_HEX4(1));

-- Location: IOOBUF_X44_Y0_N19
\HEX4[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_HEX4(2));

-- Location: IOOBUF_X52_Y0_N19
\HEX4[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_HEX4(3));

-- Location: IOOBUF_X43_Y0_N2
\HEX4[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_HEX4(4));

-- Location: IOOBUF_X36_Y0_N2
\HEX4[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_HEX4(5));

-- Location: IOOBUF_X29_Y0_N19
\HEX4[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => ww_HEX4(6));

-- Location: IOOBUF_X40_Y0_N59
\HEX3[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \scoreADisplay|WideOr6~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX3(0));

-- Location: IOOBUF_X46_Y0_N2
\HEX3[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \scoreADisplay|WideOr5~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX3(1));

-- Location: IOOBUF_X40_Y0_N42
\HEX3[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \scoreADisplay|WideOr4~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX3(2));

-- Location: IOOBUF_X46_Y0_N19
\HEX3[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \scoreADisplay|WideOr3~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX3(3));

-- Location: IOOBUF_X52_Y0_N2
\HEX3[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \scoreADisplay|WideOr2~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX3(4));

-- Location: IOOBUF_X51_Y0_N2
\HEX3[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \scoreADisplay|WideOr1~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX3(5));

-- Location: IOOBUF_X51_Y0_N19
\HEX3[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \scoreADisplay|ALT_INV_WideOr0~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX3(6));

-- Location: IOOBUF_X48_Y0_N42
\HEX2[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \scoreBDisplay|WideOr6~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX2(0));

-- Location: IOOBUF_X38_Y0_N53
\HEX2[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \scoreBDisplay|WideOr5~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX2(1));

-- Location: IOOBUF_X22_Y0_N53
\HEX2[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \scoreBDisplay|WideOr4~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX2(2));

-- Location: IOOBUF_X36_Y0_N19
\HEX2[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \scoreBDisplay|WideOr3~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX2(3));

-- Location: IOOBUF_X38_Y0_N19
\HEX2[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \scoreBDisplay|WideOr2~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX2(4));

-- Location: IOOBUF_X46_Y0_N53
\HEX2[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \scoreBDisplay|WideOr1~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX2(5));

-- Location: IOOBUF_X40_Y0_N76
\HEX2[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \scoreBDisplay|ALT_INV_WideOr0~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX2(6));

-- Location: IOOBUF_X44_Y0_N36
\HEX1[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \theLab|ALT_INV_WideOr1~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX1(0));

-- Location: IOOBUF_X40_Y0_N93
\HEX1[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \winnerDisplay|Decoder0~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX1(1));

-- Location: IOOBUF_X44_Y0_N53
\HEX1[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_HEX1(2));

-- Location: IOOBUF_X43_Y0_N36
\HEX1[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \winnerDisplay|WideOr3~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX1(3));

-- Location: IOOBUF_X38_Y0_N36
\HEX1[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_HEX1(4));

-- Location: IOOBUF_X43_Y0_N53
\HEX1[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => ww_HEX1(5));

-- Location: IOOBUF_X51_Y0_N53
\HEX1[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \theLab|ALT_INV_WideOr0~combout\,
	devoe => ww_devoe,
	o => ww_HEX1(6));

-- Location: IOOBUF_X52_Y0_N53
\HEX0[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \stateDisplay|WideOr6~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX0(0));

-- Location: IOOBUF_X51_Y0_N36
\HEX0[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \stateDisplay|WideOr5~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX0(1));

-- Location: IOOBUF_X48_Y0_N76
\HEX0[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \stateDisplay|WideOr4~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX0(2));

-- Location: IOOBUF_X50_Y0_N36
\HEX0[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \stateDisplay|WideOr3~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX0(3));

-- Location: IOOBUF_X48_Y0_N93
\HEX0[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \stateDisplay|WideOr2~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX0(4));

-- Location: IOOBUF_X50_Y0_N53
\HEX0[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \stateDisplay|WideOr1~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX0(5));

-- Location: IOOBUF_X46_Y0_N36
\HEX0[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \stateDisplay|ALT_INV_WideOr0~0_combout\,
	devoe => ww_devoe,
	o => ww_HEX0(6));

-- Location: IOIBUF_X22_Y0_N1
\CLK50~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLK50,
	o => \CLK50~input_o\);

-- Location: CLKCTRL_G6
\CLK50~inputCLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \CLK50~input_o\,
	outclk => \CLK50~inputCLKENA0_outclk\);

-- Location: FF_X34_Y6_N34
\clockGenerator|counter_10MHz|count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK50~inputCLKENA0_outclk\,
	d => \clockGenerator|counter_10MHz|count~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clockGenerator|counter_10MHz|count\(1));

-- Location: MLABCELL_X34_Y6_N57
\clockGenerator|counter_10MHz|count~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \clockGenerator|counter_10MHz|count~0_combout\ = ( !\clockGenerator|counter_10MHz|count\(2) & ( \clockGenerator|counter_10MHz|count\(1) & ( \clockGenerator|counter_10MHz|count\(0) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000001111000011110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \clockGenerator|counter_10MHz|ALT_INV_count\(0),
	datae => \clockGenerator|counter_10MHz|ALT_INV_count\(2),
	dataf => \clockGenerator|counter_10MHz|ALT_INV_count\(1),
	combout => \clockGenerator|counter_10MHz|count~0_combout\);

-- Location: FF_X34_Y6_N58
\clockGenerator|counter_10MHz|count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK50~inputCLKENA0_outclk\,
	d => \clockGenerator|counter_10MHz|count~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clockGenerator|counter_10MHz|count\(2));

-- Location: MLABCELL_X34_Y6_N48
\clockGenerator|counter_10MHz|count~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \clockGenerator|counter_10MHz|count~2_combout\ = ( !\clockGenerator|counter_10MHz|count\(0) & ( !\clockGenerator|counter_10MHz|count\(2) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \clockGenerator|counter_10MHz|ALT_INV_count\(0),
	dataf => \clockGenerator|counter_10MHz|ALT_INV_count\(2),
	combout => \clockGenerator|counter_10MHz|count~2_combout\);

-- Location: FF_X34_Y6_N49
\clockGenerator|counter_10MHz|count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK50~inputCLKENA0_outclk\,
	d => \clockGenerator|counter_10MHz|count~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clockGenerator|counter_10MHz|count\(0));

-- Location: MLABCELL_X34_Y6_N33
\clockGenerator|counter_10MHz|count~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \clockGenerator|counter_10MHz|count~1_combout\ = ( \clockGenerator|counter_10MHz|count\(1) & ( !\clockGenerator|counter_10MHz|count\(2) & ( !\clockGenerator|counter_10MHz|count\(0) ) ) ) # ( !\clockGenerator|counter_10MHz|count\(1) & ( 
-- !\clockGenerator|counter_10MHz|count\(2) & ( \clockGenerator|counter_10MHz|count\(0) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111111100001111000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \clockGenerator|counter_10MHz|ALT_INV_count\(0),
	datae => \clockGenerator|counter_10MHz|ALT_INV_count\(1),
	dataf => \clockGenerator|counter_10MHz|ALT_INV_count\(2),
	combout => \clockGenerator|counter_10MHz|count~1_combout\);

-- Location: FF_X34_Y6_N35
\clockGenerator|counter_10MHz|count[1]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK50~inputCLKENA0_outclk\,
	d => \clockGenerator|counter_10MHz|count~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clockGenerator|counter_10MHz|count[1]~DUPLICATE_q\);

-- Location: FF_X34_Y6_N59
\clockGenerator|counter_10MHz|count[2]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK50~inputCLKENA0_outclk\,
	d => \clockGenerator|counter_10MHz|count~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clockGenerator|counter_10MHz|count[2]~DUPLICATE_q\);

-- Location: FF_X34_Y6_N50
\clockGenerator|counter_10MHz|count[0]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK50~inputCLKENA0_outclk\,
	d => \clockGenerator|counter_10MHz|count~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clockGenerator|counter_10MHz|count[0]~DUPLICATE_q\);

-- Location: MLABCELL_X34_Y6_N24
\clockGenerator|counter_10MHz|LessThan1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \clockGenerator|counter_10MHz|LessThan1~0_combout\ = ( \clockGenerator|counter_10MHz|count[0]~DUPLICATE_q\ & ( (\clockGenerator|counter_10MHz|count[2]~DUPLICATE_q\) # (\clockGenerator|counter_10MHz|count[1]~DUPLICATE_q\) ) ) # ( 
-- !\clockGenerator|counter_10MHz|count[0]~DUPLICATE_q\ & ( \clockGenerator|counter_10MHz|count[2]~DUPLICATE_q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111101010101111111110101010111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \clockGenerator|counter_10MHz|ALT_INV_count[1]~DUPLICATE_q\,
	datad => \clockGenerator|counter_10MHz|ALT_INV_count[2]~DUPLICATE_q\,
	dataf => \clockGenerator|counter_10MHz|ALT_INV_count[0]~DUPLICATE_q\,
	combout => \clockGenerator|counter_10MHz|LessThan1~0_combout\);

-- Location: LABCELL_X36_Y6_N18
\clockGenerator|counter_100kHz|count~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \clockGenerator|counter_100kHz|count~0_combout\ = ( \clockGenerator|counter_100kHz|count\(1) & ( (\clockGenerator|counter_100kHz|count[0]~DUPLICATE_q\ & (\clockGenerator|counter_100kHz|count\(2) & !\clockGenerator|counter_100kHz|count\(3))) ) ) # ( 
-- !\clockGenerator|counter_100kHz|count\(1) & ( (!\clockGenerator|counter_100kHz|count[0]~DUPLICATE_q\ & (!\clockGenerator|counter_100kHz|count\(2) & \clockGenerator|counter_100kHz|count\(3))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011000000000000001100000000000011000000000000001100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \clockGenerator|counter_100kHz|ALT_INV_count[0]~DUPLICATE_q\,
	datac => \clockGenerator|counter_100kHz|ALT_INV_count\(2),
	datad => \clockGenerator|counter_100kHz|ALT_INV_count\(3),
	dataf => \clockGenerator|counter_100kHz|ALT_INV_count\(1),
	combout => \clockGenerator|counter_100kHz|count~0_combout\);

-- Location: MLABCELL_X34_Y6_N36
\clockGenerator|counter_10MHz|Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \clockGenerator|counter_10MHz|Equal0~0_combout\ = ( \clockGenerator|counter_10MHz|count[2]~DUPLICATE_q\ & ( !\clockGenerator|counter_10MHz|count[0]~DUPLICATE_q\ & ( !\clockGenerator|counter_10MHz|count[1]~DUPLICATE_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \clockGenerator|counter_10MHz|ALT_INV_count[1]~DUPLICATE_q\,
	datae => \clockGenerator|counter_10MHz|ALT_INV_count[2]~DUPLICATE_q\,
	dataf => \clockGenerator|counter_10MHz|ALT_INV_count[0]~DUPLICATE_q\,
	combout => \clockGenerator|counter_10MHz|Equal0~0_combout\);

-- Location: FF_X36_Y6_N52
\clockGenerator|counter_1MHz|count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK50~inputCLKENA0_outclk\,
	d => \clockGenerator|counter_1MHz|count~3_combout\,
	ena => \clockGenerator|counter_10MHz|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clockGenerator|counter_1MHz|count\(0));

-- Location: LABCELL_X36_Y6_N51
\clockGenerator|counter_1MHz|count~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \clockGenerator|counter_1MHz|count~3_combout\ = ( \clockGenerator|counter_1MHz|count[2]~DUPLICATE_q\ & ( (!\clockGenerator|counter_1MHz|count[3]~DUPLICATE_q\ & !\clockGenerator|counter_1MHz|count\(0)) ) ) # ( 
-- !\clockGenerator|counter_1MHz|count[2]~DUPLICATE_q\ & ( (!\clockGenerator|counter_1MHz|count\(0) & ((!\clockGenerator|counter_1MHz|count[1]~DUPLICATE_q\) # (!\clockGenerator|counter_1MHz|count[3]~DUPLICATE_q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111101000000000111110100000000011110000000000001111000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \clockGenerator|counter_1MHz|ALT_INV_count[1]~DUPLICATE_q\,
	datac => \clockGenerator|counter_1MHz|ALT_INV_count[3]~DUPLICATE_q\,
	datad => \clockGenerator|counter_1MHz|ALT_INV_count\(0),
	dataf => \clockGenerator|counter_1MHz|ALT_INV_count[2]~DUPLICATE_q\,
	combout => \clockGenerator|counter_1MHz|count~3_combout\);

-- Location: FF_X36_Y6_N53
\clockGenerator|counter_1MHz|count[0]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK50~inputCLKENA0_outclk\,
	d => \clockGenerator|counter_1MHz|count~3_combout\,
	ena => \clockGenerator|counter_10MHz|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clockGenerator|counter_1MHz|count[0]~DUPLICATE_q\);

-- Location: FF_X36_Y6_N1
\clockGenerator|counter_1MHz|count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK50~inputCLKENA0_outclk\,
	d => \clockGenerator|counter_1MHz|count~2_combout\,
	ena => \clockGenerator|counter_10MHz|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clockGenerator|counter_1MHz|count\(1));

-- Location: FF_X36_Y6_N10
\clockGenerator|counter_1MHz|count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK50~inputCLKENA0_outclk\,
	d => \clockGenerator|counter_1MHz|count~0_combout\,
	ena => \clockGenerator|counter_10MHz|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clockGenerator|counter_1MHz|count\(3));

-- Location: LABCELL_X36_Y6_N0
\clockGenerator|counter_1MHz|count~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \clockGenerator|counter_1MHz|count~2_combout\ = ( !\clockGenerator|counter_1MHz|count\(3) & ( !\clockGenerator|counter_1MHz|count[0]~DUPLICATE_q\ $ (!\clockGenerator|counter_1MHz|count\(1)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111111110000000011111111000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \clockGenerator|counter_1MHz|ALT_INV_count[0]~DUPLICATE_q\,
	datad => \clockGenerator|counter_1MHz|ALT_INV_count\(1),
	dataf => \clockGenerator|counter_1MHz|ALT_INV_count\(3),
	combout => \clockGenerator|counter_1MHz|count~2_combout\);

-- Location: FF_X36_Y6_N2
\clockGenerator|counter_1MHz|count[1]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK50~inputCLKENA0_outclk\,
	d => \clockGenerator|counter_1MHz|count~2_combout\,
	ena => \clockGenerator|counter_10MHz|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clockGenerator|counter_1MHz|count[1]~DUPLICATE_q\);

-- Location: FF_X36_Y6_N49
\clockGenerator|counter_1MHz|count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK50~inputCLKENA0_outclk\,
	d => \clockGenerator|counter_1MHz|count~1_combout\,
	ena => \clockGenerator|counter_10MHz|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clockGenerator|counter_1MHz|count\(2));

-- Location: LABCELL_X36_Y6_N9
\clockGenerator|counter_1MHz|count~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \clockGenerator|counter_1MHz|count~0_combout\ = ( \clockGenerator|counter_1MHz|count\(0) & ( (\clockGenerator|counter_1MHz|count[1]~DUPLICATE_q\ & (\clockGenerator|counter_1MHz|count\(2) & !\clockGenerator|counter_1MHz|count\(3))) ) ) # ( 
-- !\clockGenerator|counter_1MHz|count\(0) & ( (!\clockGenerator|counter_1MHz|count[1]~DUPLICATE_q\ & (!\clockGenerator|counter_1MHz|count\(2) & \clockGenerator|counter_1MHz|count\(3))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010100000000000001010000000000101000000000000010100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \clockGenerator|counter_1MHz|ALT_INV_count[1]~DUPLICATE_q\,
	datac => \clockGenerator|counter_1MHz|ALT_INV_count\(2),
	datad => \clockGenerator|counter_1MHz|ALT_INV_count\(3),
	dataf => \clockGenerator|counter_1MHz|ALT_INV_count\(0),
	combout => \clockGenerator|counter_1MHz|count~0_combout\);

-- Location: FF_X36_Y6_N11
\clockGenerator|counter_1MHz|count[3]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK50~inputCLKENA0_outclk\,
	d => \clockGenerator|counter_1MHz|count~0_combout\,
	ena => \clockGenerator|counter_10MHz|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clockGenerator|counter_1MHz|count[3]~DUPLICATE_q\);

-- Location: LABCELL_X36_Y6_N48
\clockGenerator|counter_1MHz|count~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \clockGenerator|counter_1MHz|count~1_combout\ = ( \clockGenerator|counter_1MHz|count\(0) & ( (!\clockGenerator|counter_1MHz|count[3]~DUPLICATE_q\ & (!\clockGenerator|counter_1MHz|count[1]~DUPLICATE_q\ $ (!\clockGenerator|counter_1MHz|count\(2)))) ) ) # ( 
-- !\clockGenerator|counter_1MHz|count\(0) & ( (!\clockGenerator|counter_1MHz|count[3]~DUPLICATE_q\ & \clockGenerator|counter_1MHz|count\(2)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011001100000000001100110000001100110000000000110011000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \clockGenerator|counter_1MHz|ALT_INV_count[3]~DUPLICATE_q\,
	datac => \clockGenerator|counter_1MHz|ALT_INV_count[1]~DUPLICATE_q\,
	datad => \clockGenerator|counter_1MHz|ALT_INV_count\(2),
	dataf => \clockGenerator|counter_1MHz|ALT_INV_count\(0),
	combout => \clockGenerator|counter_1MHz|count~1_combout\);

-- Location: FF_X36_Y6_N50
\clockGenerator|counter_1MHz|count[2]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK50~inputCLKENA0_outclk\,
	d => \clockGenerator|counter_1MHz|count~1_combout\,
	ena => \clockGenerator|counter_10MHz|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clockGenerator|counter_1MHz|count[2]~DUPLICATE_q\);

-- Location: LABCELL_X36_Y6_N45
\clockGenerator|counter_1MHz|rco_out~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \clockGenerator|counter_1MHz|rco_out~0_combout\ = ( \clockGenerator|counter_1MHz|count[0]~DUPLICATE_q\ & ( (!\clockGenerator|counter_1MHz|count[2]~DUPLICATE_q\ & (\clockGenerator|counter_1MHz|count[3]~DUPLICATE_q\ & 
-- !\clockGenerator|counter_1MHz|count[1]~DUPLICATE_q\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000001010000000000000101000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \clockGenerator|counter_1MHz|ALT_INV_count[2]~DUPLICATE_q\,
	datac => \clockGenerator|counter_1MHz|ALT_INV_count[3]~DUPLICATE_q\,
	datad => \clockGenerator|counter_1MHz|ALT_INV_count[1]~DUPLICATE_q\,
	dataf => \clockGenerator|counter_1MHz|ALT_INV_count[0]~DUPLICATE_q\,
	combout => \clockGenerator|counter_1MHz|rco_out~0_combout\);

-- Location: LABCELL_X35_Y6_N57
\clockGenerator|counter_1MHz|rco_out\ : cyclonev_lcell_comb
-- Equation(s):
-- \clockGenerator|counter_1MHz|rco_out~combout\ = ( \clockGenerator|counter_10MHz|Equal0~0_combout\ & ( \clockGenerator|counter_1MHz|rco_out~0_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \clockGenerator|counter_1MHz|ALT_INV_rco_out~0_combout\,
	dataf => \clockGenerator|counter_10MHz|ALT_INV_Equal0~0_combout\,
	combout => \clockGenerator|counter_1MHz|rco_out~combout\);

-- Location: FF_X36_Y6_N20
\clockGenerator|counter_100kHz|count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK50~inputCLKENA0_outclk\,
	d => \clockGenerator|counter_100kHz|count~0_combout\,
	ena => \clockGenerator|counter_1MHz|rco_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clockGenerator|counter_100kHz|count\(3));

-- Location: LABCELL_X36_Y6_N21
\clockGenerator|counter_100kHz|count~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \clockGenerator|counter_100kHz|count~1_combout\ = ( !\clockGenerator|counter_100kHz|count\(3) & ( !\clockGenerator|counter_100kHz|count\(2) $ (((!\clockGenerator|counter_100kHz|count[0]~DUPLICATE_q\) # (!\clockGenerator|counter_100kHz|count\(1)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001111111100000000111111110000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \clockGenerator|counter_100kHz|ALT_INV_count[0]~DUPLICATE_q\,
	datac => \clockGenerator|counter_100kHz|ALT_INV_count\(1),
	datad => \clockGenerator|counter_100kHz|ALT_INV_count\(2),
	dataf => \clockGenerator|counter_100kHz|ALT_INV_count\(3),
	combout => \clockGenerator|counter_100kHz|count~1_combout\);

-- Location: FF_X36_Y6_N23
\clockGenerator|counter_100kHz|count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK50~inputCLKENA0_outclk\,
	d => \clockGenerator|counter_100kHz|count~1_combout\,
	ena => \clockGenerator|counter_1MHz|rco_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clockGenerator|counter_100kHz|count\(2));

-- Location: FF_X36_Y6_N43
\clockGenerator|counter_100kHz|count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK50~inputCLKENA0_outclk\,
	d => \clockGenerator|counter_100kHz|count~3_combout\,
	ena => \clockGenerator|counter_1MHz|rco_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clockGenerator|counter_100kHz|count\(0));

-- Location: LABCELL_X36_Y6_N42
\clockGenerator|counter_100kHz|count~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \clockGenerator|counter_100kHz|count~3_combout\ = ( \clockGenerator|counter_100kHz|count\(3) & ( (!\clockGenerator|counter_100kHz|count\(1) & (!\clockGenerator|counter_100kHz|count\(2) & !\clockGenerator|counter_100kHz|count\(0))) ) ) # ( 
-- !\clockGenerator|counter_100kHz|count\(3) & ( !\clockGenerator|counter_100kHz|count\(0) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111100000000111111110000000011000000000000001100000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \clockGenerator|counter_100kHz|ALT_INV_count\(1),
	datac => \clockGenerator|counter_100kHz|ALT_INV_count\(2),
	datad => \clockGenerator|counter_100kHz|ALT_INV_count\(0),
	dataf => \clockGenerator|counter_100kHz|ALT_INV_count\(3),
	combout => \clockGenerator|counter_100kHz|count~3_combout\);

-- Location: FF_X36_Y6_N44
\clockGenerator|counter_100kHz|count[0]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK50~inputCLKENA0_outclk\,
	d => \clockGenerator|counter_100kHz|count~3_combout\,
	ena => \clockGenerator|counter_1MHz|rco_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clockGenerator|counter_100kHz|count[0]~DUPLICATE_q\);

-- Location: LABCELL_X36_Y6_N39
\clockGenerator|counter_100kHz|count~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \clockGenerator|counter_100kHz|count~2_combout\ = ( !\clockGenerator|counter_100kHz|count\(3) & ( !\clockGenerator|counter_100kHz|count[0]~DUPLICATE_q\ $ (!\clockGenerator|counter_100kHz|count\(1)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111111110000000011111111000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \clockGenerator|counter_100kHz|ALT_INV_count[0]~DUPLICATE_q\,
	datad => \clockGenerator|counter_100kHz|ALT_INV_count\(1),
	dataf => \clockGenerator|counter_100kHz|ALT_INV_count\(3),
	combout => \clockGenerator|counter_100kHz|count~2_combout\);

-- Location: FF_X36_Y6_N41
\clockGenerator|counter_100kHz|count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK50~inputCLKENA0_outclk\,
	d => \clockGenerator|counter_100kHz|count~2_combout\,
	ena => \clockGenerator|counter_1MHz|rco_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clockGenerator|counter_100kHz|count\(1));

-- Location: FF_X36_Y6_N22
\clockGenerator|counter_100kHz|count[2]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK50~inputCLKENA0_outclk\,
	d => \clockGenerator|counter_100kHz|count~1_combout\,
	ena => \clockGenerator|counter_1MHz|rco_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clockGenerator|counter_100kHz|count[2]~DUPLICATE_q\);

-- Location: LABCELL_X36_Y6_N6
\clockGenerator|counter_100kHz|LessThan1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \clockGenerator|counter_100kHz|LessThan1~0_combout\ = ( \clockGenerator|counter_100kHz|count\(3) ) # ( !\clockGenerator|counter_100kHz|count\(3) & ( (\clockGenerator|counter_100kHz|count[2]~DUPLICATE_q\ & ((\clockGenerator|counter_100kHz|count\(0)) # 
-- (\clockGenerator|counter_100kHz|count\(1)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100001111000000110000111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \clockGenerator|counter_100kHz|ALT_INV_count\(1),
	datac => \clockGenerator|counter_100kHz|ALT_INV_count[2]~DUPLICATE_q\,
	datad => \clockGenerator|counter_100kHz|ALT_INV_count\(0),
	dataf => \clockGenerator|counter_100kHz|ALT_INV_count\(3),
	combout => \clockGenerator|counter_100kHz|LessThan1~0_combout\);

-- Location: LABCELL_X36_Y6_N12
\clockGenerator|counter_1MHz|LessThan1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \clockGenerator|counter_1MHz|LessThan1~0_combout\ = ( \clockGenerator|counter_1MHz|count\(3) ) # ( !\clockGenerator|counter_1MHz|count\(3) & ( (\clockGenerator|counter_1MHz|count[2]~DUPLICATE_q\ & ((\clockGenerator|counter_1MHz|count\(1)) # 
-- (\clockGenerator|counter_1MHz|count[0]~DUPLICATE_q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010101010101000001010101010111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \clockGenerator|counter_1MHz|ALT_INV_count[2]~DUPLICATE_q\,
	datac => \clockGenerator|counter_1MHz|ALT_INV_count[0]~DUPLICATE_q\,
	datad => \clockGenerator|counter_1MHz|ALT_INV_count\(1),
	dataf => \clockGenerator|counter_1MHz|ALT_INV_count\(3),
	combout => \clockGenerator|counter_1MHz|LessThan1~0_combout\);

-- Location: IOIBUF_X33_Y0_N75
\SW[9]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(9),
	o => \SW[9]~input_o\);

-- Location: IOIBUF_X33_Y0_N92
\SW[8]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(8),
	o => \SW[8]~input_o\);

-- Location: LABCELL_X36_Y6_N36
\clockGenerator|counter_100kHz|rco_out~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \clockGenerator|counter_100kHz|rco_out~0_combout\ = ( !\clockGenerator|counter_100kHz|count\(1) & ( (\clockGenerator|counter_100kHz|count[0]~DUPLICATE_q\ & (\clockGenerator|counter_100kHz|count\(3) & !\clockGenerator|counter_100kHz|count\(2))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100000000000000110000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \clockGenerator|counter_100kHz|ALT_INV_count[0]~DUPLICATE_q\,
	datac => \clockGenerator|counter_100kHz|ALT_INV_count\(3),
	datad => \clockGenerator|counter_100kHz|ALT_INV_count\(2),
	dataf => \clockGenerator|counter_100kHz|ALT_INV_count\(1),
	combout => \clockGenerator|counter_100kHz|rco_out~0_combout\);

-- Location: LABCELL_X36_Y6_N15
\clockGenerator|counter_100kHz|rco_out\ : cyclonev_lcell_comb
-- Equation(s):
-- \clockGenerator|counter_100kHz|rco_out~combout\ = ( \clockGenerator|counter_10MHz|Equal0~0_combout\ & ( (\clockGenerator|counter_1MHz|rco_out~0_combout\ & \clockGenerator|counter_100kHz|rco_out~0_combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000011110000000000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \clockGenerator|counter_1MHz|ALT_INV_rco_out~0_combout\,
	datad => \clockGenerator|counter_100kHz|ALT_INV_rco_out~0_combout\,
	dataf => \clockGenerator|counter_10MHz|ALT_INV_Equal0~0_combout\,
	combout => \clockGenerator|counter_100kHz|rco_out~combout\);

-- Location: FF_X36_Y6_N28
\clockGenerator|counter_10kHz|count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK50~inputCLKENA0_outclk\,
	d => \clockGenerator|counter_10kHz|count~3_combout\,
	ena => \clockGenerator|counter_100kHz|rco_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clockGenerator|counter_10kHz|count\(0));

-- Location: FF_X36_Y6_N31
\clockGenerator|counter_10kHz|count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK50~inputCLKENA0_outclk\,
	d => \clockGenerator|counter_10kHz|count~2_combout\,
	ena => \clockGenerator|counter_100kHz|rco_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clockGenerator|counter_10kHz|count\(1));

-- Location: FF_X36_Y6_N26
\clockGenerator|counter_10kHz|count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK50~inputCLKENA0_outclk\,
	d => \clockGenerator|counter_10kHz|count~1_combout\,
	ena => \clockGenerator|counter_100kHz|rco_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clockGenerator|counter_10kHz|count\(2));

-- Location: LABCELL_X36_Y6_N24
\clockGenerator|counter_10kHz|count~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \clockGenerator|counter_10kHz|count~1_combout\ = ( \clockGenerator|counter_10kHz|count\(0) & ( (!\clockGenerator|counter_10kHz|count\(3) & (!\clockGenerator|counter_10kHz|count\(1) $ (!\clockGenerator|counter_10kHz|count\(2)))) ) ) # ( 
-- !\clockGenerator|counter_10kHz|count\(0) & ( (!\clockGenerator|counter_10kHz|count\(3) & \clockGenerator|counter_10kHz|count\(2)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011001100000000001100110000001100110000000000110011000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \clockGenerator|counter_10kHz|ALT_INV_count\(3),
	datac => \clockGenerator|counter_10kHz|ALT_INV_count\(1),
	datad => \clockGenerator|counter_10kHz|ALT_INV_count\(2),
	dataf => \clockGenerator|counter_10kHz|ALT_INV_count\(0),
	combout => \clockGenerator|counter_10kHz|count~1_combout\);

-- Location: FF_X36_Y6_N25
\clockGenerator|counter_10kHz|count[2]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK50~inputCLKENA0_outclk\,
	d => \clockGenerator|counter_10kHz|count~1_combout\,
	ena => \clockGenerator|counter_100kHz|rco_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clockGenerator|counter_10kHz|count[2]~DUPLICATE_q\);

-- Location: LABCELL_X36_Y6_N27
\clockGenerator|counter_10kHz|count~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \clockGenerator|counter_10kHz|count~3_combout\ = ( \clockGenerator|counter_10kHz|count[2]~DUPLICATE_q\ & ( (!\clockGenerator|counter_10kHz|count\(3) & !\clockGenerator|counter_10kHz|count\(0)) ) ) # ( !\clockGenerator|counter_10kHz|count[2]~DUPLICATE_q\ & 
-- ( (!\clockGenerator|counter_10kHz|count\(0) & ((!\clockGenerator|counter_10kHz|count\(3)) # (!\clockGenerator|counter_10kHz|count[1]~DUPLICATE_q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111110000000000111111000000000011001100000000001100110000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \clockGenerator|counter_10kHz|ALT_INV_count\(3),
	datac => \clockGenerator|counter_10kHz|ALT_INV_count[1]~DUPLICATE_q\,
	datad => \clockGenerator|counter_10kHz|ALT_INV_count\(0),
	dataf => \clockGenerator|counter_10kHz|ALT_INV_count[2]~DUPLICATE_q\,
	combout => \clockGenerator|counter_10kHz|count~3_combout\);

-- Location: FF_X36_Y6_N29
\clockGenerator|counter_10kHz|count[0]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK50~inputCLKENA0_outclk\,
	d => \clockGenerator|counter_10kHz|count~3_combout\,
	ena => \clockGenerator|counter_100kHz|rco_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clockGenerator|counter_10kHz|count[0]~DUPLICATE_q\);

-- Location: LABCELL_X36_Y6_N57
\clockGenerator|counter_10kHz|count~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \clockGenerator|counter_10kHz|count~0_combout\ = ( !\clockGenerator|counter_10kHz|count\(3) & ( \clockGenerator|counter_10kHz|count[2]~DUPLICATE_q\ & ( (\clockGenerator|counter_10kHz|count[1]~DUPLICATE_q\ & 
-- \clockGenerator|counter_10kHz|count[0]~DUPLICATE_q\) ) ) ) # ( \clockGenerator|counter_10kHz|count\(3) & ( !\clockGenerator|counter_10kHz|count[2]~DUPLICATE_q\ & ( (!\clockGenerator|counter_10kHz|count[1]~DUPLICATE_q\ & 
-- !\clockGenerator|counter_10kHz|count[0]~DUPLICATE_q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100000000000000000000000011110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \clockGenerator|counter_10kHz|ALT_INV_count[1]~DUPLICATE_q\,
	datad => \clockGenerator|counter_10kHz|ALT_INV_count[0]~DUPLICATE_q\,
	datae => \clockGenerator|counter_10kHz|ALT_INV_count\(3),
	dataf => \clockGenerator|counter_10kHz|ALT_INV_count[2]~DUPLICATE_q\,
	combout => \clockGenerator|counter_10kHz|count~0_combout\);

-- Location: FF_X36_Y6_N59
\clockGenerator|counter_10kHz|count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK50~inputCLKENA0_outclk\,
	d => \clockGenerator|counter_10kHz|count~0_combout\,
	ena => \clockGenerator|counter_100kHz|rco_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clockGenerator|counter_10kHz|count\(3));

-- Location: LABCELL_X36_Y6_N30
\clockGenerator|counter_10kHz|count~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \clockGenerator|counter_10kHz|count~2_combout\ = ( \clockGenerator|counter_10kHz|count\(0) & ( (!\clockGenerator|counter_10kHz|count\(3) & !\clockGenerator|counter_10kHz|count\(1)) ) ) # ( !\clockGenerator|counter_10kHz|count\(0) & ( 
-- (!\clockGenerator|counter_10kHz|count\(3) & \clockGenerator|counter_10kHz|count\(1)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011001100000000001100110011001100000000001100110000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \clockGenerator|counter_10kHz|ALT_INV_count\(3),
	datad => \clockGenerator|counter_10kHz|ALT_INV_count\(1),
	dataf => \clockGenerator|counter_10kHz|ALT_INV_count\(0),
	combout => \clockGenerator|counter_10kHz|count~2_combout\);

-- Location: FF_X36_Y6_N32
\clockGenerator|counter_10kHz|count[1]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK50~inputCLKENA0_outclk\,
	d => \clockGenerator|counter_10kHz|count~2_combout\,
	ena => \clockGenerator|counter_100kHz|rco_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clockGenerator|counter_10kHz|count[1]~DUPLICATE_q\);

-- Location: LABCELL_X35_Y6_N39
\clockGenerator|counter_10kHz|rco_out~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \clockGenerator|counter_10kHz|rco_out~0_combout\ = ( !\clockGenerator|counter_10kHz|count\(2) & ( (!\clockGenerator|counter_10kHz|count[1]~DUPLICATE_q\ & (\clockGenerator|counter_10kHz|count\(3) & \clockGenerator|counter_10kHz|count[0]~DUPLICATE_q\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001010000000000000101000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \clockGenerator|counter_10kHz|ALT_INV_count[1]~DUPLICATE_q\,
	datac => \clockGenerator|counter_10kHz|ALT_INV_count\(3),
	datad => \clockGenerator|counter_10kHz|ALT_INV_count[0]~DUPLICATE_q\,
	dataf => \clockGenerator|counter_10kHz|ALT_INV_count\(2),
	combout => \clockGenerator|counter_10kHz|rco_out~0_combout\);

-- Location: MLABCELL_X34_Y6_N45
\clockGenerator|counter_10kHz|rco_out\ : cyclonev_lcell_comb
-- Equation(s):
-- \clockGenerator|counter_10kHz|rco_out~combout\ = ( \clockGenerator|counter_1MHz|rco_out~0_combout\ & ( \clockGenerator|counter_10kHz|rco_out~0_combout\ & ( (\clockGenerator|counter_10MHz|Equal0~0_combout\ & 
-- \clockGenerator|counter_100kHz|rco_out~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000010100000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \clockGenerator|counter_10MHz|ALT_INV_Equal0~0_combout\,
	datac => \clockGenerator|counter_100kHz|ALT_INV_rco_out~0_combout\,
	datae => \clockGenerator|counter_1MHz|ALT_INV_rco_out~0_combout\,
	dataf => \clockGenerator|counter_10kHz|ALT_INV_rco_out~0_combout\,
	combout => \clockGenerator|counter_10kHz|rco_out~combout\);

-- Location: FF_X34_Y6_N10
\clockGenerator|counter_1kHz|count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK50~inputCLKENA0_outclk\,
	d => \clockGenerator|counter_1kHz|count~2_combout\,
	ena => \clockGenerator|counter_10kHz|rco_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clockGenerator|counter_1kHz|count\(1));

-- Location: FF_X34_Y6_N19
\clockGenerator|counter_1kHz|count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK50~inputCLKENA0_outclk\,
	d => \clockGenerator|counter_1kHz|count~0_combout\,
	ena => \clockGenerator|counter_10kHz|rco_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clockGenerator|counter_1kHz|count\(3));

-- Location: FF_X34_Y6_N28
\clockGenerator|counter_1kHz|count[0]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK50~inputCLKENA0_outclk\,
	d => \clockGenerator|counter_1kHz|count~3_combout\,
	ena => \clockGenerator|counter_10kHz|rco_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clockGenerator|counter_1kHz|count[0]~DUPLICATE_q\);

-- Location: MLABCELL_X34_Y6_N18
\clockGenerator|counter_1kHz|count~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \clockGenerator|counter_1kHz|count~0_combout\ = ( \clockGenerator|counter_1kHz|count[0]~DUPLICATE_q\ & ( (\clockGenerator|counter_1kHz|count\(2) & (\clockGenerator|counter_1kHz|count\(1) & !\clockGenerator|counter_1kHz|count\(3))) ) ) # ( 
-- !\clockGenerator|counter_1kHz|count[0]~DUPLICATE_q\ & ( (!\clockGenerator|counter_1kHz|count\(2) & (!\clockGenerator|counter_1kHz|count\(1) & \clockGenerator|counter_1kHz|count\(3))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011000000000000001100000000000011000000000000001100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \clockGenerator|counter_1kHz|ALT_INV_count\(2),
	datac => \clockGenerator|counter_1kHz|ALT_INV_count\(1),
	datad => \clockGenerator|counter_1kHz|ALT_INV_count\(3),
	dataf => \clockGenerator|counter_1kHz|ALT_INV_count[0]~DUPLICATE_q\,
	combout => \clockGenerator|counter_1kHz|count~0_combout\);

-- Location: FF_X34_Y6_N20
\clockGenerator|counter_1kHz|count[3]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK50~inputCLKENA0_outclk\,
	d => \clockGenerator|counter_1kHz|count~0_combout\,
	ena => \clockGenerator|counter_10kHz|rco_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clockGenerator|counter_1kHz|count[3]~DUPLICATE_q\);

-- Location: MLABCELL_X34_Y6_N9
\clockGenerator|counter_1kHz|count~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \clockGenerator|counter_1kHz|count~2_combout\ = ( !\clockGenerator|counter_1kHz|count\(1) & ( \clockGenerator|counter_1kHz|count[0]~DUPLICATE_q\ & ( !\clockGenerator|counter_1kHz|count[3]~DUPLICATE_q\ ) ) ) # ( \clockGenerator|counter_1kHz|count\(1) & ( 
-- !\clockGenerator|counter_1kHz|count[0]~DUPLICATE_q\ & ( !\clockGenerator|counter_1kHz|count[3]~DUPLICATE_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101010101010101010100000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \clockGenerator|counter_1kHz|ALT_INV_count[3]~DUPLICATE_q\,
	datae => \clockGenerator|counter_1kHz|ALT_INV_count\(1),
	dataf => \clockGenerator|counter_1kHz|ALT_INV_count[0]~DUPLICATE_q\,
	combout => \clockGenerator|counter_1kHz|count~2_combout\);

-- Location: FF_X34_Y6_N11
\clockGenerator|counter_1kHz|count[1]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK50~inputCLKENA0_outclk\,
	d => \clockGenerator|counter_1kHz|count~2_combout\,
	ena => \clockGenerator|counter_10kHz|rco_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clockGenerator|counter_1kHz|count[1]~DUPLICATE_q\);

-- Location: MLABCELL_X34_Y6_N27
\clockGenerator|counter_1kHz|count~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \clockGenerator|counter_1kHz|count~3_combout\ = ( \clockGenerator|counter_1kHz|count[3]~DUPLICATE_q\ & ( (!\clockGenerator|counter_1kHz|count\(2) & (!\clockGenerator|counter_1kHz|count[1]~DUPLICATE_q\ & !\clockGenerator|counter_1kHz|count\(0))) ) ) # ( 
-- !\clockGenerator|counter_1kHz|count[3]~DUPLICATE_q\ & ( !\clockGenerator|counter_1kHz|count\(0) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111100000000111111110000000011000000000000001100000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \clockGenerator|counter_1kHz|ALT_INV_count\(2),
	datac => \clockGenerator|counter_1kHz|ALT_INV_count[1]~DUPLICATE_q\,
	datad => \clockGenerator|counter_1kHz|ALT_INV_count\(0),
	dataf => \clockGenerator|counter_1kHz|ALT_INV_count[3]~DUPLICATE_q\,
	combout => \clockGenerator|counter_1kHz|count~3_combout\);

-- Location: FF_X34_Y6_N29
\clockGenerator|counter_1kHz|count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK50~inputCLKENA0_outclk\,
	d => \clockGenerator|counter_1kHz|count~3_combout\,
	ena => \clockGenerator|counter_10kHz|rco_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clockGenerator|counter_1kHz|count\(0));

-- Location: MLABCELL_X34_Y6_N12
\clockGenerator|counter_1kHz|count~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \clockGenerator|counter_1kHz|count~1_combout\ = ( \clockGenerator|counter_1kHz|count\(2) & ( !\clockGenerator|counter_1kHz|count[3]~DUPLICATE_q\ & ( (!\clockGenerator|counter_1kHz|count\(0)) # (!\clockGenerator|counter_1kHz|count[1]~DUPLICATE_q\) ) ) ) # 
-- ( !\clockGenerator|counter_1kHz|count\(2) & ( !\clockGenerator|counter_1kHz|count[3]~DUPLICATE_q\ & ( (\clockGenerator|counter_1kHz|count\(0) & \clockGenerator|counter_1kHz|count[1]~DUPLICATE_q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111111111111111000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \clockGenerator|counter_1kHz|ALT_INV_count\(0),
	datad => \clockGenerator|counter_1kHz|ALT_INV_count[1]~DUPLICATE_q\,
	datae => \clockGenerator|counter_1kHz|ALT_INV_count\(2),
	dataf => \clockGenerator|counter_1kHz|ALT_INV_count[3]~DUPLICATE_q\,
	combout => \clockGenerator|counter_1kHz|count~1_combout\);

-- Location: FF_X34_Y6_N14
\clockGenerator|counter_1kHz|count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK50~inputCLKENA0_outclk\,
	d => \clockGenerator|counter_1kHz|count~1_combout\,
	ena => \clockGenerator|counter_10kHz|rco_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clockGenerator|counter_1kHz|count\(2));

-- Location: MLABCELL_X34_Y6_N21
\clockGenerator|counter_1kHz|LessThan1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \clockGenerator|counter_1kHz|LessThan1~0_combout\ = ( \clockGenerator|counter_1kHz|count\(3) ) # ( !\clockGenerator|counter_1kHz|count\(3) & ( (\clockGenerator|counter_1kHz|count\(2) & ((\clockGenerator|counter_1kHz|count\(0)) # 
-- (\clockGenerator|counter_1kHz|count[1]~DUPLICATE_q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100110011000000110011001111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \clockGenerator|counter_1kHz|ALT_INV_count\(2),
	datac => \clockGenerator|counter_1kHz|ALT_INV_count[1]~DUPLICATE_q\,
	datad => \clockGenerator|counter_1kHz|ALT_INV_count\(0),
	dataf => \clockGenerator|counter_1kHz|ALT_INV_count\(3),
	combout => \clockGenerator|counter_1kHz|LessThan1~0_combout\);

-- Location: MLABCELL_X34_Y6_N0
\clockGenerator|counter_1kHz|rco_out~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \clockGenerator|counter_1kHz|rco_out~0_combout\ = ( \clockGenerator|counter_1kHz|count\(0) & ( !\clockGenerator|counter_1kHz|count[1]~DUPLICATE_q\ & ( (\clockGenerator|counter_1kHz|count[3]~DUPLICATE_q\ & !\clockGenerator|counter_1kHz|count\(2)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000011110000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \clockGenerator|counter_1kHz|ALT_INV_count[3]~DUPLICATE_q\,
	datad => \clockGenerator|counter_1kHz|ALT_INV_count\(2),
	datae => \clockGenerator|counter_1kHz|ALT_INV_count\(0),
	dataf => \clockGenerator|counter_1kHz|ALT_INV_count[1]~DUPLICATE_q\,
	combout => \clockGenerator|counter_1kHz|rco_out~0_combout\);

-- Location: LABCELL_X35_Y6_N33
\clockGenerator|counter_1kHz|rco_out\ : cyclonev_lcell_comb
-- Equation(s):
-- \clockGenerator|counter_1kHz|rco_out~combout\ = ( \clockGenerator|counter_10MHz|Equal0~0_combout\ & ( (\clockGenerator|counter_1MHz|rco_out~0_combout\ & (\clockGenerator|counter_10kHz|rco_out~0_combout\ & (\clockGenerator|counter_1kHz|rco_out~0_combout\ & 
-- \clockGenerator|counter_100kHz|rco_out~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000010000000000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \clockGenerator|counter_1MHz|ALT_INV_rco_out~0_combout\,
	datab => \clockGenerator|counter_10kHz|ALT_INV_rco_out~0_combout\,
	datac => \clockGenerator|counter_1kHz|ALT_INV_rco_out~0_combout\,
	datad => \clockGenerator|counter_100kHz|ALT_INV_rco_out~0_combout\,
	dataf => \clockGenerator|counter_10MHz|ALT_INV_Equal0~0_combout\,
	combout => \clockGenerator|counter_1kHz|rco_out~combout\);

-- Location: FF_X35_Y6_N28
\clockGenerator|counter_100Hz|count[3]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK50~inputCLKENA0_outclk\,
	d => \clockGenerator|counter_100Hz|count~0_combout\,
	ena => \clockGenerator|counter_1kHz|rco_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clockGenerator|counter_100Hz|count[3]~DUPLICATE_q\);

-- Location: FF_X35_Y6_N20
\clockGenerator|counter_100Hz|count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK50~inputCLKENA0_outclk\,
	d => \clockGenerator|counter_100Hz|count~3_combout\,
	ena => \clockGenerator|counter_1kHz|rco_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clockGenerator|counter_100Hz|count\(0));

-- Location: FF_X35_Y6_N22
\clockGenerator|counter_100Hz|count[2]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK50~inputCLKENA0_outclk\,
	d => \clockGenerator|counter_100Hz|count~1_combout\,
	ena => \clockGenerator|counter_1kHz|rco_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clockGenerator|counter_100Hz|count[2]~DUPLICATE_q\);

-- Location: LABCELL_X35_Y6_N18
\clockGenerator|counter_100Hz|count~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \clockGenerator|counter_100Hz|count~3_combout\ = ( \clockGenerator|counter_100Hz|count[2]~DUPLICATE_q\ & ( (!\clockGenerator|counter_100Hz|count\(3) & !\clockGenerator|counter_100Hz|count\(0)) ) ) # ( !\clockGenerator|counter_100Hz|count[2]~DUPLICATE_q\ & 
-- ( (!\clockGenerator|counter_100Hz|count\(0) & ((!\clockGenerator|counter_100Hz|count\(1)) # (!\clockGenerator|counter_100Hz|count\(3)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111110000000000111111000000000011110000000000001111000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \clockGenerator|counter_100Hz|ALT_INV_count\(1),
	datac => \clockGenerator|counter_100Hz|ALT_INV_count\(3),
	datad => \clockGenerator|counter_100Hz|ALT_INV_count\(0),
	dataf => \clockGenerator|counter_100Hz|ALT_INV_count[2]~DUPLICATE_q\,
	combout => \clockGenerator|counter_100Hz|count~3_combout\);

-- Location: FF_X35_Y6_N19
\clockGenerator|counter_100Hz|count[0]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK50~inputCLKENA0_outclk\,
	d => \clockGenerator|counter_100Hz|count~3_combout\,
	ena => \clockGenerator|counter_1kHz|rco_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clockGenerator|counter_100Hz|count[0]~DUPLICATE_q\);

-- Location: LABCELL_X35_Y6_N9
\clockGenerator|counter_100Hz|count~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \clockGenerator|counter_100Hz|count~2_combout\ = ( \clockGenerator|counter_100Hz|count[0]~DUPLICATE_q\ & ( (!\clockGenerator|counter_100Hz|count[3]~DUPLICATE_q\ & !\clockGenerator|counter_100Hz|count\(1)) ) ) # ( 
-- !\clockGenerator|counter_100Hz|count[0]~DUPLICATE_q\ & ( (!\clockGenerator|counter_100Hz|count[3]~DUPLICATE_q\ & \clockGenerator|counter_100Hz|count\(1)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011110000000000001111000011110000000000001111000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \clockGenerator|counter_100Hz|ALT_INV_count[3]~DUPLICATE_q\,
	datad => \clockGenerator|counter_100Hz|ALT_INV_count\(1),
	dataf => \clockGenerator|counter_100Hz|ALT_INV_count[0]~DUPLICATE_q\,
	combout => \clockGenerator|counter_100Hz|count~2_combout\);

-- Location: FF_X35_Y6_N11
\clockGenerator|counter_100Hz|count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK50~inputCLKENA0_outclk\,
	d => \clockGenerator|counter_100Hz|count~2_combout\,
	ena => \clockGenerator|counter_1kHz|rco_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clockGenerator|counter_100Hz|count\(1));

-- Location: LABCELL_X35_Y6_N27
\clockGenerator|counter_100Hz|count~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \clockGenerator|counter_100Hz|count~0_combout\ = ( \clockGenerator|counter_100Hz|count[0]~DUPLICATE_q\ & ( (\clockGenerator|counter_100Hz|count\(2) & (\clockGenerator|counter_100Hz|count\(1) & !\clockGenerator|counter_100Hz|count\(3))) ) ) # ( 
-- !\clockGenerator|counter_100Hz|count[0]~DUPLICATE_q\ & ( (!\clockGenerator|counter_100Hz|count\(2) & (!\clockGenerator|counter_100Hz|count\(1) & \clockGenerator|counter_100Hz|count\(3))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010100000000000001010000000000101000000000000010100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \clockGenerator|counter_100Hz|ALT_INV_count\(2),
	datac => \clockGenerator|counter_100Hz|ALT_INV_count\(1),
	datad => \clockGenerator|counter_100Hz|ALT_INV_count\(3),
	dataf => \clockGenerator|counter_100Hz|ALT_INV_count[0]~DUPLICATE_q\,
	combout => \clockGenerator|counter_100Hz|count~0_combout\);

-- Location: FF_X35_Y6_N29
\clockGenerator|counter_100Hz|count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK50~inputCLKENA0_outclk\,
	d => \clockGenerator|counter_100Hz|count~0_combout\,
	ena => \clockGenerator|counter_1kHz|rco_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clockGenerator|counter_100Hz|count\(3));

-- Location: LABCELL_X35_Y6_N21
\clockGenerator|counter_100Hz|count~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \clockGenerator|counter_100Hz|count~1_combout\ = ( \clockGenerator|counter_100Hz|count[0]~DUPLICATE_q\ & ( (!\clockGenerator|counter_100Hz|count\(3) & (!\clockGenerator|counter_100Hz|count\(1) $ (!\clockGenerator|counter_100Hz|count\(2)))) ) ) # ( 
-- !\clockGenerator|counter_100Hz|count[0]~DUPLICATE_q\ & ( (!\clockGenerator|counter_100Hz|count\(3) & \clockGenerator|counter_100Hz|count\(2)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010101010000000001010101000001010101000000000101010100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \clockGenerator|counter_100Hz|ALT_INV_count\(3),
	datac => \clockGenerator|counter_100Hz|ALT_INV_count\(1),
	datad => \clockGenerator|counter_100Hz|ALT_INV_count\(2),
	dataf => \clockGenerator|counter_100Hz|ALT_INV_count[0]~DUPLICATE_q\,
	combout => \clockGenerator|counter_100Hz|count~1_combout\);

-- Location: FF_X35_Y6_N23
\clockGenerator|counter_100Hz|count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK50~inputCLKENA0_outclk\,
	d => \clockGenerator|counter_100Hz|count~1_combout\,
	ena => \clockGenerator|counter_1kHz|rco_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clockGenerator|counter_100Hz|count\(2));

-- Location: LABCELL_X35_Y6_N24
\clockGenerator|counter_100Hz|LessThan1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \clockGenerator|counter_100Hz|LessThan1~0_combout\ = ( \clockGenerator|counter_100Hz|count\(1) & ( (\clockGenerator|counter_100Hz|count\(3)) # (\clockGenerator|counter_100Hz|count\(2)) ) ) # ( !\clockGenerator|counter_100Hz|count\(1) & ( 
-- ((\clockGenerator|counter_100Hz|count\(2) & \clockGenerator|counter_100Hz|count\(0))) # (\clockGenerator|counter_100Hz|count\(3)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010111111111000001011111111101010101111111110101010111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \clockGenerator|counter_100Hz|ALT_INV_count\(2),
	datac => \clockGenerator|counter_100Hz|ALT_INV_count\(0),
	datad => \clockGenerator|counter_100Hz|ALT_INV_count\(3),
	dataf => \clockGenerator|counter_100Hz|ALT_INV_count\(1),
	combout => \clockGenerator|counter_100Hz|LessThan1~0_combout\);

-- Location: LABCELL_X35_Y6_N0
\clockGenerator|counter_100Hz|rco_out~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \clockGenerator|counter_100Hz|rco_out~0_combout\ = ( \clockGenerator|counter_100Hz|count[3]~DUPLICATE_q\ & ( (!\clockGenerator|counter_100Hz|count\(1) & (\clockGenerator|counter_100Hz|count\(0) & !\clockGenerator|counter_100Hz|count\(2))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000001100000000000000110000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \clockGenerator|counter_100Hz|ALT_INV_count\(1),
	datac => \clockGenerator|counter_100Hz|ALT_INV_count\(0),
	datad => \clockGenerator|counter_100Hz|ALT_INV_count\(2),
	dataf => \clockGenerator|counter_100Hz|ALT_INV_count[3]~DUPLICATE_q\,
	combout => \clockGenerator|counter_100Hz|rco_out~0_combout\);

-- Location: LABCELL_X35_Y6_N48
\clockGenerator|counter_100Hz|rco_out\ : cyclonev_lcell_comb
-- Equation(s):
-- \clockGenerator|counter_100Hz|rco_out~combout\ = ( \clockGenerator|counter_100Hz|rco_out~0_combout\ & ( \clockGenerator|counter_10kHz|rco_out~0_combout\ & ( (\clockGenerator|counter_1MHz|rco_out~0_combout\ & 
-- (\clockGenerator|counter_100kHz|rco_out~0_combout\ & (\clockGenerator|counter_10MHz|Equal0~0_combout\ & \clockGenerator|counter_1kHz|rco_out~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \clockGenerator|counter_1MHz|ALT_INV_rco_out~0_combout\,
	datab => \clockGenerator|counter_100kHz|ALT_INV_rco_out~0_combout\,
	datac => \clockGenerator|counter_10MHz|ALT_INV_Equal0~0_combout\,
	datad => \clockGenerator|counter_1kHz|ALT_INV_rco_out~0_combout\,
	datae => \clockGenerator|counter_100Hz|ALT_INV_rco_out~0_combout\,
	dataf => \clockGenerator|counter_10kHz|ALT_INV_rco_out~0_combout\,
	combout => \clockGenerator|counter_100Hz|rco_out~combout\);

-- Location: FF_X35_Y6_N53
\clockGenerator|counter_10Hz|count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK50~inputCLKENA0_outclk\,
	asdata => \clockGenerator|counter_10Hz|count~3_combout\,
	sload => VCC,
	ena => \clockGenerator|counter_100Hz|rco_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clockGenerator|counter_10Hz|count\(0));

-- Location: FF_X35_Y6_N31
\clockGenerator|counter_10Hz|count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK50~inputCLKENA0_outclk\,
	d => \clockGenerator|counter_10Hz|count~2_combout\,
	ena => \clockGenerator|counter_100Hz|rco_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clockGenerator|counter_10Hz|count\(1));

-- Location: LABCELL_X35_Y6_N30
\clockGenerator|counter_10Hz|count~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \clockGenerator|counter_10Hz|count~2_combout\ = ( !\clockGenerator|counter_10Hz|count\(3) & ( !\clockGenerator|counter_10Hz|count\(0) $ (!\clockGenerator|counter_10Hz|count\(1)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111111110000000011111111000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \clockGenerator|counter_10Hz|ALT_INV_count\(0),
	datad => \clockGenerator|counter_10Hz|ALT_INV_count\(1),
	dataf => \clockGenerator|counter_10Hz|ALT_INV_count\(3),
	combout => \clockGenerator|counter_10Hz|count~2_combout\);

-- Location: FF_X35_Y6_N32
\clockGenerator|counter_10Hz|count[1]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK50~inputCLKENA0_outclk\,
	d => \clockGenerator|counter_10Hz|count~2_combout\,
	ena => \clockGenerator|counter_100Hz|rco_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clockGenerator|counter_10Hz|count[1]~DUPLICATE_q\);

-- Location: LABCELL_X35_Y6_N3
\clockGenerator|counter_10Hz|count~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \clockGenerator|counter_10Hz|count~1_combout\ = ( !\clockGenerator|counter_10Hz|count\(3) & ( !\clockGenerator|counter_10Hz|count\(2) $ (((!\clockGenerator|counter_10Hz|count\(0)) # (!\clockGenerator|counter_10Hz|count[1]~DUPLICATE_q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010111111010000001011111101000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \clockGenerator|counter_10Hz|ALT_INV_count\(0),
	datac => \clockGenerator|counter_10Hz|ALT_INV_count[1]~DUPLICATE_q\,
	datad => \clockGenerator|counter_10Hz|ALT_INV_count\(2),
	dataf => \clockGenerator|counter_10Hz|ALT_INV_count\(3),
	combout => \clockGenerator|counter_10Hz|count~1_combout\);

-- Location: FF_X35_Y6_N5
\clockGenerator|counter_10Hz|count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK50~inputCLKENA0_outclk\,
	d => \clockGenerator|counter_10Hz|count~1_combout\,
	ena => \clockGenerator|counter_100Hz|rco_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clockGenerator|counter_10Hz|count\(2));

-- Location: LABCELL_X35_Y6_N12
\clockGenerator|counter_10Hz|count~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \clockGenerator|counter_10Hz|count~0_combout\ = ( \clockGenerator|counter_10Hz|count\(0) & ( (\clockGenerator|counter_10Hz|count[1]~DUPLICATE_q\ & (\clockGenerator|counter_10Hz|count\(2) & !\clockGenerator|counter_10Hz|count\(3))) ) ) # ( 
-- !\clockGenerator|counter_10Hz|count\(0) & ( (!\clockGenerator|counter_10Hz|count[1]~DUPLICATE_q\ & (!\clockGenerator|counter_10Hz|count\(2) & \clockGenerator|counter_10Hz|count\(3))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011000000000000001100000000000011000000000000001100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \clockGenerator|counter_10Hz|ALT_INV_count[1]~DUPLICATE_q\,
	datac => \clockGenerator|counter_10Hz|ALT_INV_count\(2),
	datad => \clockGenerator|counter_10Hz|ALT_INV_count\(3),
	dataf => \clockGenerator|counter_10Hz|ALT_INV_count\(0),
	combout => \clockGenerator|counter_10Hz|count~0_combout\);

-- Location: FF_X35_Y6_N14
\clockGenerator|counter_10Hz|count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK50~inputCLKENA0_outclk\,
	d => \clockGenerator|counter_10Hz|count~0_combout\,
	ena => \clockGenerator|counter_100Hz|rco_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clockGenerator|counter_10Hz|count\(3));

-- Location: LABCELL_X35_Y6_N6
\clockGenerator|counter_10Hz|count~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \clockGenerator|counter_10Hz|count~3_combout\ = ( \clockGenerator|counter_10Hz|count[1]~DUPLICATE_q\ & ( (!\clockGenerator|counter_10Hz|count\(0) & !\clockGenerator|counter_10Hz|count\(3)) ) ) # ( !\clockGenerator|counter_10Hz|count[1]~DUPLICATE_q\ & ( 
-- (!\clockGenerator|counter_10Hz|count\(0) & ((!\clockGenerator|counter_10Hz|count\(3)) # (!\clockGenerator|counter_10Hz|count\(2)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010100010101000101010001010100010001000100010001000100010001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \clockGenerator|counter_10Hz|ALT_INV_count\(0),
	datab => \clockGenerator|counter_10Hz|ALT_INV_count\(3),
	datac => \clockGenerator|counter_10Hz|ALT_INV_count\(2),
	dataf => \clockGenerator|counter_10Hz|ALT_INV_count[1]~DUPLICATE_q\,
	combout => \clockGenerator|counter_10Hz|count~3_combout\);

-- Location: FF_X35_Y6_N52
\clockGenerator|counter_10Hz|count[0]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK50~inputCLKENA0_outclk\,
	asdata => \clockGenerator|counter_10Hz|count~3_combout\,
	sload => VCC,
	ena => \clockGenerator|counter_100Hz|rco_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clockGenerator|counter_10Hz|count[0]~DUPLICATE_q\);

-- Location: FF_X35_Y6_N4
\clockGenerator|counter_10Hz|count[2]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK50~inputCLKENA0_outclk\,
	d => \clockGenerator|counter_10Hz|count~1_combout\,
	ena => \clockGenerator|counter_100Hz|rco_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clockGenerator|counter_10Hz|count[2]~DUPLICATE_q\);

-- Location: FF_X35_Y6_N13
\clockGenerator|counter_10Hz|count[3]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK50~inputCLKENA0_outclk\,
	d => \clockGenerator|counter_10Hz|count~0_combout\,
	ena => \clockGenerator|counter_100Hz|rco_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clockGenerator|counter_10Hz|count[3]~DUPLICATE_q\);

-- Location: LABCELL_X36_Y6_N33
\clockGenerator|counter_10Hz|LessThan1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \clockGenerator|counter_10Hz|LessThan1~0_combout\ = ( \clockGenerator|counter_10Hz|count\(1) & ( (\clockGenerator|counter_10Hz|count[3]~DUPLICATE_q\) # (\clockGenerator|counter_10Hz|count[2]~DUPLICATE_q\) ) ) # ( !\clockGenerator|counter_10Hz|count\(1) & 
-- ( ((\clockGenerator|counter_10Hz|count[0]~DUPLICATE_q\ & \clockGenerator|counter_10Hz|count[2]~DUPLICATE_q\)) # (\clockGenerator|counter_10Hz|count[3]~DUPLICATE_q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010111111111000001011111111100001111111111110000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \clockGenerator|counter_10Hz|ALT_INV_count[0]~DUPLICATE_q\,
	datac => \clockGenerator|counter_10Hz|ALT_INV_count[2]~DUPLICATE_q\,
	datad => \clockGenerator|counter_10Hz|ALT_INV_count[3]~DUPLICATE_q\,
	dataf => \clockGenerator|counter_10Hz|ALT_INV_count\(1),
	combout => \clockGenerator|counter_10Hz|LessThan1~0_combout\);

-- Location: IOIBUF_X34_Y0_N35
\SW[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(7),
	o => \SW[7]~input_o\);

-- Location: LABCELL_X35_Y6_N15
\clockGenerator|counter_10Hz|rco_out\ : cyclonev_lcell_comb
-- Equation(s):
-- \clockGenerator|counter_10Hz|rco_out~combout\ = ( \clockGenerator|counter_100Hz|rco_out~combout\ & ( (\clockGenerator|counter_10Hz|count\(0) & (!\clockGenerator|counter_10Hz|count[1]~DUPLICATE_q\ & (\clockGenerator|counter_10Hz|count\(3) & 
-- !\clockGenerator|counter_10Hz|count\(2)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000100000000000000010000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \clockGenerator|counter_10Hz|ALT_INV_count\(0),
	datab => \clockGenerator|counter_10Hz|ALT_INV_count[1]~DUPLICATE_q\,
	datac => \clockGenerator|counter_10Hz|ALT_INV_count\(3),
	datad => \clockGenerator|counter_10Hz|ALT_INV_count\(2),
	dataf => \clockGenerator|counter_100Hz|ALT_INV_rco_out~combout\,
	combout => \clockGenerator|counter_10Hz|rco_out~combout\);

-- Location: FF_X35_Y6_N38
\clockGenerator|counter_1Hz|count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK50~inputCLKENA0_outclk\,
	d => \clockGenerator|counter_1Hz|count~1_combout\,
	ena => \clockGenerator|counter_10Hz|rco_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clockGenerator|counter_1Hz|count\(2));

-- Location: LABCELL_X35_Y6_N42
\clockGenerator|counter_1Hz|count~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \clockGenerator|counter_1Hz|count~0_combout\ = ( \clockGenerator|counter_1Hz|count\(1) & ( (\clockGenerator|counter_1Hz|count\(0) & (\clockGenerator|counter_1Hz|count\(2) & !\clockGenerator|counter_1Hz|count\(3))) ) ) # ( 
-- !\clockGenerator|counter_1Hz|count\(1) & ( (!\clockGenerator|counter_1Hz|count\(0) & (!\clockGenerator|counter_1Hz|count\(2) & \clockGenerator|counter_1Hz|count\(3))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010100000000000001010000000000101000000000000010100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \clockGenerator|counter_1Hz|ALT_INV_count\(0),
	datac => \clockGenerator|counter_1Hz|ALT_INV_count\(2),
	datad => \clockGenerator|counter_1Hz|ALT_INV_count\(3),
	dataf => \clockGenerator|counter_1Hz|ALT_INV_count\(1),
	combout => \clockGenerator|counter_1Hz|count~0_combout\);

-- Location: FF_X35_Y6_N44
\clockGenerator|counter_1Hz|count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK50~inputCLKENA0_outclk\,
	d => \clockGenerator|counter_1Hz|count~0_combout\,
	ena => \clockGenerator|counter_10Hz|rco_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clockGenerator|counter_1Hz|count\(3));

-- Location: LABCELL_X35_Y6_N54
\clockGenerator|counter_1Hz|count~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \clockGenerator|counter_1Hz|count~3_combout\ = ( \clockGenerator|counter_1Hz|count\(3) & ( (!\clockGenerator|counter_1Hz|count\(1) & (!\clockGenerator|counter_1Hz|count\(2) & !\clockGenerator|counter_1Hz|count\(0))) ) ) # ( 
-- !\clockGenerator|counter_1Hz|count\(3) & ( !\clockGenerator|counter_1Hz|count\(0) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111100000000111111110000000011000000000000001100000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \clockGenerator|counter_1Hz|ALT_INV_count\(1),
	datac => \clockGenerator|counter_1Hz|ALT_INV_count\(2),
	datad => \clockGenerator|counter_1Hz|ALT_INV_count\(0),
	dataf => \clockGenerator|counter_1Hz|ALT_INV_count\(3),
	combout => \clockGenerator|counter_1Hz|count~3_combout\);

-- Location: FF_X35_Y6_N56
\clockGenerator|counter_1Hz|count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK50~inputCLKENA0_outclk\,
	d => \clockGenerator|counter_1Hz|count~3_combout\,
	ena => \clockGenerator|counter_10Hz|rco_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clockGenerator|counter_1Hz|count\(0));

-- Location: LABCELL_X35_Y6_N45
\clockGenerator|counter_1Hz|count~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \clockGenerator|counter_1Hz|count~2_combout\ = ( !\clockGenerator|counter_1Hz|count\(3) & ( !\clockGenerator|counter_1Hz|count\(0) $ (!\clockGenerator|counter_1Hz|count\(1)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010110101010010101011010101000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \clockGenerator|counter_1Hz|ALT_INV_count\(0),
	datad => \clockGenerator|counter_1Hz|ALT_INV_count\(1),
	dataf => \clockGenerator|counter_1Hz|ALT_INV_count\(3),
	combout => \clockGenerator|counter_1Hz|count~2_combout\);

-- Location: FF_X35_Y6_N47
\clockGenerator|counter_1Hz|count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK50~inputCLKENA0_outclk\,
	d => \clockGenerator|counter_1Hz|count~2_combout\,
	ena => \clockGenerator|counter_10Hz|rco_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clockGenerator|counter_1Hz|count\(1));

-- Location: LABCELL_X35_Y6_N36
\clockGenerator|counter_1Hz|count~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \clockGenerator|counter_1Hz|count~1_combout\ = ( !\clockGenerator|counter_1Hz|count\(3) & ( !\clockGenerator|counter_1Hz|count\(2) $ (((!\clockGenerator|counter_1Hz|count\(1)) # (!\clockGenerator|counter_1Hz|count\(0)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001111111100000000111111110000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \clockGenerator|counter_1Hz|ALT_INV_count\(1),
	datac => \clockGenerator|counter_1Hz|ALT_INV_count\(0),
	datad => \clockGenerator|counter_1Hz|ALT_INV_count\(2),
	dataf => \clockGenerator|counter_1Hz|ALT_INV_count\(3),
	combout => \clockGenerator|counter_1Hz|count~1_combout\);

-- Location: FF_X35_Y6_N37
\clockGenerator|counter_1Hz|count[2]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK50~inputCLKENA0_outclk\,
	d => \clockGenerator|counter_1Hz|count~1_combout\,
	ena => \clockGenerator|counter_10Hz|rco_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clockGenerator|counter_1Hz|count[2]~DUPLICATE_q\);

-- Location: FF_X35_Y6_N43
\clockGenerator|counter_1Hz|count[3]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK50~inputCLKENA0_outclk\,
	d => \clockGenerator|counter_1Hz|count~0_combout\,
	ena => \clockGenerator|counter_10Hz|rco_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clockGenerator|counter_1Hz|count[3]~DUPLICATE_q\);

-- Location: FF_X35_Y6_N55
\clockGenerator|counter_1Hz|count[0]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK50~inputCLKENA0_outclk\,
	d => \clockGenerator|counter_1Hz|count~3_combout\,
	ena => \clockGenerator|counter_10Hz|rco_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clockGenerator|counter_1Hz|count[0]~DUPLICATE_q\);

-- Location: FF_X35_Y6_N46
\clockGenerator|counter_1Hz|count[1]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK50~inputCLKENA0_outclk\,
	d => \clockGenerator|counter_1Hz|count~2_combout\,
	ena => \clockGenerator|counter_10Hz|rco_out~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clockGenerator|counter_1Hz|count[1]~DUPLICATE_q\);

-- Location: LABCELL_X39_Y6_N36
\clockGenerator|counter_1Hz|LessThan1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \clockGenerator|counter_1Hz|LessThan1~0_combout\ = ( \clockGenerator|counter_1Hz|count[0]~DUPLICATE_q\ & ( \clockGenerator|counter_1Hz|count[1]~DUPLICATE_q\ & ( (\clockGenerator|counter_1Hz|count[3]~DUPLICATE_q\) # 
-- (\clockGenerator|counter_1Hz|count[2]~DUPLICATE_q\) ) ) ) # ( !\clockGenerator|counter_1Hz|count[0]~DUPLICATE_q\ & ( \clockGenerator|counter_1Hz|count[1]~DUPLICATE_q\ & ( (\clockGenerator|counter_1Hz|count[3]~DUPLICATE_q\) # 
-- (\clockGenerator|counter_1Hz|count[2]~DUPLICATE_q\) ) ) ) # ( \clockGenerator|counter_1Hz|count[0]~DUPLICATE_q\ & ( !\clockGenerator|counter_1Hz|count[1]~DUPLICATE_q\ & ( (\clockGenerator|counter_1Hz|count[3]~DUPLICATE_q\) # 
-- (\clockGenerator|counter_1Hz|count[2]~DUPLICATE_q\) ) ) ) # ( !\clockGenerator|counter_1Hz|count[0]~DUPLICATE_q\ & ( !\clockGenerator|counter_1Hz|count[1]~DUPLICATE_q\ & ( \clockGenerator|counter_1Hz|count[3]~DUPLICATE_q\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111001100111111111100110011111111110011001111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \clockGenerator|counter_1Hz|ALT_INV_count[2]~DUPLICATE_q\,
	datad => \clockGenerator|counter_1Hz|ALT_INV_count[3]~DUPLICATE_q\,
	datae => \clockGenerator|counter_1Hz|ALT_INV_count[0]~DUPLICATE_q\,
	dataf => \clockGenerator|counter_1Hz|ALT_INV_count[1]~DUPLICATE_q\,
	combout => \clockGenerator|counter_1Hz|LessThan1~0_combout\);

-- Location: LABCELL_X40_Y6_N21
\clockGenerator|Mux0~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \clockGenerator|Mux0~4_combout\ = ( !\SW[8]~input_o\ & ( (!\SW[9]~input_o\ & (((!\SW[7]~input_o\ & (\clockGenerator|counter_1Hz|LessThan1~0_combout\)) # (\SW[7]~input_o\ & ((\clockGenerator|counter_10Hz|LessThan1~0_combout\)))))) # (\SW[9]~input_o\ & 
-- ((((\SW[7]~input_o\))))) ) ) # ( \SW[8]~input_o\ & ( (!\SW[9]~input_o\ & (((!\SW[7]~input_o\ & ((\clockGenerator|counter_100Hz|LessThan1~0_combout\))) # (\SW[7]~input_o\ & (\clockGenerator|counter_1kHz|LessThan1~0_combout\))))) # (\SW[9]~input_o\ & 
-- ((((\SW[7]~input_o\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000101000001010000010100000101001010101111111110111011101110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_SW[9]~input_o\,
	datab => \clockGenerator|counter_1kHz|ALT_INV_LessThan1~0_combout\,
	datac => \clockGenerator|counter_100Hz|ALT_INV_LessThan1~0_combout\,
	datad => \clockGenerator|counter_10Hz|ALT_INV_LessThan1~0_combout\,
	datae => \ALT_INV_SW[8]~input_o\,
	dataf => \ALT_INV_SW[7]~input_o\,
	datag => \clockGenerator|counter_1Hz|ALT_INV_LessThan1~0_combout\,
	combout => \clockGenerator|Mux0~4_combout\);

-- Location: LABCELL_X36_Y6_N3
\clockGenerator|counter_10kHz|LessThan1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \clockGenerator|counter_10kHz|LessThan1~0_combout\ = ( \clockGenerator|counter_10kHz|count\(0) & ( (\clockGenerator|counter_10kHz|count\(3)) # (\clockGenerator|counter_10kHz|count\(2)) ) ) # ( !\clockGenerator|counter_10kHz|count\(0) & ( 
-- ((\clockGenerator|counter_10kHz|count\(2) & \clockGenerator|counter_10kHz|count[1]~DUPLICATE_q\)) # (\clockGenerator|counter_10kHz|count\(3)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001111100011111000111110001111101011111010111110101111101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \clockGenerator|counter_10kHz|ALT_INV_count\(2),
	datab => \clockGenerator|counter_10kHz|ALT_INV_count[1]~DUPLICATE_q\,
	datac => \clockGenerator|counter_10kHz|ALT_INV_count\(3),
	dataf => \clockGenerator|counter_10kHz|ALT_INV_count\(0),
	combout => \clockGenerator|counter_10kHz|LessThan1~0_combout\);

-- Location: LABCELL_X40_Y6_N6
\clockGenerator|Mux0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \clockGenerator|Mux0~0_combout\ = ( !\SW[8]~input_o\ & ( ((!\SW[9]~input_o\ & (((\clockGenerator|Mux0~4_combout\)))) # (\SW[9]~input_o\ & ((!\clockGenerator|Mux0~4_combout\ & ((\clockGenerator|counter_10kHz|LessThan1~0_combout\))) # 
-- (\clockGenerator|Mux0~4_combout\ & (\clockGenerator|counter_100kHz|LessThan1~0_combout\))))) ) ) # ( \SW[8]~input_o\ & ( ((!\SW[9]~input_o\ & (((\clockGenerator|Mux0~4_combout\)))) # (\SW[9]~input_o\ & ((!\clockGenerator|Mux0~4_combout\ & 
-- ((\clockGenerator|counter_1MHz|LessThan1~0_combout\))) # (\clockGenerator|Mux0~4_combout\ & (\clockGenerator|counter_10MHz|LessThan1~0_combout\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000000000001111000000000000111111111111001100111111111101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \clockGenerator|counter_10MHz|ALT_INV_LessThan1~0_combout\,
	datab => \clockGenerator|counter_100kHz|ALT_INV_LessThan1~0_combout\,
	datac => \clockGenerator|counter_1MHz|ALT_INV_LessThan1~0_combout\,
	datad => \ALT_INV_SW[9]~input_o\,
	datae => \ALT_INV_SW[8]~input_o\,
	dataf => \clockGenerator|ALT_INV_Mux0~4_combout\,
	datag => \clockGenerator|counter_10kHz|ALT_INV_LessThan1~0_combout\,
	combout => \clockGenerator|Mux0~0_combout\);

-- Location: FF_X40_Y6_N8
\clockGenerator|var_clock\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK50~input_o\,
	d => \clockGenerator|Mux0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clockGenerator|var_clock~q\);

-- Location: IOIBUF_X54_Y16_N55
\RESET_N~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_RESET_N,
	o => \RESET_N~input_o\);

-- Location: IOIBUF_X10_Y0_N92
\KEY[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(0),
	o => \KEY[0]~input_o\);

-- Location: IOIBUF_X14_Y0_N18
\KEY[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(3),
	o => \KEY[3]~input_o\);

-- Location: IOIBUF_X14_Y0_N1
\KEY[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(2),
	o => \KEY[2]~input_o\);

-- Location: LABCELL_X39_Y5_N45
\theLab|SCURR~23\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|SCURR~23_combout\ = ( \theLab|SCURR.ready~q\ & ( (\RESET_N~input_o\ & !\KEY[3]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000001000100010001000100010001000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_RESET_N~input_o\,
	datab => \ALT_INV_KEY[3]~input_o\,
	dataf => \theLab|ALT_INV_SCURR.ready~q\,
	combout => \theLab|SCURR~23_combout\);

-- Location: FF_X39_Y5_N47
\theLab|SCURR.a_won\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clockGenerator|var_clock~q\,
	d => \theLab|SCURR~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \theLab|SCURR.a_won~q\);

-- Location: LABCELL_X40_Y4_N54
\theLab|b_count_score|COUNT~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|b_count_score|COUNT~0_combout\ = ( !\theLab|b_count_score|COUNT\(0) & ( \RESET_N~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_RESET_N~input_o\,
	dataf => \theLab|b_count_score|ALT_INV_COUNT\(0),
	combout => \theLab|b_count_score|COUNT~0_combout\);

-- Location: LABCELL_X40_Y5_N36
\theLab|SCURR~28\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|SCURR~28_combout\ = ( \theLab|SCURR.init~q\ & ( \RESET_N~input_o\ ) ) # ( !\theLab|SCURR.init~q\ & ( (!\KEY[2]~input_o\ & \RESET_N~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101000001010000010100000101000001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_KEY[2]~input_o\,
	datac => \ALT_INV_RESET_N~input_o\,
	dataf => \theLab|ALT_INV_SCURR.init~q\,
	combout => \theLab|SCURR~28_combout\);

-- Location: FF_X40_Y5_N14
\theLab|SCURR.init\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clockGenerator|var_clock~q\,
	asdata => \theLab|SCURR~28_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \theLab|SCURR.init~q\);

-- Location: LABCELL_X39_Y5_N54
\theLab|SCURR~27\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|SCURR~27_combout\ = ( !\KEY[0]~input_o\ & ( \theLab|SCURR.led~q\ & ( (\RESET_N~input_o\ & \KEY[3]~input_o\) ) ) ) # ( !\KEY[0]~input_o\ & ( !\theLab|SCURR.led~q\ & ( (\RESET_N~input_o\ & (\KEY[3]~input_o\ & ((\theLab|SCURR.start~q\) # 
-- (\theLab|SCURR.countdown~q\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000111000000000000000000000000000011110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \theLab|ALT_INV_SCURR.countdown~q\,
	datab => \theLab|ALT_INV_SCURR.start~q\,
	datac => \ALT_INV_RESET_N~input_o\,
	datad => \ALT_INV_KEY[3]~input_o\,
	datae => \ALT_INV_KEY[0]~input_o\,
	dataf => \theLab|ALT_INV_SCURR.led~q\,
	combout => \theLab|SCURR~27_combout\);

-- Location: FF_X39_Y5_N56
\theLab|SCURR.b_false\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clockGenerator|var_clock~q\,
	d => \theLab|SCURR~27_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \theLab|SCURR.b_false~q\);

-- Location: LABCELL_X39_Y5_N12
\theLab|WideOr3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|WideOr3~0_combout\ = ( !\theLab|SCURR.a_false~q\ & ( !\theLab|SCURR.b_false~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111100000000111111110000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \theLab|ALT_INV_SCURR.b_false~q\,
	dataf => \theLab|ALT_INV_SCURR.a_false~q\,
	combout => \theLab|WideOr3~0_combout\);

-- Location: LABCELL_X40_Y4_N3
\theLab|a_count_score|COUNT~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|a_count_score|COUNT~0_combout\ = ( \RESET_N~input_o\ & ( !\theLab|a_count_score|COUNT\(0) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011001100110011001100110011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \theLab|a_count_score|ALT_INV_COUNT\(0),
	dataf => \ALT_INV_RESET_N~input_o\,
	combout => \theLab|a_count_score|COUNT~0_combout\);

-- Location: LABCELL_X40_Y4_N33
\theLab|a_count_score|COUNT[2]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|a_count_score|COUNT[2]~1_combout\ = ( \theLab|SCURR.a_won~q\ ) # ( !\theLab|SCURR.a_won~q\ & ( (!\RESET_N~input_o\) # (\theLab|SCURR.b_false~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100111111001111110011111100111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_RESET_N~input_o\,
	datac => \theLab|ALT_INV_SCURR.b_false~q\,
	dataf => \theLab|ALT_INV_SCURR.a_won~q\,
	combout => \theLab|a_count_score|COUNT[2]~1_combout\);

-- Location: FF_X40_Y4_N32
\theLab|a_count_score|COUNT[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clockGenerator|var_clock~q\,
	asdata => \theLab|a_count_score|COUNT~0_combout\,
	sload => VCC,
	ena => \theLab|a_count_score|COUNT[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \theLab|a_count_score|COUNT\(0));

-- Location: LABCELL_X39_Y4_N39
\theLab|a_count_score|Add0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|a_count_score|Add0~0_combout\ = ( \theLab|a_count_score|COUNT\(0) & ( !\theLab|a_count_score|COUNT\(1) ) ) # ( !\theLab|a_count_score|COUNT\(0) & ( \theLab|a_count_score|COUNT\(1) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010110101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \theLab|a_count_score|ALT_INV_COUNT\(1),
	dataf => \theLab|a_count_score|ALT_INV_COUNT\(0),
	combout => \theLab|a_count_score|Add0~0_combout\);

-- Location: FF_X40_Y4_N53
\theLab|a_count_score|COUNT[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clockGenerator|var_clock~q\,
	asdata => \theLab|a_count_score|Add0~0_combout\,
	sclr => \ALT_INV_RESET_N~input_o\,
	sload => VCC,
	ena => \theLab|a_count_score|COUNT[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \theLab|a_count_score|COUNT\(1));

-- Location: LABCELL_X40_Y4_N9
\theLab|a_count_score|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|a_count_score|Add0~1_combout\ = ( \theLab|a_count_score|COUNT\(1) & ( !\theLab|a_count_score|COUNT\(2) $ (!\theLab|a_count_score|COUNT\(0)) ) ) # ( !\theLab|a_count_score|COUNT\(1) & ( \theLab|a_count_score|COUNT\(2) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010101011010010110100101101001011010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \theLab|a_count_score|ALT_INV_COUNT\(2),
	datac => \theLab|a_count_score|ALT_INV_COUNT\(0),
	dataf => \theLab|a_count_score|ALT_INV_COUNT\(1),
	combout => \theLab|a_count_score|Add0~1_combout\);

-- Location: FF_X40_Y4_N44
\theLab|a_count_score|COUNT[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clockGenerator|var_clock~q\,
	asdata => \theLab|a_count_score|Add0~1_combout\,
	sclr => \ALT_INV_RESET_N~input_o\,
	sload => VCC,
	ena => \theLab|a_count_score|COUNT[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \theLab|a_count_score|COUNT\(2));

-- Location: LABCELL_X40_Y4_N51
\theLab|a_count_score|Add0~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|a_count_score|Add0~2_combout\ = ( \theLab|a_count_score|COUNT\(2) & ( !\theLab|a_count_score|COUNT\(3) $ (((!\theLab|a_count_score|COUNT\(0)) # (!\theLab|a_count_score|COUNT\(1)))) ) ) # ( !\theLab|a_count_score|COUNT\(2) & ( 
-- \theLab|a_count_score|COUNT\(3) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010101010101010110100101010101011010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \theLab|a_count_score|ALT_INV_COUNT\(3),
	datac => \theLab|a_count_score|ALT_INV_COUNT\(0),
	datad => \theLab|a_count_score|ALT_INV_COUNT\(1),
	dataf => \theLab|a_count_score|ALT_INV_COUNT\(2),
	combout => \theLab|a_count_score|Add0~2_combout\);

-- Location: FF_X40_Y4_N50
\theLab|a_count_score|COUNT[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clockGenerator|var_clock~q\,
	asdata => \theLab|a_count_score|Add0~2_combout\,
	sclr => \ALT_INV_RESET_N~input_o\,
	sload => VCC,
	ena => \theLab|a_count_score|COUNT[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \theLab|a_count_score|COUNT\(3));

-- Location: LABCELL_X40_Y4_N30
\theLab|Equal1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|Equal1~0_combout\ = ( \theLab|a_count_score|COUNT\(2) & ( (!\theLab|a_count_score|COUNT\(3) & (!\theLab|a_count_score|COUNT\(1) & \theLab|a_count_score|COUNT\(0))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000101000000000000010100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \theLab|a_count_score|ALT_INV_COUNT\(3),
	datac => \theLab|a_count_score|ALT_INV_COUNT\(1),
	datad => \theLab|a_count_score|ALT_INV_COUNT\(0),
	dataf => \theLab|a_count_score|ALT_INV_COUNT\(2),
	combout => \theLab|Equal1~0_combout\);

-- Location: LABCELL_X40_Y5_N39
\theLab|Selector5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|Selector5~0_combout\ = ( \theLab|Equal2~0_combout\ & ( !\theLab|WideOr3~0_combout\ ) ) # ( !\theLab|Equal2~0_combout\ & ( (!\theLab|WideOr3~0_combout\) # ((\KEY[2]~input_o\ & (\theLab|SCURR.false_win~q\ & !\theLab|Equal1~0_combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000111110000111100011111000011110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_KEY[2]~input_o\,
	datab => \theLab|ALT_INV_SCURR.false_win~q\,
	datac => \theLab|ALT_INV_WideOr3~0_combout\,
	datad => \theLab|ALT_INV_Equal1~0_combout\,
	dataf => \theLab|ALT_INV_Equal2~0_combout\,
	combout => \theLab|Selector5~0_combout\);

-- Location: FF_X40_Y5_N59
\theLab|SCURR.false_win\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clockGenerator|var_clock~q\,
	asdata => \theLab|Selector5~0_combout\,
	sclr => \ALT_INV_RESET_N~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \theLab|SCURR.false_win~q\);

-- Location: LABCELL_X40_Y5_N51
\theLab|LOAD~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|LOAD~1_combout\ = ( !\theLab|SCURR.normal_win~q\ & ( !\theLab|SCURR.false_win~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011110000111100001111000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \theLab|ALT_INV_SCURR.false_win~q\,
	dataf => \theLab|ALT_INV_SCURR.normal_win~q\,
	combout => \theLab|LOAD~1_combout\);

-- Location: LABCELL_X39_Y5_N3
\theLab|Selector0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|Selector0~0_combout\ = ( !\theLab|c|DONE~q\ & ( (\theLab|SCURR.start~q\ & (\KEY[0]~input_o\ & \KEY[3]~input_o\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100000001000000010000000100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \theLab|ALT_INV_SCURR.start~q\,
	datab => \ALT_INV_KEY[0]~input_o\,
	datac => \ALT_INV_KEY[3]~input_o\,
	dataf => \theLab|c|ALT_INV_DONE~q\,
	combout => \theLab|Selector0~0_combout\);

-- Location: LABCELL_X40_Y4_N24
\theLab|Selector0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|Selector0~1_combout\ = ( \theLab|Equal1~0_combout\ & ( \theLab|Equal2~0_combout\ & ( ((!\KEY[2]~input_o\ & !\theLab|SCURR.init~q\)) # (\theLab|Selector0~0_combout\) ) ) ) # ( !\theLab|Equal1~0_combout\ & ( \theLab|Equal2~0_combout\ & ( 
-- ((!\KEY[2]~input_o\ & !\theLab|SCURR.init~q\)) # (\theLab|Selector0~0_combout\) ) ) ) # ( \theLab|Equal1~0_combout\ & ( !\theLab|Equal2~0_combout\ & ( ((!\KEY[2]~input_o\ & !\theLab|SCURR.init~q\)) # (\theLab|Selector0~0_combout\) ) ) ) # ( 
-- !\theLab|Equal1~0_combout\ & ( !\theLab|Equal2~0_combout\ & ( ((!\KEY[2]~input_o\ & ((!\theLab|SCURR.init~q\) # (!\theLab|LOAD~1_combout\)))) # (\theLab|Selector0~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010100011111111100010001111111110001000111111111000100011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_KEY[2]~input_o\,
	datab => \theLab|ALT_INV_SCURR.init~q\,
	datac => \theLab|ALT_INV_LOAD~1_combout\,
	datad => \theLab|ALT_INV_Selector0~0_combout\,
	datae => \theLab|ALT_INV_Equal1~0_combout\,
	dataf => \theLab|ALT_INV_Equal2~0_combout\,
	combout => \theLab|Selector0~1_combout\);

-- Location: FF_X40_Y4_N26
\theLab|SCURR.start\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clockGenerator|var_clock~q\,
	d => \theLab|Selector0~1_combout\,
	sclr => \ALT_INV_RESET_N~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \theLab|SCURR.start~q\);

-- Location: LABCELL_X39_Y5_N42
\theLab|SCURR~24\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|SCURR~24_combout\ = ( \theLab|SCURR.start~q\ & ( (\RESET_N~input_o\ & (\KEY[3]~input_o\ & (\theLab|c|DONE~q\ & \KEY[0]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000010000000000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_RESET_N~input_o\,
	datab => \ALT_INV_KEY[3]~input_o\,
	datac => \theLab|c|ALT_INV_DONE~q\,
	datad => \ALT_INV_KEY[0]~input_o\,
	dataf => \theLab|ALT_INV_SCURR.start~q\,
	combout => \theLab|SCURR~24_combout\);

-- Location: FF_X40_Y5_N17
\theLab|SCURR.led\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clockGenerator|var_clock~q\,
	asdata => \theLab|SCURR~24_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \theLab|SCURR.led~q\);

-- Location: LABCELL_X39_Y5_N6
\theLab|SCURR~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|SCURR~25_combout\ = ( \KEY[0]~input_o\ & ( \theLab|SCURR.led~q\ & ( (\RESET_N~input_o\ & \KEY[3]~input_o\) ) ) ) # ( \KEY[0]~input_o\ & ( !\theLab|SCURR.led~q\ & ( (\RESET_N~input_o\ & (\KEY[3]~input_o\ & (!\theLab|c|DONE~q\ & 
-- \theLab|SCURR.countdown~q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000001000000000000000000000001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_RESET_N~input_o\,
	datab => \ALT_INV_KEY[3]~input_o\,
	datac => \theLab|c|ALT_INV_DONE~q\,
	datad => \theLab|ALT_INV_SCURR.countdown~q\,
	datae => \ALT_INV_KEY[0]~input_o\,
	dataf => \theLab|ALT_INV_SCURR.led~q\,
	combout => \theLab|SCURR~25_combout\);

-- Location: FF_X40_Y5_N26
\theLab|SCURR.countdown\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clockGenerator|var_clock~q\,
	asdata => \theLab|SCURR~25_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \theLab|SCURR.countdown~q\);

-- Location: LABCELL_X39_Y5_N27
\theLab|SCURR~26\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|SCURR~26_combout\ = ( \theLab|SCURR.led~q\ & ( (!\KEY[3]~input_o\ & \RESET_N~input_o\) ) ) # ( !\theLab|SCURR.led~q\ & ( (!\KEY[3]~input_o\ & (\RESET_N~input_o\ & ((\theLab|SCURR.start~q\) # (\theLab|SCURR.countdown~q\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001001100000000000100110000000000110011000000000011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \theLab|ALT_INV_SCURR.countdown~q\,
	datab => \ALT_INV_KEY[3]~input_o\,
	datac => \theLab|ALT_INV_SCURR.start~q\,
	datad => \ALT_INV_RESET_N~input_o\,
	dataf => \theLab|ALT_INV_SCURR.led~q\,
	combout => \theLab|SCURR~26_combout\);

-- Location: FF_X39_Y5_N29
\theLab|SCURR.a_false\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clockGenerator|var_clock~q\,
	d => \theLab|SCURR~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \theLab|SCURR.a_false~q\);

-- Location: LABCELL_X40_Y4_N21
\theLab|b_count_score|COUNT[0]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|b_count_score|COUNT[0]~1_combout\ = ( \theLab|SCURR.a_false~q\ ) # ( !\theLab|SCURR.a_false~q\ & ( (!\RESET_N~input_o\) # (\theLab|SCURR.b_won~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101011111111101010101111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_RESET_N~input_o\,
	datad => \theLab|ALT_INV_SCURR.b_won~q\,
	dataf => \theLab|ALT_INV_SCURR.a_false~q\,
	combout => \theLab|b_count_score|COUNT[0]~1_combout\);

-- Location: FF_X40_Y4_N14
\theLab|b_count_score|COUNT[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clockGenerator|var_clock~q\,
	asdata => \theLab|b_count_score|COUNT~0_combout\,
	sload => VCC,
	ena => \theLab|b_count_score|COUNT[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \theLab|b_count_score|COUNT\(0));

-- Location: LABCELL_X40_Y4_N48
\theLab|b_count_score|Add0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|b_count_score|Add0~0_combout\ = ( \theLab|b_count_score|COUNT\(1) & ( !\theLab|b_count_score|COUNT\(0) ) ) # ( !\theLab|b_count_score|COUNT\(1) & ( \theLab|b_count_score|COUNT\(0) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001111001100110011001100110011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \theLab|b_count_score|ALT_INV_COUNT\(0),
	dataf => \theLab|b_count_score|ALT_INV_COUNT\(1),
	combout => \theLab|b_count_score|Add0~0_combout\);

-- Location: FF_X40_Y4_N38
\theLab|b_count_score|COUNT[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clockGenerator|var_clock~q\,
	asdata => \theLab|b_count_score|Add0~0_combout\,
	sclr => \ALT_INV_RESET_N~input_o\,
	sload => VCC,
	ena => \theLab|b_count_score|COUNT[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \theLab|b_count_score|COUNT\(1));

-- Location: LABCELL_X40_Y4_N36
\theLab|b_count_score|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|b_count_score|Add0~1_combout\ = ( \theLab|b_count_score|COUNT\(0) & ( !\theLab|b_count_score|COUNT\(2) $ (!\theLab|b_count_score|COUNT\(1)) ) ) # ( !\theLab|b_count_score|COUNT\(0) & ( \theLab|b_count_score|COUNT\(2) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010101010101101010100101010110101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \theLab|b_count_score|ALT_INV_COUNT\(2),
	datad => \theLab|b_count_score|ALT_INV_COUNT\(1),
	dataf => \theLab|b_count_score|ALT_INV_COUNT\(0),
	combout => \theLab|b_count_score|Add0~1_combout\);

-- Location: FF_X40_Y4_N56
\theLab|b_count_score|COUNT[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clockGenerator|var_clock~q\,
	asdata => \theLab|b_count_score|Add0~1_combout\,
	sclr => \ALT_INV_RESET_N~input_o\,
	sload => VCC,
	ena => \theLab|b_count_score|COUNT[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \theLab|b_count_score|COUNT\(2));

-- Location: LABCELL_X40_Y4_N12
\theLab|b_count_score|Add0~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|b_count_score|Add0~2_combout\ = ( \theLab|b_count_score|COUNT\(1) & ( !\theLab|b_count_score|COUNT\(3) $ (((!\theLab|b_count_score|COUNT\(2)) # (!\theLab|b_count_score|COUNT\(0)))) ) ) # ( !\theLab|b_count_score|COUNT\(1) & ( 
-- \theLab|b_count_score|COUNT\(3) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010101010101010110100101010101011010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \theLab|b_count_score|ALT_INV_COUNT\(3),
	datac => \theLab|b_count_score|ALT_INV_COUNT\(2),
	datad => \theLab|b_count_score|ALT_INV_COUNT\(0),
	dataf => \theLab|b_count_score|ALT_INV_COUNT\(1),
	combout => \theLab|b_count_score|Add0~2_combout\);

-- Location: FF_X40_Y4_N5
\theLab|b_count_score|COUNT[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clockGenerator|var_clock~q\,
	asdata => \theLab|b_count_score|Add0~2_combout\,
	sclr => \ALT_INV_RESET_N~input_o\,
	sload => VCC,
	ena => \theLab|b_count_score|COUNT[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \theLab|b_count_score|COUNT\(3));

-- Location: LABCELL_X40_Y4_N39
\theLab|Equal2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|Equal2~0_combout\ = ( !\theLab|b_count_score|COUNT\(1) & ( (\theLab|b_count_score|COUNT\(2) & (\theLab|b_count_score|COUNT\(0) & !\theLab|b_count_score|COUNT\(3))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000000000001010000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \theLab|b_count_score|ALT_INV_COUNT\(2),
	datac => \theLab|b_count_score|ALT_INV_COUNT\(0),
	datad => \theLab|b_count_score|ALT_INV_COUNT\(3),
	dataf => \theLab|b_count_score|ALT_INV_COUNT\(1),
	combout => \theLab|Equal2~0_combout\);

-- Location: LABCELL_X40_Y5_N27
\theLab|Selector8~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|Selector8~0_combout\ = ( \theLab|Equal1~0_combout\ & ( \theLab|SCURR.b_won~q\ ) ) # ( !\theLab|Equal1~0_combout\ & ( \theLab|SCURR.b_won~q\ ) ) # ( \theLab|Equal1~0_combout\ & ( !\theLab|SCURR.b_won~q\ & ( \theLab|SCURR.a_won~q\ ) ) ) # ( 
-- !\theLab|Equal1~0_combout\ & ( !\theLab|SCURR.b_won~q\ & ( ((\KEY[2]~input_o\ & (\theLab|SCURR.normal_win~q\ & !\theLab|Equal2~0_combout\))) # (\theLab|SCURR.a_won~q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011011100110011001100110011001111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_KEY[2]~input_o\,
	datab => \theLab|ALT_INV_SCURR.a_won~q\,
	datac => \theLab|ALT_INV_SCURR.normal_win~q\,
	datad => \theLab|ALT_INV_Equal2~0_combout\,
	datae => \theLab|ALT_INV_Equal1~0_combout\,
	dataf => \theLab|ALT_INV_SCURR.b_won~q\,
	combout => \theLab|Selector8~0_combout\);

-- Location: FF_X40_Y5_N5
\theLab|SCURR.normal_win\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clockGenerator|var_clock~q\,
	asdata => \theLab|Selector8~0_combout\,
	sclr => \ALT_INV_RESET_N~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \theLab|SCURR.normal_win~q\);

-- Location: LABCELL_X40_Y4_N45
\theLab|Selector9~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|Selector9~0_combout\ = ( \theLab|SCURR.a_normal_win~q\ & ( \theLab|a_count_score|COUNT\(1) ) ) # ( \theLab|SCURR.a_normal_win~q\ & ( !\theLab|a_count_score|COUNT\(1) ) ) # ( !\theLab|SCURR.a_normal_win~q\ & ( !\theLab|a_count_score|COUNT\(1) & ( 
-- (\theLab|SCURR.normal_win~q\ & (\theLab|a_count_score|COUNT\(2) & (\theLab|a_count_score|COUNT\(0) & !\theLab|a_count_score|COUNT\(3)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100000000111111111111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \theLab|ALT_INV_SCURR.normal_win~q\,
	datab => \theLab|a_count_score|ALT_INV_COUNT\(2),
	datac => \theLab|a_count_score|ALT_INV_COUNT\(0),
	datad => \theLab|a_count_score|ALT_INV_COUNT\(3),
	datae => \theLab|ALT_INV_SCURR.a_normal_win~q\,
	dataf => \theLab|a_count_score|ALT_INV_COUNT\(1),
	combout => \theLab|Selector9~0_combout\);

-- Location: FF_X40_Y5_N53
\theLab|SCURR.a_normal_win\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clockGenerator|var_clock~q\,
	asdata => \theLab|Selector9~0_combout\,
	sclr => \ALT_INV_RESET_N~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \theLab|SCURR.a_normal_win~q\);

-- Location: LABCELL_X40_Y4_N57
\theLab|Selector10~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|Selector10~0_combout\ = ( \theLab|Equal1~0_combout\ & ( \theLab|SCURR.b_normal_win~q\ ) ) # ( !\theLab|Equal1~0_combout\ & ( ((\theLab|SCURR.normal_win~q\ & \theLab|Equal2~0_combout\)) # (\theLab|SCURR.b_normal_win~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011011100110111001101110011011100110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \theLab|ALT_INV_SCURR.normal_win~q\,
	datab => \theLab|ALT_INV_SCURR.b_normal_win~q\,
	datac => \theLab|ALT_INV_Equal2~0_combout\,
	dataf => \theLab|ALT_INV_Equal1~0_combout\,
	combout => \theLab|Selector10~0_combout\);

-- Location: FF_X40_Y4_N8
\theLab|SCURR.b_normal_win\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clockGenerator|var_clock~q\,
	asdata => \theLab|Selector10~0_combout\,
	sclr => \ALT_INV_RESET_N~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \theLab|SCURR.b_normal_win~q\);

-- Location: LABCELL_X39_Y5_N33
\theLab|WideOr3\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|WideOr3~combout\ = ( \theLab|SCURR.normal_win~q\ & ( \theLab|WideOr3~0_combout\ ) ) # ( !\theLab|SCURR.normal_win~q\ & ( \theLab|WideOr3~0_combout\ & ( (((\theLab|SCURR.ready~q\) # (\theLab|SCURR.b_normal_win~q\)) # (\theLab|SCURR.a_won~q\)) # 
-- (\theLab|SCURR.a_normal_win~q\) ) ) ) # ( \theLab|SCURR.normal_win~q\ & ( !\theLab|WideOr3~0_combout\ ) ) # ( !\theLab|SCURR.normal_win~q\ & ( !\theLab|WideOr3~0_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111101111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \theLab|ALT_INV_SCURR.a_normal_win~q\,
	datab => \theLab|ALT_INV_SCURR.a_won~q\,
	datac => \theLab|ALT_INV_SCURR.b_normal_win~q\,
	datad => \theLab|ALT_INV_SCURR.ready~q\,
	datae => \theLab|ALT_INV_SCURR.normal_win~q\,
	dataf => \theLab|ALT_INV_WideOr3~0_combout\,
	combout => \theLab|WideOr3~combout\);

-- Location: LABCELL_X40_Y5_N45
\theLab|LOAD\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|LOAD~combout\ = ( \theLab|SCURR.led~q\ ) # ( !\theLab|SCURR.led~q\ & ( ((!\theLab|SCURR.init~q\) # (\theLab|SCURR.false_win~q\)) # (\theLab|SCURR.normal_win~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111011111110111111101111111011111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \theLab|ALT_INV_SCURR.normal_win~q\,
	datab => \theLab|ALT_INV_SCURR.false_win~q\,
	datac => \theLab|ALT_INV_SCURR.init~q\,
	dataf => \theLab|ALT_INV_SCURR.led~q\,
	combout => \theLab|LOAD~combout\);

-- Location: LABCELL_X39_Y4_N45
\theLab|Selector6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|Selector6~0_combout\ = ( \theLab|SCURR.a_false_win~q\ & ( \theLab|SCURR.false_win~q\ ) ) # ( !\theLab|SCURR.a_false_win~q\ & ( \theLab|SCURR.false_win~q\ & ( (\theLab|a_count_score|COUNT\(0) & (!\theLab|a_count_score|COUNT\(3) & 
-- (\theLab|a_count_score|COUNT\(2) & !\theLab|a_count_score|COUNT\(1)))) ) ) ) # ( \theLab|SCURR.a_false_win~q\ & ( !\theLab|SCURR.false_win~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000100000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \theLab|a_count_score|ALT_INV_COUNT\(0),
	datab => \theLab|a_count_score|ALT_INV_COUNT\(3),
	datac => \theLab|a_count_score|ALT_INV_COUNT\(2),
	datad => \theLab|a_count_score|ALT_INV_COUNT\(1),
	datae => \theLab|ALT_INV_SCURR.a_false_win~q\,
	dataf => \theLab|ALT_INV_SCURR.false_win~q\,
	combout => \theLab|Selector6~0_combout\);

-- Location: FF_X40_Y5_N44
\theLab|SCURR.a_false_win\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clockGenerator|var_clock~q\,
	asdata => \theLab|Selector6~0_combout\,
	sclr => \ALT_INV_RESET_N~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \theLab|SCURR.a_false_win~q\);

-- Location: LABCELL_X40_Y4_N18
\theLab|Selector7~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|Selector7~0_combout\ = ( \theLab|Equal1~0_combout\ & ( \theLab|SCURR.b_false_win~q\ ) ) # ( !\theLab|Equal1~0_combout\ & ( ((\theLab|Equal2~0_combout\ & \theLab|SCURR.false_win~q\)) # (\theLab|SCURR.b_false_win~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100111111000011110011111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \theLab|ALT_INV_Equal2~0_combout\,
	datac => \theLab|ALT_INV_SCURR.b_false_win~q\,
	datad => \theLab|ALT_INV_SCURR.false_win~q\,
	dataf => \theLab|ALT_INV_Equal1~0_combout\,
	combout => \theLab|Selector7~0_combout\);

-- Location: FF_X40_Y5_N47
\theLab|SCURR.b_false_win\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clockGenerator|var_clock~q\,
	asdata => \theLab|Selector7~0_combout\,
	sclr => \ALT_INV_RESET_N~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \theLab|SCURR.b_false_win~q\);

-- Location: LABCELL_X40_Y5_N42
\theLab|WideOr4~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|WideOr4~1_combout\ = ( !\theLab|SCURR.b_false_win~q\ & ( (!\theLab|SCURR.b_normal_win~q\ & !\theLab|SCURR.a_false_win~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000000000000111100000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \theLab|ALT_INV_SCURR.b_normal_win~q\,
	datad => \theLab|ALT_INV_SCURR.a_false_win~q\,
	dataf => \theLab|ALT_INV_SCURR.b_false_win~q\,
	combout => \theLab|WideOr4~1_combout\);

-- Location: LABCELL_X40_Y5_N0
\theLab|WideOr5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|WideOr5~0_combout\ = (!\theLab|SCURR.b_false_win~q\ & !\theLab|SCURR.false_win~q\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100110000000000110011000000000011001100000000001100110000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \theLab|ALT_INV_SCURR.b_false_win~q\,
	datad => \theLab|ALT_INV_SCURR.false_win~q\,
	combout => \theLab|WideOr5~0_combout\);

-- Location: LABCELL_X40_Y5_N15
\theLab|WideOr4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|WideOr4~0_combout\ = ( !\theLab|SCURR.countdown~q\ & ( (!\theLab|SCURR.ready~q\ & (!\theLab|SCURR.a_won~q\ & !\theLab|SCURR.led~q\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010000000000000101000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \theLab|ALT_INV_SCURR.ready~q\,
	datac => \theLab|ALT_INV_SCURR.a_won~q\,
	datad => \theLab|ALT_INV_SCURR.led~q\,
	dataf => \theLab|ALT_INV_SCURR.countdown~q\,
	combout => \theLab|WideOr4~0_combout\);

-- Location: LABCELL_X40_Y5_N3
\theLab|WideOr0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|WideOr0~0_combout\ = ( !\theLab|SCURR.b_normal_win~q\ & ( (!\theLab|SCURR.b_won~q\ & (!\theLab|SCURR.b_false_win~q\ & (!\theLab|SCURR.a_false_win~q\ & !\theLab|SCURR.a_normal_win~q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000100000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \theLab|ALT_INV_SCURR.b_won~q\,
	datab => \theLab|ALT_INV_SCURR.b_false_win~q\,
	datac => \theLab|ALT_INV_SCURR.a_false_win~q\,
	datad => \theLab|ALT_INV_SCURR.a_normal_win~q\,
	dataf => \theLab|ALT_INV_SCURR.b_normal_win~q\,
	combout => \theLab|WideOr0~0_combout\);

-- Location: LABCELL_X40_Y5_N48
\theLab|WideOr5~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|WideOr5~1_combout\ = ( !\theLab|SCURR.b_false~q\ & ( (!\theLab|SCURR.countdown~q\ & (!\theLab|SCURR.a_won~q\ & (!\theLab|SCURR.a_normal_win~q\ & !\theLab|SCURR.start~q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000100000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \theLab|ALT_INV_SCURR.countdown~q\,
	datab => \theLab|ALT_INV_SCURR.a_won~q\,
	datac => \theLab|ALT_INV_SCURR.a_normal_win~q\,
	datad => \theLab|ALT_INV_SCURR.start~q\,
	dataf => \theLab|ALT_INV_SCURR.b_false~q\,
	combout => \theLab|WideOr5~1_combout\);

-- Location: LABCELL_X40_Y5_N30
\theLab|Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|Equal0~0_combout\ = ( \theLab|WideOr0~0_combout\ & ( \theLab|WideOr5~1_combout\ & ( (\theLab|LOAD~1_combout\ & (\theLab|WideOr5~0_combout\ & ((!\theLab|WideOr4~1_combout\) # (!\theLab|WideOr4~0_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000010100000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \theLab|ALT_INV_LOAD~1_combout\,
	datab => \theLab|ALT_INV_WideOr4~1_combout\,
	datac => \theLab|ALT_INV_WideOr5~0_combout\,
	datad => \theLab|ALT_INV_WideOr4~0_combout\,
	datae => \theLab|ALT_INV_WideOr0~0_combout\,
	dataf => \theLab|ALT_INV_WideOr5~1_combout\,
	combout => \theLab|Equal0~0_combout\);

-- Location: MLABCELL_X37_Y5_N18
\theLab|a|ADDRESS~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|a|ADDRESS~0_combout\ = ( !\theLab|a|ADDRESS\(0) & ( \RESET_N~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_RESET_N~input_o\,
	dataf => \theLab|a|ALT_INV_ADDRESS\(0),
	combout => \theLab|a|ADDRESS~0_combout\);

-- Location: FF_X39_Y5_N53
\theLab|a|ADDRESS[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clockGenerator|var_clock~q\,
	asdata => \theLab|a|ADDRESS~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \theLab|a|ADDRESS\(0));

-- Location: MLABCELL_X37_Y5_N27
\theLab|a|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|a|Add0~1_combout\ = ( !\theLab|a|ADDRESS\(1) & ( \theLab|a|ADDRESS\(0) ) ) # ( \theLab|a|ADDRESS\(1) & ( !\theLab|a|ADDRESS\(0) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111111111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \theLab|a|ALT_INV_ADDRESS\(1),
	dataf => \theLab|a|ALT_INV_ADDRESS\(0),
	combout => \theLab|a|Add0~1_combout\);

-- Location: FF_X37_Y5_N56
\theLab|a|ADDRESS[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clockGenerator|var_clock~q\,
	asdata => \theLab|a|Add0~1_combout\,
	sclr => \ALT_INV_RESET_N~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \theLab|a|ADDRESS\(1));

-- Location: MLABCELL_X37_Y5_N30
\theLab|a|Add0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|a|Add0~0_combout\ = ( \theLab|a|ADDRESS\(1) & ( !\theLab|a|ADDRESS\(0) $ (!\theLab|a|ADDRESS\(2)) ) ) # ( !\theLab|a|ADDRESS\(1) & ( \theLab|a|ADDRESS\(2) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111101011010010110100101101001011010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \theLab|a|ALT_INV_ADDRESS\(0),
	datac => \theLab|a|ALT_INV_ADDRESS\(2),
	dataf => \theLab|a|ALT_INV_ADDRESS\(1),
	combout => \theLab|a|Add0~0_combout\);

-- Location: MLABCELL_X37_Y5_N39
\theLab|a|ADDRESS[2]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|a|ADDRESS[2]~feeder_combout\ = \theLab|a|Add0~0_combout\

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001100110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \theLab|a|ALT_INV_Add0~0_combout\,
	combout => \theLab|a|ADDRESS[2]~feeder_combout\);

-- Location: FF_X37_Y5_N41
\theLab|a|ADDRESS[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clockGenerator|var_clock~q\,
	d => \theLab|a|ADDRESS[2]~feeder_combout\,
	sclr => \ALT_INV_RESET_N~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \theLab|a|ADDRESS\(2));

-- Location: LABCELL_X39_Y5_N24
\theLab|c|timer~14\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|c|timer~14_combout\ = ( \theLab|a|ADDRESS\(0) & ( !\theLab|a|ADDRESS\(1) $ (!\theLab|a|ADDRESS\(2)) ) ) # ( !\theLab|a|ADDRESS\(0) & ( (\theLab|a|ADDRESS\(1) & !\theLab|a|ADDRESS\(2)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100000000000011110000000000001111111100000000111111110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \theLab|a|ALT_INV_ADDRESS\(1),
	datad => \theLab|a|ALT_INV_ADDRESS\(2),
	dataf => \theLab|a|ALT_INV_ADDRESS\(0),
	combout => \theLab|c|timer~14_combout\);

-- Location: LABCELL_X40_Y5_N12
\theLab|c|timer~12\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|c|timer~12_combout\ = ( \theLab|a|ADDRESS\(2) & ( \theLab|a|ADDRESS\(0) ) ) # ( !\theLab|a|ADDRESS\(2) & ( (\theLab|a|ADDRESS\(1) & !\theLab|a|ADDRESS\(0)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011000000110000001100000011000000001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \theLab|a|ALT_INV_ADDRESS\(1),
	datac => \theLab|a|ALT_INV_ADDRESS\(0),
	dataf => \theLab|a|ALT_INV_ADDRESS\(2),
	combout => \theLab|c|timer~12_combout\);

-- Location: MLABCELL_X37_Y5_N51
\theLab|c|timer~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|c|timer~10_combout\ = ( !\theLab|a|ADDRESS\(2) & ( (!\theLab|a|ADDRESS\(0)) # (\theLab|a|ADDRESS\(1)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101011111111101010101111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \theLab|a|ALT_INV_ADDRESS\(0),
	datad => \theLab|a|ALT_INV_ADDRESS\(1),
	dataf => \theLab|a|ALT_INV_ADDRESS\(2),
	combout => \theLab|c|timer~10_combout\);

-- Location: LABCELL_X41_Y5_N3
\theLab|c|timer~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|c|timer~5_combout\ = ( \theLab|a|ADDRESS\(1) & ( (\theLab|a|ADDRESS\(2)) # (\theLab|a|ADDRESS\(0)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000001111111111110000111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \theLab|a|ALT_INV_ADDRESS\(0),
	datad => \theLab|a|ALT_INV_ADDRESS\(2),
	dataf => \theLab|a|ALT_INV_ADDRESS\(1),
	combout => \theLab|c|timer~5_combout\);

-- Location: LABCELL_X39_Y5_N0
\theLab|c|timer~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|c|timer~0_combout\ = ( \theLab|a|ADDRESS\(0) & ( (\theLab|a|ADDRESS\(1) & \theLab|a|ADDRESS\(2)) ) ) # ( !\theLab|a|ADDRESS\(0) & ( (\theLab|a|ADDRESS\(2)) # (\theLab|a|ADDRESS\(1)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111111111111000011111111111100000000000011110000000000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \theLab|a|ALT_INV_ADDRESS\(1),
	datad => \theLab|a|ALT_INV_ADDRESS\(2),
	dataf => \theLab|a|ALT_INV_ADDRESS\(0),
	combout => \theLab|c|timer~0_combout\);

-- Location: LABCELL_X41_Y5_N30
\theLab|c|Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|c|Add0~13_sumout\ = SUM(( \theLab|c|timer\(0) ) + ( VCC ) + ( !VCC ))
-- \theLab|c|Add0~14\ = CARRY(( \theLab|c|timer\(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \theLab|c|ALT_INV_timer\(0),
	cin => GND,
	sumout => \theLab|c|Add0~13_sumout\,
	cout => \theLab|c|Add0~14\);

-- Location: LABCELL_X41_Y5_N0
\theLab|c|timer~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|c|timer~4_combout\ = ( \theLab|c|Add0~13_sumout\ & ( (\theLab|SCURR.init~q\ & (\theLab|LOAD~1_combout\ & !\theLab|SCURR.led~q\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000101000000000000010100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \theLab|ALT_INV_SCURR.init~q\,
	datac => \theLab|ALT_INV_LOAD~1_combout\,
	datad => \theLab|ALT_INV_SCURR.led~q\,
	dataf => \theLab|c|ALT_INV_Add0~13_sumout\,
	combout => \theLab|c|timer~4_combout\);

-- Location: FF_X41_Y5_N2
\theLab|c|timer[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clockGenerator|var_clock~q\,
	d => \theLab|c|timer~4_combout\,
	sclr => \ALT_INV_RESET_N~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \theLab|c|timer\(0));

-- Location: LABCELL_X41_Y5_N33
\theLab|c|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|c|Add0~1_sumout\ = SUM(( \theLab|c|timer\(1) ) + ( VCC ) + ( \theLab|c|Add0~14\ ))
-- \theLab|c|Add0~2\ = CARRY(( \theLab|c|timer\(1) ) + ( VCC ) + ( \theLab|c|Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \theLab|c|ALT_INV_timer\(1),
	cin => \theLab|c|Add0~14\,
	sumout => \theLab|c|Add0~1_sumout\,
	cout => \theLab|c|Add0~2\);

-- Location: LABCELL_X40_Y5_N18
\theLab|c|timer~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|c|timer~1_combout\ = ( \theLab|c|timer~0_combout\ & ( \theLab|c|Add0~1_sumout\ & ( (\RESET_N~input_o\ & (((!\theLab|LOAD~combout\) # (!\theLab|Equal0~0_combout\)) # (\theLab|WideOr3~combout\))) ) ) ) # ( !\theLab|c|timer~0_combout\ & ( 
-- \theLab|c|Add0~1_sumout\ & ( (\RESET_N~input_o\ & !\theLab|LOAD~combout\) ) ) ) # ( \theLab|c|timer~0_combout\ & ( !\theLab|c|Add0~1_sumout\ & ( (\RESET_N~input_o\ & (\theLab|LOAD~combout\ & ((!\theLab|Equal0~0_combout\) # (\theLab|WideOr3~combout\)))) ) 
-- ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000001010000000101010000010100000101010101010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_RESET_N~input_o\,
	datab => \theLab|ALT_INV_WideOr3~combout\,
	datac => \theLab|ALT_INV_LOAD~combout\,
	datad => \theLab|ALT_INV_Equal0~0_combout\,
	datae => \theLab|c|ALT_INV_timer~0_combout\,
	dataf => \theLab|c|ALT_INV_Add0~1_sumout\,
	combout => \theLab|c|timer~1_combout\);

-- Location: FF_X40_Y5_N20
\theLab|c|timer[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clockGenerator|var_clock~q\,
	d => \theLab|c|timer~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \theLab|c|timer\(1));

-- Location: LABCELL_X41_Y5_N36
\theLab|c|Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|c|Add0~5_sumout\ = SUM(( \theLab|c|timer\(2) ) + ( VCC ) + ( \theLab|c|Add0~2\ ))
-- \theLab|c|Add0~6\ = CARRY(( \theLab|c|timer\(2) ) + ( VCC ) + ( \theLab|c|Add0~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \theLab|c|ALT_INV_timer\(2),
	cin => \theLab|c|Add0~2\,
	sumout => \theLab|c|Add0~5_sumout\,
	cout => \theLab|c|Add0~6\);

-- Location: LABCELL_X41_Y5_N24
\theLab|c|timer~16\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|c|timer~16_combout\ = ( !\theLab|LOAD~combout\ & ( ((\theLab|c|Add0~5_sumout\ & (\RESET_N~input_o\ & ((!\theLab|Equal0~0_combout\) # (\theLab|WideOr3~combout\))))) ) ) # ( \theLab|LOAD~combout\ & ( (\RESET_N~input_o\ & ((!\theLab|WideOr3~combout\ 
-- & (!\theLab|Equal0~0_combout\ & ((\theLab|a|ADDRESS\(1)) # (\theLab|a|ADDRESS\(0))))) # (\theLab|WideOr3~combout\ & (((\theLab|a|ADDRESS\(1))) # (\theLab|a|ADDRESS\(0)))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000000000001111000000000011111100000000000001010000000000010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \theLab|ALT_INV_WideOr3~combout\,
	datab => \theLab|a|ALT_INV_ADDRESS\(0),
	datac => \theLab|a|ALT_INV_ADDRESS\(1),
	datad => \ALT_INV_RESET_N~input_o\,
	datae => \theLab|ALT_INV_LOAD~combout\,
	dataf => \theLab|ALT_INV_Equal0~0_combout\,
	datag => \theLab|c|ALT_INV_Add0~5_sumout\,
	combout => \theLab|c|timer~16_combout\);

-- Location: FF_X41_Y5_N26
\theLab|c|timer[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clockGenerator|var_clock~q\,
	d => \theLab|c|timer~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \theLab|c|timer\(2));

-- Location: LABCELL_X41_Y5_N39
\theLab|c|Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|c|Add0~17_sumout\ = SUM(( \theLab|c|timer\(3) ) + ( VCC ) + ( \theLab|c|Add0~6\ ))
-- \theLab|c|Add0~18\ = CARRY(( \theLab|c|timer\(3) ) + ( VCC ) + ( \theLab|c|Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \theLab|c|ALT_INV_timer\(3),
	cin => \theLab|c|Add0~6\,
	sumout => \theLab|c|Add0~17_sumout\,
	cout => \theLab|c|Add0~18\);

-- Location: LABCELL_X41_Y5_N6
\theLab|c|timer~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|c|timer~6_combout\ = ( \theLab|LOAD~combout\ & ( \theLab|Equal0~0_combout\ & ( (\RESET_N~input_o\ & ((!\theLab|c|timer~5_combout\) # (!\theLab|WideOr3~combout\))) ) ) ) # ( !\theLab|LOAD~combout\ & ( \theLab|Equal0~0_combout\ & ( 
-- (\RESET_N~input_o\ & \theLab|c|Add0~17_sumout\) ) ) ) # ( \theLab|LOAD~combout\ & ( !\theLab|Equal0~0_combout\ & ( (!\theLab|c|timer~5_combout\ & \RESET_N~input_o\) ) ) ) # ( !\theLab|LOAD~combout\ & ( !\theLab|Equal0~0_combout\ & ( (\RESET_N~input_o\ & 
-- \theLab|c|Add0~17_sumout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000110011001000100010001000000000001100110011001000110010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \theLab|c|ALT_INV_timer~5_combout\,
	datab => \ALT_INV_RESET_N~input_o\,
	datac => \theLab|ALT_INV_WideOr3~combout\,
	datad => \theLab|c|ALT_INV_Add0~17_sumout\,
	datae => \theLab|ALT_INV_LOAD~combout\,
	dataf => \theLab|ALT_INV_Equal0~0_combout\,
	combout => \theLab|c|timer~6_combout\);

-- Location: FF_X41_Y5_N8
\theLab|c|timer[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clockGenerator|var_clock~q\,
	d => \theLab|c|timer~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \theLab|c|timer\(3));

-- Location: LABCELL_X41_Y5_N42
\theLab|c|Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|c|Add0~21_sumout\ = SUM(( \theLab|c|timer\(4) ) + ( VCC ) + ( \theLab|c|Add0~18\ ))
-- \theLab|c|Add0~22\ = CARRY(( \theLab|c|timer\(4) ) + ( VCC ) + ( \theLab|c|Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \theLab|c|ALT_INV_timer\(4),
	cin => \theLab|c|Add0~18\,
	sumout => \theLab|c|Add0~21_sumout\,
	cout => \theLab|c|Add0~22\);

-- Location: MLABCELL_X37_Y5_N9
\theLab|c|timer~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|c|timer~7_combout\ = ( \theLab|a|ADDRESS\(2) & ( (!\theLab|a|ADDRESS\(0) & \theLab|a|ADDRESS\(1)) ) ) # ( !\theLab|a|ADDRESS\(2) & ( (\theLab|a|ADDRESS\(1)) # (\theLab|a|ADDRESS\(0)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010111111111010101011111111100000000101010100000000010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \theLab|a|ALT_INV_ADDRESS\(0),
	datad => \theLab|a|ALT_INV_ADDRESS\(1),
	dataf => \theLab|a|ALT_INV_ADDRESS\(2),
	combout => \theLab|c|timer~7_combout\);

-- Location: LABCELL_X40_Y5_N9
\theLab|c|timer~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|c|timer~8_combout\ = ( \theLab|c|Add0~21_sumout\ & ( \theLab|c|timer~7_combout\ & ( (\RESET_N~input_o\ & (((!\theLab|Equal0~0_combout\) # (!\theLab|LOAD~combout\)) # (\theLab|WideOr3~combout\))) ) ) ) # ( !\theLab|c|Add0~21_sumout\ & ( 
-- \theLab|c|timer~7_combout\ & ( (\RESET_N~input_o\ & (\theLab|LOAD~combout\ & ((!\theLab|Equal0~0_combout\) # (\theLab|WideOr3~combout\)))) ) ) ) # ( \theLab|c|Add0~21_sumout\ & ( !\theLab|c|timer~7_combout\ & ( (\RESET_N~input_o\ & !\theLab|LOAD~combout\) 
-- ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000010101010000000000000000010100010101010101010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_RESET_N~input_o\,
	datab => \theLab|ALT_INV_WideOr3~combout\,
	datac => \theLab|ALT_INV_Equal0~0_combout\,
	datad => \theLab|ALT_INV_LOAD~combout\,
	datae => \theLab|c|ALT_INV_Add0~21_sumout\,
	dataf => \theLab|c|ALT_INV_timer~7_combout\,
	combout => \theLab|c|timer~8_combout\);

-- Location: FF_X40_Y5_N11
\theLab|c|timer[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clockGenerator|var_clock~q\,
	d => \theLab|c|timer~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \theLab|c|timer\(4));

-- Location: LABCELL_X41_Y5_N45
\theLab|c|Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|c|Add0~25_sumout\ = SUM(( \theLab|c|timer\(5) ) + ( VCC ) + ( \theLab|c|Add0~22\ ))
-- \theLab|c|Add0~26\ = CARRY(( \theLab|c|timer\(5) ) + ( VCC ) + ( \theLab|c|Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \theLab|c|ALT_INV_timer\(5),
	cin => \theLab|c|Add0~22\,
	sumout => \theLab|c|Add0~25_sumout\,
	cout => \theLab|c|Add0~26\);

-- Location: LABCELL_X41_Y5_N18
\theLab|c|timer~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|c|timer~9_combout\ = ( \theLab|LOAD~combout\ & ( \theLab|Equal0~0_combout\ & ( (\RESET_N~input_o\ & (\theLab|a|ADDRESS\(0) & \theLab|WideOr3~combout\)) ) ) ) # ( !\theLab|LOAD~combout\ & ( \theLab|Equal0~0_combout\ & ( (\RESET_N~input_o\ & 
-- (\theLab|WideOr3~combout\ & \theLab|c|Add0~25_sumout\)) ) ) ) # ( \theLab|LOAD~combout\ & ( !\theLab|Equal0~0_combout\ & ( (\RESET_N~input_o\ & \theLab|a|ADDRESS\(0)) ) ) ) # ( !\theLab|LOAD~combout\ & ( !\theLab|Equal0~0_combout\ & ( (\RESET_N~input_o\ & 
-- \theLab|c|Add0~25_sumout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001010101000100010001000100000000000001010000000100000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_RESET_N~input_o\,
	datab => \theLab|a|ALT_INV_ADDRESS\(0),
	datac => \theLab|ALT_INV_WideOr3~combout\,
	datad => \theLab|c|ALT_INV_Add0~25_sumout\,
	datae => \theLab|ALT_INV_LOAD~combout\,
	dataf => \theLab|ALT_INV_Equal0~0_combout\,
	combout => \theLab|c|timer~9_combout\);

-- Location: FF_X41_Y5_N20
\theLab|c|timer[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clockGenerator|var_clock~q\,
	d => \theLab|c|timer~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \theLab|c|timer\(5));

-- Location: LABCELL_X41_Y5_N48
\theLab|c|Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|c|Add0~29_sumout\ = SUM(( \theLab|c|timer\(6) ) + ( VCC ) + ( \theLab|c|Add0~26\ ))
-- \theLab|c|Add0~30\ = CARRY(( \theLab|c|timer\(6) ) + ( VCC ) + ( \theLab|c|Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \theLab|c|ALT_INV_timer\(6),
	cin => \theLab|c|Add0~26\,
	sumout => \theLab|c|Add0~29_sumout\,
	cout => \theLab|c|Add0~30\);

-- Location: LABCELL_X41_Y5_N12
\theLab|c|timer~11\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|c|timer~11_combout\ = ( \theLab|LOAD~combout\ & ( \theLab|Equal0~0_combout\ & ( (\theLab|c|timer~10_combout\ & (\RESET_N~input_o\ & \theLab|WideOr3~combout\)) ) ) ) # ( !\theLab|LOAD~combout\ & ( \theLab|Equal0~0_combout\ & ( (\RESET_N~input_o\ & 
-- \theLab|c|Add0~29_sumout\) ) ) ) # ( \theLab|LOAD~combout\ & ( !\theLab|Equal0~0_combout\ & ( (\theLab|c|timer~10_combout\ & \RESET_N~input_o\) ) ) ) # ( !\theLab|LOAD~combout\ & ( !\theLab|Equal0~0_combout\ & ( (\RESET_N~input_o\ & 
-- \theLab|c|Add0~29_sumout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100000011000100010001000100000011000000110000000000010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \theLab|c|ALT_INV_timer~10_combout\,
	datab => \ALT_INV_RESET_N~input_o\,
	datac => \theLab|c|ALT_INV_Add0~29_sumout\,
	datad => \theLab|ALT_INV_WideOr3~combout\,
	datae => \theLab|ALT_INV_LOAD~combout\,
	dataf => \theLab|ALT_INV_Equal0~0_combout\,
	combout => \theLab|c|timer~11_combout\);

-- Location: FF_X41_Y5_N14
\theLab|c|timer[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clockGenerator|var_clock~q\,
	d => \theLab|c|timer~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \theLab|c|timer\(6));

-- Location: LABCELL_X41_Y5_N51
\theLab|c|Add0~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|c|Add0~33_sumout\ = SUM(( \theLab|c|timer\(7) ) + ( VCC ) + ( \theLab|c|Add0~30\ ))
-- \theLab|c|Add0~34\ = CARRY(( \theLab|c|timer\(7) ) + ( VCC ) + ( \theLab|c|Add0~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \theLab|c|ALT_INV_timer\(7),
	cin => \theLab|c|Add0~30\,
	sumout => \theLab|c|Add0~33_sumout\,
	cout => \theLab|c|Add0~34\);

-- Location: LABCELL_X40_Y5_N54
\theLab|c|timer~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|c|timer~13_combout\ = ( \theLab|c|timer~12_combout\ & ( \theLab|c|Add0~33_sumout\ & ( (\RESET_N~input_o\ & !\theLab|LOAD~combout\) ) ) ) # ( !\theLab|c|timer~12_combout\ & ( \theLab|c|Add0~33_sumout\ & ( (\RESET_N~input_o\ & 
-- (((!\theLab|LOAD~combout\) # (!\theLab|Equal0~0_combout\)) # (\theLab|WideOr3~combout\))) ) ) ) # ( !\theLab|c|timer~12_combout\ & ( !\theLab|c|Add0~33_sumout\ & ( (\RESET_N~input_o\ & (\theLab|LOAD~combout\ & ((!\theLab|Equal0~0_combout\) # 
-- (\theLab|WideOr3~combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000001000000000000000001010101010100010101000001010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_RESET_N~input_o\,
	datab => \theLab|ALT_INV_WideOr3~combout\,
	datac => \theLab|ALT_INV_LOAD~combout\,
	datad => \theLab|ALT_INV_Equal0~0_combout\,
	datae => \theLab|c|ALT_INV_timer~12_combout\,
	dataf => \theLab|c|ALT_INV_Add0~33_sumout\,
	combout => \theLab|c|timer~13_combout\);

-- Location: FF_X40_Y5_N56
\theLab|c|timer[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clockGenerator|var_clock~q\,
	d => \theLab|c|timer~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \theLab|c|timer\(7));

-- Location: LABCELL_X41_Y5_N54
\theLab|c|Add0~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|c|Add0~37_sumout\ = SUM(( \theLab|c|timer\(8) ) + ( VCC ) + ( \theLab|c|Add0~34\ ))
-- \theLab|c|Add0~38\ = CARRY(( \theLab|c|timer\(8) ) + ( VCC ) + ( \theLab|c|Add0~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \theLab|c|ALT_INV_timer\(8),
	cin => \theLab|c|Add0~34\,
	sumout => \theLab|c|Add0~37_sumout\,
	cout => \theLab|c|Add0~38\);

-- Location: LABCELL_X40_Y5_N21
\theLab|c|timer~15\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|c|timer~15_combout\ = ( \theLab|c|timer~14_combout\ & ( \theLab|c|Add0~37_sumout\ & ( (\RESET_N~input_o\ & (((!\theLab|Equal0~0_combout\) # (!\theLab|LOAD~combout\)) # (\theLab|WideOr3~combout\))) ) ) ) # ( !\theLab|c|timer~14_combout\ & ( 
-- \theLab|c|Add0~37_sumout\ & ( (\RESET_N~input_o\ & !\theLab|LOAD~combout\) ) ) ) # ( \theLab|c|timer~14_combout\ & ( !\theLab|c|Add0~37_sumout\ & ( (\RESET_N~input_o\ & (\theLab|LOAD~combout\ & ((!\theLab|Equal0~0_combout\) # (\theLab|WideOr3~combout\)))) 
-- ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000101000101010101000000000101010101010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_RESET_N~input_o\,
	datab => \theLab|ALT_INV_WideOr3~combout\,
	datac => \theLab|ALT_INV_Equal0~0_combout\,
	datad => \theLab|ALT_INV_LOAD~combout\,
	datae => \theLab|c|ALT_INV_timer~14_combout\,
	dataf => \theLab|c|ALT_INV_Add0~37_sumout\,
	combout => \theLab|c|timer~15_combout\);

-- Location: FF_X40_Y5_N23
\theLab|c|timer[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clockGenerator|var_clock~q\,
	d => \theLab|c|timer~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \theLab|c|timer\(8));

-- Location: LABCELL_X41_Y5_N57
\theLab|c|Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|c|Add0~9_sumout\ = SUM(( \theLab|c|timer\(9) ) + ( VCC ) + ( \theLab|c|Add0~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \theLab|c|ALT_INV_timer\(9),
	cin => \theLab|c|Add0~38\,
	sumout => \theLab|c|Add0~9_sumout\);

-- Location: MLABCELL_X37_Y5_N15
\theLab|c|timer~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|c|timer~2_combout\ = ( \theLab|a|ADDRESS\(2) & ( !\theLab|a|ADDRESS\(0) $ (\theLab|a|ADDRESS\(1)) ) ) # ( !\theLab|a|ADDRESS\(2) & ( (\theLab|a|ADDRESS\(0) & !\theLab|a|ADDRESS\(1)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010100000000010101010000000010101010010101011010101001010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \theLab|a|ALT_INV_ADDRESS\(0),
	datad => \theLab|a|ALT_INV_ADDRESS\(1),
	dataf => \theLab|a|ALT_INV_ADDRESS\(2),
	combout => \theLab|c|timer~2_combout\);

-- Location: LABCELL_X40_Y5_N6
\theLab|c|timer~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|c|timer~3_combout\ = ( \theLab|c|Add0~9_sumout\ & ( \theLab|c|timer~2_combout\ & ( (\RESET_N~input_o\ & (((!\theLab|LOAD~combout\) # (!\theLab|Equal0~0_combout\)) # (\theLab|WideOr3~combout\))) ) ) ) # ( !\theLab|c|Add0~9_sumout\ & ( 
-- \theLab|c|timer~2_combout\ & ( (\RESET_N~input_o\ & (\theLab|LOAD~combout\ & ((!\theLab|Equal0~0_combout\) # (\theLab|WideOr3~combout\)))) ) ) ) # ( \theLab|c|Add0~9_sumout\ & ( !\theLab|c|timer~2_combout\ & ( (\RESET_N~input_o\ & !\theLab|LOAD~combout\) 
-- ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000010100000101000000000101000000010101010101010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_RESET_N~input_o\,
	datab => \theLab|ALT_INV_WideOr3~combout\,
	datac => \theLab|ALT_INV_LOAD~combout\,
	datad => \theLab|ALT_INV_Equal0~0_combout\,
	datae => \theLab|c|ALT_INV_Add0~9_sumout\,
	dataf => \theLab|c|ALT_INV_timer~2_combout\,
	combout => \theLab|c|timer~3_combout\);

-- Location: FF_X40_Y5_N8
\theLab|c|timer[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clockGenerator|var_clock~q\,
	d => \theLab|c|timer~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \theLab|c|timer\(9));

-- Location: LABCELL_X39_Y5_N18
\theLab|c|DONE~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|c|DONE~0_combout\ = ( !\theLab|c|timer\(4) & ( !\theLab|c|timer\(7) & ( (!\theLab|c|timer\(8) & (!\theLab|c|timer\(5) & (!\theLab|c|timer\(6) & !\theLab|c|timer\(3)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \theLab|c|ALT_INV_timer\(8),
	datab => \theLab|c|ALT_INV_timer\(5),
	datac => \theLab|c|ALT_INV_timer\(6),
	datad => \theLab|c|ALT_INV_timer\(3),
	datae => \theLab|c|ALT_INV_timer\(4),
	dataf => \theLab|c|ALT_INV_timer\(7),
	combout => \theLab|c|DONE~0_combout\);

-- Location: LABCELL_X39_Y5_N48
\theLab|c|DONE~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|c|DONE~1_combout\ = ( !\theLab|LOAD~combout\ & ( !\theLab|c|timer\(1) & ( (!\theLab|c|timer\(9) & (\theLab|c|timer\(0) & (!\theLab|c|timer\(2) & \theLab|c|DONE~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000100000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \theLab|c|ALT_INV_timer\(9),
	datab => \theLab|c|ALT_INV_timer\(0),
	datac => \theLab|c|ALT_INV_timer\(2),
	datad => \theLab|c|ALT_INV_DONE~0_combout\,
	datae => \theLab|ALT_INV_LOAD~combout\,
	dataf => \theLab|c|ALT_INV_timer\(1),
	combout => \theLab|c|DONE~1_combout\);

-- Location: FF_X39_Y5_N50
\theLab|c|DONE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clockGenerator|var_clock~q\,
	d => \theLab|c|DONE~1_combout\,
	asdata => VCC,
	sload => \ALT_INV_RESET_N~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \theLab|c|DONE~q\);

-- Location: LABCELL_X39_Y5_N36
\theLab|SCURR~22\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|SCURR~22_combout\ = ( \KEY[0]~input_o\ & ( \theLab|SCURR.countdown~q\ & ( (\KEY[3]~input_o\ & (\RESET_N~input_o\ & ((\theLab|SCURR.ready~q\) # (\theLab|c|DONE~q\)))) ) ) ) # ( \KEY[0]~input_o\ & ( !\theLab|SCURR.countdown~q\ & ( (\KEY[3]~input_o\ 
-- & (\theLab|SCURR.ready~q\ & \RESET_N~input_o\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000001100000000000000000000000000010011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \theLab|c|ALT_INV_DONE~q\,
	datab => \ALT_INV_KEY[3]~input_o\,
	datac => \theLab|ALT_INV_SCURR.ready~q\,
	datad => \ALT_INV_RESET_N~input_o\,
	datae => \ALT_INV_KEY[0]~input_o\,
	dataf => \theLab|ALT_INV_SCURR.countdown~q\,
	combout => \theLab|SCURR~22_combout\);

-- Location: FF_X40_Y5_N35
\theLab|SCURR.ready\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clockGenerator|var_clock~q\,
	asdata => \theLab|SCURR~22_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \theLab|SCURR.ready~q\);

-- Location: LABCELL_X39_Y5_N15
\theLab|SCURR~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|SCURR~21_combout\ = ( \theLab|SCURR.ready~q\ & ( (\RESET_N~input_o\ & (!\KEY[0]~input_o\ & \KEY[3]~input_o\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000100000001000000010000000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_RESET_N~input_o\,
	datab => \ALT_INV_KEY[0]~input_o\,
	datac => \ALT_INV_KEY[3]~input_o\,
	dataf => \theLab|ALT_INV_SCURR.ready~q\,
	combout => \theLab|SCURR~21_combout\);

-- Location: FF_X40_Y5_N38
\theLab|SCURR.b_won\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clockGenerator|var_clock~q\,
	asdata => \theLab|SCURR~21_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \theLab|SCURR.b_won~q\);

-- Location: LABCELL_X39_Y4_N12
\theLab|SIGNAL\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|SIGNAL~combout\ = ( \theLab|WideOr4~0_combout\ & ( \theLab|SCURR.false_win~q\ ) ) # ( !\theLab|WideOr4~0_combout\ & ( \theLab|SCURR.false_win~q\ ) ) # ( \theLab|WideOr4~0_combout\ & ( !\theLab|SCURR.false_win~q\ & ( (\theLab|SCURR.normal_win~q\) # 
-- (\theLab|SCURR.b_won~q\) ) ) ) # ( !\theLab|WideOr4~0_combout\ & ( !\theLab|SCURR.false_win~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111001100111111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \theLab|ALT_INV_SCURR.b_won~q\,
	datad => \theLab|ALT_INV_SCURR.normal_win~q\,
	datae => \theLab|ALT_INV_WideOr4~0_combout\,
	dataf => \theLab|ALT_INV_SCURR.false_win~q\,
	combout => \theLab|SIGNAL~combout\);

-- Location: LABCELL_X39_Y4_N30
\theLab|WideOr6\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|WideOr6~combout\ = ( \theLab|SCURR.false_win~q\ ) # ( !\theLab|SCURR.false_win~q\ & ( (((\theLab|SCURR.a_false_win~q\) # (\theLab|SCURR.b_false~q\)) # (\theLab|SCURR.a_false~q\)) # (\theLab|SCURR.b_false_win~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111111111111111011111111111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \theLab|ALT_INV_SCURR.b_false_win~q\,
	datab => \theLab|ALT_INV_SCURR.a_false~q\,
	datac => \theLab|ALT_INV_SCURR.b_false~q\,
	datad => \theLab|ALT_INV_SCURR.a_false_win~q\,
	dataf => \theLab|ALT_INV_SCURR.false_win~q\,
	combout => \theLab|WideOr6~combout\);

-- Location: LABCELL_X39_Y4_N0
\scoreADisplay|WideOr6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \scoreADisplay|WideOr6~0_combout\ = ( \theLab|a_count_score|COUNT\(0) & ( (!\theLab|a_count_score|COUNT\(3) & (!\theLab|a_count_score|COUNT\(1) & !\theLab|a_count_score|COUNT\(2))) # (\theLab|a_count_score|COUNT\(3) & (!\theLab|a_count_score|COUNT\(1) $ 
-- (!\theLab|a_count_score|COUNT\(2)))) ) ) # ( !\theLab|a_count_score|COUNT\(0) & ( (!\theLab|a_count_score|COUNT\(3) & (!\theLab|a_count_score|COUNT\(1) & \theLab|a_count_score|COUNT\(2))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011000000000000001100000011000011001100001100001100110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \theLab|a_count_score|ALT_INV_COUNT\(3),
	datac => \theLab|a_count_score|ALT_INV_COUNT\(1),
	datad => \theLab|a_count_score|ALT_INV_COUNT\(2),
	dataf => \theLab|a_count_score|ALT_INV_COUNT\(0),
	combout => \scoreADisplay|WideOr6~0_combout\);

-- Location: LABCELL_X40_Y4_N15
\scoreADisplay|WideOr5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \scoreADisplay|WideOr5~0_combout\ = ( \theLab|a_count_score|COUNT\(3) & ( (!\theLab|a_count_score|COUNT\(0) & (\theLab|a_count_score|COUNT\(2))) # (\theLab|a_count_score|COUNT\(0) & ((\theLab|a_count_score|COUNT\(1)))) ) ) # ( 
-- !\theLab|a_count_score|COUNT\(3) & ( (\theLab|a_count_score|COUNT\(2) & (!\theLab|a_count_score|COUNT\(0) $ (!\theLab|a_count_score|COUNT\(1)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100001100000000110000110000001100001111110000110000111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \theLab|a_count_score|ALT_INV_COUNT\(0),
	datac => \theLab|a_count_score|ALT_INV_COUNT\(2),
	datad => \theLab|a_count_score|ALT_INV_COUNT\(1),
	dataf => \theLab|a_count_score|ALT_INV_COUNT\(3),
	combout => \scoreADisplay|WideOr5~0_combout\);

-- Location: LABCELL_X39_Y4_N6
\scoreADisplay|WideOr4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \scoreADisplay|WideOr4~0_combout\ = ( \theLab|a_count_score|COUNT\(1) & ( (!\theLab|a_count_score|COUNT\(2) & (!\theLab|a_count_score|COUNT\(0) & !\theLab|a_count_score|COUNT\(3))) # (\theLab|a_count_score|COUNT\(2) & ((\theLab|a_count_score|COUNT\(3)))) 
-- ) ) # ( !\theLab|a_count_score|COUNT\(1) & ( (!\theLab|a_count_score|COUNT\(0) & (\theLab|a_count_score|COUNT\(2) & \theLab|a_count_score|COUNT\(3))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000100010000000000010001010001000001100111000100000110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \theLab|a_count_score|ALT_INV_COUNT\(0),
	datab => \theLab|a_count_score|ALT_INV_COUNT\(2),
	datad => \theLab|a_count_score|ALT_INV_COUNT\(3),
	dataf => \theLab|a_count_score|ALT_INV_COUNT\(1),
	combout => \scoreADisplay|WideOr4~0_combout\);

-- Location: LABCELL_X40_Y4_N0
\scoreADisplay|WideOr3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \scoreADisplay|WideOr3~0_combout\ = ( \theLab|a_count_score|COUNT\(1) & ( (!\theLab|a_count_score|COUNT\(2) & (!\theLab|a_count_score|COUNT\(0) & \theLab|a_count_score|COUNT\(3))) # (\theLab|a_count_score|COUNT\(2) & (\theLab|a_count_score|COUNT\(0))) ) ) 
-- # ( !\theLab|a_count_score|COUNT\(1) & ( (!\theLab|a_count_score|COUNT\(3) & (!\theLab|a_count_score|COUNT\(2) $ (!\theLab|a_count_score|COUNT\(0)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110000001100000011000000110000000011001000110010001100100011001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \theLab|a_count_score|ALT_INV_COUNT\(2),
	datab => \theLab|a_count_score|ALT_INV_COUNT\(0),
	datac => \theLab|a_count_score|ALT_INV_COUNT\(3),
	dataf => \theLab|a_count_score|ALT_INV_COUNT\(1),
	combout => \scoreADisplay|WideOr3~0_combout\);

-- Location: LABCELL_X40_Y4_N6
\scoreADisplay|WideOr2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \scoreADisplay|WideOr2~0_combout\ = ( \theLab|a_count_score|COUNT\(3) & ( (!\theLab|a_count_score|COUNT\(2) & (\theLab|a_count_score|COUNT\(0) & !\theLab|a_count_score|COUNT\(1))) ) ) # ( !\theLab|a_count_score|COUNT\(3) & ( 
-- ((\theLab|a_count_score|COUNT\(2) & !\theLab|a_count_score|COUNT\(1))) # (\theLab|a_count_score|COUNT\(0)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111001101110011011100110111001100100000001000000010000000100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \theLab|a_count_score|ALT_INV_COUNT\(2),
	datab => \theLab|a_count_score|ALT_INV_COUNT\(0),
	datac => \theLab|a_count_score|ALT_INV_COUNT\(1),
	dataf => \theLab|a_count_score|ALT_INV_COUNT\(3),
	combout => \scoreADisplay|WideOr2~0_combout\);

-- Location: LABCELL_X39_Y4_N36
\scoreADisplay|WideOr1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \scoreADisplay|WideOr1~0_combout\ = ( \theLab|a_count_score|COUNT\(0) & ( !\theLab|a_count_score|COUNT\(3) $ (((!\theLab|a_count_score|COUNT\(1) & \theLab|a_count_score|COUNT\(2)))) ) ) # ( !\theLab|a_count_score|COUNT\(0) & ( 
-- (\theLab|a_count_score|COUNT\(1) & (!\theLab|a_count_score|COUNT\(3) & !\theLab|a_count_score|COUNT\(2))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100010000000000010001000000000011001100011001101100110001100110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \theLab|a_count_score|ALT_INV_COUNT\(1),
	datab => \theLab|a_count_score|ALT_INV_COUNT\(3),
	datad => \theLab|a_count_score|ALT_INV_COUNT\(2),
	dataf => \theLab|a_count_score|ALT_INV_COUNT\(0),
	combout => \scoreADisplay|WideOr1~0_combout\);

-- Location: LABCELL_X39_Y4_N9
\scoreADisplay|WideOr0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \scoreADisplay|WideOr0~0_combout\ = ( \theLab|a_count_score|COUNT\(1) & ( (!\theLab|a_count_score|COUNT\(0)) # ((!\theLab|a_count_score|COUNT\(2)) # (\theLab|a_count_score|COUNT\(3))) ) ) # ( !\theLab|a_count_score|COUNT\(1) & ( 
-- (!\theLab|a_count_score|COUNT\(2) & ((\theLab|a_count_score|COUNT\(3)))) # (\theLab|a_count_score|COUNT\(2) & ((!\theLab|a_count_score|COUNT\(3)) # (\theLab|a_count_score|COUNT\(0)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011110100111101001111010011110111101111111011111110111111101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \theLab|a_count_score|ALT_INV_COUNT\(0),
	datab => \theLab|a_count_score|ALT_INV_COUNT\(2),
	datac => \theLab|a_count_score|ALT_INV_COUNT\(3),
	dataf => \theLab|a_count_score|ALT_INV_COUNT\(1),
	combout => \scoreADisplay|WideOr0~0_combout\);

-- Location: MLABCELL_X37_Y4_N12
\scoreBDisplay|WideOr6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \scoreBDisplay|WideOr6~0_combout\ = ( \theLab|b_count_score|COUNT\(0) & ( (!\theLab|b_count_score|COUNT\(3) & (!\theLab|b_count_score|COUNT\(1) & !\theLab|b_count_score|COUNT\(2))) # (\theLab|b_count_score|COUNT\(3) & (!\theLab|b_count_score|COUNT\(1) $ 
-- (!\theLab|b_count_score|COUNT\(2)))) ) ) # ( !\theLab|b_count_score|COUNT\(0) & ( (!\theLab|b_count_score|COUNT\(3) & (!\theLab|b_count_score|COUNT\(1) & \theLab|b_count_score|COUNT\(2))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011000000000000001100000011000011001100001100001100110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \theLab|b_count_score|ALT_INV_COUNT\(3),
	datac => \theLab|b_count_score|ALT_INV_COUNT\(1),
	datad => \theLab|b_count_score|ALT_INV_COUNT\(2),
	dataf => \theLab|b_count_score|ALT_INV_COUNT\(0),
	combout => \scoreBDisplay|WideOr6~0_combout\);

-- Location: MLABCELL_X37_Y4_N45
\scoreBDisplay|WideOr5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \scoreBDisplay|WideOr5~0_combout\ = ( \theLab|b_count_score|COUNT\(0) & ( (!\theLab|b_count_score|COUNT\(1) & (\theLab|b_count_score|COUNT\(2) & !\theLab|b_count_score|COUNT\(3))) # (\theLab|b_count_score|COUNT\(1) & ((\theLab|b_count_score|COUNT\(3)))) ) 
-- ) # ( !\theLab|b_count_score|COUNT\(0) & ( (\theLab|b_count_score|COUNT\(2) & ((\theLab|b_count_score|COUNT\(3)) # (\theLab|b_count_score|COUNT\(1)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001001100010011000100110001001100100101001001010010010100100101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \theLab|b_count_score|ALT_INV_COUNT\(1),
	datab => \theLab|b_count_score|ALT_INV_COUNT\(2),
	datac => \theLab|b_count_score|ALT_INV_COUNT\(3),
	dataf => \theLab|b_count_score|ALT_INV_COUNT\(0),
	combout => \scoreBDisplay|WideOr5~0_combout\);

-- Location: MLABCELL_X37_Y4_N24
\scoreBDisplay|WideOr4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \scoreBDisplay|WideOr4~0_combout\ = ( \theLab|b_count_score|COUNT\(0) & ( (\theLab|b_count_score|COUNT\(3) & (\theLab|b_count_score|COUNT\(1) & \theLab|b_count_score|COUNT\(2))) ) ) # ( !\theLab|b_count_score|COUNT\(0) & ( 
-- (!\theLab|b_count_score|COUNT\(3) & (\theLab|b_count_score|COUNT\(1) & !\theLab|b_count_score|COUNT\(2))) # (\theLab|b_count_score|COUNT\(3) & ((\theLab|b_count_score|COUNT\(2)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110000110011000011000011001100000000000000110000000000000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \theLab|b_count_score|ALT_INV_COUNT\(3),
	datac => \theLab|b_count_score|ALT_INV_COUNT\(1),
	datad => \theLab|b_count_score|ALT_INV_COUNT\(2),
	dataf => \theLab|b_count_score|ALT_INV_COUNT\(0),
	combout => \scoreBDisplay|WideOr4~0_combout\);

-- Location: MLABCELL_X37_Y4_N57
\scoreBDisplay|WideOr3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \scoreBDisplay|WideOr3~0_combout\ = ( \theLab|b_count_score|COUNT\(0) & ( (!\theLab|b_count_score|COUNT\(1) & (!\theLab|b_count_score|COUNT\(2) & !\theLab|b_count_score|COUNT\(3))) # (\theLab|b_count_score|COUNT\(1) & (\theLab|b_count_score|COUNT\(2))) ) 
-- ) # ( !\theLab|b_count_score|COUNT\(0) & ( (!\theLab|b_count_score|COUNT\(1) & (\theLab|b_count_score|COUNT\(2) & !\theLab|b_count_score|COUNT\(3))) # (\theLab|b_count_score|COUNT\(1) & (!\theLab|b_count_score|COUNT\(2) & \theLab|b_count_score|COUNT\(3))) 
-- ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010010000100100001001000010010010010001100100011001000110010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \theLab|b_count_score|ALT_INV_COUNT\(1),
	datab => \theLab|b_count_score|ALT_INV_COUNT\(2),
	datac => \theLab|b_count_score|ALT_INV_COUNT\(3),
	dataf => \theLab|b_count_score|ALT_INV_COUNT\(0),
	combout => \scoreBDisplay|WideOr3~0_combout\);

-- Location: MLABCELL_X37_Y4_N51
\scoreBDisplay|WideOr2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \scoreBDisplay|WideOr2~0_combout\ = ( \theLab|b_count_score|COUNT\(0) & ( (!\theLab|b_count_score|COUNT\(3)) # ((!\theLab|b_count_score|COUNT\(1) & !\theLab|b_count_score|COUNT\(2))) ) ) # ( !\theLab|b_count_score|COUNT\(0) & ( 
-- (!\theLab|b_count_score|COUNT\(1) & (\theLab|b_count_score|COUNT\(2) & !\theLab|b_count_score|COUNT\(3))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010000000100000001000000010000011111000111110001111100011111000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \theLab|b_count_score|ALT_INV_COUNT\(1),
	datab => \theLab|b_count_score|ALT_INV_COUNT\(2),
	datac => \theLab|b_count_score|ALT_INV_COUNT\(3),
	dataf => \theLab|b_count_score|ALT_INV_COUNT\(0),
	combout => \scoreBDisplay|WideOr2~0_combout\);

-- Location: MLABCELL_X37_Y4_N18
\scoreBDisplay|WideOr1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \scoreBDisplay|WideOr1~0_combout\ = ( \theLab|b_count_score|COUNT\(0) & ( !\theLab|b_count_score|COUNT\(3) $ (((!\theLab|b_count_score|COUNT\(1) & \theLab|b_count_score|COUNT\(2)))) ) ) # ( !\theLab|b_count_score|COUNT\(0) & ( 
-- (!\theLab|b_count_score|COUNT\(3) & (\theLab|b_count_score|COUNT\(1) & !\theLab|b_count_score|COUNT\(2))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110000000000000011000000000011001100001111001100110000111100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \theLab|b_count_score|ALT_INV_COUNT\(3),
	datac => \theLab|b_count_score|ALT_INV_COUNT\(1),
	datad => \theLab|b_count_score|ALT_INV_COUNT\(2),
	dataf => \theLab|b_count_score|ALT_INV_COUNT\(0),
	combout => \scoreBDisplay|WideOr1~0_combout\);

-- Location: MLABCELL_X37_Y4_N36
\scoreBDisplay|WideOr0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \scoreBDisplay|WideOr0~0_combout\ = ( \theLab|b_count_score|COUNT\(0) & ( (!\theLab|b_count_score|COUNT\(1) $ (!\theLab|b_count_score|COUNT\(2))) # (\theLab|b_count_score|COUNT\(3)) ) ) # ( !\theLab|b_count_score|COUNT\(0) & ( 
-- (!\theLab|b_count_score|COUNT\(3) $ (!\theLab|b_count_score|COUNT\(2))) # (\theLab|b_count_score|COUNT\(1)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011111111001111001111111100111100111111111100110011111111110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \theLab|b_count_score|ALT_INV_COUNT\(3),
	datac => \theLab|b_count_score|ALT_INV_COUNT\(1),
	datad => \theLab|b_count_score|ALT_INV_COUNT\(2),
	dataf => \theLab|b_count_score|ALT_INV_COUNT\(0),
	combout => \scoreBDisplay|WideOr0~0_combout\);

-- Location: LABCELL_X39_Y4_N33
\theLab|WideOr1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|WideOr1~0_combout\ = ( !\theLab|SCURR.b_won~q\ & ( (!\theLab|SCURR.b_false_win~q\ & !\theLab|SCURR.b_normal_win~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101000000000101010100000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \theLab|ALT_INV_SCURR.b_false_win~q\,
	datad => \theLab|ALT_INV_SCURR.b_normal_win~q\,
	dataf => \theLab|ALT_INV_SCURR.b_won~q\,
	combout => \theLab|WideOr1~0_combout\);

-- Location: LABCELL_X39_Y4_N3
\winnerDisplay|Decoder0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \winnerDisplay|Decoder0~0_combout\ = ( \theLab|SCURR.b_won~q\ ) # ( !\theLab|SCURR.b_won~q\ & ( (\theLab|SCURR.b_normal_win~q\) # (\theLab|SCURR.b_false_win~q\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010111111111010101011111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \theLab|ALT_INV_SCURR.b_false_win~q\,
	datad => \theLab|ALT_INV_SCURR.b_normal_win~q\,
	dataf => \theLab|ALT_INV_SCURR.b_won~q\,
	combout => \winnerDisplay|Decoder0~0_combout\);

-- Location: LABCELL_X39_Y4_N18
\winnerDisplay|WideOr3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \winnerDisplay|WideOr3~0_combout\ = ( \theLab|SCURR.a_normal_win~q\ & ( \theLab|SCURR.a_won~q\ & ( (!\theLab|SCURR.b_normal_win~q\ & (!\theLab|SCURR.b_won~q\ & !\theLab|SCURR.b_false_win~q\)) ) ) ) # ( !\theLab|SCURR.a_normal_win~q\ & ( 
-- \theLab|SCURR.a_won~q\ & ( (!\theLab|SCURR.b_normal_win~q\ & (!\theLab|SCURR.b_won~q\ & !\theLab|SCURR.b_false_win~q\)) ) ) ) # ( \theLab|SCURR.a_normal_win~q\ & ( !\theLab|SCURR.a_won~q\ & ( (!\theLab|SCURR.b_normal_win~q\ & (!\theLab|SCURR.b_won~q\ & 
-- !\theLab|SCURR.b_false_win~q\)) ) ) ) # ( !\theLab|SCURR.a_normal_win~q\ & ( !\theLab|SCURR.a_won~q\ & ( (!\theLab|SCURR.b_normal_win~q\ & (!\theLab|SCURR.b_won~q\ & (!\theLab|SCURR.b_false_win~q\ & \theLab|SCURR.a_false_win~q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010000000100000001000000010000000100000001000000010000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \theLab|ALT_INV_SCURR.b_normal_win~q\,
	datab => \theLab|ALT_INV_SCURR.b_won~q\,
	datac => \theLab|ALT_INV_SCURR.b_false_win~q\,
	datad => \theLab|ALT_INV_SCURR.a_false_win~q\,
	datae => \theLab|ALT_INV_SCURR.a_normal_win~q\,
	dataf => \theLab|ALT_INV_SCURR.a_won~q\,
	combout => \winnerDisplay|WideOr3~0_combout\);

-- Location: LABCELL_X39_Y4_N24
\theLab|WideOr0\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|WideOr0~combout\ = ( \theLab|SCURR.a_normal_win~q\ & ( \theLab|SCURR.a_won~q\ ) ) # ( !\theLab|SCURR.a_normal_win~q\ & ( \theLab|SCURR.a_won~q\ ) ) # ( \theLab|SCURR.a_normal_win~q\ & ( !\theLab|SCURR.a_won~q\ ) ) # ( 
-- !\theLab|SCURR.a_normal_win~q\ & ( !\theLab|SCURR.a_won~q\ & ( (((\theLab|SCURR.a_false_win~q\) # (\theLab|SCURR.b_false_win~q\)) # (\theLab|SCURR.b_won~q\)) # (\theLab|SCURR.b_normal_win~q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111111111111111111111111111111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \theLab|ALT_INV_SCURR.b_normal_win~q\,
	datab => \theLab|ALT_INV_SCURR.b_won~q\,
	datac => \theLab|ALT_INV_SCURR.b_false_win~q\,
	datad => \theLab|ALT_INV_SCURR.a_false_win~q\,
	datae => \theLab|ALT_INV_SCURR.a_normal_win~q\,
	dataf => \theLab|ALT_INV_SCURR.a_won~q\,
	combout => \theLab|WideOr0~combout\);

-- Location: MLABCELL_X37_Y5_N57
\theLab|WideOr5\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|WideOr5~combout\ = ( \theLab|WideOr5~0_combout\ & ( !\theLab|SCURR.b_false~q\ & ( (!\theLab|SCURR.a_normal_win~q\ & (!\theLab|SCURR.start~q\ & (!\theLab|SCURR.a_won~q\ & !\theLab|SCURR.countdown~q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000100000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \theLab|ALT_INV_SCURR.a_normal_win~q\,
	datab => \theLab|ALT_INV_SCURR.start~q\,
	datac => \theLab|ALT_INV_SCURR.a_won~q\,
	datad => \theLab|ALT_INV_SCURR.countdown~q\,
	datae => \theLab|ALT_INV_WideOr5~0_combout\,
	dataf => \theLab|ALT_INV_SCURR.b_false~q\,
	combout => \theLab|WideOr5~combout\);

-- Location: LABCELL_X39_Y4_N54
\theLab|WideOr4\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|WideOr4~combout\ = ( !\theLab|SCURR.b_normal_win~q\ & ( !\theLab|SCURR.b_false_win~q\ & ( (\theLab|WideOr4~0_combout\ & !\theLab|SCURR.a_false_win~q\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100010001000100000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \theLab|ALT_INV_WideOr4~0_combout\,
	datab => \theLab|ALT_INV_SCURR.a_false_win~q\,
	datae => \theLab|ALT_INV_SCURR.b_normal_win~q\,
	dataf => \theLab|ALT_INV_SCURR.b_false_win~q\,
	combout => \theLab|WideOr4~combout\);

-- Location: LABCELL_X39_Y4_N51
\theLab|WideOr2\ : cyclonev_lcell_comb
-- Equation(s):
-- \theLab|WideOr2~combout\ = ( !\theLab|SCURR.a_normal_win~q\ & ( !\theLab|SCURR.b_won~q\ & ( (\theLab|LOAD~1_combout\ & (!\theLab|SCURR.a_false_win~q\ & (!\theLab|SCURR.b_normal_win~q\ & !\theLab|SCURR.b_false_win~q\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \theLab|ALT_INV_LOAD~1_combout\,
	datab => \theLab|ALT_INV_SCURR.a_false_win~q\,
	datac => \theLab|ALT_INV_SCURR.b_normal_win~q\,
	datad => \theLab|ALT_INV_SCURR.b_false_win~q\,
	datae => \theLab|ALT_INV_SCURR.a_normal_win~q\,
	dataf => \theLab|ALT_INV_SCURR.b_won~q\,
	combout => \theLab|WideOr2~combout\);

-- Location: MLABCELL_X45_Y1_N24
\stateDisplay|WideOr6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \stateDisplay|WideOr6~0_combout\ = ( \theLab|WideOr3~combout\ & ( (\theLab|WideOr4~combout\ & (!\theLab|WideOr5~combout\ $ (\theLab|WideOr2~combout\))) ) ) # ( !\theLab|WideOr3~combout\ & ( (!\theLab|WideOr5~combout\ & (!\theLab|WideOr4~combout\ $ 
-- (\theLab|WideOr2~combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000001010000010100000101000001000100001001000010010000100100001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \theLab|ALT_INV_WideOr5~combout\,
	datab => \theLab|ALT_INV_WideOr4~combout\,
	datac => \theLab|ALT_INV_WideOr2~combout\,
	dataf => \theLab|ALT_INV_WideOr3~combout\,
	combout => \stateDisplay|WideOr6~0_combout\);

-- Location: MLABCELL_X45_Y1_N57
\stateDisplay|WideOr5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \stateDisplay|WideOr5~0_combout\ = ( \theLab|WideOr2~combout\ & ( (\theLab|WideOr3~combout\ & (!\theLab|WideOr4~combout\ $ (!\theLab|WideOr5~combout\))) ) ) # ( !\theLab|WideOr2~combout\ & ( (!\theLab|WideOr5~combout\ & ((!\theLab|WideOr4~combout\))) # 
-- (\theLab|WideOr5~combout\ & (\theLab|WideOr3~combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000001010101111100000101010100000101010100000000010101010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \theLab|ALT_INV_WideOr3~combout\,
	datac => \theLab|ALT_INV_WideOr4~combout\,
	datad => \theLab|ALT_INV_WideOr5~combout\,
	dataf => \theLab|ALT_INV_WideOr2~combout\,
	combout => \stateDisplay|WideOr5~0_combout\);

-- Location: MLABCELL_X45_Y1_N36
\stateDisplay|WideOr4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \stateDisplay|WideOr4~0_combout\ = ( \theLab|WideOr3~combout\ & ( (!\theLab|WideOr2~combout\ & ((!\theLab|WideOr4~combout\) # (\theLab|WideOr5~combout\))) ) ) # ( !\theLab|WideOr3~combout\ & ( (\theLab|WideOr5~combout\ & (!\theLab|WideOr4~combout\ & 
-- \theLab|WideOr2~combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010000000100000001000000010011010000110100001101000011010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \theLab|ALT_INV_WideOr5~combout\,
	datab => \theLab|ALT_INV_WideOr4~combout\,
	datac => \theLab|ALT_INV_WideOr2~combout\,
	dataf => \theLab|ALT_INV_WideOr3~combout\,
	combout => \stateDisplay|WideOr4~0_combout\);

-- Location: MLABCELL_X45_Y1_N45
\stateDisplay|WideOr3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \stateDisplay|WideOr3~0_combout\ = ( \theLab|WideOr2~combout\ & ( (!\theLab|WideOr3~combout\ & (\theLab|WideOr4~combout\ & !\theLab|WideOr5~combout\)) # (\theLab|WideOr3~combout\ & (!\theLab|WideOr4~combout\ $ (\theLab|WideOr5~combout\))) ) ) # ( 
-- !\theLab|WideOr2~combout\ & ( (!\theLab|WideOr4~combout\ & (!\theLab|WideOr3~combout\ $ (!\theLab|WideOr5~combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000010100000010100001010000001011010000001010101101000000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \theLab|ALT_INV_WideOr3~combout\,
	datac => \theLab|ALT_INV_WideOr4~combout\,
	datad => \theLab|ALT_INV_WideOr5~combout\,
	dataf => \theLab|ALT_INV_WideOr2~combout\,
	combout => \stateDisplay|WideOr3~0_combout\);

-- Location: MLABCELL_X45_Y1_N0
\stateDisplay|WideOr2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \stateDisplay|WideOr2~0_combout\ = ( \theLab|WideOr3~combout\ & ( (\theLab|WideOr2~combout\ & ((!\theLab|WideOr5~combout\) # (\theLab|WideOr4~combout\))) ) ) # ( !\theLab|WideOr3~combout\ & ( (!\theLab|WideOr5~combout\ & ((\theLab|WideOr2~combout\) # 
-- (\theLab|WideOr4~combout\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010101000101010001010100010101000001011000010110000101100001011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \theLab|ALT_INV_WideOr5~combout\,
	datab => \theLab|ALT_INV_WideOr4~combout\,
	datac => \theLab|ALT_INV_WideOr2~combout\,
	dataf => \theLab|ALT_INV_WideOr3~combout\,
	combout => \stateDisplay|WideOr2~0_combout\);

-- Location: MLABCELL_X45_Y1_N33
\stateDisplay|WideOr1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \stateDisplay|WideOr1~0_combout\ = ( \theLab|WideOr2~combout\ & ( (!\theLab|WideOr3~combout\ & ((!\theLab|WideOr4~combout\) # (!\theLab|WideOr5~combout\))) # (\theLab|WideOr3~combout\ & (!\theLab|WideOr4~combout\ & !\theLab|WideOr5~combout\)) ) ) # ( 
-- !\theLab|WideOr2~combout\ & ( (\theLab|WideOr3~combout\ & (\theLab|WideOr4~combout\ & !\theLab|WideOr5~combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000000000001010000000011111010101000001111101010100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \theLab|ALT_INV_WideOr3~combout\,
	datac => \theLab|ALT_INV_WideOr4~combout\,
	datad => \theLab|ALT_INV_WideOr5~combout\,
	dataf => \theLab|ALT_INV_WideOr2~combout\,
	combout => \stateDisplay|WideOr1~0_combout\);

-- Location: MLABCELL_X45_Y1_N12
\stateDisplay|WideOr0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \stateDisplay|WideOr0~0_combout\ = ( \theLab|WideOr3~combout\ & ( (!\theLab|WideOr5~combout\ & ((!\theLab|WideOr2~combout\) # (\theLab|WideOr4~combout\))) # (\theLab|WideOr5~combout\ & ((!\theLab|WideOr4~combout\) # (\theLab|WideOr2~combout\))) ) ) # ( 
-- !\theLab|WideOr3~combout\ & ( (!\theLab|WideOr4~combout\) # (!\theLab|WideOr2~combout\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111110011111100111111001111110011100111111001111110011111100111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \theLab|ALT_INV_WideOr5~combout\,
	datab => \theLab|ALT_INV_WideOr4~combout\,
	datac => \theLab|ALT_INV_WideOr2~combout\,
	dataf => \theLab|ALT_INV_WideOr3~combout\,
	combout => \stateDisplay|WideOr0~0_combout\);

-- Location: IOIBUF_X33_Y0_N41
\SW[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(0),
	o => \SW[0]~input_o\);

-- Location: IOIBUF_X33_Y0_N58
\SW[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(1),
	o => \SW[1]~input_o\);

-- Location: IOIBUF_X34_Y0_N1
\SW[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(2),
	o => \SW[2]~input_o\);

-- Location: IOIBUF_X34_Y0_N18
\SW[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(3),
	o => \SW[3]~input_o\);

-- Location: IOIBUF_X36_Y0_N35
\SW[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(4),
	o => \SW[4]~input_o\);

-- Location: IOIBUF_X36_Y0_N52
\SW[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(5),
	o => \SW[5]~input_o\);

-- Location: IOIBUF_X34_Y0_N52
\SW[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(6),
	o => \SW[6]~input_o\);

-- Location: IOIBUF_X11_Y0_N35
\KEY[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(1),
	o => \KEY[1]~input_o\);

-- Location: LABCELL_X36_Y39_N0
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;



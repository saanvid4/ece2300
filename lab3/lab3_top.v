module lab3_top(CLK50, SW, KEY, RESET_N, LEDR, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0);
  input         CLK50;
  input  [9:0]  SW;
  input  [3:0]  KEY;
  input			 RESET_N;
  
  output [9:0]  LEDR;
  output [6:0]  HEX5;
  output [6:0]  HEX4;
  output [6:0]  HEX3;
  output [6:0]  HEX2;
  output [6:0]  HEX1;
  output [6:0]  HEX0;
  
  wire           CLK;
  wire           SIGNAL;
  wire    [3:0]  SCORE_A;
  wire    [3:0]  SCORE_B;
  wire    [3:0]  WINNER;
  wire    [3:0]  STATE;
  wire           FALSE_START;
  
  lab3 theLab(
   .CLK(CLK),
	 .RESET(~RESET_N),
	 .NEXT(KEY[2]),
	 .PLAYER_A(KEY[3]),
	 .PLAYER_B(KEY[0]),
	 .SIGNAL(SIGNAL),
	 .SCORE_A(SCORE_A),
	 .SCORE_B(SCORE_B),
	 .WINNER(WINNER),
	 .STATE(STATE),
	 .FALSE_START(FALSE_START)
  );
  
  var_clk clockGenerator(
    .clock_50MHz(CLK50),
    .clock_sel(SW[9:7]),
    .var_clock(CLK)
  );
  
  // LED ARRAY BROADCASTER
  assign LEDR = SIGNAL ? 10'h3FF : 10'b0;

  // SEVEN-SEGMENT DISPLAY DRIVERS

  // replace unused segments with code to disable display
  assign HEX4 = 7'b1111111;
  
  assign HEX5 = FALSE_START ? 7'b0001110 : 7'b1111111;
  
  hex_to_seven_seg scoreADisplay(
    .B(SCORE_A),
    .SSEG_L(HEX3)
  );

  hex_to_seven_seg scoreBDisplay(
    .B(SCORE_B),
    .SSEG_L(HEX2)
  );

  hex_to_seven_seg winnerDisplay(
    .B(WINNER),
    .SSEG_L(HEX1)
  );

  hex_to_seven_seg stateDisplay(
    .B(STATE),
    .SSEG_L(HEX0)
  );
  
endmodule

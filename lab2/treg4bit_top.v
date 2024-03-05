module treg4bit_top(CLK50, SW, KEY, RESET_N, LEDR, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0);
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
  
  treg4bit register(
		.CLK(CLK),
		.RESET(~RESET_N),
		.IN(SW[3:0]),
		.OUT(LEDR[3:0])
	);
	
  var_clk clockGenerator(
    .clock_50MHz(CLK50),
    .clock_sel(SW[9:7]),
    .var_clock(CLK)
  );
  
endmodule

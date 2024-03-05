module address_generator (RESET, CLK, ADDRESS);

input RESET;
input CLK;

output [2:0] ADDRESS;

reg [2:0] ADDRESS;

always @(posedge CLK) begin
	if (RESET) begin
		ADDRESS <= 3'b000;
	end
	else begin
		ADDRESS <= ADDRESS + 3'b001;
	end
end
endmodule


//Mux 2 to 1. 256 bit inputs and 256 bit output.
//Created by: Colter Sisler, Scott Everitt, Steven Dougherty
//Team: Nighthawk
//Rev: 2.0
//2-22-2017

module mux4 ( 
	input signed [255:0] sum_0, 
	input signed [255:0] sum_1, 
	input signed [255:0] sum_2,
	input signed [255:0] sum_3,
	input [1:0] select, 
	output reg signed [255:0] out_mux
);

always @* begin
   case (select)
	0: out_mux = sum_0;
	1: out_mux = sum_1;
	2: out_mux = sum_2;
	3: out_mux = sum_3;
   endcase
  end
endmodule


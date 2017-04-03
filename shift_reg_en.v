
module shift_reg_en (
		input clk,
		input signed [255:0] D,
		output reg signed [255:0] Q,
		input enable
);


always @ (posedge clk) 
begin
   if (enable == 1)  
	begin
	Q <= D;
   end
end
endmodule

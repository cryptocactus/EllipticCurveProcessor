
module shift_reg (
		input clk,
		input start,
		input signed [255:0] D,
		output reg signed [255:0] Q
);

initial begin
Q = 256'b0;
end

always @ (posedge clk) 
begin
if (start) begin
	Q <= D;
end
end
endmodule
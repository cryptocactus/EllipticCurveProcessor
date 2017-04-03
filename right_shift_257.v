
  
module right_shift_257 ( 
		input signed [256:0] a,
		output reg signed [255:0] sum_shift
                   );

					 
always @ * 
begin
  sum_shift = a >> 1;
end
endmodule



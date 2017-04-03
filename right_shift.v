  
module right_shift ( 
		input signed [255:0] a,
		output reg signed [255:0] sum_shift
                   );

					 
always @ * 
begin
  sum_shift = a >> 1;
end
endmodule


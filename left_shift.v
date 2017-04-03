module left_shift ( 
		input signed [255:0] a,
		output reg signed [255:0] sum_shift,
                output reg carry_out_shift
                );

					 
always @ * 
begin
  carry_out_shift = a[255];
  sum_shift = a << 1;
end
endmodule


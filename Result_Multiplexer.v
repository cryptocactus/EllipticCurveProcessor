module result_mux (
  input signed [255:0] division_result,
  input signed [255:0] multiplication_result,
  input signed [255:0] addition_result,
  input signed [255:0] subtraction_result,
  input [1:0] select,
  output signed [255:0] final_result
  );



mux4 mux_result( 
	.sum_0(addition_result), 
	.sum_1(subtraction_result), 
	.sum_2(multiplication_result),
	.sum_3(division_result),
	.select(select), 
	.out_mux(final_result)
);


endmodule
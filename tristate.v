module tristate ( 
		input signed [255:0] R, 
		input select_s, 
		output reg signed [255:0] Result
);

always @ *
   begin
      if (select_s == 1'b1) begin
	Result = R;
	   end
      else begin
        Result = 256'bx;
           end
end
endmodule

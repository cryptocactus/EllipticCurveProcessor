module A_Array (
        input b_i,
        input signed [255:0] a,
        output reg signed [255:0] sum
);

reg [8:0] n;

always @ * 
begin
  n = 8'b0;
while (n !== 8'bx) begin
 sum[n] = a[n] & b_i;
  n = n + 1'b1;
  if (n == 8'd255) begin
	sum[n] = a[n] & b_i;
	n = 8'bx;
  end
end
end

endmodule


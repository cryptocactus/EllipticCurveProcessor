
module X_Array (
        input u_comp,
        input signed [255:0] x,
        output reg signed [255:0] sum
);

reg [8:0] n;

always @ * 
begin
  n = 8'b0;
while (n !== 8'bx) begin
 sum[n] = x[n] & u_comp;
  n = n + 1'b1;
  if (n == 8'd255) begin
	sum[n] = x[n] & u_comp;
	n = 8'bx;
  end
end
end

endmodule

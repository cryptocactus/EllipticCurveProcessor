module tb_div();

wire signed [255:0] A_Rom_const;
wire signed [255:0] P_Rom_const;
wire signed [255:0] B_Rom_const;

reg start;
reg clk;
reg select;
//reg start;
wire signed [255:0] result_div_tb;

assign A_Rom_const = 256'hAA5E28D6A97A2479A65527F7290311A3624D4CC0FA1578598EE3C2613BF99521;
assign P_Rom_const = 256'hfffffffffffffffffffffffffffffffffffffffffffffffffffffffefffffc2f;
assign B_Rom_const = 256'h77af778b51abd4a3c51c5ddd97204a9c3ae614ebccb75a606c3b6865aed6744e;

initial begin
select <= 1'b0;
clk = 0;
start <= 1'b1;
start <= #100 1'b0;
end

always begin
     #50  clk = ~clk;
end

GF_Div gf_div_1(
  .p(P_Rom_const),
  .a(A_Rom_const),
  .b(B_Rom_const),
  .mode_select(select),
  .start(start),
  .clk(clk),
  .result_div(result_div_tb)
);

endmodule








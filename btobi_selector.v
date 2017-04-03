module b_to_b_i (
              input signed [255:0] b,
              input [7:0] i,
              output reg b_i
              );
               
always @ * 
begin
  b_i = b[i];
  //$write("%b",b_i);
end
endmodule


//Created by: Scott Everitt, Steven Dougherty, Colter Sisler
//Team: Nighthawk
//Rev: 3.0
//2-22-2017

module mod256_down_counter(
  input clk, 
  input start,
  output reg [7:0] counter_output
  );
  
 
initial begin
counter_output = 8'b0;
end
 


always @ (posedge clk)
 begin
  if (start) begin
    if(counter_output == 8'b000000000) begin
	//$write("%b   ", counter_output);
	//$write("\n");
      counter_output <= 8'b11111111;
         end
    else begin
      counter_output = counter_output - 1'b1;
	//$write("%b   ", counter_output);
	//$write("\n");
         end
  end
 end
endmodule
  

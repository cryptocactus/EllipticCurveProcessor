//Created by: Scott Everitt, Steven Dougherty, Colter Sisler
//Team: Nighthawk
//Rev: 3.0
//2-22-2017

module mod512_down_counter(
  input clk, 
  input start,
  output reg [9:0] counter_output
  );
  
 
initial begin
counter_output = 10'b0;
end
 


 always @ (posedge clk)

 begin
    if(counter_output == 10'b0000000000) begin
      counter_output <= 10'b1111111111;
         end
    else begin
      counter_output = counter_output - 1'b1;
         end
  end
endmodule
  


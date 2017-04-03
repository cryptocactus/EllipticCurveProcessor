
module comparator (
    input signed [255:0] a,
    input signed [255:0] b,
    output reg equal
    );

    always @* begin
      if (a==b) begin
        equal = 1;
      end
      else begin
        equal = 0;
      end
    end
endmodule
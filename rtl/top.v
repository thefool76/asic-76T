module top (
    input  wire       clk,
    input  wire       rst,
    input  wire [3:0] b,
    output wire [4:0] sum
);

wire [3:0] count;

counter u_counter (
    .clk(clk),
    .rst(rst),
    .count(count)
);

adder u_adder (
    .a(count),
    .b(b),
    .sum(sum)
);

endmodule

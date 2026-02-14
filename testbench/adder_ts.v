module adder_tb;
    reg  [3:0] a;
    reg  [3:0] b;
    wire [4:0] sum;

    adder dut (.a(a), .b(b), .sum(sum));

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, adder_tb);

        a = 4'd2; b = 4'd3;
        #10;
        a = 4'd7; b = 4'd8;
        #10;
        a = 4'd15; b = 4'd1;
        #10;

        $finish;
    end
endmodule


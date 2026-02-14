module counter_tb;
    reg clk = 0;
    reg rst = 1;
    wire [3:0] count;

    counter dut (.clk(clk), .rst(rst), .count(count));

    always #5 clk = ~clk;

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, counter_tb);

        #10 rst = 0;
        #100 $finish;
    end
endmodule


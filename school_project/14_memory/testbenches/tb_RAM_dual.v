`timescale 1ps / 1ps

module tb_RAM_dual;

    reg clk;

    //Inputs
    reg [7:0] din_a;
    reg [7:0] din_b;
    reg [2:0] addr_a;
    reg [2:0] addr_b;
    reg we;

    //Outputs
    wire [7:0] dout_a_s;
    wire [7:0] dout_b_s;
    wire [7:0] dout_a_t;
    wire [7:0] dout_b_t;

    initial begin
        clk = 0;
    end
    
    // 实例化同步读存储器
    RAM_dual #(8, 0) utt_s(
        din_a,
        din_b,
        addr_a,
        addr_b,
        clk,
        we,
        dout_a_s,
        dout_b_s
    );
    
    // 实例化异步读存储器
    RAM_dual #(8, 1) utt_a(
        din_a,
        din_b,
        addr_a,
        addr_b,
        clk,
        we,
        dout_a_t,
        dout_b_t
    );

    localparam CLK_PERIOD = 10;
    always #(CLK_PERIOD/2) 
        clk=~clk;

    initial begin
        we = 1'b1;

        din_a = 8'h0_0;
        din_b = 8'h1_0;
        addr_a = 0;
        addr_b = 0;
        
        #(CLK_PERIOD*3);

        din_a = 8'h0_1;
        din_b = 8'h1_1;
        addr_a = 1;
        addr_b = 1;

        #(CLK_PERIOD*3);

        we = 1'b0;
        addr_a = 0;
        addr_b = 0;

        #(CLK_PERIOD*3);

        #3;

        addr_a = 1;
        addr_b = 1;

        #(CLK_PERIOD*3);

        $finish;
    end

endmodule
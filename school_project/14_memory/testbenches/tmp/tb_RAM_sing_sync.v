`timescale 1ps / 1ps

module tb_RAM_sing_sync;

    reg clk;

    //Inputs
    reg [7:0] data_in;
    reg [2:0] addr;
    reg we;

    //Outputs
    wire [7:0] data_out;

    initial begin
        clk = 0;
    end
    
    RAM_sing_sync utt(
        data_in,
        addr,
        clk,
        we,
        data_out
    );

    localparam CLK_PERIOD = 10;
    always #(CLK_PERIOD/2) 
        clk=~clk;

    initial begin
        we = 1'b1;

        data_in = 8'h0_0;
        addr = 0;
        
        #(CLK_PERIOD*3);

        data_in = 8'h0_1;
        addr = 1;

        #(CLK_PERIOD*3);

        we = 1'b0;
        addr = 0;

        #(CLK_PERIOD*3);

        addr = 1;

        #(CLK_PERIOD*3);

        $finish;
    end

endmodule
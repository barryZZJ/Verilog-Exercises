//~ `New testbench
`timescale  1ns / 1ps

module tb_encoder4_2;

    // encoder4_2 Parameters
    parameter PERIOD  = 10;
    parameter T1S = 10**9;
    integer flag=0;
    reg clk;

    // encoder4_2 Inputs
    reg [3:0]  SW = 0;

    // encoder4_2 Outputs
    wire [1:0] LED;

    encoder4_2 u_encoder4_2(
        .SW (SW),
        .LED (LED)
    );

    always #(PERIOD/2) 
        clk=~clk;

    initial begin
        forever #(10) begin
            flag <= flag + 1;
            case (flag)
                0: SW <= 4'b0111;
                1: SW <= 4'b1011;
                2: SW <= 4'b1101;
                3: SW <= 4'b1110;
                default: SW <= 4'b1111;
            endcase

            if (flag == 3)
                flag <= 0;
        end
    end

    initial #200
        $finish;

endmodule
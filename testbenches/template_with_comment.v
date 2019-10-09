`timescale 1ns / 1ps

module tb_module_name;

    //simulated clock & reset
    reg clk;
    //reg rst_n;

    //module_name Input ports
    reg input_1;
    reg input_2;

    //module_name Output ports
    wire output_1;

    //module_name Parameters (if any)
    //parameter param_1 = 0;

    initial begin
        clk=0;
        //initialize input values
        //e.g
        //input_1 = 4'b0110;
        //input_2 = 5;
    end

    //instantiate test module
    module_name utt
    (
        //input/output port_name here
        //eg:
        //.rst_n (rst_n),
        //.clk (clk),
        //.led(input_1)
    );

    localparam CLK_PERIOD = 10; //clock period (ns)
    always #(CLK_PERIOD/2) 
        clk=~clk; // simulate clock tick every 'CLK_PERIOD/2' ns

    initial begin
        //test code here
        //e.g
        //#sec //means delay 'sec' seconds
        //#1 input_1 = 4'b1111; //change input_1's value after delaying 1 ns
        $finish; //end simulation
    end

    //you can also change input's value using always block:
    //e.g
    // integer counter = 0;
    // always @(posedge clk) begin
    //     counter <= counter + 1;
    //     if (counter == 10) begin
    //         //do something here
    //     end
    // end

endmodule
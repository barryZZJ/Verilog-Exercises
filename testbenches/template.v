`timescale 1np / 1ps

module tb_module_name;

reg clk;
//reg rst_n;

//Inputs
reg input_1;
reg input_2;

//Outputs
wire output_1;


(
    //.rst_n (rst_n),
    //.clk (clk),
);

localparam CLK_PERIOD = 10;
always #(CLK_PERIOD/2) 
    clk=~clk;


initial begin
    clk=0;
end

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
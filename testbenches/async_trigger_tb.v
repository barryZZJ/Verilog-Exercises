module test;
    // Inputs
    reg clk;
    reg d;
    // Outputs
    wire q;
    wire qb;
    // Instantiate the Unit Under Test (UUT)
    async_trigger uut (
        .clk(clk),
        .d(d),
        .q(q),
        .qb(qb)
    );
    initial begin
        // Initialize Inputs
        clk = 0;
        d   = 0;
        // Wait 100 ns for global reset to finish
        #100;
        // Add stimulus here
    end
    always #20 clk = ~clk;
    always #30 d   = ~d;
endmodule

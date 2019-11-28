//调用ip核实现
module mux4to1_ip(input [2:0] w0,
                  input [2:0] w1,
                  input [2:0] w2,
                  input [2:0] w3,
                  input [1:0] s,
                  output [2:0] f);
    wire s0_n, s1_n;
    wire[2:0] a0;
    wire[2:0] a1;
    wire[2:0] a2;
    wire[2:0] a3;

    gate_not_0 u_gate_n_0(.a(s[0]), .c(s0_n));
    gate_not_0 u_gate_n_1(.a(s[1]), .c(s1_n));
    gate_and3_0 u_gate_a_0(.s0(s0_n), .b(w0), .s1(s1_n), .d(a0));
    gate_and3_0 u_gate_a_1(.s0(s[0]), .b(w1), .s1(s1_n), .d(a1));
    gate_and3_0 u_gate_a_2(.s0(s0_n), .b(w2), .s1(s[1]), .d(a2));
    gate_and3_0 u_gate_a_3(.s0(s[0]), .b(w3), .s1(s[1]), .d(a3));
    gate_or4_0 u_gate_o(.a(a0), .b(a1), .c(a2), .d(a3), .e(f));

endmodule
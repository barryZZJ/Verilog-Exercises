//实验六 加减法器
//1位全加器
module full_adder(input cin,
                  input x,
                  input y,
                  output s,
                  output cout);
    assign {cout,s} = x + y + cin;
endmodule

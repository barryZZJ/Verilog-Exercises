//异步触发器
module async_trigger(clk,
                     d,
                     q,
                     qb);
    input clk, d;
    output q,qb;
    reg q,qb;
    always @(posedge clk) begin
        q  <= d;
        qb <= ~d;
    end
endmodule

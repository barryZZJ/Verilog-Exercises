//20184228 周泽峻
//数字逻辑 2019/11/1作业
//11人投票表决器，若超过6人（含）赞成，则表决通过

module voter11(input [10:0] vote,
               output reg pass);
    integer i;
    reg [3:0] sum;
    always @(vote) begin
        sum = 0;
        for (i = 0; i<=10; i=i+1) begin
            if(vote[i]) sum = sum + 1;
        end
        if (sum>=6) pass = 1'b1;
        else pass = 1'b0;
    end
endmodule

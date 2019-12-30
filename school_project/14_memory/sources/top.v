module top(input [3:0] sw,
           input wr_en,
           input rd_en,
           input btnclk,
           input clk,
           input rst,
           output [3:0] data_out,
           output empty,
           output full);

wire btnclk_d;
debkey udeb(clk, btnclk, btnclk_d);

FIFO #(4) uF(sw, wr_en, rd_en, btnclk_d, rst, data_out, empty, full);


endmodule // top

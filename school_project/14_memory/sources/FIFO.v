
// FIFO队列
module FIFO #(parameter WIDTH = 8,   //读写数据的位宽
              parameter size = 8) //队列长度
             (input [WIDTH-1:0] data_in,  //数据输入
              input wr_en,                //写使能
              input rd_en,                //读使能
              input clk,                  //FIFO时钟
              input rst,                  //FIFO复位
              output reg [WIDTH-1:0] data_out,  //数据输出
              output reg empty,           //表示FIFO空
              output reg full            //表示FIFO满
              );

parameter maxSize = size + 1; //开的数组比size多一个，可以保证头尾指针都指向实际的元素
reg [WIDTH-1:0] mem [0:maxSize];

// 当front = rear + 1 时为空，front = rear + 2 时为满
integer front;
integer rear;

always @(posedge clk) begin
    
    if (rst) begin
    //复位
        front = 1;
        rear = 0;
        full <= 1'b0;
        empty <= 1'b1;
        data_out <= {(WIDTH-1){1'bx}};
    end else begin

        //同时读写
        if (wr_en & rd_en) begin
            if (front == (rear + 1) % maxSize) begin
                //空了，输入即输出
                empty <= 1'b1;
                data_out <= data_in;
                full <= 1'b0;
            
            end else begin
            //没空
                empty <= 1'b0;
                if (front == (rear + 2) % maxSize)
                //如果满了，就显示满信号
                    full <= 1'b1;
                else
                    full <= 1'b0;

                //读
                data_out <= mem[front];
                front <= (front + 1) % maxSize;
                //写
                mem[(rear + 1) % maxSize] <= data_in;
                rear <= (rear + 1) % maxSize;
            end

        end else if (wr_en) begin
        //只写数据

            //写入后肯定不为空
            empty <= 1'b0;

            if (front == (rear + 2) % maxSize) begin
                //满了，改变信号，不能写入

                full <= 1'b1;

            end else begin

                //没满时可以写数据
                mem[(rear + 1) % maxSize] <= data_in;
                rear <= (rear + 1) % maxSize;
                full <= 1'b0;

            end
        end else if (rd_en) begin
        //只读数据

            //输出后肯定不满
            full <= 1'b0;

            if (front == (rear + 1) % maxSize) begin 
                //为空，改变信号，不能输出

                data_out <= {(WIDTH-1){1'bx}};
                empty <= 1'b1;
                
            end else begin
                //没空时可以输出数据

                data_out <= mem[front];
                front <= (front + 1) % maxSize;
                empty <= 1'b0;
            end

        end
    end
    
end
    
endmodule //

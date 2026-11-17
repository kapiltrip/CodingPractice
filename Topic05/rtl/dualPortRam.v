// 16 * 8 dual port ram 
// depth is 16 and width is 8 
//reg  [7:0] mem [0:15] 
// wr_addr and rd_addr are both 4 bits : since aw = 4 to address a depth of 16 
// signals are , clk , rst , wr_addr ,rd_addr , wr_en , rd_en , data_in , data_out 8 signals 
module dualPortRAM #(
    parameter aw= 4 , 
    parameter dw =8 
) (
    input wire clk , rst , 
    input wire [aw-1:0] wr_addr , rd_addr , 
    input wire [dw-1:0] data_in , 
    input wire wr_en , rd_en , 
    output reg [dw-1:0] data_out
); 
integer i ; 
localparam depth= (1<< aw ) ; 
reg [dw-1:0] mem [0: depth-1] ; // 2 to the power aw  
always @(posedge clk) begin
    if(rst)begin
        data_out <= 8'd0 ; 
        for(i=0; i<depth ; i = i +1 )begin
            mem[i] <= 8'd0 ; 
        end
end else begin
    if(wr_en)begin
        mem[wr_addr] <= data_in ;  // if case will not create any latch cause we want that, behaviour 
    end
    if(rd_en) begin
        data_out <= mem[rd_addr] ; 

    end
end 
end  
endmodule
// 8 * 16 RAM 
// depth is 8 and width is 16 

module asynchronousDualPortRAM #(
    parameter aw= 3 , 
    parameter dw =16 
) (
    input wire wr_clk , rd_clk  ,
    //input wire rst , 
    input wire [aw-1:0] wr_addr , rd_addr , 
    input wire [dw-1:0] data_in , 
    input wire wr_en , rd_en , 
    input wire clr , // asynchronous clear 
    output reg [dw-1:0] data_out
);   // 9 signals and 2 parameters 
integer i ;
localparam depth = (1<< aw) ;  
reg [dw-1:0] mem [0:depth -1] ; 

always @(posedge wr_clk or posedge clr ) begin
    if(clr)begin
        for(i=0 ; i<depth ; i=i+1 ) begin
            mem[i]<= 16'b0; // this will also pad 0's then why we prefer using 16'd0 

        end
end else begin
    if(wr_en)begin
        mem[wr_addr] <= data_in ; 

    end
end
end

// read operation 
always @(posedge rd_clk or posedge clr )begin
    if(clr)begin
        data_out <= 16'd0 ; 
end else begin
    if(rd_en) begin
        data_out <= mem[rd_addr] ; 
    end
end
end
endmodule 

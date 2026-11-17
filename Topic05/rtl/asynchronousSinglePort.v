module asynchronousSinglePort #(
    parameter aw = 3,
    parameter dw = 16 
) (
    inout [dw-1:0] data, 
    input wire wr_en , rd_en , 
    input wire [aw-1:0] addr
);
// no clock since asynchronous , 

localparam depth = (1<< aw) ; 
reg [dw-1:0] mem [0:depth-1] ;

always @(data, wr_en , rd_en ,addr  )begin
    if(wr_en && ~rd_en )begin
        mem[addr] = data ; 

    end
    
end
assign data = (rd_en && !wr_en )? mem[addr] : {dw{1'bz}}; 
endmodule 
module fifo16x8_m2 #(
    parameter aw= 4,
    parameter dw= 8
)(
    input wire clk ,rst_n, 
    input wr_en , rd_en , 
    input wire [dw-1:0] data_in , 
    output reg [dw-1:0] data_out ,
    output wire full, empty 
);
localparam depth = (1<< aw) ; 

//reg [depth:0] count ; 
reg [aw:0] wr_ptr , rd_ptr ; 
reg [dw-1:0] mem [0:depth-1] ; 

// this is method 2 .
// the pointers are of aw+1 in size , aw was needed to cover all the location equal to depth , now ne need a additional bit for wrap conditions 

wire can_read ; 
wire can_write; 
assign can_read = (rd_en && !empty ) ; 
assign can_write = (wr_en && !full) ; 
// in this method the empty and full will change 
assign empty = (wr_ptr == rd_ptr ) ; 
assign full = (wr_ptr[aw-1:0] == rd_ptr[aw-1:0] && wr_ptr[aw]!= rd_ptr[aw]) ; 

integer i  ; 
// write operation 
always @(posedge clk or negedge rst_n )begin
    if(!rst_n)begin
      for(i=0;i<depth ; i = i +1 )begin
        mem[i] <= {dw{1'b0}};
        wr_ptr<= {(aw+1){1'b0}} ; 

    end
    end  else if(can_write)begin
        mem[wr_ptr[aw-1:0]] <= data_in; // although it wont matter if i write it first or second  
        wr_ptr<= wr_ptr+ 1'b1 ; 
end else begin
    wr_ptr<= wr_ptr ; 
end
end
// read operation 
always @(posedge clk or negedge rst_n )begin
    if(!rst_n)begin
        rd_ptr <= {(aw+1){1'b0}}; 
        data_out <= {dw{1'b0}} ; 

    end else if(can_read)begin
        data_out <= mem[rd_ptr[aw-1:0]] ; 
        rd_ptr <= rd_ptr+1'b1; 
end else begin
    rd_ptr<= rd_ptr; 
end
end
// no block for count needed 
endmodule
// MSB WILL DECIDE THE FIFO IS FULL OR EMPTY 
// after 15 , wr_ptr value is 16, im using lsb bits, to point to the locations 
// upper bit is indicating that im doing now the second iteration . 
// Hence rd_ptr and wr_ptr and both pointing to the samem location , and the msb bit of read pointer and write, pointer is not equal 
// i.e wr_ptr moved depth forward , from rd_ptr. Hence for full we are writing extra 
// for empty : both read and write pointer are pointing to the same location 


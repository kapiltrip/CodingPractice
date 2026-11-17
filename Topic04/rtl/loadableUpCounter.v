// q no : 4 ) 4 bit synchronous and loadable binary  up counter

module loadableUpCounter    (
    input wire [3:0] data_in ,
    output reg [3:0] data_out , 
    input wire rst , clk ,
    input wire load 
); 

always @(posedge clk ) begin
    if(rst)begin
        data_out <= 4'd0 ; 

    end else if(load)begin
        data_out <= data_in  ; 
end else begin
    data_out<= data_out + 1'b1; 
    // here i dont need to match the data_out width ? 
    
end
end
endmodule
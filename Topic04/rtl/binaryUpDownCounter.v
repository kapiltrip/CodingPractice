// q no : 4 ) 4 bit synchronous and loadable binary  up counter

module binaryUpDownCounter(
    input wire [3:0] data_in ,
    output reg [3:0] data_out , 
    input wire rst , clk ,
    input wire load ,
    input wire direction 

); 

always @(posedge clk ) begin
    if(rst)begin
        data_out <= 4'd0 ; 

    end else if(load)begin
        data_out <= data_in  ; 
end else begin
    if(direction)begin
        //4 bit and up counting 
        if(data_out>= 4'd15)
            data_out <= 4'd0 ; 
        else 
            data_out <= data_out + 1'b1 ; 
end else begin
    // if not up its a down counter 
    // hence i will count down 
    if(data_out<=4'd0)
        data_out <= 4'd15; 
    else 
        data_out <= data_out - 1'b1 ; 
end
end
end
endmodule
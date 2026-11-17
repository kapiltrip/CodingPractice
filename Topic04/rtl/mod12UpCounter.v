module mod12UpCounter(
    // loadable , binary mod 12 up counter 
    // mod is 12 hence 4 bit counting is needed 
    // lodable up counter : parallel in parallel out kind of behaviour 
    // rst , then load , then data_out >= 4'd11 , else i need to increment the up counter 
    input wire clk, rst , load , 
    input wire [3:0] data_in,
    output reg [3:0] data_out
);

always @(posedge clk)begin
    if(rst)begin                          // 1 st priority 
        data_out <= 4'b0000 ; 
end else begin
    if(load)begin                
        data_out<= data_in ;

    end else if(data_out >= 4'd11)begin    // if not load it will count . 
        data_out  <= 4'd0 ;  
end else begin
    data_out <= data_out+ 4'd1 ; 

end

end
end
endmodule
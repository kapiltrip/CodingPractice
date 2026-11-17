`timescale 1ns/1ps 
module decoderDataflow_tb ; 
// it was a 2 to 4 decoder 
reg [1:0] x ;
wire [3:0] y ; 
initial begin
    x= 2'b00; 
end 
decoderDataflow dut (
    .x(x),
    .y(y)
);
integer i ; 
initial begin
    for(i =0; i< 4 ; i= i+1)begin
        x = i ; 
        #10; 
        $display("For the value x = %0b , the value in the output is :%0b " , x, y ); 
    end
end
endmodule 
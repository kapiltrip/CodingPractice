module siso4bits(
    // 4 bit cause i can store internally 4 bits 
    input wire clk , rst , 
    input wire serial_in,
    output wire serial_out  
);  
reg q3,q2,q1,q0 ; // 4 bits of data will be stored 
// q3, q2,q1,q0
// serial_in goes to q3 (msb) , serial_out receives q0 , this happens at every clock edge 

always @(posedge clk)begin
    if(rst)begin
        {q3,q2,q1,q0}<=4'b0000; 
end else begin
    
    q3<= serial_in ; 
    q2<= q3; 
    q1<= q2; 
    q0<= q1; 
    //serial_out<= q0; // this willmake a 5th flip flop so 
    // this is a right shift operation for higher no of bits 
    // i can do something like this 
    // reg [3:0] data  
    // data<= {serial_in,data[MSB:LSB+1]} ;  for right shift 
    // data<= {data[MSB-1:0] , serial_in} ;  for left shift  
 end
end
assign serial_out= q0 ; 
endmodule
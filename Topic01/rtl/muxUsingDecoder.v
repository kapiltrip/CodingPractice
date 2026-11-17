// 4 to 1 mux using decoder and tri state buffer 
module muxUsingdecoder(
    input wire [3:0] x , 
    input wire [1:0] sel , 
    output wire y 
); 
// i have a decoder and a tri state buffer 
// 2 to 4 decoder 
wire [3:0] dOut ; 
assign dOut[3] = (sel== 2'b11 ) ; 
assign dOut[2] = (sel == 2'b10 ) ; 
assign dOut[1] = (sel == 2'b01) ; 
assign dOut[0] = (sel == 2'b00) ; 
//I need to make use of tri state buffers as well for the output logic 
assign y = (x[3] & dOut[3] ) |x[2] & dOut[2] | x[1] & dOut[1] | x[0] & dOut[0]; 

/*
this is creating 4 buffers in the synthesis 

bufif1(y,x[3],dOut[3] ) ; 
bufif1(y,x[2],dOut[2] ) ; 
bufif1(y,x[1],dOut[1] ) ; 
bufif1(y,x[0],dOut[0] ) ; 
*/


endmodule 
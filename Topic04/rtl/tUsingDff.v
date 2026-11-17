`timescale 1ns/1ps 
module tffUsingDff(
    input wire clk , rst, t, 
    output wire  Q_out , 
    output wire Qb_out
);
// Q_out as input port , hence input to xor gate as well 
// Merits vs demerits of that inout port 
wire w1;
xor (w1,Q_out , t) ;  
dffT dut (clk , rst,w1 ,Q_out , Qb_out);
endmodule

module dffT(
    input wire clk , rst , d , 
    output reg Q_out , 
    output wire Qb_out 
);
always @(posedge clk)begin
    if(rst)begin
        Q_out<= 1'b0 ; 
end else begin
    Q_out <= d ; 
end
end
assign Qb_out = ~Q_out ; 
endmodule
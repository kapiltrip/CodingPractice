// gate level modelling sr latch 
module srLatch(
    input wire s,r ,
    output wire Q_out, Qb_out  // i can also make them inout port as well 
);
wire w1,w2 ; 
nor g1 (w1 , Qb_out , r ) ; 
nor g2 (w2 , s, Q_out) ; 
assign Q_out = w1; 
assign Qb_out = w2; 

endmodule
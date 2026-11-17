//q3 : Design a 2 to 1 mux gate level abstraction 

module mux2to1(
    input a , b, 
    input sel , 
    output y 
);
wire w1 , w2 , w3 ; 
not g1 (w1 , sel ) ; // ~sel 
and g2 (w2 , w1, a ) ; // ~sel & a 
and g3 (w3 , sel , b ) ; // sel & b  
or g4 (y, w2, w3) ;  
endmodule
// q4 : 4 to 1 mux using 2 to 1 mux 
module mux4to1(
    input wire [3:0] x ,
    input wire [1:0] sel ,
    output wire y 
); 
wire w1,w2 ; 
mux2to1 m1 (x[0],x[1],sel[0],w1); // lower values 
mux2to1 m2 (x[2],x[3],sel[0],w2); // upper values towards the msb 
mux2to1 m3 (w1,w2,sel[1],y);

endmodule
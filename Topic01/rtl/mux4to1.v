// To create 4 to 1 mux using 2 to 1 muxes 
module mux4to1(
    input wire [3:0] x , 
    input wire [1:0] sel ,
    output wire y 
);
// i can use only 2 to 1 muxes 
wire w1, w2; 
mux2to1 m1 (
    .a(x[0]),
    .b(x[1]),
    .sel(sel[0]),
    .y(w1)
);
mux2to1 m2 (
    .a(x[2]),
    .b(x[3]),
    .sel(sel[0]),
    .y(w2)
);
mux2to1 m3 (
    .a(w1),
    .b(w2),
    .sel(sel[1]),
    .y(y)
);
endmodule
module mux2to1(
    input wire a , b , 
    input wire sel , 
    output wire y 
);  
assign y = (sel)? b : a ; 

endmodule 
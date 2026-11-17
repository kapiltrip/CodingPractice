// to create a RTL for bidirectional buffer 
module bidirectionalBuffer(
    inout a , b , 
    input enable
);
// This is not correct , this is going to be synthesized like a mux .

bufif1(b,a,enable); // if enable is high b = a ; i.e a 10 ns pulse according to my tb
bufif0(a,b,enable) ;  // if enable is low , a = b ; i.e a 20 ns pulse according to my tb 
// but this one will synthesize into a real bidirectional buffer 
//tranif1(a ,b , enable) ; 
endmodule 
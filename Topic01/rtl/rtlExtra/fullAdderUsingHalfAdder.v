module fullAdderUsingHalfAdder (
    input wire a , b, cin , 
    output wire cout , sum
);
wire w1 , w2 ,w3; 
halfAdder ha1 (a ,b,w1,w2 ) ; 
halfAdder ha2 (w2,cin,w3,sum);
or g1 (cout , w1,w3) ; 
endmodule 
module halfAdder(
    input wire x, y , 
    output wire cout , sum 
);
assign cout = x & y ; 
assign sum = x ^ y ;
endmodule
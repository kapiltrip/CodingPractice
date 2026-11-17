module fullAdderDataflow (
    input wire a , b, cin , 
    output wire cout, sum
);
assign sum = a ^ b ^ cin; 
assign cout = (a & b )  | (a & cin ) | (b & cin ) ; 
endmodule 
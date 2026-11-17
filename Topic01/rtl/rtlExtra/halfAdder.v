module halfAdder(
    input wire a , b, 
    output wire cout, sum
);
assign sum = a ^b; 
assign cout = a & b ;
endmodule
module halfSubDataflow(
    input wire a , b, 
    output wire sub, borrow 
); 
assign sub = a ^ b ; 
assign borrow = ~ a & b ; 
endmodule
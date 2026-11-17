module fullSubUsingHalf(
    input wire a , b, bin,
    output wire sub , borrow 
);
  wire w1,w2,w3;
  halfSub dut1 (
    .a(a),
    .b(b),
    .sub(w1),
    .borrow(w2)
  );
  halfSub dut2 (
    .a(w1),
    .b(bin),
    .sub(sub),
    .borrow(w3)
  );
   or g1 (borrow , w2, w3) ;

endmodule

module halfSub(
    input wire a , b, 
    output wire sub , borrow 
);
assign sub = a ^ b ; 
assign borrow = ~a & b ;
endmodule
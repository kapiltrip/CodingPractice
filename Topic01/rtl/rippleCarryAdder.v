// 4 bit ripple carry adder using 1 bit full adder 
module rippleCarryAdder(
    input wire [3:0] a , b, 
    input wire cin , 
    output wire [3:0] sum , 
    output wire cout
); 
wire [4:0] carry ;  //why it wont be reg 
assign carry[0] = cin; 
assign cout = carry[4] ; 

genvar i ; 
generate
    for(i =0 ; i<4 ; i= i+ 1 )begin : generate4fa
        fullAdder dut (
            .a(a[i]),
            .b(b[i]),
            .cin(carry[i]),
            .sum(sum[i]),
            .cout(carry[i+1])
        );
    end
endgenerate 
endmodule
module fullAdder(
    input wire a , b,  cin , 
    output wire cout , sum 
);
assign sum = a ^ b ^ cin ; 
assign cout = (a & b ) | (b & cin ) | (a & cin) ; 
endmodule 
`timescale 1ns/1ps
module fullAdderUsingHalfAdder_tb ; 
  reg a , b, cin ; 
  wire cout ; 
  wire sum; 
  initial begin
    a= 1'b0; 
    b= 1'b0 ; 
    cin = 1'b0 ; 
  end
  // connecting the tb to the dut 
  fullAdderUsingHalfAdder dut (
    .a(a),
    .b(b),
    .cin(cin),
    .cout(cout),
    .sum(sum)
  );
  integer i ; 
  initial begin
    for(i=0 ; i<8; i=i+1)begin
        {a,b,cin} = i ; 
        #10;
        $display("The value of sum is : %0d for the value of a : %0d and b : %0d " , sum , a , b) ; 
    end
   //$monitor("THe values for sum and carry are %0d , %0d  " , sum , cout );
  end
// why i cant use monitor here ? 
    initial begin
      #200; 
      $finish; 

    end
endmodule

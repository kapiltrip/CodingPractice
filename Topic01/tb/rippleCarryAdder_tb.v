`timescale 1ns/1ps
module rippleCarryAdder_tb ; 
  reg [3:0] a , b; 
  reg cin ; 
  wire cout ; 
  wire [3:0] sum; 
  rippleCarryAdder dut (
    .a(a), 
    .b(b),
    .cin(cin), 
    .sum(sum),
    .cout(cout)
  );

  initial begin
    a= 4'd0 ; 
    b= 4'd0 ; 
    cin = 0 ; 

  end
  task stimuli; 
    input [3:0] num1 ; 
    input [3:0] num2; 
    input carryIn ; 
    begin
      a = num1; 
      b= num2 ; 
      cin = carryIn ; 
      #10 ; 

    end
 endtask
 initial begin
    stimuli(4'b0001 ,4'b0011 , 0 ) ; 
    stimuli(4'b0001 , 4'b0000, 1 ) ; 
    stimuli(4'b0011 , 4'b0010 , 1 ) ; 
    stimuli(4'b0011 , 4'b0011 , 0 ) ; 
    stimuli(4'b1111,  4'b1111 , 1 ) ; 
    // overflow case 
    
 end 
endmodule 
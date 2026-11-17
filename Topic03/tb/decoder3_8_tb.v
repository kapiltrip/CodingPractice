`timescale 1ns/1ps 
module decoder3_8_tb;
  reg [2:0] x ;
  wire [7:0] y ; 
  decoder3_8 dut(
    .x(x),
    .y(y)
  ); 
  initial begin
    x = 3'b000; 
  end
  task stimuli;  
    input [2:0] x_values ; 
    begin
      x = x_values; 
      #10 ; 
    end
  endtask
  initial begin
    stimuli(3'b000); 
    stimuli(3'b001); 
    stimuli(3'b111) ; 
    stimuli(3'b110) ;
    stimuli(3'b010) ;  
    $finish ; 
  end
  initial begin
    $monitor("The input given is %0d and the o/p is %0d " , x , y ) ; 

  end
endmodule
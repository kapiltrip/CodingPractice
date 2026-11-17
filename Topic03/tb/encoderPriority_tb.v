`timescale 1ns/1ps 
module priorityEnc_tb;
  reg [7:0] x ; 
  wire [2:0] y ; 
  wire v ; 
  priorityEnc dut (
    .x(x),
    .y(y) , 
    .v(v)
  );
  initial begin
    x= 8'd0; 
  end
  task stimuli;
    input [7:0] x_values ; 
    begin
        x = x_values; 
        #10 ; 
    end 
  endtask 
  initial begin
    $monitor("The input given to the encoder is %0d , and the output is %0d at the time %0t  " , x , y , $time  ) ; 
    stimuli(8'b00000000); 
    stimuli(8'b00001010) ; 
    stimuli(8'b00001111); 
    stimuli(8'b11001010) ; 
    stimuli(8'b00101010); 
    stimuli(8'b10000111) ; 
    stimuli(8'b00000000) ; // this will give me , the output v = 0 no input is active 
    stimuli(8'b0000000x) ; // this will give me v =0 
    $finish; 

  end
endmodule 
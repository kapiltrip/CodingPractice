`timescale 1ns/1ps
module fullAdderUsingHalfAdder_tb ;
  reg x,y,cin; 
  wire cout , sum ;
  integer i ;  
  fullAdderUsingHalfAdder dut (x,y,cin,cout,sum);
  initial begin
    x = 0;
    y=0;
    cin=0;
  end
  initial begin
    for(i=0;i<8;i=i+1)begin
        {x,y,cin} = i;
        #10;

    end
  end
  
endmodule 
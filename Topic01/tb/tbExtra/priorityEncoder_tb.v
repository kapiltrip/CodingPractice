`timescale 1ns/1ps
module priorityEncoder_tb;
//  8 bit d
//  3 bit y 

  reg [7:0] d ; 
  wire [2:0] y ; 
  /*
  initial begin
    d= 8'd0; 

  end
  */
  // connection i gave 
  priorityEncoder dut (d,y);
  task stimulus ; 
      input [7:0] data ; 
      begin
        d = data; 
        #10;
        // so i am waiting for data (correct data ok )
        $display("The value of data is : %0b at a time of %0t and the output is: %0d "  , data , $time , y);
      end
  endtask
  initial begin 
    stimulus(8'b00000001); // it should o/p 0 since position 0 is having a 1  
    stimulus(8'b00111111); // it should o/p 5 since bit at pos 5 is having a 1 its msb priority 
    stimulus(8'b10011111); // o/p 7
    stimulus(8'b01000000); // o/p is 6 
    stimulus(8'b00000010);
  end
endmodule 
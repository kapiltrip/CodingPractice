`timescale 1ns/1ps

module muxUsingdecoder_tb ;
    reg [3:0] x ; 
    reg [1:0] sel ; 
    wire y ; 
    initial begin
        x = 4'd0; 
        sel = 2'd0 ; 
        // i wont do anything to the o/p 
    end
    // tb wont change cause its still functionally mux 

    muxUsingdecoder dut(x , sel , y);
    // order based instantiation 
    task stimuli ;
      input [3:0] data; 
      input [1:0] sel_stimulus ; 
      begin
        x = data; 
        sel = sel_stimulus ; 
        #10;
      end
    endtask  
    initial begin
        stimuli(4'b0001 , 2'b00);  // output 1 
        stimuli(4'b1010, 2'b00);  // output 0 
        stimuli(4'b1010, 2'b01);
        stimuli(4'b1010, 2'b10);
        stimuli(4'b1010, 2'b11);

        stimuli(4'b0101, 2'b00);
        //last 3 should be 1's 
        stimuli(4'b0101, 2'b01);
        stimuli(4'b0101, 2'b10);
        stimuli(4'b0101, 2'b11);

      end 
 endmodule
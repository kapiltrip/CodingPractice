`timescale 1ns/1ps 
module mux4to1_tb ;
    reg [3:0] x ; 
    reg [1:0] sel ; 
    wire y ; 
    mux4to1 dut (
        .x(x),
        .sel(sel),
        .y(y)
    );
    initial begin
        x = 4'b0000; 
        sel = 2'b00; 

    end
    task stimuli ;
      input [3:0] data ; 
      input [1:0] select; 
      begin
        x= data ; 
        sel = select ; 
        #10 ; 

      end
    endtask 
    initial begin
        #10; 
        stimuli(4'b0001 , 2'b00);  // output 1 
        stimuli(4'b1010, 2'b00);  // output 0 
        stimuli(4'b1010, 2'b01);  // its gonna o/p a 1 
        stimuli(4'b1010, 2'b10);  // 0 
        stimuli(4'b1010, 2'b11);  // output a 1 

        stimuli(4'b0101, 2'b00);  //1 output 
        //last 3 should be 1's 
        stimuli(4'b0101, 2'b01);
        stimuli(4'b0101, 2'b10);
        stimuli(4'b0101, 2'b11);

    end
endmodule
`timescale 1ns / 1ps
module fifo16x8_m1_tb; 
  parameter aw = 3; 
  parameter dw= 16; 
  reg clk , rst ; 
  reg [dw-1:0] data_in ; 
  reg wr_en , rd_en ; 
  wire [dw-1:0] data_out ; 
  wire full , empty ; 
fifo16x8_m1 #(aw,dw) dut (clk,rst,wr_en,rd_en,data_in,data_out , full, empty) ; 
// generate a clock pulse 
// activate the reset 
parameter cycle = 20 ; 
task initializeDut();  // will be called at time 0 
  begin
    clk = 1'b0 ; 
    rst = 1'b0 ; 
    wr_en = 1'b0 ; 
    rd_en = 1'b0 ; 
    data_in = {dw{1'b0}} ; 

  end
endtask 
always #(cycle/2) clk= ~clk ; 
task reset_dut();
  begin
    @(negedge clk );
    rst= 1'b1 ; 
    @(negedge clk );
    rst = 1'b0 ; 

  end
endtask
// task for writing in the memory location 
task write_inFifo(input [dw-1:0] dataInput ) ;
  begin
    @(negedge clk ); 
    wr_en = 1'b1  ; 
    data_in =dataInput; 
    @(negedge clk ); 
    wr_en = 1'b0 ; 
  end 
endtask 
// task to read from memory 
task read_FromFifo();
  begin
    @(negedge clk ); 
    rd_en = 1'b1  ; 
    @(negedge clk ); 
    rd_en = 1'b0 ; 
  end
endtask
initial begin
    initializeDut ; 
    #50; 
    reset_dut; 
    repeat (17) begin
        write_inFifo({$random} % 8 ) ; // mod 8 cause i want to write 8 bits of data , i.e 0 to 7 

    end
    repeat (17) // will read 16 time depth is 16 not 17 time , ite gonna be empty 
      read_FromFifo() ; 
    repeat (17) 
     write_inFifo({$random} % 8 ) ; 
    #100; 
    $finish; 

end
endmodule 
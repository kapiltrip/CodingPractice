`timescale 1ns/1ps 

module srLatch_tb ;
  reg s , r ; 
  wire Q_out , Qb_out  ; 
  // to check if , both the o/p will be wires, here, or not 
  srLatch dut (s , r, Q_out , Qb_out ) ; 
  // diff combinations of s and r 
  task srValues; 
    input sval; 
    input rval ; 
    begin
      s= sval ; 
      r = rval ; 
      #10 ; 
      
    end
  endtask 
  initial begin
     srValues (1, 1 ) ; 
     srValues(0 ,1 ) ;
     srValues(0,0) ; 
     srValues(0,1) ; 
     srValues(1,0) ; 
     srValues(0, 0 ) ; 

  end
endmodule
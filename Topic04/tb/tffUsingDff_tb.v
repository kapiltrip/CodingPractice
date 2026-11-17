`timescale 1ns/1ps 

module tffUsingDff_tb; 
//dff dut (clk , rst,w1 ,Q_out , Qb_out);
reg clk , rst , t ; 
wire Q_out , Qb_out ; 
tffUsingDff dut (clk , rst , t, Q_out , Qb_out);
initial begin
    clk = 0 ; 
    t=0; // how it fixes the things. 
    forever #10 clk = ~clk ; 
end
task rst_dut;  // can i also define task by rst_dut()
   begin
    @(negedge clk) ; // at negedge i gave rst 
    rst = 1'b1 ; 
    @(negedge clk) ; // then at next negedge , i made rst = 0 
    rst = 1'b0 ; 
    
   end
endtask
task din;
  input i ; 
  begin
    @(negedge clk ); 
    t=i ;  
  end 
endtask
initial begin
    rst_dut ; 
    din(0);
    din(1); 
    din(1);
    din(1); 
    din(1);
    din(0);
    #20 ; 
    $finish ; 
    end
endmodule 
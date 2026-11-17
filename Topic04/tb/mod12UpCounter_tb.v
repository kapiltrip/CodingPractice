/*
    input wire clk, rst , load , 
    input wire [3:0] data_in,
    output reg [3:0] data_out

*/
`timescale 1ns/1ps 

module mod12UpCounter_tb ; 
reg clk , rst , load ; 
reg [3:0] data_in ; 
wire [3:0] data_out  ; 
mod12UpCounter dut (clk , rst , load , data_in , data_out) ;
// to generate a clock 
parameter cycle =10 ;
/*
always begin
    
    #(cycle / 2) ;  // clk = 0 ? this need clarification this will give unknowns 
    clk = 1'b0   ; 
    #(cycle/2 ) ; 
    clk = 1'b1 ; 
end
To fix this 
*/
always begin
    clk = 1'b0 ; 
    #(cycle / 2) ;  
    clk = 1'b1 ; 
    #(cycle/2 ) ; 

end
initial begin
    clk = 1'b0 ; 
    rst = 1'b0 ; 
    load = 1'b0 ;
    data_in = 4'd0 ;  
end

// reset behaviour . 
 task reset_counter;
     begin
        @(negedge clk) ; 
        rst = 1'b1 ;
        @(negedge clk ) ; 
        rst = 1'b0 ;  
     end 
 endtask

 task load_check;
     input [3:0] dataInput ; 
     input loadInput ; 
     begin
        @(negedge clk ) ; // at first negative edge after calling this task im loading the data 
        load = loadInput ;  //
        data_in = dataInput ; 
     end 
 endtask

  // I need to check the behaviour meeting the waveforms 

 initial begin
    reset_counter ; 
    #100; 
    load_check(4'd13,  1'b1)  ;
    load_check(4'd13 , 1'b0 ) ; 
    load_check(4'd10 , 1'b1 ) ;
    #100; 
    load_check(4'd0 , 1'b1 ) ;  
    load_check(4'd4 , 1'b0) ; 
    #200 ; 
    $finish ; 

 end
endmodule 
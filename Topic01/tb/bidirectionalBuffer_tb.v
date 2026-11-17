module bidirectionalBuffer_tb ;
  wire a , b ; 
  reg enable ; 
  reg dataA ; 
  reg dataB; 
  bidirectionalBuffer dut (
    .a(a) , 
    .b(b) , 
    .enable(enable)
  ) ;
  // a and b are inout connections , and they require net type connections , to be resolved . 
  // hence i will assign to wire's a and b 
  initial begin
    dataA = 1'b0 ; 
    dataB = 1'b0 ; 
    enable = 1'b0 ; 

  end
  always #10 dataA = ~dataA ;   // a is basically a pulse of time period 10 
  always #20 dataB = ~dataB ;   // b is a pulse of time period 20 
  always #40 enable = ~enable ; 
  assign a = (enable) ? dataA : 1'bz ; 
  assign b = (enable) ? 1'bz : dataB  ; 

  initial begin
    #200 ; 
    $finish; 
  end  

endmodule 
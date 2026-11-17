module clockBuffer(
    input wire clk_in , 
    output wire clk_out
); 
  buf g1 (clk_out , clk_in );
endmodule 
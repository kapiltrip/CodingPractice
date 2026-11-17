module clockBuffer_tb ;
reg clk_in ;  // master clock 
wire clk_out ;  // buffered clock 
clockBuffer dut (clk_in , clk_out ); 
// To check if phase adn frequency is matching 
// fork join works in parallel 
reg p , f ; 
time t1,t2,t3,t4,t5,t6; 
initial begin
    clk_in = 1'b0 ; 
end
always #10 clk_in = ~clk_in ; 
task measure_clk_in ;
  begin
    @(posedge clk_in); 
    t1 = $time ; // positive edge of the first edge 
    @(posedge clk_in );  
    t3= $time;  // next positive edge time 
  end
endtask 
// what it means for phase to be same in this respect 

task measure_clk_out ;
begin
    @(posedge clk_out);
    t2= $time; 
    @(posedge clk_out); 
    t4= $time; 
end 
endtask 
initial begin
    fork
        measure_clk_in ; 
        measure_clk_out ; 

    join
    if((t1==t2) && (t3==t4 )) // same phase 
      $display("Phase is same ") ; 
    else 
      $display("Phase is not same ") ; 
    t5 = t3-t1 ; // time period for the input 
    t6= t4-t2;    // time period for the output clock 
    if(t5 == t6 )begin
        $display("Frequency is same ") ; 

end else begin
    $display("Frequency is different ") ; 
end

end 
endmodule 
// TO check if the reset is working 
`timescale 1ns/1ps 

module jkFilpFlopParameter_tb; 
    reg j , k , rst , clk ;
    wire Q_out , Qb_out ;
    jkFilpFlopParameter dut (j,k,rst,clk,Q_out , Qb_out) ; 
    initial begin
        clk= 1'b0 ; 
        
    end
    always begin
        #10 ; 
        clk = ~clk ; 
    end
    // to check is reset is working 
    task resetWorking;
    begin
      @(negedge clk );
      rst = 1'b1 ; 
      @(negedge clk ) ; 
      rst = 1'b0 ; 
    end
    endtask
    task inputsForJK;
      input Jinput; 
      input Kinput ; 
      begin
        @(negedge clk) ;  // event delay 
        j= Jinput ; 
        k = Kinput;
        #11;  // this fixes the timing issue , after the last toggle input 

      end
    endtask
    initial begin
        resetWorking ; 
        inputsForJK(1'b0 , 1'b0);
        inputsForJK(1'b0 , 1'b1) ; 
        inputsForJK(1'b1, 1'b0) ; 
        inputsForJK(1'b1 , 1'b1 ) ; 
        $finish ; 

    end
endmodule 
module mux4to1_tb;
    reg [3:0] x ; 
    reg [1:0] sel ; 
    wire y ; 
    mux4to1 dut (x,sel , y); // position based declaration 
    /*
    integer i ; 
    integer j ; 
    initial begin
        for(i=0;i<4;i= i +1) begin
            for(j=0;j<16;j= j + 1)begin
                sel = i ; 
                x =j ; 
                
                #10 ; 

            end
        end
    end
    */
    // make it task based ok 
    task muxValues;  
      input [3:0] xvals ; 
      input [1:0] selvals; 
      begin
        x = xvals; 
        sel = selvals; 
        #10 ;
        $display("the value of y based on sel (%0d) and input x %0d  is : %0d " , sel , x, y ) ; 
      end
    endtask
    initial begin
        muxValues(4'b1111 , 2'b01); 
        muxValues(4'b1111 , 2'b10);  
        muxValues(4'b0000 , 2'b01); // output should be 0  
        muxValues(4'b0010 , 2'b01); //should output 1  
        muxValues(4'b0001 , 2'b00) ; // should output 1  

    end
endmodule
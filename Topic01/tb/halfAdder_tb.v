`timescale 1ns/1ps
module halfAdder_tb;
    reg a , b ; 
    wire cout,sum;
    halfAdder dut (a , b,cout , sum);
    initial begin
        a= 0 ;
        b =0 ;
    end
    integer i ; 
    
    initial begin
        for(i =0;i<4;i=i+1)begin
            {a,b} = i;
            #10;
        end
    end

endmodule
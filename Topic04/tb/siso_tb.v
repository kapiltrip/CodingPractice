`timescale 1ns/1ps
module siso4bits_tb;
    reg clk , rst ; 
    reg serial_in ; 
    wire serial_out ; 
    siso4bits dut (
        .clk(clk),
        .rst(rst),
        .serial_in(serial_in),
        .serial_out(serial_out)
    );
    parameter t=10; 
    initial begin
        clk=1'b0; 
        rst=1'b0; 
        serial_in=1'b0; 
    end
    always #(t/2) clk = ~clk ; // clock period is 5 

    // to verify if reset is working or serial output is working 
    task resetSISO;
      begin
        @(negedge clk); 
        rst =1'b1; 
        @(negedge clk); 
        rst=1'b0 ; 

      end 
    endtask 
    task dataShift;
      input data; 
      begin
        @(negedge clk); 
        serial_in = data; 
      end 
    endtask
    initial begin
        resetSISO ; 
        dataShift(1); 
        dataShift(0); 
        dataShift(1); 
        dataShift(0);
        dataShift(1); 
        dataShift(1); 
        dataShift(1); 
        dataShift(1); 
        dataShift(1);
        dataShift(1); 
        #1000; 
        $finish ; 

    end 
endmodule
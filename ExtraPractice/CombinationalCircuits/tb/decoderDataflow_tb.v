module decoder2to4_tb;
    reg [1:0] x ; 
    wire [3:0] y ; 
    decoder2to4 dut (
        .x(x),
        .y(y)
    ); 
    task decoderValues; 
      input [1:0] inputs ; 
      begin
        x= inputs ; 
        #10 ; 
      end
    endtask
    initial begin
        decoderValues(2'b00); 
        decoderValues(2'b01); 
        decoderValues(2'b11); 
    end
endmodule
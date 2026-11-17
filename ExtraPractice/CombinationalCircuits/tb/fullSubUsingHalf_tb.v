module fullSubUsingHalf_tb;
  reg a , b, bin; 
  wire sub, borrow ;
  fullSubUsingHalf dut (
    .a(a),
    .b(b),
    .bin(bin),
    .sub(sub),
    .borrow(borrow)
  );
  
  initial begin
    a = 0; 
    b =0; 
    bin= 0 ; 
  end
  

task valuesForSub; 
    input aVal , bVal, borrowIn ; 
    begin
        a = aVal; 
        b = bVal; 
        bin = borrowIn ; 
        #10 ; 
        // this delay should be in the beginning or at the end 
        $display("Values for a, b, bin, sub and borrow are %0d %0d %0d %0d %0d",a, b, bin, sub, borrow);

    end
endtask
initial begin
    #10 ; // this is creating those, red values, now i will try to fix it
    valuesForSub(1'b1 , 1'b1 , 1'b1);  // sub is : 1 borrow 1 
    valuesForSub(1'b1 , 1'b0 , 1'b1);  // sub is 0 borrow 0 
    valuesForSub(1'b0 , 1'b1 , 1'b1);  // sub is 0 borrow 1 
    /*
    valuesForSub(1'b1 , 1'b1 , 1'b1); 
    valuesForSub(1'b1 , 1'b1 , 1'b1); 
    valuesForSub(1'b1 , 1'b1 , 1'b1); 
    valuesForSub(1'b1 , 1'b1 , 1'b1); 
    */ 
    // have given 3 values via task
end
endmodule
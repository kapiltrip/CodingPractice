module halfSubDataflow_tb;
 reg a , b ; 
 wire sub ; 
 wire borrow; 
 halfSubDataflow dut (
    .a(a),
    .b(b),
    .sub(sub),
    .borrow(borrow)
 );
 
 integer i ; 
 initial begin
   for(i=0;i<4;i=i+1)begin
    {a,b} = i; 
    #10; 
    $display("values of a : %0d and b is :%0d and the subtraction is : %0d with borrow of %0d" , a, b, sub, borrow) ; 
      
   end
   $finish; 


 end

endmodule
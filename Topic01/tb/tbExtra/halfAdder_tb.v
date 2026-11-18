module halfAdder_tb ;
   reg a ,b ; 
   wire cout , sum ; 
   initial begin
    a =0; 
    b=0; 
   end
   integer i ; 
   initial begin
      for(i =0; i< 4 ; i= i +1 )begin
        {a,b} = i ; 
        #10 ; 
        $display("the values for a is %0d and b is %0d and the sum is : %0d " , a, b, sum ); 
      end
   end
endmodule 
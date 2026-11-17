// 8 to 3 priority encoder 
module priorityEnc(
    input wire [7:0] x,
    output reg v , 
    output reg [2:0] y 
);
always @(*)begin
    v = 1'b1; 
    if(x[7]) begin 
        y = 3'b111 ;
    end  
     else if (x[6])begin
        y= 3'b110 ; 

     end else if(x[5]) begin
        y= 3'b101; 
     end else if (x[4])begin
        y=3'b100; 

     end else if (x[3]) begin
        y=3'b011; 
     end else if (x[2]) begin
        y=3'b010; 
     end else if (x[1]) begin
        y=3'b001; 
     end else if (x[0]) begin
        y=3'b000; 
end else begin
    {y,v} = 4'b0000; 
end
end 
/*
always @(*)begin
    casez (x) 
        8'b00000001: y= 3'b000;
        8'b0000001?: y= 3'b001;
        8'b000001??: y= 3'b010;
        8'b00001???: y= 3'b011;
        8'b0001????: y= 3'b100;
        8'b001?????: y= 3'b101;
        8'b01??????: y= 3'b110;
        8'b1???????: y= 3'b111;
        default: y= 3'b000;

    endcase
end
*/
endmodule 
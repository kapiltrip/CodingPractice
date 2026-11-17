// 8 to 3 priority encoder using strutural modelling 
// MSB priority 
module priorityEncoder(
    input wire [7:0] d ,
    output wire [2:0] y
);
// structural modelling 
wire w1,w2,w3,w4,w5,w6,w7 ;
wire n7 , n76 , n765, n7654 , n76543 , n765432 ; 
not g0 (n7 , d[7]) ;
nor g1 (n76 ,d[7],d[6] );
nor g2 (n765 , d[7],d[6] , d[5]) ;
nor g3 (n7654 , d[7],d[6] , d[5] , d[4] );
nor g4 (n76543 ,d[7],d[6] , d[5] , d[4] ,d[3] );
nor g5 (n765432 , d[7],d[6] , d[5] , d[4] ,d[3] , d[2]) ;
// why not n7654321 
//priority based signals 

buf g6 (w7,d[7]);
and g7 (w6 , d[6] , n7);
and g8 (w5 , d[5],n76);
and g9 (w4 , d[4],n765);
and g10 (w3 , d[3],n7654);
and g11 (w2 , d[2],n76543);
and g12 (w1 , d[1],n765432);
// generate 3 bit output 
or g13 (y[2] , w4,w5,w6,w7);
or g14 (y[1] , w2,w3,w6,w7);
or g15 (y[0] , w1,w3,w5,w7) ; 

/*
This is not structural its, behavioural modelling 
always @(*)begin
    casez (x)
        8'b00000001 : y= 3'b000;
        8'b0000001? : y= 3'b001;
        8'b000001?? : y= 3'b010;
        8'b00001??? : y= 3'b011;
        8'b0001???? : y= 3'b100;
        8'b001????? : y= 3'b101;
        8'b01?????? : y= 3'b110;
        8'b1??????? : y= 3'b111;
        default: y= 3'b000; 
    endcase
end
*/
endmodule

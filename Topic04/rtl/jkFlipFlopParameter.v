module jkFilpFlopParameter(
    input wire j , k , rst , clk , 
    output reg Q_out, 
    output wire Qb_out
);
// only for readability 

parameter MEMORY= 2'b00; 
parameter SET = 2'b10 ; 
parameter RESET = 2'b01; 
parameter TOGGLE = 2'b11 ; 
always @(posedge clk )begin
    if(rst)begin
        Q_out <=1'b0; 
end else begin
    case ({j,k})
      MEMORY : Q_out <= Q_out ; 
      SET : Q_out <= 1'b1 ; 
      RESET : Q_out <= 1'b0 ; 
      TOGGLE : Q_out <=~Q_out ;
      default: Q_out <= 1'b0 ; 
    endcase
end
end
assign Qb_out = ~Q_out;
endmodule
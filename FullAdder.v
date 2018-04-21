/*
module fa(clk,x,y,cin,A,cout); //full adder
input clk;
input x;
input y;
input cin;
output A;
output cout;
always @ (posedge clk)

endmodule
*/

module fa
(
 input x,
 input y,
 input cin,
 
 output A, 
 output cout
 );
 
assign {cout,A} =  cin + y + x;
 
endmodule
//`timescale 1ns/1ps    //cycle

module ArrayMultiplier_tb();
  reg [3:0] input1,input2;
  wire [7:0] result;
  
  
  ArrayMultiplier_4bit ArrayMultiplier_inst(.input1(input1),
                                            .input2(input2),
                                            .result(result)); 
                                            
                                            
                                            
                                            
 initial   
 begin
   
   input1=4'b0000;
   input2=4'b0000;
   #10
   input1=4'b1101;  //13 in decimal
   input2=4'b0101;  //5 in decimal
   
   // calculate 13*5 here,result should be 8'b01000001
   
 end    
 endmodule
                                 
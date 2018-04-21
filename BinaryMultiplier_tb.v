`timescale 1ns/1ps

module BinaryMultiplier_tb();
  reg [3:0] input1,input2;
  reg en;
  reg clk;
  wire [7:0] result;
  parameter Dely=5;
  
  BinaryMultiplier BinaryMultiplier_inst(.clk(clk),
                                         //.enable(en),
                                         .input1(input1),
                                         .input2(input2),
                                         .result(result));
                                         
                                         
  initial 
  begin
    //en=0;
    clk=0;
    input1=4'b0000;
    input2=4'b0000;
  //  #15
   // en=1'b1;
    
    #60
    input1=4'b1101;  //13 in decimal
    input2=4'b0101;  //5 in decimal
   
    // calculate 13*5 here,result should be 8'b01000001
  end
  
  
  always #Dely 
  begin
    clk=~clk;
  end
  
endmodule
    
    
      
  

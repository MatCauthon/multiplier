module BinaryMultiplier(clk,input1,input2,result);
  input clk;
 // input enable;
  input [3:0] input1,input2;
  output [7:0] result;
  
  
  reg [2:0] i;
  //integer i;
  reg [7:0] register;
  reg [7:0] tmp;
  reg [7:0] result;
  reg enable;
  
  initial
  begin
   // i=3'b000;
    i<=0;
    register<=8'b00000000;
  end
  
  always @( input1 or input2)
  begin
    enable<=1'b1;
    i<=0;
    register<=8'b00000000;

  end
  
  always @( negedge clk)
  begin
    if(enable)
    begin
      
      if(i<4)
      begin
        if(i==0) tmp={4'b0000,input2};
        tmp<=tmp<<1;
        if(input1[i])
        begin  
          
          register<=register+tmp;
        end
        i<=i+1;
        
      end
      else if(i==4)
      begin
        result<=register;
        //i<=3'b000;
        i=0;
        register<=8'b00000000;
        enable<=1'b0;
        
      end
    end
  end
  
endmodule
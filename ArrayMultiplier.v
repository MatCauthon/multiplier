module ArrayMultiplier_4bit(input1,input2,result) ;
  input [3:0] input1;
  input [3:0] input2;
  output [7:0] result;
  
  //reg [4:0] carry; //carry from second bit~fifth bit to third bit~sixth bit
  //reg [7:0] sum;
  //reg sum_tmp;
  //reg carry_temp;
  
  wire R0;
  assign R0 = input1[0]&input2[0];
  
  
  wire c01;
  wire A01;
  
  wire c02;
  wire A02;
  
  wire c03;
  wire A03;
  
  wire c20;
  wire A20;
  
  wire c21;
  wire A21;
  
  wire c13;
  wire A13;
  
  wire c30;
  wire A30;
  
  wire c31;
  wire A31;
  
  wire c23;
  wire A23;
  
  wire cR4;
  wire AR4;
  
  wire cR5;
  wire AR5;
  
  wire c33;
  wire A33;
  
  
  
  
  
  
  
 // assign sum[0]=input1[0]*input2[0];
  
  fa fa01(.x(input1[0]&input2[1]),
          .y(input1[1]&input2[0]),
          .cin(1'b0),
          .A(A01),
          .cout(c01));
            
  fa fa02(.x(input1[0]&input2[2]),
          .y(input1[1]&input2[1]),
          .cin(1'b0),
          .A(A02),
          .cout(c02));
          
  fa fa03(.x(input1[0]&input2[3]),
          .y(input1[1]&input2[2]),
          .cin(1'b0),
          .A(A03),
          .cout(c03));
  
  
    
  fa fa13(.x(input1[1]&input2[3]),
          .y(input1[2]&input2[2]),
          .cin(c03),
          .A(A13),
          .cout(c13));
          
  fa fa21(.x(input1[2]&input2[1]),
          .y(A03),
          .cin(c02),
          .A(A21),
          .cout(c21));
          
  fa fa20(.x(input1[2]&input2[0]),
          .y(A02),
          .cin(c01),
          .A(A20),
          .cout(c20));
          
          
          
          
    
  fa fa23(.x(input1[2]&input2[3]),
          .y(input1[3]&input2[2]),
          .cin(c13),
          .A(A23),
          .cout(c23));
          
  fa fa31(.x(input1[3]&input2[1]),
          .y(A13),
          .cin(c21),
          .A(A31),
          .cout(c31));
          
  fa fa30(.x(input1[3]&input2[0]),
          .y(A21),
          .cin(c20),
          .A(A30),
          .cout(c30));
    
    
    
    
  fa faR4(.x(1'b0),
          .y(A31),
          .cin(c30),
          .A(AR4),
          .cout(cR4));
          
  fa faR5(.x(cR4),
          .y(A23),
          .cin(c31),
          .A(AR5),
          .cout(cR5));
          
  fa fa33(.x(input1[3]&input2[3]),
          .y(c23),
          .cin(cR5),
          .A(A33),
          .cout(c33));
  
  assign result={c33,A33,AR5,AR4,A30,A20,A01,R0};

  
endmodule
  
  
    
    
    
    
   
    
    

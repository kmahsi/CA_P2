module registerFileTB();
  reg clk = 0, enb = 0;
  reg [2:0] wRegister , rRegister1, rRegister2;
  reg [7:0] wData;
  wire [7:0] rData1, rData2;

  initial repeat (18) #50 clk = ~clk;
  
  initial begin
      wRegister = 2;
      wData = 3;
      rRegister1 = 0;
      rRegister2 = 2;
      #40
      enb = 1;
      #20
      enb = 0;
      wData = 5;

      #50
      enb = 1;
      wData = 5;
      wRegister = 7;
      rRegister1 = 7;
      #50
      enb= 0;
      wData= 4;
  end








  registerFile rf(
    .clock(clk),
    .regWrite(enb),
    .writeRegister(wRegister),
    .writeData(wData),
    .readRegister1(rRegister1),
    .readRegister2(rRegister2), 
    .readData1(rData1), 
    .readData2(rData2)
  );



endmodule
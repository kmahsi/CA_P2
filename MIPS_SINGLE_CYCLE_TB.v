module mips_single_cycleTB();
  reg clk = 0;
  reg rst = 1;
  

  initial repeat (15) #70 clk = ~clk;

  initial begin
    #100
    rst = 0;
  end

  mips_single_cycle MIPS(clk, rst);
endmodule
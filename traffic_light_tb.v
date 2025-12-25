`timescale 1ns/1ns

module traffic_light_tb;
  reg clk,rst;
  wire[3:0]count;
  wire[2:0]state;
  
traffic_light uut(state,count,clk,rst);
always #5 clk=~clk;
initial begin 
clk=0;
rst=1;
#20 rst=0;
#1000;
$display("Simulation Finished");
$finish;
end

initial begin
    $monitor("Time=%0t | rst=%b | state=%b | count=%d", $time, rst, state, count);
end
  endmodule
  
  

  
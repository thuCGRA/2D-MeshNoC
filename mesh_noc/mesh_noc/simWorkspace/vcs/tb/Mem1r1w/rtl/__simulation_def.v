
`timescale 1ns/1ps
module __simulation_def;
initial begin
  $fsdbDumpfile("Mem1r1w.fsdb");
  $fsdbDumpvars(0, Mem1r1w);
  $fsdbDumpflush;
end
endmodule
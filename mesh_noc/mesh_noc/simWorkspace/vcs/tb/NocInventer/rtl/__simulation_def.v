
`timescale 1ns/1ps
module __simulation_def;
initial begin
  $fsdbDumpfile("NocInventer.fsdb");
  $fsdbDumpvars(0, NocInventer);
  $fsdbDumpflush;
end
endmodule
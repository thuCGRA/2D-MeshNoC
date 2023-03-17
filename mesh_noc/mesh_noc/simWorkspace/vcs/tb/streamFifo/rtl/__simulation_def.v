
`timescale 1ns/1ps
module __simulation_def;
initial begin
  $fsdbDumpfile("streamFifo.fsdb");
  $fsdbDumpvars(0, streamFifo);
  $fsdbDumpflush;
end
endmodule
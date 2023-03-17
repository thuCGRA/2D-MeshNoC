debImport "-sv" \
          "+incdir+/home/cgra/newspace/NOC/bsg_noc/test_noc/mesh_router/src" \
          "-f" "filelist.f"
debLoadSimResult /home/cgra/newspace/NOC/bsg_noc/test_noc/mesh_router/sim/tb.fsdb
wvCreateWindow
srcHBSelect "test_bench.top" -win $_nTrace1
srcSetScope -win $_nTrace1 "test_bench.top" -delim "."
srcHBSelect "test_bench.top" -win $_nTrace1
srcHBSelect "test_bench.top.meshnode\[0\]" -win $_nTrace1
srcHBSelect "test_bench.top.master" -win $_nTrace1
srcSetScope -win $_nTrace1 "test_bench.top.master" -delim "."
srcHBSelect "test_bench.top.master" -win $_nTrace1
srcHBSelect "test_bench.top.master.endpoint_example" -win $_nTrace1
srcSetScope -win $_nTrace1 "test_bench.top.master.endpoint_example" -delim "."
srcHBSelect "test_bench.top.master.endpoint_example" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "in_fifo_full" -line 146 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "returned_fifo_full_o" -line 139 -pos 2 -win $_nTrace1
srcAction -pos 138 7 9 -win $_nTrace1 -name "returned_fifo_full_o" -ctrlKey off
srcBackwardHistory -win $_nTrace1
srcHBSelect "test_bench.top.master.endpoint_example" -win $_nTrace1
srcSearchString "returned_fifo_full_o" -win $_nTrace1 -next -case
srcSearchString "returned_fifo_full_o" -win $_nTrace1 -next -case
srcDeselectAll -win $_nTrace1
srcSelect -signal "y_cord_width_p" -line 96 -pos 1 -win $_nTrace1
wvSelectGroup -win $_nWave3 {G1}
srcDeselectAll -win $_nTrace1
srcSelect -signal "returned_fifo_full_o" -line 139 -pos 2 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
srcTraceLoad "test_bench.top.master.endpoint_example.returned_fifo_full_o" -win \
           $_nTrace1
srcTraceLoad "test_bench.top.master.endpoint_example.returned_fifo_full_o" -win \
           $_nTrace1
srcHBSelect "test_bench.top.master.endpoint_example" -win $_nTrace1
srcSetScope -win $_nTrace1 "test_bench.top.master.endpoint_example" -delim "."
srcHBSelect "test_bench.top.master.endpoint_example" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "returned_fifo_full_o" -line 89 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvSetCursor -win $_nWave3 2137760.775862 -snap {("G2" 0)}
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
wvZoomOut -win $_nWave3
srcHBSelect "test_bench.top.master" -win $_nTrace1
srcSetScope -win $_nTrace1 "test_bench.top.master" -delim "."
srcHBSelect "test_bench.top.master" -win $_nTrace1
srcHBSelect "test_bench.top.master.endpoint_example" -win $_nTrace1
srcSetScope -win $_nTrace1 "test_bench.top.master.endpoint_example" -delim "."
srcHBSelect "test_bench.top.master.endpoint_example" -win $_nTrace1
srcHBSelect "test_bench.top.master.endpoint_example.bme" -win $_nTrace1
srcSetScope -win $_nTrace1 "test_bench.top.master.endpoint_example.bme" -delim \
           "."
srcHBSelect "test_bench.top.master.endpoint_example.bme" -win $_nTrace1
wvSelectSignal -win $_nWave3 {( "G1" 1 )} 
srcHBSelect "test_bench.top.master.endpoint_example.bme" -win $_nTrace1
srcSetScope -win $_nTrace1 "test_bench.top.master.endpoint_example.bme" -delim \
           "."
srcHBSelect "test_bench.top.master.endpoint_example.bme" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "returned_fifo_full_o" -line 31 -pos 1 -win $_nTrace1
srcAction -pos 30 5 7 -win $_nTrace1 -name "returned_fifo_full_o" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -signal "link_sif_o_cast.rev.ready_and_rev" -line 127 -pos 1 -win \
          $_nTrace1

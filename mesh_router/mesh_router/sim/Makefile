all: clean run

run: com sim

###########################################
# DEFINE THE PATHS
#BSG_IP_CORES_DIR=$(abspath  ../../celerity/bsg_celerity_latest/bsg_celerity_benchmarks/vcs-build/bsg_ip_cores)
#BSG_MANYCORE_DIR=$(abspath  ../../celerity/bsg_celerity_latest/bsg_celerity_benchmarks/vcs-build/bsg_manycore)
BSG_MANYCORE_DIR=$(abspath ../../mesh_router)

#CADENV_DIR=$(abspath ../../../bsg_cadenv)

###########################################
# SETUP THE TOOL PATHS
#include $(CADENV_DIR)/cadenv.mk
VCS=vcs
VCS_BIN=/tools/eda/vcs/O-2018.09-SP2/bin
VERDI=verdi

#############################################
# SETUP THE INCLUDE PATH and SEARCH PATH
#INC_DIRS	+= $(BSG_IP_CORES_DIR)/bsg_noc
#INC_DIRS	+= $(BSG_IP_CORES_DIR)/bsg_misc
#INC_DIRS	+= $(BSG_MANYCORE_DIR)/v/
#
#SRC_DIRS	+= $(BSG_MANYCORE_DIR)/v/
#SRC_DIRS	+= $(BSG_IP_CORES_DIR)/bsg_misc
#SRC_DIRS	+= $(BSG_IP_CORES_DIR)/bsg_noc
#SRC_DIRS	+= $(BSG_IP_CORES_DIR)/bsg_dataflow
#SRC_DIRS	+= $(BSG_IP_CORES_DIR)/bsg_test
#SRC_DIRS	+= $(BSG_IP_CORES_DIR)/bsg_mem
#SRC_DIRS	+= ./
#
#PKG_FILES	+= $(BSG_IP_CORES_DIR)/bsg_misc/bsg_defines.v
#PKG_FILES	+= $(BSG_IP_CORES_DIR)/bsg_noc/bsg_noc_pkg.v

INC_DIRS	+= $(BSG_MANYCORE_DIR)/src
SRC_DIRS	+= $(BSG_MANYCORE_DIR)/src
SRC_DIRS	+= $(BSG_MANYCORE_DIR)/src/tb
PKG_FILES	+= $(BSG_MANYCORE_DIR)/src/bsg_noc_links.vh
PKG_FILES	+= $(BSG_MANYCORE_DIR)/src/bsg_manycore_packet.vh

###########################################
# DEFINE THE VCS OPTIONS
VCS_OP	    = -full64 -sverilog +v2k +vcs+flush+all
#setup the timescale
VCS_OP     += -timescale=1ns/1ps
# compile and run 
VCS_OP     += -R -l com.log -o tb.simv
# search *.v files for module
VCS_OP     += +libext+.v
#enable waveform dump
VCS_OP     +=  +vcs+vcdpluson +vcs+fsdbson -debug_pp +nospecify +notimingcheck
#enable verdi and fsdb lib
VCS_OP	   += -P ${NOVAS_HOME}/share/PLI/VCS/LINUX64/novas.tab ${NOVAS_HOME}/share/PLI/VCS/LINUX64/pli.a 


com: 
	$(VCS) $(VCS_OP) 			\
	$(addprefix +incdir+, $(INC_DIRS) )	\
	$(addprefix -y , $(SRC_DIRS)     )	\
	$(PKG_FILES) 	\
	-f filelist.f \
	-top test_bench			

sim:
	./tb.simv -l sim.log  +nospecify +notimingcheck +fsdb+autoflush \
    -cm line+tgl+cond+fsm 

dve:
	$(VCS_BIN)/dve -full64 -vpd vcdplus.vpd &

verdi:
	$(VERDI) -sv \
	$(addprefix +incdir+, $(INC_DIRS) )	\
	-f filelist.f -ssf ./tb.fsdb	&

clean:
	rm -rf csrc DVEfiles *.tar.gz simv simv.daidir ucli.key vcdplus.vpd tb.fsdb tb.simv.daidir

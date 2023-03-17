import noclib._
import noclib.NocInterface._
import spinal.core._
import spinal.core.sim._

import scala.util.Random



//Generate the MyTopLevel's Verilog
object MyTopLevelVerilog {
  def main(args: Array[String]) {
    SpinalVerilog(new MyTopLevel)
  }
}

object noc_top {
  def main(args: Array[String]): Unit = {
    SpinalConfig(targetDirectory = "./rtl/", defaultConfigForClockDomains = ClockDomainConfig(resetActiveLevel = LOW))
//      .generateVerilog(new holdDataCycle(UInt(32 bits), holdCycle = 1, counterStyle = true)).printPruned()
//      .generateVerilog(new muxeLock(muxeLockConfig())).printPruned()
//      .generateVerilog(new counterUpDown(31, 1, 2)).printPruned()
//      .generateVerilog(new muxOneHot(3, 32)).printPruned()
//      .generateVerilog(new rrArbiter(3)).printPruned()
//      .generateVerilog(new meshRouterDorDecoder(1, 2, 2)).printPruned()
//      .generateVerilog(new meshRouter(32, 1, 2, 2)).printPruned()
//      .generateVerilog(new bufferMeshRouter(bufferMeshRouterConfig(32, 1, 2, 2))).printPruned()
//      .generateVerilog(new meshNode(meshNodeConfig())).printPruned()
//      .generateVerilog(new meshEndpoint(meshEndpointConfig(returnedFifoEnable = true))).printPruned()
//      .generateVerilog(new meshEndpointStandard(meshEndpointStandardConfig(returnedFifoEnable = true))).printPruned()
//      .generateVerilog(new meshLinkTieoff(meshLinkTieoffConfig())).printPruned()
      .generateVerilog(new meshNetwork(meshNetworkConfig(xCordinateWidth = 2, yCordinateWidth = 2))).printPruned()
  }
}

object TestNocDirection {
  class myNocDirectionTest extends Component {
    val routerDirect = UInt()
    routerDirect := NocDirection.P
  }

  def main(args: Array[String]): Unit = {
    SpinalConfig(targetDirectory = "./rtl/").generateVerilog(new myNocDirectionTest())
  }
}

object TestNocInventer {
  def main(args: Array[String]): Unit = {
    SpinalConfig(targetDirectory = "./rtl/").generateVerilog(new NocInventer(Width = 8))

    val vcsFlags = VCSFlags(
      compileFlags = List("-full64 +vcs+fsdbson"),
      elaborateFlags = List("-full64 -LDFLAGS -Wl,--no-as-needed +fsdb+autoflush")
    )

    val compiled = SimConfig.withVCS(vcsFlags).withFsdbWave.allOptimisation.workspacePath("./simWorkspace/vcs/tb").compile(
    //    val compiled = SimConfig.withWave.allOptimisation.workspacePath("./simWorkspace/verilator/tb").compile(
      rtl = new NocInventer(Width = 8)
    )
    val sim = compiled.doSim { dut =>
      //      val period = 10
      //      dut.clockDomain.forkStimulus(period)

      for (i <- 0 to 9) {
        val a = Random.nextInt(256)
        dut.io.ain #= a
        sleep(1)
        assert(dut.io.aout.toInt == ((~a) & 0xff))
        println("dut.io.aout: " + dut.io.aout.toInt + ", " + ((~a) & 0xff))
      }
    }
  }
}

object TestNocMem1r1w {
  def main(args: Array[String]): Unit = {
    SpinalConfig(targetDirectory = "./rtl/").generateVerilog(new Mem1r1w(UInt(32 bits), depthCount = 16))

    val vcsFlags = VCSFlags(
      compileFlags = List(" +vcs+fsdbson"),
      elaborateFlags = List("-LDFLAGS -Wl,--no-as-needed +fsdb+autoflush")
    )

    val compiled = SimConfig.withVCS(vcsFlags).withFsdbWave.allOptimisation.workspacePath("./simWorkspace/vcs/tb").compile(
      //    val compiled = SimConfig.withWave.allOptimisation.workspacePath("./simWorkspace/verilator/tb").compile(
      rtl = new Mem1r1w(UInt(32 bits), depthCount = 16)
    )
    val sim = compiled.doSim { dut =>
      SimTimeout(10000)
      val period = 10
      dut.clockDomain.forkStimulus(period)

      // test for write
      for (i <- 0 until 16) {
        dut.io.wVi #= false
        dut.io.rVi #= false

        dut.clockDomain.waitSampling()
        val a = Random.nextInt(16)
        val d = Random.nextInt(256)
        dut.io.wVi #= true
        dut.io.wAddri #= a
        dut.io.wDatai #= d
        dut.io.rAddri #= a

        dut.clockDomain.waitSampling()
        dut.io.wVi #= false

       // dut.myClockDomain.waitFallingEdgeWhere(dut.io.wVi.toBoolean == false)
        dut.clockDomain.waitFallingEdge()
        assert(dut.io.rDatao.toInt == (d & 0xff))

        println("mem read & write successfully :" + (dut.io.rDatao.toInt, dut.io.rAddri.toInt) + " addr is " + a + " data is " + d)
      }
    }
  }
}

object TestStreamFifo {
  def main(args: Array[String]): Unit = {
    SpinalConfig(targetDirectory = "./rtl/",defaultConfigForClockDomains=ClockDomainConfig(resetActiveLevel = LOW))
        .generateVerilog(new streamFifo(UInt(32 bits), fifoDepth = 4)).printPruned()
  //    SpinalVerilog(new streamFifo(dataWidth = 32, fifoDepth = 1))

    val workobject = SimConfig.withVCS.withFsdbWave.allOptimisation.workspacePath("./simWorkspace/vcs/tb")
    val compiled = workobject.compile(rtl = new streamFifo(UInt(32 bits), fifoDepth = 4))
    val sim = compiled.doSim { dut =>
      SimTimeout(10000)
      val period = 10
      dut.clockDomain.forkStimulus(period)

      dut.io.validIn  #= false
      dut.io.yumiIn   #= false

      var notfull = true
      var empty = true
      var writeNum = 0
      var readNum = 0
      while(notfull){
        dut.clockDomain.waitSampling()
        val a = Random.nextBoolean()
        val b = Random.nextInt(1024)
        dut.io.validIn #= a
        dut.io.dataIn #= b
        println("Fifo write: " + (a, b))

        if(a) {
          writeNum = writeNum + 1
          dut.clockDomain.waitSampling()
          dut.io.validIn #= false

          val c = Random.nextBoolean()
          dut.io.yumiIn #= c
          dut.clockDomain.waitFallingEdge()
          val result = dut.io.dataOut.toInt
          val result_yumi = c
          println(s"Fifo Read: ($result_yumi, $result)")

          if(c){
            readNum = readNum + 1
            dut.clockDomain.waitSampling()
            dut.io.yumiIn #= false
          }
          empty = !dut.io.validOut.toBoolean
          notfull = dut.io.readyOut.toBoolean
        }

        println("Fifo is full: " + !notfull)
        println("Fifo is empty: " + empty)
        println("WriteNum = " + writeNum + "  " + "ReadNum = " + readNum)
      }

      //Open Verdi to Veiw fsdb Wave of DUT
      //val fsdbWaveOpen = new fsdbView(workobject, dut.definitionName)
    }
  }
}

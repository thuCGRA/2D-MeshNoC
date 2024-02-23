package noclib

import spinal.core._

import scala.collection.mutable
import scala.collection.mutable._
import scala.collection.mutable.LinkedHashMap._

class MyTopLevel extends Component {
  val io = new Bundle {
    val cond0 = in  Bool()
    val cond1 = in  Bool()
    val flag  = out Bool()
    val state = out UInt(8 bits)
  }
  val counter = Reg(UInt(8 bits)) init(0)

  val cond = io.cond0 & io.cond1
  when(cond) {
    counter := counter + 1
  }

  io.state := counter
  io.flag  := (counter === 0) | io.cond1
}

//object NocDirection {
//  // defaultEncoding = binarySequential
//  // val P, W, E, N, S = newElement()
//  val P = 0
//  val W = 1
//  val E = 2
//  val N = 3
//  val S = 4
//  val direction = Array(P, W, E, N, S)
//}

//object NocDirection extends SpinalEnum(defaultEncoding = binarySequential){
object NocInterface {
  object NocDirection  {
    // defaultEncoding = binarySequential
    // val P, W, E, N, S = newElement()
    val P = 0
    val W = 1
    val E = 2
    val N = 3
    val S = 4
    val direction = Array(P, W, E, N, S)
  }

  object ePacketOp extends Bundle {
    val remoteLoad = 0
    val remoteStore = 1
    val remoteSwapaq = 2
    val remoteSwaprl = 3

    val packetOpTypeWidth = 2
  }

  object ePacketType extends Bundle {
    val packetTypeCredit = 0
    val packetTypeData = 1

    val packetTypeWidth = 1
  }

  case class returningCreditConfig(var xCordWidth: Int = 2,
                                   var yCordWidth: Int = 2,
                                   var loadIdWidth: Int = 10)

  case class returningCredit(config: returningCreditConfig) extends Bundle {
    import ePacketType._
    val packetType = Bits(packetTypeWidth bits)
    val xCordinate = Bits(config.xCordWidth bits)
    val yCordinate = Bits(config.yCordWidth bits)
    val loadId = Bits(config.loadIdWidth bits)

    def getWidth() = packetTypeWidth + config.xCordWidth + config.yCordWidth + config.loadIdWidth
  }

  case class returnPacketConfig(var dataWidth: Int = 0,
                                var xCordWidth: Int = 0,
                                var yCordWidth: Int = 0,
                                var loadIdWidth: Int = 0) {
    import ePacketType._
    val returnPackageWidth = dataWidth + xCordWidth + yCordWidth + loadIdWidth + packetTypeWidth
    def getWdith() = returnPackageWidth
  }

  case class returnPacket(config: returnPacketConfig) extends Bundle {
    import ePacketType._
    val pktTyple = Bits(packetTypeWidth bits)
    val data = Bits(config.dataWidth bits)
    val loadId = Bits(config.loadIdWidth bits)
    val xCord = Bits(config.xCordWidth bits)
    val yCord = Bits(config.yCordWidth bits)

    def getWdith() = config.returnPackageWidth
  }

  case class packetPayloadConfig(var dataWidth: Int = 0,
                                 var loadIdWidth: Int = 0){
    def getWdith() = dataWidth
  }

  case class packetPayload(config: packetPayloadConfig) extends Bundle {
    val data = Bits(config.dataWidth bits)
    val loadInfo = Bits(config.dataWidth bits)
    loadInfo := data
    val loadId = loadInfo(0 until config.loadIdWidth )
    val loadInfoPadding = loadInfo(config.loadIdWidth until config.dataWidth )

    def getWdith() = config.dataWidth
  }

  case class meshPacketConfig(var addrWidth: Int = 0,
                              var dataWidth: Int = 0,
                              var xCordWidth: Int = 0,
                              var yCordWidth: Int = 0,
                              var loadIdWidth: Int = 0){
    import ePacketOp._

    val opExWidth = dataWidth >> 3
    val meshPackageWidth = addrWidth + dataWidth + (xCordWidth + yCordWidth) * 2 + opExWidth + packetOpTypeWidth

    def getWdith() = meshPackageWidth
  }

  case class meshPacket(config: meshPacketConfig) extends Bundle {

    import ePacketOp._
    val op = Bits(packetOpTypeWidth bits)
    val opEx = Bits(config.opExWidth bits)
    val addr = Bits(config.addrWidth bits)
    val payload = packetPayload(packetPayloadConfig(config.dataWidth, config.loadIdWidth))
    val srcXCord = Bits(config.xCordWidth bits)
    val srcYCord = Bits(config.yCordWidth bits)
    val myXCord = Bits(config.xCordWidth bits)
    val myYCord = Bits(config.yCordWidth bits)

    def getWdith() = config.meshPackageWidth
  }

  case class readyAndLink(dataWidth: Int) extends Bundle {
    val v = Bool()
    val readyAndRev = Bool()
    val data = Bits(dataWidth bits)

    def getWdith() = dataWidth + 2
  }

  case class readyThenLink(dataWidth: Int) extends Bundle {
    val v = Bool()
    val readyThenRev = Bool()
    val data = Bits(dataWidth bits)

    def getWdith() = dataWidth + 2
  }

  case class thenReadyLink(dataWidth: Int) extends Bundle {
    val v = Bool()
    val thenReadyRev = Bool()
    val data = Bits(dataWidth bits)

    def getWdith() = dataWidth + 2
  }


  case class fwdLinkConfig(var addrWidth: Int = 0,
                           var dataWidth: Int = 0,
                           var xCordWidth: Int = 0,
                           var yCordWidth: Int = 0,
                           var loadIdWidth: Int = 0){
    import ePacketOp._

    val opExWidth = dataWidth >> 3
    val fwdLinkDataWidth = addrWidth + dataWidth + (xCordWidth + yCordWidth) * 2 + opExWidth + packetOpTypeWidth

    def getWdith() = fwdLinkDataWidth + 2
  }

  case class fwdLink(config: fwdLinkConfig) extends Bundle {
    val fwdPacket = readyAndLink(config.fwdLinkDataWidth)

    def getWdith() = config.getWdith()
  }

  case class revLinkConfig(var dataWidth: Int = 0,
                           var xCordWidth: Int = 0,
                           var yCordWidth: Int = 0,
                           var loadIdWidth: Int = 0){
    import ePacketType._

    val revLinkDataWidth = dataWidth + xCordWidth + yCordWidth + loadIdWidth + packetTypeWidth

    def getWdith() = revLinkDataWidth + 2
  }

  case class revLink(config: revLinkConfig) extends Bundle {
    val revPacket = readyAndLink(config.revLinkDataWidth)

    def getWdith() = config.getWdith()

  }

  case class meshLinkConfig(var addrWidth: Int = 0,
                            var dataWidth: Int = 0,
                            var xCordWidth: Int = 0,
                            var yCordWidth: Int = 0,
                            var loadIdWidth: Int = 0){
    val meshFwdLinkConfig = fwdLinkConfig(addrWidth, dataWidth, xCordWidth, yCordWidth, loadIdWidth)
    val meshRevLinkConfig = revLinkConfig(dataWidth, xCordWidth, yCordWidth, loadIdWidth)
    val meshLinkWidth = (meshFwdLinkConfig.getWdith() + 2) + (meshRevLinkConfig.getWdith() + 2)

    def getWdith() = meshLinkWidth
  }

  case class meshLink(config: meshLinkConfig) extends Bundle {
    val fwdlink = fwdLink(config.meshFwdLinkConfig)
    val revlink = revLink(config.meshRevLinkConfig)

    def getWdith() = config.getWdith()
  }
}


class NocInventer(Width: Int) extends Component{
  val io = new Bundle{
    val ain = in Bits(Width bits)
    val aout = out Bits(Width bits)
  }
  noIoPrefix()
  io.aout := ~ io.ain
}

class Mem1r1w[T<:Data] (dataType: HardType[T], var depthCount: Int = 0) extends Component{
  val io = new Bundle{
    var addrWidth: Int = 0
    if (addrWidth == 0) addrWidth = log2Up(depthCount)

    val wVi = in Bool()
    val wAddri = in UInt(addrWidth bits)
    val wDatai = in (dataType)

    val rVi = in Bool()
    val rAddri = in UInt(addrWidth bits)
    val rDatao = out (dataType)
  }
  noIoPrefix()

  if (depthCount == 0) depthCount = 1 << io.addrWidth
  val unused_rvi = io.rVi

  val mem = Mem(dataType, wordCount = depthCount)
  io.rDatao := mem(io.rAddri)
  mem.write(
    enable = io.wVi,
    address = io.wAddri,
    data = io.wDatai
  )
}

class streamFifo[T<:Data](dataType: HardType[T], fifoDepth: Int, var readyThenValid: Boolean = false) extends Component {
  val io = new Bundle{
    val dataIn = in (dataType)
    val validIn = in Bool()
    val readyOut = out Bool()

    val dataOut = out (dataType)
    val validOut = out Bool()
    val yumiIn = in Bool()
  }
  noIoPrefix()

  val dataWidth = io.dataIn.getBitsWidth
  if (fifoDepth != 0) println(s"Generating FIFO Instance of: dataWidth = $dataWidth, fifoDepth = $fifoDepth !!!")
  println("input: ready/valid  flow control ")
  println("output: valid->yumi  flow control ")
  val isDepth1 = fifoDepth == 1
  val isDepth2 = fifoDepth == 2
  val isDepthlarger2 = fifoDepth > 2
  val fifoAddrWidth = log2Up(fifoDepth)

/*  val tmpData = Reg(Bits())
  val full = Reg(Bool()) init False

  val tmpFlag = io.validIn & io.readyOut
  when(tmpFlag) {
    tmpData := io.dataIn
  }

  when(full) {
    full := ~io.yumiIn
  } otherwise {
    full := io.validIn
  }

  io.readyOut := ~full
  io.validOut := full
  io.dataOut := tmpData
  */

  // Fifo depth == 1
  val fifo1 = isDepth1 generate new Area {
      val tmpData = Reg(dataType)
      val full = Reg(Bool()) init False

      val tmpFlag = io.validIn & io.readyOut
      when(tmpFlag) {
        tmpData := io.dataIn
      }

      when(full) {
        full := ~io.yumiIn
      } otherwise {
        full := io.validIn
      }

      io.readyOut := ~full
      io.validOut := full
      io.dataOut := tmpData
  }

  // Fifo depth == 2
  val fifo2 = isDepth2 generate new Area{
    println("fifoAddrWidth:" + fifoAddrWidth)
    val ptrRead = Reg(UInt(fifoAddrWidth bits)) init 0
    val deq = Bool()
    val ptrWrite = Reg(UInt(fifoAddrWidth bits)) init 0
    val enq = Bool()
    val empty = Reg(Bool()) init True
    val full = Reg(Bool()) init False

    deq := io.yumiIn

    if(readyThenValid){
      enq := io.validIn
    } else{
      enq := ~full & io.validIn
    }

    when(enq) {
      ptrWrite := ~ptrWrite
    }
    when(deq) {
      ptrRead := ~ptrRead
    }
    empty := (empty & ~enq) | (~full & deq & ~enq)

    if(readyThenValid){
      full := (~empty & enq & ~deq) | (full & ~(deq ^ enq))
    }else{
      full := (~empty & enq & ~deq) | (full & ~deq)
    }

    io.validOut := ~empty
    io.readyOut := ~full

    val myMem1r1w = new Mem1r1w(dataType, depthCount = fifoDepth)
    myMem1r1w.io.wVi := enq
    myMem1r1w.io.wDatai := io.dataIn
    myMem1r1w.io.wAddri := ptrWrite
    myMem1r1w.io.rVi := ~empty
    myMem1r1w.io.rAddri := ptrRead
    io.dataOut := myMem1r1w.io.rDatao
  }

  val fifolarger2 = isDepthlarger2 generate new Area{
    val deq = Bool()
    val validOutTemp = Bool()
    val enq = Bool()
    val readyOutTemp = Bool()

    val ptrRead = UInt(fifoAddrWidth bits)
    val ptrWrite = UInt(fifoAddrWidth bits)
    val empty = Bool()
    val full = Bool()

    deq := io.yumiIn
    if(readyThenValid){
      enq := io.validIn
    }else{
      enq := io.validIn & readyOutTemp
    }

    readyOutTemp := ~full
    io.readyOut := readyOutTemp
    validOutTemp := ~empty
    io.validOut := validOutTemp

    val myFifoTracker = new fifoTracker(depthCount = fifoDepth)
    myFifoTracker.io.deqIn := deq
    myFifoTracker.io.enqIn := enq
    full := myFifoTracker.io.fullOut
    empty := myFifoTracker.io.emptyOut
    ptrRead := myFifoTracker.io.ptrReadOut
    ptrWrite := myFifoTracker.io.ptrWriteOut

    val myMem1r1w = new Mem1r1w(dataType, depthCount = fifoDepth)
    myMem1r1w.io.wVi := enq
    myMem1r1w.io.wDatai := io.dataIn
    myMem1r1w.io.wAddri := ptrWrite
    myMem1r1w.io.rVi := validOutTemp
    myMem1r1w.io.rAddri := ptrRead
    io.dataOut := myMem1r1w.io.rDatao

  }
}

class fifoTracker(depthCount: Int) extends Component {
  val io = new Bundle{
    val addrWidth = log2Up(depthCount)
    val enqIn = in Bool()
    val deqIn = in Bool()

    val ptrReadOut = out UInt(addrWidth bits)
    val ptrWriteOut = out UInt(addrWidth bits)
    val fullOut = out Bool()
    val emptyOut = out Bool()
  }
  noIoPrefix()

  val ptrRead =  UInt (io.addrWidth bits)
  val ptrWrite =  UInt (io.addrWidth bits)
//  val full =  Bool()
//  val empty =  Bool()

  val myReadPtr = new circlarPtr(depthCount = depthCount, maxAdd = 1)
  myReadPtr.io.addIn := io.deqIn.asUInt.resized
  ptrRead := myReadPtr.io.ptr

  val myWritePtr = new circlarPtr(depthCount = depthCount, maxAdd = 1)
  myWritePtr.io.addIn := io.enqIn.asUInt.resized
  ptrWrite := myWritePtr.io.ptr

  val enq = Reg(Bool()) init False
  val deq = Reg(Bool()) init True

  when(io.deqIn | io.enqIn){
    enq := io.enqIn
    deq := io.deqIn
  }

  val equalPtr = ptrWrite === ptrRead
  io.emptyOut := equalPtr & deq
  io.fullOut := equalPtr & enq
  io.ptrReadOut := ptrRead
  io.ptrWriteOut := ptrWrite
}

class circlarPtr(depthCount: Int, var maxAdd: Int = 1) extends Component {
  val io = new Bundle{
    val addWidth = log2Up(maxAdd+1)
    val addrWidth = log2Up(depthCount)

    val addIn = in UInt(addWidth bits)
    val ptr = out UInt (addrWidth bits)
  }
  noIoPrefix()

  val ptrRight = Reg(UInt(io.addrWidth bits)) init 0
  val ptrNext = UInt(io.addrWidth bits)
  val ptrWrap = UInt((io.addrWidth+1) bits)

  ptrRight := ptrNext
  io.ptr := ptrRight

  if(depthCount == 1){
    ptrNext := 0
  }else if(isPow2(depthCount)){
    if(maxAdd == 1){
      ptrNext := io.addIn.asBool ?  (ptrRight + 1) | ptrRight
    }else{
      ptrNext := ptrRight + io.addIn
    }
  }else{
    ptrWrap := ptrRight -^ depthCount +^ io.addIn

    ptrNext := ptrRight + io.addIn
    when(ptrWrap.asBits(io.addrWidth)){
      ptrNext := ptrWrap.resized
    }
  }
}


class holdDataCycle[T<:Data] (dataType: HardType[T], var holdCycle: Int = 1, var counterStyle: Boolean = false) extends Component{
  val io = new Bundle{
    val validIn = in Bool()
    val dataIn = in (dataType)
    val holdIn = in Bool()

    val validOut = out Bool()
    val dataOut = out (dataType)
  }
  noIoPrefix()

  val dataWidth = io.dataIn.getBitsWidth

    val holdReg = Vec(Reg(Bool()), holdCycle)
    val validReg = Vec(Reg(Bool()), holdCycle)
    val dataReg = Vec(Reg(dataType), holdCycle)

    val validTemp = Vec(Bool(), holdCycle)
    val dataTemp = Vec(dataType, holdCycle)

    val counterHoldCycle = Reg(UInt(log2Up(holdCycle) + 1 bits))

  if(counterStyle == false) {
    for (index <- 1 to holdCycle) {
      if (index == 1) {
        holdReg(index - 1) := io.holdIn
        dataReg(index - 1) := io.dataIn
        validReg(index - 1) := io.validIn

        dataTemp(index - 1) := holdReg(index - 1) ? dataReg(index - 1) | io.dataIn
        validTemp(index - 1) := holdReg(index - 1) ? validReg(index - 1) | io.validIn

      } else {
        holdReg(index - 1) := holdReg(index - 2)
        dataReg(index - 1) := dataReg(index - 2)
        validReg(index - 1) := validReg(index - 2)

        dataTemp(index - 1) := holdReg(index - 1) ? dataReg(index - 1) | dataTemp(index - 2)
        validTemp(index - 1) := holdReg(index - 1) ? validReg(index - 1) | validTemp(index - 2)
      }
    }

    io.dataOut := dataTemp(holdCycle - 1)
    io.validOut := validTemp(holdCycle - 1)

  }else{

    when(io.holdIn){
      counterHoldCycle := 1
      holdReg(0) := True
    }otherwise{
      when(holdReg(0) &&  counterHoldCycle =/= holdCycle){
        counterHoldCycle := counterHoldCycle + 1
      }otherwise{
        counterHoldCycle := 0
        holdReg(0) := False
      }
    }

    when(io.holdIn){
      dataReg(0) := io.dataIn
      validReg(0) := io.validIn
    } elsewhen (holdReg(0) && counterHoldCycle === holdCycle) {
      dataReg(0) := io.dataIn
      validReg(0) := False
    }

    io.dataOut := dataReg(0)
    io.validOut := validReg(0)
  }
}

class counterUpDown(maxValue: Int, maxStep: Int, initValue: Int) extends Component {
  val io = new Bundle{
    val stepWidth = log2Up(maxStep+1)
    val ptrWidth = log2Up(maxValue+1)

    val upIn = in UInt(stepWidth bits)
    val downIn = in UInt(stepWidth bits)
    val countOut = out UInt(ptrWidth bits)
  }
  noIoPrefix()

  val countTemp = Reg(UInt(io.ptrWidth bits))
  countTemp.init(initValue)
  countTemp := countTemp - io.downIn + io.upIn

  io.countOut := countTemp

}

class muxOneHot(dataNum: Int, dataWidth: Int) extends Component{
  val io = new Bundle{
    val dataIn = in Vec(Bits(dataWidth bits), dataNum)
    val selOneHot = in Bits(dataNum bits)
    val dataOut = out Bits(dataWidth bits)
  }
  noIoPrefix()

//  val oneHotIndex = Vec(UInt(log2Up(dataNum) bits), dataNum)
//
//  for(index <- 0 until dataNum){
//    when(io.selOneHot(index)){
//      oneHotIndex(index) := index
//    } otherwise {
//      oneHotIndex(index) := 0
//    }
//
//  }
//
//  val dataIndex =UInt(log2Up(dataNum) bits)
//  dataIndex := oneHotIndex.reduce(_|_)

//  io.dataOut := io.dataIn(dataIndex)

  val dataMask = Vec(Bits(dataWidth bits), dataNum)
  for(i<- 0 until dataNum){
    dataMask(i) :=  B((dataWidth-1 downto 0) -> io.selOneHot(i)) & io.dataIn(i)
  }

  io.dataOut := dataMask.reduce(_|_)
}

class rrArbiter(inputNum: Int) extends Component{
  val io = new Bundle{
    val inputWidth = log2Up(inputNum)
    println(inputWidth, inputNum)

    val grantsEnIn = in Bool()
    val reqsIn = in Bits(inputNum bits)
    val grantsOut = out Bits(inputNum bits)
    val selOneHotOut = out Bits(inputNum bits)

    val yumIn = in Bool()
    val oneHotIndex = out UInt(inputWidth bits)
    val validOut = out Bool()
  }
  noIoPrefix()

  val reqsMask = Bits(inputNum bits)
  val maskHigerReq =  Bits(inputNum bits).noCombLoopCheck
  val unmaskHigerReq =  Bits(inputNum bits).noCombLoopCheck
  val maskSelOneHot =  Bits(inputNum bits)
  val unMaskSelOneHot =  Bits(inputNum bits)
  val noReqMask = Bool()
  val pointerReg = Reg(Bits(inputNum bits))

  pointerReg.init(B((inputNum-1 downto 0) -> true))
  when(reqsMask.orR){
    pointerReg := maskHigerReq
  }otherwise{
    when(io.reqsIn.orR){
      pointerReg := unmaskHigerReq
    }otherwise{
      pointerReg := pointerReg
    }
  }

  reqsMask := io.reqsIn & pointerReg
  maskHigerReq(inputNum-1 downto 1) := maskHigerReq(inputNum-2 downto 0) | reqsMask(inputNum-2 downto 0)
  maskHigerReq(0) := False
  maskSelOneHot := reqsMask & (~maskHigerReq)

  unmaskHigerReq(inputNum - 1 downto 1) := unmaskHigerReq(inputNum - 2 downto 0) | io.reqsIn(inputNum - 2 downto 0)
  unmaskHigerReq(0) := False
  unMaskSelOneHot := io.reqsIn & (~unmaskHigerReq)

  noReqMask := ~(reqsMask.orR)
  io.selOneHotOut := (B((inputNum-1 downto 0) -> noReqMask) & unMaskSelOneHot) | maskSelOneHot
  io.grantsOut := B((inputNum-1 downto 0) -> io.grantsEnIn) & io.selOneHotOut

  io.validOut := io.reqsIn.orR

  val oneHotIndex = Vec(UInt(io.inputWidth bits), inputNum)
  for(index <- 0 until  inputNum){
    when(io.selOneHotOut(index)){
      oneHotIndex(index) := index
    }otherwise{
      oneHotIndex(index) := 0
    }
  }
  io.oneHotIndex := oneHotIndex.reduce(_|_)
}

class meshRouterDorDecoder(XYOrder: Int, xCordinateWidth: Int, yCordinateWidth: Int, var dirNum: Int = 5,
                           var stubPort: ListBuffer[Boolean] = ListBuffer.fill(5)(false)) extends Component{
  val io = new Bundle{
    val validIn = in Vec(Bool(), dirNum)

    val xDirIn = in Vec(UInt(xCordinateWidth bits), dirNum)
    val yDirIn = in Vec(UInt(yCordinateWidth bits), dirNum)

    val myXCordIn = in UInt(xCordinateWidth bits)
    val myYCordIn = in UInt(yCordinateWidth bits)

    // request signals: format req[<input dir>][<output dir>]
    val reqOut = out Vec(Bits(dirNum bits), dirNum)
  }
  noIoPrefix()

  val xeq = Vec(Bool(), dirNum)
  val yeq = Vec(Bool(), dirNum)
  val xgt = Vec(Bool(), dirNum)
  val ygt = Vec(Bool(), dirNum)
  val xlt = Vec(Bool(), dirNum)
  val ylt = Vec(Bool(), dirNum)


  val validStud = Vec(Bool(), dirNum)
  for(index <- 0 until dirNum) {
    validStud(index) := io.validIn(index) & ~Bool(stubPort(index))
  }

  for(index <- 0 until dirNum){
    xeq(index) := io.xDirIn(index) === io.myXCordIn
    yeq(index) := io.yDirIn(index) === io.myYCordIn
    xgt(index) := io.xDirIn(index) > io.myXCordIn
    ygt(index) := io.yDirIn(index) > io.myYCordIn
    xlt(index) := (~xgt(index)) & (~xeq(index))
    ylt(index) := (~ygt(index)) & (~yeq(index))
  }


  // XY-Order Routing
  if(XYOrder == 1){
    import NocInterface.NocDirection._
    //import NocDirection._
    // X to Y
    for(index <- W to E){
      io.reqOut(index)(N) := validStud(index) & xeq(index) & ylt(index)
      io.reqOut(index)(S) := validStud(index) & xeq(index) & ygt(index)
    }

    // Y to X
    for (index <- N to S) {
      io.reqOut(index)(W) := False
      io.reqOut(index)(E) := False
    }

    // along the X
    for (index <- W to E) {
      io.reqOut(index)(W) := (if(index == W) False else validStud(index) & xlt(index))
      io.reqOut(index)(E) := (if(index == E) False else validStud(index) & xgt(index))
    }

    // along the Y
    for (index <- N to S) {
      io.reqOut(index)(N) := (if(index == N) False else validStud(index) & xeq(index) & ylt(index))
      io.reqOut(index)(S) := (if(index == S) False else validStud(index) & xeq(index) & ygt(index))
    }

    // from P
    io.reqOut(P)(E) := validStud(P) & xgt(P)  // ignore Y
    io.reqOut(P)(W) := validStud(P) & xlt(P)
  //  io.reqOut(P)(P) := validStud(P) & xeq(P) & yeq(P)
    io.reqOut(P)(P) := False
    io.reqOut(P)(N) := validStud(P) & xeq(P) & ylt(P)
    io.reqOut(P)(S) := validStud(P) & xeq(P) & ygt(P)

    // to P
    for (index <- W to S) {
      io.reqOut(index)(P) := validStud(index) & xeq(index) & yeq(index)
    }
  }

  // YX-Order Routing
  else if(XYOrder == 0){
    import NocInterface.NocDirection._
    for (index <- P to S) {
      // X to Y
      if(index == W  || index == E) {
        io.reqOut(index)(N) := False
        io.reqOut(index)(S) := False
      }

      // Y to X
      if(index == N  || index == S) {
        io.reqOut(index)(W) := validStud(index) & yeq(index) & xlt(index)
        io.reqOut(index)(E) := validStud(index) & yeq(index) & xgt(index)
      }

      // along the Y
      if(index == N  || index == S) {
        io.reqOut(index)(N) := (if (index == N) False else validStud(index) & ylt(index))
        io.reqOut(index)(S) := (if (index == S) False else validStud(index) & ygt(index))
      }

      // along the X
      if(index == W  || index == E) {
        io.reqOut(index)(W) := (if (index == W) False else validStud(index) & yeq(index) & xlt(index))
        io.reqOut(index)(E) := (if (index == E) False else validStud(index) & yeq(index) & xgt(index))
      }

      // from/to Dimension P
      if(index == P) {
        // from P
        io.reqOut(index)(S) := validStud(P) & ygt(P) // ignore X
        io.reqOut(index)(N) := validStud(P) & ylt(P)
        //  io.reqOut(index)(P) := validStud(P) & xeq(P) & yeq(P)
        io.reqOut(index)(P) := False
        io.reqOut(index)(W) := validStud(P) & yeq(P) & xlt(P)
        io.reqOut(index)(E) := validStud(P) & yeq(P) & xgt(P)

        // to P
        for(index2 <- W to S){
          io.reqOut(index2)(index) := validStud(index2) & xeq(index2) & yeq(index2)
        }
      }
    }
  }
}

class meshRouter(dataWidth: Int, XYOrder: Int, xCordinateWidth: Int, yCordinateWidth: Int, var dirNum: Int = 5,
                 var stubPort: ListBuffer[Boolean] = ListBuffer.fill(5)(false)) extends Component{
  val io = new Bundle{
    val dataIn = in Vec(Bits(dataWidth bits), dirNum)
    val validIn = in Vec(Bool(), dirNum)
    val yumiOut = out Vec(Bool(), dirNum)

    val readyIn = in Vec(Bool(), dirNum)
    val dataOut = out Vec(Bits(dataWidth bits), dirNum)
    val validOut = out Vec(Bool(), dirNum)

    val myXCordIn = in UInt(xCordinateWidth bits)
    val myYCordIn = in UInt(yCordinateWidth bits)
  }
  noIoPrefix()

  val xDirs = Vec(UInt(xCordinateWidth bits), dirNum)
  val yDirs = Vec(UInt(yCordinateWidth bits), dirNum)


  val readyInStub = Vec(Bool(), dirNum)
  val validInStub = Vec(Bool(), dirNum)
  for (index <- 0 until dirNum) {
    readyInStub(index) := io.readyIn(index) | Bool(stubPort(index))
//    validInStub(index) := io.validIn(index) | Bool(stubPort(index))
    validInStub(index) := io.validIn(index) & ~Bool(stubPort(index))
  }

  for(index <- 0 until dirNum){
    xDirs(index) := io.dataIn(index).asUInt(0 until xCordinateWidth)
    yDirs(index) := io.dataIn(index).asUInt(xCordinateWidth until xCordinateWidth+yCordinateWidth)
  }

  val dirReq = Vec(Bits(dirNum bits), dirNum)

  val meshDorRouting = new meshRouterDorDecoder(XYOrder=XYOrder, xCordinateWidth=xCordinateWidth,
                                                yCordinateWidth=yCordinateWidth, dirNum=dirNum, stubPort=stubPort)
  meshDorRouting.io.validIn <> validInStub
  meshDorRouting.io.myXCordIn <> io.myXCordIn
  meshDorRouting.io.myYCordIn <> io.myYCordIn
  meshDorRouting.io.xDirIn <> xDirs
  meshDorRouting.io.yDirIn <> yDirs
  meshDorRouting.io.reqOut <> dirReq

  var dataDirNum = ListBuffer[Int]()
  if(XYOrder == 1){
    dataDirNum = ListBuffer(5, 2, 2, 4, 4)
  }
  else if(XYOrder == 0){
    dataDirNum = ListBuffer(5, 4, 4, 2, 2)
  }

  val grantDirEnIn = Vec(Bool, dirNum)
  val reqDirIn = Vec(Bits(dataDirNum(0) bits), Bits(dataDirNum(1) bits), Bits(dataDirNum(2) bits), Bits(dataDirNum(3) bits), Bits(dataDirNum(4) bits))
//  val grantDirOut = Vec(Bits(dataDirNum(0) bits), Bits(dataDirNum(1) bits), Bits(dataDirNum(2) bits), Bits(dataDirNum(3) bits), Bits(dataDirNum(4) bits))
  val grantDirOut = Bits(5 bits)
  val selDirOut = Vec(Bits(dataDirNum(0) bits), Bits(dataDirNum(1) bits), Bits(dataDirNum(2) bits), Bits(dataDirNum(3) bits), Bits(dataDirNum(4) bits))
  val validDirOut = Vec(Bool, dirNum)
  val yumDirIn = Vec(Bool, dirNum)

  val myRRArbiter_P = new rrArbiter(inputNum = dataDirNum(0))
  val myRRArbiter_W = new rrArbiter(inputNum = dataDirNum(1))
  val myRRArbiter_E = new rrArbiter(inputNum = dataDirNum(2))
  val myRRArbiter_N = new rrArbiter(inputNum = dataDirNum(3))
  val myRRArbiter_S = new rrArbiter(inputNum = dataDirNum(4))

  // XY Dor-Routing
  if(XYOrder == 1){
    import NocInterface.NocDirection._
    //     0 1 2 3 4
    // P : p w e n s
    // W : p e
    // E : p w
    // N : p w e s
    // S : p w e n
    for(index <- P to S){
      grantDirEnIn(index) := readyInStub(index)
      yumDirIn(index) := validDirOut(index) & readyInStub(index)

      val dataDirIn = Vec(Bits(), dataDirNum(index))
      if(index == W){
        reqDirIn(index) := dirReq(E)(index) ## dirReq(P)(index)
        dataDirIn := Vec(io.dataIn(P), io.dataIn(E))

        myRRArbiter_W.io.reqsIn := reqDirIn(index)
        myRRArbiter_W.io.grantsEnIn := grantDirEnIn(index)
        myRRArbiter_W.io.yumIn := yumDirIn(index)
        grantDirOut(index) := (myRRArbiter_E.io.grantsOut(1) | myRRArbiter_N.io.grantsOut(1) | myRRArbiter_S.io.grantsOut(1) | myRRArbiter_P.io.grantsOut(1))// E_gnt_w | N_gnt_w | S_gnt_w | P_gnt_w
        selDirOut(index) := myRRArbiter_W.io.selOneHotOut(1) ## myRRArbiter_W.io.selOneHotOut(0) // E P
        validDirOut(index) := myRRArbiter_W.io.validOut
      }
      else if (index == E) {
        reqDirIn(index) := dirReq(W)(index) ## dirReq(P)(index)
        dataDirIn := Vec(io.dataIn(P), io.dataIn(W))

        myRRArbiter_E.io.reqsIn := reqDirIn(index)
        myRRArbiter_E.io.grantsEnIn := grantDirEnIn(index)
        myRRArbiter_E.io.yumIn := yumDirIn(index)
        grantDirOut(index) := (myRRArbiter_W.io.grantsOut(1) | myRRArbiter_N.io.grantsOut(2) | myRRArbiter_S.io.grantsOut(2) | myRRArbiter_P.io.grantsOut(2)) // W_gnt_e | N_gnt_e | S_gnt_e | P_gnt_e
        selDirOut(index) := myRRArbiter_E.io.selOneHotOut(1) ## myRRArbiter_E.io.selOneHotOut(0) // W P
        validDirOut(index) := myRRArbiter_E.io.validOut
      }
      else if (index == N) {
        reqDirIn(index) := dirReq(S)(index) ## dirReq(E)(index) ## dirReq(W)(index) ## dirReq(P)(index)
        dataDirIn := Vec(io.dataIn(P), io.dataIn(W), io.dataIn(E), io.dataIn(S))

        myRRArbiter_N.io.reqsIn := reqDirIn(index)
        myRRArbiter_N.io.grantsEnIn := grantDirEnIn(index)
        myRRArbiter_N.io.yumIn := yumDirIn(index)
        grantDirOut(index) := (myRRArbiter_S.io.grantsOut(3) | myRRArbiter_P.io.grantsOut(N)) // S_gnt_n | P_gnt_n
        selDirOut(index) := myRRArbiter_N.io.selOneHotOut(3) ## myRRArbiter_N.io.selOneHotOut(2) ## myRRArbiter_N.io.selOneHotOut(1) ## myRRArbiter_N.io.selOneHotOut(0) // S E W P
        validDirOut(index) := myRRArbiter_N.io.validOut
      }
      else if (index == S) {
        reqDirIn(index) := dirReq(N)(index) ## dirReq(E)(index) ## dirReq(W)(index) ## dirReq(P)(index)
        dataDirIn := Vec(io.dataIn(P), io.dataIn(W), io.dataIn(E), io.dataIn(N))

        myRRArbiter_S.io.reqsIn := reqDirIn(index)
        myRRArbiter_S.io.grantsEnIn := grantDirEnIn(index)
        myRRArbiter_S.io.yumIn := yumDirIn(index)
        grantDirOut(index) := (myRRArbiter_N.io.grantsOut(3) | myRRArbiter_P.io.grantsOut(S))// N_gnt_s | P_gnt_s
        selDirOut(index) := myRRArbiter_S.io.selOneHotOut(3) ## myRRArbiter_S.io.selOneHotOut(2) ## myRRArbiter_S.io.selOneHotOut(1) ## myRRArbiter_S.io.selOneHotOut(0) // N E W P
        validDirOut(index) := myRRArbiter_S.io.validOut
      }
      else if (index == P) {
        reqDirIn(index) := dirReq(S)(index) ## dirReq(N)(index) ## dirReq(E)(index) ## dirReq(W)(index) ## dirReq(P)(index)
        dataDirIn := Vec(io.dataIn(P), io.dataIn(W), io.dataIn(E), io.dataIn(N), io.dataIn(S))

        myRRArbiter_P.io.reqsIn := reqDirIn(index)
        myRRArbiter_P.io.grantsEnIn := grantDirEnIn(index)
        myRRArbiter_P.io.yumIn := yumDirIn(index)
        grantDirOut(index) := (myRRArbiter_E.io.grantsOut(P) | myRRArbiter_N.io.grantsOut(P) | myRRArbiter_S.io.grantsOut(P) | myRRArbiter_P.io.grantsOut(P) | myRRArbiter_W.io.grantsOut(P))
        selDirOut(index) := myRRArbiter_P.io.selOneHotOut(S) ## myRRArbiter_P.io.selOneHotOut(N) ## myRRArbiter_P.io.selOneHotOut(E) ## myRRArbiter_P.io.selOneHotOut(W) ## myRRArbiter_P.io.selOneHotOut(P)
        validDirOut(index) := myRRArbiter_P.io.validOut
      }


      val myMuxOneHot = new muxOneHot(dataNum = dataDirNum(index), dataWidth = dataWidth)
      myMuxOneHot.io.dataIn := dataDirIn
      myMuxOneHot.io.selOneHot := selDirOut(index)
      io.dataOut(index) := myMuxOneHot.io.dataOut
      io.yumiOut(index) := grantDirOut(index)
      io.validOut(index) := validDirOut(index)
    }
  }
  // YX Dor-Routing
  else if(XYOrder == 0){
    import NocInterface.NocDirection._
    for (index <- P to S) {
      grantDirEnIn(index) := readyInStub(index)
      yumDirIn(index) := validDirOut(index) & readyInStub(index)

      val dataDirIn = Vec(Bits(), dataDirNum(index))
      //     0 1 2 3 4
      // P : p w e n s
      // W : p e n s
      // E : p w n s
      // N : p s
      // S : p n

      if (index == W) {
        reqDirIn(index) := dirReq(S)(index) ## dirReq(N)(index) ## dirReq(E)(index) ## dirReq(P)(index)
        dataDirIn := Vec(io.dataIn(P), io.dataIn(E), io.dataIn(N), io.dataIn(S))

        myRRArbiter_W.io.reqsIn := reqDirIn(index)
        myRRArbiter_W.io.grantsEnIn := grantDirEnIn(index)
        myRRArbiter_W.io.yumIn := yumDirIn(index)
        grantDirOut(index) := (myRRArbiter_E.io.grantsOut(1) | myRRArbiter_P.io.grantsOut(1)) // E_gnt_w | P_gnt_w
        selDirOut(index) := myRRArbiter_W.io.selOneHotOut(3) ## myRRArbiter_W.io.selOneHotOut(2) ## myRRArbiter_W.io.selOneHotOut(1) ## myRRArbiter_W.io.selOneHotOut(0)// p e n s
        validDirOut(index) := myRRArbiter_W.io.validOut
      }
      else if (index == E) {
        reqDirIn(index) := dirReq(S)(index) ## dirReq(N)(index) ## dirReq(W)(index) ## dirReq(P)(index)
        dataDirIn := Vec(io.dataIn(P), io.dataIn(W), io.dataIn(N), io.dataIn(S))

        myRRArbiter_E.io.reqsIn := reqDirIn(index)
        myRRArbiter_E.io.grantsEnIn := grantDirEnIn(index)
        myRRArbiter_E.io.yumIn := yumDirIn(index)
        grantDirOut(index) := (myRRArbiter_W.io.grantsOut(1) | myRRArbiter_P.io.grantsOut(2)) // W_gnt_e | P_gnt_e
        selDirOut(index) := myRRArbiter_E.io.selOneHotOut(3) ## myRRArbiter_E.io.selOneHotOut(2) ## myRRArbiter_E.io.selOneHotOut(1) ## myRRArbiter_E.io.selOneHotOut(0) // p w n s
        validDirOut(index) := myRRArbiter_E.io.validOut
      }
      else if (index == N) {
        reqDirIn(index) := dirReq(S)(index) ## dirReq(P)(index)
        dataDirIn := Vec(io.dataIn(P), io.dataIn(S))

        myRRArbiter_N.io.reqsIn := reqDirIn(index)
        myRRArbiter_N.io.grantsEnIn := grantDirEnIn(index)
        myRRArbiter_N.io.yumIn := yumDirIn(index)
        grantDirOut(index) := (myRRArbiter_S.io.grantsOut(1) | myRRArbiter_W.io.grantsOut(2) | myRRArbiter_E.io.grantsOut(2) | myRRArbiter_P.io.grantsOut(3)) // S_gnt_n | W_gnt_n | E_gnt_n | P_gnt_n
        selDirOut(index) := myRRArbiter_N.io.selOneHotOut(1) ## myRRArbiter_N.io.selOneHotOut(0) // p s
        validDirOut(index) := myRRArbiter_N.io.validOut
      }
      else if (index == S) {
        reqDirIn(index) := dirReq(N)(index) ## dirReq(P)(index)
        dataDirIn := Vec(io.dataIn(P), io.dataIn(N))

        myRRArbiter_S.io.reqsIn := reqDirIn(index)
        myRRArbiter_S.io.grantsEnIn := grantDirEnIn(index)
        myRRArbiter_S.io.yumIn := yumDirIn(index)
        grantDirOut(index) := (myRRArbiter_N.io.grantsOut(1) | myRRArbiter_W.io.grantsOut(3) | myRRArbiter_E.io.grantsOut(3) | myRRArbiter_P.io.grantsOut(4)) // N_gnt_s | W_gnt_s | E_gnt_s | P_gnt_s
        selDirOut(index) := myRRArbiter_S.io.selOneHotOut(1) ## myRRArbiter_S.io.selOneHotOut(0) // p n
        validDirOut(index) := myRRArbiter_S.io.validOut
      }
      else if (index == P) {
        reqDirIn(index) := dirReq(S)(index) ## dirReq(N)(index) ## dirReq(E)(index) ## dirReq(W)(index) ## dirReq(P)(index)
        dataDirIn := Vec(io.dataIn(P), io.dataIn(W), io.dataIn(E), io.dataIn(N), io.dataIn(S))

        myRRArbiter_P.io.reqsIn := reqDirIn(index)
        myRRArbiter_P.io.grantsEnIn := grantDirEnIn(index)
        myRRArbiter_P.io.yumIn := yumDirIn(index)
        grantDirOut(index) := (myRRArbiter_E.io.grantsOut(P) | myRRArbiter_N.io.grantsOut(P) | myRRArbiter_S.io.grantsOut(P) | myRRArbiter_P.io.grantsOut(P) | myRRArbiter_W.io.grantsOut(P))
        selDirOut(index) := myRRArbiter_P.io.selOneHotOut(S) ## myRRArbiter_P.io.selOneHotOut(N) ## myRRArbiter_P.io.selOneHotOut(E) ## myRRArbiter_P.io.selOneHotOut(W) ## myRRArbiter_P.io.selOneHotOut(P)
        validDirOut(index) := myRRArbiter_P.io.validOut
      }

      val myMuxOneHot = new muxOneHot(dataNum = dataDirNum(index), dataWidth = dataWidth)
      myMuxOneHot.io.dataIn := dataDirIn
      myMuxOneHot.io.selOneHot := selDirOut(index)
      io.dataOut(index) := myMuxOneHot.io.dataOut
      io.yumiOut(index) := grantDirOut(index)
      io.validOut(index) := validDirOut(index)
    }
  }
}

case class bufferMeshRouterConfig(var dataWidth: Int = 32,
                                  var XYOrder: Int = 1,
                                  var xCordinateWidth: Int = 2,
                                  var yCordinateWidth: Int = 2,
                                  var dirNum: Int = 5,
                                  var stubPort: ListBuffer[Boolean] = ListBuffer.fill(5)(false),
                                  var repeaterOutput: ListBuffer[Boolean] = ListBuffer.fill(5)(false))

class bufferMeshRouter(config: bufferMeshRouterConfig) extends Component{
  val io = new Bundle{
    import NocInterface._
    val linkIn  = in Vec(readyAndLink(config.dataWidth), config.dirNum)
    val linkOut = out Vec(readyAndLink(config.dataWidth), config.dirNum)

    val myXCordIn = in UInt (config.xCordinateWidth bits)
    val myYCordIn = in UInt (config.yCordinateWidth bits)
  }
  noIoPrefix()

  import NocInterface._
  val linkInCast = Vec(readyAndLink(config.dataWidth), config.dirNum)
  val linkOutCast = Vec(readyAndLink(config.dataWidth), config.dirNum)

  io.linkOut := linkOutCast
  linkInCast := io.linkIn

  val  fifoValid = Vec(Bool(), config.dirNum)
  val  fifoData  = Vec(Bits(config.dataWidth bits), config.dirNum)
  val  fifoYumi = Vec(Bool(), config.dirNum)

  val validOut = Vec(Bool(), config.dirNum)
  val dataOut = Vec(Bits(config.dataWidth bits), config.dirNum)
  val readyIn = Vec(Bool(), config.dirNum)

  for(i <- 0 until config.dirNum){
    if(config.stubPort(i)== true) {
      fifoData(i) := 0
      fifoValid(i) := True
      linkOutCast(i).readyAndRev := False
    }else{
      val fifoTwo = new streamFifo(Bits(config.dataWidth bits), fifoDepth = 2)
      linkInCast(i).v <> fifoTwo.io.validIn
      linkInCast(i).data <> fifoTwo.io.dataIn
      linkOutCast(i).readyAndRev <> fifoTwo.io.readyOut
      fifoValid(i) <> fifoTwo.io.validOut
      fifoData(i) <> fifoTwo.io.dataOut
      fifoYumi(i) <> fifoTwo.io.yumiIn
    }

    if(config.repeaterOutput(i) == true && config.stubPort(i) == true){
      val dataTemp = Bits(config.dataWidth bits)
      val dataInv = new NocInventer(config.dataWidth)
      dataInv.io.ain <> dataOut(i)
      dataInv.io.aout <> dataTemp
      val dataRep = new NocInventer(config.dataWidth)
      dataRep.io.ain <> dataTemp
      dataRep.io.aout <> linkOutCast(i).data

    }else{
      linkOutCast(i).data := dataOut(i)
    }
    readyIn(i) := linkInCast(i).readyAndRev
    linkOutCast(i).v := validOut(i)

  }

  val meshRouterUnit = new meshRouter(dataWidth=config.dataWidth, XYOrder=config.XYOrder, xCordinateWidth=config.xCordinateWidth,
                                      yCordinateWidth=config.yCordinateWidth, dirNum=config.dirNum, stubPort=config.stubPort)
  meshRouterUnit.io.validIn <> fifoValid
  meshRouterUnit.io.dataIn <> fifoData
  meshRouterUnit.io.yumiOut <> fifoYumi
  meshRouterUnit.io.dataOut <> dataOut
  meshRouterUnit.io.validOut <> validOut
  meshRouterUnit.io.readyIn <> readyIn
  meshRouterUnit.io.myYCordIn <> io.myYCordIn
  meshRouterUnit.io.myXCordIn <> io.myXCordIn
}

case class meshNodeConfig(var dataWidth: Int = 32,
                          var xCordinateWidth: Int = 2,
                          var yCordinateWidth: Int = 2,
                          var addrWidth: Int = 32,
                          var loadIdWidth: Int = 10,
                          var numNets: Int = 2,
                          var dirNum: Int = 4,
                          var stubPort: ListBuffer[Boolean] = ListBuffer.fill(4)(false),
                          var repeaterOutput: ListBuffer[Boolean] = ListBuffer.fill(4)(false))

class meshNode(config: meshNodeConfig) extends Component{
  val io = new Bundle{
    import NocInterface._

    val mymeshLinkConfig = meshLinkConfig(addrWidth = config.addrWidth, dataWidth = config.dataWidth,
                                          xCordWidth = config.xCordinateWidth, yCordWidth = config.yCordinateWidth,
                                          loadIdWidth = config.loadIdWidth)

    val linkIn = in Vec(meshLink(mymeshLinkConfig), config.dirNum)

    val linkOut = out Vec(meshLink(mymeshLinkConfig), config.dirNum)

    val procLinkIn = in (meshLink(mymeshLinkConfig))

    val procLinkOut = out (meshLink(mymeshLinkConfig))

    val myXCordIn = in UInt (config.xCordinateWidth bits)
    val myYCordIn = in UInt (config.yCordinateWidth bits)
  }
  noIoPrefix()

  import NocInterface._

  val linkInCast = Vec(meshLink(io.mymeshLinkConfig), config.dirNum)
  val linkOutCast = Vec(meshLink(io.mymeshLinkConfig), config.dirNum)

  linkInCast := io.linkIn
  io.linkOut := linkOutCast

//  val myfwdLinkConfig = fwdLinkConfig(addrWidth = config.addrWidth, dataWidth = config.dataWidth,
//                                      xCordWidth = config.xCordinateWidth, yCordWidth = config.yCordinateWidth,
//                                      loadIdWidth = config.loadIdWidth)
//
//  val myrevLinkConfig = revLinkConfig(dataWidth = config.dataWidth,
//                                      xCordWidth = config.xCordinateWidth, yCordWidth = config.yCordinateWidth,
//                                      loadIdWidth = config.loadIdWidth)

  val myfwdLinkConfig = io.mymeshLinkConfig.meshFwdLinkConfig
  val myrevLinkConfig = io.mymeshLinkConfig.meshRevLinkConfig

  val linkFwdIn = Vec(fwdLink(myfwdLinkConfig), config.dirNum+1)
  val linkFwdOut = Vec(fwdLink(myfwdLinkConfig), config.dirNum+1)

  val linkRevIn = Vec(revLink(myrevLinkConfig), config.dirNum+1)
  val linkRevOut = Vec(revLink(myrevLinkConfig), config.dirNum+1)

  val procLinkLocalIn = meshLink(io.mymeshLinkConfig)
  val procLinkLocalOut = meshLink(io.mymeshLinkConfig)

  procLinkLocalOut := io.procLinkIn
  io.procLinkOut := procLinkLocalIn

  procLinkLocalIn.revlink := linkRevOut(0)
  procLinkLocalIn.fwdlink := linkFwdOut(0)

  linkFwdIn(0) := procLinkLocalOut.fwdlink
  linkRevIn(0) := procLinkLocalOut.revlink

  for(index <- 1 to config.dirNum){
    linkRevIn(index) := linkInCast(index-1).revlink
    linkFwdIn(index) := linkInCast(index-1).fwdlink
    linkOutCast(index-1).fwdlink := linkFwdOut(index)
    linkOutCast(index-1).revlink := linkRevOut(index)
  }

  for(i <- 0 until config.numNets){
    if(i == 0) { // package fwd
      val linkIn = Vec(readyAndLink(myfwdLinkConfig.fwdLinkDataWidth), config.dirNum + 1)
      val linkOut = Vec(readyAndLink(myfwdLinkConfig.fwdLinkDataWidth), config.dirNum + 1)

      for(j <- 0 to config.dirNum) {
        linkIn(j) := linkFwdIn(j).fwdPacket
        linkFwdOut(j).fwdPacket := linkOut(j)
      }
      val mybufferMeshRouterConfig = bufferMeshRouterConfig(dataWidth = myfwdLinkConfig.fwdLinkDataWidth,
                                                            XYOrder = 1,
                                                            xCordinateWidth = config.xCordinateWidth,
                                                            yCordinateWidth = config.yCordinateWidth,
                                                            stubPort = ListBuffer(false) ++ config.stubPort ,
                                                            repeaterOutput = ListBuffer(false) ++ config.repeaterOutput)
      val mymeshRouter = new bufferMeshRouter(mybufferMeshRouterConfig)

      mymeshRouter.io.myXCordIn := io.myXCordIn
      mymeshRouter.io.myYCordIn := io.myYCordIn

      mymeshRouter.io.linkIn := linkIn
      linkOut := mymeshRouter.io.linkOut

    }else{ // package rev
      val linkIn = Vec(readyAndLink(myrevLinkConfig.revLinkDataWidth), config.dirNum + 1)
      val linkOut = Vec(readyAndLink(myrevLinkConfig.revLinkDataWidth), config.dirNum + 1)

      for (j <- 0 to config.dirNum) {
        linkIn(j) := linkRevIn(j).revPacket
        linkRevOut(j).revPacket := linkOut(j)
      }

      val mybufferMeshRouterConfig = bufferMeshRouterConfig(dataWidth = myrevLinkConfig.revLinkDataWidth,
                                                            XYOrder = 0,
                                                            xCordinateWidth = config.xCordinateWidth,
                                                            yCordinateWidth = config.yCordinateWidth,
                                                            stubPort = ListBuffer(false) ++ config.stubPort ,
                                                            repeaterOutput = ListBuffer(false) ++ config.repeaterOutput)
      val mymeshRouter = new bufferMeshRouter(mybufferMeshRouterConfig)

      mymeshRouter.io.myXCordIn := io.myXCordIn
      mymeshRouter.io.myYCordIn := io.myYCordIn

      mymeshRouter.io.linkIn := linkIn
      linkOut := mymeshRouter.io.linkOut
    }
  }
}

case class meshEndpointConfig(var xCordinateWidth: Int = 2,
                              var yCordinateWidth: Int = 2,
                              var fifoDepth: Int = 4,
                              var returnedFifoEnable: Boolean = false,
                              var dataWidth: Int = 32,
                              var addrWidth: Int = 32,
                              var loadIdWidth: Int = 10,
                              var numNets: Int = 2
                              )

class meshEndpoint(config: meshEndpointConfig) extends Component{
  var io = new Bundle{
    import NocInterface._
    val mymeshLinkConfig = meshLinkConfig(addrWidth = config.addrWidth,
                                          dataWidth = config.dataWidth,
                                          xCordWidth = config.xCordinateWidth,
                                          yCordWidth = config.yCordinateWidth,
                                          loadIdWidth = config.loadIdWidth
                                          )

//    val mymeshPacketConfig = meshPacketConfig (addrWidth = config.addrWidth,
//      dataWidth = config.dataWidth,
//      xCordWidth = config.xCordinateWidth,
//      yCordWidth = config.yCordinateWidth,
//      loadIdWidth = config.loadIdWidth
//    )
//
//    val myreturnPacketConfig = returnPacketConfig(dataWidth = config.dataWidth,
//      xCordWidth = config.xCordinateWidth,
//      yCordWidth = config.yCordinateWidth,
//      loadIdWidth = config.loadIdWidth
//    )
    //mesh network
    val linkIn = in (meshLink(mymeshLinkConfig))
    val linkOut = out (meshLink(mymeshLinkConfig))

    // package
    //1. incoming packet from network(fifo) to local
    val fifoDataOut = out Bits(mymeshLinkConfig.meshFwdLinkConfig.fwdLinkDataWidth bits)
    val fifoDataValidOut = out Bool()
    val fifoDataYumIn = in Bool()
    val fifoDataFull = out Bool()
    //2. outgoing packet from local to network
    val outPacketIn = in Bits(mymeshLinkConfig.meshFwdLinkConfig.fwdLinkDataWidth bits)
    val outPacketValidIn = in Bool()
    val outPacketReadyOut = out Bool()

    // returned package
    // 1. returned data from network to local
    val returnedPacketOut = out Bits(mymeshLinkConfig.meshRevLinkConfig.revLinkDataWidth bits)
    val returnedCreditOut = out Bool()
    val returnedYumIn = in Bool()
    val returnedFifoFull= out Bool()
    // 2. returned data from local to network
    val returningPacketIn = in Bits(mymeshLinkConfig.meshRevLinkConfig.revLinkDataWidth bits)
    val returningPacketValidIn = in Bool()
    val returningPacketReadyOut = out Bool()
  }
  noIoPrefix()

  import NocInterface._
  val linkInCast = meshLink(io.mymeshLinkConfig)
  val linkOutCast = meshLink(io.mymeshLinkConfig)

  linkInCast := io.linkIn
  io.linkOut := linkOutCast

  /********* handle package from and to network  *******/
  // 1. fifo for incoming packet from network
  // buffer the incomfing packet
  val myFifoPacketIn = new streamFifo(Bits(io.mymeshLinkConfig.meshFwdLinkConfig.fwdLinkDataWidth bits),
                                      fifoDepth = 4)
  myFifoPacketIn.io.dataIn := linkInCast.fwdlink.fwdPacket.data
  myFifoPacketIn.io.validIn := linkInCast.fwdlink.fwdPacket.v
  linkOutCast.fwdlink.fwdPacket.readyAndRev := myFifoPacketIn.io.readyOut
  io.fifoDataOut := myFifoPacketIn.io.dataOut
  io.fifoDataValidOut := myFifoPacketIn.io.validOut
  myFifoPacketIn.io.yumiIn := io.fifoDataYumIn

  // 2. handle the outgoing packet to network
  linkOutCast.fwdlink.fwdPacket.data := io.outPacketIn
  linkOutCast.fwdlink.fwdPacket.v := io.outPacketValidIn
  io.outPacketReadyOut := linkInCast.fwdlink.fwdPacket.readyAndRev
  io.fifoDataFull := ~linkOutCast.fwdlink.fwdPacket.readyAndRev

  /********* handle package from local to network  *******/
  // 1. returned data  from local to network
  linkOutCast.revlink.revPacket.data := io.returningPacketIn
  linkOutCast.revlink.revPacket.v := io.returningPacketValidIn
  io.returningPacketReadyOut := linkInCast.revlink.revPacket.readyAndRev

  // 2. returned data from network
  // buffer the returend packet
  val returnedPacket = Bits (io.mymeshLinkConfig.meshRevLinkConfig.revLinkDataWidth bits)
  val returnedCredit = Bool()
  val returnedFifoReady = Bool()

  if(config.returnedFifoEnable == true){
    val myReturnedPacketFifo = new streamFifo(Bits(io.mymeshLinkConfig.meshRevLinkConfig.revLinkDataWidth bits),
                                              fifoDepth = 2)
    myReturnedPacketFifo.io.dataIn := linkInCast.revlink.revPacket.data
    myReturnedPacketFifo.io.validIn := linkInCast.revlink.revPacket.v
    returnedFifoReady := myReturnedPacketFifo.io.readyOut
    myReturnedPacketFifo.io.yumiIn := io.returnedYumIn
    returnedPacket := myReturnedPacketFifo.io.dataOut
    returnedCredit := myReturnedPacketFifo.io.validOut

    io.returnedFifoFull := ~returnedFifoReady
    linkOutCast.revlink.revPacket.readyAndRev := returnedFifoReady
  }else{
    val returnedPacketReg = Reg(Bits(io.mymeshLinkConfig.meshRevLinkConfig.revLinkDataWidth bits))
    val returnedCreditReg = Reg(Bool()) init False

    returnedPacketReg := linkInCast.revlink.revPacket.data
    returnedCreditReg := linkInCast.revlink.revPacket.v

    returnedPacket := returnedPacketReg
    returnedCredit := returnedCreditReg

    //always can handle the returned packet (like cpu or memory)
    io.returnedFifoFull := True
    linkOutCast.revlink.revPacket.readyAndRev := True
  }

  io.returnedCreditOut := returnedCredit
  io.returnedPacketOut := returnedPacket
}

case class muxeLockConfig(var dataWidth: Int = 32,
                          var addrWidth: Int = 32,
                          var xCordinateWidth: Int = 2,
                          var yCordinateWidth: Int = 2,
                          var maxCredit: Int = 100
                         )
class muxeLock (config: muxeLockConfig) extends Component {
  val io = new Bundle {
    //local incoming data
    val validIn = in Bool()
    val yumiOut = out Bool()
    val dataIn = in Bits (config.dataWidth bits)
    val maskIn = in Bits (config.dataWidth >> 3 bits)
    val addrIn = in UInt (config.addrWidth bits)
    val weIn = in Bool()

    val swapAqIn = in Bool()
    val swapRlIn = in Bool()
    val xCordinateIn = in Bits (config.xCordinateWidth bits)
    val yCordinateIn = in Bits (config.yCordinateWidth bits)

    //combined incoming data
    val combvalidOut = out Bool()
    val combyumiIn = in Bool()
    val combdataOut = out Bits (config.dataWidth bits)
    val combmaskOut = out Bits (config.dataWidth >> 3 bits)
    val combaddrOut = out UInt (config.addrWidth bits)
    val combweOut = out Bool()
    val combxCordinateOut = out Bits (config.xCordinateWidth bits)
    val combyCordinateOut = out Bits (config.yCordinateWidth bits)

    // read memory data
    val returningDataIn = in Bits (config.dataWidth bits)
    val returningValidIn = in Bool()

    // output the read value
    val combReturningDataOut = out Bits (config.dataWidth bits)
    val combReturningValidOut = out Bool()
  }
  noIoPrefix()

  val swapAddr = Reg(UInt(config.addrWidth bits))
  val swapXCordinate = Reg(Bits(config.xCordinateWidth bits))
  val swapYCordinate = Reg(Bits(config.yCordinateWidth bits))
  val swapLock = Reg(Bool()) init False

  val nodeIsIdle = Bool()
  val swapAqYumi = io.validIn & io.swapAqIn & nodeIsIdle
  val swapAqSuccess = swapAqYumi & (~swapLock)
  val swapAqFail = swapAqYumi & swapLock

  val swapMatch = (swapAddr === io.addrIn) &
                  (swapXCordinate === io.xCordinateIn) &
                  (swapYCordinate === io.yCordinateIn)
  val swapRlYumi = io.validIn & io.swapRlIn & nodeIsIdle
  val swapRlSuccess = swapAqYumi

  when(swapAqSuccess) {
    swapAddr := io.addrIn
    swapXCordinate := io.xCordinateIn
    swapYCordinate := io.yCordinateIn
    swapLock := True
  } elsewhen(swapRlSuccess){
    swapAddr := 0
    swapXCordinate := 0
    swapYCordinate := 0
    swapLock := False
  }

  // to endpoint
  io.yumiOut := swapRlYumi | swapRlYumi | io.combyumiIn

  // to local: e.g. memory
  io.combvalidOut := io.validIn & (~(io.swapAqIn | io.swapRlIn))
  io.combdataOut := io.dataIn
  io.combmaskOut := io.maskIn
  io.combaddrOut := io.addrIn
  io.combxCordinateOut := io.xCordinateIn
  io.combyCordinateOut := io.yCordinateIn
  io.combweOut := io.weIn

  // returning data to endpoint
  val swapResultValid = Reg(Bool()) init False
  val swapAqResult = Reg(Bool()) init False

  val lockSucessEncode = False
  val lockFailEncode = True

  swapResultValid := swapAqYumi | swapRlYumi
  swapAqResult := swapAqSuccess ? lockSucessEncode | lockFailEncode

  io.combReturningValidOut := swapResultValid | io.returningValidIn
  io.combReturningDataOut := swapResultValid ? B(swapAqResult).resized | io.returningDataIn

  // use a counter th track the request number
  val requestNumInNode = UInt(log2Up(config.maxCredit+1) bits)
  val myCounterUpDown = new counterUpDown(maxValue = config.maxCredit,
                                          maxStep = 1,
                                          initValue = config.maxCredit)
  myCounterUpDown.io.downIn := io.combyumiIn.asUInt
  myCounterUpDown.io.upIn := io.returningValidIn.asUInt
  requestNumInNode := myCounterUpDown.io.countOut

  nodeIsIdle := requestNumInNode === config.maxCredit
}

case class meshEndpointStandardConfig(var xCordinateWidth: Int = 2,
                                      var yCordinateWidth: Int = 2,
                                      var fifoDepth: Int = 4,
                                      var returnedFifoEnable: Boolean = false,
                                      var dataWidth: Int = 32,
                                      var addrWidth: Int = 32,
                                      var loadIdWidth: Int = 10,
                                      var numNets: Int = 2,
                                      var maxCredit: Int = 16
                                     )

class meshEndpointStandard(config: meshEndpointStandardConfig) extends Component{
  val io = new Bundle{
    import NocInterface._
    val mymeshLinkConfig = meshLinkConfig(addrWidth = config.addrWidth,
      dataWidth = config.dataWidth,
      xCordWidth = config.xCordinateWidth,
      yCordWidth = config.yCordinateWidth,
      loadIdWidth = config.loadIdWidth
    )

    //mesh network links
    val linkIn = in(meshLink(mymeshLinkConfig))
    val linkOut = out(meshLink(mymeshLinkConfig))

    //1-1. in request from network to local
    val validOut = out Bool()
    val yumiIn = in Bool()
    val dataOut = out Bits (config.dataWidth bits)
    val maskOut = out Bits (config.dataWidth >> 3 bits)
    val addrOut = out UInt (config.addrWidth bits)
    val weOut = out Bool()
    val xCordinateOut = out Bits (config.xCordinateWidth bits)
    val yCordinateOut = out Bits (config.yCordinateWidth bits)

    //1-2. out response to network from local
    val returningDataIn = in Bits (config.dataWidth bits)
    val returningValidIn = in Bool()


    //2-1. out request to network from local
    val outOp = in Bits(ePacketOp.packetOpTypeWidth bits)
    val outOpEx = in Bits(config.dataWidth >> 3 bits)
    val outAddr = in Bits(config.addrWidth bits)
    val outPayLoadDataIn = in Bits(config.dataWidth bits)
    val outSrcXCord = in Bits(config.xCordinateWidth bits)
    val outSrcYCord = in Bits(config.yCordinateWidth bits)
    val outMyXCord = in Bits(config.xCordinateWidth bits)
    val outMyYCord = in Bits(config.yCordinateWidth bits)
    val outPacketValidIn = in Bool()
    val outPacketReadyOut = out Bool()

    // 2-2. in response from network to local
    // 1. returned data from local to network
    val returnedDataOut = out Bits (config.dataWidth bits)
    val returnedLoadIdOut = out Bits(config.loadIdWidth bits)
    val returnedValidOut = out Bool()
    val returnedYumIn = in Bool()
    val returnedFifoFullout = out Bool()
    val creditOut = out UInt (log2Up(config.maxCredit+1) bits)

    //tile cordinates in network
    val myXCordinate = in Bits(config.xCordinateWidth bits)
    val myYCordinate = in Bits(config.yCordinateWidth bits)
  }
  noIoPrefix()

  import NocInterface._
  val mymeshPacketConfig = new meshPacketConfig(addrWidth = config.addrWidth,
    dataWidth = config.dataWidth,
    xCordWidth = config.xCordinateWidth,
    yCordWidth = config.yCordinateWidth,
    loadIdWidth = config.loadIdWidth)
  val tempPacketData = new meshPacket(mymeshPacketConfig)
  val tempPacketDataValid = Bool()
  val tempPacketYumi = Bool()
  val tempPacketFifoFull = Bool()

  val mymeshReturnedPacketConfig = new returnPacketConfig(dataWidth = config.dataWidth,
    xCordWidth = config.xCordinateWidth,
    yCordWidth = config.yCordinateWidth,
    loadIdWidth = config.loadIdWidth)

  val tempReturnedPacket =  new returnPacket(mymeshReturnedPacketConfig)
  val tempReturnedYumi =  Bool()
  val tempReturnedCredit =  Bool()

  val tempReturningPacket =  Bits (io.mymeshLinkConfig.meshRevLinkConfig.revLinkDataWidth bits)
  val tempReturningPacketValid =  Bool()
  val tempReturningPacketReady =  Bool()

  val tempoutPacketIn = Bits (io.mymeshLinkConfig.meshFwdLinkConfig.fwdLinkDataWidth bits)

  tempoutPacketIn := io.outAddr ## io.outOp ## io.outOpEx ## io.outPayLoadDataIn ## io.outMyYCord ## io.outMyXCord ## io.outSrcYCord ## io.outSrcXCord

  val returnedCredit = Bool()
  returnedCredit := tempReturnedCredit & tempReturnedYumi

  val mymeshEndpointConfig = meshEndpointConfig(xCordinateWidth = config.xCordinateWidth,
                                                yCordinateWidth = config.yCordinateWidth,
                                                fifoDepth = config.fifoDepth,
                                                returnedFifoEnable = config.returnedFifoEnable,
                                                dataWidth = config.dataWidth,
                                                addrWidth = config.addrWidth,
                                                loadIdWidth = config.loadIdWidth,
                                                numNets = config.numNets)

  val myEndpoint = new meshEndpoint(mymeshEndpointConfig)
  myEndpoint.io.linkIn := io.linkIn
  io.linkOut := myEndpoint.io.linkOut
  myEndpoint.io.fifoDataYumIn := tempPacketYumi

  tempPacketData.srcXCord := myEndpoint.io.fifoDataOut(0, mymeshPacketConfig.xCordWidth bits)
  tempPacketData.srcYCord := myEndpoint.io.fifoDataOut(mymeshPacketConfig.xCordWidth, mymeshPacketConfig.yCordWidth bits)
  tempPacketData.myXCord := myEndpoint.io.fifoDataOut(mymeshPacketConfig.xCordWidth+mymeshPacketConfig.yCordWidth, mymeshPacketConfig.xCordWidth bits)
  tempPacketData.myYCord := myEndpoint.io.fifoDataOut(mymeshPacketConfig.xCordWidth+mymeshPacketConfig.yCordWidth+mymeshPacketConfig.xCordWidth, mymeshPacketConfig.yCordWidth bits)
  tempPacketData.payload.data := myEndpoint.io.fifoDataOut(2*mymeshPacketConfig.xCordWidth+2*mymeshPacketConfig.yCordWidth, mymeshPacketConfig.dataWidth bits)
  tempPacketData.opEx := myEndpoint.io.fifoDataOut(2*mymeshPacketConfig.xCordWidth+2*mymeshPacketConfig.yCordWidth+mymeshPacketConfig.dataWidth, mymeshPacketConfig.opExWidth bits)
  tempPacketData.op := myEndpoint.io.fifoDataOut(2*mymeshPacketConfig.xCordWidth+2*mymeshPacketConfig.yCordWidth+mymeshPacketConfig.dataWidth+mymeshPacketConfig.opExWidth, ePacketOp.packetOpTypeWidth bits)
  tempPacketData.addr := myEndpoint.io.fifoDataOut(2*mymeshPacketConfig.xCordWidth+2*mymeshPacketConfig.yCordWidth+mymeshPacketConfig.dataWidth+mymeshPacketConfig.opExWidth+ePacketOp.packetOpTypeWidth, mymeshPacketConfig.addrWidth bits)

  tempPacketDataValid := myEndpoint.io.fifoDataValidOut
  tempPacketFifoFull := myEndpoint.io.fifoDataFull
  myEndpoint.io.outPacketIn := tempoutPacketIn
  myEndpoint.io.outPacketValidIn := io.outPacketValidIn
  io.outPacketReadyOut := myEndpoint.io.outPacketReadyOut
  myEndpoint.io.returnedYumIn := tempReturnedYumi

  tempReturnedPacket.xCord := myEndpoint.io.returnedPacketOut(0, mymeshReturnedPacketConfig.xCordWidth bits)
  tempReturnedPacket.yCord := myEndpoint.io.returnedPacketOut(mymeshReturnedPacketConfig.xCordWidth, mymeshReturnedPacketConfig.yCordWidth bits)
  tempReturnedPacket.loadId := myEndpoint.io.returnedPacketOut(mymeshReturnedPacketConfig.xCordWidth + mymeshReturnedPacketConfig.yCordWidth, mymeshReturnedPacketConfig.loadIdWidth bits)
  tempReturnedPacket.data := myEndpoint.io.returnedPacketOut(mymeshReturnedPacketConfig.loadIdWidth + mymeshReturnedPacketConfig.xCordWidth + mymeshReturnedPacketConfig.yCordWidth, mymeshReturnedPacketConfig.dataWidth bits)
  tempReturnedPacket.pktTyple := myEndpoint.io.returnedPacketOut(mymeshReturnedPacketConfig.loadIdWidth + mymeshReturnedPacketConfig.xCordWidth + mymeshReturnedPacketConfig.yCordWidth + mymeshReturnedPacketConfig.dataWidth, ePacketType.packetTypeWidth bits)

  tempReturnedCredit := myEndpoint.io.returnedCreditOut
  io.returnedFifoFullout := myEndpoint.io.returnedFifoFull
  myEndpoint.io.returningPacketIn := tempReturningPacket
  myEndpoint.io.returningPacketValidIn := tempReturningPacketValid
  tempReturningPacketReady := myEndpoint.io.returningPacketReadyOut


  // handle in request
  val tempvalidIn = Bool()
  val tempyumiOut = Bool()
  val tempdataIn = Bits (config.dataWidth bits)
  val tempmaskIn = Bits (config.dataWidth >> 3 bits)
  val tempaddrIn = UInt (config.addrWidth bits)
  val tempweIn = Bool()
  val tempswapAqIn = Bool()
  val tempswapRlIn = Bool()
  val tempRemoteLoad = Bool()
  val tempRemoteStroe = Bool()
  val tempxCordinateIn = Bits (config.xCordinateWidth bits)
  val tempyCordinateIn = Bits (config.yCordinateWidth bits)
  val tempcombReturningDataOut = Bits (config.dataWidth bits)
  val tempcombReturneingValidOut = Bool()

  tempdataIn := tempPacketData.payload.data
  tempaddrIn := tempPacketData.addr.asUInt
  tempmaskIn := tempPacketData.opEx
  tempswapAqIn := tempPacketDataValid & (tempPacketData.op.asUInt === ePacketOp.remoteSwapaq)
  tempswapRlIn := tempPacketDataValid & (tempPacketData.op.asUInt === ePacketOp.remoteSwaprl)
  tempRemoteStroe := tempPacketDataValid & (tempPacketData.op.asUInt === ePacketOp.remoteStore)
  tempRemoteLoad := tempPacketDataValid & (tempPacketData.op.asUInt === ePacketOp.remoteLoad)
  tempweIn := tempRemoteStroe
  tempxCordinateIn := tempPacketData.srcXCord
  tempyCordinateIn := tempPacketData.srcYCord

  val myLockConfig = new muxeLockConfig(dataWidth = config.dataWidth,
                                        addrWidth = config.addrWidth,
                                        xCordinateWidth = config.xCordinateWidth,
                                        yCordinateWidth = config.yCordinateWidth,
                                        maxCredit = config.maxCredit
                                        )
  val myMuxeLock = new muxeLock(myLockConfig)
  myMuxeLock.io.validIn := tempvalidIn
  myMuxeLock.io.dataIn := tempdataIn
  myMuxeLock.io.maskIn := tempmaskIn
  myMuxeLock.io.addrIn := tempaddrIn
  myMuxeLock.io.weIn := tempweIn
  tempyumiOut := myMuxeLock.io.yumiOut
  myMuxeLock.io.swapAqIn := tempswapAqIn
  myMuxeLock.io.swapRlIn := tempswapRlIn
  myMuxeLock.io.xCordinateIn := tempxCordinateIn
  myMuxeLock.io.yCordinateIn := tempyCordinateIn
  myMuxeLock.io.combyumiIn := io.yumiIn
  io.validOut := myMuxeLock.io.combvalidOut
  io.dataOut := myMuxeLock.io.combdataOut
  io.maskOut := myMuxeLock.io.combmaskOut
  io.addrOut := myMuxeLock.io.combaddrOut
  io.weOut := myMuxeLock.io.combweOut
  io.xCordinateOut := myMuxeLock.io.combxCordinateOut
  io.yCordinateOut := myMuxeLock.io.combyCordinateOut
  myMuxeLock.io.returningValidIn := io.returningValidIn
  myMuxeLock.io.returningDataIn := io.returningDataIn
  tempcombReturningDataOut := myMuxeLock.io.combReturningDataOut
  tempcombReturneingValidOut := myMuxeLock.io.combReturningValidOut

  val myreturningCreditConfig = returningCreditConfig(config.xCordinateWidth,config.yCordinateWidth,config.loadIdWidth)
  val rcFifoli = new returningCredit(myreturningCreditConfig)
  val rcFifolo = new returningCredit(myreturningCreditConfig)
  val rcFifoReadyOut, rcFifoValidOut, rcFifoYumiIn = Bool()
  val returningDataRequest = Bool()

  tempPacketYumi := tempyumiOut & (rcFifoReadyOut & tempReturningPacketReady)
  tempvalidIn := tempPacketDataValid & (rcFifoReadyOut & tempReturningPacketReady)

  returningDataRequest := tempRemoteLoad | tempswapAqIn
  rcFifoli.packetType := (returningDataRequest ? B(ePacketType.packetTypeData) | B(ePacketType.packetTypeCredit))

  rcFifoli.xCordinate := tempPacketData.myXCord
  rcFifoli.yCordinate := tempPacketData.myYCord
  rcFifoli.loadId :=  tempPacketData.payload.loadId

  val myreturnCreditFifo = new streamFifo(Bits(rcFifoli.getWidth() bits), fifoDepth = 2)
  myreturnCreditFifo.io.dataIn := rcFifoli.loadId ## rcFifoli.yCordinate ## rcFifoli.xCordinate ## rcFifoli.packetType
  myreturnCreditFifo.io.validIn := tempPacketYumi
  rcFifoReadyOut := myreturnCreditFifo.io.readyOut
  myreturnCreditFifo.io.yumiIn := rcFifoYumiIn

  rcFifoValidOut := myreturnCreditFifo.io.validOut
  rcFifolo.packetType := myreturnCreditFifo.io.dataOut(0, ePacketType.packetTypeWidth bits)
  rcFifolo.xCordinate := myreturnCreditFifo.io.dataOut(ePacketType.packetTypeWidth, myreturningCreditConfig.xCordWidth bits)
  rcFifolo.yCordinate := myreturnCreditFifo.io.dataOut(ePacketType.packetTypeWidth + myreturningCreditConfig.xCordWidth, myreturningCreditConfig.yCordWidth bits)
  rcFifolo.loadId := myreturnCreditFifo.io.dataOut(ePacketType.packetTypeWidth+myreturningCreditConfig.xCordWidth+myreturningCreditConfig.yCordWidth,  myreturningCreditConfig.loadIdWidth bits)

  //need a 1cycle hold
  val holdReturningData = Bits(config.dataWidth bits)
  val holdReturningDataValid = Bool()

  val myHold1Cycle = new holdDataCycle(Bits(config.dataWidth bits), holdCycle =1)
  myHold1Cycle.io.dataIn := tempcombReturningDataOut
  myHold1Cycle.io.validIn := tempcombReturneingValidOut
  myHold1Cycle.io.holdIn := holdReturningDataValid & (~tempReturningPacketReady)
  holdReturningDataValid := myHold1Cycle.io.validOut
  holdReturningData := myHold1Cycle.io.dataOut

  val loadStoreReady = holdReturningDataValid
  rcFifoYumiIn := rcFifoValidOut & tempReturningPacketReady & loadStoreReady
  tempReturningPacketValid := rcFifoValidOut & loadStoreReady

  val returningPacketCase = new returnPacket(mymeshReturnedPacketConfig)
  returningPacketCase.pktTyple := rcFifolo.packetType
  returningPacketCase.data := holdReturningData
  returningPacketCase.xCord := rcFifolo.xCordinate
  returningPacketCase.yCord := rcFifolo.yCordinate
  returningPacketCase.loadId := rcFifolo.loadId

  tempReturningPacket := returningPacketCase.pktTyple ## returningPacketCase.data ## returningPacketCase.loadId ## returningPacketCase.yCord ## returningPacketCase.xCord
  // handle returned credit and data
  val launchOut = io.outPacketValidIn & io.outPacketReadyOut
  val mycounterUpDown = new counterUpDown(maxValue = config.maxCredit, maxStep = 1, initValue = config.maxCredit)
  mycounterUpDown.io.downIn := launchOut.asUInt
  mycounterUpDown.io.upIn := returnedCredit.asUInt
  io.creditOut := mycounterUpDown.io.countOut
  io.returnedDataOut := tempReturnedPacket.data
  io.returnedLoadIdOut := tempReturnedPacket.loadId
  io.returnedValidOut := tempReturnedCredit & (tempReturnedPacket.pktTyple.asUInt === ePacketType.packetTypeData)
  tempReturnedYumi := io.returnedYumIn | (tempReturnedCredit & ~(tempReturnedPacket.pktTyple.asUInt === ePacketType.packetTypeData))
}

case class meshLinkTieoffConfig(var addrWidth: Int = 32,
                                var dataWidth: Int = 32,
                                var xCordinateWidth: Int = 2,
                                var yCordinateWidth: Int = 2,
                                var loadIdWidth: Int = 10)

class meshLinkTieoff(config: meshLinkTieoffConfig) extends Component{
  val io = new Bundle{

    import NocInterface._

    val mymeshLinkConfig = meshLinkConfig(addrWidth = config.addrWidth,
      dataWidth = config.dataWidth,
      xCordWidth = config.xCordinateWidth,
      yCordWidth = config.yCordinateWidth,
      loadIdWidth = config.loadIdWidth
    )

    //mesh network links
    val linkIn = in(meshLink(mymeshLinkConfig))
    val linkOut = out(meshLink(mymeshLinkConfig))
  }
  noIoPrefix()

  import NocInterface._

  val linkInCast = meshLink(io.mymeshLinkConfig)
  val linkOutCast = meshLink(io.mymeshLinkConfig)

  linkInCast := io.linkIn
  io.linkOut := linkOutCast

  val mymeshPacketConfig = new meshPacketConfig(addrWidth = config.addrWidth,
    dataWidth = config.dataWidth,
    xCordWidth = config.xCordinateWidth,
    yCordWidth = config.yCordinateWidth,
    loadIdWidth = config.loadIdWidth)
//  val mymeshReturnedPacketConfig = new returnPacketConfig(dataWidth = config.dataWidth,
//    xCordWidth = config.xCordinateWidth,
//    yCordWidth = config.yCordinateWidth,
//    loadIdWidth = config.loadIdWidth)

  val tempReturnPktType = B(ePacketType.packetTypeCredit, ePacketType.packetTypeWidth bits)
  val tempReturnData = B(0, mymeshPacketConfig.dataWidth bits)
  val tempReturnSrcXCord =  linkInCast.fwdlink.fwdPacket.data(ePacketOp.packetOpTypeWidth + mymeshPacketConfig.opExWidth +
    mymeshPacketConfig.addrWidth + mymeshPacketConfig.dataWidth, mymeshPacketConfig.xCordWidth bits)
  val tempReturnSrcYCord = linkInCast.fwdlink.fwdPacket.data(ePacketOp.packetOpTypeWidth + mymeshPacketConfig.opExWidth +
    mymeshPacketConfig.addrWidth + mymeshPacketConfig.dataWidth + mymeshPacketConfig.xCordWidth, mymeshPacketConfig.yCordWidth bits)
  val tempReturnLoadId = B(0, mymeshPacketConfig.loadIdWidth bits)

  linkOutCast.fwdlink.fwdPacket.v  := False
  linkOutCast.fwdlink.fwdPacket.data := B(0).resized
  linkOutCast.fwdlink.fwdPacket.readyAndRev := linkInCast.revlink.revPacket.readyAndRev
  linkOutCast.revlink.revPacket.v := linkInCast.fwdlink.fwdPacket.v
  linkOutCast.revlink.revPacket.data := tempReturnLoadId ## tempReturnSrcYCord ## tempReturnSrcXCord ## tempReturnData ## tempReturnPktType
  linkOutCast.revlink.revPacket.readyAndRev := True

}

case class meshNetworkConfig(var addrWidth: Int = 32,
                             var dataWidth: Int = 32,
                             var xCordinateWidth: Int = 2,
                             var yCordinateWidth: Int = 2,
                             var loadIdWidth: Int = 10)

class meshNetwork(config: meshNetworkConfig) extends Component {
  val io = new Bundle {
    import NocInterface._
    val mymeshLinkConfig = meshLinkConfig(addrWidth = config.addrWidth,
      dataWidth = config.dataWidth,
      xCordWidth = config.xCordinateWidth,
      yCordWidth = config.yCordinateWidth,
      loadIdWidth = config.loadIdWidth
    )
    //{S,N,E,W,P=0}
    //The location of leftUpCorner = (x=0, y=0)

    //mesh network links
    val westLinkIn = in Vec(meshLink(mymeshLinkConfig), config.yCordinateWidth)
    val westLinkOut = out Vec(meshLink(mymeshLinkConfig), config.yCordinateWidth)
    val eastLinkIn = in Vec(meshLink(mymeshLinkConfig), config.yCordinateWidth)
    val eastLinkOut = out Vec(meshLink(mymeshLinkConfig), config.yCordinateWidth)
    val northLinkIn = in Vec(meshLink(mymeshLinkConfig), config.xCordinateWidth)
    val northLinkOut = out Vec(meshLink(mymeshLinkConfig), config.xCordinateWidth)
    val southLinkIn = in Vec(meshLink(mymeshLinkConfig), config.xCordinateWidth)
    val southLinkOut = out Vec(meshLink(mymeshLinkConfig), config.xCordinateWidth)

    // local port
    val localLinkIn = in Vec(Vec(meshLink(mymeshLinkConfig), config.yCordinateWidth),config.xCordinateWidth)
    val localLinkOut = out Vec(Vec(meshLink(mymeshLinkConfig), config.yCordinateWidth),config.xCordinateWidth)
  }
  noIoPrefix()

  import NocInterface._
  import NocInterface.NocDirection._

  val mymeshLinkConfig = meshNodeConfig(addrWidth = config.addrWidth,
    dataWidth = config.dataWidth,
    xCordinateWidth = config.xCordinateWidth,
    yCordinateWidth = config.yCordinateWidth,
    loadIdWidth = config.loadIdWidth,
    numNets = 2,
    dirNum = 4,
    stubPort = ListBuffer.fill(4)(false),
    repeaterOutput = ListBuffer.fill(4)(false))

  val nodeMeshLinkIn = Vec(Vec(Vec(meshLink(io.mymeshLinkConfig), mymeshLinkConfig.dirNum), config.yCordinateWidth+2),config.xCordinateWidth+2)
  val nodeMeshLinkOut = Vec(Vec(Vec(meshLink(io.mymeshLinkConfig), mymeshLinkConfig.dirNum), config.yCordinateWidth+2),config.xCordinateWidth+2)
  val nodelocalLinkIn = Vec(Vec(meshLink(io.mymeshLinkConfig), config.yCordinateWidth),config.xCordinateWidth)
  val nodelocalLinkOut = Vec(Vec(meshLink(io.mymeshLinkConfig), config.yCordinateWidth),config.xCordinateWidth)

  // instantiate mesh node
  for(x <- 0 until config.xCordinateWidth){
    for(y <- 0 until config.yCordinateWidth){
        val myMeshNode = new meshNode(mymeshLinkConfig)
        myMeshNode.io.myXCordIn := x
        myMeshNode.io.myYCordIn := y
        myMeshNode.io.linkIn := nodeMeshLinkIn(x+1)(y+1)
        nodeMeshLinkOut(x+1)(y+1) := myMeshNode.io.linkOut
        myMeshNode.io.procLinkIn := nodelocalLinkIn(x)(y)
        nodelocalLinkOut(x)(y) := myMeshNode.io.procLinkOut
    }
  }

  // linking among mesh nodes
  for (x <- 1 to config.xCordinateWidth) {
    for (y <- 1 to config.yCordinateWidth) {
      nodelocalLinkIn(x - 1)(y - 1) := io.localLinkIn(x - 1)(y - 1)
      io.localLinkOut(x - 1)(y - 1) := nodelocalLinkOut(x - 1)(y - 1)

      if(x == 1){
        nodeMeshLinkIn(x-1)(y)(E - 1) := nodeMeshLinkOut(x)(y)(W - 1)
        nodeMeshLinkOut(x-1)(y)(E - 1) := io.westLinkIn(y-1)
        io.westLinkOut(y-1) := nodeMeshLinkIn(x-1)(y)(E - 1)
      }
      if (x == config.xCordinateWidth) {
        nodeMeshLinkIn(x + 1)(y)(W - 1) := nodeMeshLinkOut(x)(y)(E - 1)
        nodeMeshLinkOut(x + 1)(y)(W - 1) := io.eastLinkIn(y-1)
        io.eastLinkOut(y-1) := nodeMeshLinkIn(x + 1)(y)(W - 1)
      }
      if (y == 1) {
        nodeMeshLinkIn(x)(y-1)(S - 1) := nodeMeshLinkOut(x)(y)(N - 1)
        nodeMeshLinkOut(x)(y-1)(S - 1) := io.northLinkIn(x-1)
        io.northLinkOut(x-1) := nodeMeshLinkIn(x)(y-1)(S - 1)
      }
      if (y == config.yCordinateWidth) {
        nodeMeshLinkIn(x)(y + 1)(N - 1) := nodeMeshLinkOut(x)(y)(S - 1)
        nodeMeshLinkOut(x)(y + 1)(N - 1) := io.southLinkIn(x-1)
        io.southLinkOut(x-1) := nodeMeshLinkIn(x)(y + 1)(N - 1)
      }

      nodeMeshLinkIn(x)(y)(W - 1) := nodeMeshLinkOut(x - 1)(y)(E - 1)
      nodeMeshLinkIn(x)(y)(E - 1) := nodeMeshLinkOut(x + 1)(y)(W - 1)
      nodeMeshLinkIn(x)(y)(N - 1) := nodeMeshLinkOut(x)(y - 1)(S - 1)
      nodeMeshLinkIn(x)(y)(S - 1) := nodeMeshLinkOut(x)(y + 1)(N - 1)
    }
  }
}

// mesh master example
class meshMasterExample(config: meshEndpointStandardConfig) extends Component {
  import NocInterface._
  val io = new Bundle {
    val mymeshLinkConfig = meshLinkConfig(addrWidth = config.addrWidth,
      dataWidth = config.dataWidth,
      xCordWidth = config.xCordinateWidth,
      yCordWidth = config.yCordinateWidth,
      loadIdWidth = config.loadIdWidth
    )

    //mesh network links
    val linkIn = in(meshLink(mymeshLinkConfig))
    val linkOut = out(meshLink(mymeshLinkConfig))

    //tile cordinates in network
    val myXCordinate = in Bits (config.xCordinateWidth bits)
    val myYCordinate = in Bits (config.yCordinateWidth bits)

  }

  val endpoint = new meshEndpointStandard(config)

  //1-1. in request from network to local
  val validOut = Bool()
  val yumiIn = Bool()
  val dataOut = Bits (config.dataWidth bits)
  val maskOut = Bits (config.dataWidth >> 3 bits)
  val addrOut = UInt (config.addrWidth bits)
  val weOut = Bool()
  val xCordinateOut = Bits (config.xCordinateWidth bits)
  val yCordinateOut = Bits (config.yCordinateWidth bits)

  //1-2. out response to network from local
  val returningDataIn = Bits (config.dataWidth bits)
  val returningValidIn = Bool()

  //2-1. out request to network from local
  val outOp = Bits (ePacketOp.packetOpTypeWidth bits)
  val outOpEx = Bits (config.dataWidth >> 3 bits)
  val outAddr = Bits (config.addrWidth bits)
  val outPayLoadDataIn = Bits (config.dataWidth bits)
  val outSrcXCord = Bits (config.xCordinateWidth bits)
  val outSrcYCord = Bits (config.yCordinateWidth bits)
  val outMyXCord = Bits (config.xCordinateWidth bits)
  val outMyYCord = Bits (config.yCordinateWidth bits)
  val outPacketValidIn = Bool()
  val outPacketReadyOut = Bool()

  // 2-2. in response from network to local
  val returnedDataOut = Bits (config.dataWidth bits)
  val returnedLoadIdOut = Bits (config.loadIdWidth bits)
  val returnedValidOut = Bool()
  val returnedYumIn = Bool()
  val returnedFifoFullout = Bool()
  val creditOut = UInt (log2Up(config.maxCredit + 1) bits)

  // state machine
  object eStat extends SpinalEnum(binarySequential) {
    val eWriting, eReading, eWaiting, eFinish = newElement()
  }
  val stat_r = Reg(eStat()) init(eStat.eWriting)
  val stat_n = eStat()
  val wait_counter_r = Reg(UInt(config.addrWidth bits)) init(0)
  val data_r = Reg(UInt(config.dataWidth bits)) init(0)
  val addr_r = Reg(UInt(config.addrWidth bits)) init(0)

  val addr_overflow = (addr_r===U(31)) && outPacketReadyOut
  val wait_overflow = (wait_counter_r===U(31)) && outPacketReadyOut

  switch(stat_r, coverUnreachable = true){
    is(eStat.eWriting){
      stat_n := addr_overflow ? eStat.eReading | eStat.eWriting
    }
    is(eStat.eReading){
      stat_n := addr_overflow ? eStat.eWaiting | eStat.eReading
    }
    is(eStat.eWaiting) {
      stat_n := wait_overflow ? eStat.eFinish | eStat.eWaiting
    }
    default{
      stat_n := eStat.eFinish
    }
  }

  stat_r := stat_n

  outOp := (stat_r===eStat.eWriting) ? B(ePacketOp.remoteStore, ePacketOp.packetOpTypeWidth bits) | B(ePacketOp.remoteLoad, ePacketOp.packetOpTypeWidth bits)
  outPacketValidIn := (stat_r===eStat.eWriting) || (stat_r===eStat.eReading)
  outAddr := addr_r.asBits
  outOpEx := B(1)
  outPayLoadDataIn := data_r.asBits
  outMyXCord := io.myXCordinate
  outMyYCord := io.myYCordinate
  outSrcXCord := B(1)
  outSrcYCord := B(1)
  val launch_packet = outPacketValidIn && outPacketReadyOut
  val incr_data = launch_packet && (stat_r===eStat.eWriting)
  val incr_addr = launch_packet

  when(incr_data){
    data_r := data_r + 1
  }

  val addr_n = ((stat_r === eStat.eWriting)  && (stat_n === eStat.eReading)) ? U(0, config.addrWidth bits) | addr_r + 1
  when(incr_addr){
    addr_r := addr_n
  }

  when(returnedValidOut){
    wait_counter_r := wait_counter_r + 1
  }

  val cycle_counter_r = Reg(UInt(32 bits)) init(0)
  when((stat_r === eStat.eWriting)){
    cycle_counter_r := 0
  }.otherwise{
    cycle_counter_r := cycle_counter_r + 1
  }

  when(returnedValidOut){
    report(L"cycle $cycle_counter_r ,returned=$returnedDataOut , expected=$wait_counter_r")
  }

  //connect
  endpoint.io.linkIn := io.linkIn
  io.linkOut := endpoint.io.linkOut
  // 1-1
  endpoint.io.yumiIn := False
  // 1-2
  endpoint.io.returningDataIn := B(0)
  endpoint.io.returningValidIn := False
  // 2-1
  endpoint.io.outOp := outOp
  endpoint.io.outOpEx := outOpEx
  endpoint.io.outAddr := outAddr
  endpoint.io.outPayLoadDataIn := outPayLoadDataIn
  endpoint.io.outSrcXCord := outSrcXCord
  endpoint.io.outSrcYCord := outSrcYCord
  endpoint.io.outMyXCord := outMyXCord
  endpoint.io.outMyYCord := outMyYCord
  endpoint.io.outPacketValidIn := outPacketValidIn
  outPacketReadyOut := endpoint.io.outPacketReadyOut
  // 2-2
  returnedDataOut := endpoint.io.returnedDataOut
  returnedLoadIdOut := endpoint.io.returnedLoadIdOut
  returnedValidOut := endpoint.io.returnedValidOut
  endpoint.io.returnedYumIn := returnedValidOut
  endpoint.io.myXCordinate := io.myXCordinate
  endpoint.io.myYCordinate := io.myYCordinate
}

// mesh slave example
class meshSlaveExample(config: meshEndpointStandardConfig) extends Component {
  import NocInterface._
  val io = new Bundle {
    val mymeshLinkConfig = meshLinkConfig(addrWidth = config.addrWidth,
      dataWidth = config.dataWidth,
      xCordWidth = config.xCordinateWidth,
      yCordWidth = config.yCordinateWidth,
      loadIdWidth = config.loadIdWidth
    )

    //mesh network links
    val linkIn = in(meshLink(mymeshLinkConfig))
    val linkOut = out(meshLink(mymeshLinkConfig))

    //tile cordinates in network
    val myXCordinate = in Bits (config.xCordinateWidth bits)
    val myYCordinate = in Bits (config.yCordinateWidth bits)

  }

  val endpoint = new meshEndpointStandard(config)

  //1-1. in request from network to local
  val validOut = Bool()
  val yumiIn = Bool()
  val dataOut = Bits (config.dataWidth bits)
  val maskOut = Bits (config.dataWidth >> 3 bits)
  val addrOut = UInt (config.addrWidth bits)
  val weOut = Bool()
  val xCordinateOut = Bits (config.xCordinateWidth bits)
  val yCordinateOut = Bits (config.yCordinateWidth bits)

  //1-2. out response to network from local
  val returningDataIn = Reg(Bits (config.dataWidth bits)) init(1)
  val returningValidIn = Reg(Bool()) init(False)

  //2-1. out request to network from local
  val outOp = Bits (ePacketOp.packetOpTypeWidth bits)
  val outOpEx = Bits (config.dataWidth >> 3 bits)
  val outAddr = Bits (config.addrWidth bits)
  val outPayLoadDataIn = Bits (config.dataWidth bits)
  val outSrcXCord = Bits (config.xCordinateWidth bits)
  val outSrcYCord = Bits (config.yCordinateWidth bits)
  val outMyXCord = Bits (config.xCordinateWidth bits)
  val outMyYCord = Bits (config.yCordinateWidth bits)
  val outPacketValidIn = Bool()
  val outPacketReadyOut = Bool()

  // 2-2. in response from network to local
  val returnedDataOut = Bits (config.dataWidth bits)
  val returnedLoadIdOut = Bits (config.loadIdWidth bits)
  val returnedValidOut = Bool()
  val returnedYumIn = Bool()
  val returnedFifoFullout = Bool()
  val creditOut = UInt (log2Up(config.maxCredit + 1) bits)

  // slave mem
  var mem_depth_lp = 32
  val mem = Vec((Reg(Bits(config.dataWidth bits)) init(0)), mem_depth_lp)
  when(weOut && validOut){
    mem(addrOut(4 downto 0)) := dataOut
  }

  when(!weOut && validOut){
    returningDataIn := mem(addrOut(4 downto 0))
  }
  yumiIn := validOut
  returningValidIn := yumiIn

  //connect
  endpoint.io.linkIn := io.linkIn
  io.linkOut := endpoint.io.linkOut
  // 1-1
  validOut := endpoint.io.validOut
  endpoint.io.yumiIn := yumiIn
  dataOut := endpoint.io.dataOut
  maskOut := endpoint.io.maskOut
  addrOut := endpoint.io.addrOut
  weOut := endpoint.io.weOut
  // 1-2
  endpoint.io.returningDataIn := returningDataIn
  endpoint.io.returningValidIn := returningValidIn

  // 2-1
  outOp := B(0)
  outOpEx := B(0)
  outAddr := B(0)
  outPayLoadDataIn := B(0)
  outSrcXCord := B(0)
  outSrcYCord := B(0)
  outMyXCord := B(0)
  outMyYCord := B(0)
  outPacketValidIn := False

  endpoint.io.outOp := outOp
  endpoint.io.outOpEx := outOpEx
  endpoint.io.outAddr := outAddr
  endpoint.io.outPayLoadDataIn := outPayLoadDataIn
  endpoint.io.outSrcXCord := outSrcXCord
  endpoint.io.outSrcYCord := outSrcYCord
  endpoint.io.outMyXCord := outMyXCord
  endpoint.io.outMyYCord := outMyYCord
  endpoint.io.outPacketValidIn := outPacketValidIn
  outPacketReadyOut := endpoint.io.outPacketReadyOut
  // 2-2

  returnedDataOut := endpoint.io.returnedDataOut
  returnedLoadIdOut := endpoint.io.returnedLoadIdOut
  returnedValidOut := endpoint.io.returnedValidOut
  endpoint.io.returnedYumIn := returnedValidOut
  endpoint.io.myXCordinate := io.myXCordinate
  endpoint.io.myYCordinate := io.myYCordinate
}

class meshNocTop(config: meshNetworkConfig, endpointConfig: meshEndpointStandardConfig, TieoffConfig: meshLinkTieoffConfig) extends Component {
  import NocInterface._
  val io = new Bundle {
    val mymeshLinkConfig = meshLinkConfig(addrWidth = config.addrWidth,
      dataWidth = config.dataWidth,
      xCordWidth = config.xCordinateWidth,
      yCordWidth = config.yCordinateWidth,
      loadIdWidth = config.loadIdWidth
    )
  }
  noIoPrefix()

  val mesh_network = new meshNetwork(config)
  val mesh_master = new meshMasterExample(endpointConfig)
  val mesh_slave = new meshSlaveExample(endpointConfig)
  val mesh_tieoff_y = Array.fill(config.yCordinateWidth*2)(new meshLinkTieoff(TieoffConfig))
  val mesh_tieoff_x = Array.fill(config.xCordinateWidth*2)(new meshLinkTieoff(TieoffConfig))
  val mesh_tieoff_node = Array.fill(2)(new meshLinkTieoff(TieoffConfig))

  // connect
  for(y <- 0 until config.yCordinateWidth){
    // W
    mesh_tieoff_y(2*y).io.linkIn := mesh_network.io.westLinkOut(y)
    mesh_network.io.westLinkIn(y) :=mesh_tieoff_y(2*y).io.linkOut
    // E
    mesh_tieoff_y(2 * y+1).io.linkIn := mesh_network.io.eastLinkOut(y)
    mesh_network.io.eastLinkIn(y) := mesh_tieoff_y(2 * y+1).io.linkOut
  }
  for (x <- 0 until config.xCordinateWidth) {
    // N
    mesh_tieoff_x(2 * x).io.linkIn := mesh_network.io.northLinkOut(x)
    mesh_network.io.northLinkIn(x) := mesh_tieoff_x(2 * x).io.linkOut
    // S
    mesh_tieoff_x(2 * x + 1).io.linkIn := mesh_network.io.southLinkOut(x)
    mesh_network.io.southLinkIn(x) := mesh_tieoff_x(2 * x + 1).io.linkOut
  }

  mesh_network.io.localLinkIn(0)(1) := mesh_tieoff_node(0).io.linkOut
  mesh_tieoff_node(0).io.linkIn := mesh_network.io.localLinkOut(0)(1)

  mesh_network.io.localLinkIn(1)(0) := mesh_tieoff_node(1).io.linkOut
  mesh_tieoff_node(1).io.linkIn := mesh_network.io.localLinkOut(1)(0)

  // master at (0, 0)
  mesh_network.io.localLinkIn(0)(0) := mesh_master.io.linkOut
  mesh_master.io.linkIn := mesh_network.io.localLinkOut(0)(0)
  mesh_master.io.myXCordinate := B(0)
  mesh_master.io.myYCordinate := B(0)
  // slave at (1, 1)
  mesh_network.io.localLinkIn(1)(1) := mesh_slave.io.linkOut
  mesh_slave.io.linkIn := mesh_network.io.localLinkOut(1)(1)
  mesh_slave.io.myXCordinate := B(1)
  mesh_slave.io.myYCordinate := B(1)


}


















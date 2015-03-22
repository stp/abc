include_directories(.)

set(abc_lib_objects "")

set(abc_lib_objects
  ${abc_lib_objects}
  sat/bsat2/AbcApi.cpp
  sat/bsat2/MainSat.cpp
  sat/bsat2/MainSimp.cpp
  sat/bsat2/Options.cpp
  sat/bsat2/SimpSolver.cpp
  sat/bsat2/Solver.cpp
  sat/bsat2/System.cpp
  sat/bsat/satMem.c
  sat/bsat/satInter.c
  sat/bsat/satInterA.c
  sat/bsat/satInterB.c
  sat/bsat/satInterP.c
  sat/bsat/satProof.c
  sat/bsat/satSolver.c
  sat/bsat/satSolver2.c
  sat/bsat/satSolver2i.c
  sat/bsat/satStore.c
  sat/bsat/satTrace.c
  sat/bsat/satTruth.c
  sat/bsat/satUtil.c
  sat/msat/msatActivity.c
  sat/msat/msatClause.c
  sat/msat/msatClauseVec.c
  sat/msat/msatMem.c
  sat/msat/msatOrderH.c
  sat/msat/msatQueue.c
  sat/msat/msatRead.c
  sat/msat/msatSolverApi.c
  sat/msat/msatSolverCore.c
  sat/msat/msatSolverIo.c
  sat/msat/msatSolverSearch.c
  sat/msat/msatSort.c
  sat/msat/msatVec.c
  sat/csat/csat_apis.c
  sat/cnf/cnfCore.c
  sat/cnf/cnfCut.c
  sat/cnf/cnfData.c
  sat/cnf/cnfFast.c
  sat/cnf/cnfMan.c
  sat/cnf/cnfMap.c
  sat/cnf/cnfPost.c
  sat/cnf/cnfUtil.c
  sat/cnf/cnfWrite.c
  sat/bmc/bmcBCore.c
  sat/bmc/bmcBmc.c
  sat/bmc/bmcBmc2.c
  sat/bmc/bmcBmc3.c
  sat/bmc/bmcBmcAnd.c
  sat/bmc/bmcBmci.c
  sat/bmc/bmcCexCare.c
  sat/bmc/bmcCexCut.c
  sat/bmc/bmcCexDepth.c
  sat/bmc/bmcCexMin1.c
  sat/bmc/bmcCexMin2.c
  sat/bmc/bmcCexTools.c
  sat/bmc/bmcChain.c
  sat/bmc/bmcEco.c
  sat/bmc/bmcFault.c
  sat/bmc/bmcICheck.c
  sat/bmc/bmcInse.c
  sat/bmc/bmcLoad.c
  sat/bmc/bmcMaxi.c
  sat/bmc/bmcMulti.c
  sat/bmc/bmcUnroll.c

  bdd/reo/reoApi.c
  bdd/reo/reoCore.c
  bdd/reo/reoProfile.c
  bdd/reo/reoShuffle.c
  bdd/reo/reoSift.c
  bdd/reo/reoSwap.c
  bdd/reo/reoTransfer.c
  bdd/reo/reoUnits.c
  bdd/epd/epd.c
  bdd/cas/casCore.c
  bdd/cas/casDec.c

  bdd/mtr/mtrBasic.c
  bdd/mtr/mtrGroup.c
  bdd/parse/parseCore.c
  bdd/parse/parseEqn.c
  bdd/parse/parseStack.c
  bdd/dsd/dsdApi.c
  bdd/dsd/dsdCheck.c
  bdd/dsd/dsdLocal.c
  bdd/dsd/dsdMan.c
  bdd/dsd/dsdProc.c
  bdd/dsd/dsdTree.c
  bdd/cudd/cuddAPI.c
  bdd/cudd/cuddAddAbs.c
  bdd/cudd/cuddAddApply.c
  bdd/cudd/cuddAddFind.c
  bdd/cudd/cuddAddInv.c
  bdd/cudd/cuddAddIte.c
  bdd/cudd/cuddAddNeg.c
  bdd/cudd/cuddAddWalsh.c
  bdd/cudd/cuddAndAbs.c
  bdd/cudd/cuddAnneal.c
  bdd/cudd/cuddApa.c
  bdd/cudd/cuddApprox.c
  bdd/cudd/cuddBddAbs.c
  bdd/cudd/cuddBddCorr.c
  bdd/cudd/cuddBddIte.c
  bdd/cudd/cuddBridge.c
  bdd/cudd/cuddCache.c
  bdd/cudd/cuddCheck.c
  bdd/cudd/cuddClip.c
  bdd/cudd/cuddCof.c
  bdd/cudd/cuddCompose.c
  bdd/cudd/cuddDecomp.c
  bdd/cudd/cuddEssent.c
  bdd/cudd/cuddExact.c
  bdd/cudd/cuddExport.c
  bdd/cudd/cuddGenCof.c
  bdd/cudd/cuddGenetic.c
  bdd/cudd/cuddGroup.c
  bdd/cudd/cuddHarwell.c
  bdd/cudd/cuddInit.c
  bdd/cudd/cuddInteract.c
  bdd/cudd/cuddLCache.c
  bdd/cudd/cuddLevelQ.c
  bdd/cudd/cuddLinear.c
  bdd/cudd/cuddLiteral.c
  bdd/cudd/cuddMatMult.c
  bdd/cudd/cuddPriority.c
  bdd/cudd/cuddRead.c
  bdd/cudd/cuddRef.c
  bdd/cudd/cuddReorder.c
  bdd/cudd/cuddSat.c
  bdd/cudd/cuddSign.c
  bdd/cudd/cuddSolve.c
  bdd/cudd/cuddSplit.c
  bdd/cudd/cuddSubsetHB.c
  bdd/cudd/cuddSubsetSP.c
  bdd/cudd/cuddSymmetry.c
  bdd/cudd/cuddTable.c
  bdd/cudd/cuddUtil.c
  bdd/cudd/cuddWindow.c
  bdd/cudd/cuddZddCount.c
  bdd/cudd/cuddZddFuncs.c
  bdd/cudd/cuddZddGroup.c
  bdd/cudd/cuddZddIsop.c
  bdd/cudd/cuddZddLin.c
  bdd/cudd/cuddZddMisc.c
  bdd/cudd/cuddZddPort.c
  bdd/cudd/cuddZddReord.c
  bdd/cudd/cuddZddSetop.c
  bdd/cudd/cuddZddSymm.c
  bdd/cudd/cuddZddUtil.c
  opt/csw/cswCore.c
  opt/csw/cswCut.c
  opt/csw/cswMan.c
  opt/csw/cswTable.c
  opt/dar/darBalance.c
  opt/dar/darCore.c
  opt/dar/darCut.c
  opt/dar/darData.c
  opt/dar/darLib.c
  opt/dar/darMan.c
  opt/dar/darPrec.c
  opt/dar/darRefact.c
  opt/dar/darScript.c
  opt/rwt/rwtDec.c
  opt/rwt/rwtMan.c
  opt/rwt/rwtUtil.c
  opt/cgt/cgtAig.c
  opt/cgt/cgtCore.c
  opt/cgt/cgtDecide.c
  opt/cgt/cgtMan.c
  opt/cgt/cgtSat.c
  opt/fxu/fxu.c
  opt/fxu/fxuCreate.c
  opt/fxu/fxuHeapD.c
  opt/fxu/fxuHeapS.c
  opt/fxu/fxuList.c
  opt/fxu/fxuMatrix.c
  opt/fxu/fxuPair.c
  opt/fxu/fxuPrint.c
  opt/fxu/fxuReduce.c
  opt/fxu/fxuSelect.c
  opt/fxu/fxuSingle.c
  opt/fxu/fxuUpdate.c
  opt/dau/dauCanon.c
  opt/dau/dauCore.c
  opt/dau/dauDivs.c
  opt/dau/dauDsd.c
  opt/dau/dauEnum.c
  opt/dau/dauGia.c
  opt/dau/dauMerge.c
  opt/dau/dauNonDsd.c
  opt/dau/dauTree.c
  opt/cut/cutApi.c
  opt/cut/cutCut.c
  opt/cut/cutMan.c
  opt/cut/cutMerge.c
  opt/cut/cutNode.c
  opt/cut/cutOracle.c
  opt/cut/cutPre22.c
  opt/cut/cutSeq.c
  opt/cut/cutTruth.c
  opt/ret/retArea.c
  opt/ret/retCore.c
  opt/ret/retDelay.c
  opt/ret/retFlow.c
  opt/ret/retIncrem.c
  opt/ret/retInit.c
  opt/ret/retLvalue.c

  opt/nwk/nwkAig.c
  opt/nwk/nwkCheck.c
  opt/nwk/nwkBidec.c
  opt/nwk/nwkDfs.c
  opt/nwk/nwkFanio.c
  opt/nwk/nwkFlow.c
  opt/nwk/nwkMan.c
  opt/nwk/nwkMap.c
  opt/nwk/nwkMerge.c
  opt/nwk/nwkObj.c
  opt/nwk/nwkSpeedup.c
  opt/nwk/nwkStrash.c
  opt/nwk/nwkTiming.c
  opt/nwk/nwkUtil.c
  opt/sim/simMan.c
  opt/sim/simSeq.c
  opt/sim/simSupp.c
  opt/sim/simSwitch.c
  opt/sim/simSym.c
  opt/sim/simSymSat.c
  opt/sim/simSymSim.c
  opt/sim/simSymStr.c
  opt/sim/simUtils.c
  opt/rwr/rwrDec.c
  opt/rwr/rwrEva.c
  opt/rwr/rwrExp.c
  opt/rwr/rwrLib.c
  opt/rwr/rwrMan.c
  opt/rwr/rwrPrint.c
  opt/rwr/rwrUtil.c
  opt/lpk/lpkCore.c
  opt/lpk/lpkAbcDec.c
  opt/lpk/lpkAbcMux.c
  opt/lpk/lpkAbcDsd.c
  opt/lpk/lpkAbcUtil.c
  opt/lpk/lpkCut.c
  opt/lpk/lpkMan.c
  opt/lpk/lpkMap.c
  opt/lpk/lpkMulti.c
  opt/lpk/lpkMux.c
  opt/lpk/lpkSets.c

  # opt/fsim/fsimCore.c
  # opt/fsim/fsimFront.c
  # opt/fsim/fsimMan.c
  # opt/fsim/fsimSim.c
  # opt/fsim/fsimSwitch.c
  # opt/fsim/fsimTsim.c

  opt/mfs/mfsCore.c
  opt/mfs/mfsDiv.c
  opt/mfs/mfsInter.c
  opt/mfs/mfsMan.c
  opt/mfs/mfsResub.c
  opt/mfs/mfsSat.c
  opt/mfs/mfsStrash.c
  opt/mfs/mfsWin.c
  opt/sfm/sfmCnf.c
  opt/sfm/sfmCore.c
  opt/sfm/sfmNtk.c
  opt/sfm/sfmSat.c
  opt/sfm/sfmWin.c
  opt/res/resCore.c
  opt/res/resDivs.c
  opt/res/resFilter.c
  opt/res/resSat.c
  opt/res/resSim.c
  opt/res/resStrash.c
  opt/res/resWin.c
  map/scl/scl.c
  map/scl/sclBuffer.c
  map/scl/sclBufSize.c
  map/scl/sclDnsize.c
  map/scl/sclLiberty.c
  map/scl/sclLibScl.c
  map/scl/sclLibUtil.c
  map/scl/sclLoad.c
  map/scl/sclSize.c
  map/scl/sclUpsize.c
  map/scl/sclUtil.c

  # map/fpga/fpga.c
  # map/fpga/fpgaCore.c
  # map/fpga/fpgaCreate.c
  # map/fpga/fpgaCut.c
  # map/fpga/fpgaCutUtils.c
  # map/fpga/fpgaFanout.c
  # map/fpga/fpgaLib.c
  # map/fpga/fpgaMatch.c
  # map/fpga/fpgaSwitch.c
  # map/fpga/fpgaTime.c
  # map/fpga/fpgaTruth.c
  # map/fpga/fpgaUtils.c
  # map/fpga/fpgaVec.c

  map/amap/amapCore.c
  map/amap/amapGraph.c
  map/amap/amapLib.c
  map/amap/amapLiberty.c
  map/amap/amapMan.c
  map/amap/amapMatch.c
  map/amap/amapMerge.c
  map/amap/amapOutput.c
  map/amap/amapParse.c
  map/amap/amapPerm.c
  map/amap/amapRead.c
  map/amap/amapRule.c
  map/amap/amapUniq.c
  map/super/super.c
  map/super/superAnd.c
  map/super/superGate.c
  map/mpm/mpmAbc.c
  map/mpm/mpmCore.c
  map/mpm/mpmDsd.c
  map/mpm/mpmGates.c
  map/mpm/mpmLib.c
  map/mpm/mpmMan.c
  map/mpm/mpmMap.c
  map/mpm/mpmMig.c
  map/mpm/mpmPre.c
  map/mpm/mpmTruth.c
  map/mpm/mpmUtil.c
  map/mio/mio.c
  map/mio/mioApi.c
  map/mio/mioFunc.c
  map/mio/mioParse.c
  map/mio/mioRead.c
  map/mio/mioSop.c
  map/mio/mioUtils.c
  map/if/ifCom.c
  map/if/ifCache.c
  map/if/ifCore.c
  map/if/ifCut.c
  map/if/ifData2.c
  map/if/ifDec07.c
  map/if/ifDec08.c
  map/if/ifDec10.c
  map/if/ifDec16.c
  map/if/ifDec75.c
  map/if/ifDelay.c
  map/if/ifDsd.c
  map/if/ifLibBox.c
  map/if/ifLibLut.c
  map/if/ifMan.c
  map/if/ifMap.c
  map/if/ifMatch2.c
  map/if/ifReduce.c
  map/if/ifSat.c
  map/if/ifSelect.c
  map/if/ifSeq.c
  map/if/ifTest.c
  map/if/ifTime.c
  map/if/ifTruth.c
  map/if/ifTune.c
  map/if/ifUtil.c
  map/mapper/mapper.c
  map/mapper/mapperCanon.c
  map/mapper/mapperCore.c
  map/mapper/mapperCreate.c
  map/mapper/mapperCut.c
  map/mapper/mapperCutUtils.c
  map/mapper/mapperLib.c
  map/mapper/mapperMatch.c
  map/mapper/mapperRefs.c
  map/mapper/mapperSuper.c
  map/mapper/mapperSwitch.c
  map/mapper/mapperTable.c
  map/mapper/mapperTime.c
  map/mapper/mapperTree.c
  map/mapper/mapperTruth.c
  map/mapper/mapperUtils.c
  map/mapper/mapperVec.c
  map/cov/covBuild.c
  map/cov/covCore.c
  map/cov/covMan.c
  map/cov/covMinEsop.c
  map/cov/covMinMan.c
  map/cov/covMinSop.c
  map/cov/covMinUtil.c

  bool/rsb/rsbDec6.c
  bool/rsb/rsbMan.c
  bool/rpo/rpo.c
  bool/lucky/lucky.c
  bool/lucky/luckyFast16.c
  bool/lucky/luckyFast6.c
  bool/lucky/luckyRead.c
  bool/lucky/luckySimple.c
  bool/lucky/luckySwapIJ.c
  bool/lucky/luckySwap.c
  bool/bdc/bdcCore.c
  bool/bdc/bdcDec.c
  bool/bdc/bdcSpfd.c
  bool/bdc/bdcTable.c

  bool/kit/kitAig.c
  bool/kit/kitBdd.c
  bool/kit/kitCloud.c
  bool/kit/cloud.c
  bool/kit/kitDsd.c
  bool/kit/kitFactor.c
  bool/kit/kitGraph.c
  bool/kit/kitHop.c
  bool/kit/kitIsop.c
  bool/kit/kitPla.c
  bool/kit/kitSop.c
  bool/kit/kitTruth.c
  bool/dec/decAbc.c
  bool/dec/decFactor.c
  bool/dec/decMan.c
  bool/dec/decPrint.c
  bool/dec/decUtil.c
  aig/hop/hopBalance.c
  aig/hop/hopCheck.c
  aig/hop/hopDfs.c
  aig/hop/hopMan.c
  aig/hop/hopMem.c
  aig/hop/hopObj.c
  aig/hop/hopOper.c
  aig/hop/hopTable.c
  aig/hop/hopTruth.c
  aig/hop/hopUtil.c
  aig/gia/giaAig.c
  aig/gia/giaAgi.c
  aig/gia/giaAiger.c
  aig/gia/giaAigerExt.c
  aig/gia/giaBalAig.c
  aig/gia/giaBalLut.c
  aig/gia/giaBalMap.c
  aig/gia/giaBidec.c
  aig/gia/giaCCof.c
  aig/gia/giaCex.c
  aig/gia/giaClp.c
  aig/gia/giaCof.c
  aig/gia/giaCone.c
  aig/gia/giaCSatOld.c
  aig/gia/giaCSat.c
  aig/gia/giaCTas.c
  aig/gia/giaDfs.c
  aig/gia/giaDup.c
  aig/gia/giaEmbed.c
  aig/gia/giaEnable.c
  aig/gia/giaEquiv.c
  aig/gia/giaEra.c
  aig/gia/giaEra2.c
  aig/gia/giaFadds.c
  aig/gia/giaFalse.c
  aig/gia/giaFanout.c
  aig/gia/giaForce.c
  aig/gia/giaFrames.c
  aig/gia/giaFront.c
  aig/gia/giaFx.c
  aig/gia/giaGig.c
  aig/gia/giaGlitch.c
  aig/gia/giaHash.c
  aig/gia/giaIf.c
  aig/gia/giaIff.c
  aig/gia/giaIso.c
  aig/gia/giaIso2.c
  aig/gia/giaIso3.c
  aig/gia/giaJf.c
  aig/gia/giaKf.c
  aig/gia/giaLf.c
  aig/gia/giaMf.c
  aig/gia/giaMan.c
  aig/gia/giaMem.c
  aig/gia/giaMfs.c
  aig/gia/giaMini.c
  aig/gia/giaMuxes.c
  aig/gia/giaNf.c
  aig/gia/giaPat.c
  aig/gia/giaPf.c
  aig/gia/giaQbf.c
  aig/gia/giaResub.c
  aig/gia/giaRetime.c
  aig/gia/giaScl.c
  aig/gia/giaScript.c
  aig/gia/giaShrink.c
  aig/gia/giaShrink6.c
  aig/gia/giaShrink7.c
  aig/gia/giaSim.c
  aig/gia/giaSim2.c
  aig/gia/giaSort.c
  aig/gia/giaSpeedup.c
  aig/gia/giaStg.c
  aig/gia/giaStr.c
  aig/gia/giaSupMin.c
  aig/gia/giaSweep.c
  aig/gia/giaSweeper.c
  aig/gia/giaSwitch.c
  aig/gia/giaTim.c
  aig/gia/giaTis.c
  aig/gia/giaTruth.c
  aig/gia/giaTsim.c
  aig/gia/giaUtil.c
  aig/ioa/ioaReadAig.c
  aig/ioa/ioaWriteAig.c
  aig/ioa/ioaUtil.c
  aig/aig/aigCheck.c
  aig/aig/aigCanon.c
  aig/aig/aigCuts.c
  aig/aig/aigDfs.c
  aig/aig/aigDup.c
  aig/aig/aigFanout.c
  aig/aig/aigFrames.c
  aig/aig/aigInter.c
  aig/aig/aigJust.c
  aig/aig/aigMan.c
  aig/aig/aigMem.c
  aig/aig/aigMffc.c
  aig/aig/aigObj.c
  aig/aig/aigOper.c
  aig/aig/aigOrder.c
  aig/aig/aigPack.c
  aig/aig/aigPart.c
  aig/aig/aigPartReg.c
  aig/aig/aigPartSat.c
  aig/aig/aigRepr.c
  aig/aig/aigRet.c
  aig/aig/aigRetF.c
  aig/aig/aigScl.c
  aig/aig/aigShow.c
  aig/aig/aigSplit.c
  aig/aig/aigTable.c
  aig/aig/aigTiming.c
  aig/aig/aigTruth.c
  aig/aig/aigTsim.c
  aig/aig/aigUtil.c
  aig/aig/aigWin.c
  aig/saig/saigCone.c
  aig/saig/saigConstr.c
  aig/saig/saigConstr2.c
  aig/saig/saigDual.c
  aig/saig/saigDup.c
  aig/saig/saigInd.c
  aig/saig/saigIoa.c
  aig/saig/saigIso.c
  aig/saig/saigIsoFast.c
  aig/saig/saigIsoSlow.c
  aig/saig/saigMiter.c
  aig/saig/saigOutDec.c
  aig/saig/saigPhase.c
  aig/saig/saigRetFwd.c
  aig/saig/saigRetMin.c
  aig/saig/saigRetStep.c
  aig/saig/saigScl.c
  aig/saig/saigSimFast.c
  aig/saig/saigSimMv.c
  aig/saig/saigSimSeq.c
  aig/saig/saigStrSim.c
  aig/saig/saigSwitch.c
  aig/saig/saigSynch.c
  aig/saig/saigTempor.c
  aig/saig/saigTrans.c
  aig/saig/saigWnd.c
  aig/ivy/ivyBalance.c
  aig/ivy/ivyCanon.c
  aig/ivy/ivyCheck.c
  aig/ivy/ivyCut.c
  aig/ivy/ivyCutTrav.c
  aig/ivy/ivyDfs.c
  aig/ivy/ivyDsd.c
  aig/ivy/ivyFanout.c
  aig/ivy/ivyFastMap.c
  aig/ivy/ivyFraig.c
  aig/ivy/ivyHaig.c
  aig/ivy/ivyMan.c
  aig/ivy/ivyMem.c
  aig/ivy/ivyMulti.c
  aig/ivy/ivyObj.c
  aig/ivy/ivyOper.c
  aig/ivy/ivyResyn.c
  aig/ivy/ivyRwr.c
  aig/ivy/ivySeq.c
  aig/ivy/ivyShow.c
  aig/ivy/ivyTable.c
  aig/ivy/ivyUtil.c
  misc/zlib/adler32.c
  misc/zlib/compress_.c
  misc/zlib/crc32.c
  misc/zlib/deflate.c
  misc/zlib/gzclose.c
  misc/zlib/gzlib.c
  misc/zlib/gzread.c
  misc/zlib/gzwrite.c
  misc/zlib/infback.c
  misc/zlib/inffast.c
  misc/zlib/inflate.c
  misc/zlib/inftrees.c
  misc/zlib/trees.c
  misc/zlib/uncompr.c
  misc/zlib/zutil.c
  misc/util/utilBridge.c
  misc/util/utilCex.c
  misc/util/utilColor.c
  misc/util/utilFile.c
  misc/util/utilIsop.c
  misc/util/utilNam.c
  misc/util/utilSignal.c
  misc/util/utilSort.c
  misc/bbl/bblif.c
  misc/mem/mem.c
  misc/bar/bar.c
  misc/nm/nmApi.c
  misc/nm/nmTable.c

  misc/tim/timBox.c
  misc/tim/timDump.c
  misc/tim/timMan.c
  misc/tim/timTime.c
  misc/tim/timTrav.c

  misc/st/st.c
  misc/st/stmm.c

  # misc/espresso/cofactor.c
  # misc/espresso/cols.c
  # misc/espresso/compl.c
  # misc/espresso/contain.c
  # misc/espresso/cubehack.c
  # misc/espresso/cubestr.c
  # misc/espresso/cvrin.c
  # misc/espresso/cvrm.c
  # misc/espresso/cvrmisc.c
  # misc/espresso/cvrout.c
  # misc/espresso/dominate.c
  # misc/espresso/equiv.c
  # misc/espresso/espresso.c
  # misc/espresso/essen.c
  # misc/espresso/exact.c
  # misc/espresso/expand.c
  # misc/espresso/gasp.c
  # misc/espresso/gimpel.c
  # misc/espresso/globals.c
  # misc/espresso/hack.c
  # misc/espresso/indep.c
  # misc/espresso/irred.c
  # misc/espresso/map.c
  # misc/espresso/matrix.c
  # misc/espresso/mincov.c
  # misc/espresso/opo.c
  # misc/espresso/pair.c
  # misc/espresso/part.c
  # misc/espresso/primes.c
  # misc/espresso/reduce.c
  # misc/espresso/rows.c
  # misc/espresso/set.c
  # misc/espresso/setc.c
  # misc/espresso/sharp.c
  # misc/espresso/sminterf.c
  # misc/espresso/solution.c
  # misc/espresso/sparse.c
  # misc/espresso/unate.c
  # misc/espresso/verify.c

  misc/extra/extraBddAuto.c
  misc/extra/extraBddCas.c
  misc/extra/extraBddImage.c
  misc/extra/extraBddKmap.c
  misc/extra/extraBddMisc.c
  misc/extra/extraBddSymm.c
  misc/extra/extraBddTime.c
  misc/extra/extraBddUnate.c
  misc/extra/extraUtilBitMatrix.c
  misc/extra/extraUtilCanon.c
  misc/extra/extraUtilCube.c
  misc/extra/extraUtilDsd.c
  misc/extra/extraUtilEnum.c
  misc/extra/extraUtilFile.c
  misc/extra/extraUtilMemory.c
  misc/extra/extraUtilMisc.c
  misc/extra/extraUtilPerm.c
  misc/extra/extraUtilProgress.c
  misc/extra/extraUtilReader.c
  misc/extra/extraUtilSupp.c
  misc/extra/extraUtilThresh.c
  misc/extra/extraUtilTruth.c
  misc/extra/extraUtilUtil.c
  misc/mvc/mvcApi.c
  misc/mvc/mvcCompare.c
  misc/mvc/mvcContain.c
  misc/mvc/mvcCover.c
  misc/mvc/mvcCube.c
  misc/mvc/mvcDivide.c
  misc/mvc/mvcDivisor.c
  misc/mvc/mvcList.c
  misc/mvc/mvcLits.c
  misc/mvc/mvcMan.c
  misc/mvc/mvcOpAlg.c
  misc/mvc/mvcOpBool.c
  misc/mvc/mvcPrint.c
  misc/mvc/mvcSort.c
  misc/mvc/mvcUtils.c
  misc/bzlib/blocksort.c
  misc/bzlib/bzlib.c
  misc/bzlib/compress.c
  misc/bzlib/crctable.c
  misc/bzlib/decompress.c
  misc/bzlib/huffman.c
  misc/bzlib/randtable.c
  base/abc/abcAig.c
  base/abc/abcBarBuf.c
  base/abc/abcBlifMv.c
  base/abc/abcCheck.c
  base/abc/abcDfs.c
  base/abc/abcFanio.c
  base/abc/abcFanOrder.c
  base/abc/abcFunc.c
  base/abc/abcHie.c
  base/abc/abcHieCec.c
  base/abc/abcHieGia.c
  base/abc/abcHieNew.c
  base/abc/abcLatch.c
  base/abc/abcLib.c
  base/abc/abcMinBase.c
  base/abc/abcNames.c
  base/abc/abcNetlist.c
  base/abc/abcNtk.c
  base/abc/abcObj.c
  base/abc/abcRefs.c
  base/abc/abcShow.c
  base/abc/abcSop.c
  base/abc/abcUtil.c
  base/test/test.c
  base/abci/abc.c
  base/abci/abcAttach.c
  base/abci/abcAuto.c
  base/abci/abcBalance.c
  base/abci/abcBidec.c
  base/abci/abcBm.c
  base/abci/abcBmc.c
  base/abci/abcCas.c
  base/abci/abcCascade.c
  base/abci/abcCollapse.c
  base/abci/abcCut.c
  base/abci/abcDar.c
  base/abci/abcDebug.c
  base/abci/abcDec.c
  base/abci/abcDress.c
  base/abci/abcDress2.c
  base/abci/abcDsd.c
  base/abci/abcExtract.c
  base/abci/abcFraig.c
  base/abci/abcFx.c
  base/abci/abcFxu.c
  base/abci/abcGen.c
  base/abci/abcHaig.c
  base/abci/abcIf.c
  base/abci/abcIfif.c
  base/abci/abcIfMux.c
  base/abci/abcIvy.c
  base/abci/abcLog.c
  base/abci/abcLut.c
  base/abci/abcLutmin.c
  base/abci/abcMap.c
  base/abci/abcMerge.c
  base/abci/abcMfs.c
  base/abci/abcMini.c
  base/abci/abcMiter.c
  base/abci/abcMulti.c
  base/abci/abcNtbdd.c
  base/abci/abcNpn.c
  base/abci/abcNpnSave.c
  base/abci/abcOdc.c
  base/abci/abcOrder.c
  base/abci/abcPart.c
  base/abci/abcPrint.c
  base/abci/abcProve.c
  base/abci/abcQbf.c
  base/abci/abcQuant.c
  base/abci/abcRec3.c
  base/abci/abcReconv.c
  base/abci/abcReach.c
  base/abci/abcRefactor.c
  base/abci/abcRenode.c
  base/abci/abcReorder.c
  base/abci/abcRestruct.c
  base/abci/abcResub.c
  base/abci/abcRewrite.c
  base/abci/abcRpo.c
  base/abci/abcRr.c
  base/abci/abcSat.c
  base/abci/abcSaucy.c
  base/abci/abcScorr.c
  base/abci/abcSense.c
  base/abci/abcSpeedup.c
  base/abci/abcStrash.c
  base/abci/abcSweep.c
  base/abci/abcSymm.c
  base/abci/abcTim.c
  base/abci/abcTiming.c
  base/abci/abcUnate.c
  base/abci/abcUnreach.c
  base/abci/abcVerify.c
  base/abci/abcXsim.c
  base/io/io.c
  base/io/ioReadAiger.c
  base/io/ioReadBaf.c
  base/io/ioReadBblif.c
  base/io/ioReadBench.c
  base/io/ioReadBlif.c
  base/io/ioReadBlifAig.c
  base/io/ioReadBlifMv.c
  base/io/ioReadDsd.c
  base/io/ioReadEdif.c
  base/io/ioReadEqn.c
  base/io/ioReadPla.c
  base/io/ioReadVerilog.c
  base/io/ioUtil.c
  base/io/ioWriteAiger.c
  base/io/ioWriteBaf.c
  base/io/ioWriteBblif.c
  base/io/ioWriteBench.c
  base/io/ioWriteBlif.c
  base/io/ioWriteBlifMv.c
  base/io/ioWriteBook.c
  base/io/ioWriteCnf.c
  base/io/ioWriteDot.c
  base/io/ioWriteEqn.c
  base/io/ioWriteGml.c
  base/io/ioWriteList.c
  base/io/ioWritePla.c
  base/io/ioWriteVerilog.c
  base/io/ioWriteSmv.c

  base/main/mainFrame.c
  base/main/mainInit.c
  base/main/mainLib.c
  base/main/mainReal.c
  base/main/libSupport.c
  base/main/mainUtils.c
  base/wlc/wlcAbs.c
  base/wlc/wlcBlast.c
  base/wlc/wlcCom.c
  base/wlc/wlcNtk.c
  base/wlc/wlcReadSmt.c
  base/wlc/wlcReadVer.c
  base/wlc/wlcStdin.c
  base/wlc/wlcWriteVer.c
  base/ver/verCore.c
  base/ver/verFormula.c
  base/ver/verParse.c
  base/ver/verStream.c
  base/cba/cbaBlast.c
  base/cba/cbaCba.c
  base/cba/cbaCom.c
  base/cba/cbaLib.c
  base/cba/cbaNtk.c
  base/cba/cbaPrsBuild.c
  base/cba/cbaPrsTrans.c
  base/cba/cbaPtr.c
  base/cba/cbaPtrAbc.c
  base/cba/cbaReadBlif.c
  base/cba/cbaReadSmt.c
  base/cba/cbaReadVer.c
  base/cba/cbaWriteBlif.c
  base/cba/cbaWriteSmt.c
  base/cba/cbaWriteVer.c
  base/cmd/cmd.c
  base/cmd/cmdAlias.c
  base/cmd/cmdApi.c
  base/cmd/cmdFlag.c
  base/cmd/cmdHist.c
  base/cmd/cmdLoad.c
  base/cmd/cmdPlugin.c
  base/cmd/cmdStarter.c
  base/cmd/cmdUtils.c

  # phys/place/place_base.c
  # phys/place/place_bin.c
  # phys/place/place_genqp.c
  # phys/place/place_gordian.c
  # phys/place/place_legalize.c
  # phys/place/place_pads.c
  # phys/place/place_partition.c
  # phys/place/place_qpsolver.c
  # phys/place/place_io.c
  # phys/place/place_inc.c

  proof/abs/absDup.c
  proof/abs/absGla.c
  proof/abs/absGlaOld.c
  proof/abs/absIter.c
  proof/abs/absOldCex.c
  proof/abs/absOldRef.c
  proof/abs/absOldSat.c
  proof/abs/absOldSim.c
  proof/abs/absOut.c
  proof/abs/absPth.c
  proof/abs/absRef.c
  proof/abs/absRefSelect.c
  proof/abs/absRpm.c
  proof/abs/absRpmOld.c
  proof/abs/absVta.c
  proof/abs/absUtil.c
  proof/fraig/fraigApi.c
  proof/fraig/fraigCanon.c
  proof/fraig/fraigFanout.c
  proof/fraig/fraigFeed.c
  proof/fraig/fraigMan.c
  proof/fraig/fraigMem.c
  proof/fraig/fraigNode.c
  proof/fraig/fraigPrime.c
  proof/fraig/fraigSat.c
  proof/fraig/fraigTable.c
  proof/fraig/fraigUtil.c
  proof/fraig/fraigVec.c
  proof/int/intCheck.c
  proof/int/intContain.c
  proof/int/intCore.c
  proof/int/intCtrex.c
  proof/int/intDup.c
  proof/int/intFrames.c
  proof/int/intInter.c
  proof/int/intM114.c
  proof/int/intMan.c
  proof/int/intUtil.c
  proof/live/liveness.c
  proof/live/liveness_sim.c
  proof/live/ltl_parser.c
  proof/live/kliveness.c
  proof/live/monotone.c
  proof/live/disjunctiveMonotone.c
  proof/live/arenaViolation.c
  proof/live/kLiveConstraints.c
  proof/live/combination.c
  proof/llb/llb1Cluster.c
  proof/llb/llb1Constr.c
  proof/llb/llb1Core.c
  proof/llb/llb1Group.c
  proof/llb/llb1Hint.c
  proof/llb/llb1Man.c
  proof/llb/llb1Matrix.c
  proof/llb/llb1Pivot.c
  proof/llb/llb1Reach.c
  proof/llb/llb1Sched.c
  proof/llb/llb2Bad.c
  proof/llb/llb2Core.c
  proof/llb/llb2Driver.c
  proof/llb/llb2Dump.c
  proof/llb/llb2Flow.c
  proof/llb/llb2Image.c
  proof/llb/llb3Image.c
  proof/llb/llb3Nonlin.c
  proof/llb/llb4Cex.c
  proof/llb/llb4Image.c
  proof/llb/llb4Nonlin.c
  proof/llb/llb4Sweep.c
  proof/cec/cecCec.c
  proof/cec/cecChoice.c
  proof/cec/cecClass.c
  proof/cec/cecCore.c
  proof/cec/cecCorr.c
  proof/cec/cecIso.c
  proof/cec/cecMan.c
  proof/cec/cecPat.c
  proof/cec/cecSeq.c
  proof/cec/cecSolve.c
  proof/cec/cecSplit.c
  proof/cec/cecSynth.c
  proof/cec/cecSweep.c
  proof/ssw/sswAig.c
  proof/ssw/sswBmc.c
  proof/ssw/sswClass.c
  proof/ssw/sswCnf.c
  proof/ssw/sswConstr.c
  proof/ssw/sswCore.c
  proof/ssw/sswDyn.c
  proof/ssw/sswFilter.c
  proof/ssw/sswIslands.c
  proof/ssw/sswLcorr.c
  proof/ssw/sswMan.c
  proof/ssw/sswPart.c
  proof/ssw/sswPairs.c
  proof/ssw/sswRarity.c
  proof/ssw/sswSat.c
  proof/ssw/sswSemi.c
  proof/ssw/sswSim.c
  proof/ssw/sswSimSat.c
  proof/ssw/sswSweep.c
  proof/ssw/sswUnique.c
  proof/ssc/sscClass.c
  proof/ssc/sscCore.c
  proof/ssc/sscSat.c
  proof/ssc/sscSim.c
  proof/ssc/sscUtil.c
  proof/pdr/pdrCnf.c
  proof/pdr/pdrCore.c
  proof/pdr/pdrInv.c
  proof/pdr/pdrMan.c
  proof/pdr/pdrSat.c
  proof/pdr/pdrTsim.c
  proof/pdr/pdrUtil.c
  proof/fra/fraBmc.c
  proof/fra/fraCec.c
  proof/fra/fraClass.c
  proof/fra/fraClau.c
  proof/fra/fraClaus.c
  proof/fra/fraCnf.c
  proof/fra/fraCore.c
  proof/fra/fraHot.c
  proof/fra/fraImp.c
  proof/fra/fraInd.c
  proof/fra/fraIndVer.c
  proof/fra/fraLcr.c
  proof/fra/fraMan.c
  proof/fra/fraPart.c
  proof/fra/fraSat.c
  proof/fra/fraSec.c
  proof/fra/fraSim.c
  proof/dch/dchAig.c
  proof/dch/dchChoice.c
  proof/dch/dchClass.c
  proof/dch/dchCnf.c
  proof/dch/dchCore.c
  proof/dch/dchMan.c
  proof/dch/dchSat.c
  proof/dch/dchSim.c
  proof/dch/dchSimSat.c
  proof/dch/dchSweep.c

  # proof/int2/int2Bmc.c
  # proof/int2/int2Core.c
  # proof/int2/int2Refine.c
  # proof/int2/int2Util.c

  proof/bbr/bbrCex.c
  proof/bbr/bbrImage.c
  proof/bbr/bbrNtbdd.c
  proof/bbr/bbrReach.c
)

set(abc_public_headers "")
add_library(libabc ${abc_lib_objects})

set_target_properties(libabc PROPERTIES
  OUTPUT_NAME abc
  PUBLIC_HEADER "${abc_public_headers}"
)

# -----------------------------------------------------------------------------
# Support building both static and dynamic library
# -----------------------------------------------------------------------------
if (BUILD_SHARED_LIBS AND ALSO_BUILD_STATIC_LIB)
  add_library(libabc_static STATIC ${abc_lib_objects})

  set_target_properties(libabc_static PROPERTIES
    OUTPUT_NAME abc
  )

  install(TARGETS libabc_static
    EXPORT ${ABC_EXPORT_NAME}
    LIBRARY DESTINATION "${CMAKE_INSTALL_PREFIX}/lib"
    ARCHIVE DESTINATION "${CMAKE_INSTALL_PREFIX}/lib"
  )
endif()

set(libabc_link_libs dl)
target_link_libraries(libabc ${libabc_link_libs})

install(TARGETS libabc
  EXPORT ${ABC_EXPORT_NAME}
  LIBRARY DESTINATION "${CMAKE_INSTALL_PREFIX}/lib"
  ARCHIVE DESTINATION "${CMAKE_INSTALL_PREFIX}/lib"
  PUBLIC_HEADER DESTINATION "${CMAKE_INSTALL_PREFIX}/include/abc"
)

if (BUILD_STATIC_BIN)
    # FIXME: We should check if the linker supports these flags
    # FIXME: -Wl,--no-export-dynamic is a workaround for a bug in binutils
    # See http://sourceware.org/bugzilla/show_bug.cgi?id=13490
    # https://bugzilla.redhat.com/show_bug.cgi?id=642999
    set(CMAKE_EXE_LINKER_FLAGS "-static -Wl,--no-export-dynamic")
endif()

add_executable(abc
  base/main/main.c
)

if (BUILD_STATIC_BIN)
    set_target_properties(abc PROPERTIES LINK_SEARCH_END_STATIC 1)
    set_target_properties(abc PROPERTIES LINK_SEARCH_START_STATIC 0)
endif()

set_target_properties(abc PROPERTIES RUNTIME_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR})
target_link_libraries(abc libabc pthread)

install(TARGETS abc
  EXPORT ${ABC_EXPORT_NAME}
  RUNTIME DESTINATION bin
)

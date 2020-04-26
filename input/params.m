%%% 
%%% params.m
%%% 
%%% Automatically-generated Matlab file containing parameters
%%% used in this MITgcm experiment.
%%% 

vectorInvariantMomentum=0;
viscAr=0.00000000e+00;
viscA4=0.00000000e+00;
viscAh=0.00000000e+00;
viscA4Grid=1.00000000e-01;
viscAhGrid=0.00000000e+00;
viscA4GridMax=5.00000000e-01;
viscAhGridMax=1.00000000e+00;
useAreaViscLength=0;
viscC2leith=0.00000000e+00;
viscC2leithD=0.00000000e+00;
tempAdvScheme=33;
saltAdvScheme=33;
diffKrT=1.00000000e-06;
diffKrS=1.00000000e-06;
diffKhT=0.00000000e+00;
diffK4T=0.00000000e+00;
tempStepping=1;
saltStepping=1;
staggerTimeStep=1;
eosType='JMD95Z';
no_slip_sides=0;
no_slip_bottom=0;
bottomDragLinear=0.00000000e+00;
bottomDragQuadratic=2.00000000e-03;
f0=1.26303380e-04;
beta=0.00000000e+00;
gravity=9.81000000e+00;
quasiHydrostatic=0;
fPrime=0.00000000e+00;
ivdc_kappa=0.00000000e+00;
implicitDiffusion=1;
implicitViscosity=1;
exactConserv=1;
useCDscheme=0;
hFacMin=1.00000000e-01;
readBinaryPrec=64;
useSingleCpuIO=1;
debugLevel=5;
useJamartWetPoints=1;
useJamartMomAdv=1;
selectAddFluid=1;
hFacMinDr=1.33125947e+01;

useSRCGSolver=1;
cg2dMaxIters=1000;
cg2dTargetResidual=1.00000000e-12;

alph_AB=5.00000000e-01;
beta_AB=4.16666667e-01;
nIter0=0;
abEps=1.00000000e-01;
chkptFreq=7.88400000e+06;
pChkptFreq=1.57680000e+08;
taveFreq=0.00000000e+00;
dumpFreq=3.15360000e+08;
monitorFreq=3.15360000e+07;
dumpInitAndLast=1;
pickupStrictlyMatch=0;
endTime=69120076;
deltaT=8.30000000e+01;

usingCartesianGrid=1;
usingSphericalPolarGrid=0;
delX=200*ones(1,100);
delY=200*ones(1,25);
delR=10*ones(1,50);

bathyFile='bathymetry.bin';
 hydrogThetaFile='tempini.bin';
 hydrogSaltFile ='saltini.bin';

 
useDiagnostics=1;
useKPP=1;
useRBCS=1;
useICEPLUME=1;

 
 
 
diag_fields{1,1}='icefrntW';
diag_fileNames{1}='icefrntW';
diag_frequency(1)=1.72800000e+04;
diag_timePhase(1)=0.00000000e+00;
diag_fields{1,2}='icefrntT';
diag_fileNames{2}='icefrntT';
diag_frequency(2)=1.72800000e+04;
diag_timePhase(2)=0.00000000e+00;
diag_fields{1,3}='icefrntS';
diag_fileNames{3}='icefrntS';
diag_frequency(3)=1.72800000e+04;
diag_timePhase(3)=0.00000000e+00;
diag_fields{1,4}='icefrntR';
diag_fileNames{4}='icefrntR';
diag_frequency(4)=1.72800000e+04;
diag_timePhase(4)=0.00000000e+00;
diag_fields{1,5}='icefrntM';
diag_fileNames{5}='icefrntM';
diag_frequency(5)=1.72800000e+04;
diag_timePhase(5)=0.00000000e+00;
diag_fields{1,6}='icefrntA';
diag_fileNames{6}='icefrntA';
diag_frequency(6)=1.72800000e+04;
diag_timePhase(6)=0.00000000e+00;
diag_fields{1,7}='UVEL';
diag_fileNames{7}='UVEL';
diag_frequency(7)=1.72800000e+04;
diag_timePhase(7)=0.00000000e+00;
diag_fields{1,8}='THETA';
diag_fileNames{8}='THETA';
diag_frequency(8)=1.72800000e+04;
diag_timePhase(8)=0.00000000e+00;
diag_fields{1,9}='VVEL';
diag_fileNames{9}='VVEL';
diag_frequency(9)=1.72800000e+04;
diag_timePhase(9)=0.00000000e+00;
diag_fields{1,10}='UVEL';
diag_fileNames{10}='UVEL_inst';
diag_frequency(10)=-1.72800000e+04;
diag_timePhase(10)=0.00000000e+00;
diag_fields{1,11}='VVEL';
diag_fileNames{11}='VVEL_inst';
diag_frequency(11)=-1.72800000e+04;
diag_timePhase(11)=0.00000000e+00;
diag_fields{1,12}='WVEL';
diag_fileNames{12}='WVEL_inst';
diag_frequency(12)=-1.72800000e+04;
diag_timePhase(12)=0.00000000e+00;
diag_fields{1,13}='THETA';
diag_fileNames{13}='THETA_inst';
diag_frequency(13)=-1.72800000e+04;
diag_timePhase(13)=0.00000000e+00;
diag_fields{1,14}='SALT';
diag_fileNames{14}='SALT_inst';
diag_frequency(14)=-1.72800000e+04;
diag_timePhase(14)=0.00000000e+00;

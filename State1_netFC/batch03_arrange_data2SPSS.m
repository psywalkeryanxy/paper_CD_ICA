%arrange data to spss
clear all;
close all;

allNetFC = [];

load('CDHC_NetStateFC_DMN2DMN');
allNetFC = [allNetFC,allMat];
load('CDHC_NetStateFC_CEN2CEN');
allNetFC = [allNetFC,allMat];

load('CDHC_NetStateFC_SA2SA');
allNetFC = [allNetFC,allMat];

load('CDHC_NetStateFC_DMN2SA');
allNetFC = [allNetFC,allMat];

load('CDHC_NetStateFC_DMN2CEN');
allNetFC = [allNetFC,allMat];

load('CDHC_NetStateFC_SA2CEN');
allNetFC = [allNetFC,allMat];
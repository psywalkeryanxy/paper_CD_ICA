%xinyuanyan@sanp

clear all;
close;

%load data
load('allsub_beta_all.mat');
cldata = allsub_beta;

load('Y.mat');



%big loop

X = cldata(:,[1:8]);%sphere LCAU,DLPFC
%model1, kfold = 10;
SVMModel1 = fitcsvm(X,Y,'Standardize',true,'ClassNames',{'CD','HC'});
ScoreSVMModel1 = fitSVMPosterior(SVMModel1,X,Y);
%[~,posteriorSVM] = kfoldPredict(ScoreSVMModel); 
% [label1,score] = predict(SVMModel1,X);
[label,score_svm1] = resubPredict(ScoreSVMModel1);
[Xsvm1,Ysvm1,Tsvm1,AUCsvm1] = perfcurve(Y,score_svm1(:,1),'CD');
plot(Xsvm1,Ysvm1,'r');
%count the lable
yesCD = sum(strcmp(label([1:10,19:58],1),'CD'));
yesHC = sum(strcmp(label([11:18,59:107],1),'HC'));


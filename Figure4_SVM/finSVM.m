%xinyuanyan
%yan00286@umn.edu

clear all;
close;

%load data
load('allsub_beta_all.mat');
cldata = allsub_beta;

load('Y.mat');


allyesCD = [];
allyesHC = [];
all_score_svm = zeros(length(Y),2);

%big loop
rep = 100;
numCD = 50;
numHC = 57;
for repnum = 1:rep
    
X = cldata(:,[1:8]);%sphere LCAU,DLPFC
%model1, kfold = 10;
SVMModel1 = fitcsvm(X,Y,'Standardize',true,'ClassNames',{'CD','HC'},'CrossVal','on','Kfold',10);
[label,score_svm] = kfoldPredict(SVMModel1);


%count the lable
yesCD = sum(strcmp(label([1:10,19:58],1),'CD'));
yesHC = sum(strcmp(label([11:18,59:107],1),'HC'));


allyesCD = [allyesCD;yesCD/numCD];
allyesHC = [allyesHC;yesHC/numHC];
all_score_svm = all_score_svm + score_svm;
end

% auc
[Xsvm1,Ysvm1,Tsvm1,AUCsvm1] = perfcurve(Y,all_score_svm(:,1)/rep,'CD');
plot(Xsvm1,Ysvm1,'r');

% accuracy for CD and HC
accCD = nanmean(allyesCD);
accHC = nanmean(allyesHC);

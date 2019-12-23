function [T1,T2]=SteadyStandingPoints(F,fs,ep,stand,sit)
% Function to identify the stable upright stance
% samples defines the number of sample of each epoch
samples=fix(fs*ep);
% indexes of the samples between the seat-off and the seat-on
t=stand:sit;
% cut the force signal between the seat-off and the seat-on
stand2sit=F(t);
% vector of standard deviations for each epoch
bstdF=std(buffer(stand2sit,samples,0,'nodelay'));
% vector of sample indexes for each epoch
bavgT=mean(buffer(t,samples,0,'nodelay'));
% the baseline standard deviation is calculated as the absolute value of the mean of the standard 
% deviations measured at the center part (± 5 epochs) of the signal between seat-off and seat-on
baseline=abs(mean(bstdF(round(length(bstdF)/2)-5:round(length(bstdF)/2)+5)));
% first half of the signal (center -> seat-off)
half1F=flip(bstdF(1:round(length(bstdF)/2)));
half1T=flip(bavgT(1:round(length(bstdF)/2)));
% the standing event is identified as the first index that exceed 3.5 times the baseline in the first half
T1=half1T(find(half1F>baseline*3.5,1));
% second half of the signal (center -> seat-on)
half2F=bstdF(round(length(bstdF)/2):end);
half2T=bavgT(round(length(bstdF)/2):end);
% the standing event is identified as the first index that exceed 3.5 times the baseline in the secondd half
T2=half2T(find(half2F>baseline*3.5,3));

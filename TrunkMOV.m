function IndexMov=TrunkMOV(Signal)
% INPUT: Ground Reaction Forcec divided in epochs of 5  samples (100 ms) - 5 x N° epochs
% Interpolate NaN
posNaN=find(isnan(Signal), 1);
if ~isempty(posNaN)
    Signal=interp1(1:size(Signal),Signal,1:size(Signal),'PCHIP');
end
% 
std_arr=stdonepoch(Signal);
% Baseline of the signal average of first 10 epochs (1s)
BsLn=abs(mean(std_arr(2,1:10))); 
Threshold=BsLn*3;
% First index that satisfy the condition is the start of the movement
IndexMov=std_arr(1,find(std_arr(2,:)>=Threshold,1));


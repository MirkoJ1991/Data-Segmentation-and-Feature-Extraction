function std_arr=stdonepoch(Signal)
% Calculate the std for each signal epochs
std_arr=NaN(2,size(Signal,2));

% Samples for each epoch
nsamples=size(Signal,1);

% Std across all epochs
std_arr(2,:)=std(Signal,0,1);

% Samples
std_arr(1,:)=(1:size(Signal,2))*nsamples;

function [TransitionPoints]=Bottom_Transition(Bott,Thresh,flag)
% Signal from electronic switch is here represented:
%  0V ------------<Seat-off     ---------------
% -5V            ----------------<Seat-on
% 
% Differential Mask
% Threshold is setted at -1
% Signal over threshold is setted at 0
Bott(Bott>-Thresh)=0; 
% Signal below threshold is setted at -5
Bott(Bott<Thresh)=-5;
% differentiate the signal
DerBott=diff(Bott);
% Bottomup identifies the seat-off
BOTTOMUP=find(DerBott<=Thresh,1,'first')+1; 
% Cosa simile ma ragionamento inverso per BOTTOMDOWN
BOTTOMDOWN=find(DerBott>-(Thresh),1,'last');
% BOTTOMUP identifies the seat-on
TransitionPoints=[BOTTOMUP BOTTOMDOWN]; 

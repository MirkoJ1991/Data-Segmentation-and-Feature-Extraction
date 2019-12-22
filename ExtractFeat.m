function Features=ExtraxtFeat(XSdata)
% Script for the feature extraction from the inertial signal
% I: XSdata data from inertial sensors structured as follows:
% |               IMU1                |....|               IMUN                |
% | AccX| AccY| AccZ| Roll|Pitch| Yaw |....| AccX| AccY| AccZ| Roll|Pitch| Yaw | <- N° Variables
% O: Features: Array of features 1 x (N°variables x 7 features)

Features=zeros(1,length(XSdata)*7)
Features(1,1:7:end)=nanmean(XSdata(:,3:NVar),1); 
Features(1,2:7:end)=nanstd(XSdata(:,3:NVar),0,1); 
Features(1,3:7:end)=sqrt(nanmean(XSdata(:,3:NVar).*XSdata(:,3:NVar)));
Features(1,4:7:end)=nanmax(XSdata(:,3:NVar),[],1)./Features(1,3:7:end); 
Features(1,5:7:end)=nanmin(XSdata(:,3:NVar),[],1)./Features(1,3:7:end); 
Features(1,6:7:end)=nanmean((diff(XSdata(end-4:end,3:NVar),1,1)/(1/50)),1); 
Features(1,7:7:end)=Features(1,2:7:end)./Features(1,1:7:end);

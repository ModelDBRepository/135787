clear
load seg.dat
difvth1=35;
difvth2=180;
timebin=0.005;
x0=[0,5];x1=[10,15,20,25,30,35,38,40,45,50]; x2=[57.5:7.5:350];
x=[x0,x1,x2];
a=seg(:,2:end);
mn=size(a);
m=mn(2);
delx=x-x(1);
adif=diff(a(:,:),1)./timebin;
%figure;plot(a(:,1))

for ik=1:m
n=200;
start_ap=find((adif(n:end,ik)>=difvth1 & adif(n:end,ik)<=difvth2),1);
start_ap0=find((adif(n:end,1)>=difvth1 & adif(n:end,1)<=difvth2),1);
delt(ik)=(start_ap(1)-start_ap0(1))*timebin*1000; %micron second
vthpos=start_ap(1)+n-1;
vth(ik)=a(vthpos,ik);
if vth(ik)>0
figure;plot(a(2:end,ik),'o')
hold on;plot(adif(1:end,ik),'r.')
xlim([vthpos-1500, vthpos+1500])
ylim([-75 55])
hold on;plot([vthpos,vthpos],[a(vthpos,ik),adif(vthpos-1,ik)],'-c')
hold on;plot([vthpos-1500,vthpos+1500],[vth(ik),vth(ik)],'-g')
hold on;plot([vthpos-1500,vthpos+1500],[adif(vthpos-1,ik),adif(vthpos-1,ik)],'-g')
end
%      delv=-55-vth(ik);
figure(10000);hold on;plot(a(vthpos-400:vthpos+500,ik),'-')
%figure(10000);hold on;plot(a(vthpos-1500:vthpos+1500,ik)+delv,'-')
end

figure;plot(x,delt,'-o')
xlabel('Axon Distance (\mum)')
ylabel('Spike latency (\mus)')

initpos=find(delt==min(delt));
if length(initpos)>2;
xinitpos=initpos(length(initpos)-1);
else
xinitpos=initpos(end);
end
initialpoint=x(xinitpos) 


% delx_iseg=x-x(xinitpos);
% for ik=1:m
% n=200;
% start_ap=find((adif(n:end,ik)>=difvth1 & adif(n:end,ik)<=difvth2),1);
% start_ap_realinit=find((adif(n:end,xinitpos)>=difvth1 & adif(n:end,xinitpos)<=difvth2),1);
% delt_iseg(ik)=start_ap(1)-start_ap_realinit(1);
% end
% holdv=mean(a(1:n,:));
% %v=[holdv; vel];
% vel_iseg=delx_iseg.*0.001./(delt_iseg*timebin);
% holdv_iseg=mean(a(1:n,:));
% velocity_iseg=[x; vel_iseg]';
% delt(end);
% delt_iseg;
% diff(delx)./diff(delt);
% diff(delx_iseg)./diff(delt_iseg);
% delt_iseg_soma=reverse(delt_iseg(1:xinitpos));
% delt_iseg_axon=delt_iseg(xinitpos:end);
% delx_iseg_soma=reverse(delx_iseg(1:xinitpos));
% delx_iseg_axon=delx_iseg(xinitpos:end);
% vel_iseg_soma=abs(diff(delx_iseg_soma,1))./abs(diff(delt_iseg_soma,1))
% vel_iseg_axon=diff(delx_iseg_axon,1)./abs(diff(delt_iseg_axon,1))
% velocity_iseg_soma=[x(1:xinitpos-1)',reverse(vel_iseg_soma)']
% velocity_iseg_axon=[x(xinitpos:end-1)',reverse(vel_iseg_axon)']
% figure;plot(velocity_iseg(:,1),velocity_iseg(:,2),'-o')
% delt
% t1=abs(delt(end));
% t2=abs(delt_axon(end));
% L=x(end);
% initpoint_comput=L*(t2-t1)./(2.*t2)
% initpoint_real=initialpoint
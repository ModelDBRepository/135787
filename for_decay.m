%cd C:\neuron\Mainen_Sejnowski\PatDemo\
%for best_sm50_600_slice_init_decay.hoc
clear
load seg.dat
timebin=0.03;
mn=size(seg);
m=mn(2);
x0=[0,5];x1=[10,15,20,25,30,35,38,40,45,50]; x2=[57.5:7.5:350];
%x0=[0,5];x1=10:4:50; x2=[50,65,80:30:350];
x=[x0,x1,x2];%
x=x(1:end-1); %don't count the last point since DC-injection to the axon will induce weired spike.
t=seg(:,1);
a=seg(:,2:end-1);
tot=std(a);
tot=tot/(tot(1));
tot=[x',tot']
figure;
subplot(1,2,1);plot(t,a(:,1))
hold on;plot(t,a(:,10),'-r')
hold on;plot(t,a(:,48),'-c')
axis tight
ylim([-75 -60])
legend('Soma V','AIS 40 \mum','AIS 320 \mum',2)
xlabel('Time (ms)')
ylabel('V (mV)')

subplot(1,2,2);plot(x,tot(:,2),'-o')
hold on;plot([0 350], [1/exp(1), 1/exp(1)],'-r')
axis tight
xlabel('Axon Distance (\mum)')
ylabel('V Decay percentage (%)')

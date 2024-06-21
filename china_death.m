clc
clear all
close all
set(0,'DefaultAxesFontSize',15);

%%%%%%%%%%%%%%%% Daily reported cases %%%%%%%%%%%%%%%%%%%
%daily=xlsread('covid-world-29-12-2022-1','F109078:F109209');
%%%%% for France from 22/11/2021 to 22/2/2022
%daily_death=xlsread('covid-world-29-12-2022-1','I109078:I109209');
%cumulative_death=xlsread('covid-world-29-12-2022-1','H109078:H109209');
daily=[259 457 688 688 1771 1459 1737 1981 2099 2099 2825 3235 3883 3694 3143 2652 2652 2973 2467 2015 14108 5090 5090 2008 2048 1888 1749 391 ...
    391 832 648 214 508 406 406 327 427 573 202 125 125 139 143 200 124 102 86 72 72 38 24 22 17 19 16 16 22 27 30 33 41 51 53 55 55 55 50 48 48 44 40 35 32 32 32 35 39 ...
    41 45 55 72 71 68 65 ...
    ];
   
   active=[771 1208 1870 2613 4349 4349 7417 9308 11289 13748 16369 16369 22942 26302 28985 31774 33738 33738 37626 38791 51591 55748 56873 56873 57934 58016 57805 ...
       56301 54921 53284 53284 49824 47765 45600 43258 39919 39919 35129 32616 30004 27423 25353 25353 22179 20533 19016 17721 16136 13524 12088 10733 9893 8967 8967 8056 8056 ...
       6569 6013 5353 5120 4735 3947 3460 3460 3124 2691 2691 2004 2004 1863 1727 1558 1376 1376 1242 1190 1160 1116 1089 1138 1170 1170 1137 1107 ...
       ];
   
   daily_recovery=[34 4 11 2 2 43 21 47 72 85 157 157 260 261 387 599 599 632 715 753 1162 1373 1373 1323 1425 1708 1781 1781 2151 2351 1742 2333 2519 2519 2746 ...
       3622 2823 2823 2706 2706 2662 2178 1682 1663 1535 1297 1587 1309 1434 1365 1365 842 842 934 819 819 730 590 700 263 491 491 401 537 383 0 604 604 186 170 163 209 ...
       209 114 89 112 91 70 70 50 88 75 76 76 ...
       ];
   
   daily_death=[8 16 15 20 26 25 25 30 42 45 45 55 62 68 70 77 77 91 98 100 117 122 122 136 130 115 113 116 116 114 108 119 106 91 91 42 40 42 41 36 34 34 33 29 29 25 21 21 16 14 10 10 13 ...
       13 12 11 7 6 6 7 7 7 6 4 4 5 2 4 4 5 5 5 4 3 1 1 1 2 2 1 2 1 1 1 ...
       ];
       
   
  x=1:1:length(daily);
  %plot(x,daily,'r','MarkerSize',8);hold on
%plot(x,daily,'k.','MarkerSize',10);hold on
 %%%%%%%%%%%%%%%% 7D %%%%%%%%%%%%%%%%%%%%%%%%%%
DD=length(daily);

active_7d(1)=mean(active(1:4));
active_7d(2)=mean(active(1:5));
active_7d(3)=mean(active(1:6));
for j=4:DD-3
   active_7d(j)=mean(active(j-3:j+3));
end
active_7d(DD-2)=mean(active(DD-5:DD));
active_7d(DD-1)=mean(active(DD-4:DD));
active_7d(DD)=mean(active(DD-3:DD));

daily_7d(1)=mean(daily(1:4));
daily_7d(2)=mean(daily(1:5));
daily_7d(3)=mean(daily(1:6));
for j=4:DD-3
   daily_7d(j)=mean(daily(j-3:j+3));
end
daily_7d(DD-2)=mean(daily(DD-5:DD));
daily_7d(DD-1)=mean(daily(DD-4:DD));
daily_7d(DD)=mean(daily(DD-3:DD));


daily_death_7d(1)=mean(daily_death(1:4));
daily_death_7d(2)=mean(daily_death(1:5));
daily_death_7d(3)=mean(daily_death(1:6));
for j=4:DD-3
   daily_death_7d(j)=mean(daily_death(j-3:j+3));
end
daily_death_7d(DD-2)=mean(daily_death(DD-5:DD));
daily_death_7d(DD-1)=mean(daily_death(DD-4:DD));
daily_death_7d(DD)=mean(daily_death(DD-3:DD));

 cumulative_death_7d(1)=daily_death_7d(1);
 for i=2:length(daily)
    cumulative_death_7d(i)= cumulative_death_7d(i-1)+daily_death_7d(i);
 end

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%daily_death_7d(71)=daily_death_7d(70);
%daily_death_7d(78)=daily_death_7d(75);
for i=1:length(daily_death_7d)
         if daily_death_7d(i) <0
             daily_death_7d(i)=0;
         end
     end


daily_death_7d1=daily_death_7d(1:end);
daily_7d1=daily_7d(1:end);

%     K=daily_recovered_7d1(1:150)/59100000;
K=daily_death_7d1;
h=1;
    N=length(K);
    NN=1:h:N;
    hn=N^(-1/5);
     

%      Kd=daily_7d1/59100000;
      Kd=daily_7d1;
     Nd=length(Kd);
    NNd=1:h:Nd;
    hnd=Nd^(-1/5);





    l=@(xx) (1/sqrt(2*pi))*exp(-(xx.^2)/2);


    for j=1:length(NN)

        Khat1(j)=l((j-1)/hn)*K(1);
        for k=2:length(K)
             Khat1(j)=Khat1(j)+l((j-k)/hn)*K(k);
        end
        Khat2(j)=l((j-1)/hn);
        for k=2:length(K)
             Khat2(j)=Khat2(j)+l((j-k)/hn);
        end
        Khat(j)=Khat1(j)/Khat2(j);


    end

 



    ld=@(xx) (1/sqrt(2*pi))*exp(-(xx.^2)/2);


    for j=1:length(NN)

        Khat1d(j)=l((j-1)/hnd)*Kd(1);
        for k=2:length(Kd)
             Khat1d(j)=Khat1d(j)+l((j-k)/hnd)*Kd(k);
        end
        Khat2d(j)=l((j-1)/hnd);
        for k=2:length(Kd)
             Khat2d(j)=Khat2d(j)+ld((j-k)/hnd);
        end
        Khatd(j)=Khat1d(j)/Khat2d(j);


    end



%     plot(daily_recovered_7d,'k.','MarkerSize',20); hold on 
%     plot(Khat,'r','LineWidth',2); hold on 
%     axis([0 length(daily_recovered_7d) 0 1.1*max(daily_recovered_7d)]);

%     c(1)=0;
%  c(2)=(2/h)*Khat(2)/Khatd(1);
%  c(3)=((2/h)*Khat(3)-2*c(2)*Khatd(2))/Khatd(1);
% for j=3:length(NN)
%    
%     c(j)=((2/h)*Khat(j)-2*sum(c(2:1:j-1).*Khatd(j-1:-1:2)))/Khatd(1);
% end
aa=1:0.05:30; bb=0:0.05:30;
for i=1:length(aa)
    for k=1:length(bb)
         a=aa(i);b=bb(k);
        if 4 <=abs((a-1)*b) && abs((a-1)*b)<=30 
     
GG=0.03*gampdf(NN,a,b);
 

for j=1:length(NN)
FF(j)=(h/2)*(GG(1)*Khatd(j-1+1)+GG(j)*Khatd(1)+2*sum(GG(2:1:j-1).*Khatd(j-1:-1:2)));

end

for j=1:length(NN)
    EE(j)=(abs((FF(j)-Khat(j))));
end
 EEE(i,k)=sqrt(sum(EE));
  else
      EEE(i,k)=NaN;
        end
%EEE(i,k)=(max(EE));

    end
end

EEEE=min(min(EEE));


for i=1:length(aa)
    for k=1:length(bb)
if EEE(i,k)==EEEE
    
    aa1=aa(i)
   bb1= bb(k)

end






    end
end
%aa1*gamma(1+1/bb1)

a=aa1;b=bb1;



GG=0.03*gampdf(NN,a,b);
Mean=a*b
%%Median= median(GG)
Mode=(a-1)*b
Median1=gamrnd(a,b,[20000 1]);
Median=median(Median1)

for j=1:length(NN)
FF1(j)=(h/2)*(GG(1)*Khatd(j-1+1)+GG(j)*Khatd(1)+2*sum(GG(2:1:j-1).*Khatd(j-1:-1:2)));

end

NNN(1)=0;
for i=2:length(NN)
    NNN(i)=NN(i)-1;
end
GG1=0.03*gampdf(NNN,aa1,bb1);
FF1=FF1+7;
    %plot(GG1(1:200),'r','LineWidth',2); hold on 
    CK(1)=K(1);CKhat(1)=Khat(1);CFF1(1)=FF1(1);
    for i=2:length(K)
        CK(i)=CK(i-1)+K(i);
    end
    for i=2:length(Khat)
        CKhat(i)=CKhat(i-1)+Khat(i);
    end
    for i=2:length(FF1)
        CFF1(i)=CFF1(i-1)+FF1(i);
    end

    Cactive_7d(1)=active_7d(1);
    for i=2:length(active_7d)
        Cactive_7d(i)=Cactive_7d(i-1)+active_7d(i);
    end




    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
MM1=mean(active_7d*(0.03/(Mode)));
SS1=std(active_7d*(0.03/(Mode)));
MS1=MM1-3*SS1;
xconf1 = [1:1:length(active_7d) length(active_7d):-1:1] ;         
yconf1 = [active_7d*(0.03/(Mode))+MS1 active_7d(end:-1:1)*(0.03/(Mode))-MS1];
%fill(xconf1,yconf1,'m');
fill(xconf1,yconf1,'m','FaceAlpha',0.4,'LineStyle','none');hold on

MM2=mean(active_7d*(0.03/(Median)));
SS2=std(active_7d*(0.03/(Median)));
MS2=MM2-3*SS2;
xconf2 = [1:1:length(active_7d) length(active_7d):-1:1] ;         
yconf2 = [active_7d*(0.03/(Median))+MS2 active_7d(end:-1:1)*(0.03/(Median))-MS2];
%fill(xconf1,yconf1,'m');
fill(xconf2,yconf2,'r','FaceAlpha',0.6,'LineStyle','none'); hold on

MM3=mean(active_7d*(0.03/(Mean)));
SS3=std(active_7d*(0.03/(Mean)));
MS3=MM3-3*SS3;
xconf3 = [1:1:length(active_7d) length(active_7d):-1:1] ;         
yconf3 = [active_7d*(0.03/(Mean))+MS3 active_7d(end:-1:1)*(0.03/(Mean))-MS3];
%fill(xconf1,yconf1,'m');
fill(xconf3,yconf3,'g','FaceAlpha',0.4,'LineStyle','none'); hold on


plot(K,'k.','MarkerSize',20); hold on 
  %plot(Khat,'r','LineWidth',1); hold on 
 plot(FF1,'b','LineWidth',2); hold on 
 plot(active_7d*(0.03/(Mode)),'m','LineWidth',2); hold on 
   plot(active_7d*(0.03/(Mean)),'g','LineWidth',2); hold on
    plot(active_7d*(0.03/(Median)),'r','LineWidth',2); hold on
%axis([0 243 0 4000])

  xticks([0 42 84]);
   xticklabels({'23/1/2020','6/3/2020','15/4/2020'});
xlabel('Days', 'interpreter','latex');
ylabel('Daily death', 'interpreter','latex');
axis([0 84 0 400]);

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%     plot(GG1,'b','LineWidth',3);
% axis([0 243 0 0.9*10^(-3)])
% xlabel('t', 'interpreter','latex');
% ylabel('d(t)', 'interpreter','latex');

% MM1=mean(Cactive_7d*(0.03/(Mode)));
% SS1=std(Cactive_7d*(0.03/(Mode)));
% MS1=MM1-3*SS1;
% xconf1 = [1:1:length(Cactive_7d) length(Cactive_7d):-1:1] ;         
% yconf1 = [Cactive_7d*(0.03/(Mode))+MS1 Cactive_7d(end:-1:1)*(0.03/(Mode))-MS1];
% %fill(xconf1,yconf1,'m');
% fill(xconf1,yconf1,'m','FaceAlpha',0.4,'LineStyle','none');hold on
% 
% MM2=mean(Cactive_7d*(0.03/(Median)));
% SS2=std(Cactive_7d*(0.03/(Median)));
% MS2=MM2-3*SS2;
% xconf2 = [1:1:length(Cactive_7d) length(Cactive_7d):-1:1] ;         
% yconf2 = [Cactive_7d*(0.03/(Median))+MS2 Cactive_7d(end:-1:1)*(0.03/(Median))-MS2];
% %fill(xconf1,yconf1,'m');
% fill(xconf2,yconf2,'r','FaceAlpha',0.6,'LineStyle','none'); hold on
% 
% MM3=mean(Cactive_7d*(0.03/(Mean)));
% SS3=std(Cactive_7d*(0.03/(Mean)));
% MS3=MM3-3*SS3;
% xconf3 = [1:1:length(Cactive_7d) length(Cactive_7d):-1:1] ;         
% yconf3 = [Cactive_7d*(0.03/(Mean))+MS3 Cactive_7d(end:-1:1)*(0.03/(Mean))-MS3];
% %fill(xconf1,yconf1,'m');
% fill(xconf3,yconf3,'g','FaceAlpha',0.4,'LineStyle','none'); hold on
% 
% 
% plot(CK,'k.','MarkerSize',20); hold on 
%   %plot(Khat,'r','LineWidth',1); hold on 
%  plot(CFF1,'b','LineWidth',2); hold on 
%  plot(Cactive_7d*(0.03/(Mode)),'m','LineWidth',2); hold on 
%    plot(Cactive_7d*(0.03/(Mean)),'g','LineWidth',2); hold on
%     plot(Cactive_7d*(0.03/(Median)),'r','LineWidth',2); hold on
% % axis([0 243 0 7*10^5])
% % 
% xticks([0 42 84]);
% xticklabels({'23/1/2020','6/3/2020','15/4/2020'});
% xlabel('Days', 'interpreter','latex');
% ylabel('Cumulative death', 'interpreter','latex');
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%  plot(K,'k.','MarkerSize',20); hold on 
%  plot(Khat,'r','LineWidth',3); hold on 
%  plot(FF1,'b','LineWidth',3); hold on
%  plot(active_7d(1:150)*(0.97/(Mode)),'m','LineWidth',3); hold on 
%  plot(active_7d(1:150)*(0.97/(Mean)),'g','LineWidth',3); hold on
%  plot(active_7d(1:150)*(0.97/(Median)),'y','LineWidth',3); hold on



%  plot(CK,'k.','MarkerSize',20); hold on 
%   plot(CKhat,'r','LineWidth',3); hold on 
%  plot(CFF1,'b','LineWidth',3); hold on 
%  plot(Cactive_7d*(0.97/(Mode)),'m','LineWidth',3); hold on 
%    plot(Cactive_7d*(0.97/(Mean)),'g','LineWidth',3); hold on
%     plot(Cactive_7d*(0.97/(Median)),'y','LineWidth',3); hold on


% X=[3 5 6 7 8 11 12 13 14 15 16 17 18 19 20 21 24];
% death=[1 1 2 1 1 4 4 3 3 1 3 1 1 2 1 1 1];
% DEATH=death/(31);
% bar(X,DEATH);hold on

 

clc
clear all
close all
set(0,'DefaultAxesFontSize',15);

%%%%%%%%%%%%%%%% Daily reported cases %%%%%%%%%%%%%%%%%%%
daily=xlsread('US_included_world_data','F72926:F73168');
%%%%% for France from 22/11/2021 to 22/2/2022
daily_death=xlsread('US_included_world_data','I72926:I73168');
cumulative_death=xlsread('US_included_world_data','H72926:H73168');
   active1=[ 19 75 152 220 310 455 593 822 1049 1578 2265 3299 3919 5064 6391 7991 8518 10593 12842 14958 17753 20607 23077 26066 28711 33191 37859 42672 46625 50396 53995 57469 61956 66352 69997 73806 75444 77545 ...
           80478 92951 95283 98166 101137 103074 103946 105133 106741 105129 106121 102102 102460 106130 105252 106436 106795 104077 104047 103509 103630 102302 103615 102867 101571 100957 97403 96286 ...
           98672 95428 97898 92696 93176 91218 89307 87637 84507 82983 82144 80916 78098 76074 71691 69801 67958 66155 64725 62340 60542 58899 57324 56163 54865 52501 50519 47529 45714 43223 41603 ...
           40893 39416 38819 37949 36492 35390 34773 34239 32376 31211 30136 28492 26977 25761 25394 24050 23405 22579 21417 21085 20844 20508 19441 18522 18170 17505 16703 16548 16363 15430 ...
           15122 14927 14751 14488 14509 14576 14109 13462 13326 13295 13170 13046 13024 12786 12360 12340 12323 12235 12307 12271 12115 12189 12271 12168 12308 12429 12447 12454 12462 12076 12303 ...
           12303 12302 12328 12328 12492 12540 12770 13109 13109 13407 13407 13637 13927 14404 14404 14733 14867 15360 15360 16014 16678 17503 18438 19194 19793 20751 21930 23035 24156 25205 26081 ...
           26766 27835 28938 30128 31237 32131 33003 33797 34750 35731 37542 37542 38565 39246 40601 41489 42558 43272 44216 45203 45203 45617 46253 46924 47886 48772 49805 50518 50828 51468 ...
           52863 54219 55798 57663 59153 66389 66251 66251 70439 75191 79467 83168 87611 92906 99761 107853 117531 126892 134865 143498 156266 170214 187005 204287 223461 238018 256510 277943 300778 327499 353299 ...
           380229 398765 420572 445750 475131 502160 535854 562233 577134 594049 617431 639375 668533 693229 717570 723060 739173 748741 767489 783257 798024 812412 803403 804999 794505 797890 788036 787657 794177 786073 ...
           775410 755074 751199 746097 739856 740358 734027 721708 793612 677299 669672 661992 662118 651061 642048 606950 606950 599583 589889 593448 584890 575555 566538 559003 543388 543664 544278 538481 532021 528494 532495 ...
           536614 538894 532928 531626 532142 534116 533307 536173 544972 541359 535607 526244 526244 523706 523565 519763 514737 503310 500401 473111 478122 475027 475974 469301 460176 457918 454363 446479 442696 434088 ...
           428236 419038 415328 410454 408821 406429 406815 399575 394437 390081 384687 381389 380399 381959 377425 374442 370222 365195 362741 365023 370360 369509 369814 371916 378240 386110 393007 402010 402968 ...
           409400 414976 423516 432478 440868 446592 446399 452743 461246 471516 483291 494014 505195 505084 511334 514725 522969 531708 540387 540387 547078 529249 528458 529049 531202 535377 540684 541003 533813 530595 528820 ...
           531273 533050 532614 536801 537858 523446 515586 512076 504102 500832 500750 492160 486962 482397 477748 474475 473044 451329 459532 448919 441247 437958 421950 428168 427267 408688 403773 407902 403653 402332 ...
           396928 396928 389102 380098 373451 369427 365481 359113 353115 342946 333328 321806 315614 309741 302779 298057 291460 283819 274548 267219 260008 252576 249164 243765 234759 225937 218518 211583 206178 201537 195884 ...
           ];
   active=active1(216:end);
       
       cumulative(1)=daily(1);
 for i=2:length(daily)
     cumulative(i)=cumulative(i-1)+daily(i);
 end
 for i=1:length(daily)
 recovery(i)=cumulative(i)-active(i)-cumulative_death(i);
 end
 
 daily_recovery(1)=recovery(1);
 for i=2:length(daily)
      daily_recovery(i)=recovery(i)-recovery(i-1);
 end
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
        if 7 <=abs((a-1)*b) && abs((a-1)*b)<=30 
     
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
axis([0 243 0 4000])

 xticks([0 121 243]);
  xticklabels({'1/10/2020','30/1/2021','31/5/2021'});
xlabel('Days', 'interpreter','latex');
ylabel('Daily death', 'interpreter','latex');

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
% axis([0 243 0 7*10^5])
% 
%  xticks([0 121 243]);
%   xticklabels({'1/10/2020','30/1/2021','31/5/2021'});
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




 

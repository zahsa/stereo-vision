%******************************************************
%----- Zahra Sadeghi
%----- University of Tehran
%----- Institute for Research in Fundamental Sciences (IPM)
%----- zahra.sadeghi@ut.ac.ir
%----- zahra.sadeghi@ipm.ac.ir
%******************************************************
close all
cube=[];
Len=2;
l=1;
for k=-1:2:1
    for i=-1:2:1
        for j=-1:2:1
            cube(l,:)=[i j k 1];
            l=l+1;
        end
    end
end

%% generate 12 random points inside the cube
x=-1+(2*rand(1,12));
y=-1+(2*rand(1,12));
z=-1+(2*rand(1,12));
% x=[.5 .3 .2 -.7 .36 -.45 -.11 .15 -.96 .12 .74 -.9];
% y=[-.23 -.73 -.57 -.55 .36 -.45 .11 .34 -.61 .77 -.23 .03];
% z=[.67 .01 .044 -.07 .86 -.15 -.82 .35 -.26 .92 -.22 .49];
o=ones(1,12);
xy=[x;y;z;o];
xy=xy';
object(1:8,:)=cube(1:8,:);
object(9:20,:)=xy(1:12,:);

xyi_Down=DownCamera(object,Len);
xyi_Up=UpCamera(object,Len);

%% problem 4)a
% FM_a=FundamentalMat((xyi_Down(1:8,:)),xyi_Up(1:8,:),4);
% FM_a
% pause
%% problem 4)b
% randpt=8+randperm(12);
% FM_b=FundamentalMat((xyi_Down(randpt(1:8),:)),xyi_Up(randpt(1:8),:),4);
% FM_b
% pause
%% problem 4)c
% ind(1:8)=(1:8);
% ind(9:16)=randpt(1:8);
% FM_c=FundamentalMat((xyi_Down(ind(1:16),:)),xyi_Up(ind(1:16),:),4);
% FM_c
% pause
%% problem 5
% (object(randpt(9:12),:))'
% Reconstruction(xyi_Up(randpt(9:12),:),xyi_Down(randpt(9:12),:),5);
% pause
%% problem 6 --Resolution 0.01
%% problem 6)a
% FM_a_res1=FundamentalMat((xyi_Down(1:8,:)),xyi_Up(1:8,:),6);
% FM_a_res1
% pause
%% problem 6)b
% randpt=8+randperm(12);
% FM_b_res1=FundamentalMat((xyi_Down(randpt(1:8),:)),xyi_Up(randpt(1:8),:),6);
% FM_b_res1
% pause
%% problem 6)c
% ind(1:8)=(1:8);
% ind(9:16)=randpt(1:8);
% FM_c_res1=FundamentalMat((xyi_Down(ind(1:16),:)),xyi_Up(ind(1:16),:),6);
% FM_c_res1
% pause
%% problem 6)d
% object(randpt(9:12),:)
% Reconstruction(xyi_Up(randpt(9:12),:),xyi_Down(randpt(9:12),:),6)
% pause
%% problem 7 --Resolution 0.05
%% problem 7)a
% FM_a_res2=FundamentalMat((xyi_Down(1:8,:)),xyi_Up(1:8,:),7);
% FM_a_res2
% pause
%% problem 7)b
% randpt=8+randperm(12);
% FM_b_res2=FundamentalMat((xyi_Down(randpt(1:8),:)),xyi_Up(randpt(1:8),:),7);
% FM_b_res2
% pause
%% problem 7)c
ind(1:8)=(1:8);
ind(9:16)=randpt(1:8);
FM_c_res2=FundamentalMat((xyi_Down(ind(1:16),:)),xyi_Up(ind(1:16),:),7);
FM_c_res2
pause
%% problem 7)d
% object(randpt(9:12),:)
% Reconstruction(xyi_Up(randpt(9:12),:),xyi_Down(randpt(9:12),:),7);
%% problem 8
% rnd=1+round(3*rand(1,1));
% rndpt=8+rnd;
% epipolar_lines(FM_c,xyi_Down,rndpt)
% pause
%% problem 9
rnd=1+round(3*rand(1,1));
rndpt=8+rnd;
% epipolar_lines(FM_c_res1,xyi_Down,rndpt)
% pause
epipolar_lines(FM_c_res2,xyi_Down,rndpt)
% pause
%% problem 10-- add noise
% point=3;
% object(point,:)
% for i=1:1000
% threeD(i,:)=Reconstruction(xyi_Up(point,:),xyi_Down(point,:),10);
% end
% 
% figure
% title('x values')
% hold on
% hist(threeD(:,1))
% figure
% title('y values')
% hold on
% hist(threeD(:,2))
% figure
% title('z values')
% hold on
% hist(threeD(:,3))
% 
% x_m=mean(threeD(:,1))
% x_v=var(threeD(:,1))
% y_m=mean(threeD(:,2))
% y_v=var(threeD(:,2))
% z_m=mean(threeD(:,3))
% z_v=var(threeD(:,3))
% 

%******************************************************
%----- Zahra Sadeghi
%----- University of Tehran
%----- Institute for Research in Fundamental Sciences (IPM)
%----- zahra.sadeghi@ut.ac.ir
%----- zahra.sadeghi@ipm.ac.ir
%******************************************************
function [xyi_Down]=DownCamera(object,Len)
% close all
% clear all
view_number=2;
[f,rx,ry,rz,Tx,Ty,Tz]=View(view_number);

ox=0;
oy=0;
sx=1;
sy=1;
% cube=object_down(1:8,:);

sc=size(object);

Xw=object(:,1);
Yw=object(:,2);
Zw=object(:,3);

R=Rotatation(rx,ry,rz);

T=[Tx Ty Tz];
RT=[R T'];
F = [-f 0 0 ; 0 -f 0;0 0 1 ];

% RT=[R T';0 0 0 1];
% F = [-f 0 0 0; 0 -f 0 0; 0 0 1 0];

S=[sx 0 ox;0 sy oy;0 0 1];

XYZw=[Xw';Yw';Zw';ones(1,sc(1))];
I=S*F*RT*XYZw;

XYZw=XYZw';
XYZw(:,4)=[];

% Xi=I(1,:);
% Yi=I(2,:);
% Zi=I(3,:);

I = I./repmat(I(3,:),[3,1]);

% I(3,:)=[];

xyi=I';
xyi_Down=xyi;

%% Plot the projected points
xi = xyi(:,1);
yi = xyi(:,2);
figure
plot(xi,yi,'*')
hold on
%% Plot the projected cube
% figure
l=1;
while l+(Len-1)<=8%sc(1)
    plot(xi(l:l+(Len-1)),yi(l:l+(Len-1)),'-*')
    hold on
 l=l+(Len);
 end

 p=1; 
while p<=8%sc(1) 
 for k=p:p+(Len-1)
     if k+(Len-1)*Len<=sc(1)
     plot(xi(k:Len:k+(Len-1)*Len),yi(k:Len:k+(Len-1)*Len),'-*')
     hold on
     end
 end
 p=p+Len*Len;
end

p=1; 
while p<=8%sc(1) 
 for k=p:p+(Len-1)
%      k
     if k+Len*Len*(Len-1)<=8%sc(1)
     plot(xi(k:Len*Len:k+Len*Len*(Len-1)),yi(k:Len*Len:k+Len*Len*(Len-1)),'-*')
     hold on
     end
 end
 p=p+Len;
end
title('Down view') 

plot(xi(1),yi(1),'rs','LineWidth',2,'MarkerEdgeColor','r', 'MarkerFaceColor','r');
plot(xi(2),yi(2),'gs','LineWidth',2,'MarkerEdgeColor','g', 'MarkerFaceColor','g');
plot(xi(3),yi(3),'bs','LineWidth',2,'MarkerEdgeColor','b', 'MarkerFaceColor','b');
plot(xi(4),yi(4),'ys','LineWidth',2,'MarkerEdgeColor','y', 'MarkerFaceColor','y');
plot(xi(5),yi(5),'ms','LineWidth',2,'MarkerEdgeColor','m', 'MarkerFaceColor','m');
plot(xi(6),yi(6),'cs','LineWidth',2,'MarkerEdgeColor','c', 'MarkerFaceColor','c');
plot(xi(7),yi(7),'ks','LineWidth',2,'MarkerEdgeColor','k', 'MarkerFaceColor','k');
plot(xi(8),yi(8),'ks','LineWidth',2,'MarkerEdgeColor','k', 'MarkerFaceColor','y');

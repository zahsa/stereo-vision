%******************************************************
%----- Zahra Sadeghi
%----- University of Tehran
%----- Institute for Research in Fundamental Sciences (IPM)
%----- zahra.sadeghi@ut.ac.ir
%----- zahra.sadeghi@ipm.ac.ir
%******************************************************
function epipolar_lines(FM,xyi_Down,point)

colour =['r' 'g' 'b' 'y' 'm' 'c' 'k' 'y'];
s=size(xyi_Down);
% for i=1:8%s(1)

i=point;
   %% up epipolar line
    d=xyi_Down(i,:);
    dx=d(1);
    dy=d(2);

    Pd = [dx; dy; 1];
    l = FM*Pd;

    %ax+by+c=0; y = (-c-ax)/b
    epux=-50:50;
    epuy=(-l(3)-l(1)*epux)/l(2);
    figure(2); 
    hold on;
    
    plot(epux,epuy,colour(mod(i-1,8)+1));
 
%% down epipolar line
   [FU, FD, FV] = svd(FM); 
    e=FV(:,3);
    e=e/e(3);
    
    epdx=-50:50;
    epdy=dy + (epdx-dx)*(e(2)-dy)/(e(1)-dx);
    figure(1);
    hold on;
    
    plot(epdx,epdy,colour(mod(i-1,8)+1));
pause
% end

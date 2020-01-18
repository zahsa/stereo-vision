%******************************************************
%----- Zahra Sadeghi
%----- University of Tehran
%----- Institute for Research in Fundamental Sciences (IPM)
%----- zahra.sadeghi@ut.ac.ir
%----- zahra.sadeghi@ipm.ac.ir
%******************************************************
function [f,x_angle,y_angle,z_angle,Tx,Ty,Tz]=View(vw)
theta=8*pi/180;
if vw==1
    f=1;
    x_angle=theta;
    y_angle=0;
    z_angle=0;
    Tx=10*cos(theta);
    Ty=0;
    Tz=-10*sin(theta);
elseif vw==2
    f=1;
    x_angle=-theta;
    y_angle=0;
    z_angle=0;
    Tx=10*cos(theta);
    Ty=0;
    Tz=10*sin(theta);

end
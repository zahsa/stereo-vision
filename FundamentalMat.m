%******************************************************
%----- Zahra Sadeghi
%----- University of Tehran
%----- Institute for Research in Fundamental Sciences (IPM)
%----- zahra.sadeghi@ut.ac.ir
%----- zahra.sadeghi@ipm.ac.ir
%******************************************************
function FM=FundamentalMat(xyi_Down,xyi_Up,p)
if p==6
    xyi_Down=roundn(xyi_Down,-2);
    xyi_Up=roundn(xyi_Up,-2);
elseif p==7
    xyi_Down=roundn(xyi_Down*2,-1)/2;
    xyi_Up=roundn(xyi_Up*2,-1)/2;
end

%% Normalize
[xyi_Down_n, T1] = normalise2dpts(xyi_Down');
[xyi_Up_n, T2] = normalise2dpts(xyi_Up');
xyi_Up=xyi_Up_n';
xyi_Down=xyi_Down_n';
%% %%%%%%%%%
sz=size(xyi_Down);
xi1=xyi_Down(:,1);
yi1=xyi_Down(:,2);
xi2=xyi_Up(:,1);
yi2=xyi_Up(:,2);

o = ones(size(xi1));

A =[xi1.*xi2 yi1.*xi2 xi2 xi1.*yi2 yi1.*yi2 yi2 xi1 yi1 o];

[U D V]=svd(A);
f=V(:,end);
F=[f(1) f(2) f(3); f(4) f(5) f(6); f(7) f(8) f(9)];
% F = reshape(f,[3,3])';

%% enforce singularity
[FU FD FV]=svd(F);

FDnew=FD;
FDnew(3,3)=0;
FM = FU*FDnew*FV';

% [FU,FD,FV] = svd(F);
% FM = FU*diag([D(1,1) D(2,2) 0])*FV';

%% Denormalize
FM = T2'*FM*T1;



% epipolar_lines(FM,xyi_Down);

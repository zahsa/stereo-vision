%******************************************************
%----- Zahra Sadeghi
%----- University of Tehran
%----- Institute for Research in Fundamental Sciences (IPM)
%----- zahra.sadeghi@ut.ac.ir
%----- zahra.sadeghi@ipm.ac.ir
%******************************************************
function Mstar=Reconstruction(img_Up,img_Down,p)
ox=0;
oy=0;
sx=1;
sy=1;
f=1;
theta=5*pi/180;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if p==10
     %add noise
    n=0 + sqrt(0.01) * randn(1,1);
    sx=sx+n;
    sy=sy+n;
    ox=ox+n;
    oy=oy+n;
    f=f+n;
elseif p==6
    img_Down=roundn(img_Down,-2);
    img_Up=roundn(img_Up,-2);
elseif p==7
    img_Down=roundn(img_Down*2,-1)/2;
    img_Up=roundn(img_Up*2,-1)/2;

end

Xw=[];
Yw=[]; 
Zw=[];
% cube=zeros(4,4,4,4);
cube=[];
l=1;
for k=-1:2:1
    for i=-1:2:1;
        for j=-1:2:1;
            cube(l,:)=[i j k 1];
            l=l+1;
        end
    end
end
% cube    
% sc=size(cube);   
% Xw=cube(:,1);
% Yw=cube(:,2);
% Zw=cube(:,3);

%% up proj
rx=theta;
ry=0;
rz=0;
R=Rotatation(rx,ry,rz);
Tx=10*cos(theta);
Ty=0;
Tz=-10*sin(theta);
T=[Tx Ty Tz];


RT=[R T'];
F = [-f 0 0 ; 0 -f 0;0 0 1 ];
S=[sx 0 ox;0 sy oy;0 0 1];

% % RT=[R T';0 0 0 1];
% % F = [-f 0 0 0; 0 -f 0 0; 0 0 1 0];


% XYZw=[Xw';Yw';Zw';ones(1,sc(1))]
% m1=S*F*RT*XYZw;
% m1=m1./repmat(m1(3,:),[3,1]);
% m1=m1'
m1=img_Up;

P=S*F*RT;
P1=P(1:3,1:3);
p1=P(:,4);
% M1=inv(p33)*(-p31+lambda1*m1);

%% Down proj
rx=-theta;
ry=0;
rz=0;
R=Rotatation(rx,ry,rz);
Tx=10*cos(theta);
Ty=0;
Tz=10*sin(theta);

T=[Tx Ty Tz];
RT=[R T'];
F = [-f 0 0 ; 0 -f 0;0 0 1 ];
S=[sx 0 ox;0 sy oy;0 0 1];

% RT=[R T';0 0 0 1];
% F = [-f 0 0 0; 0 -f 0 0; 0 0 1 0];



% XYZw=[Xw';Yw';Zw';ones(1,sc(1))];
% m2=S*F*RT*XYZw;
% m2=m2./repmat(m2(3,:),[3,1]);
% m2=m2'
m2=img_Down;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
P=S*F*RT;
P2=P(1:3,1:3);
p2=P(:,4);
% M2=inv(p33)*(-p31+lambda2*m2);
s=size(img_Up);
for i=1:s(1)
A=[(inv(P1)*(m1(i,:))')'*inv(P1)*(m1(i,:))'  -(inv(P1)*(m1(i,:))')'*inv(P2)*(m2(i,:))';(inv(P2)*(m2(i,:))')'*inv(P1)*(m1(i,:))'  -(inv(P2)*(m2(i,:))')'*inv(P2)*(m2(i,:))'];
B=[-(inv(P1)*(m1(i,:))')'*inv(P1)*p1+(inv(P1)*(m1(i,:))')'*inv(P2)*p2;-(inv(P2)*(m2(i,:))')'*inv(P1)*p1+(inv(P2)*(m2(i,:))')'*inv(P2)*p2];
Lambda=inv(A)*-B;
lambda1=Lambda(1);
lambda2=Lambda(2);
M1=inv(P1)*(-p1+lambda1*(m1(i,:))');
M2=inv(P2)*(-p2+lambda2*(m2(i,:))');
Mstar=(M1+M2)/2
end

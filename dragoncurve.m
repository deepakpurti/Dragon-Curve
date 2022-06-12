% The x and y vectors must have at least two points each (or the result
% will just be a single point) and they must have the same length
x=[1 0];  y=[0 0];  %LINE

angle=90;  %degrees

n=13; %iterations

MAX_LENGTH=5e6;

% Verify that we have valid (x,y) pairs
if length(x)~=length(y)
    disp('ERROR: x and y vectors must have the same length');
    return
end
% Limit the size of the fractal
m=length(x);
if ((m-1)*2^(n-1)+1) > MAX_LENGTH
    n=ceil(log2((MAX_LENGTH-1)/(m-1)));
    disp(['WARNING: maximum iterations exceeded ... setting n = ' num2str(n)]);
end
% Generate the fractal
for k=1:n-1
    xr = fliplr(x); yr = fliplr(y); a = x(length(x)); b = y(length(y));
    [theta, rho]=cart2pol(xr - a,yr - b);
    [rx0, ry0] = pol2cart(theta + angle*pi/180, rho);
    rx = rx0 + a; ry = ry0 + b;
    x=[x rx(2:length(rx))];
    y=[y ry(2:length(rx))];
end

figure;plot(x,y,'k');
axis equal
axis off
title(['Dragon Curve (n = ' num2str(n) ', angle = ' num2str(angle) ')']);
set(gcf,'color','white');

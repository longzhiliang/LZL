clear all;

radiu_L1 = 30; % the inner radius
radiu_L2 = 50; % the outer radius

m = 10000;

% obtain coordinates for plotting squares
nvar = 2*pi/m; 
% nvar_f = nvar*(1-rate); nvar_b = nvar*rate;
coord = [];
coord_txt = [];
for i=1:m
    coord = [coord;radiu_L1*cos(i*nvar),radiu_L1*sin(i*nvar)];
    coord_txt = [coord_txt;radiu_L2*cos(i*nvar),radiu_L2*sin(i*nvar)];
end
figure; plot(coord(:,1),coord(:,2),'k-'); hold on;
plot(coord_txt(:,1),coord_txt(:,2),'k-'); hold on;

sloop = 100; step = m / sloop;
for i=1:sloop
    start = (i-1)*step*nvar;
    desti = i*step*nvar;
    step1 = [radiu_L1*cos(start) radiu_L1*sin(start);radiu_L2*cos(start) radiu_L2*sin(start)];
    x = [start:(desti-start)/100:desti]';
    step2 = [radiu_L2*cos(x),radiu_L2*sin(x)];
    step3 = [radiu_L2*cos(desti) radiu_L2*sin(desti);radiu_L1*cos(desti) radiu_L1*sin(desti)];
    x = fliplr(x')';
    step4 = [radiu_L1*cos(x),radiu_L1*sin(x)];
    allstep = [step1;step2;step3;step4];
    fill(allstep(:,1),allstep(:,2),[1 0 0],'EdgeColor',[1 0 0]); axis equal; hold on;
    clear step1 step2 step3 step4 allstep x start desti
    pause(10.^-6);
end


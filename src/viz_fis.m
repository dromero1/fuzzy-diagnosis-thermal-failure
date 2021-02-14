clear;
clc;

% Load FIS
fis = readfis('../build/thermal-condition');

% Linguistic categories
categories = {'normal','low','medium','high','significant'};

% Number of points
num_points = 10000;

% Plot Ethylene's membership functions
figure;
hold on;
[xEthylene,yEthylene] = plotmf(fis,'input',1,num_points);
plot(xEthylene,yEthylene,'LineWidth',3);
xlabel('ethylene''s concentration (ppm)');
ylabel('degree of membership');
title('MFs for ethylene''s concentration in oil');
legend(categories);

% Plot Ethane's membership functions
figure;
hold on;
[xEthane,yEthane] = plotmf(fis,'input',2,num_points);
plot(xEthane,yEthane,'LineWidth',3);
xlabel('ethane''s concentration (ppm)');
ylabel('degree of membership');
title('MFs for ethane''s concentration in oil');
legend(categories);

% Plot Criticality level's membership functions
figure;
hold on;
[xCriticalityLevel,yCriticalityLevel] = plotmf(fis,'output',1,num_points);
plot(xCriticalityLevel,yCriticalityLevel,'LineWidth',3);
xlabel('criticality level');
ylabel('degree of membership');
title('MFs for the failure''s criticality level');
legend(categories);

% Plot output surface
figure;
gensurf(fis);
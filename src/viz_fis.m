clear;
clc;

% Load FIS
fis = readfis('../build/thermal-condition');

% Linguistic categories
categories = {'normal','low','medium','high','significant'};

% Number of points
num_points = 10000;

% Display limit
disp_limit = 200;

% Plot Ethylene's membership functions
[xEthylene,yEthylene] = plotmf(fis,'input',1,num_points);
xEthylene = xEthylene(xEthylene(:,1)<=disp_limit,:);
yEthylene = yEthylene(xEthylene(:,1)<=disp_limit,:);

figure;
hold on;
plot(xEthylene,yEthylene,'LineWidth',3);
xlabel('ethylene');
ylabel('degree of membership');
legend(categories);

% Plot Ethane's membership functions
[xEthane,yEthane] = plotmf(fis,'input',2,num_points);
xEthane = xEthane(xEthane(:,1)<=disp_limit,:);
yEthane = yEthane(xEthane(:,1)<=disp_limit,:);

figure;
hold on;
plot(xEthane,yEthane,'LineWidth',3);
xlabel('ethane');
ylabel('degree of membership');
legend(categories);

% Plot Criticality level's membership functions
[xCriticalityLevel,yCriticalityLevel] = plotmf(fis,'output',1,num_points);

figure;
hold on;
plot(xCriticalityLevel,yCriticalityLevel,'LineWidth',3);
xlabel('criticality level');
ylabel('degree of membership');
legend(categories);

% Output surface
figure;
gensurf(fis);
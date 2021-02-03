clear;
clc;

%% Fuzzy Inference System
fis = mamfis('Name','Thermal condition');

% Inputs
fis = addInput(fis,[0 3001],'Name','ethylene');
fis = addInput(fis,[0 10001],'Name','ethane');

% Ethylene's membership functions
fis = addMF(fis,'ethylene','gauss2mf',[0.0001 0 11.8 10],'Name','normal');
fis = addMF(fis,'ethylene','gauss2mf',[4.75 26 7.64 50],'Name','low');
fis = addMF(fis,'ethylene','gauss2mf',[9.34 70 20.957 100],'Name','medium');
fis = addMF(fis,'ethylene','gauss2mf',[8.981 120 15.61 150],'Name','high');
fis = addMF(fis,'ethylene','gauss2mf',[21.86 160 0.1 3000],'Name','significant');

% Ethane's membership functions
fis = addMF(fis,'ethane','gauss2mf',[0.0001 0 7.91 10],'Name','normal');
fis = addMF(fis,'ethane','gauss2mf',[11.87 25 17.54 45],'Name','low');
fis = addMF(fis,'ethane','gauss2mf',[17.54 65 18.42 85],'Name','medium');
fis = addMF(fis,'ethane','gauss2mf',[7.89 100 9.8 125],'Name','high');
fis = addMF(fis,'ethane','gauss2mf',[11.98 135 0.1 10000],'Name','significant');

% Output
fis = addOutput(fis,[0 100],'Name','criticality-level');

% Output's membership functions
fis = addMF(fis,'criticality-level','trapmf',[0 5 10 20],'Name','normal');
fis = addMF(fis,'criticality-level','trapmf',[11 18 34 40],'Name','low');
fis = addMF(fis,'criticality-level','trapmf',[29 44 58 72],'Name','medium');
fis = addMF(fis,'criticality-level','trapmf',[57 68 83 94],'Name','high');
fis = addMF(fis,'criticality-level','trapmf',[82 96 100 105],'Name','significant');

% Rules
rules = [1 1 1 1 1;
        1 2 2 1 1;
        1 3 3 1 1;
        1 4 4 1 1;
        1 5 5 1 1;
        2 1 2 1 1;
        2 2 2 1 1;
        2 3 3 1 1;
        2 4 4 1 1;
        2 5 5 1 1;
        3 1 3 1 1;
        3 2 3 1 1;
        3 3 3 1 1;
        3 4 4 1 1;
        3 5 5 1 1;
        4 1 4 1 1;
        4 2 4 1 1;
        4 3 4 1 1;
        4 4 5 1 1;
        4 5 5 1 1;
        5 1 5 1 1;
        5 2 5 1 1;
        5 3 5 1 1;
        5 4 5 1 1;
        5 5 5 1 1];
fis = addRule(fis,rules);

%% Visualizatoin

% Number of points
num_points = 10000;

% Display limit
disp_limit = 200;

% Labels
labels = {'normal','low','medium','high','significant'};

% Plot Ethylene's membership functions
[xEthylene,yEthylene] = plotmf(fis,'input',1,num_points);
xEthylene = xEthylene(xEthylene(:,1)<=disp_limit,:);
yEthylene = yEthylene(xEthylene(:,1)<=disp_limit,:);

figure;
hold on;
plot(xEthylene,yEthylene,'LineWidth',3);
xlabel('Ethylene');
ylabel('Degree of membership');
legend(labels);

% Plot Ethane's membership functions
[xEthane,yEthane] = plotmf(fis,'input',2,num_points);
xEthane = xEthane(xEthane(:,1)<=disp_limit,:);
yEthane = yEthane(xEthane(:,1)<=disp_limit,:);

figure;
hold on;
plot(xEthane,yEthane,'LineWidth',3);
xlabel('Ethane');
ylabel('Degree of membership');
legend(labels);

% Plot Criticality level's membership functions
[xCriticalityLevel,yCriticalityLevel] = plotmf(fis,'output',1,num_points);

figure;
hold on;
plot(xCriticalityLevel,yCriticalityLevel,'LineWidth',3);
xlabel('criticality level');
ylabel('Degree of membership');
legend(labels);

%% Evaluation

% Sample evaluation
evalfis(fis,[54 2])
clear;
clc;

% Fuzzy Inference System
fis = mamfis('Name','thermal-condition');

% Linguistic categories
categories = {'normal','low','medium','high','significant'};

% Inputs
fis = addInput(fis,[0 300],'Name','ethylene');
fis = addInput(fis,[0 300],'Name','ethane');

% Ethylene's membership functions
fis = addMF(fis,'ethylene','gauss2mf',[0.0001 0 11.8 10],'Name',categories{1});
fis = addMF(fis,'ethylene','gauss2mf',[4.75 26 7.64 50],'Name',categories{2});
fis = addMF(fis,'ethylene','gauss2mf',[9.34 70 20.957 90],'Name',categories{3});
fis = addMF(fis,'ethylene','gauss2mf',[8.981 105 15.61 135],'Name',categories{4});
fis = addMF(fis,'ethylene','gauss2mf',[21.86 145 0.1 400],'Name',categories{5});

% Ethane's membership functions
fis = addMF(fis,'ethane','gauss2mf',[0.0001 0 7.91 10],'Name',categories{1});
fis = addMF(fis,'ethane','gauss2mf',[11.87 25 17.54 45],'Name',categories{2});
fis = addMF(fis,'ethane','gauss2mf',[17.54 65 18.42 85],'Name',categories{3});
fis = addMF(fis,'ethane','gauss2mf',[7.89 100 9.8 125],'Name',categories{4});
fis = addMF(fis,'ethane','gauss2mf',[11.98 135 0.1 400],'Name',categories{5});

% Output
fis = addOutput(fis,[0 100],'Name','criticality-level');

% Criticality level's membership functions
fis = addMF(fis,'criticality-level','trapmf',[0 5 10 20],'Name',categories{1});
fis = addMF(fis,'criticality-level','trapmf',[11 18 34 40],'Name',categories{2});
fis = addMF(fis,'criticality-level','trapmf',[29 44 58 72],'Name',categories{3});
fis = addMF(fis,'criticality-level','trapmf',[57 68 83 94],'Name',categories{4});
fis = addMF(fis,'criticality-level','trapmf',[82 96 100 105],'Name',categories{5});

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

% Save system to a file
writeFIS(fis,'../build/thermal-condition');
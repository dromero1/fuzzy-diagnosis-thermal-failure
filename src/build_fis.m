clear;
clc;

% Parameters
defuzz_method = 'centroid';
t_norm = 'prod';
s_norm = 'probor';

% Fuzzy Inference System
fis = mamfis('Name','thermal-condition','DefuzzificationMethod',defuzz_method,'AndMethod',t_norm,'OrMethod',s_norm);

% Linguistic categories
categories = {'normal','low','medium','high','significant'};

% Inputs
fis = addInput(fis,[0 300],'Name','ethylene');
fis = addInput(fis,[0 300],'Name','ethane');

% Ethylene's membership functions
fis = addMF(fis,'ethylene','gauss2mf',[10.5 0 12.01 10],'Name',categories{1});
fis = addMF(fis,'ethylene','gauss2mf',[5.05 30 7.64 50],'Name',categories{2});
fis = addMF(fis,'ethylene','gauss2mf',[9.34 70 8.95 90],'Name',categories{3});
fis = addMF(fis,'ethylene','gauss2mf',[7.98 110 15.61 130],'Name',categories{4});
fis = addMF(fis,'ethylene','gauss2mf',[9.88 160 15.53 400],'Name',categories{5});

% Ethane's membership functions
fis = addMF(fis,'ethane','gauss2mf',[10.5 0 6.15 10],'Name',categories{1});
fis = addMF(fis,'ethane','gauss2mf',[6.54 25 9.03 45],'Name',categories{2});
fis = addMF(fis,'ethane','gauss2mf',[7.94 65 6.72 85],'Name',categories{3});
fis = addMF(fis,'ethane','gauss2mf',[6.15 100 9.8 125],'Name',categories{4});
fis = addMF(fis,'ethane','gauss2mf',[11.2 150 18.15 400],'Name',categories{5});

% Output
fis = addOutput(fis,[0 100],'Name','criticality-level');

% Criticality level's membership functions
fis = addMF(fis,'criticality-level','gauss2mf',[10.5 0 3.32 10],'Name',categories{1});
fis = addMF(fis,'criticality-level','gauss2mf',[3.56 18 4.27 34],'Name',categories{2});
fis = addMF(fis,'criticality-level','gauss2mf',[4.28 44 4.18 58],'Name',categories{3});
fis = addMF(fis,'criticality-level','gauss2mf',[4.39 68 4.61 83],'Name',categories{4});
fis = addMF(fis,'criticality-level','gauss2mf',[6.42 96 12.3 100],'Name',categories{5});

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
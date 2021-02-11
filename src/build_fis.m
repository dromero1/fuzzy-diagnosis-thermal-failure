clear;
clc;

% Parameters
defuzz_method = 'bisector';
t_norm = 'min';
s_norm = 'max';

% Fuzzy Inference System
fis = mamfis('Name','thermal-condition','DefuzzificationMethod',defuzz_method,'AndMethod',t_norm,'OrMethod',s_norm);

% Linguistic categories
categories = {'normal','low','medium','high','significant'};

% Inputs
fis = addInput(fis,[0 1],'Name','ethylene');
fis = addInput(fis,[0 1],'Name','ethane');

% Ethylene's membership functions
fis = addMF(fis,'ethylene','gaussmf',[0.095 0],'Name',categories{1});
fis = addMF(fis,'ethylene','gaussmf',[0.101 0.23],'Name',categories{2});
fis = addMF(fis,'ethylene','gaussmf',[0.085 0.45],'Name',categories{3});
fis = addMF(fis,'ethylene','gaussmf',[0.098 0.66],'Name',categories{4});
fis = addMF(fis,'ethylene','gaussmf',[0.2 1],'Name',categories{5});

% Ethane's membership functions
fis = addMF(fis,'ethane','gaussmf',[0.082 0],'Name',categories{1});
fis = addMF(fis,'ethane','gaussmf',[0.085 0.20],'Name',categories{2});
fis = addMF(fis,'ethane','gaussmf',[0.083 0.40],'Name',categories{3});
fis = addMF(fis,'ethane','gaussmf',[0.084 0.60],'Name',categories{4});
fis = addMF(fis,'ethane','gaussmf',[0.25 1],'Name',categories{5});

% Output
fis = addOutput(fis,[0 1],'Name','criticality-level');

% Criticality level's membership functions
fis = addMF(fis,'criticality-level','gaussmf',[0.105 0],'Name',categories{1});
fis = addMF(fis,'criticality-level','gaussmf',[0.105 0.25],'Name',categories{2});
fis = addMF(fis,'criticality-level','gaussmf',[0.105 0.50],'Name',categories{3});
fis = addMF(fis,'criticality-level','gaussmf',[0.105 0.75],'Name',categories{4});
fis = addMF(fis,'criticality-level','gaussmf',[0.105 1],'Name',categories{5});

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
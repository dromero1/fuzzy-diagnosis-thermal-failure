clear;
clc;

% Parameters
defuzz_method = 'centroid';
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
fis = addMF(fis,'ethylene','gaussmf',[0.0955 0.0000],'Name',categories{1});
fis = addMF(fis,'ethylene','gaussmf',[0.0850 0.2111],'Name',categories{2});
fis = addMF(fis,'ethylene','gaussmf',[0.1135 0.4444],'Name',categories{3});
fis = addMF(fis,'ethylene','gaussmf',[0.0755 0.6667],'Name',categories{4});
fis = addMF(fis,'ethylene','gaussmf',[0.2100 1.0000],'Name',categories{5});

% Ethane's membership functions
fis = addMF(fis,'ethane','gaussmf',[0.0850 0.0000],'Name',categories{1});
fis = addMF(fis,'ethane','gaussmf',[0.0802 0.1944],'Name',categories{2});
fis = addMF(fis,'ethane','gaussmf',[0.1090 0.4167],'Name',categories{3});
fis = addMF(fis,'ethane','gaussmf',[0.0690 0.6250],'Name',categories{4});
fis = addMF(fis,'ethane','gaussmf',[0.2500 1.0000],'Name',categories{5});

% Output
fis = addOutput(fis,[0 1],'Name','criticality-level');

% Criticality level's membership functions
fis = addMF(fis,'criticality-level','gaussmf',[0.1140 0.0000],'Name',categories{1});
fis = addMF(fis,'criticality-level','gaussmf',[0.1070 0.2600],'Name',categories{2});
fis = addMF(fis,'criticality-level','gaussmf',[0.1070 0.5100],'Name',categories{3});
fis = addMF(fis,'criticality-level','gaussmf',[0.1030 0.7550],'Name',categories{4});
fis = addMF(fis,'criticality-level','gaussmf',[0.1070 1.0000],'Name',categories{5});

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
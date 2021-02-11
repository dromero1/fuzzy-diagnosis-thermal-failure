clear;
clc;

% Load FIS
fis = readfis('../build/thermal-condition');

% Sample evaluation
evalfis(fis,[1 1])
clear;
clc;

% Load FIS
fis = readfis('../build/thermal-condition');

% Load test set
load('../data/test.mat')

% Extract raw structures
X = test(:,[1 2]);
y_ref = test(:,end);

% Scale inputs and outputs 
X = X./180;
y_ref = y_ref./100;

% Evaluation
y_hat = evalfis(fis,X);

% Mean Absolute Error
mae = mean(abs(y_hat-y_ref));

% Display
fprintf('MAE = %0.4f\n',mae);
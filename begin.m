clear; clc;

%% The cosmic void is a 2D matrix with all zeros representing a lifeless begining.
%% The initial configuration is a set of random 1's in the cosmic void
%% to begin the Game of Life.
%% ======================================================================================
m = 60;    % Scale fo the cosmos

% Comment out lines 12 to 16 and lines 19 to 23 to enable this mechanism.
cosmos = randi([0 1], [m m]);

% Glider - Comment out line no. 10 and lines 19 to 23 to enable this mechanism.
% cosmos = zeros(m);
% cosmos(3, 1:3) = 1;
% cosmos(2, 3) = 1;
% cosmos(1, 2) = 1;

% Diehard - Comment out line no. 10 and lines 12 to 16 to enable this mechanism.
% cosmos = zeros(m);
% cosmos(10, 10:11) = 1;
% cosmos(11, 11) = 1;
% cosmos(11, 15:17) = 1;
% cosmos(9, 16) = 1;

rgbImage = imread('bg.jpg');
rgbImage = imresize(rgbImage, [m m]);

%% The cosmos has a maximum lifetime set by MAXITER - the number of maximum iterations.
%% ======================================================================================
MAXITER = 400;

%% Begin the Game of Life.
%% ======================================================================================
up = [2:m 1]; down = [m 1:m-1];     % The cosmos is round

for i = 1:MAXITER
    % There is a set of rules, physical laws that govern the cosmos. Each fileform
    % is either dead or alive depending upon these simple rules:
    %
    % 1. Any live cell with fewer than two live neighbours dies, as if caused by under-population.
    % 2. Any live cell with two or three live neighbours lives on to the next generation.
    % 3. Any live cell with more than three live neighbours dies, as if by over-population.
    % 4. Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.
    neighbours = cosmos(up, :) + cosmos(down, :) + cosmos(:, up) + cosmos(:, down) + ...
                 cosmos(up, up) + cosmos(up, down) + cosmos(down, up) + cosmos(down, down);
    cosmos = neighbours == 3 | cosmos & neighbours == 2;

    maskedRgbImage = bsxfun(@times, rgbImage, cast(cosmos, 'double'));
    imshow(maskedRgbImage); title(strcat('Game of Life :: Epoch = ', sprintf('%03d', i))); pause(0.02);
end

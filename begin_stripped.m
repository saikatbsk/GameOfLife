m = 60;
cosmos = randi([0 1], [m m]);
MAXITER = 400;
up = [2:m 1];
down = [m 1:m-1];
for i = 1:MAXITER
    neighbours = cosmos(up, :) + cosmos(down, :) + cosmos(:, up) + cosmos(:, down) + ...
                 cosmos(up, up) + cosmos(up, down) + cosmos(down, up) + cosmos(down, down);
    cosmos = neighbours == 3 | cosmos & neighbours == 2;
    imshow(cosmos);
    pause(0.02);
end

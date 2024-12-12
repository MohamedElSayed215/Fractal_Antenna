clc;
clear;
close all;

% Parameters
iterations = 3; % Number of recursive iterations
side_length = 1; % Length of the outer square (meters)

% Generate Vicsek Fractal Geometry
vicsek_points = vicsek_fractal(iterations, side_length);

% Plot the Vicsek Fractal
figure;
hold on;
for i = 1:length(vicsek_points)
    fill(vicsek_points{i}(:,1), vicsek_points{i}(:,2), 'b', 'EdgeColor', 'k');
end
hold off;
axis equal;
title('Vicsek Fractal Geometry');
xlabel('X (m)');
ylabel('Y (m)');

% Helper Function to Generate Vicsek Fractal Points
function points = vicsek_fractal(n, side_length, origin)
    % Generates a Vicsek fractal up to iteration 'n'.
    % Inputs:
    %   n - Number of iterations
    %   side_length - Length of the largest square
    %   origin - Origin of the current square (default is [0, 0])
    % Output:
    %   points - Cell array of Nx2 matrices (coordinates of squares)

    if nargin < 3
        origin = [0, 0]; % Default origin
    end
    
    if n == 0
        % Base case: single square
        half_len = side_length / 2;
        square = [
            origin + [-half_len, -half_len];
            origin + [half_len, -half_len];
            origin + [half_len, half_len];
            origin + [-half_len, half_len];
            origin + [-half_len, -half_len];
        ];
        points = {square};
    else
        % Recursive case
        new_length = side_length / 3;
        offsets = [
            -1, -1;
            -1,  1;
             0,  0;
             1, -1;
             1,  1;
        ] * new_length; % Offsets for the 5 smaller squares
        
        points = {};
        for k = 1:size(offsets, 1)
            new_origin = origin + offsets(k, :);
            points = [points; vicsek_fractal(n-1, new_length, new_origin)]; %#ok<AGROW>
        end
    end
end

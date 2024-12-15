clc;
clear;
close all;

% Parameters
iterations = 5; % Number of iterations
line_length = 1; % Length of the initial line segment
y_spacing = 0.2; % Vertical spacing between iterations

% Initialize the figure
figure;
hold on;
title(['Cantor Set (Iterations: ', num2str(iterations), ')']);
xlabel('X');
ylabel('Y');
axis([0, line_length, -iterations * y_spacing, 0]);
axis equal;
grid on;

% Generate and plot Cantor Set
cantor_set(iterations, 0, 0, line_length, y_spacing);

hold off;

% --- Helper Function to Generate Cantor Set ---
function cantor_set(n, x_start, y_level, line_length, y_spacing)
    % Recursive generation of Cantor Set
    % Inputs:
    %   n - Number of iterations
    %   x_start - Starting x-coordinate
    %   y_level - Vertical level (y-coordinate)
    %   line_length - Length of the line segment
    %   y_spacing - Vertical spacing between successive levels

    if n == 0
        % Base case: draw the line
        line([x_start, x_start + line_length], [y_level, y_level], 'Color', 'b', 'LineWidth', 1.5);
    else
        % Recursive case: divide the line into three parts
        third = line_length / 3;

        % Plot left and right segments only
        line([x_start, x_start + third], [y_level, y_level], 'Color', 'b', 'LineWidth', 1.5);
        line([x_start + 2*third, x_start + line_length], [y_level, y_level], 'Color', 'b', 'LineWidth', 1.5);

        % Recursively draw the next iteration on the left and right segments
        cantor_set(n-1, x_start, y_level - y_spacing, third, y_spacing);
        cantor_set(n-1, x_start + 2*third, y_level - y_spacing, third, y_spacing);
    end
end

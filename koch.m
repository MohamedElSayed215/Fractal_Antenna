clc;
clear;
close all;

% Parameters
iterations = 4; % Number of iterations
initial_length = 1; % Length of the initial line segment

% Generate the Koch Curve
koch_points = koch_curve(iterations, [0, 0], [initial_length, 0]);

% Plot the Koch Curve
figure;
plot(koch_points(:,1), koch_points(:,2), 'b', 'LineWidth', 1.5);
title(['Koch Curve (Iterations: ', num2str(iterations), ')']);
xlabel('X');
ylabel('Y');
axis equal;
grid on;

% --- Helper Function to Generate Koch Curve ---
function points = koch_curve(n, p1, p2)
    % Recursive function to generate Koch curve points
    % Inputs:
    %   n - Number of iterations
    %   p1, p2 - Start and end points of the current segment
    % Output:
    %   points - Nx2 array of points representing the curve

    if n == 0
        points = [p1; p2]; % Base case: straight line
    else
        % Calculate dividing points
        third = (p2 - p1) / 3;
        pA = p1 + third;
        pB = p1 + 2 * third;

        % Calculate the peak point of the equilateral triangle
        peak = pA + [cos(pi/3), sin(pi/3)] * norm(third);

        % Recursively generate the Koch curve
        points1 = koch_curve(n-1, p1, pA);
        points2 = koch_curve(n-1, pA, peak);
        points3 = koch_curve(n-1, peak, pB);
        points4 = koch_curve(n-1, pB, p2);

        % Combine points
        points = [points1; points2(2:end,:); points3(2:end,:); points4(2:end,:)];
    end
end

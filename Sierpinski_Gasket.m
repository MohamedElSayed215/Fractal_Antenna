clc;
clear;
close all;

% Parameters
iterations = 5; % Number of iterations
vertices = [0 0; 1 0; 0.5 sqrt(3)/2]; % Vertices of the equilateral triangle

% Initialize plot
figure;
hold on;
title(['Sierpiński Gasket (Iterations: ', num2str(iterations), ')']);
xlabel('X');
ylabel('Y');
axis equal;
grid on;

% Generate and plot Sierpiński Gasket
sierpinski_gasket(iterations, vertices);

hold off;

% --- Helper Function to Generate Sierpiński Gasket ---
function sierpinski_gasket(n, vertices)
    % Inputs:
    %   n - Number of iterations
    %   vertices - Vertices of the current triangle

    if n == 0
        % Base case: plot the triangle
        fill(vertices(:,1), vertices(:,2), 'b', 'EdgeColor', 'k', 'LineWidth', 1.5);
    else
        % Calculate midpoints of the triangle
        mid1 = (vertices(1,:) + vertices(2,:)) / 2;
        mid2 = (vertices(2,:) + vertices(3,:)) / 2;
        mid3 = (vertices(3,:) + vertices(1,:)) / 2;

        % Recursive case: draw three smaller triangles
        sierpinski_gasket(n-1, [vertices(1,:); mid1; mid3]); % Bottom-left
        sierpinski_gasket(n-1, [mid1; vertices(2,:); mid2]); % Bottom-right
        sierpinski_gasket(n-1, [mid3; mid2; vertices(3,:)]); % Top
    end
end

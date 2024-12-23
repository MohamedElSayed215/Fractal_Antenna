% MATLAB Code for 3D and 2D Radiation Pattern of a Sierpinski Antenna
clc;
clear;

% Define parameters
theta = linspace(0, pi, 180); % Elevation angles [0, pi]
phi = linspace(0, 2*pi, 360); % Azimuthal angles [0, 2*pi]
[THETA, PHI] = meshgrid(theta, phi);

% Radiation pattern (approximated multi-lobe behavior for a fractal antenna)
% The formula includes multi-band effects through harmonic terms
R = abs(cos(THETA) .* sin(2*PHI) + 0.5*cos(2*THETA) .* sin(PHI) + 0.3*cos(3*THETA));

% Convert spherical to Cartesian coordinates for 3D plot
X = R .* sin(THETA) .* cos(PHI);
Y = R .* sin(THETA) .* sin(PHI);
Z = R .* cos(THETA);

% 3D Radiation Pattern
figure;
surf(X, Y, Z, R, 'EdgeColor', 'none'); % Color represents gain
colormap(jet);
colorbar;
title('3D Radiation Pattern of Sierpinski Antenna');
xlabel('X-axis');
ylabel('Y-axis');
zlabel('Z-axis');
axis equal;
grid on;

% 2D Radiation Pattern (Polar Plot for a slice)
theta_slice = linspace(0, 2*pi, 360); % 2D slice at phi = 0
R_slice = abs(cos(theta_slice) + 0.5*cos(2*theta_slice) + 0.3*cos(3*theta_slice));

figure;
polarplot(theta_slice, R_slice, 'LineWidth', 2);
title('2D Radiation Pattern of Sierpinski Antenna');
rlim([0 max(R_slice)]); % Adjust limits based on the pattern
grid on;

% Parameters
f = 1e9;  % Frequency in Hz (1 GHz)
c = 3e8;  % Speed of light in m/s
lambda = c / f;  % Wavelength in meters

% Sierpinski Triangle Geometry (initial area A0 and scaling for iterations)
A0 = 0.1;  % Initial area of the triangle in m^2 (adjust based on actual size)
maxIterations = 6;  % Maximum number of iterations (you can change this)

% Pre-allocate arrays for storing results
iterations = 0:maxIterations;  % Iteration numbers
D_values = zeros(size(iterations));  % Directivity values
G_values = zeros(size(iterations));  % Gain values
BW_values = zeros(size(iterations));  % Bandwidth values
Freq_response = zeros(size(iterations));  % Frequency response
A_eff_values = zeros(size(iterations));  % Effective Area values

% Loop over the iterations
for i = 1:length(iterations)
    % Calculate the effective aperture area after the current iteration
    n = iterations(i);  % Current iteration number
    scalingFactor = (3 / 4) ^ n;  % Scaling factor for the Sierpinski triangle
    A_eff = A0 * scalingFactor;  % Effective aperture area after n iterations
    
    % Calculate Directivity (D) and Gain (G)
    D = (4 * pi * A_eff) / lambda^2;  % Directivity approximation formula
    eta = 1;  % Assume ideal efficiency
    G = eta * D;  % Gain = eta * Directivity
    
    % Calculate Bandwidth (BW)
    % Approximate BW by considering multiple resonant frequencies based on iterations
    BW = f * 0.1 * (1 + 0.2 * n);  % Simple approximation based on number of iterations
    
    % Calculate Frequency Response (F) as the number of resonant frequencies
    % The frequency response can be approximated by increasing with more iterations
    F = 2 * n;  % Example: frequency response increases linearly with iterations
    
    % Store results
    D_values(i) = D;
    G_values(i) = G;
    BW_values(i) = BW;
    Freq_response(i) = F;
    A_eff_values(i) = A_eff;
end

% Display the results
fprintf('Iteration\tEffective Area (A_eff)\tDirectivity (D)\tGain (G)\tGain (G) in dB\tBandwidth (BW)\tFrequency Response (F)\n');
for i = 1:length(iterations)
    fprintf('%d\t%.2e\t%.2e\t%.2e\t%.2f dB\t%.2e Hz\t%d\n', ...
        iterations(i), A_eff_values(i), D_values(i), G_values(i), 10*log10(G_values(i)), ...
        BW_values(i), Freq_response(i));
end

% Plot Effective Area
figure;
plot(iterations, A_eff_values, '-o', 'LineWidth', 2);
title('Effective Area (A_eff) vs. Iterations');
xlabel('Number of Iterations');
ylabel('Effective Area (A_eff) [m^2]');
grid on;

% Plot Directivity
figure;
plot(iterations, D_values, '-o', 'LineWidth', 2);
title('Directivity (D) vs. Iterations');
xlabel('Number of Iterations');
ylabel('Directivity (D)');
grid on;

% Plot Gain
figure;
plot(iterations, G_values, '-o', 'LineWidth', 2);
title('Gain (G) vs. Iterations');
xlabel('Number of Iterations');
ylabel('Gain (G)');
grid on;

% Plot Bandwidth
figure;
plot(iterations, BW_values, '-o', 'LineWidth', 2);
title('Bandwidth (BW) vs. Iterations');
xlabel('Number of Iterations');
ylabel('Bandwidth (BW) [Hz]');
grid on;

% Plot Frequency Response
figure;
plot(iterations, Freq_response, '-o', 'LineWidth', 2);
title('Frequency Response (F) vs. Iterations');
xlabel('Number of Iterations');
ylabel('Frequency Response');
grid on;

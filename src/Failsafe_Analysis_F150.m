% F-150 2.7L EcoBoost IAT Fault Failsafe Analysis
% Author: Eliazar Alvarez

% 1. Setup import options to handle semicolons and preserve headers
opts = detectImportOptions('Baseline_Health_July2026.csv', 'Delimiter', ';');
opts.VariableNamingRule = 'preserve'; 

% 2. Load the 3 datasets
base_data = readtable('Baseline_Health_July2026.csv', opts);
fault_data = readtable('Fault_Active_July2026.csv', opts); 
verif_data = readtable('Verification_Healthy_July2026.csv', opts);

% 3. Convert time from milliseconds to seconds for cleaner x-axes
t_base = base_data.('time(ms)') / 1000;
t_fault = fault_data.('time(ms)') / 1000;
t_verif = verif_data.('time(ms)') / 1000;

% 4. Create the Portfolio Figure
figure('Name', 'IAT Open-Circuit Failsafe Analysis', 'Position', [100, 100, 1000, 800]);

% Plot 1: Short Term Fuel Trims (The Failsafe Reaction)
subplot(3,1,1);
plot(t_base, base_data.('SHRTFT1(%)'), 'b-', 'LineWidth', 1.5); hold on;
plot(t_fault, fault_data.('SHRTFT1(%)'), 'r-', 'LineWidth', 1.5);
plot(t_verif, verif_data.('SHRTFT1(%)'), 'g-', 'LineWidth', 1.5);
title('Short Term Fuel Trim (SHRTFT1) Response');
ylabel('Trim (%)');
legend('Baseline (Healthy)', 'Fault Active (Open Circuit)', 'Verification (Restored)', 'Location', 'best');
grid on;

% Plot 2: Intake Air Temp 2 (The Heat Soak Tracking)
subplot(3,1,2);
plot(t_base, base_data.('IAT2(°C)'), 'b-', 'LineWidth', 1.5); hold on;
plot(t_fault, fault_data.('IAT2(°C)'), 'r-', 'LineWidth', 1.5);
plot(t_verif, verif_data.('IAT2(°C)'), 'g-', 'LineWidth', 1.5);
title('Post-Intercooler Air Temp (IAT2)');
ylabel('Temperature (\circC)');
grid on;

% Plot 3: Engine Load
subplot(3,1,3);
plot(t_base, base_data.('LOAD(%)'), 'b-', 'LineWidth', 1.5); hold on;
plot(t_fault, fault_data.('LOAD(%)'), 'r-', 'LineWidth', 1.5);
plot(t_verif, verif_data.('LOAD(%)'), 'g-', 'LineWidth', 1.5);
title('Calculated Engine Load');
ylabel('Load (%)');
xlabel('Time (seconds)');
grid on;
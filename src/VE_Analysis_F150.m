% F-150 2.7L EcoBoost VE and WOT Analysis
% Author: Eliazar Alvarez

% 1. Load the Data with preserved headers to prevent naming warnings
opts = detectImportOptions('Run3_W0T_3rdGear_June2026.csv', 'Delimiter', ';');
opts.VariableNamingRule = 'preserve'; 
run3_data = readtable('Run3_W0T_3rdGear_June2026.csv', opts);

% Rename columns explicitly using their literal CSV names
run3_data.Properties.VariableNames = {'time_ms', 'RPM', 'MAP_kPa', 'IAT2_C', 'TP_REL', 'FRP_kPa', 'SHRTFT1', 'SHRTFT2', 'LOAD_pct', 'TCBP_DSD', 'WGATE_PRES', 'DI_pct', 'PI_pct'};

% 2. Filter for Wide Open Throttle (WOT)
% Define WOT as Relative Throttle Position > 60%
wot_idx = run3_data.TP_REL > 60;
rpm = run3_data.RPM(wot_idx);
map_actual = run3_data.MAP_kPa(wot_idx);
map_commanded = run3_data.TCBP_DSD(wot_idx);
load_pct = run3_data.LOAD_pct(wot_idx);
iat2 = run3_data.IAT2_C(wot_idx);

% 3. Generate Portfolio Plots
figure('Name', 'EcoBoost 2.7L Performance Analysis', 'Position', [100, 100, 1200, 800]);

% Plot 1: Commanded vs Actual Boost
subplot(2,2,1);
plot(rpm, map_commanded, 'k--', 'LineWidth', 1.5); hold on;
plot(rpm, map_actual, 'r-', 'LineWidth', 1.5);
title('Commanded vs Actual Boost (MAP)');
xlabel('Engine Speed (RPM)'); ylabel('Pressure (kPa)');
legend('Commanded Boost', 'Actual Boost', 'Location', 'southeast');
grid on;

% Plot 2: Volumetric Efficiency (Load) vs RPM
subplot(2,2,2);
plot(rpm, load_pct, 'b-', 'LineWidth', 2);
title('Calculated Engine Load (VE) vs RPM');
xlabel('Engine Speed (RPM)'); ylabel('Engine Load (%)');
grid on;

% Plot 3: Intercooler Thermal Efficiency
subplot(2,2,3);
plot(rpm, iat2, 'm-', 'LineWidth', 1.5);
title('Charge Air Temp (IAT2) Under Load');
xlabel('Engine Speed (RPM)'); ylabel('Temperature (\circC)');
grid on;

% Plot 4: PFDI Injection Split
di_pct = run3_data.DI_pct(wot_idx);
pi_pct = run3_data.PI_pct(wot_idx);
subplot(2,2,4);
plot(rpm, di_pct, 'Color', [0.5 0 0.5], 'LineWidth', 1.5); hold on;
plot(rpm, pi_pct, 'g-', 'LineWidth', 1.5);
title('Dual Injection (PFDI) Utilization');
xlabel('Engine Speed (RPM)'); ylabel('System Utilization (%)');
legend('Direct Injection', 'Port Injection', 'Location', 'best'); % Fixed location error
grid on;
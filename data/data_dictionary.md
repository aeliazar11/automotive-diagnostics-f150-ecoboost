# FORScan Telemetry Data Dictionary
**Vehicle Platform:** 2018 Ford F-150 (2.7L EcoBoost V6)
**Sampling Rate:** 10 Hz via OBDLink EX Multiplex Interface

This data dictionary defines the 13 Powertrain Control Module (PCM) Parameter Identifiers (PIDs) captured during the Wide Open Throttle (WOT) and Fault Injection field tests.

| Column Header | PID Name | Unit | Description |
| :--- | :--- | :--- | :--- |
| `time(ms)` | Time | Milliseconds | Elapsed time since the start of the data log. |
| `RPM(1/min)` | Engine Speed | RPM | Crankshaft rotational speed. |
| `MAP(kPa)` | Manifold Absolute Pressure | kPa | Absolute pressure inside the intake manifold. Used to calculate actual boost delivery (MAP - Barometric Pressure). |
| `IAT2(°C)` | Intake Air Temp 2 | Celsius | Post-intercooler charge air temperature measured at the intake manifold. Primary indicator of heat soak. |
| `TP_REL(%)` | Relative Throttle Position | Percent | Commanded throttle blade angle. WOT is defined as >60% in these test parameters. |
| `FRP(kPa)` | Fuel Rail Pressure | kPa | High-pressure fuel circuit pressure supporting the Direct Injection system. |
| `SHRTFT1(%)` | Short Term Fuel Trim (Bank 1) | Percent | Real-time closed-loop fuel correction based on O2 sensor feedback. Negative values subtract fuel; positive values add fuel. |
| `SHRTFT2(%)` | Short Term Fuel Trim (Bank 2) | Percent | Real-time closed-loop fuel correction for cylinder bank 2. |
| `LOAD(%)` | Calculated Engine Load | Percent | PCM-calculated volumetric efficiency proxy normalized to standard sea-level temperature and pressure. |
| `TCBP_DSD(kPa)`| Desired Boost Pressure | kPa | The absolute manifold pressure target commanded by the PCM. |
| `WGATE_PRES(kPa)`| Wastegate Control Pressure | kPa | Absolute pressure reading utilized for electronic wastegate duty cycle control. |
| `FUELSYS_A_PCTB1(%)`| Direct Injection Utilization | Percent | The percentage of total fuel mass delivered via the high-pressure Direct Injection (DI) system. |
| `FUELSYS_B_PCTB1(%)`| Port Injection Utilization | Percent | The percentage of total fuel mass delivered via the low-pressure Port Fuel Injection (PFI) system. |

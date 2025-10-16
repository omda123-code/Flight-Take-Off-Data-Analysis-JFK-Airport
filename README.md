# ✈️ Flight Take-Off Data Analysis – JFK Airport  

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Profile-blue?logo=linkedin)](https://www.linkedin.com/in/mohamed-emad-396981344)  
[![Email](https://img.shields.io/badge/Email-Contact-orange?logo=gmail)](mailto:mohamedemad24649@gmail.com)

---

### 🔍 Project Overview
This project analyzes **flight take-off performance at JFK Airport** using real-world data from [Kaggle](https://www.kaggle.com/datasets/deepankurk/flight-take-off-data-jfk-airport).  
The main objective is to identify **factors influencing flight delays**, evaluate **airline performance**, and assess **weather impact** using **SQL, Python (Pandas, Matplotlib, Seaborn)**, and a **Power BI dashboard (in progress)**.

---

### 📂 Repository Structure
```
├── data/
│ └── flight_data.csv
│
├── sql_queries/
│ └── jfk_analysis_queries.sql
│
├── python_scripts/
│ └── flight_analysis.py
│
├── charts/
│ ├── chart_01_on_time_vs_delayed.png
│ ├── chart_02_avg_delay_by_day.png
│ ├── chart_03_delay_by_flight_type.png
│ ├── chart_04_avg_distance_per_carrier.png
│ ├── chart_05_top_destinations.png
│ ├── chart_06_delay_per_carrier.png
│ └── ... (up to chart_16)
│
├── powerbi/
│ └── JFK_Dashboard.pbix # Power BI dashboard (in progress)
│
└── README.md
```

---

### 🧠 Tools & Technologies
- **Python:** Pandas, Matplotlib, Seaborn, OS  
- **SQL:** Querying, cleaning, and aggregating flight data  
- **Power BI:** Visualization and dashboard design  
- **Dataset:** [Flight Take-Off Data – JFK Airport](https://www.kaggle.com/datasets/deepankurk/flight-take-off-data-jfk-airport)

---

### 📊 Key Visualizations (16 Charts Summary)

#### 🥧 On-time vs Delayed Flights
![On-time vs Delayed](charts/on_time_vs_delayed.png)  
- On Time: **86.6%**  
- Delayed: **13.4%**

#### 📈 Average Delay by Day of Week
![Average Delay by Day](charts/avg_delay_by_weekday.png)  
- Highest on **Day 6 (~10.2 min)**, lowest on **Day 4 (~3.6 min)**

#### ✈️ Average Delay by Flight Type
![Delay by Flight Type](charts/avg_delay_by_flight_type.png)  
- Short Haul: ~7.8 min  
- Medium Haul: ~6.7 min  
- Long Haul: ~5.0 min  

#### 🧭 Average Flight Distance per Carrier
![Distance per Carrier](charts/avg_distance_per_carrier.png)  
- Longest average distance by **HA (~5000 miles)**  
- Shortest by **9E (~400 miles)**  

#### 🌆 Top 15 Destinations by Flight Count
![Top Destinations](charts/flights_per_destination.png)  
- **LAX:** ~2900 flights  
- **SFO, BOS, FLL, MCO** follow closely.

#### 🕐 Average Departure Delay per Carrier
![Delay per Carrier](charts/avg_delay_per_carrier.png)  
- **OO:** Highest delay (~16.5 min)  
- **HA:** Lowest delay (~0.8 min)

> *(Additional visuals: Wind Speed vs Taxi-Out, Monthly Delay Trends, Weather Conditions, Pressure vs Delay, Humidity Impact, etc.)*  
> See the `/charts/` folder for all **16 visualizations**.

---

### 📈 Insights & Findings

- **🕓 Scheduling Impact:** Early morning and late-night flights experience the highest delays; midday flights are more punctual.  
- **🌦️ Weather Effect:** Fog and light/heavy rain have the strongest correlation with longer departure delays.  
- **✈️ Airline Performance:** Carriers **OO** and **B6** consistently show higher delay averages, while **HA** performs best.  
- **📅 Seasonal Patterns:** Delay averages gradually decline mid-year but surge sharply in **December (~12 min)** — likely due to increased holiday traffic.  
- **💨 Operational Efficiency:** Taxi-out times remain relatively stable regardless of wind speed, suggesting efficient ground operations.  
- **📊 Data Distribution:** Most high-delay days cluster between **17–27 minutes**, indicating occasional systemic bottlenecks.

---

## 🚀 Power BI Flight Performance Dashboard

An interactive Power BI dashboard that analyzes flight performance, delays, and weather impact across 29K+ flights.  
The report contains five key pages that provide a complete operational view.

### 1️. Overview
Highlights total flights, on-time and delay rates, and average delay time.  
Includes a visual comparison of on-time vs delayed flights and key KPIs for quick insight.

### 2️. Airline Performance
Compares carriers based on punctuality, flight distance, and departure delay.  
Displays the best and worst performing airlines through detailed visuals.

### 3️. Time Analysis
Explores how flight delays vary by day, month, and scheduled hour.  
Identifies peak delay days and time windows with the highest operational challenges.

### 4️. Weather Impact
Analyzes how different weather conditions (humidity, pressure, wind) affect flight delays.  
Highlights the worst weather types impacting performance.

### 5️. Operational Metrics
Focuses on taxi-out times and their relation to wind speed and destinations.  
Reveals average and maximum taxi durations and performance insights per airport.


---

### 🧩 Next Steps
- Integrate weather-based predictive modeling  
- Expand data scope to include **arrival delays**  

---

### 👨‍💻 Author
**Mohamed Emad | Data Analyst**  

---

### 🏷️ Tags
`#DataAnalysis` `#Python` `#SQL` `#PowerBI` `#DataVisualization` `#AviationAnalytics` `#JFKAirport` `#FlightDelays`


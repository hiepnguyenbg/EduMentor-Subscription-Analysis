# EduMentor Subscription Analysis


Table of Contents

- [Project Background](#project-background)
- [Data Structure and Initial Checks](#data-structure-and-initial-checks)
- [Executive Summary](#executive-summary)
- [Insights Deep-Dive](#insights-deep-dive)
    - [Plan Type Performance](#plan-type-performance)
    - [Billing Period Analysis](#billing-period-analysis)
    - [Regional Performance](#regional-performance)
- [Recommendations](#recommendations)
- [Assumptions and Caveats](#assumptions-and-caveats)
- [Dashboard](#dashboard)


# Project Background
Founded in 2017, EduMentor Academy is a global e-learning platform that delivers a curated library of professionally designed courses, tutoring services, and certifications. Its offerings cover both academic subjects (e.g., mathematics, science, languages) and professional skills (e.g., coding, business management), complemented by learning management tools and a mobile app. To serve diverse learners, EduMentor offers three subscription plans: Standard, Premium, and Premium Plus, which differ in content access and the number of private tutoring sessions included.

As a data analyst at EduMentor, I am working with the Head of Operations to optimize performance across the product, sales, and marketing teams. This project examines subscription data from January 2020 to December 2021 to uncover trends and opportunities that can strengthen EduMentor’s business performance.

Key areas of analysis include:
- **North Star Metrics**: Total subscription sales from different plans
- **Plan Type Performance**: Evaluation of Standard, Premium, and Premium Plus plans and their contributions to subscription revenue.
- **Billing Period Performance**: Assessment of yearly versus monthly billing cycles and their impact on revenue.
- **Regional Performance**: Analysis of subscription revenue across geographical regions.

SQL queries used to import data into MySQL can be found [here](https://github.com/hiepnguyenbg/EduMentor-Subscription-Analysis/blob/main/SQL%20queries/Dataset%20Import.sql). 

SQL queries used to inspect the dataset can be found [here](https://github.com/hiepnguyenbg/EduMentor-Subscription-Analysis/blob/main/SQL%20queries/Initial%20Data%20Checks.sql).  

Targeted SQL queries regarding various business questions can be found [here](https://github.com/hiepnguyenbg/EduMentor-Subscription-Analysis/blob/main/SQL%20queries/Targeted%20Business%20Questions.sql).

SQL queries to export data ready for analysis in Tableau could be found [here](https://github.com/hiepnguyenbg/EduMentor-Subscription-Analysis/blob/main/SQL%20queries/Cleaned%20Data%20for%20Analysis.sql).  

An interactive Tableau dashboard used to report and explore subscription sales trends can be found [here](https://public.tableau.com/app/profile/hiepnguyenbg/viz/EduMentor/Dashboard).

# Data Structure and Initial Checks
The dataset encompasses subscription records from January 2020 to December 2021. The database structure consists of two tables: `orders` and `geo_lookup`, with a total row count of more than 200,000 records.

![EduMentor ERD](https://github.com/hiepnguyenbg/EduMentor-Subscription-Analysis/blob/main/SQL%20queries/EduMentor_ERD.png)

Prior to beginning the analysis, a variety of checks were conducted for quality control and familiarization with the dataset. SQL queries utilized to inspect and perform quality checks are available [here](https://github.com/hiepnguyenbg/EduMentor-Subscription-Analysis/blob/main/SQL%20queries/Initial%20Data%20Checks.sql).

# Executive Summary
### Overview of Findings
EduMentor Academy’s subscription revenue surged in early 2020 to over $750K per week, driven primarily by Premium Plus subscriptions amid heightened demand for remote learning during the COVID-19 pandemic. Revenue then declined steadily through late 2021, stabilizing at $350K–$450K per week, with Premium subscriptions ending entirely and yearly subscriptions dropping significantly. Regional analysis indicates North America’s dominance in revenue (~50%) and noticeable volatility in EMEA. To drive recovery, EduMentor should counter Premium Plus seasonality with summer offerings, revamp Premium plans with high-engagement content, and boost yearly plan retention through trials or targeted promotions.


# Insights Deep Dive
### Plan Type Performance
- **Premium Plus plans led revenue in early 2020.** At the start of the pandemic, Premium Plus plans had a significant spike and record-high at $453K bookings in one week. This spike then significantly decreased and slowed in both summer of 2020 and summer of 2021, likely tied to academic calendars.
- **Premium plans nearly ceased by December 2021.** A notable downturn in Premium plans suggests competitive pressures or content issues.
- **Standard plans ensured revenue stability.** Standard plans for students contributed the most to the overall renuve due to its affordability.


### Billing Period Analysis
- **Yearly subscriptions drove 97% of revenue.** Primarily from Premium Plus and Standard plans, yearly subscriptions were dominant but revenue declined significantly by December 2021.
- **Monthly subscriptions remained more stable.** Monthly subscriptions showed consistency, reflecting demand for flexible commitments.


### Regional Performance
- **North America led revenue.** During the peak-COVID months in early 2020, North America made up almost two thirds of weekly subscriptions, and most of the spike in Premium Plus was contained to this region. North America contributed nearly 50% of total sales over the two years.
- **EMEA showed volatility.** Revenue fluctuations in EMEA might reflect challenges in consistent adoption across diverse educational systems.


# Recommendations
Based on the insights and findings above, we recommend the product, marketing, and sales teams to consider the following:
- Reduced Premium Plus subscription in summer months might benefit from introducing short-term summer courses or educator training to maintain Premium Plus subscriptions during academic breaks.
- Low course completion rates for Premium plans suggest revamping the plan with interactive content and targeted promotions (e.g., coding, management courses) to re-engage professionals.
- Yearly plans have an outsized-impact on subscription revenue, so consider adding trials or personalized promotions to improve the dip in yearly plans.
- While regional trends have remained relatively consistent, EMEA shows the most volatility - investigate whether there are features or promos to help make this region more stable. 


# Assumptions and Caveats
Throughout the analysis, multiple assumptions were made to manage challenges with the data:
- **Missing region data recoded.** Countries with missing regions in the `geo_lookup` table were assigned to the correct regions based on information found on the internet. The EU, though not a country, was assigned to EMEA. IR was also assigned to EMEA, even though it is controversial.
- **Records with USD price but missing either sub_type or sub_period partly handled.** Based on the price ranges of different plans, records with a price under $20 were assigned to the monthly Standard plan. Those with higher prices were left as is.

# Dashboard
The dashboard can be found in Tableau Public [here](https://public.tableau.com/app/profile/hiepnguyenbg/viz/EduMentor/Dashboard). This dashboard enables users to filter by plan, subscription period, and region, and focuses on trends and values in sales metrics.

<img width="812" alt="image" src="https://github.com/hiepnguyenbg/EduMentor-Subscription-Analysis/blob/main/SQL%20queries/EduMentor%20Dashboard.png">

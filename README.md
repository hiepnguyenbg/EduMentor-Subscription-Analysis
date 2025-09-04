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
Founded in 2019, EduMentor Academy is a global e-learning platform that delivers a curated library of professionally designed courses, tutoring services, and certifications. Its offerings cover both academic subjects (e.g., mathematics, science, languages) and professional skills (e.g., coding, business management), complemented by learning management tools and a mobile app. To serve diverse learners, EduMentor offers three subscription plans: Standard, Premium, and Premium Plus, which differ in content access and the number of private tutoring sessions included.

As a data analyst at EduMentor, I am working with the Head of Operations to optimize performance across the product, sales, and marketing teams. This project examines subscription data from January 2020 to December 2021 to uncover trends and opportunities that can strengthen EduMentor’s business performance.

Key areas of analysis include:
- **North Star Metrics**: Total subscription sales from different plans
- **Plan Type Performance**: Evaluation of Standard, Premium, and Premium Plus plans and their contributions to subscription revenue.
- **Billing Period Performance**: Assessment of yearly versus monthly billing cycles and their impact on revenue.
- **Regional Performance**: Analysis of subscription revenue across geographical regions.

SQL queries used to import data into MySQL can be found [here](https://github.com/hiepnguyenbg/EduMentor-Subscription-Analysis/blob/main/SQL%20queries/Dataset%20Import.sql). 

SQL queries used to inspect the dataset can be found [here](https://github.com/hiepnguyenbg/EduMentor-Subscription-Analysis/blob/main/SQL%20queries/Initial%20Data%20Checks.sql).  

Targeted SQL queries regarding various business questions can be found [here](https://github.com/hiepnguyenbg/EduMentor-Subscription-Analysis/blob/main/SQL%20queries/Targeted%20Business%20Questions.sql).

SQL queries to export data ready for analysis in Tableau can be found [here](https://github.com/hiepnguyenbg/EduMentor-Subscription-Analysis/blob/main/SQL%20queries/Cleaned%20Data%20for%20Analysis.sql).  

An interactive Tableau dashboard used to report and explore subscription sales trends can be found [here](https://public.tableau.com/app/profile/hiepnguyenbg/viz/EduMentor/Dashboard).

# Data Structure and Initial Checks
The dataset encompasses subscription records from January 2020 to December 2021. The database structure consists of two tables: `orders` and `geo_lookup`, with a total row count of more than 200,000 records.

![EduMentor ERD](https://github.com/hiepnguyenbg/EduMentor-Subscription-Analysis/blob/main/SQL%20queries/EduMentor_ERD.png)

Prior to beginning the analysis, a variety of checks were conducted for quality control and familiarization with the dataset. SQL queries utilized to inspect and perform quality checks are available [here](https://github.com/hiepnguyenbg/EduMentor-Subscription-Analysis/blob/main/SQL%20queries/Initial%20Data%20Checks.sql).

# Executive Summary

### Overview of Findings

EduMentor Academy’s subscription revenue surged in early 2020 to over $750K per week, driven primarily by Premium Plus subscriptions amid heightened demand for remote learning during the COVID-19 pandemic. Revenue then declined steadily through late 2021, a trend that saw yearly subscriptions drop significantly and the Premium plan nearly cease entirely. Regional analysis indicates North America’s dominance in revenue (~50%) and noticeable volatility in EMEA. To drive recovery, EduMentor should counter Premium Plus seasonality with summer offerings, revamp Premium plans with high-engagement content, and boost yearly plan retention through trials or targeted promotions.

# Insights Deep Dive
### Plan Type Performance
- **Premium Plus plans led revenue in early 2020.** At the start of the pandemic, Premium Plus plans had a significant spike and record-high at $453K in one week. This spike then significantly decreased and slowed in both the summer of 2020 and 2021, likely tied to academic calendars.
- **Premium plans nearly ceased by December 2021.** A notable downturn in Premium plans suggests competitive pressures or content issues.
- **Standard plans ensured revenue stability.** Standard plans contributed the most to overall revenue due to their affordability.

### Billing Period Analysis

- **Yearly subscriptions followed the overall trend.** Accounting for a dominant **97% of total revenue**, yearly subscriptions' trend was nearly identical to overall sales: they peaked in early 2020 and then declined significantly by the end of 2021.
- **Monthly subscriptions showed a volatile trend.** While their revenue share was small, monthly subscriptions peaked at $18K in March 2020 before dropping to $10K by July 2020. After several fluctuations, they recovered to end the period at $14K, indicating a volatile yet resilient user that values flexible commitments.

### Regional Performance

* **North America led revenue.** During the peak of the pandemic in early 2020, North America made up almost two-thirds of weekly subscriptions, and most of the spike in Premium Plus was contained to this region. The region contributed nearly 50% of total sales over the two years.
* **EMEA showed volatility.** Revenue fluctuations in EMEA suggest challenges in consistent adoption across diverse educational systems.

### Recommendations

Based on the uncovered insights, the product, marketing, and sales teams should consider the following recommendations:

* **Counter Premium Plus Seasonality.** Introduce short-term summer courses or educator training to maintain Premium Plus subscriptions and combat the significant revenue drops during academic breaks.
* **Revamp Underperforming Premium Plans.** Revamp the Premium plan with high-engagement content, such as coding or business management courses, and use targeted promotions to re-engage professionals.
* **Boost Yearly Subscription Retention.** Given their outsized impact on revenue, improve yearly subscription retention by adding free trials or personalized promotions to prevent the significant post-peak dip.
* **Stabilize Volatile EMEA Market.** Investigate and implement targeted features or promotions to help stabilize revenue trends in the EMEA region.

### Assumptions and Caveats

Throughout the analysis, the following assumptions and caveats were made to manage challenges with the raw data:

* **Missing Region Data Imputed.** Countries with missing regional data were assigned to the correct regions based on external information. This included assigning "EU" and "IR" to the EMEA region for consistency.
* **Incomplete Records Handled.** Records with a USD price but missing a `sub_type` or `sub_period` were partly handled. Based on plan pricing, records under $20 were assigned to the monthly Standard plan, while records with higher prices were left unassigned to avoid incorrect assumptions.

# Dashboard

An interactive Tableau dashboard used to explore subscription sales trends can be found [here](https://public.tableau.com/app/profile/hiepnguyenbg/viz/EduMentor/Dashboard). The dashboard allows users to filter by plan, subscription period, and region.

<img width="812" alt="image" src="https://github.com/hiepnguyenbg/EduMentor-Subscription-Analysis/blob/main/SQL%20queries/EduMentor%20Dashboard.png">

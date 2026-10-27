# InsightFlow — E-Commerce Customer Intelligence & Business Analytics

## Business Findings and Recommendations

### Project Overview

This report documents the business questions, SQL analysis results, interpretations, and recommendations derived from the Olist e-commerce dataset.

The analysis uses the PostgreSQL database `olist_analytics` and the table `olist_master`.

---

## Business Question 1: What are the overall sales, unique orders, and average order value?

**SQL file:** `SQL/01_business_kpis.sql`

### Results

| Metric | Result |

|---|---:|

| Total sales based on item values | R$15,442,699.01 |

| Unique orders | 96,897 |

| Average order value (AOV) | R$159.37 |

### Business Answer

The dataset contains 96,897 distinct orders, with total item values of R$15,442,699.01. The calculated average order value is R$159.37.

### Business Interpretation

These metrics establish a baseline for understanding the scale of the business and the value of its orders. They can be used to contextualize sales trends and other performance analyses.

### Recommendations

- Monitor sales and order volume over time to identify growth and decline.

- Track average order value alongside order volume to understand changes in purchasing value.

- Compare these metrics across time periods and product categories where appropriate.

### Metric Definitions and Limitations

- **Total sales:** Sum of `item_total_value` across all rows in `olist_master`.

- **Unique orders:** Count of distinct `order_id` values.

- **Average order value:** Total `item_total_value` divided by the number of distinct orders.

- These results do not establish profit. The query does not separately account for costs, and whether shipping, refunds, discounts, or other adjustments are included depends on how `item_total_value` was defined.

---

## Business Question 2: Which product categories generate the most sales?

**SQL file:** `SQL/01_business_kpis.sql`

### Results

| Rank | Product category | Total sales (R$) | Distinct orders | Average item value (R$) |

|---:|---|---:|---:|---:|

| 1 | Health & Beauty (`health_beauty`) | 1,342,533.32 | 8,267 | 148.18 |

| 2 | Watches & Gifts (`watches_gifts`) | 1,174,038.09 | 5,271 | 208.98 |

| 3 | Bed, Bath & Table (`bed_bath_table`) | 1,141,188.76 | 8,725 | 111.32 |

| 4 | Sports & Leisure (`sports_leisure`) | 1,064,588.45 | 7,175 | 132.77 |

| 5 | Computers & Accessories (`computers_accessories`) | 973,884.75 | 6,270 | 132.45 |

| 6 | Unknown (`unknown`) | 848,276.74 | 5,436 | 141.59 |

| 7 | Furniture & Decor (`furniture_decor`) | 826,834.85 | 5,936 | 108.22 |

| 8 | Housewares (`housewares`) | 704,769.38 | 5,471 | 109.08 |

| 9 | Cool Stuff (`cool_stuff`) | 663,911.14 | 3,270 | 193.67 |

| 10 | Auto (`auto`) | 633,303.83 | 3,609 | 160.98 |

### Business Answer

Health & Beauty is the highest-revenue category among the ten returned categories, generating R$1,342,533.32 across 8,267 distinct orders. Watches & Gifts ranks second in sales, while Bed, Bath & Table ranks third and has the highest distinct-order count among these categories.

Watches & Gifts has the highest average item value in this list at R$208.98. Bed, Bath & Table has a lower average item value of R$111.32 but appears in more distinct orders.

### Business Interpretation

The results show differences in category performance. Health & Beauty leads the listed categories in total sales. Watches & Gifts combines substantial sales with a higher average item value, while Bed, Bath & Table has the largest number of distinct orders in the top ten.

The `Unknown` category accounts for R$848,276.74 in sales. Missing category labels make it harder to determine which product categories generated this revenue.

### Recommendations

- Review Health & Beauty's performance to identify opportunities to sustain its sales contribution.

- Investigate Watches & Gifts' product mix and higher average item value.

- Explore the order volume in Bed, Bath & Table to identify opportunities for further growth.

- Investigate missing product-category labels to improve the reliability of category reporting.

- Compare category performance over time before making inventory or marketing investment decisions.

### Metric Definitions and Limitations

- **Total category sales:** Sum of `item_total_value` for each category.

- **Distinct category orders:** Count of unique `order_id` values within each category. A single order may contain items from multiple categories, so category order counts should not be added together to calculate total business orders.

- **Average item value:** Average `item_total_value` per row in the category, not average order value.

- The query returns the ten categories with the highest summed item values and includes missing category labels under `Unknown`.

- The results describe observed performance; they do not establish why customers prefer particular categories.

---

## Business Question 3: How do sales and order volumes change over time?

**SQL file:** `SQL/02_sales_trends.sql`

### Results

- **Peak sales month:** November 2017.

- **Sales in November 2017:** R$1,150,227.46.

- **Distinct orders in November 2017:** 7,325.

- **Other high-sales months:** March 2018 (R$1,126,090.04), April 2018 (R$1,132,752.73), and May 2018 (R$1,121,824.95).

### Business Answer

November 2017 recorded the highest monthly sales in the query results, with R$1,150,227.46 in item-value sales and 7,325 distinct orders.

Several months in 2018 also recorded high sales, indicating that strong monthly performance was not limited to November 2017.

### Business Interpretation

The monthly analysis helps identify periods of stronger and weaker sales activity. November 2017 stands out as the strongest month by sales in the returned results. The high sales observed during March–May 2018 also warrant further investigation.

These results identify sales patterns but do not explain the reasons behind them. Additional information would be needed to determine whether promotions, seasonal demand, changes in product mix, or other factors contributed to the observed patterns.

### Recommendations

1. Investigate the business activities and demand patterns associated with November 2017's peak sales.

2. Compare the high-performing months in 2018 to identify recurring sales patterns.

3. Use monthly sales and order counts to support demand forecasting and operational planning.

4. Treat the first and last months of the dataset cautiously because some periods have very low recorded sales and may be incomplete.

### Metric Definitions and Limitations

- **Monthly sales:** Sum of `item_total_value` grouped by purchase month.

- **Monthly orders:** Count of distinct `order_id` values grouped by purchase month.

- Records with null `order_purchase_timestamp` values are excluded.

- The query groups records by calendar month and does not independently identify whether each month represents a complete period.

- The analysis describes observed trends and does not establish their causes.

---

## Business Question 4: How many orders are delivered late versus early or on time?

**SQL file:** `SQL/03_delivery_performance.sql`

### Results

| Delivery status | Distinct orders | Percentage |

|---|---:|---:|

| Early / On Time | 87,096 | 91.89% |

| Late | 7,688 | 8.11% |

### Business Answer

Among orders with a recorded delivery status, 87,096 orders (91.89%) were delivered early or on time, while 7,688 orders (8.11%) were delivered late.

### Business Interpretation

Most orders in the analyzed group were delivered early or on time. However, the late-delivery share indicates an opportunity to investigate delivery delays and improve reliability.

### Recommendations

1. Investigate late orders to identify recurring delivery issues.

2. Monitor the late-delivery rate over time to assess whether delivery performance improves.

3. Compare delivery performance across regions and, where data permits, carriers or shipping methods.

4. Review late-delivery patterns alongside customer review scores to understand their association with customer satisfaction.

### Metric Definitions and Limitations

- **Distinct orders:** Count of unique `order_id` values for each delivery status.

- **Percentage:** Each status's distinct-order count divided by the total distinct-order counts across the statuses returned by the query.

- Orders with a null `delivery_status` are excluded.

- These results describe delivery performance but do not identify the causes of delays.

---

## Business Question 5: What is the average customer review score?

**SQL file:** `SQL/04_customer_satisfaction.sql`

### Results

| Metric | Result |

|---|---:|

| Average customer review score | 4.03 / 5 |

| Distinct orders with review data | 96,164 |

| Low-review rows (score ≤ 2) | 17,649 |

| High-review rows (score ≥ 4) | 82,824 |

### Business Answer

The average customer review score is 4.03 out of 5 across the records with available review scores. The dataset contains 96,164 distinct orders with review data. The query also counts 17,649 rows with scores of 2 or lower and 82,824 rows with scores of 4 or higher.

### Business Interpretation

The average score of 4.03 out of 5 indicates generally positive customer ratings in the analyzed data. However, the number of low-review rows highlights an opportunity to investigate customer experiences associated with lower scores.

The high- and low-review counts describe rows in the dataset, not necessarily distinct orders. Further analysis can examine how review scores relate to delivery performance and whether particular regions or other business factors are associated with lower ratings.

### Recommendations

1. Investigate low-review records to identify recurring customer concerns.

2. Compare review scores with delivery performance to assess the relationship between delivery delays and customer satisfaction.

3. Monitor average review scores over time to identify changes in customer feedback.

4. Examine regional differences in review scores to identify areas that may need further investigation.

5. Where possible, analyze review counts and percentages at the distinct-order level to avoid overstating the number of affected orders.

### Metric Definitions and Limitations

- **Average customer review score:** Average of non-null `avg_review_score` values, rounded to two decimal places.

- **Distinct orders with review data:** Count of unique `order_id` values among rows with non-null review scores.

- **Low-review rows:** Number of rows where `avg_review_score` is less than or equal to 2.

- **High-review rows:** Number of rows where `avg_review_score` is greater than or equal to 4.

- Low- and high-review metrics count rows rather than distinct orders; an order may contribute multiple rows.

- The average describes the available review-score data and does not by itself explain the causes of customer satisfaction or dissatisfaction.

---

## Business Question 6: Do late deliveries receive lower review scores?

**SQL file:** `SQL/05_delivery_vs_reviews.sql`

### Results

| Delivery status | Orders | Average review score | Low-review orders | Low-review percentage |

|---|---:|---:|---:|---:|

| Early / On Time | 86,623 | 4.29 / 5 | 8,006 | 9.24% |

| Late | 7,528 | 2.56 / 5 | 4,070 | 54.06% |

### Business Answer

Orders delivered late had an average review score of 2.56 out of 5, compared with 4.29 for orders delivered early or on time.

Additionally, 54.06% of late-delivered orders had an average review score of 2 or lower, compared with 9.24% of early/on-time orders. This is a difference of 44.82 percentage points in the low-review rate.

### Business Interpretation

The results show a strong association between late delivery and lower customer review scores in the analyzed orders. More than half of the late-delivery group had an average review score of 2 or lower, while the corresponding share for the early/on-time group was substantially smaller.

This pattern suggests that delivery reliability may be an important area to investigate when seeking to improve customer satisfaction. However, the analysis demonstrates an association, not proof that late delivery alone causes lower review scores. Other factors, such as product quality or the overall purchasing experience, may also influence reviews.

### Recommendations

1. Investigate the operational causes of late deliveries and identify recurring patterns.

2. Monitor average review scores and low-review percentages by delivery status over time.

3. Prioritize investigation of late-delivered orders with low review scores to identify recurring customer concerns.

4. Compare delivery and review outcomes across states to identify areas for further operational analysis.

5. Track whether improvements in delivery performance coincide with changes in customer review scores.

### Metric Definitions and Limitations

- **Orders:** Number of distinct orders included in each delivery-status group after grouping by `order_id`.

- **Average review score:** Average of the available `avg_review_score` values for each order, then averaged across orders in each delivery-status group.

- **Low-review orders:** Orders with an average review score of 2 or lower.

- **Low-review percentage:** Low-review orders divided by the total orders in that delivery-status group, multiplied by 100.

- The query uses `MAX(delivery_status)` to select one delivery status per order. This assumes each order has a consistent status across its rows; conflicting statuses should be investigated.

- Only orders with both a non-null delivery status and a non-null review score are included.

- The findings show an association and do not establish causation.

---

## Business Question 7: Which Customer States Have the Highest Late-Delivery Rates?

**SQL file:** `SQL/06_delivery_by_state.sql`

### Objective

Identify customer states with the highest late-delivery rates to highlight regions that may need improvements in delivery operations.

### Key Findings

- **Alabama (AL)** had the highest late-delivery rate at **23.72%**, with 93 late orders out of 392.

- **Maranhão (MA)** ranked second, with a late-delivery rate of **19.60%** (137 late orders out of 699).

- **Piauí (PI)** ranked third, with a late-delivery rate of **16.03%** (75 late orders out of 468).

- **São Paulo (SP)** had the largest absolute number of late orders: **2,340 out of 39,753 orders**, representing a late-delivery rate of **5.89%**.

- **Rondônia (RO)** had the lowest late-delivery rate among the states returned by this query, at **2.92%** (7 late orders out of 240).

### Business Interpretation

The results reveal substantial regional variation in delivery performance. Some states have high late-delivery percentages despite having relatively few orders, while São Paulo has a lower late-delivery rate but the largest number of late orders due to its much higher order volume.

### Business Recommendations

1. **Investigate high-rate states:** Review carrier performance, delivery routes, transit times, and operational constraints in AL, MA, and PI.

2. **Prioritize late-order volume:** Examine São Paulo's 2,340 late orders to identify opportunities for reducing the overall number of delayed deliveries.

3. **Compare regional operations:** Use lower-rate states such as RO as starting points for investigating potentially effective delivery practices, while accounting for differences in order volume and logistics.

4. **Monitor performance over time:** Track late-delivery rates and late-order counts by state to assess whether operational changes improve delivery reliability.

### Conclusion

Regional analysis shows that delivery performance varies considerably across customer states. High late-delivery rates identify regions for further investigation, while total late-order counts help prioritize improvements in high-volume markets. These results identify where to investigate; they do not establish the causes of delays.

---

## Overall Summary

The analysis of the Olist e-commerce dataset identified several important patterns in sales, product categories, monthly performance, delivery operations, customer satisfaction, and regional delivery reliability.

- **Sales performance:** Total sales based on item values were R$15,442,699.01 across 96,897 distinct orders, with an average order value of R$159.37.

- **Product categories:** Health & Beauty generated the highest sales among the listed categories, while Watches & Gifts had the highest average item value among the top 10 categories.

- **Monthly trends:** November 2017 recorded the highest monthly sales in the analyzed results, at R$1,150,227.46. Some months at the beginning or end of the dataset may represent incomplete periods.

- **Delivery performance:** Among orders with a non-null delivery status, 91.89% were classified as Early / On Time and 8.11% as Late.

- **Customer satisfaction:** The average review score was 4.03 out of 5 across orders with review data.

- **Delivery and reviews:** Late orders had an average review score of 2.56, compared with 4.29 for Early / On Time orders. The low-review rate was 54.06% for late orders and 9.24% for Early / On Time orders, a difference of 44.82 percentage points. This indicates a strong association between late delivery and lower review scores, but does not prove causation.

- **Regional delivery performance:** Alabama had the highest late-delivery rate in the query results at 23.72%, followed by Maranhão at 19.60% and Piauí at 16.03%. São Paulo had the largest number of late orders, with 2,340, despite a lower rate of 5.89%.

### Final Business Recommendations

1. Improve delivery monitoring and investigate the operational factors associated with late deliveries.

2. Prioritize regional investigations using both late-delivery rates and absolute late-order counts.

3. Examine the relationship between delivery reliability and customer reviews to identify opportunities to improve customer experience.

4. Monitor sales, category performance, delivery outcomes, and review scores regularly to support data-driven decisions.

5. Validate data quality, including unknown product categories and any inconsistent order-level delivery statuses, before making operational decisions.

Overall, the project demonstrates how SQL-based analysis can turn e-commerce order data into actionable insights for sales monitoring, customer experience, and delivery operations.

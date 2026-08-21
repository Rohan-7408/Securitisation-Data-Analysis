-- Securitisation Data Analysis
-- SQL Analysis Queries

-- 1. View all records
SELECT *
FROM securitisation_analysis_dataset;


-- 2. Count total records
SELECT COUNT(*) AS total_records
FROM securitisation_analysis_dataset;


-- 3. Average qualifying credit score
SELECT
    AVG(qualifying_credit_score) AS average_credit_score
FROM securitisation_analysis_dataset;


-- 4. Average verified DTI
SELECT
    AVG(tpr_verified_dti_pct) AS average_verified_dti
FROM securitisation_analysis_dataset
WHERE tpr_verified_dti_pct > 0;


-- 5. Loan program distribution
SELECT
    loan_program,
    COUNT(*) AS loan_count
FROM securitisation_analysis_dataset
GROUP BY loan_program
ORDER BY loan_count DESC;


-- 6. Average benchmark rate by loan program
SELECT
    loan_program,
    ROUND(AVG(benchmark_rate_pct), 2) AS avg_benchmark_rate
FROM securitisation_analysis_dataset
WHERE benchmark_rate_pct IS NOT NULL
GROUP BY loan_program
ORDER BY avg_benchmark_rate DESC;


-- 7. Credit score categories
SELECT
    CASE
        WHEN qualifying_credit_score >= 750 THEN 'Excellent'
        WHEN qualifying_credit_score >= 700 THEN 'Good'
        ELSE 'Below 700'
    END AS credit_category,
    COUNT(*) AS record_count
FROM securitisation_analysis_dataset
GROUP BY
    CASE
        WHEN qualifying_credit_score >= 750 THEN 'Excellent'
        WHEN qualifying_credit_score >= 700 THEN 'Good'
        ELSE 'Below 700'
    END
ORDER BY record_count DESC;


-- 8. DSCR records
SELECT
    COUNT(*) AS dscr_records
FROM securitisation_analysis_dataset
WHERE tpr_dscr IS NOT NULL;


-- 9. Average DSCR
SELECT
    AVG(tpr_dscr) AS average_tpr_dscr
FROM securitisation_analysis_dataset
WHERE tpr_dscr IS NOT NULL;


-- 10. Employment indicator analysis
SELECT
    employment_indicator,
    COUNT(*) AS record_count
FROM securitisation_analysis_dataset
GROUP BY employment_indicator
ORDER BY record_count DESC;

import pandas as pd
import matplotlib.pyplot as plt

df = pd.read_csv("securitisation_analysis_dataset.csv")

numeric_cols = [
    "benchmark_rate_pct", "originator_dti_pct", "tpr_verified_dti_pct",
    "qm_dti_pct", "tpr_dscr", "originator_dscr",
    "qualifying_credit_score", "dti_difference_pct"
]
for col in numeric_cols:
    df[col] = pd.to_numeric(df[col], errors="coerce")

print("Shape:", df.shape)
print("\nMissing values:")
print(df.isna().sum())

print("\nAverage benchmark rate:")
print(df["benchmark_rate_pct"].mean())

print("\nAverage qualifying credit score:")
print(df["qualifying_credit_score"].mean())

print("\nLoan program counts:")
print(df["loan_program"].value_counts())

print("\nAverage benchmark rate by program:")
print(df.groupby("loan_program")["benchmark_rate_pct"].mean().sort_values(ascending=False))

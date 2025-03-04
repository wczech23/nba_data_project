import pandas as pd
from pathlib import Path

coaching_data_filepath = Path("coaching_data/")
for file in coaching_data_filepath.iterdir():
    if file.is_file():
        with open(file, "r") as file:
            excel_file = pd.read_html(file)
            filename = str(file).split("/")[1].split(".")[0]
            filepath = f"{str(coaching_data_filepath)}/{filename}.csv"
            excel_file = excel_file[0] # modifying format of file to fit csv
            excel_file.columns = [' '.join(col).strip() for col in excel_file.columns.values]
            excel_file = excel_file.dropna(axis=1, how="all")
            excel_file = excel_file.fillna(value=0)
            excel_file.to_csv(filepath, index=False, encoding="utf-8", sep=",")
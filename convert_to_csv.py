import pandas as pd
from pathlib import Path
import openpyxl

# converting coaching data files to csv

coaching_data_filepath = Path("coaching_data/")
for file in coaching_data_filepath.iterdir():
    if file.is_file():
        with open(file, "r") as file:
            excel_file = pd.read_html(file)
            filename = str(file).split("/")[1].split(".")[0]
            filepath = f"{str(coaching_data_filepath)}/{filename}"
            excel_file = excel_file[0] # modifying format of file to fit csv
            excel_file.columns = [' '.join(col).strip() for col in excel_file.columns.values]
            excel_file.to_csv(filepath, index=False)


# converting team data to csv
team_data_filepath = Path("team_data/")
for file in team_data_filepath.iterdir():
    if file.is_file():
        with open(file, "r") as file:
            excel_file = pd.read_html(file)
            excel_file = excel_file[0] # modifying file format to fit csv
            excel_file.columns = [' '.join(col).strip() for col in excel_file.columns.values]
            filename = str(file).split("/")[1].split(".")[0]
            filepath = f"{str(team_data_filepath)}/{filename}"
            excel_file.to_csv(filepath, index=False)

# converting player data to csv

sheet_names = range(2006,2026)

for sheet in sheet_names:
    sheet_data = pd.read_excel("player_data/nba_player_advstats.xlsx", sheet_name=str(sheet))
    sheet_data['Year'] = f"{sheet}"
    filepath = f"player_data/nba_player_advstats{sheet}"
    sheet_data.to_csv(filepath, index=False)

# converting player salaries to csv
for sheet in sheet_names:
    sheet_data = pd.read_excel("player_data/nba_player_salaries.xlsx", sheet_name=str(sheet))
    column_names = ['Player', 'Salary'] # modifying column data for uniform sql insert
    sheet_data = sheet_data.iloc[:, 1:3]
    sheet_data.columns = [f'{column_names[i]}' for i in range(len(sheet_data.columns))]
    sheet_data['Year'] = f"{sheet}"
    filepath = f"player_data/nba_player_salaries{sheet}"
    sheet_data.to_csv(filepath, index=False)
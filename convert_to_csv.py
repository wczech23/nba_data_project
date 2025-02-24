import pandas as pd
from pathlib import Path
import openpyxl

# converting coaching data files to csv

#coaching_data_filepath = Path("coaching_data/")
#for file in coaching_data_filepath.iterdir():
    #if file.is_file():
        #with open(file, "r") as file:
            #excel_file = pd.read_html(str(file))
            #filename = str(file).split("/")[1].split(".")[0] + ".csv"
            #filepath = f"{str(coaching_data_filepath)}/{filename}"
            #excel_file = excel_file[0] # modifying format of file to fit csv
            #excel_file.columns = [' '.join(col).strip() for col in excel_file.columns.values]
            #excel_file.to_csv(filepath, index=False)


# converting team data to csv
team_data_filepath = Path("team_data/")
for file in team_data_filepath.iterdir():
    if file.is_file():
        with open(file, "r") as file:
            excel_file = pd.read_html(file)
            excel_file = excel_file[0] # modifying file format to fit csv
            excel_file.columns = [' '.join(col).strip() for col in excel_file.columns.values]
            filename = str(file).split("/")[1].split(".")[0] + ".csv"
            filepath = f"{str(team_data_filepath)}/{filename}"
            excel_file.to_csv(filepath, index=False)
            


sheet_names = range(2006,2026)
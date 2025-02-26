import re
from pathlib import Path

# getting file path for coaching_data
folder_path = Path("player_data/")


for file in folder_path.iterdir():
    if file.is_file():
        #print(file)
        #pattern = r'\((.*?)\)'
        # Find all numbers
        #coaching_year = 2025 - int(re.findall(pattern, str(file))[0])
        filename = str(file).split("/")[1] + ".csv"
        new_file = file.with_name(filename)
        file.rename(new_file)
        
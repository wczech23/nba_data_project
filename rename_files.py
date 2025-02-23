import re
from pathlib import Path

# getting file path for coaching_data
folder_path = Path("team_data/")


for file in folder_path.iterdir():
    if file.is_file():
        pattern = r'\((.*?)\)'
        # Find all numbers
        coaching_year = 2025 - int(re.findall(pattern, str(file))[0])
        #filename = str(file).split(".")[0].split("/")[1]
        
        new_file = file.with_name(f"{coaching_year}_standings.xls")
        file.rename(new_file)
        
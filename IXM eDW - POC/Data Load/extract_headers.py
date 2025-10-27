import glob
import pandas as pd
# import shutil as sh
import re

table_header = {}

data_files_list = glob.glob('./2024/**/**/**/**/*.csv', recursive=True)
n_files = len(data_files_list)

for idx, file_name in enumerate(data_files_list, 1):
    print(f'{file_name} - File {idx}/{n_files}')

    match = re.search(r'dbo\.(.*?)(_\d{4}.*?.csv)', file_name)
    table_name = match.group(1)
    print(table_name)
    with open(file_name, 'r', encoding='utf-8-sig') as f:
        df = pd.read_json(f, lines=True, nrows=1)
    if table_header.get(table_name) is None and not df.empty:
        table_header[table_name] = df.columns

    # if idx > 1500:
    #     break


    print('')



headers_file_content = ''
for table_name in table_header.keys():
    headers_file_content = headers_file_content + f'\n{table_name}:\n{'\n'.join(table_header[table_name])}\n\n\n\n'

with open(f'headers_file.txt', 'w', encoding='utf-8') as f:
    f.write(headers_file_content)











( 'Brands',
  'Contracts',
  'Companies',
  'Contract_Parties',
  'Traders',
  'Users',
  'Countries',
  'Ports')

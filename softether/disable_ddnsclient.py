import sys

def modify_config(file_path):
    with open(file_path, 'r', encoding='utf-8') as file:
        lines = file.readlines()

    in_ddns_client_block = False
    modified_lines = []

    for line in lines:
        stripped_line = line.strip()

        if 'declare DDnsClient' in stripped_line:
            in_ddns_client_block = True
        elif '}' in stripped_line and in_ddns_client_block:
            in_ddns_client_block = False

        if in_ddns_client_block and 'bool Disabled' in stripped_line:
            modified_line = '\t\tbool Disabled true\n'
        else:
            modified_line = line

        modified_lines.append(modified_line)

    with open(file_path, 'w', encoding='utf-8') as file:
        file.writelines(modified_lines)

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python3 script_name.py <config_file_path>")
        sys.exit(1)

    config_file_path = sys.argv[1]
    modify_config(config_file_path)

import os
import xml.etree.ElementTree as ET

RECENTLY_USED_FILE = os.path.expanduser('~/.local/share/recently-used.xbel')

def add_to_recent_files(file_path):
    # Check if the file exists, if not create a new one
    if not os.path.exists(RECENTLY_USED_FILE):
        with open(RECENTLY_USED_FILE, 'w') as f:
            f.write('<?xml version="1.0" encoding="UTF-8"?>\n<xbel version="1.0">\n</xbel>\n')

    # Parse the existing XML file
    tree = ET.parse(RECENTLY_USED_FILE)
    root = tree.getroot()

    # Check if the file is already in the recent files
    for bookmark in root.findall('bookmark'):
        if bookmark.attrib['href'] == f'file://{file_path}':
            print(f"File {file_path} is already in recent files.")
            return

    # Create a new bookmark element
    new_bookmark = ET.Element('bookmark', href=f'file://{file_path}')
    title = ET.SubElement(new_bookmark, 'title')
    title.text = os.path.basename(file_path)

    # Add new bookmark to root
    root.append(new_bookmark)

    # Write updated XML back to file
    tree.write(RECENTLY_USED_FILE, encoding='UTF-8', xml_declaration=True)

    print(f"Added {file_path} to GNOME recent files.")

if __name__ == "__main__":
    import sys
    if len(sys.argv) != 2:
        print("Usage: ./ssmv.py <file_path>")
        sys.exit(1)

    file_path = sys.argv[1]
    add_to_recent_files(file_path)

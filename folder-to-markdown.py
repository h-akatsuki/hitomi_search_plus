import os
import argparse
from collections import defaultdict

# for claude project

skip_ext = ["g.dart", "freezed.dart"]
skip_folders = ["rust"]

def get_folder_size(folder_path):
    total_size = 0
    for dirpath, dirnames, filenames in os.walk(folder_path):
        for filename in filenames:
            filepath = os.path.join(dirpath, filename)
            total_size += os.path.getsize(filepath)
    return total_size

def folder_to_markdown(folder_path, output_file, exclude_folders, show_size):
    total_size = get_folder_size(folder_path) if show_size else 0
    file_sizes = defaultdict(list)
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write(f"# {os.path.basename(folder_path)}\n\n")
        process_folder(folder_path, f, 0, exclude_folders, show_size, total_size, file_sizes)
    
    if show_size:
        print_sorted_sizes(file_sizes, total_size)

def process_folder(folder_path, file, level, exclude_folders, show_size, total_size, file_sizes):
    for item in sorted(os.listdir(folder_path)):
        item_path = os.path.join(folder_path, item)
        if os.path.isdir(item_path):
            if item in skip_folders:
                continue
            if item not in exclude_folders:
                file.write(f"\n{'#' * (level + 2)} {item}\n")
                process_folder(item_path, file, level + 1, exclude_folders, show_size, total_size, file_sizes)
        else:
            if item_path.endswith(tuple(skip_ext)):
                continue
            file.write(f"\n```{item}\n")
            try:
                with open(item_path, 'r', encoding='utf-8') as content_file:
                    content = content_file.read()
                    file.write(content)
                    if show_size:
                        file_size = os.path.getsize(item_path)
                        file_sizes[file_size].append(item_path)
            except UnicodeDecodeError:
                file.write(f"Unable to read file: {item}. It may be a binary file.\n")
            file.write("\n```\n")

def print_sorted_sizes(file_sizes, total_size):
    sorted_sizes = sorted(file_sizes.items(), key=lambda x: x[0], reverse=True)
    max_path_length = max(len(os.path.relpath(path, start='.')) for paths in file_sizes.values() for path in paths)
    max_size_length = len(str(max(file_sizes.keys())))
    
    print("\nFile sizes sorted from largest to smallest:")
    print(f"{'File':<{max_path_length}} {'Size':>{max_size_length}} {'Percentage':>10}")
    print("-" * (max_path_length + max_size_length + 11))
    
    for size, paths in sorted_sizes:
        for path in paths:
            relative_path = os.path.relpath(path, start='.')
            percentage = (size / total_size) * 100
            print(f"{relative_path:<{max_path_length}} {size:>{max_size_length},} {percentage:>10.2f}%")

def main():
    parser = argparse.ArgumentParser(
        description="Convert a folder structure to a single Markdown file.")
    parser.add_argument("folder_path", help="Path to the folder to convert")
    parser.add_argument("output_file", help="Path to the output Markdown file")
    parser.add_argument("--exclude", nargs='*', default=[],
                        help="List of folder names to exclude")
    parser.add_argument("--show-size", action="store_true",
                        help="Show sorted file sizes and percentages")
    args = parser.parse_args()

    folder_to_markdown(args.folder_path, args.output_file, args.exclude, args.show_size)
    print(f"Conversion complete. Output saved to {args.output_file}")

if __name__ == "__main__":
    main()
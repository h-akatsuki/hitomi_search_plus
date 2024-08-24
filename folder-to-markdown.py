import os
import argparse

# for claude project

skip_ext = ["g.dart", "freezed.dart"]


def folder_to_markdown(folder_path, output_file, exclude_folders):
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write(f"# {os.path.basename(folder_path)}\n\n")
        process_folder(folder_path, f, 0, exclude_folders)


def process_folder(folder_path, file, level, exclude_folders):
    for item in sorted(os.listdir(folder_path)):
        item_path = os.path.join(folder_path, item)
        if os.path.isdir(item_path):
            if item not in exclude_folders:
                file.write(f"\n{'#' * (level + 2)} {item}\n")
                process_folder(item_path, file, level + 1, exclude_folders)
        else:
            if item_path.endswith(tuple(skip_ext)):
                continue
            file.write(f"\n```{item}\n")
            try:
                with open(item_path, 'r', encoding='utf-8') as content_file:
                    file.write(content_file.read())
            except UnicodeDecodeError:
                file.write(f"Unable to read file: {
                           item}. It may be a binary file.\n")
            file.write("\n```\n")


def main():
    parser = argparse.ArgumentParser(
        description="Convert a folder structure to a single Markdown file.")
    parser.add_argument("folder_path", help="Path to the folder to convert")
    parser.add_argument("output_file", help="Path to the output Markdown file")
    parser.add_argument("--exclude", nargs='*', default=[],
                        help="List of folder names to exclude")
    args = parser.parse_args()

    folder_to_markdown(args.folder_path, args.output_file, args.exclude)
    print(f"Conversion complete. Output saved to {args.output_file}")


if __name__ == "__main__":
    main()

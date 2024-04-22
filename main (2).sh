
if [ "$#" -lt 1 ] || [ "$#" -gt 2 ]; then
    echo "Usage: $0 <input_directory> [<output_directory>]"
    exit 1
fi

input_dir="$1"
output_dir="$2"

if [ "$#" -eq 1 ]; then
    output_dir="$input_dir"
fi


if [ ! -d "$input_dir" ]; then
    echo "Input directory does not exist: $input_dir"
    exit 1
fi

# Создаем выходную директорию, если она не существует
mkdir -p "$output_dir" || { echo "Failed to create output directory: $output_dir"; exit 1; }

# Копируем файлы из входной в выходную 
cp -rn "$input_dir"/* "$output_dir" || { echo "Failed to copy files from $input_dir to $output_dir"; exit 1; }

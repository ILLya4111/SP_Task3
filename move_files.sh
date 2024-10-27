#!/bin/bash

# Вказуємо цільову директорію
TARGET_DIR="./my_directory"

# Проходимося по вмісту цільової директорії
for item in "$TARGET_DIR"/*; do
  if [ -d "$item" ]; then
    # Якщо це директорія
    dirname=$(basename "$item")
    echo "$dirname є директорією."
  elif [ -f "$item" ]; then
    # Якщо це файл
    filename=$(basename "$item")
    new_dir="${filename}_dir"
    
    # Створюємо нову директорію та переміщуємо файл
    mkdir -p "$TARGET_DIR/$new_dir"
    mv "$item" "$TARGET_DIR/$new_dir"
    
    echo "$filename переміщений до $new_dir."
  fi
done

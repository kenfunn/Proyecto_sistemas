NOTAS_DIR="notas_dir"

mkdir -p "$NOTAS_DIR"

chmod 755 "$NOTAS_DIR"

crear_nota() {
    echo "Ingrese el título de la nota:"
    read titulo
    touch "$NOTAS_DIR/$titulo.txt"
    echo "Ingrese el contenido de la nota:"
    read contenido
    echo "$contenido" > "$NOTAS_DIR/$titulo.txt"
    echo "Nota '$titulo' creada."
    chmod 644 "$NOTAS_DIR/$titulo.txt"
}

listar_notas() {
    echo "Notas existentes:"
    ls -l "$NOTAS_DIR"
}

leer_nota() {
    echo "Ingrese el título de la nota a leer:"
    read titulo
    cat "$NOTAS_DIR/$titulo.txt"
}

ordenar_notas() {
    echo "Notas ordenadas por nombre:"
    ls "$NOTAS_DIR" | sort
}

codificar_nota() {
    echo "Ingrese el título de la nota a codificar:"
    read titulo
    base64 "$NOTAS_DIR/$titulo.txt" > "$NOTAS_DIR/$titulo.txt.b64"
    echo "Nota '$titulo' codificada."
}

decodificar_nota() {
    echo "Ingrese el título de la nota a decodificar:"
    read titulo
    base64 -d "$NOTAS_DIR/$titulo.txt.b64" > "$NOTAS_DIR/$titulo.txt"
    echo "Nota '$titulo' decodificada."
}

tipo_archivo() {
    echo "Ingrese el título de la nota para ver su tipo:"
    read titulo
    file "$NOTAS_DIR/$titulo.txt"
}

while true; do
    echo "Seleccione una opción:"
    echo "1. Crear una nota"
    echo "2. Listar notas"
    echo "3. Leer una nota"
    echo "4. Ordenar notas"
    echo "5. Codificar una nota"
    echo "6. Decodificar una nota"
    echo "7. Ver tipo de archivo"
    echo "8. Salir"
    read opcion
    case $opcion in
        1) crear_nota ;;
        2) listar_notas ;;
        3) leer_nota ;;
        4) ordenar_notas ;;
        5) codificar_nota ;;
        6) decodificar_nota ;;
        7) tipo_archivo ;;
        8) exit ;;
        *) echo "Opción no válida." ;;
    esac
done

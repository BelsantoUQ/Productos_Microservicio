# Usa una imagen base de Python
FROM python:3.9

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Instala las dependencias del proyecto
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copia los archivos del proyecto
COPY . .

# Instala el cliente de MySQL
RUN apt-get update && apt-get install -y default-mysql-client

# Expone el puerto
EXPOSE 8000

# Comando para iniciar la aplicación
CMD ["sh", "-c", "python main.py"]

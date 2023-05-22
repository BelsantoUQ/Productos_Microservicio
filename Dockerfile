# Establecer la imagen base de Python
FROM python:3.9

# Copiar los archivos de tu proyecto al contenedor
COPY . /app

# Instalar las dependencias del proyecto
RUN pip install --no-cache-dir -r requirements.txt

# Exponer el puerto 8000 (o el que estés usando en tu aplicación)
EXPOSE 8000

# Iniciar tu aplicación cuando se ejecute el contenedor
CMD ["python", "main.py"]

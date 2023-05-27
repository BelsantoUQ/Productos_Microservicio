# Utiliza la imagen base de Python
FROM tiangolo/uvicorn-gunicorn-fastapi:python3.9

# Instala las dependencias
RUN pip install mysql-connector-python
RUN pip install pyjwt
RUN pip install requests

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /usr/app/src

# Copia el código fuente de la aplicación
COPY . ./

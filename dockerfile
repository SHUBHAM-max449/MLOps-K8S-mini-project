# use a lighweight base image
FROM python:3.9-slim

# set environment variables to prevent python from writing .pyc files and buffer output
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

#set the working dir inside the container
WORKDIR /app

# copy only required files
COPY requirements.txt /app/
COPY app.py /app/
COPY templates /app/templates
COPY static /app/static

#install python dependencies 
RUN pip install --no-cache-dir -r requirements.txt

# Expose port for the app to run
EXPOSE 8000

# Run the application command
CMD  ["python","app.py"]


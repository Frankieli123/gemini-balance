FROM python:3.10-slim

WORKDIR /app

# 复制所需文件到容器中
COPY ./requirements.txt /app
COPY ./VERSION /app

RUN pip install --no-cache-dir -r requirements.txt
COPY ./app /app/app
ENV API_KEYS='["AIzaSyCAUQZz0Jmhwbrov0luVy9IMRBKaNn273A"]'
ENV ALLOWED_TOKENS='["a3865373"]'
ENV TZ='Asia/Shanghai'

# Expose port
EXPOSE 8000

# Run the application
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000", "--no-access-log"]

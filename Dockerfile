FROM eclipse-temurin:21-jre-jammy

# Создаем пользователя, чтобы не запускать приложение от root (это требование ИБ)
RUN useradd -m appuser
USER appuser

# Копируем собранный JAR-файл в образ
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar

# Команда для запуска
ENTRYPOINT ["java","-jar","/app.jar"]
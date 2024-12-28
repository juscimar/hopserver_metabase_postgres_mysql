# Imagem base para Apache Hop
FROM apache/hop-web:latest 


# Definir diretório de trabalho
WORKDIR /files


# Copiar drivers bancos para pasta do hop
COPY ./utils/mysql-connector-j-8.4.0.jar /usr/local/tomcat/lib/


# # Expor a porta usada pelo Apache Hop
# EXPOSE 8080


# # Comando padrão para iniciar o servidor Apache Hop
# CMD ["catalina.sh", "run"]


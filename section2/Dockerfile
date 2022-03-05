FROM postgres
ENV POSTGRES_PASSWORD mysecretpassword
ENV POSTGRES_DB car_db
COPY create_table.sql /docker-entrypoint-initdb.d/
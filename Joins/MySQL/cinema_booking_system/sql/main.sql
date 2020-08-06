
-- Load schemas

-- source /docker-entrypoint-initdb.d/schema/schema.sql

source /docker-entrypoint-initdb.d/schema/films_schema.sql
source /docker-entrypoint-initdb.d/schema/customers_schema.sql
source /docker-entrypoint-initdb.d/schema/rooms_schema.sql
source /docker-entrypoint-initdb.d/schema/screenings_schema.sql
source /docker-entrypoint-initdb.d/schema/seats_schema.sql
source /docker-entrypoint-initdb.d/schema/bookings_schema.sql
source /docker-entrypoint-initdb.d/schema/reserved_seat_schema.sql

-- Load data

source /docker-entrypoint-initdb.d/data/films_data.sql
source /docker-entrypoint-initdb.d/data/customers_data.sql
source /docker-entrypoint-initdb.d/data/rooms_data.sql
source /docker-entrypoint-initdb.d/data/screenings_data.sql
source /docker-entrypoint-initdb.d/data/seats_data.sql
source /docker-entrypoint-initdb.d/data/bookings_data.sql
source /docker-entrypoint-initdb.d/data/reserved_seat_data.sql


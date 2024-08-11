-- Set the root password
ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASS}';

-- Create the database
CREATE DATABASE IF NOT EXISTS ${DB_NAME};

-- Create a new user and grant privileges
CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_USER_PASS}';
GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%';
FLUSH PRIVILEGES;


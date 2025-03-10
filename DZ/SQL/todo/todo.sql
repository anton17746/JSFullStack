
CREATE TYPE status AS ENUM ('new', 'working', 'completed');
CREATE TABLE users (
id SERIAL PRIMARY KEY,
fio VARCHAR(24) NOT NULL,
login VARCHAR(24) NOT NULL UNIQUE, 
email varchar(255) NOT NULL UNIQUE, 
CONSTRAINT email_check CHECK(email ~* '^[A-Za-z0-9._+%-]+@[A-Za-z0-9.-]+[.][A-Za-z]+$') 
);
CREATE TABLE todos (
id SERIAL PRIMARY KEY,
ctreated timestamp NOT NULL,
deadline timestamp,
overdue boolean DEFAULT 'false',
status status DEFAULT 'new',
text text,
userId INTEGER NOT NULL,
FOREIGN KEY (userId) REFERENCES users (id)
);


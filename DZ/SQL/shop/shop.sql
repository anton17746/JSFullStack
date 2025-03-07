CREATE TYPE status_order AS ENUM ('new', 'working', 'completed');
CREATE TABLE users (
id SERIAL PRIMARY KEY,
fio VARCHAR(24) NOT NULL,
login VARCHAR(24) NOT NULL UNIQUE, 
email varchar(255) NOT NULL UNIQUE,
CONSTRAINT email_check CHECK(email ~* '^[A-Za-z0-9._+%-]+@[A-Za-z0-9.-]+[.][A-Za-z]+$') 
);
CREATE TABLE goods (
id SERIAL PRIMARY KEY,
Title varchar(255) NOT NULL,
description text,
links_img text[],
price NUMERIC(4,2)
);

CREATE TABLE orders (
id SERIAL PRIMARY KEY,
created timestamp NOT NULL,
status status_order DEFAULT 'new',
address_delivery text,
comment_text text,
userId INTEGER NOT NULL REFERENCES users (id)
);
CREATE TABLE baskets (
productsId INTEGER NOT NULL REFERENCES goods (id),
userId INTEGER NOT NULL REFERENCES users (id),
orderId INTEGER NOT NULL REFERENCES orders (id),
CONSTRAINT PK_basket PRIMARY KEY(userId, orderId)
);

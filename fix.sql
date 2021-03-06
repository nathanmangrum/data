--copy entire file (works whether first build or not)
CREATE EXTENSION IF NOT EXISTS pgcrypto;

DROP TABLE IF EXISTS products;

CREATE TABLE products (
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  lookupcode character varying(32) NOT NULL DEFAULT(''),
  count int NOT NULL DEFAULT(0),
  created_at timestamp without time zone NOT NULL DEFAULT now(),
  updated_at timestamp without time zone NOT NULL DEFAULT now(),
  CONSTRAINT product_pkey PRIMARY KEY (id)
) WITH (
  OIDS=FALSE
);

CREATE INDEX ix_product_lookupcode
  ON products
  USING btree
  (lower(lookupcode::text) COLLATE pg_catalog."default");

DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  first_name character varying(10) NOT NULL DEFAULT(''),
  last_name character varying(10) NOT NULL DEFAULT(''),
  employee_id int NOT NULL UNIQUE DEFAULT(1),
  active boolean NOT NULL,
  role character varying(32) NOT NULL CHECK (role in ('general manager','shift manager','cashier')),
  manager_id uuid,
  password character varying(255) NOT NULL,
  created_at timestamp without time zone NOT NULL DEFAULT now(),
  updated_at timestamp without time zone NOT NULL DEFAULT now(),
  CONSTRAINT employee_pkey PRIMARY KEY (id),
  FOREIGN KEY (manager_id) REFERENCES employees (id)
) WITH (
  OIDS=FALSE
);

INSERT INTO employees (first_name, last_name, employee_id, active, role, manager_id, password) VALUES (
  'User',
  'Name',
  1,
  '1',
  'general manager',
  NULL,
  '$2a$10$twGUUsy2uSVQqWyJNZ4dDeYu4F.HOfw4YC4YddiMuywS8i8p/PNYW')
RETURNING id, created_at;

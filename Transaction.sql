CREATE EXTENSION IF NOT EXISTS pgcrypto;
CREATE TABLE transactions (
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  employee_id uuid NOT NULL,
  amount int NOT NULL,
  type boolean NOT NULL,
  ref_id uuid,
  receipt_id int NOT NULL UNIQUE,
  created_at timestamp without time zone NOT NULL DEFAULT now(),
  updated_at timestamp without time zone NOT NULL DEFAULT now(),
  FOREIGN KEY (employee_id) REFERENCES employees (id),
  CONSTRAINT transaction_pkey PRIMARY KEY (id),
  CONSTRAINT if_return_ref_id_not_null CHECK ((NOT type) OR (ref_id IS NOT NULL))
) WITH (
  OIDS=FALSE
);

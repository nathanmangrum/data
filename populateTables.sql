INSERT INTO products (lookupcode, count) VALUES (
  'lookupcode1',
  100)
RETURNING id, created_at;

INSERT INTO products (lookupcode, count) VALUES (
  'lookupcode2',
  125)
RETURNING id, created_at;

INSERT INTO products (lookupcode, count) VALUES (
  'lookupcode3',
  150)
RETURNING id, created_at;

INSERT INTO employees (first_name, last_name, employee_id, active, role, manager_id, password) VALUES (
  'Jared',
  'Ramirez',
  1,
  '1',
  'general manager',
  NULL,
  'jramirez')
RETURNING id, created_at;

INSERT INTO employees (first_name, last_name, employee_id, active, role, manager_id, password) VALUES (
  'Ben',
  'Clarke',
  2,
  '1',
  'shift manager',
  (SELECT id FROM employees WHERE employee_id = 1),
  'bclarke')
RETURNING id, created_at;

INSERT INTO employees (first_name, last_name, employee_id, active, role, manager_id, password) VALUES (
  'Carlos',
  'Interiano',
  3,
  '1',
  'cashier',
  (SELECT id FROM employees WHERE employee_id = 2),
  'cinteriano')
RETURNING id, created_at;

INSERT INTO employees (first_name, last_name, employee_id, active, role, manager_id, password) VALUES (
  'John',
  'Mangrum',
  4,
  '1',
  'cashier',
  (SELECT id FROM employees WHERE employee_id = 2),
  'jmangrum')
RETURNING id, created_at;

INSERT INTO employees (first_name, last_name, employee_id, active, role, manager_id, password) VALUES (
  'Andrew',
  'Foster',
  5,
  '1',
  'cashier',
  (SELECT id FROM employees WHERE employee_id = 1),
  'afoster')
RETURNING id, created_at;

INSERT INTO employees (first_name, last_name, employee_id, active, role, manager_id, password) VALUES (
  'Brendan',
  'Mitchell',
  6,
  '1',
  'cashier',
  (SELECT id FROM employees WHERE employee_id = 1),
  'bmitchell')
RETURNING id, created_at;

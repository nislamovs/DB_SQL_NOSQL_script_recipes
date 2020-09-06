-- Create sequences

CREATE SEQUENCE IF NOT EXISTS test_sequence
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 10000
NO CYCLE

-- show all sequences

SELECT c.relname FROM pg_class c WHERE c.relkind = 'S';

-- changing sequence value

SELECT nextval('test_sequence');

SELECT currval('test_sequence');

SELECT lastval();

-- set value but next value will increment
SELECT setval('test_sequence',14);
SELECT nextval('test_sequence');

-- set value and next value will be what you set
SELECT setval('test_sequence',25,false);
SELECT nextval('test_sequence');


-- attaching sequence to table column
ALTER TABLE orders
ALTER COLUMN orderid SET DEFAULT nextval('orders_orderid_seq');


-- sequence alterations

ALTER SEQUENCE orders_orderid_seq RESTART WITH 200000
SELECT nextval('orders_orderid_seq')

ALTER SEQUENCE test_sequence RENAME TO test_sequence_1

DROP SEQUENCE test_sequence_1


CREATE TABLE IF NOT EXISTS sales(
    id SERIAL,
    sales_employee VARCHAR(50) NOT NULL,
    fiscal_year INT NOT NULL,
    sale DECIMAL(14,2) NOT NULL,
    PRIMARY KEY(id)
);

INSERT INTO sales(sales_employee,fiscal_year,sale)
VALUES('Bob',2016,100),
      ('Bob',2017,150),
      ('Bob',2018,200),
      ('Alice',2016,150),
      ('Alice',2017,100),
      ('Alice',2018,200),
      ('John',2016,200),
      ('John',2017,150),
      ('John',2018,250);



select * from sales
intersect
select * from sales where id < 5

/* Result


id	sales_employee	fiscal_year	sale
2	Bob	2017	150.00
4	Alice	2016	150.00
3	Bob	2018	200.00
1	Bob	2016	100.00

*/

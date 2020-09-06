--(Tested on Postgres https://www.db-fiddle.com/)
--Except

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




(select * from sales)
except
(select * from sales where id between 2 and 5)
order by id desc

-- same as:

select * from sales where id < 2 or id > 5
order by id desc

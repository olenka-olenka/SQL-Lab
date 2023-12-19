-- Завдання 5.1: Показати список всіх керівників.
-- Деталі: Отримати інформацію з таблиці employee про співробітників, які працюють на керівних посадах ('CEO', 'Manager’).
-- Перейменуйте заголовок таблиці на Менеджери 
-- Перейменуйте  заголовки стовпців таблиці
-- employee_id   “Manager ID”	
 -- last_name "Manager Last Name",
-- first_name 'Manager First Name’,
-- position ‘Manager Title’,
-- employment_date AS 'Manager Hire Date’ 
SELECT 
	employee_id "Manager ID",
	last_name "Manager Last Name", 
    first_name 'Manager First Name', 
    position 'Manager Title',
	employment_date AS 'Manager Hire Date'
FROM 
	employee AS Managers
WHERE 
	position IN ('CEO', 'Manager');
    
-- Завдання 5.2: Показати список всіх працівників та їх керівників.
-- Деталі: Отримати інформацію з таблиці employee про співробітників та їхніх керівників.
-- Розширити попередній запит, перейменувавши заголовки таблиць Працівники, Менеджери 
-- Добапити в вибірку інформацію про працівників
-- employee_id   “Employee ID”	
-- last_name " Employee Last Name",
-- first_name ' Employee First Name’,
-- position ‘Employee Title’,
-- employment_date AS 'Hire Date’ 
SELECT 
	e.employee_id "Employee ID",
    e.last_name "Employee Last Name", 
    e.first_name 'Employee First Name', 
    e.position 'Employee Title',
    e.employment_date AS 'Employee Hire Date', 
    e.manager_id "Employee Manager ID", 
    m.employee_id "Manager ID",
    m.last_name "Manager Last Name", 
    m.first_name 'Manager First Name', 
    m.position 'Manager Title',
	m. employment_date AS 'Manager Hire Date'
FROM 
	employee AS e,
	employee AS m
WHERE
	e.manager_id = m.employee_id;
    
    
-- Завдання 5.3: Показати список всіх працівників та назви департаментів.
-- Деталі: Отримати інформацію з таблиць employee department про співробітників та відділи.
-- Змінити попередній запит, перейменувавши заголовки таблиць Працівники, Департамент
-- Добавити в вибірку інформацію про департаменти
-- employee_id   “Employee ID”	
-- last_name " Employee Last Name",
-- first_name ' Employee First Name’,
-- position ‘Employee Title’,
-- department_name AS ‘ Department Name’
SELECT 
	e.employee_id "Employee ID",
	e.last_name "Employee Last Name", 
    e.first_name 'Employee First Name', 
    e.position 'Employee Title', 
    e.department_id "Employee Department ID",
    d.department_id "Department ID", 
    d.department_name "Department name"
FROM 
	employee AS e,
	department AS d
WHERE
	e.department_id = d.department_id;
    
-- Завдання 5.4: Показати список працівників які здійснювали продажі.
-- Деталі: Отримати інформацію з таблиць employee,  invoice про співробітників та дату транзакції.
-- Змінити попередній запит, добавивши в вибірку інформацію про продажі
-- employee_id   “Employee ID”	
-- last_name " Employee Last Name",
-- first_name ' Employee First Name’,
-- position ‘Employee Title’,
-- Invoice_id AS ‘Invoice’ 
-- transaction_moment 'Transaction moment'

-- Solushuon 1
SELECT 
	e.employee_id "Employee ID",
	e.last_name "Employee Last Name", 
	e.first_name 'Employee First Name', 
	e.position 'Employee Title', 
	i.employee_id "Invoice Employee ID", 
	i.invoice_id 'Invoice',
	i. transaction_moment 'Transaction moment'
FROM
	employee AS e
JOIN
	invoice AS i
ON
	e.employee_id = i.employee_id
ORDER By
	i. transaction_moment;
    
-- Solushion 2
SELECT 
	e.employee_id "Employee ID",
	e.last_name "Employee Last Name", 
	e.first_name 'Employee First Name', 
	e.position 'Employee Title', 
	i.employee_id "Invoice Employee ID", 
	i.invoice_id 'Invoice',
	i. transaction_moment 'Transaction moment'
FROM 
	employee AS e
JOIN 
	invoice AS i
USING (employee_id)
ORDER By
	i. transaction_moment;
    
    
-- Завдання 5.5: Показати список працівників які здійснювали продажі.
-- Деталі: Отримати інформацію з таблиць employee,  invoice про співробітників та дату транзакції.
-- Змінити попередній запит, добавивши в вибірку інформацію про продажі
-- employee_id   “Employee ID”	
-- last_name " Employee Last Name",
-- first_name ' Employee First Name’,
-- position ‘Employee Title’,
-- Invoice_id AS ‘Invoice’ 
-- transaction_moment 'Transaction moment'
SELECT
	e.employee_id 'Employee ID',
	e.last_name 'Employee Last Name',
	e.first_name 'Employee First Name', 
	e.position 'Employee Title', 
	i.employee_id 'Invoice Employee ID', 
	i.invoice_id 'Invoice',
	i. transaction_moment 'Transaction moment'
FROM 
	employee AS e
NATURAL JOIN
	invoice AS i
ORDER By
	i. transaction_moment;
    
    
-- Завдання 5.6: Показати список працівників які здійснювали продажі та клієнтів.
-- Деталі: Отримати інформацію з таблиць employee,  invoice, customer про продажі.
-- Змінити попередній запит, добавивши в вибірку інформацію про клієнтів
-- customer _id   “Сustomer ID”	
-- last_name " Сustomer Last Name",
-- first_name ' Сustomer First Name’,
SELECT 
	e.employee_id "Employee ID",
	e.last_name "Employee Last Name", 
	e.first_name 'Employee First Name', 
	e.position 'Employee Title', 
	i.employee_id "Invoice Employee ID", 
	i.invoice_id 'Invoice',
	i.customer_id 'Invoice Customer ID',
	i. transaction_moment 'Transaction moment',
	c.customer_id 'Customer ID', 
	c.last_name 'Customer Last Name',
	c.first_name 'Customer First Name'
FROM 
	employee AS e
NATURAL JOIN
	invoice AS i
JOIN 
	customer AS c
USING (customer_id)
ORDER By
	i. transaction_moment;
    
    
-- Завдання 5.7: Показати список працівників які здійснювали продажі та клієнтів.
-- Деталі: Отримати інформацію з таблиць employee,  invoice, customer про продажі.
-- Змінити попередній запит, добавивши в вибірку інформацію про клієнтів
-- customer _id   “Сustomer ID”	
-- last_name " Сustomer Last Name",
-- first_name ' Сustomer First Name’,

SELECT 
	e.employee_id "Employee ID",
	e. last_name "Employee Last Name", 
	e.first_name 'Employee First Name', 
	e.position 'Employee Title', 
	i.employee_id "Invoice Employee ID", 
	i.invoice_id 'Invoice',
	i.customer_id 'Invoice Customer ID',
	i. transaction_moment 'Transaction moment', 
	c.customer_id 'Customer ID', 
	c.last_name 'Customer Last Name', 
	c.first_name 'Customer First Name'
FROM 
	employee AS e
NATURAL JOIN
	invoice AS i
LEFT JOIN
	customer AS c
USING (customer_id)
WHERE customer_id IS NULL
ORDER By
i.transaction_moment;


-- Завдання 5.8: Показати організаційну структуру компанії
-- Деталі: Отримати інформацію з таблиць employee, department.
-- Створити запит який містить розгорнуту інформацію про всіх працівників та департаменти.
SELECT
-- Employee as e
	e.employee_id 'Employee id', 
	e.last_name 'Employee Last Name', 
	e.first_name 'Employee First Name', 
	e.position 'Employee position', 
	e.manager_id 'Employee Manager Id',
	e.department_id 'Employee department_id',
-- Manager as m
	m. employee_id 'Manager ID',
	m. last_name 'Manager Last Name', 
	m.first_name 'Manager First Name', 
	m.position 'Manager position', 
	m.department_id 'Manager Department Id',
-- department 
	d.department_id 'Department ID', 
	d.department_name 'Department Name',
	d.city 'Department city'
FROM
	department as d
RIGHT JOIN
	employee as e
ON
	e.department_id = d.department_id
LEFT JOIN
	employee as m
ON e.manager_id = m.employee_id;


-- Завдання 5.9: Показати список працівників консультантів.
-- Деталі: Цей запит виводить список всіх співробітників, які можуть / не можуть консультувати.
SELECT
	employee_id,
	first_name,
	last_name, 
	position,
	'Consulting' as Responsibility
FROM 
	employee
WHERE 
	position LIKE '%Consultant%'
UNION
SELECT
	employee_id,
	first_name,
	last_name, 
	position,  'Not Consulting'
FROM 
	employee
WHERE 
	position NOT LIKE '*%Consultant%'
ORDER By last_name;


/*Завдання 1. Відобразити список усіх замовлених найменувань товарів разом з іменами та прізвищами клієнтів і моментом проведення транзакції по інвойсу. 
Будь ласка, відсортуйте дані за ідентифікатором замовлення Orders ID. Застосувати різні методи запитів з кількох таблиць. 
Перелік полів: (orders.orders_id AS 'Orders ID', product.product_name AS 'Product name',product.category AS 'Product category',
invoice.invoice_id AS 'Invoice ID',invoice.transaction_moment AS 'Transaction moment',customer.last_name AS 'Customer last name',
customer.first_name AS 'Customer first name’)*/
-- Solution 1
SELECT 
    orders.orders_id AS 'Orders ID',
    product.product_name AS 'Product name',
    product.category AS 'Product category',
    invoice.invoice_id AS 'Invoice ID',
    invoice.transaction_moment AS 'Transaction moment',
    customer.last_name AS 'Customer last name',
    customer.first_name AS 'Customer first name'
FROM
    orders
NATURAL JOIN 
	product 
    -- ON orders.product_id = product.product_id
NATURAL JOIN 
	invoice 
	-- ON orders.invoice_id = invoice.invoice_id
NATURAL JOIN 
	customer 
	-- ON invoice.customer_id = customer.customer_id
ORDER BY
    orders.orders_id;
    
-- Solution 2
SELECT 
    orders.orders_id AS 'Orders ID',
    product.product_name AS 'Product name',
    product.category AS 'Product category',
    invoice.invoice_id AS 'Invoice ID',
    invoice.transaction_moment AS 'Transaction moment',
    customer.last_name AS 'Customer last name',
    customer.first_name AS 'Customer first name'
FROM
    orders
JOIN 
	product 
    ON orders.product_id = product.product_id
JOIN 
	invoice 
	ON orders.invoice_id = invoice.invoice_id
JOIN 
	customer 
	ON invoice.customer_id = customer.customer_id
ORDER BY
    orders.orders_id;



/*Завдання 2. Відобразити імена співробітників, які працюють у відділі "Меркурій", і список всіх товарів, замовлених з '2023-07-01' по '2023-10-01’. 
Будь ласка, відсортуйте дані за ідентифікатором замовлення Orders ID. Перелік полів: (orders.orders_id AS 'Orders ID', product.product_name AS 'Product name',
product.category AS 'Product category',invoice.invoice_id AS 'Invoice ID',invoice.transaction_moment AS 'Transaction moment',
customer.last_name AS 'Customer last name',customer.first_name AS 'Customer first name’)*/
SELECT
    orders.orders_id AS 'Orders ID',
    product.product_name AS 'Product name',
    product.category AS 'Product category',
    invoice.invoice_id AS 'Invoice ID',
    invoice.transaction_moment AS 'Transaction moment',
    customer.last_name AS 'Customer last name',
    customer.first_name AS 'Customer first name',
    employee.first_name AS 'Employee first name',
    employee.last_name AS 'Employee last name'
FROM
    department
JOIN 
    employee 
    ON department.department_id = employee.department_id
JOIN 
    invoice 
    ON employee.employee_id = invoice.employee_id
JOIN 
    customer 
    ON invoice.customer_id = customer.customer_id
JOIN 
    orders 
    ON invoice.invoice_id = orders.invoice_id
JOIN 
    product 
    ON orders.product_id = product.product_id
WHERE
    department.department_name = 'Mercury'
    AND 
    transaction_moment BETWEEN '2023-07-01' AND '2023-10-01'
ORDER BY
    orders.orders_id;



/*Завдання 3. Показати імена та прізвища всіх клієнтів з таблиці клієнтів, а також клієнтів без замовлень і замовлень без клієнтів (якщо такі є). 
Будь ласка, відсортуйте дані за ID інвойсу.Перелік полів: (c.customer_id AS 'Customer ID', c.last_name AS 'Last Name',    
c.first_name AS 'First Name', i.invoice_id AS 'Invoice ID', i.transaction_moment AS 'Transaction Moment')*/
SELECT
    c.customer_id AS 'Customer ID',
    c.last_name AS 'Last Name',
    c.first_name AS 'First Name',
    i.invoice_id AS 'Invoice ID',
    i.transaction_moment AS 'Transaction Moment'
FROM
    customer c
LEFT JOIN
    invoice i
ON
	i.customer_id = c.customer_id
WHERE
	i.customer_id IS NULL
UNION 
SELECT
    c.customer_id AS 'Customer ID',
    c.last_name AS 'Last Name',
    c.first_name AS 'First Name',
    i.invoice_id AS 'Invoice ID',
    i.transaction_moment AS 'Transaction Moment'
FROM
	customer c
RIGHT JOIN
	invoice i
ON
	i.customer_id = c.customer_id
WHERE
	i.customer_id IS NULL;
-- ORDER BY i.invoice_id;


    
SELECT
    orders.orders_id AS 'Orders ID',
    product.product_name AS 'Product name',
    product.category AS 'Product category',
    invoice.invoice_id AS 'Invoice ID',
    invoice.transaction_moment AS 'Transaction moment',
    customer.last_name AS 'Customer last name',
    customer.first_name AS 'Customer first name',
    employee.first_name AS 'Employee first name',
    employee.last_name AS 'Employee last name'
FROM
    department
JOIN 
    employee 
    ON department.department_id = employee.department_id
JOIN 
    invoice 
    ON employee.employee_id = invoice.employee_id
LEFT JOIN 
    customer 
    ON invoice.customer_id = customer.customer_id
JOIN 
    orders 
    ON invoice.invoice_id = orders.invoice_id
JOIN 
    product 
    ON orders.product_id = product.product_id

WHERE 
	invoice.customer_id IS NULL 
   AND 
    department.department_name = 'Mercury'
    AND 
    transaction_moment BETWEEN '2021-07-01' AND '2023-10-01'
UNION
SELECT
    orders.orders_id AS 'Orders ID',
    product.product_name AS 'Product name',
    product.category AS 'Product category',
    invoice.invoice_id AS 'Invoice ID',
    invoice.transaction_moment AS 'Transaction moment',
    customer.last_name AS 'Customer last name',
    customer.first_name AS 'Customer first name',
    employee.first_name AS 'Employee first name',
    employee.last_name AS 'Employee last name'
FROM
    department
JOIN 
    employee 
    ON department.department_id = employee.department_id
JOIN 
    invoice 
    ON employee.employee_id = invoice.employee_id
RIGHT JOIN 
    customer 
    ON invoice.customer_id = customer.customer_id
JOIN 
    orders 
    ON invoice.invoice_id = orders.invoice_id
JOIN 
    product 
    ON orders.product_id = product.product_id
WHERE
    department.department_name = 'Mercury'
    AND 
    transaction_moment BETWEEN '2023-07-01' AND '2023-10-01'
ORDER BY
    'Orders ID';


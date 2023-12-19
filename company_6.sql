
/*Завдання 6.1: Вивести інформацію про ідентифікатор співробітника, повне ім’я та email співробітника .
Деталі: Отримати інформацію з таблиці employee про співробітників та згенерувати електронну пошту працівника.
Перелік полів:
Ідентифікатор повинен бути сформований з ідентифікатора працівника з додаванням "0" довжиною 5 символів;
 повне ім’я формується з прізвища та імені через пробіл;
Електронна пошта повинна мати формат: [ім'я].[прізвище]@company.com у нижньому регістрі.*/

SELECT
	LPAD(employee_id,5, '0') as 'Employee ID', 
	CONCAT_WS(" ",last_name, first_name) as 'Full name',
	-- CONCAT_WS (" ",last_name, first_name, position) as 'Full name with Position', 
	CONCAT (LOWER(first_name),".",LOWER(last_name),"@company.com" ) as 'email'
FROM 
	employee;


/*Завдання 6.2: Відобразити інформацію про працівника, дату його найму та стаж роботи.
Деталі: Отримати інформацію з таблиці employee про співробітників та  про стаж роботи кожного працівника.
Перелік полів:
Ім’я;
Прізвище;
Дата у форматі день, місяць, рік;
Тривалість роботи у форматі рік;
Стаж роботи у форматі рік.*/

SELECT
	first_name 'First name', 
	last_name 'Last name',
	DATE_FORMAT (employment_date, "%d %M %Y") AS 'Date of hiring',
	-- MySQL DATEDIFF() returns the number of days between two dates or datetimes.
	FORMAT (DATEDIFF(CURDATE(), employment_date)/365.22,1) 'Length of service',
	-- MySQL the TIMESTAMPDIFF() returns a value after subtracting a datetime expression from another.
	TIMESTAMPDIFF (YEAR, employment_date, CURDATE()) AS 'Years of service'
FROM 
	employee;


/*Завдання 6.3: Відобразити інформацію про зарплати та премії співробітників(два окремих звіти). 
Деталі: Отримати інформацію з таблиці employee: 
1) Визначити найвищу та найнижчу зарплату в компанії. 
2) Визначити середню премію для співробітників, які отримують премію. 
3) Визначити середнєзначення премії для всієї компанії.

Перелік полів:
Кількість працівників у компанії;
Кількість працівників, які отримали премію;
Найнижча зарплата;
Найвища зарплата;
Середній розмір премії за співробітником;
Середній розмір премії по компанії;*/

SELECT
	'Count of All employees'
	AS 'Bonus eligible',
	COUNT(*) 'Count of employees'
FROM 
	employee
UNION
SELECT
	'Count of employees who received bonus'
	AS 'Bonus eligible',
	COUNT(*) 'Count of employees'
FROM
	employee
WHERE
	bonus IS NOT NULL;


SELECT
	MIN(rate) 'Lowest salary',
	MAX(rate) 'Highest salary',
	FORMAT (AVG(bonus),2)
	AS 'Average Bonus by Employee', 
    FORMAT (SUM(bonus) / COUNT(*),2)
	AS 'Average Bonus by Company'
FROM employee;



/*Завдання 6.4: Відобразити інформацію про список посад співробітників за відділами та представництвами. 
Деталі: Отримати інформацію з таблиць department, employee : 
1) Визначити кількість відділів компанії. 
2) Визначити кількість міст, в яких компанія має представництва. 
3. Визначити кількість менеджерів, продавців і т.д. 
4. Показати кількість працівників у кожному відділі. 
5. З'ясувати, скільки менеджерів, продавців і т.д. є в кожному відділі.

Перелік полів:
Кількість офісів;
Кількість представництв міст
Кількість працівників за посадами;
Кількість працівників за відділами
Кількість співробітників за посадами;
Кількість працівників за посадами для кожного відділу.*/


SELECT
	COUNT(*) AS
	'Count of Offices',
	COUNT(DISTINCT city) AS
	'Count of representative offices of cities'
FROM department;


SELECT
	position As
	'Position',
	COUNT(*) AS
	'Count Employee by Position'
FROM employee
GROUP BY position;


SELECT
	department_id AS
	'Department id',
	COUNT(*) AS
	'Count of employees by Department'
FROM employee
GROUP BY department_id;


SELECT
	department_id As
	'Department id', 
    position As
	'Position',
	COUNT(*) AS
	'Count of employees by Position for each Departmenn'
FROM employee
GROUP BY department_id, position
ORDER BY COUNT(*) DESC;


/*Завдання 6.5: Відобразити інформацію про список посад співробітників за відділами та представництвами. 
Деталі: Відобразити інформацію про список посад співробітників відділу продажів по відділах. 
Перелік полів:
Кількість працівників за посадами;
Кількість працівників за відділами
Кількість співробітників за посадами;
Кількість працівників та продажів.*/

SELECT
	department_id,
	position,
	COUNT(*) AS 'Count Employee'
FROM
	employee
GROUP BY
	department_id, position
HAVING
	COUNT(*) > 1;
    
    
/*Завдання 6.5.1: Відобразити інформацію про список посад співробітників за відділами та представництвами. 
Деталі: Відобразити інформацію про список посад співробітників відділу продажів по відділах. 
Вивести назву відділів і посад, в яких працює лише один співробітник зі Львова.
Перелік полів:
Кількість працівників за посадами;
Кількість працівників за відділами
Кількість співробітників за посадами;
Кількість працівників та продажів.*/

SELECT
	d.department_name, 
    position,
	COUNT(*) 'Count Employee by Position'
FROM
	employee e
JOIN
	department d
ON
	e.department_id = d.department_id
WHERE
	city = 'LVIV'
GROUP BY
	position, d.department_id
HAVING
	COUNT(*) = 1
ORDER BY d.department_name;


/*Завдання 6.5.2: Відобразити інформацію про список посад співробітників за відділами та представництвами. 
Деталі: Відобразити інформацію про список посад співробітників відділу продажів по відділах. 
Вивести список відділів, співробітників та їх посад, які здійснили більше 10 продажів. 
Перелік полів:
Кількість працівників за посадами;
Кількість працівників за відділами
Кількість співробітників за посадами;
Кількість працівників та продажів.*/

SELECT
	d.department_name, 
	last_name,
	first_name,
	position,
	COUNT(invoice_id) 'Employee by Sales'
FROM
	department d
JOIN
	employee e
ON
	d.department_id = e.department_id
JOIN
	invoice i
ON 
	e.employee_id = i.employee_id
GROUP BY
	i.employee_id
HAVING
	COUNT(invoice_id) > 10
ORDER BY COUNT(invoice_id) DESC;



/*Домашнє завдання 1: Відобразити інформацію про товари (ідентифікатор товару, назву товару, категорію). 
Перелік полів: Ідентифікатор "Product ID" повинен формуватися з ідентифікатора співробітника з додаванням "0" довжиною 4 символи. 
Назва товару як "Назва товару" повинна містити назву виробника, не містити номер моделі (без крапки після "/" в полі product_name), 
формат: [виробник] :: [назва_продукту]. Категорія в полі "Категорія" повинна мати формат: [тип_продукту] - [категорія] у верхньому регістрі. 
Будь ласка, відсортуйте дані за виробником.*/

SELECT
    LPAD(product_id, 4, '0') AS 'Product ID',
    CONCAT(manufacture, ' :: ', SUBSTRING_INDEX(product_name, '/', 1)) AS 'Product Name',
    UPPER(CONCAT(product_type, ' - ', category)) AS 'Gategory'
FROM
    product
ORDER BY
    manufacture;



/*Домашнє завдання 2: Відобразити інформацію про пропродажі по місячно. 
Місяць "Month" повинен формуватися з місяця в якому здійснювалися транзакції з додаванням "0" довжиною 2 символи. 
Загальна виручка as 'Total revenue' повинна містити загальну суму продажей за кожен місяць. Квартал продажів as 'Sales Period' 
повинен містити порядковий номер кварталу в році і відповідний рік, формат: 'Quater ' [квартал] - [рік]. 
Будь ласка, відсортуйте дані за датою продажу.*/

SELECT
    LPAD(MONTH(order_datetime), 2, '0') AS 'Month',
    FORMAT(SUM(orders.quantity * product.price), 2) AS 'Total revenue',
    CONCAT('Quarter ', QUARTER(order_datetime), ' - ', YEAR(order_datetime)) AS 'Sales Period'
FROM
    orders 
JOIN
    product ON orders.product_id = product.product_id
GROUP BY
    LPAD(MONTH(order_datetime), 2, '0'), 'Sales Period'
ORDER BY
    order_datetime;


/*Домашнє завдання 3: Відображення аналітичної інформації про продажі. 
1) Відображення списку товарів, які принесли найбільший дохід (більше 50000). 
2) Відображення ТОП-10 покупців, які принесли найбільший дохід. Будь ласка, відсортуйте дані по спаданні суми.*/

-- 1
SELECT
    p.product_id,
    p.product_name,
    p.price AS 'Product Price',
    SUM(o.quantity) AS 'Product Quantity',
    FORMAT(SUM(o.quantity * p.price), 2) AS 'Total Amount'
FROM
    product p
JOIN
    orders o ON p.product_id = o.product_id
GROUP BY
    p.product_id, p.product_name, p.price
HAVING
    SUM(o.quantity * p.price) > 50000
ORDER BY
    SUM(o.quantity * p.price) DESC;


-- 2
SELECT
    c.customer_id AS 'Customer ID',
    MAX(c.last_name) AS 'Customer Last Name',
    MAX(c.first_name) AS 'Customer First Name',
    FORMAT(SUM(o.quantity * p.price), 2) AS 'Total Amount'
FROM
    customer c
JOIN
    invoice i ON c.customer_id = i.customer_id  
JOIN
    orders o ON i.invoice_id = o.invoice_id
JOIN
    product p ON o.product_id = p.product_id
GROUP BY
    c.customer_id
ORDER BY
    SUM(o.quantity * p.price) DESC
LIMIT 10;




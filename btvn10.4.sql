DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    salary DECIMAL(10,2),
    email VARCHAR(100) UNIQUE,
    phone_number VARCHAR(15)
);



CREATE TABLE salary_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    old_salary DECIMAL(10,2),
    new_salary DECIMAL(10,2),
    change_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (employee_id) REFERENCES employees(id)
);

INSERT INTO employees (first_name, last_name, salary, email, phone_number) VALUES
('Nguyen', 'An', 12000000, 'an@gmail.com', '0901111111'),
('Tran', 'Binh', 15000000, 'binh@gmail.com', '0902222222'),
('Le', 'Chi', 18000000, 'chi@gmail.com', '0903333333'),
('Pham', 'Dung', 9000000, 'dung@gmail.com', '0904444444'),
('Hoang', 'Em', 7000000, 'em@gmail.com', '0905555555'),
('Vu', 'Giang', 20000000, 'giang@gmail.com', '0906666666'),
('Do', 'Hanh', 11000000, 'hanh@gmail.com', '0907777777'),
('Bui', 'Khanh', 13000000, 'khanh@gmail.com', '0908888888'),
('Ngo', 'Lan', 9500000, 'lan@gmail.com', '0909999999'),
('Dinh', 'Minh', 17000000, 'minh@gmail.com', '0910000000');

DELIMITER $$

CREATE TRIGGER trg_after_update_salary
AFTER UPDATE ON employees
FOR EACH ROW
BEGIN
    INSERT INTO salary_log (employee_id, old_salary, new_salary)
    VALUES (OLD.id, OLD.salary, NEW.salary);
END $$

DELIMITER ;

UPDATE employees
SET salary = 19000000
WHERE id = 3;

SELECT * FROM salary_log;


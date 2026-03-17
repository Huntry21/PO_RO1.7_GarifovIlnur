CREATE DATABASE IF NOT EXISTS CarRent;
USE CarRent;

CREATE TABLE Branch (
    branch_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    address VARCHAR(150) NOT NULL,
    phone VARCHAR(20) UNIQUE
);

CREATE TABLE Employee (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    position VARCHAR(50) DEFAULT 'Sales Agent',
    branch_id INT NOT NULL,
    CONSTRAINT fk_employee_branch FOREIGN KEY (branch_id) REFERENCES Branch(branch_id)
);

CREATE TABLE Car (
    car_id INT PRIMARY KEY AUTO_INCREMENT,
    plate_number VARCHAR(20) NOT NULL UNIQUE,
    brand VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    year INT NOT NULL,
    status VARCHAR(20) DEFAULT 'available',
    branch_id INT NOT NULL,
    CONSTRAINT fk_car_branch FOREIGN KEY (branch_id) REFERENCES Branch(branch_id),
    CONSTRAINT chk_car_year CHECK (year >= 2000)
);

ALTER TABLE Employee ADD COLUMN monthly_salary_kzt DECIMAL(15, 2);
ALTER TABLE Employee ADD CONSTRAINT chk_salary_positive CHECK (monthly_salary_kzt > 0);
ALTER TABLE Car MODIFY COLUMN status VARCHAR(20) NOT NULL DEFAULT 'available';

INSERT INTO Branch (name, city, address, phone) VALUES
('Almaty Central', 'Almaty', 'Abay Ave 150', '+7-701-111-2233'),
('Astana Airport', 'Astana', 'Kabanbay Batyr Ave 10', '+7-702-222-3344'),
('Shymkent Plaza', 'Shymkent', 'Tauke Khan Ave 5', '+7-705-333-4455'),
('Atyrau Oil Port', 'Atyrau', 'Satpayev St 25', '+7-707-444-5566'),
('Aktau Caspian', 'Aktau', '12th Microdistrict', '+7-708-555-6677');

INSERT INTO Employee (first_name, last_name, email, position, branch_id, monthly_salary_kzt) VALUES
('Arman', 'Saparov', 'a.saparov@cars.kz', 'Manager', 1, 450000.00),
('Aigerim', 'Bolatova', 'a.bolatova@cars.kz', 'Senior Agent', 1, 320000.00),
('Bauyrzhan', 'Issayev', 'b.issayev@cars.kz', 'Agent', 2, 280000.00),
('Madina', 'Kairatova', 'm.kairatova@cars.kz', 'Consultant', 3, 250000.00),
('Daniyar', 'Asanov', 'd.asanov@cars.kz', 'Fleet Lead', 4, 380000.00);

INSERT INTO Car (plate_number, brand, model, year, status, branch_id) VALUES
('001AAA02', 'Toyota', 'Camry 75', 2023, 'available', 1),
('777AEF01', 'Mercedes-Benz', 'S-Class', 2024, 'rented', 2),
('123BBB13', 'Hyundai', 'Elantra', 2022, 'available', 3),
('456CCC06', 'Kia', 'K5', 2021, 'maintenance', 4),
('888ZZZ12', 'Chevrolet', 'Tahoe', 2024, 'available', 5);

SELECT * FROM Branch;
SELECT * FROM Employee;
SELECT * FROM Car;

SELECT 
    e.first_name, 
    e.last_name, 
    b.name AS branch_name, 
    e.monthly_salary_kzt 
FROM Employee e
JOIN Branch b ON e.branch_id = b.branch_id;

SELECT * FROM Branch;
SELECT * FROM Employee;
SELECT * FROM Car;
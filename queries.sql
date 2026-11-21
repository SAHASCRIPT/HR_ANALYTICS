-- 1. Employee count by department
SELECT Department, COUNT(*) AS employee_count
FROM employees GROUP BY Department
ORDER BY employee_count DESC;

-- 2. Average salary by department
SELECT Department, ROUND(AVG(Monthly_Salary), 2) AS avg_salary
FROM employees GROUP BY Department
ORDER BY avg_salary DESC;

-- 3. Attrition percentage by department
SELECT Department,
 ROUND(100.0 * SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_pct
FROM employees GROUP BY Department
ORDER BY attrition_pct DESC;

-- 4. Average experience by role
SELECT Job_Role, ROUND(AVG(Experience_Years), 1) AS avg_experience
FROM employees GROUP BY Job_Role;

-- 5. High performers
SELECT COUNT(*) AS high_performers
FROM employees WHERE Performance_Rating >= 4;

-- 6. Employees earning above company average
SELECT Employee_ID, Department, Monthly_Salary
FROM employees
WHERE Monthly_Salary > (SELECT AVG(Monthly_Salary) FROM employees)
ORDER BY Monthly_Salary DESC;

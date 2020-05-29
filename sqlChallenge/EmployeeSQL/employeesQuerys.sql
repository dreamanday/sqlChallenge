---List the following details of each employee: employee number, last name, first name, gender, and salary.

SELECT a.emp_no, a.last_name, a.first_name, a.gender, b.salary FROM employees AS A
LEFT JOIN salaries AS B ON a.emp_no = b.emp_no;

---List employees who were hired in 1986.

SELECT * FROM employees
WHERE hire_date LIKE ('1986%');

---List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.

SELECT a.dept_no,a.dept_name,b.emp_no,c.last_name,c.first_name,b.from_date,b.to_date FROM departments AS A
LEFT JOIN dept_manager AS B ON a.dept_no = b.dept_no
LEFT JOIN employees AS C ON b.emp_no = c.emp_no;

---List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT a.emp_no, a.last_name, a.first_name,c.dept_name FROM employees AS A
LEFT JOIN dept_emp AS B ON a.emp_no = b.emp_no
LEFT JOIN departments AS C ON b.dept_no = c.dept_no;

---List all employees whose first name is "Hercules" and last names begin with "B."

SELECT * FROM employees
WHERE first_name IN ('Hercules') AND last_name LIKE('B%');

---List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT a.emp_no, a.last_name, a.first_name,c.dept_name FROM employees AS A
LEFT JOIN dept_emp AS B ON a.emp_no = b.emp_no
LEFT JOIN departments AS C ON b.dept_no = c.dept_no
WHERE dept_name IN ('Sales');

---List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT a.emp_no, a.last_name, a.first_name,c.dept_name FROM employees AS A
LEFT JOIN dept_emp AS B ON a.emp_no = b.emp_no
LEFT JOIN departments AS C ON b.dept_no = c.dept_no
WHERE dept_name IN ('Sales','Development');

---In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name, COUNT(last_name) AS COUNT FROM employees
GROUP BY last_name
ORDER BY COUNT DESC;

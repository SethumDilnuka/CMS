
Complaint Management System (CMS) - JSP Project

This is a full-stack web application developed as a prototype for a Municipal IT Division's internal Complaint Management System (CMS). The project is built using Jakarta EE (Servlets, JSP) and follows a strict Model-View-Controller (MVC) architecture.

� Project Overview

The primary goal of this system is to provide a platform for internal employees to submit, track, and manage complaints. It features a role-based access system distinguishing between standard Employees and Admins, each with a distinct set of permissions and functionalities. All backend interactions are performed synchronously through standard HTML form submissions (GET/POST), without the use of AJAX or other asynchronous mechanisms.

 Role-Based Access Control
Employee Role:

Submit new complaints.
View a personal list of submitted complaints.
Edit or delete own complaints if not resolved.
Sign up for a new employee account.
Admin Role:

View all complaints in the system.
Update the status of any complaint and add official remarks.
Delete any complaint.
🔧 Key Features
User Authentication: Secure login and session management.
MVC Architecture: Separation of concerns (Servlets, DAO, Beans, JSP).
Database Connection Pooling: Using Apache Commons DBCP2.

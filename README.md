# Homework 1  
## Codebase Analysis and UML Diagram Generation  

**Deepak Singh (2020CS50422)**  
**Yosep Ro (2025ANZ8223)**  
*Indian Institute of Technology Delhi*  

---

## 📘 Overview  

This project performs **static and dynamic analysis** of an open-source Django application—**Notejam**—to understand its architectural structure and design patterns.  
Using a combination of **static analysis tools** (Pyreverse, Pydeps, Django-Extensions) and **dynamic tracing tools** (AppMap), we extract and visualize:  

- Class and package relationships (UML)  
- Module-level dependencies  
- Entity-relationship diagrams (ERD) for database models  
- Runtime call-flow (sequence) diagrams for key user actions  

The purpose of this homework is to gain hands-on familiarity with code-structure analysis, reverse engineering of software design, and UML visualization techniques.

---

## 🧩 Codebase  

- **Project:** Notejam (Django Implementation)  
- **Language:** Python 2.7  
- **Framework:** Django 1.6  
- **Repository:** [https://github.com/komarserjio/notejam](https://github.com/komarserjio/notejam)  

---

## ⚙️ Tools Used  

| Category | Tool | Purpose |
|-----------|------|----------|
| Static Analysis | **Pyreverse (Pylint)** | Generate class and package UML diagrams |
| Static Analysis | **Pydeps** | Visualize module import dependencies |
| Static Analysis | **Django-Extensions** | Generate ER diagram of Django ORM models |
| Dynamic Analysis | **AppMap (optional)** | Record runtime behavior and produce sequence diagrams |
| Visualization | **Graphviz** | Render `.dot` files to PNG/SVG |

---

## 🏗️ Environment Setup  

### 1. Prerequisites  
Ensure **Docker** is installed on your system.  
Download from: [https://www.docker.com/get-started](https://www.docker.com/get-started)

### 2. Build Docker Image  
Build a containerized Python 2.7 + Django 1.6 environment:

```bash
docker build -t notejam-dj16 .

### 3. Run Container
Run interactively and mount your current directory into /app:

```bash
docker run -it -p 8000:8000 -v .:/app notejam-dj16

🚀 Running the Application
Inside the container:

```bash
cd /app/notejam
./manage.py syncdb
./manage.py migrate
./manage.py runserver 0.0.0.0:8000

Then open http://127.0.0.1:8000

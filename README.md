# CQLSH Environment Setup Script

This script automates the safe, production-ready setup of a Python virtual environment for using `cqlsh` (Cassandra Query Language Shell) with Apache Cassandra.

It ensures proper installation of all dependencies without affecting the system Python environment.

---

## ✨ What does the script do?

- Updates system package repositories.
- Installs `python3`, `python3-venv`, and `python3-pip` if they are missing.
- Creates a virtual Python environment at `/opt/cqlsh-venv` (if it does not exist).
- Activates the virtual environment.
- Upgrades `pip` inside the virtual environment.
- Installs required Python packages inside the environment:
  - `six`
  - `cassandra-driver`
  - `cqlsh`
- Skips installation for already installed packages.
- Provides clear instructions on how to use `cqlsh`.

---

## 🚀 How to use

1. Save the script to a file:

    ```bash
    nano install-cqlsh-env.sh
    ```

2. Make it executable:

    ```bash
    chmod +x install-cqlsh-env.sh
    ```

3. Run the script:

    ```bash
    ./install-cqlsh-env.sh
    ```

---

## 🖥️ Example output

- Environment created at `/opt/cqlsh-venv`
- All necessary packages installed or verified
- Instructions to activate and use `cqlsh`

---

## 👉 How to start using `cqlsh`

After running the script, activate the virtual environment:

```bash
source /opt/cqlsh-venv/bin/activate
```

Then launch:

```bash
cqlsh
```

To exit the virtual environment:

```bash
deactivate
```

---

## 📋 Important notes

- This script **will not overwrite** an existing virtual environment at `/opt/cqlsh-venv`.
- Only missing Python packages are installed — no redundant installations.
- System-wide Python packages remain untouched.
- Safe for use on production servers.

---

## 🛡️ Why use a virtual environment?

Using a virtual environment ensures:
- No risk of breaking system packages.
- Isolated environment for managing CQLSH and Cassandra Python drivers.
- Easier upgrades and maintenance.

---

---

## 🛡️ Author

Inteliv - Automatyka Budynkowa

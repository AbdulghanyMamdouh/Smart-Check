<h1 align="center">🧪 Smart Check – Veterinary Labs Management App</h1>

<p align="center">
  A Flutter-based management system for poultry veterinary laboratories.  
  Supports multi-branch operations, role-based access, and secure authentication.  
</p>

---

## 📖 Overview

**Smart Check** is a complete management solution for **three veterinary lab branches**.  
It provides separate functionalities for **Admin** and **Doctor (Lab Employee)**, enabling smooth workflow, accurate case tracking, and secure access.

---

## 🚀 Features

### 👨‍⚕️ Doctor (Lab Employee)
- Add new **Examination Cases**.
- Continue incomplete cases.
- View **today’s submitted cases**.
- Search for cases by:
  - 📅 **Date**
  - 🆔 **Client Code**
- Automatic logout when the authentication token expires (**valid for one week**).

---

### 🧑‍💼 Admin
- Access and view all cases from **all 3 branches**.
- Search cases by:
  - 📅 Date
  - 🆔 Client Code
- Add new employees to the system.
- Centralized management and full visibility.

---

## 🛠️ Tech Stack & Tools

### 🎯 Core Technologies
- **Flutter 3.x**
- **Dart**
- **REST API Integration**
- **Dio** (with Interceptors for token handling)
- **BLoC (flutter_bloc)** – predictable state management
- **Clean Architecture + MVVM**
- **Repository Pattern**
- **Dependency Injection** 
- **Shared Preferences** – Persistent storage
- **ScreenUtil** – Responsive UI
- **Intl** – Date formatting

---

## 🔐 Authentication & Security

Smart Check uses a **JWT-based authentication** system:

- Each user receives a **token valid for 7 days**.
- Token creation time is stored locally.
- A custom **Dio Interceptor** checks for expiration on each request.
- If expired → automatic **logout + navigation to login screen**.

This ensures secure and stable session handling.

---

- **Clean Architecture**
- **MVVM**
- Separation of UI, business logic, and data layers
- Highly maintainable and scalable structure

---

## 📱 Platform Support
- ✔️ Android  
- ✔️ iOS  

---

## 📸 Screenshots & Demo

To view all application screens, demo videos, and UI previews, you can check the full Google Drive folder:

> 👉 **[Click here to open the Demo Folder](https://drive.google.com/drive/folders/1amaE7qo548no5szvAnGM2-eAohfOqI_h)**  
> Contains: Login, Home Screens, Case Management, Search, Admin Panel, Add Employee, and more.



## 🧱 App Architecture


---
# 🧾 Journal Entry App

A simple web application built with **Ruby on Rails (API)** and **React (Frontend)** to generate **monthly journal entries** for accounting based on CSV order data.
---

## **📌 Features**

- Import Orders from CSV 📂
- Generate Monthly Journal Entries 📊
- API Endpoint for Data Retrieval 🔗
- React UI for Viewing Data 🎨

---

## **🚀 Getting Started**

### **1️⃣ Clone the Repository**

```sh
cd blue_onion
```

---

## **📌 Backend Setup (Rails API)**

### **2️⃣ Install Dependencies**

```sh
bundle install
```

### **3️⃣ Setup the Database**

```sh
rails db:migrate
```

### **4️⃣ Import Data from CSV**

Move your CSV file into the `db/` folder and run:

```sh
rails import:orders
```

### **5️⃣ Start Rails Server**

```sh
rails server
```

Your API will be running at **`http://localhost:3000`** 🎉

---

## **💻 Frontend Setup (React)**

### **6️⃣ Move to the Frontend Folder**

```sh
cd front-end
```

### **7️⃣ Install Dependencies**

```sh
npm install
```

### **8️⃣ Start React App**

```sh
npm start
```

Your React app will be running at **`http://localhost:3001`** 🚀

---

## **🛠️ API Usage**

### **Get Monthly Journal Entries**

```sh
GET http://localhost:3000/journal_entries?month=2023-01
```

📌 **Response Example**

```json
{
  "month": "2023-01",
  "journal_entries": {
    "accounts_receivable": { "debit": 1200, "credit": 800 },
    "revenue": { "debit": 0, "credit": 900 },
    "shipping_revenue": { "debit": 0, "credit": 50 },
    "sales_tax_payable": { "debit": 0, "credit": 150 },
    "cash": { "debit": 800, "credit": 0 }
  }
}
```

---

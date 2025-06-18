# 🌱 E-Nursery - Online Plant & Garden Store

A comprehensive web-based nursery management system that allows customers to browse and purchase plants, seeds, pots, and pebbles online. The system includes both customer and admin interfaces with features like shopping cart, payment processing, and order management.

## 📋 Table of Contents

- [Features](#-features)
- [Technology Stack](#-technology-stack)
- [Project Structure](#-project-structure)
- [Prerequisites](#-prerequisites)
- [Installation](#-installation)
- [Database Setup](#-database-setup)
- [Running the Application](#-running-the-application)
- [Usage](#-usage)
- [API Endpoints](#-api-endpoints)
- [Contributing](#-contributing)
- [License](#-license)

## ✨ Features

### Customer Features
- **User Registration & Authentication**: Secure login and registration system
- **Product Browsing**: Browse plants, seeds, pots, and pebbles by categories
- **Shopping Cart**: Add items to cart and manage quantities
- **Payment Processing**: Multiple payment options (Cash and Online)
- **Order Tracking**: Track order status and history
- **Profile Management**: Update personal information and view order history
- **Feedback System**: Submit feedback and ratings
- **Query System**: Ask questions and receive responses

### Admin Features
- **Product Management**: Add, update, and delete products
- **Category Management**: Manage product categories
- **Order Management**: Process and track customer orders
- **Customer Management**: View and manage customer details
- **Query Management**: Respond to customer queries
- **Feedback Management**: View and manage customer feedback

### Product Categories
- **Plants**: Aquatic, Bamboo, Cactus, Flowers, and more
- **Seeds**: Vegetable seeds, Flower seeds, Herb seeds
- **Pots**: Colorful, Standard, Fiber Glass, Metal planters
- **Pebbles**: Various sizes and types for decoration

## 🛠 Technology Stack

### Backend
- **Java**: Core application logic
- **JSP (JavaServer Pages)**: Server-side web pages
- **MySQL**: Database management system
- **JDBC**: Database connectivity

### Frontend
- **HTML5**: Structure and content
- **CSS3**: Styling and responsive design
- **JavaScript**: Client-side interactivity
- **Bootstrap**: Responsive UI framework
- **jQuery**: JavaScript library for DOM manipulation

### Server & Tools
- **Apache Tomcat 8.5**: Web application server
- **Eclipse IDE**: Development environment
- **MySQL Workbench**: Database management

## 📁 Project Structure

```
E-Nursery/
├── Nursery/                          # Main project directory
│   ├── src/
│   │   └── main/
│   │       ├── java/                 # Java source files
│   │       │   ├── com/             # Main business logic
│   │       │   ├── conn/            # Database connection
│   │       │   ├── email/           # Email functionality
│   │       │   └── sms/             # SMS functionality
│   │       └── webapp/              # Web application files
│   │           ├── WEB-INF/         # Web configuration
│   │           ├── css/             # Stylesheets
│   │           ├── js/              # JavaScript files
│   │           ├── img/             # Images and assets
│   │           └── *.jsp            # JSP pages
│   ├── build/                       # Compiled files
│   └── .settings/                   # Eclipse settings
├── Servers/                         # Server configuration
│   └── Tomcat v8.5 Server/         # Tomcat server config
└── README.md                        # This file
```

## 🔧 Prerequisites

Before running this application, make sure you have the following installed:

- **Java JDK 8** or higher
- **Apache Tomcat 8.5** or higher
- **MySQL 5.7** or higher
- **Eclipse IDE** (recommended) or any Java IDE
- **MySQL Connector/J** (JDBC driver)

## 📦 Installation

### 1. Clone the Repository
```bash
git clone https://github.com/yourusername/E-Nursery.git
cd E-Nursery
```

### 2. Import Project in Eclipse
1. Open Eclipse IDE
2. Go to `File` → `Import` → `Existing Projects into Workspace`
3. Select the `Nursery` folder as the root directory
4. Click `Finish`

### 3. Configure Tomcat Server
1. In Eclipse, go to `Window` → `Preferences` → `Server` → `Runtime Environments`
2. Add Apache Tomcat v8.5 Server
3. Configure the server to point to your Tomcat installation directory

## 🗄 Database Setup

### 1. Create MySQL Database
```sql
CREATE DATABASE nursery;
USE nursery;
```

### 2. Import Database Schema
The database schema should include tables for:
- `customer` - Customer information
- `nursery_items` - Product catalog
- `orders` - Order details
- `cart` - Shopping cart items
- `feedback` - Customer feedback
- `queries` - Customer queries

### 3. Configure Database Connection
Update the database connection in `ConnectionProvider.java`:
```java
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/nursery","root","your_password");
```

## 🚀 Running the Application

### 1. Start MySQL Server
Make sure MySQL service is running on your system.

### 2. Deploy to Tomcat
1. Right-click on the `Nursery` project in Eclipse
2. Select `Run As` → `Run on Server`
3. Choose your configured Tomcat server
4. Click `Finish`

### 3. Access the Application
Open your web browser and navigate to:
```
http://localhost:8080/Nursery/
```

## 📖 Usage

### For Customers
1. **Register/Login**: Create an account or login with existing credentials
2. **Browse Products**: Navigate through different product categories
3. **Add to Cart**: Select products and add them to your shopping cart
4. **Checkout**: Review cart and proceed to payment
5. **Track Orders**: Monitor order status and delivery

### For Administrators
1. **Admin Login**: Access admin panel with admin credentials
2. **Manage Products**: Add, edit, or remove products from catalog
3. **Process Orders**: Update order status and manage deliveries
4. **Handle Queries**: Respond to customer questions and feedback

## 🔌 API Endpoints

The application uses JSP servlets for handling requests. Main endpoints include:

- `/index.jsp` - Home page
- `/custLogin.jsp` - Customer login
- `/adminLogin.jsp` - Admin login
- `/Register.jsp` - User registration
- `/ViewCart.jsp` - Shopping cart
- `/AdminHome.jsp` - Admin dashboard

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request


## 📞 Support

If you encounter any issues or have questions:
- Create an issue in the GitHub repository
- Contact the development team
- Check the documentation for troubleshooting guides

---

**Note**: This is a web-based nursery management system designed for educational and commercial purposes. Make sure to configure the database and server settings according to your environment before running the application. 

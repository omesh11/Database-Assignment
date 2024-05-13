create database store;
use store;
CREATE TABLE Users (
    User_ID INT PRIMARY KEY,
    Username VARCHAR(50) UNIQUE,
    Email VARCHAR(255) UNIQUE,
    Password VARCHAR(255),
    Join_Date DATE
);

CREATE TABLE Products (
    Product_ID INT PRIMARY KEY,
    Seller_ID INT,
    Name VARCHAR(255),
    Description TEXT,
    Price DECIMAL(10, 2),
    Stock INT,
    Category VARCHAR(50),
    Image_URL VARCHAR(255),
    Post_Date DATE,
    FOREIGN KEY (Seller_ID) REFERENCES Users(User_ID)
);

CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Buyer_ID INT,
    Product_ID INT,
    Quantity INT,
    Order_Date DATE,
    Status VARCHAR(20),
    FOREIGN KEY (Buyer_ID) REFERENCES Users(User_ID),
    FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID)
);

CREATE TABLE Reviews (
    Review_ID INT PRIMARY KEY,
    Product_ID INT,
    User_ID INT,
    Rating INT,
    Comment TEXT,
    Review_Date DATE,
    FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID),
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID)
);

CREATE TABLE Addresses (
    Address_ID INT PRIMARY KEY,
    User_ID INT,
    Address_Line1 VARCHAR(255),
    Address_Line2 VARCHAR(255),
    City VARCHAR(100),
    State VARCHAR(100),
    Zipcode VARCHAR(20),
    Country VARCHAR(100),
    Phone VARCHAR(20),
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID)
);

INSERT INTO Users (User_ID, Username, Email, Password, Join_Date)
VALUES
    (1, 'alice123', 'alice@example.com', 'password123', '2024-01-01'),
    (2, 'bob456', 'bob@example.com', 'password456', '2024-01-02'),
    (3, 'charlie789', 'charlie@example.com', 'password789', '2024-01-03');

INSERT INTO Products (Product_ID, Seller_ID, Name, Description, Price, Stock, Category, Image_URL, Post_Date)
VALUES
    (1, 1, 'iPhone 12', 'Brand new iPhone 12 with 128GB storage', 999.99, 10, 'Electronics', 'iphone12.jpg', '2024-01-05'),
    (2, 2, 'MacBook Pro', '2022 MacBook Pro with M1 Pro chip', 1499.99, 5, 'Electronics', 'macbookpro.jpg', '2024-01-06'),
    (3, 3, 'Nike Air Max', 'Original Nike Air Max shoes in black color', 129.99, 20, 'Fashion', 'nikeairmax.jpg', '2024-01-07');

INSERT INTO Orders (Order_ID, Buyer_ID, Product_ID, Quantity, Order_Date, Status)
VALUES
    (1, 1, 2, 1, '2024-01-10', 'Shipped'),
    (2, 2, 1, 2, '2024-01-11', 'Processing'),
    (3, 3, 3, 1, '2024-01-12', 'Delivered');

INSERT INTO Reviews (Review_ID, Product_ID, User_ID, Rating, Comment, Review_Date)
VALUES
    (1, 2, 1, 5, 'Great product! Fast shipping!', '2024-01-15'),
    (2, 1, 2, 4, 'Good quality, but a bit expensive', '2024-01-16'),
    (3, 3, 3, 5, 'Love these shoes! Perfect fit', '2024-01-17');

INSERT INTO Addresses (Address_ID, User_ID, Address_Line1, City, State, Zipcode, Country, Phone)
VALUES
    (1, 1, '123 Main St', 'New York', 'NY', '10001', 'USA', '123-456-7890'),
    (2, 2, '456 Elm St', 'Los Angeles', 'CA', '90001', 'USA', '456-789-0123'),
    (3, 3, '789 Oak St', 'Chicago', 'IL', '60601', 'USA', '789-012-3456');

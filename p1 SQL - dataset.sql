-- Create the database
CREATE DATABASE IBBLS_Orders;

GO

-- Use database
USE IBBLS_Orders;

-- Create the Areas table
CREATE TABLE Areas (
    AreaID INT PRIMARY KEY,
    AreaName VARCHAR(50),
    City VARCHAR(50),
    Region VARCHAR(50)
);

-- Populate the Areas table
INSERT INTO Areas (AreaID, AreaName, City, Region) VALUES
(1, 'Kfar Ganim', 'Petah Tikva', 'Central District'),
(2, 'Neve Zemer', 'Raanana', 'Central District'),
(3, 'Old City', 'Lod', 'Central District'),
(4, 'German Colony', 'Haifa', 'Haifa District'),
(5, 'HaPalmach Street', 'Nahariya', 'Haifa District'),
(6, 'Industrial Zone', 'Carmiel', 'Haifa District'),
(7, 'East Maale Adumim', 'Maale Adumim', 'Jerusalem District'),
(8, 'Old City', 'Jerusalem', 'Jerusalem District'),
(9, 'Manger Square', 'Bethlehem', 'Jerusalem District'),
(10, 'Balata Refugee Camp', 'Nablus', 'Judea and Samaria Area'),
(11, 'Downtown Ramallah', 'Ramallah', 'Judea and Samaria Area'),
(12, 'Tel Rumeida', 'Hebron', 'Judea and Samaria Area'),
(13, 'Nazareth Illit', 'Nazareth', 'Northern District'),
(14, 'Artists'' Quarter', 'Safed', 'Northern District'),
(15, 'Old City', 'Akko', 'Northern District'),
(16, 'Coral Beach', 'Eilat', 'Southern District'),
(17, 'Ad Halom', 'Ashdod', 'Southern District'),
(18, 'Negev Desert Area', 'Be''er Sheva', 'Southern District'),
(19, 'Dizengoff', 'Tel Aviv', 'Tel Aviv District'),
(20, 'Rothschild', 'Tel Aviv', 'Tel Aviv District'),
(21, 'The Port', 'Jaffa', 'Tel Aviv District'),
(22, 'Neve Tzedek', 'Tel Aviv', 'Tel Aviv District'),
(23, 'Bnei Brak Border', 'Ramat Gan', 'Tel Aviv District'),
(24, 'Herzliya Pituach', 'Herzliya', 'Tel Aviv District');

-- Create the Agents table
CREATE TABLE Agents (
    AgentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    BirthDate DATE,
    HireDate DATE,
    AreaID INT,
    FOREIGN KEY (AreaID) REFERENCES Areas(AreaID)
);

-- Populate the Agents table
INSERT INTO Agents (AgentID, FirstName, LastName, BirthDate, HireDate, AreaID) VALUES
(1, 'David', 'Cohen', '1981-01-15', '2015-02-15', 1),
(2, 'Sarah', 'Levi', '1983-03-22', '2015-04-30', 2),
(3, 'Daniel', 'Mizrahi', '1984-07-09', '2015-07-18', 3),
(4, 'Yael', 'Biton', '1985-10-18', '2015-10-12', 4),
(5, 'Avi', 'Peretz', '1986-02-14', '2016-01-05', 5),
(6, 'Noa', 'Azulay', '1987-06-30', '2016-03-23', 6),
(7, 'Moshe', 'Ohayon', '1989-08-05', '2016-06-08', 7),
(8, 'Maya', 'Ben-David', '1990-11-27', '2016-09-29', 8),
(9, 'Eli', 'Shapiro', '1992-04-03', '2016-12-14', 9),
(10, 'Tamar', 'Goldstein', '1993-09-19', '2017-02-20', 10),
(11, 'Shlomo', 'Katz', '1994-12-11', '2017-05-06', 11),
(12, 'Michal', 'Elbaz', '1996-05-07', '2017-08-25', 12),
(13, 'Yitzhak', 'Avraham', '1997-08-25', '2017-11-10', 13),
(14, 'Gal', 'Golan', '1999-02-10', '2018-01-19', 14),
(15, 'Shira', 'Dayan', '2000-07-14', '2018-04-04', 15),
(16, 'Yosef', 'Harel', '2002-11-20', '2018-07-27', 16),
(17, 'Lior', 'Rosenberg', '2004-03-01', '2018-10-22', 17),
(18, 'Rina', 'Dahan', '2005-09-09', '2019-01-16', 18),
(19, 'Haim', 'Malka', '2007-06-23', '2019-04-08', 19),
(20, 'Orly', 'Segal', '2008-12-17', '2019-07-30', 20),
(21, 'Yonatan', 'Shoshan', '2010-04-28', '2019-11-11', 21),
(22, 'Talia', 'Sharabi', '2012-08-16', '2020-03-02', 22),
(23, 'Eitan', 'Baruch', '2015-11-04', '2020-06-24', 23),
(24, 'Adi', 'Ashkenazi', '2019-07-21', '2021-09-18', 24);

-- Create the Restaurants table
CREATE TABLE Restaurants (
    RestaurantID INT PRIMARY KEY,
    RestaurantName VARCHAR(100),
    RestaurantOwner VARCHAR(100),
    RestaurantType VARCHAR(50),
    AreaID INT,
    AgentID INT,
    FOREIGN KEY (AreaID) REFERENCES Areas(AreaID),
    FOREIGN KEY (AgentID) REFERENCES Agents(AgentID)
);

-- Populate the Restaurants table
INSERT INTO Restaurants (RestaurantID, RestaurantName, RestaurantOwner, RestaurantType, AreaID, AgentID) VALUES
(1, 'Machneyuda', 'Assaf Granit', 'Mediterranean', 1, 1),
(2, 'Eyal Shani''s Port Said', 'Eyal Shani', 'Middle Eastern', 2, 2),
(3, 'Taizu', 'Yuval Ben-Neriah', 'Asian Fusion', 3, 3),
(4, 'Ouzeria', 'Avivit Priel', 'Greek-Mediterranean', 4, 4),
(5, 'Uri Buri', 'Uri Jeremias', 'Seafood', 5, 5),
(6, 'Pastel', 'Haim Cohen', 'Contemporary Israeli', 6, 6),
(7, 'The Old Man and the Sea', 'Shlomi Touboul', 'Middle Eastern', 7, 7),
(8, 'Blue Sky', 'Meir Adoni', 'Kosher Seafood', 8, 8),
(9, 'Claro', 'Ran Shmueli', 'Farm-to-Table', 9, 9),
(10, 'Rutenberg', 'Amnon and Hila Rutenberg', 'Seasonal Israeli', 10, 10),
(11, 'M25', 'Nir Levy', 'Meat', 11, 11),
(12, 'Pescado', 'Shimon Sabah', 'Seafood', 12, 12),
(13, 'Herbert Samuel', 'Yonatan Roshfeld', 'Modern Israeli', 13, 13),
(14, 'Shila', 'Sharon Cohen', 'Seafood and Grill', 14, 14),
(15, 'OCD', 'Raz Rahav', 'Chef''s Tasting Menu', 15, 15),
(16, 'North Abraxas', 'Eyal Shani', 'Middle Eastern', 16, 16),
(17, 'Tzfon Abraxas', 'Eyal Shani', 'Middle Eastern', 17, 17),
(18, 'Beit Kandinof', 'Assaf Barel', 'Mediterranean', 18, 18),
(19, 'Animar', 'Hillel Tavakuli', 'Modern Mediterranean', 19, 19),
(20, 'Alena', 'Yaron Amsalem', 'Contemporary Israeli', 20, 20),
(21, 'Lumina', 'Meir Adoni', 'Kosher Fine Dining', 21, 21),
(22, 'George and John', 'Tomer Tal', 'Modern Israeli', 22, 22),
(23, 'Yudale Bar', 'Assaf Granit', 'Tapas Bar', 23, 23),
(24, 'Hamotzi', 'Avi Levy', 'North African', 24, 24);


-- Create the Products table
CREATE TABLE Products (
    ItemID INT PRIMARY KEY,
    ItemName VARCHAR(100),
    AlcoholLevel DECIMAL(3, 2),
    ProductCategory VARCHAR(50),
    OriginCountry VARCHAR(50),
    ProductPrice MONEY,
    ProductDescription VARCHAR(200)
);

-- Populate the Products table
INSERT INTO Products (ItemID, ItemName, AlcoholLevel, ProductCategory, OriginCountry, ProductPrice, ProductDescription) VALUES
(1, 'Carlsberg', 0.05, 'Beer', 'Denmark', 7.00, 'Carlsberg is a Danish pilsner that is known for its refreshing taste and rich brewing heritage.'),
(2, 'Tuborg', 0.05, 'Beer', 'Denmark', 7.00, 'Tuborg is a popular Danish lager that offers a crisp and light flavor, making it a favorite for social gatherings.'),
(3, 'Guinness', 0.05, 'Beer', 'Ireland', 8.00, 'Guinness is an iconic Irish stout characterized by its dark color, creamy head, and rich, roasted malt flavor.'),
(4, 'Shikma', 0.05, 'Beer', 'Israel', 9.00, 'Shikma is an Israeli beer brand that emphasizes the unique terroir of the region, producing high-quality, flavorful wines.'),
(5, 'Tavor Malkia', 0.13, 'Wine', 'Israel', 150.00, 'Tavor Malkia is a well-regarded Israeli wine that showcases the vibrant and diverse flavors of the Tavor region.'),
(6, 'AIX', 0.13, 'Wine', 'France', 110.00, 'AIX is a Provence rosé that is celebrated for its elegance, bright acidity, and notes of red fruits and flowers.'),
(7, 'Tavor Rose', 0.13, 'Wine', 'Israel', 70.00, 'Tavor Rose is a delightful Israeli rosé known for its refreshing taste and hints of strawberries and citrus.'),
(8, 'Cote-Rotie', 0.13, 'Wine', 'France', 90.00, 'Cote-Rotie is a prestigious French wine from the Rhône Valley, renowned for its complex, full-bodied red wines made primarily from Syrah grapes.'),
(9, 'Matso', 0.13, 'Wine', 'Spain', 70.00, 'Matso is an Australian brewery known for its signature ginger beer and unique craft beers that highlight local ingredients.'),
(10, 'Astrolabs', 0.13, 'Wine', 'New-Zealand', 70.00, 'Astrolabs is a boutique winery that focuses on small-batch production, creating artisanal wines with distinctive character.'),
(11, 'Glenmorangie', 0.40, 'Whiskey', 'Scotland', 320.00, 'Glenmorangie is a renowned Scottish whisky distillery famous for its smooth and fruity single malts matured in fine oak casks.'),
(12, 'Ardberg', 0.40, 'Whiskey', 'Scotland', 280.00, 'Ardbeg is a celebrated Islay whisky known for its intense peat smoke flavor and complex character.'),
(13, 'Bulleit', 0.40, 'Whiskey', 'USA', 120.00, 'Bulleit Bourbon is an American whiskey that stands out for its high rye content, delivering a bold and spicy flavor profile.'),
(14, 'Crown Royal', 0.40, 'Whiskey', 'Canada', 15.00, 'Crown Royal is a Canadian whisky known for its smoothness and rich blend of flavors, making it a favorite among whisky enthusiasts.'),
(15, 'Yamazaki', 0.40, 'Whiskey', 'Japan', 450.00, 'Yamazaki is Japan''s oldest malt whisky distillery, producing elegant and nuanced whiskies that reflect the artistry of Japanese craftsmanship.'),
(16, 'Captain Morgan', 0.40, 'Rum', 'Caribbean', 90.00, 'Captain Morgan is a spiced rum brand celebrated for its sweet and flavorful profile, perfect for cocktails and mixers.'),
(17, 'Plantation 3 Stars', 0.40, 'Rum', 'Caribbean', 100.00, 'Plantation 3 Stars is a blend of rums from the Caribbean, offering a lively and versatile spirit ideal for cocktails.'),
(18, 'Plantation Pineapple', 0.40, 'Rum', 'Caribbean', 110.00, 'Plantation Pineapple is a unique rum infused with pineapple, delivering a tropical flavor that enhances various cocktails.'),
(19, 'Zacapa', 0.40, 'Rum', 'Caribbean', 150.00, 'Zacapa is a premium Guatemalan rum known for its rich sweetness and complexity, aged at high altitude for exceptional quality.'),
(20, 'Tanqueray', 0.40, 'Gin', 'England', 130.00, 'Tanqueray is a classic London dry gin recognized for its bold juniper flavor and versatility in cocktails.'),
(21, 'Gordons', 0.40, 'Gin', 'England', 90.00, 'Gordons is a well-known gin brand that offers a traditional flavor profile with a refreshing mix of botanicals.'),
(22, 'Citadelle', 0.40, 'Gin', 'England', 110.00, 'Citadelle Gin is a French gin that combines over 19 botanicals, resulting in a balanced and aromatic spirit.'),
(23, 'Don Julio', 0.40, 'Tequila', 'Mexico', 280.00, 'Don Julio is a premium tequila brand celebrated for its smoothness and rich agave flavor, making it a favorite for sipping and cocktails.'),
(24, 'Espolon', 0.40, 'Tequila', 'Mexico', 150.00, 'Espolon is a tequila known for its vibrant flavors and artistic packaging, showcasing the spirit''s Mexican heritage.');

-- Create the Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    RestaurantID INT,
    ItemID INT,
    Quantity INT,
    TotalPrice MONEY,
    FOREIGN KEY (RestaurantID) REFERENCES Restaurants(RestaurantID),
    FOREIGN KEY (ItemID) REFERENCES Products(ItemID)
);

-- Populate the Orders table
INSERT INTO Orders (OrderID, RestaurantID, ItemID, Quantity, TotalPrice) VALUES
(1, 1, 1, 3, 21.00),
(2, 2, 2, 7, 49.00),
(3, 3, 3, 1, 8.00),
(4, 4, 4, 5, 45.00),
(5, 5, 5, 2, 300.00),
(6, 6, 6, 8, 880.00),
(7, 7, 7, 4, 280.00),
(8, 8, 8, 6, 540.00),
(9, 9, 9, 9, 630.00),
(10, 10, 10, 2, 140.00),
(11, 11, 11, 5, 1600.00),
(12, 12, 12, 3, 840.00),
(13, 13, 13, 7, 840.00),
(14, 14, 14, 1, 15.00),
(15, 15, 15, 8, 3600.00),
(16, 16, 16, 6, 540.00),
(17, 17, 17, 4, 400.00),
(18, 18, 18, 9, 990.00),
(19, 19, 19, 3, 450.00),
(20, 20, 20, 2, 260.00),
(21, 21, 21, 7, 630.00),
(22, 22, 22, 5, 550.00),
(23, 23, 23, 8, 2240.00),
(24, 24, 24, 1, 150.00);
-- Создание таблицы продуктов
CREATE TABLE dbo.SKU as s (
    ID INT IDENTITY(1,1) PRIMARY KEY 
    ,Code AS ('s' + CAST(ID AS VARCHAR(10))) PERSISTED UNIQUE 
    ,Name VARCHAR(255)
);

-- Создание таблицы семьи и семейного бюджета
CREATE TABLE dbo.Family as f (
    ID INT IDENTITY(1,1) PRIMARY KEY 
    ,SurName VARCHAR(255) 
    ,BudgetValue DECIMAL(18,3)
);

-- Создание таблицы продуктовой корзины
CREATE TABLE dbo.Basket as b (
    ID INT IDENTITY(1,1) PRIMARY KEY 
    ,ID_SKU INT 
    ,ID_Family INT 
    ,Quantity INT CHECK (Quantity >= 0) 
    ,Value DECIMAL(18,3) CHECK (Value >= 0),
    ,PurchaseDate DATETIME DEFAULT CURRENT_TIMESTAMP 
    ,DiscountValue DECIMAL(18,3) 
	,FOREIGN key (ID_SKU) REFERENCES s (ID) 
	,FOREIGN key (ID_Family) REFERENCES f (ID)
);



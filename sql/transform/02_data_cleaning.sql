--data exploration

--count of rows
SELECT COUNT(*) FROM zepto;

--sample data
SELECT * FROM zepto
LIMIT 10;

--NULL values
SELECT * FROM zepto
WHERE
	category IS NULL
	OR
	name IS NULL
	OR
	mrp IS NULL
	OR
	discountPercent IS NULL
	OR
	availableQuantity IS NULL
	OR
	discountedSellingPrice IS NULL
	OR
	weightInGms IS NULL
	OR
	outOfStock IS NULL
	OR
	quantity IS NULL;

--different product categories
SELECT DISTINCT category
FROM zepto
ORDER BY category;

--products in stock vs out of stock
SELECT outofstock, COUNT(sku_id)
FROM zepto
GROUP BY outofstock;

--product names present multiple times
SELECT name, COUNT(sku_id) as "Number of SKUs"
FROM zepto
GROUP BY name
HAVING COUNT(sku_id) > 1
ORDER BY name DESC;

--data cleaning

--products with price=0
SELECT * FROM zepto
WHERE mrp = 0 OR discountedsellingprice = 0;

DELETE FROM zepto
WHERE mrp = 0;

--convert paise to rupees
UPDATE zepto
SET mrp = mrp/100,
discountedsellingprice = discountedsellingprice/100;

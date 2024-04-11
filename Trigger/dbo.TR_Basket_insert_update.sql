-- Триггер
CREATE TRIGGER dbo.TR_Basket_insert_update
ON b
AFTER INSERT, UPDATE
AS
 
	IF EXISTS (select ID_SKU from b
		GROUP BY ID_SKU
		HAVING COUNT(ID_SKU) > 1)
	BEGIN
		UPDATE b
		SET DiscountValue = Value + (Value / 100 * 5);
	END
	ELSE
	BEGIN 
		UPDATE b
		SET DiscountValue = 0;
	END
GO

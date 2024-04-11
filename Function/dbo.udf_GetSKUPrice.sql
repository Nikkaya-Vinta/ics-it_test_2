-- Функция для расчета стоимости продукта
CREATE FUNCTION dbo.udf_GetSKUPrice (@ID_SKU INT)
RETURNS DECIMAL(18,2)
AS
BEGIN
    DECLARE @Price DECIMAL(18,2);

    SELECT @Price = SUM(Value) / SUM(Quantity)
    FROM b
    WHERE ID_SKU = @ID_SKU;

    RETURN @Price;
END;
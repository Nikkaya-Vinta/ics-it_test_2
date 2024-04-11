-- Создаём представление
CREATE VIEW dbo.vw_SKUPrice
AS
	SELECT s.*, dbo.udf_GetSKUPrice(ID) as Price FROM s;
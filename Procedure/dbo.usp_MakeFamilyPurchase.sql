-- Процедура
CREATE PROCEDURE dbo.usp_MakeFamilyPurchase 
	@FamilySurName VARCHAR(255)
AS
BEGIN	
	SET nocount on;
	SELECT 1 FROM f
	WHERE SurName = @FamilySurName
 
	IF NOT EXISTS (SELECT 1 FROM f WHERE SurName = @FamilySurName)
		BEGIN
			RAISERROR('Семейство не найдено', 16, 1);

			RETURN;
		END;

	UPDATE f
	SET BudgetValue = BudgetValue - (SELECT SUM(Value) FROM dbo.Basket WHERE dbo.Basket.ID_Family = dbo.Family.ID)
	FROM dbo.Family
	WHERE dbo.Family.SurName = @FamilySurName

END; 
GO

CREATE PROC [dbo].[gps_spInsertProposteAcquisto]
   @ItemCode   NVARCHAR(50),
   @Revision   NVARCHAR(50),
   @CardCode   NVARCHAR(15),
   @PQTReqDate DATETIME,
   @Quantity   NUMERIC(19, 6)
AS
   BEGIN
      INSERT INTO [dbo].[GPS_wsProposteAcquisto]
      (
             [ItemCode]
           , [U_Revision]
           , [CardCode]
           , [PQTReqDate]
           , [Quantity]
      )
      VALUES(
             @ItemCode, 
		   @Revision, 
		   @CardCode, @PQTReqDate, @Quantity);
   END;


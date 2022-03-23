-- DROP FUNCTION if EXISTS fnCompanions;
CREATE FUNCTION dbo.fnCompanions(@EpisodeId int)
RETURNS VARCHAR(1000)
AS
BEGIN
    DECLARE @companions AS VARCHAR(1000);
    DECLARE @companion As VARCHAR(255);
    DECLARE @flag AS BIT=0;
    DECLARE CompanionCursor CURSOR FOR 
    SELECT CompanionName from tblCompanion
    WHERE CompanionId IN(SELECT CompanionId from tblEpisodeCompanion where EpisodeId=@EpisodeId) 
    OPEN CompanionCursor;
    FETCH NEXT FROM CompanionCursor into @companion;
    WHILE(@@FETCH_STATUS=0)
    BEGIN
        
        if (@flag=0) 
        BEGIN
            SET @companions=@companion;
            SET @flag=1;
        END
            
        ELSE
            SET @companions += ','+@companion;
        FETCH NEXT FROM CompanionCursor into @companion;
    END
    CLOSE CompanionCursor;
    DEALLOCATE CompanionCursor;
    RETURN @companions;
END
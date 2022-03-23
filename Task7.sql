-- DROP FUNCTION if EXISTS fnEnemies;
CREATE FUNCTION dbo.fnEnemies(@EpisodeId int)
RETURNS VARCHAR(1000)
AS
BEGIN
    DECLARE @enemies AS VARCHAR(1000);
    DECLARE @enemy As VARCHAR(255);
    DECLARE @flag AS BIT=0;
    DECLARE EnemiesCursor CURSOR FOR 
    SELECT EnemyName from tblEnemy
    WHERE EnemyId IN(SELECT EnemyId from tblEpisodeEnemy where EpisodeId=@EpisodeId) 
    OPEN EnemiesCursor;
    FETCH NEXT FROM EnemiesCursor into @enemy;
    WHILE(@@FETCH_STATUS=0)
    BEGIN
        
        if (@flag=0) 
        BEGIN
            SET @enemies=@enemy;
            SET @flag=1;
        END
            
        ELSE
            SET @enemies += ','+@enemy;
        FETCH NEXT FROM EnemiesCursor into @enemy;
    END
    CLOSE EnemiesCursor;
    DEALLOCATE EnemiesCursor;
    RETURN @enemies;
END
CREATE VIEW viewEpisodes AS
SELECT e.EpisodeId,e.SeriesNumber, e.EpisodeNumber,e.EpisodeType,e.Title,e.EpisodeDate,e.Notes,a.AuthorName, d.DoctorName, dbo.fnCompanions(e.EpisodeId) As Companions, dbo.fnEnemies(e.EpisodeId) AS Enemies 
FROM tblEpisode e Left OUTER JOIN tblDoctor d on e.DoctorId=d.DoctorId
LEFT OUTER JOIN tblAuthor a on e.AuthorId=a.AuthorId; 
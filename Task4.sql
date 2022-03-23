USE DoctorWho;

UPDATE tblEpisode
set Title= 
case 
When CHARINDEX('_',Title)>0 then CONCAT(SUBSTRING(Title,0,CHARINDEX('_',Title)),'_','CANCALLED')
else CONCAT(Title,'_','CANCALLED')
END
where DoctorId IS NULL;


select * from tblEpisode;


use DoctorWho;

DELETE From tblCompanion
OUTPUT deleted.CompanionId AS RemovedCompanionId,deleted.CompanionName AS RemovedCompanionName
where CompanionId Not IN(
    select CompanionId from tblEpisodeCompanion 
);

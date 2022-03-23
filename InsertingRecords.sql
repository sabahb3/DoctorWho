use DoctorWho;

INSERT into tblAuthor VALUES ('Aisha Marmash'),
                             ('Sara Sawafta'),
                             ('Asad Jamal'),
                             ('Rawan Ahmad'),
                             ('Qamar Ashour');

SELECT * FROM tblAuthor;

INSERT INTO tblEnemy VALUES('Tuberculosis','Tuberculosis (TB) is caused by bacteria (Mycobacterium tuberculosis) that most often affect the lungs. Tuberculosis is curable and preventable.'),
                            ('Plague','Plague is an infectious disease caused by the bacteria Yersinia pestis, a zoonotic bacteria, usually found in small mammals and their fleas. It is transmitted between animals through fleas.'),
                            ('Smallpox','Smallpox is an ancient disease caused by the variola virus. Early symptoms include high fever and fatigue. The virus then produces a characteristic rash, particularly on the face, arms and legs. The resulting spots become filled with clear fluid and later, pus, and then form a crust, which eventually dries up and falls off. Smallpox was fatal in up to 30% of cases'),
                            ('Poliomyelitis','A viral infection causing nerve injury which leads to partial or full paralysis. Many of the infected people do not show any symptoms.'),
                            ('Cholera','A bacterial infection which spreads through contaminated food and water.');

SELECT * FROM tblEnemy;

INSERT INTO tblDoctor VALUES ('First Doctor','Anjad Shaar','1985-07-10','2005-01-02','2008-05-21'),
                             ('Second Doctor', 'Ranen Halabi','1986-08-03','2007-04-26','2010-05-20'),
                             ('Third Doctor','Shahd Shaar','1987-04-22','2010-07-26',null),
                             ('Fourth Doctor','Lina Khanna','1988-10-15',null,null),
                             ('Fifth Doctor','Majd Nabulsi','1989-12-26',null,null);
SELECT * from tblDoctor;

INSERT Into tblCompanion VALUES ('Ameera Ameer', 'Ameera Surakji'),
                                ('khalid Ali', 'khalid Toma'),
                                ('Aya Khalid', 'Aya Jamal'),
                                ('Samar Samer', 'Samar Rsas'),
                                ('Duaa Aqel ','Dalal Aqel');
SELECT * from tblCompanion;


INSERT INTO tblEpisode VALUES(1,1,'Full','Welcome','2009-05-21',(select top(1) AuthorId from tblAuthor WHERE AuthorName='Aisha Marmash'),(Select top(1) DoctorId from tblDoctor WHERE DoctorNumber='Second Doctor')),
                             (1,2,'Trailer','Test','2009-05-28',(select top(1) AuthorId from tblAuthor WHERE AuthorName='Qamar Ashour'),(Select top(1) DoctorId from tblDoctor WHERE DoctorNumber='First Doctor')),
                             (1,3,'Bonus','Be Better','2005-06-20',(select top(1) AuthorId from tblAuthor WHERE AuthorName='Aisha Marmash'),null),
                             (2,1,'Full','Warnning','2006-06-22',(select top(1) AuthorId from tblAuthor WHERE AuthorName='Qamar Ashour'),(Select top(1) DoctorId from tblDoctor WHERE DoctorNumber='Fifth Doctor')),
                             (2,2,'Trailer','Final','2022-05-22',(select top(1) AuthorId from tblAuthor WHERE AuthorName='Asad Jamal'),null);
SELECT * FROM tblEpisode;
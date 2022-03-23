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
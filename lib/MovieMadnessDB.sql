BEGIN TRANSACTION;
/*DROP TABLE IF EXISTS "tblUsers";*/
CREATE TABLE IF NOT EXISTS "tblUsers" (
	"user_id"	INTEGER PRIMARY KEY,
	"username"	TEXT NOT NULL,
	"password"	TEXT NOT NULL,
	"user_name"	TEXT,
	"user_age"	INTEGER,
	"user_email"	TEXT,
	"user_join_date"	TEXT NOT NULL,
	"Admin"	TEXT NOT NULL
);
/*DROP TABLE IF EXISTS "tblReviews";*/
CREATE TABLE IF NOT EXISTS "tblReviews" (
	"review_id"	INTEGER PRIMARY KEY,
	"user_id"	INTEGER,
	"movie_id"	INTEGER,
	"review_comment"	TEXT,
	"review_rating"	INTEGER NOT NULL,
	"review_date"	TEXT NOT NULL
);
/*DROP TABLE IF EXISTS "tblActors";*/
CREATE TABLE IF NOT EXISTS "tblActors" (
	"actor_id"	INTEGER PRIMARY KEY,
	"actor_name"	TEXT NOT NULL,
	"actor_age"	INTEGER NOT NULL,
	"actor_gender"	TEXT NOT NULL,
	"actor_profile_image"	TEXT NOT NULL
);
/*DROP TABLE IF EXISTS "tblMovies";*/
CREATE TABLE IF NOT EXISTS "tblMovies" (
	"movie_id"	INTEGER PRIMARY KEY,
	"movie_title"	TEXT NOT NULL,
	"movie_summary"	TEXT NOT NULL,
	"movie_duration"	TEXT NOT NULL,
	"movie_genre"	TEXT NOT NULL,
	"movie_release_date"	TEXT NOT NULL,
	"movie_cover_image"	TEXT NOT NULL,
	"movie_trailer"	TEXT NOT NULL
);
/*DROP TABLE IF EXISTS "tblMovieCast";*/
CREATE TABLE IF NOT EXISTS "tblMovieCast" (
	"movie_cast_id"	INTEGER PRIMARY KEY,
	"movie_id"	INTEGER,
	"actor_id"	INTEGER,
	FOREIGN KEY("movie_id") REFERENCES "tblMovies"("movie_id"),
	FOREIGN KEY("actor_id") REFERENCES "tblActors"("actor_id")
);
INSERT INTO "tblUsers" VALUES (1,'SAhmed','SAhmed123',NULL,NULL,NULL,'12/04/2015','no');
INSERT INTO "tblUsers" VALUES (2,'ILoghin','ILoghin123',NULL,NULL,NULL,'12/04/2015','no');
INSERT INTO "tblUsers" VALUES (3,'MYousaf','MYousaf123',NULL,NULL,NULL,'12/04/2015','no');
INSERT INTO "tblUsers" VALUES (4,'IMougiollari','IMougiollari123',NULL,NULL,NULL,'12/04/2015','no');
INSERT INTO "tblUsers" VALUES (5,'LDermanis','LDermanis123',NULL,NULL,NULL,'12/04/2015','no');
INSERT INTO "tblUsers" VALUES (6,'CStubbs','CStubbs123',NULL,NULL,NULL,'12/04/2015','no');
INSERT INTO "tblUsers" VALUES (7,'TMichiels','TMichiels123',NULL,NULL,NULL,'12/04/2015','no');
INSERT INTO "tblUsers" VALUES (8,'SPhillips','SPhillips123',NULL,NULL,NULL,'12/04/2015','no');
INSERT INTO "tblUsers" VALUES (9,'SBheenuck','SBheenuck123',NULL,NULL,NULL,'12/04/2015','no');
INSERT INTO "tblUsers" VALUES (10,'TStandavid','TStandavid123',NULL,NULL,NULL,'12/04/2015','yes');
INSERT INTO "tblUsers" VALUES (11,'FChacko','FChacko123',NULL,NULL,NULL,'12/04/2015','no');
INSERT INTO "tblUsers" VALUES (12,'AAbeyasekera','AAbeyasekera123',NULL,NULL,NULL,'12/04/2015','yes');
INSERT INTO "tblUsers" VALUES (13,'MClark','MClark123',NULL,NULL,NULL,'12/04/2015','yes');
INSERT INTO "tblUsers" VALUES (14,'SSaicomphu','SSaicomphu123',NULL,NULL,NULL,'12/04/2015','no');
INSERT INTO "tblUsers" VALUES (15,'ABoyd','ABoyd123',NULL,NULL,NULL,'12/04/2015','yes');
INSERT INTO "tblUsers" VALUES (16,'DBarros','DBarros123',NULL,NULL,NULL,'12/04/2015','no');
INSERT INTO "tblUsers" VALUES (17,'LSydorenko','LSydorenko123',NULL,NULL,NULL,'12/04/2015','no');
INSERT INTO "tblUsers" VALUES (18,'BNagaraja','BNagaraja123',NULL,NULL,NULL,'12/04/2015','no');
INSERT INTO "tblUsers" VALUES (19,'JCrook','JCrook123',NULL,NULL,NULL,'12/04/2015','no');
INSERT INTO "tblUsers" VALUES (20,'IBerg','IBerg123',NULL,NULL,NULL,'12/04/2015','no');
INSERT INTO "tblUsers" VALUES (21,'AMarinho','AMarinho123',NULL,NULL,NULL,'12/04/2015','no');
INSERT INTO "tblUsers" VALUES (22,'SCernegu','SCernegu123',NULL,NULL,NULL,'12/04/2015','no');
INSERT INTO "tblUsers" VALUES (23,'MMohammad','MMohammad123',NULL,NULL,NULL,'12/04/2015','yes');
INSERT INTO "tblUsers" VALUES (24,'VTsang','VTsang123',NULL,NULL,NULL,'12/04/2015','no');
INSERT INTO "tblUsers" VALUES (25,'SChan','SChan123',NULL,NULL,NULL,'12/04/2015','no');
/*INSERT INTO "tblReviews" VALUES (0,12,16,'"Shrek" is visually stunning. Dreamworks has really done a fantastic job with the computer animation. On the other hand I found some of the humor a little gross (is there no end to the flatulence jokes?!). I also have a hard time with many of the pop culture references. Although it may be humorous today, much of it will be meaningless in ten to fifteen years. I don''t really see this film "standing the test of time".',2,'29 May 2001');
INSERT INTO "tblReviews" VALUES (1,12,8,'I couldn''t imagine how much time & effort Disney had filmed this documentary. Rather than just filming penguins, they make it more interesting and has a story of one particular penguin. The editing job is awesome! The penguins look so adorable. The nature is so beautiful. This movie is very informative as well. I learn so much about penguin''s life. Well done, Disney',4,'21 April 2019');
INSERT INTO "tblReviews" VALUES (2,12,13,'A brilliant look at honor among criminals in L.A. It''s the film that everyone has been waiting for, but took everyone by surprise. If there ever was a film to watch, this is the one. John Travolta and Samuel L. Jackson give head turning performances , and so does Uma Thurman. This film has a nostalgic feel to it. It feels like this film was made sometime in the 1970''s, but it was made in 1994. Note: I never understood why everyone that sees this film (except for me) says that it has nudity. The people at Cinebooks need to get glasses.',5,'23 May 1999');
INSERT INTO "tblReviews" VALUES (3,12,19,'I''m sorry I missed this in the theaters. But I finally rented the video last night and was very glad I did. It''s been a long time since any movie has managed to get through a lifetime of emotional armor and get me to laugh out loud so often. And not just laughs. It''s a truly hopeful and optimistic view of an individual''s struggle to belong, to give and accept love. I hate the word heartwarming because it gets so overused. But that is exactly the effect it had on me! ',5,'25 August 1999');
INSERT INTO "tblReviews" VALUES (5,12,20,'I loved the movie Layer Cake. It was fun, Fast, and has some very good acting. The writing was spare, but good, and I loved the ending - not what I expected at all. And it has the usual quirkiness I have come to love in British films. When I finished viewing the movie I turned to my husband and told him that Daniel Craig would make a fantastic James Bond! Lo & behold - he was named as the next Bond the following week. I know many people are against his being Bond, and a bit of a revolt has ensued. I really believe that everyone is in for a pleasant surprise. He is Suave enough. He is debonair enough. He is handsome enough. He will be Bond. And he will have you shaken and stirred.',4,'15 August 2006');
INSERT INTO "tblReviews" VALUES (6,15,11,'Blade Runner 2049 not only succeeds at feeling like a necessary franchise revival, it also makes for a captivating standalone work of science-fiction.',5,'06 Oct 2017');
INSERT INTO "tblReviews" VALUES (7,15,12,'Hanks'' power as an actor makes us believe in Forrest. He also draws us into Forrest''s mind and morality system. And he sets out a singular film persona who will be watched and loved as long as people embrace movies.',4,'28 Feb 2018');
INSERT INTO "tblReviews" VALUES (8,15,18,'To be sure, the movie has plenty of laughs, but like sunlight on the deceptively calm surface of the sea, its light humor dances fitfully over dark and dangerous undercurrents.',4,'18 Aug 2014');
INSERT INTO "tblReviews" VALUES (9,15,14,'Fight Club is one movie that exactly caught the pre-millennial tension. Great performances, stunning visuals and a plot like nothing you''ve ever seen - one of the films of the year.',5,'24 Aug 2016');
INSERT INTO "tblReviews" VALUES (10,15,15,'
Ultimately, like La Femme Nikita, there may be less here than meets the eye. But what does meet the eye is pretty darn thrilling.',3,'14 June 2014');
INSERT INTO "tblReviews" VALUES (11,15,1,'A richly imaginative comicbook world is unveiled in Hellboy. If only the story was as strong.',3,'03 Aug 2004');
INSERT INTO "tblReviews" VALUES (12,15,2,'Amid the noisy, epic action of most kid-oriented features, this film''s story is clear and effective: a sweet-hearted narrative of how friendship can broaden one''s horizons.',4,'12 April 2019');
INSERT INTO "tblReviews" VALUES (13,15,3,'The real problem with After is that it''s a lifeless slog of thinly written clichés, one that''s missing the charismatic spark of the actual One Direction boys.',1,'12 April 2019');
INSERT INTO "tblReviews" VALUES (14,15,4,'The production design, the shimmering, evocative Stuart Staples music, everything blends together.',5,'15 April 2019');
INSERT INTO "tblReviews" VALUES (15,15,5,'Lacking the wit and graphic oomph that sometimes rescues the Marvel franchise from terminal fatigue, "Captain Marvel" is yet another origin story for yet another superhero.',2,'11 March 2019');
INSERT INTO "tblReviews" VALUES (18,15,9,'Kalank doesn''t really lift off the screen. The whole feels like a giant set, stately and ponderous and minus impact; the cast all costumed and perfumed and largely life-less, sparking only in bits and pieces.',3,'19 April 2019');
INSERT INTO "tblReviews" VALUES (19,15,10,'Hidden within the deep recesses of Kevin Kolsch and Dennis Widmye''s not-that-scary movie is a really compelling film about death, unfortunately they''re tasked with a bland, way too literal script to be able to make it.',3,'05 April 2019');
INSERT INTO "tblReviews" VALUES (20,15,17,'On the surface, this movie looks like it would be somewhat mediocre. But it''s actually pretty damn good. When you''re not laughing your pants off (and believe me, you will be), you''ll have no problem being just plain entertained by it''s ability to just have fun.',4,'18  March 2013');
INSERT INTO "tblReviews" VALUES (21,12,1,'really good',5,'20 March 2011');
INSERT INTO "tblMovieCast" VALUES (1,1,20);
INSERT INTO "tblMovieCast" VALUES (2,1,19);
INSERT INTO "tblMovieCast" VALUES (3,1,18);
INSERT INTO "tblMovieCast" VALUES (4,1,17);
INSERT INTO "tblMovieCast" VALUES (5,2,16);
INSERT INTO "tblMovieCast" VALUES (6,2,15);
INSERT INTO "tblMovieCast" VALUES (7,2,14);
INSERT INTO "tblMovieCast" VALUES (8,2,13);
INSERT INTO "tblMovieCast" VALUES (9,3,12);
INSERT INTO "tblMovieCast" VALUES (10,3,11);
INSERT INTO "tblMovieCast" VALUES (11,3,10);
INSERT INTO "tblMovieCast" VALUES (12,3,9);
INSERT INTO "tblMovieCast" VALUES (13,4,8);
INSERT INTO "tblMovieCast" VALUES (14,4,7);
INSERT INTO "tblMovieCast" VALUES (15,4,6);
INSERT INTO "tblMovieCast" VALUES (16,4,5);
INSERT INTO "tblMovieCast" VALUES (17,5,4);
INSERT INTO "tblMovieCast" VALUES (18,5,3);
INSERT INTO "tblMovieCast" VALUES (19,5,2);
INSERT INTO "tblMovieCast" VALUES (20,5,1);
INSERT INTO "tblMovieCast" VALUES (31,8,36);
INSERT INTO "tblMovieCast" VALUES (37,9,37);
INSERT INTO "tblMovieCast" VALUES (38,9,38);
INSERT INTO "tblMovieCast" VALUES (39,9,39);
INSERT INTO "tblMovieCast" VALUES (40,9,40);
INSERT INTO "tblMovieCast" VALUES (41,9,41);
INSERT INTO "tblMovieCast" VALUES (42,9,42);
INSERT INTO "tblMovieCast" VALUES (43,9,43);
INSERT INTO "tblMovieCast" VALUES (44,9,44);
INSERT INTO "tblMovieCast" VALUES (45,10,45);
INSERT INTO "tblMovieCast" VALUES (46,10,46);
INSERT INTO "tblMovieCast" VALUES (47,10,47);
INSERT INTO "tblMovieCast" VALUES (48,10,48);
INSERT INTO "tblMovieCast" VALUES (49,10,49);
INSERT INTO "tblMovieCast" VALUES (50,10,50);
INSERT INTO "tblMovieCast" VALUES (51,10,51);
INSERT INTO "tblMovieCast" VALUES (52,10,52);
INSERT INTO "tblMovieCast" VALUES (53,10,53);
INSERT INTO "tblMovieCast" VALUES (54,10,54);
INSERT INTO "tblMovieCast" VALUES (55,10,55);
INSERT INTO "tblMovieCast" VALUES (56,10,56);
INSERT INTO "tblMovieCast" VALUES (57,11,57);
INSERT INTO "tblMovieCast" VALUES (58,11,58);
INSERT INTO "tblMovieCast" VALUES (59,11,59);
INSERT INTO "tblMovieCast" VALUES (60,11,60);
INSERT INTO "tblMovieCast" VALUES (61,12,61);
INSERT INTO "tblMovieCast" VALUES (62,12,62);
INSERT INTO "tblMovieCast" VALUES (63,12,63);
INSERT INTO "tblMovieCast" VALUES (64,13,64);
INSERT INTO "tblMovieCast" VALUES (65,13,65);
INSERT INTO "tblMovieCast" VALUES (66,13,66);
INSERT INTO "tblMovieCast" VALUES (67,13,67);
INSERT INTO "tblMovieCast" VALUES (68,13,68);
INSERT INTO "tblMovieCast" VALUES (69,13,69);
INSERT INTO "tblMovieCast" VALUES (70,13,70);
INSERT INTO "tblMovieCast" VALUES (72,14,71);
INSERT INTO "tblMovieCast" VALUES (73,14,72);
INSERT INTO "tblMovieCast" VALUES (74,14,73);
INSERT INTO "tblMovieCast" VALUES (75,14,74);
INSERT INTO "tblMovieCast" VALUES (76,14,75);
INSERT INTO "tblMovieCast" VALUES (77,15,76);
INSERT INTO "tblMovieCast" VALUES (78,15,77);
INSERT INTO "tblMovieCast" VALUES (79,15,78);
INSERT INTO "tblMovieCast" VALUES (80,15,79);
INSERT INTO "tblMovieCast" VALUES (81,15,80);
INSERT INTO "tblMovieCast" VALUES (82,15,81);
INSERT INTO "tblMovieCast" VALUES (83,15,82);
INSERT INTO "tblMovieCast" VALUES (84,15,83);
INSERT INTO "tblMovieCast" VALUES (85,16,84);
INSERT INTO "tblMovieCast" VALUES (86,16,85);
INSERT INTO "tblMovieCast" VALUES (87,16,86);
INSERT INTO "tblMovieCast" VALUES (88,16,47);
INSERT INTO "tblMovieCast" VALUES (89,16,87);
INSERT INTO "tblMovieCast" VALUES (90,17,88);
INSERT INTO "tblMovieCast" VALUES (91,17,89);
INSERT INTO "tblMovieCast" VALUES (92,17,1);
INSERT INTO "tblMovieCast" VALUES (93,17,90);
INSERT INTO "tblMovieCast" VALUES (94,17,91);
INSERT INTO "tblMovieCast" VALUES (95,18,92);
INSERT INTO "tblMovieCast" VALUES (96,18,93);
INSERT INTO "tblMovieCast" VALUES (97,18,94);
INSERT INTO "tblMovieCast" VALUES (98,18,95);
INSERT INTO "tblMovieCast" VALUES (99,18,96);
INSERT INTO "tblMovieCast" VALUES (100,19,97);
INSERT INTO "tblMovieCast" VALUES (101,19,98);
INSERT INTO "tblMovieCast" VALUES (102,19,99);
INSERT INTO "tblMovieCast" VALUES (103,19,100);
INSERT INTO "tblMovieCast" VALUES (104,19,101);
INSERT INTO "tblMovieCast" VALUES (105,20,102);
INSERT INTO "tblMovieCast" VALUES (106,20,103);
INSERT INTO "tblMovieCast" VALUES (107,20,104);
INSERT INTO "tblMovieCast" VALUES (108,20,105);
INSERT INTO "tblMovieCast" VALUES (109,20,106);
INSERT INTO "tblActors" VALUES (1,'Brie Larson',29,'Female','http://www.gstatic.com/tv/thumb/persons/230638/230638_v9_ba.jpg');
INSERT INTO "tblActors" VALUES (2,'Samuel L. Jackson',70,'Male','http://www.gstatic.com/tv/thumb/persons/71048/71048_v9_ba.jpg');
INSERT INTO "tblActors" VALUES (3,'Ben Mendelsohn',50,'Male','http://www.gstatic.com/tv/thumb/persons/77856/77856_v9_ba.jpg');
INSERT INTO "tblActors" VALUES (4,'Jude Law',46,'Male','http://www.gstatic.com/tv/thumb/persons/71369/71369_v9_ba.jpg');
INSERT INTO "tblActors" VALUES (5,'Robert Pattinson',32,'Male','http://www.gstatic.com/tv/thumb/persons/487714/487714_v9_bb.jpg');
INSERT INTO "tblActors" VALUES (6,'Juliette Binoche',55,'Female','http://www.gstatic.com/tv/thumb/persons/35253/35253_v9_bb.jpg');
INSERT INTO "tblActors" VALUES (7,'André Benjamin',43,'Male','http://www.gstatic.com/tv/thumb/persons/78809/78809_v9_ba.jpg');
INSERT INTO "tblActors" VALUES (8,'Mia Goth',25,'Female','http://www.gstatic.com/tv/thumb/persons/754303/754303_v9_bb.jpg');
INSERT INTO "tblActors" VALUES (9,'Selma Blair',46,'Female','http://www.gstatic.com/tv/thumb/persons/83280/83280_v9_ba.jpg');
INSERT INTO "tblActors" VALUES (10,'Hero Fiennes Tiffin',21,'Male','http://www.gstatic.com/tv/thumb/persons/522402/522402_v9_ba.jpg');
INSERT INTO "tblActors" VALUES (11,'Peter Gallagher',63,'Male','http://www.gstatic.com/tv/thumb/persons/74144/74144_v9_ba.jpg');
INSERT INTO "tblActors" VALUES (12,'Josephine Langford',21,'Female','https://m.media-amazon.com/images/M/MV5BNGQ2ZWU4NWMtODIzZS00M2E5LWE1MDAtNDVmODc5NmM1MzViXkEyXkFqcGdeQXVyMjQwMDg0Ng@@._V1_UX214_CR0,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (13,'Hugh Jackman',50,'Male','http://www.gstatic.com/tv/thumb/persons/171234/171234_v9_bb.jpg');
INSERT INTO "tblActors" VALUES (14,'Zach Galifianakis',49,'Male','http://www.gstatic.com/tv/thumb/persons/274002/274002_v9_ba.jpg');
INSERT INTO "tblActors" VALUES (15,'Zoe Saldana',40,'Female','http://www.gstatic.com/tv/thumb/persons/194024/194024_v9_bb.jpg');
INSERT INTO "tblActors" VALUES (16,'Timothy Olyphant',50,'Male','http://www.gstatic.com/tv/thumb/persons/164843/164843_v9_ba.jpg');
INSERT INTO "tblActors" VALUES (17,'David Harbour',44,'Male','http://www.gstatic.com/tv/thumb/persons/277640/277640_v9_ba.jpg');
INSERT INTO "tblActors" VALUES (18,'Ian McShane',76,'Male','http://www.gstatic.com/tv/thumb/persons/84420/84420_v9_ba.jpg');
INSERT INTO "tblActors" VALUES (19,'Milla Jovovich',43,'Female','http://www.gstatic.com/tv/thumb/persons/871/871_v9_ba.jpg');
INSERT INTO "tblActors" VALUES (20,'Penelope Mitchell',27,'Female','http://www.gstatic.com/tv/thumb/persons/706636/706636_v9_ba.jpg');
INSERT INTO "tblActors" VALUES (21,'Luke Treadaway',34,'Male','https://m.media-amazon.com/images/M/MV5BMjMxMTM3NzY0Ml5BMl5BanBnXkFtZTgwMTI5MjQ1MzE@._V1_UX214_CR0,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (22,'Bob Marley',12,'Male','https://m.media-amazon.com/images/M/MV5BNjNhZDM5NjctMTE0Yi00ZGI3LWJkNTAtMzQ5YTJmZWQ4ODUyL2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyMTExNDQ2MTI@._V1_UY98_CR9,0,67,98_AL_.jpg');
INSERT INTO "tblActors" VALUES (23,'Ruta Gedmintas',35,'Female','https://m.media-amazon.com/images/M/MV5BMTQ0OTU4NjgyMF5BMl5BanBnXkFtZTcwNDAyMzcxOA@@._V1_UY317_CR86,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (24,'Joanne Froggatt',38,'Female','https://m.media-amazon.com/images/M/MV5BODg4ODkzOTMzNF5BMl5BanBnXkFtZTgwMjA4MDgxNDE@._V1_UX214_CR0,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (25,'Anthony Head',65,'Male','https://m.media-amazon.com/images/M/MV5BMTI3NDQ3NTMwNF5BMl5BanBnXkFtZTYwMzY4NjEz._V1_UY317_CR0,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (26,'Kareem Abdul-Jabbar',72,'Male','https://m.media-amazon.com/images/M/MV5BMjExMDAxNTkwNF5BMl5BanBnXkFtZTcwODUxMjI0MQ@@._V1_UY317_CR10,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (27,'Lloyd Bridges',106,'Male','https://m.media-amazon.com/images/M/MV5BMTIzNjM5NTQ4MV5BMl5BanBnXkFtZTYwMzgwMTM2._V1_UY317_CR22,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (28,'Peter Graves',93,'Male','https://m.media-amazon.com/images/M/MV5BMTQ1OTA1NjQwOF5BMl5BanBnXkFtZTcwOTc5MDUyMw@@._V1_UX214_CR0,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (29,'Julie Hagerty',63,'Female','https://m.media-amazon.com/images/M/MV5BNjU4NzU4ODU1N15BMl5BanBnXkFtZTYwMDk1NzU1._V1_UY317_CR14,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (30,'Robert Hays',71,'Male','https://m.media-amazon.com/images/M/MV5BMTYyNTA0NDY5NF5BMl5BanBnXkFtZTgwMDg0NzgzMTE@._V1_UY317_CR26,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (31,'Leslie Nielsen',93,'Male','https://m.media-amazon.com/images/M/MV5BMTI3MTE1NjM4N15BMl5BanBnXkFtZTYwNzI3MTI0._V1_UX214_CR0,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (32,'Lorna Patterson',62,'Female','https://m.media-amazon.com/images/M/MV5BMTkxMDExMjIwNl5BMl5BanBnXkFtZTcwMDkxMjUxOA@@._V1_UY317_CR8,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (33,'Robert Stack',100,'Male','https://m.media-amazon.com/images/M/MV5BMTg4OTQ2OTAwMV5BMl5BanBnXkFtZTYwMzk4NDM2._V1_UY317_CR0,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (34,'Otto Steve',40,'Male','https://m.media-amazon.com/images/M/MV5BOTQyMTdlMDgtN2ViMC00ODAyLTg2ZWQtNjMyNmU3ZGMyMmEwXkEyXkFqcGdeQXVyMTExNDQ2MTI@._V1_UY317_CR33,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (35,'Stephen Stucker',71,'Male','https://m.media-amazon.com/images/M/MV5BZjllYmZkZTMtODI5Yy00MjMxLWFmNmQtZTQwMDNkMzI2NzdiXkEyXkFqcGdeQXVyMTI3MDk3MzQ@._V1_SX1777_CR0,0,1777,999_AL_.jpg');
INSERT INTO "tblActors" VALUES (36,'Ed Helms',45,'Male','https://m.media-amazon.com/images/M/MV5BMTk2MDQwODEwNV5BMl5BanBnXkFtZTcwNjc4MTY0NA@@._V1_UY317_CR17,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (37,'Varun Dhawan',31,'Male','https://m.media-amazon.com/images/M/MV5BMjM0NTM3ODY4Ml5BMl5BanBnXkFtZTgwNTA4MDM0OTE@._V1_UY317_CR3,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (38,'Alia Bhatt',26,'Female','https://m.media-amazon.com/images/M/MV5BMTczMzY3Nzk5MV5BMl5BanBnXkFtZTgwMjIyMDU0OTE@._V1_UX214_CR0,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (39,'Aditya Roy Kapoor',33,'Male','https://m.media-amazon.com/images/M/MV5BZmNlODEzM2YtOTUyOS00MDVmLTk4YzgtMzAxZmQ2ZDBkNTAyXkEyXkFqcGdeQXVyMTExNDQ2MTI@._V1_UY317_CR8,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (40,'Madhuri Dixit',51,'Female','https://m.media-amazon.com/images/M/MV5BNTk0OTFkZGItYTQxMi00YTUwLTlkMGEtMTIyZDNlNDc0MzRlXkEyXkFqcGdeQXVyMTgzNTY5OTc@._V1_UY317_CR51,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (41,'Sonakshi Sinha',31,'Female','https://m.media-amazon.com/images/M/MV5BMTgxMTUyNDg2NF5BMl5BanBnXkFtZTgwOTAyMTIzOTE@._V1_UY317_CR9,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (42,'Sanjay Dutt',59,'Male','https://m.media-amazon.com/images/M/MV5BNzU2NTgwNzY1OF5BMl5BanBnXkFtZTcwMjQxNzcxOA@@._V1_UY317_CR131,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (43,'Kunal Khemu',35,'Male','https://m.media-amazon.com/images/M/MV5BMmJiYjIwODctYjZlMy00M2IzLWI2OTItNDRiODZkNzcxNzllXkEyXkFqcGdeQXVyMTExNDQ2MTI@._V1_UY317_CR5,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (44,'Pawan Chopra',67,'Male','https://m.media-amazon.com/images/M/MV5BNjFiZmZkODUtMGQ5ZC00YzY2LWEwODAtMjk5ZmNmODZhY2Y3XkEyXkFqcGdeQXVyNDAzNDk0MTQ@._V1_UY98_CR10,0,67,98_AL_.jpg');
INSERT INTO "tblActors" VALUES (45,'Jason Clarke',49,'Male','https://m.media-amazon.com/images/M/MV5BNzU5ODU0MzY1MV5BMl5BanBnXkFtZTcwMTY2MDE4OA@@._V1_UX214_CR0,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (46,'Amy Seimetz',37,'Female','https://m.media-amazon.com/images/M/MV5BMTcxNzQyNTkyOV5BMl5BanBnXkFtZTgwMTcwMTEyMDE@._V1_UY317_CR3,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (47,'John Lithgow',73,'Male','https://m.media-amazon.com/images/M/MV5BMTQzMzUyNDkzNF5BMl5BanBnXkFtZTcwNTMwNTU5MQ@@._V1_UY317_CR19,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (48,'Jete Laurence',14,'Female','https://m.media-amazon.com/images/M/MV5BM2Q5NjA0ZTMtZWM4Yi00ZjkxLWIyNTYtMzcyYjBiMTdhNWI5XkEyXkFqcGdeQXVyNjg2NjQwMDQ@._V1_UY317_CR130,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (49,'Obssa Ahmed',18,'Male','https://m.media-amazon.com/images/M/MV5BMTQ0Y2NlYjMtNGY0ZS00Nzk0LWFiYzItMTFhOTc5NTk0MTU2XkEyXkFqcGdeQXVyOTM1MTM4MTk@._V1_UX214_CR0,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (50,'Alyssa Brooke Levine',12,'Female','https://m.media-amazon.com/images/M/MV5BOTkyNzcxN2ItNWUzMS00MmI3LWFmYjYtMzZjMmYwMTMxOWY1XkEyXkFqcGdeQXVyOTEzMzU4NTY@._V1_UY317_CR20,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (51,'Maria Herrera',49,'Female','https://m.media-amazon.com/images/M/MV5BMzcwZmM5YWItOWJlMi00ZTcwLTg0MjYtM2ZhNDg1ZTRlMjkxXkEyXkFqcGdeQXVyMjQwMDg0Ng@@._V1_UX214_CR0,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (52,'Frank Schorpion',73,'Male','https://m.media-amazon.com/images/M/MV5BZDZhODUzNzMtN2FiYy00NzM5LWE3MDMtYmExMGEyZjVkNmJiXkEyXkFqcGdeQXVyODYxOTEyMzQ@._V1_UY317_CR131,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (53,'Sonia Maria Chirila',45,'Female','https://m.media-amazon.com/images/M/MV5BMmUyYWQ0OWEtNmY2ZS00MTljLTllNGMtYWY5ZWQxYzZkMzVhXkEyXkFqcGdeQXVyNTQ3MTg1NTk@._V1_UY317_CR20,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (54,'Naomi Frenette',32,'Female','https://m.media-amazon.com/images/M/MV5BZDMwMDY0NTMtYTVmMy00NDU2LWE2OTAtN2E0OWFhMjg5ODc5XkEyXkFqcGdeQXVyMjkyNTM2Mzg@._V1_UX214_CR0,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (55,'Suzi Stingl',51,'Female','https://m.media-amazon.com/images/M/MV5BOWRmZDc3YTktNTlhNy00MzcwLThlMTItNzUzN2Q4MDhlZWIxXkEyXkFqcGdeQXVyODk4MDI2NTQ@._V1_UY317_CR12,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (56,'Kelly Lee',32,'Female','https://m.media-amazon.com/images/M/MV5BMzM4ZWZhM2EtNzhjYS00OWNmLTk4MDEtYzllYmNmNWE4ZGY5XkEyXkFqcGdeQXVyNzkxNDI2Njg@._V1_UY317_CR20,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (57,'Ryan Gosling',38,'Male','https://m.media-amazon.com/images/M/MV5BMTQzMjkwNTQ2OF5BMl5BanBnXkFtZTgwNTQ4MTQ4MTE@._V1_UY317_CR18,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (58,'Harrison Ford ',76,'Male','https://m.media-amazon.com/images/M/MV5BMTY4Mjg0NjIxOV5BMl5BanBnXkFtZTcwMTM2NTI3MQ@@._V1_UX214_CR0,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (59,'Jared Leto ',47,'Male','https://m.media-amazon.com/images/M/MV5BMTczMjUwNDUzMF5BMl5BanBnXkFtZTgwNDA4OTAzMTE@._V1_UX214_CR0,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (60,'Robin Wright',53,'Female','https://m.media-amazon.com/images/M/MV5BMTU0NTc4MzEyOV5BMl5BanBnXkFtZTcwODY0ODkzMQ@@._V1_UY317_CR4,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (61,'Tom Hanks',62,'Male','https://m.media-amazon.com/images/M/MV5BMTQ2MjMwNDA3Nl5BMl5BanBnXkFtZTcwMTA2NDY3NQ@@._V1_UY317_CR2,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (62,'Sally Field ',72,'Female ','https://m.media-amazon.com/images/M/MV5BMTQwOTMyMDI4MV5BMl5BanBnXkFtZTcwMDYzMTM5OA@@._V1_UY317_CR8,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (63,'Hanna Hall',34,'Female','https://m.media-amazon.com/images/M/MV5BMjEyNzk3NjcyM15BMl5BanBnXkFtZTYwMTE0MTEz._V1_UX214_CR0,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (64,'Tim Roth ',57,'Male ','https://m.media-amazon.com/images/M/MV5BMjA5NTA3MDQyOV5BMl5BanBnXkFtZTcwODM4NDE3Mw@@._V1_UY317_CR16,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (65,'John Travolta',65,'Male','https://m.media-amazon.com/images/M/MV5BMTUwNjQ0ODkxN15BMl5BanBnXkFtZTcwMDc5NjQwNw@@._V1_UY317_CR11,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (66,'Samuel L. Jackson',70,'Male','https://m.media-amazon.com/images/M/MV5BMTQ1NTQwMTYxNl5BMl5BanBnXkFtZTYwMjA1MzY1._V1_UX214_CR0,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (67,'Uma Thurman',48,'Female','https://m.media-amazon.com/images/M/MV5BMjMxNzk1MTQyMl5BMl5BanBnXkFtZTgwMDIzMDEyMTE@._V1_UX214_CR0,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (68,'Bruce Willis ',64,'Male','https://m.media-amazon.com/images/M/MV5BMjA0MjMzMTE5OF5BMl5BanBnXkFtZTcwMzQ2ODE3Mw@@._V1_UY317_CR27,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (69,'Amanda Plummer',62,'Female','https://m.media-amazon.com/images/M/MV5BMTYwNjIyNTY3NF5BMl5BanBnXkFtZTcwOTUwMzg4OA@@._V1_UX214_CR0,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (70,'Eric Stoltz',57,'Male','https://m.media-amazon.com/images/M/MV5BMTc1Njc5MjQyOF5BMl5BanBnXkFtZTYwNzQzNzgz._V1_UY317_CR6,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (71,'Brad Pitt',55,'Male','https://m.media-amazon.com/images/M/MV5BMjA1MjE2MTQ2MV5BMl5BanBnXkFtZTcwMjE5MDY0Nw@@._V1_UX214_CR0,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (72,'Edward Norton ',49,'Male','https://m.media-amazon.com/images/M/MV5BMTYwNjQ5MTI1NF5BMl5BanBnXkFtZTcwMzU5MTI2Mw@@._V1_UY317_CR16,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (73,'Helena Bonham Carter',52,'Female','https://m.media-amazon.com/images/M/MV5BMTUzMzUzMDg5MV5BMl5BanBnXkFtZTcwMDA5NDMwNA@@._V1_UY317_CR4,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (74,'Rachel Singer',56,'Female','https://m.media-amazon.com/images/M/MV5BMjMyNzA3NjQ0MF5BMl5BanBnXkFtZTgwNzc3NDUwNDE@._V1_UX214_CR0,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (75,'Michael Lee Aday',71,'Male','https://m.media-amazon.com/images/M/MV5BMTIzNTQ4MjYyOV5BMl5BanBnXkFtZTcwNzgwNTEzMg@@._V1_UY317_CR6,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (76,'Jean Reno ',70,'Male','https://m.media-amazon.com/images/M/MV5BMTgzNjA1MjY2M15BMl5BanBnXkFtZTYwMjgzOTk0._V1_UX214_CR0,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (77,'Natalie Portman ',37,'Female','https://m.media-amazon.com/images/M/MV5BMTQ3ODE3Mjg1NV5BMl5BanBnXkFtZTcwNzA4ODcxNA@@._V1_UY317_CR11,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (78,'Gary Oldman ',61,'Male ','https://m.media-amazon.com/images/M/MV5BMTc3NTM4MzQ5MV5BMl5BanBnXkFtZTcwOTE4MDczNw@@._V1_UY317_CR0,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (79,'Michael Badalucco',64,'Male','https://m.media-amazon.com/images/M/MV5BMTQxNTAxMjI3N15BMl5BanBnXkFtZTYwODY4MTg1._V1_UY317_CR8,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (80,'Ellen Greene',68,'Female','https://m.media-amazon.com/images/M/MV5BMTY3OTQ5NDYyN15BMl5BanBnXkFtZTcwOTgzNjcwNw@@._V1_UX214_CR0,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (81,'Elizabeth Regen',44,'Female','https://m.media-amazon.com/images/M/MV5BMTU3NzA1ODQ2OV5BMl5BanBnXkFtZTcwNDU5OTAzMQ@@._V1_UY317_CR2,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (82,'Frank Senger',61,'Male','https://m.media-amazon.com/images/M/MV5BMTM1Njk4NTEyOV5BMl5BanBnXkFtZTYwNDI2Mzgy._V1_UY317_CR108,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (83,'Danny Aiello',85,'Male','https://m.media-amazon.com/images/M/MV5BNTMxMjYzNzk5Nl5BMl5BanBnXkFtZTcwNzU4NDgwMw@@._V1_UY317_CR43,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (84,'Mike Myers',55,'Male','https://m.media-amazon.com/images/M/MV5BMTY0MTM1MTM5Nl5BMl5BanBnXkFtZTcwNzA1OTM3MQ@@._V1_UX214_CR0,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (85,'Eddie Murphy',58,'Male','https://m.media-amazon.com/images/M/MV5BMTc0NDQzODAwNF5BMl5BanBnXkFtZTYwMzUzNTk3._V1_UY317_CR6,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (86,'Cameron Diaz',47,'Female','https://m.media-amazon.com/images/M/MV5BMTkxNTI5NzM4MV5BMl5BanBnXkFtZTcwMTI3ODY3Mg@@._V1_UY317_CR0,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (87,'Vincent Cassel',53,'Male','https://m.media-amazon.com/images/M/MV5BMTc1NDUzMzM5MV5BMl5BanBnXkFtZTcwNzY1OTYyOQ@@._V1_UX214_CR0,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (88,'Jonah Hill',35,'Male','https://m.media-amazon.com/images/M/MV5BMTUyNDU0NzAwNl5BMl5BanBnXkFtZTcwMzQxMzIzNw@@._V1_UY317_CR28,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (89,'Channing Tatum',39,'Male','https://m.media-amazon.com/images/M/MV5BMTc4OTI3Mzg2Nl5BMl5BanBnXkFtZTcwMDAxNTU3OA@@._V1_UX214_CR0,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (90,'Dave Franco',33,'Male','https://m.media-amazon.com/images/M/MV5BNzEzMzYzMzYxMV5BMl5BanBnXkFtZTcwNTk2MDg4NQ@@._V1_UY317_CR13,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (91,'Rob Riggle',49,'Male','https://m.media-amazon.com/images/M/MV5BMjA4MDc5MzI5N15BMl5BanBnXkFtZTgwMDMzODc3NjE@._V1_UY317_CR51,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (92,'Jim Carrey',57,'Male','https://m.media-amazon.com/images/M/MV5BMTQwMjAwNzI0M15BMl5BanBnXkFtZTcwOTY1MTMyOQ@@._V1_UY317_CR22,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (93,'Ed Harris',68,'Male','https://m.media-amazon.com/images/M/MV5BMjE4NDM4ODc2OV5BMl5BanBnXkFtZTcwNzA5NjQ5MQ@@._V1_UY317_CR7,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (94,'Laura Linney',55,'Female','https://m.media-amazon.com/images/M/MV5BMTMyMDc3Mzc2M15BMl5BanBnXkFtZTcwMjc5OTcyMg@@._V1_UY317_CR7,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (95,'Noah Emmerich',54,'Male','https://m.media-amazon.com/images/M/MV5BMTA5ODA1MDM2NDBeQTJeQWpwZ15BbWU4MDM4MDA3MDAy._V1_UX214_CR0,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (96,'Natascha McElhone',49,'Female','https://m.media-amazon.com/images/M/MV5BN2Y2Yzg3MTktMDI0Yi00MTRhLWI5YzQtMmVmN2I3MTcwNzY2L2ltYWdlXkEyXkFqcGdeQXVyMzI1NjU1NTA@._V1_UX214_CR0,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (97,'Kevin Spacey',59,'Male','https://m.media-amazon.com/images/M/MV5BMTY1NzMyODc3Nl5BMl5BanBnXkFtZTgwNzE2MzA1NDM@._V1_UY317_CR87,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (98,'Dave Foley',56,'Male','https://m.media-amazon.com/images/M/MV5BNjQ4MDRjZDEtN2YxMS00YmM4LWE2NTEtNWIxOTU0Mzg1MDczXkEyXkFqcGdeQXVyNzk0NjM2Nw@@._V1_UX214_CR0,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (99,'Julia Louis-Dreyfus',58,'Female','https://m.media-amazon.com/images/M/MV5BMTYzMDM2MTg2Nl5BMl5BanBnXkFtZTcwODQ0OTA1Mg@@._V1_UY317_CR7,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (100,'Hayden Panettiere',29,'Female','https://m.media-amazon.com/images/M/MV5BOTY2OTI1NzA0NV5BMl5BanBnXkFtZTcwOTczMTA2Mw@@._V1_UY317_CR13,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (101,'Phyllis Diller',101,'Female','https://m.media-amazon.com/images/M/MV5BMTI3ODUwMTE3MV5BMl5BanBnXkFtZTYwMDU4Nzc4._V1_UY317_CR13,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (102,'Daniel Craig',51,'Male','https://m.media-amazon.com/images/M/MV5BMjEzMjk4NDU4MF5BMl5BanBnXkFtZTcwMDMyNjQzMg@@._V1_UX214_CR0,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (103,'Sienna Miller',37,'Female','https://m.media-amazon.com/images/M/MV5BNTU0MDcwMzAxM15BMl5BanBnXkFtZTgwMjAwMzA0NTM@._V1_UY317_CR11,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (104,'Michael Gambon',78,'Male','https://m.media-amazon.com/images/M/MV5BMTY3OTc4MTgyN15BMl5BanBnXkFtZTcwNTAxNjA3Mg@@._V1_UY317_CR10,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (105,'Sally Hawkins',43,'Female','https://m.media-amazon.com/images/M/MV5BODE4MDE0MDEzMl5BMl5BanBnXkFtZTgwNjI1NTU5MDE@._V1_UY317_CR14,0,214,317_AL_.jpg');
INSERT INTO "tblActors" VALUES (106,'Kenneth Cranham',74,'Male','https://m.media-amazon.com/images/M/MV5BMjAwNjE3Njg5Ml5BMl5BanBnXkFtZTcwNzc4MDcwOA@@._V1_UY317_CR10,0,214,317_AL_.jpg');
INSERT INTO "tblMovies" VALUES (1,'Hellboy4','Based on the graphic novels by Mike Mignola, Hellboy, caught between the worlds of the supernatural and human, battles an ancient sorceress bent on revenge.','121 mins','Action, Adventure, Fantasy, Horror, Sci-Fi','12 Apr 2019','https://m.media-amazon.com/images/M/MV5BYTMyYjg0MTItYTcyZS00MmRiLWIxNWQtYTRiZjRkYWMxZGNkXkEyXkFqcGdeQXVyNjg2NjQwMDQ@._V1_SX300.jpg','https://www.youtube.com/watch?v=ZsBO4b3tyZg');
INSERT INTO "tblMovies" VALUES (2,'Missing Link','Mr. Link recruits explorer Sir Lionel Frost to help find his long-lost relatives in the fabled valley of Shangri-La. Along with adventurer Adelina Fortnight, this trio of explorers travel the world to help their new friend.','95 min','Animation, Adventure, Comedy, Family, Fantasy','12 Apr 2019','https://m.media-amazon.com/images/M/MV5BMWFmNWZmZWYtMWM3OC00YTYyLWIxNDMtOTRjNzhiYWQ0MDIwXkEyXkFqcGdeQXVyODk2NDQ3MTA@._V1_SX300.jpg','https://www.youtube.com/watch?v=-6jCNhebfg8');
INSERT INTO "tblMovies" VALUES (3,'After','A young woman falls for a guy with a dark secret and the two embark on a rocky relationship. Based on the novel by Anna Todd.','N/A','Drama, Romance','12 Apr 2019','https://m.media-amazon.com/images/M/MV5BOGUwMjk3YzktNDI0Yy00MzFiLWFjNmEtYTA2ODVjMzNhODhjXkEyXkFqcGdeQXVyOTQ1MDI4MzY@._V1_SX300.jpg','https://www.youtube.com/watch?v=31JE25Cw-iQ');
INSERT INTO "tblMovies" VALUES (4,'High Life','A father and his daughter struggle to survive in deep space where they live in isolation.','110 min','Adventure, Drama, Horror, Mystery, Sci-Fi','12 Apr 2019','https://m.media-amazon.com/images/M/MV5BMDNjN2NjYmItMjAyZi00NmNkLWJmYTQtYzcwZGRiM2RmNGNlXkEyXkFqcGdeQXVyODUxNjcxNjE@._V1_SX300.jpg','https://www.youtube.com/watch?v=AtOwfo1ypOw');
INSERT INTO "tblMovies" VALUES (5,'Captain Marvel','Carol Danvers becomes one of the universe''s most powerful heroes when Earth is caught in the middle of a galactic war between two alien races.','400 minutes','Action, Adventure, Sci-Fi','08 Mar 2019','https://m.media-amazon.com/images/M/MV5BMTE0YWFmOTMtYTU2ZS00ZTIxLWE3OTEtYTNiYzBkZjViZThiXkEyXkFqcGdeQXVyODMzMzQ4OTI@._V1_SX300.jpg','https://www.youtube.com/watch?v=0LHxvxdRnYc');
INSERT INTO "tblMovies" VALUES (8,'Penguins','The story of Steve, an Adélie penguin, on a quest to find a life partner and start a family. When Steve meets with Wuzzo the emperor penguin they become friends. But nothing comes easy in the icy Antarctic.','76 min','Documentary','17 April 2019','https://m.media-amazon.com/images/M/MV5BMjA4NDc2Njc3MV5BMl5BanBnXkFtZTgwMTcyNTAwNzM@._V1_UX182_CR0,0,182,268_AL_.jpg','https://www.youtube.com/watch?v=VubxHFy7ocE');
INSERT INTO "tblMovies" VALUES (9,'Kalank','Set in 1945, in Pre-Independent India, the elite, opulent and solemn world of the Chaudhry family, and the wild, mysterious and musical underbelly of the town, Hira Mandi, clash when Roop Chaudhry encounters Zafar, a daredevil from Hira Mandi, unleashing deep-buried truths, secrets of betrayal and affairs that threaten to bring the both worlds crashing down.','166 min','Drama, Romance','17 April 2019','https://m.media-amazon.com/images/M/MV5BYTg4NWEyMjMtNTM2MS00M2I4LWFjOTQtMDRjNjc0ODI3NmY4XkEyXkFqcGdeQXVyOTc1MDE5NzI@._V1_UY268_CR9,0,182,268_AL_.jpg','https://www.youtube.com/watch?v=p4Z_ueeT_XQ');
INSERT INTO "tblMovies" VALUES (10,'Pet Sematary','Dr. Louis Creed and his wife, Rachel, relocate from Boston to rural Maine with their two young children. The couple soon discover a mysterious burial ground hidden deep in the woods near their new home','101 min','Horror, Mystery, Thriller','04 April 2019','https://m.media-amazon.com/images/M/MV5BMjUyNjg1ODIwMl5BMl5BanBnXkFtZTgwNjMyOTYzNzM@._V1_UX182_CR0,0,182,268_AL_.jpg','https://www.youtube.com/watch?v=zK0LNzU2TQI');
INSERT INTO "tblMovies" VALUES (11,'Blade Runner','A young blade runner''s discovery of a long-buried secret leads him to track down former blade runner Rick Deckard, who''s been missing for thirty years.','164 min','Drama, Mystery, Sci-Fi','05 Oct 2019','https://m.media-amazon.com/images/M/MV5BNzA1Njg4NzYxOV5BMl5BanBnXkFtZTgwODk5NjU3MzI@._V1_UX182_CR0,0,182,268_AL_.jpg','https://www.youtube.com/watch?v=gCcx85zbxz4');
INSERT INTO "tblMovies" VALUES (12,'Forest Gump ','The presidencies of Kennedy and Johnson, the events of Vietnam, Watergate, and other history unfold through the perspective of an Alabama man with an IQ of 75.','142 min','Drama, Romance','07 Oct 1994','https://m.media-amazon.com/images/M/MV5BNWIwODRlZTUtY2U3ZS00Yzg1LWJhNzYtMmZiYmEyNmU1NjMzXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_UY268_CR1,0,182,268_AL_.jpg','https://www.youtube.com/watch?v=bLvqoHBptjg');
INSERT INTO "tblMovies" VALUES (13,'Pulp Fiction','The lives of two mob hitmen, a boxer, a gangster''s wife, and a pair of diner bandits intertwine in four tales of violence and redemption.','154 min','Crime, Drama','21 Oct 1994','https://m.media-amazon.com/images/M/MV5BNGNhMDIzZTUtNTBlZi00MTRlLWFjM2ItYzViMjE3YzI5MjljXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_UY268_CR1,0,182,268_AL_.jpg','https://www.youtube.com/watch?v=s7EdQ4FqbhY');
INSERT INTO "tblMovies" VALUES (14,'Fight Club ','An insomniac office worker and a devil-may-care soapmaker form an underground fight club that evolves into something much, much more.','139 min','Drama','12 Nov 1999','https://m.media-amazon.com/images/M/MV5BMjJmYTNkNmItYjYyZC00MGUxLWJhNWMtZDY4Nzc1MDAwMzU5XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_UX182_CR0,0,182,268_AL_.jpg','https://www.youtube.com/watch?v=SUXWAEX2jlg');
INSERT INTO "tblMovies" VALUES (15,'Leon','Mathilda, a 12-year-old girl, is reluctantly taken in by Léon, a professional assassin, after her family is murdered. Léon and Mathilda form an unusual relationship, as she becomes his protégée and learns the assassin''s trade.','110 min','Action, Crime, Drama','03 Feb 1995','https://m.media-amazon.com/images/M/MV5BZDAwYTlhMDEtNTg0OS00NDY2LWJjOWItNWY3YTZkM2UxYzUzXkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_UY268_CR4,0,182,268_AL_.jpg','https://www.youtube.com/watch?v=jawVxq1Iyl0');
INSERT INTO "tblMovies" VALUES (16,'Shrek','A mean lord exiles fairytale creatures to the swamp of a grumpy ogre, who must go on a quest and rescue a princess for the lord in order to get his land back.','90 min','Animation, Adventure, Comedy','29 June 2001','https://m.media-amazon.com/images/M/MV5BOGZhM2FhNTItODAzNi00YjA0LWEyN2UtNjJlYWQzYzU1MDg5L2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_UX182_CR0,0,182,268_AL_.jpg','https://www.youtube.com/watch?v=W37DlG1i61s');
INSERT INTO "tblMovies" VALUES (17,'21 Jump Street','A pair of underachieving cops are sent back to a local high school to blend in and bring down a synthetic drug ring.','109 min','Action, Comedy, Crime','16 March 2012','https://m.media-amazon.com/images/M/MV5BMTc3NzQ3OTg3NF5BMl5BanBnXkFtZTcwMjk5OTcxNw@@._V1_UX182_CR0,0,182,268_AL_.jpg','https://www.youtube.com/watch?v=RLoKtb4c4W0');
INSERT INTO "tblMovies" VALUES (18,'The Truman Show','An insurance salesman discovers his whole life is actually a reality TV show.','103 min','Comedy, Drama, Sci-Fi','9 October 1998','https://m.media-amazon.com/images/M/MV5BMDIzODcyY2EtMmY2MC00ZWVlLTgwMzAtMjQwOWUyNmJjNTYyXkEyXkFqcGdeQXVyNDk3NzU2MTQ@._V1_UX182_CR0,0,182,268_AL_.jpg','https://www.youtube.com/watch?v=loTIzXAS7v4');
INSERT INTO "tblMovies" VALUES (19,'A Bug''s Life','A misfit ant, looking for "warriors" to save his colony from greedy grasshoppers, recruits a group of bugs that turn out to be an inept circus troupe.','95 min','Animation, Adventure, Comedy','5 February 1999','https://m.media-amazon.com/images/M/MV5BNThmZGY4NzgtMTM4OC00NzNkLWEwNmEtMjdhMGY5YTc1NDE4XkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_UX182_CR0,0,182,268_AL_.jpg','https://www.youtube.com/watch?v=Ljk2YJ53_WI');
INSERT INTO "tblMovies" VALUES (20,'Layer Cake','A successful cocaine dealer gets two tough assignments from his boss on the eve of his planned early retirement.','105 min','Action, Crime, Drama','1 October 2004','https://m.media-amazon.com/images/M/MV5BMTI5MTE1OTAzOV5BMl5BanBnXkFtZTcwNDc2OTgyMQ@@._V1_UX182_CR0,0,182,268_AL_.jpg','https://www.youtube.com/watch?v=e5R4iepdXqo');*/
COMMIT;

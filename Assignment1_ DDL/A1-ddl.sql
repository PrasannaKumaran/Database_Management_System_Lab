drop table sungby;
drop table song;
drop table album;
drop table musician;
drop table artist;
drop table studio;

  create table studio
    ( studio_name varchar(10),
   studio_address varchar(20),
    studio_ph_no number,
    CONSTRAINT pk_studio PRIMARY KEY(studio_name));

  desc studio

  create table artist(
    artist_id varchar(10),
    artist_name varchar(15),
    CONSTRAINT pk_artist PRIMARY KEY(artist_id),
    CONSTRAINT uniq_name UNIQUE(artist_name));
  desc artist

  create table musician(
    musician_id varchar(10),
    musician_name varchar(20),
    birthplace varchar(10),
    CONSTRAINT pk_musician PRIMARY KEY(musician_id));

  desc musician

  create table album(
    album_id varchar(20),
    album_name varchar(15),
    year_of_release number,
    no_of_tracks number NOT NULL,
    studio_name varchar(10),
    album_genre varchar(10),
    musician_id varchar(10),
    CONSTRAINT pk_album PRIMARY KEY(album_id),
   CONSTRAINT check_year CHECK (year_of_release > 1945),
   CONSTRAINT check_genre CHECK (album_genre IN ('CAR','DIV','MOV','POP')),
   CONSTRAINT for_studio FOREIGN KEY(studio_name) REFERENCES STUDIO(studio_name) ON DELETE CASCADE,
   CONSTRAINT for_mus FOREIGN KEY(musician_id) REFERENCES MUSICIAN(musician_id) ON DELETE CASCADE);


  desc album

  create table song(
    album_id varchar(10),
    track_no number,
    song_name varchar(10),
    song_length number,
    song_genre varchar(10),
    CONSTRAINT pk_song PRIMARY KEY(album_id,track_no),
    CONSTRAINT check_songlen CHECK (((song_length > 7) AND (song_genre = 'PAT')) OR (song_genre<>'PAT')),
    CONSTRAINT check_sgenre CHECK (song_genre IN ('PHI','REL','LOV','DEV','PAT')),
   CONSTRAINT for_albid FOREIGN KEY(album_id) REFERENCES ALBUM(album_id) ON DELETE CASCADE);

  desc song

  create table sungby(
    album_id varchar(10),
    artist_id varchar(10),
    track_no number,
    recording_date DATE,
    CONSTRAINT pk_sungby PRIMARY KEY(album_id,artist_id,track_no),
    CONSTRAINT fk_aid FOREIGN KEY(album_id) REFERENCES ALBUM(album_id) ON DELETE CASCADE,
    CONSTRAINT fk_track FOREIGN KEY(album_id,track_no) REFERENCES SONG(album_id,track_no) ON DELETE CASCADE,
    CONSTRAINT fk_artid FOREIGN KEY(artist_id) REFERENCES ARTIST(artist_id) ON DELETE CASCADE);

  desc sungby

  insert into studio values('emusic','NYC','123');

  insert into studio values('rmusic','ELI','345');
  
  insert into studio values('lmusic','Lwn','314');

  insert into artist values('1','Eminem');

  insert into artist values('2','Rihana');

  insert into artist values('3','Lil');
 
  insert into musician values('1','Edsheeran','Ireland');

  insert into musician values('2','LilWayne','USA');

  insert into musician values('3','Shakira','USA');

  insert into album values('1','Kamikaze','2018','10','emusic','POP','1');

  insert into album values('2','Anti','2019','11','rmusic','MOV','1');

  insert into album values('3','Work','2015','11','rmusic','MOV','1');

  insert into song values('1','4','River','5','PHI');

  insert into song values('2','5','Diamonds','9','REL');

  insert into song values('3','6','Shine','4','REL');

  insert into sungby values('1','1','4','27-DEC-21');

  insert into sungby values('2','2','5','17-DEC-21');
 
  insert into sungby values('3','2','7','11-DEC-20');
   
  select * from studio;
  select* from artist;
  select * from musician;
  select * from album;
  select * from song;
  select * from sungby;

REM: 1) The genre for Album can be generally categorized as CAR for Carnatic, DIV for
Divine, MOV for Movies, POP for Pop songs.

REM : CONSTRAINT ENCOUNTERED

      insert into album values('4','recovery','2010','9','emusic','NAT','1');

REM : SUCCESS 
         
      insert into album values('4','recovery','2010','9','emusic','POP','1');

REM: 2) The genre for Song can be PHI for philosophical, REL for relationship, LOV for
duet, DEV for devotional, PAT for patriotic type of songs.

REM: CONSTRAINT ENCOUNTERED

     insert into song values('1','7','RapGod','10','NAT');

REM: SUCCESS

     insert into song values('1','7','RapGod','10','REL');

REM: 3) The artist ID, album ID, musician ID, and track number, studio name are used to
retrieve tuple(s) individually from respective relations.

REM: CONSTRAINT ENCOUNTERED

     insert into artist values('1','Eminem');

     insert into album values('1','Kamikaze','2018','10','emusic','POP','1');
  
     insert into musician values('2','LilWayne','USA');

     insert into studio values('emusic','NYC','123');

REM: 4) Ensure that the artist, musician, song, sungby and studio can not be removed
without deleting the album details.

REM: CONSTRAINT ENCOUNTERED

     delete from artist where artist_id = '2';
 
     delete from musician where musician_name = 'Edsheeran';

REM: 5) A song may be sung by more than one artist. The same artist may sing for more
than one track in the same album. Similarly an artist can sing for different
album(s).

REM: CONSTRAINT ENCOUNTERED

     insert into sungby values('2','2','5','17-DEC-21');

REM: SUCCESS
 
     insert into sungby values('2','1','5','17-DEC-21');

REM: 6) It was learnt that the artists do not have the same name.

REM: CONSTRAINT ENCOUNTERED

     insert into artist values('1','Eminem');

REM: SUCCESS
  
     insert into artist values('4','SID');

REM: 7) The number of tracks in an album must always be recorded

REM: CONSTRAINT ENCOUNTERED

     insert into album values('5','AkonBlues','2007','','emusic','POP','2');

REM: SUCCESS
     
     insert into album values('5','AkonBlues','2007','8','emusic','POP','2');

REM: 8) The length of each song must be greater than 7 for PAT songs.

REM: CONSTRAINT ENCOUNTERED

     insert into song values('1','6','rapDog','5','PAT');

REM: SUCCESS
    
     insert into song values('1','6','rapDog','10','PAT');

REM: 9) The year of release of an album can not be earlier than 1945.

REM: CONSTRAINT VIOLATED

     insert into album values('5','WorldTour','1932','41','rmusic','MOV','2');

REM: SUCCESS     

     insert into album values('5','WorldTour','1982','41','rmusic','MOV','2');

REM: 10)It is necessary to represent the gender of an artist in the table.
	
     ALTER TABLE artist ADD gender varchar(10);
     
     insert into artist values ('3','Lilwayne','Male');
     
     select* from artist;


REM: 11)The first few words of the lyrics constitute the song name. The song name do
not accommodate some of the words (in lyrics).


REM: 12)The phone number of each studio should be different.

REM: CONSTRAINT VIOLATED

     insert into studio values('lmusic','CHI','123');

REM: SUCCESS	

     insert into studio values('lmusic','CHI','412');

REM: 13)An artist who sings a song for a particular track of an album can not be recorded
without the record_date.

REM: CONSTRAINT VIOLATED

     ALTER TABLE sungby MODIFY recording_date DATE NOT NULL;

     insert into sungby values('1','1','9','');

REM: SUCCESS

     insert into sungby values('1','1','9','17-NOV-20');

REM: 14)It was decided to include the genre NAT for nature songs

     ALTER TABLE song DROP CONSTRAINT check_sgenre;

     ALTER TABLE song ADD CONSTRAINT check_sgenre CHECK ( song_genre IN('PHI','REL','LOV','DEV','PAT','NAT'));

     insert into song values('1','7','Fall','10','NAT');

REM: 15)Due to typoerror, there may be a possibility of false information. Hence while deleting the song information, make sure that all the corresponding information are
also deleted

     delete from song where album_id = '1';

CREATE DATABASE skilvulmusic;

-- Use database
USE skilvulmusic;

-- Table: Album
CREATE TABLE Album (
    album_id int NOT NULL AUTO_INCREMENT,
    name varchar(255),
    singer_id int,
    CONSTRAINT PK_Album PRIMARY KEY (album_id)
);

-- Table: Playlist
CREATE TABLE Playlist (
    playlist_id int NOT NULL AUTO_INCREMENT,
    user_id int,
    tracks int,
    CONSTRAINT PK_Playlist PRIMARY KEY (playlist_id)
);

-- Table: Playlist_Track
CREATE TABLE Playlist_Track (
    id int NOT NULL,
    playlist_id int,
    track_id int,
    CONSTRAINT PK_PlaylistTrack PRIMARY KEY (id)
);

-- Table: Singer
CREATE TABLE Singer (
    singer_id int NOT NULL AUTO_INCREMENT,
    name varchar(255),
    CONSTRAINT PK_Singer PRIMARY KEY (singer_id)
);

-- Table: Track
CREATE TABLE Track (
    track_id int NOT NULL AUTO_INCREMENT,
    title varchar(255),
    singer_id int,
    album_id int,
    CONSTRAINT PK_Track PRIMARY KEY (track_id)
);

-- Table: User
CREATE TABLE User (
    user_id int NOT NULL AUTO_INCREMENT,
    name varchar(255),
    email varchar(255),
    password varchar(255),
    CONSTRAINT PK_User PRIMARY KEY (user_id)
);

-- foreign keys
-- Reference: FK_Playlist (table: Playlist_Track)
ALTER TABLE Playlist_Track ADD CONSTRAINT FK_Playlist FOREIGN KEY (playlist_id)
    REFERENCES Playlist (playlist_id);

-- Reference: FK_Track (table: Playlist_Track)
ALTER TABLE Playlist_Track ADD CONSTRAINT FK_Track FOREIGN KEY (track_id)
    REFERENCES Track (track_id);

-- Reference: FK_TrackAlbum (table: Track)
ALTER TABLE Track ADD CONSTRAINT FK_TrackAlbum FOREIGN KEY (album_id)
    REFERENCES Album (album_id);

-- Reference: FK_UserPlaylist (table: Playlist)
ALTER TABLE Playlist ADD CONSTRAINT FK_UserPlaylist FOREIGN KEY (user_id)
    REFERENCES User (user_id);

-- Reference: FK_TrackSinger (table: Track)
ALTER TABLE Track ADD CONSTRAINT FK_SingerTrack FOREIGN KEY (singer_id)
    REFERENCES Singer (singer_id);
CREATE DATABASE skilvulmusic;

-- Use database
USE skilvulmusic;

-- Table: album
CREATE TABLE album (
    album_id int NOT NULL AUTO_INCREMENT,
    name varchar(128),
    singer_id int,
    CONSTRAINT PK_album PRIMARY KEY (album_id)
);

-- Table: playlist
CREATE TABLE playlist (
    playlist_id int NOT NULL AUTO_INCREMENT,
    user_id int,
    tracks int,
    CONSTRAINT PK_playlist PRIMARY KEY (playlist_id)
);

-- Table: playlist_track
CREATE TABLE playlist_track (
    id int NOT NULL,
    playlist_id int,
    track_id int,
    CONSTRAINT PK_playlisttrack PRIMARY KEY (id)
);

-- Table: singer
CREATE TABLE singer (
    singer_id int NOT NULL AUTO_INCREMENT,
    name varchar(255),
    CONSTRAINT PK_singer PRIMARY KEY (singer_id)
);

-- Table: track
CREATE TABLE track (
    track_id int NOT NULL AUTO_INCREMENT,
    title varchar(255),
    singer_id int,
    album_id int,
    CONSTRAINT PK_track PRIMARY KEY (track_id)
);

-- Table: user
CREATE TABLE user (
    user_id int NOT NULL AUTO_INCREMENT,
    name varchar(255),
    email varchar(255),
    password varchar(255),
    CONSTRAINT PK_user PRIMARY KEY (user_id)
);

-- foreign keys
-- Reference: FK_playlist (table: playlist_track)
ALTER TABLE playlist_track ADD CONSTRAINT FK_playlist FOREIGN KEY (playlist_id)
    REFERENCES playlist (playlist_id);

-- Reference: FK_track (table: playlist_track)
ALTER TABLE playlist_track ADD CONSTRAINT FK_track FOREIGN KEY (track_id)
    REFERENCES track (track_id);

-- Reference: FK_trackalbum (table: track)
ALTER TABLE track ADD CONSTRAINT FK_trackalbum FOREIGN KEY (album_id)
    REFERENCES album (album_id);

-- Reference: FK_userplaylist (table: playlist)
ALTER TABLE playlist ADD CONSTRAINT FK_userplaylist FOREIGN KEY (user_id)
    REFERENCES user (user_id);

-- Reference: FK_tracksinger (table: track)
ALTER TABLE track ADD CONSTRAINT FK_singertrack FOREIGN KEY (singer_id)
    REFERENCES singer (singer_id);
CREATE DATABASE flower_platform;

USE flower_platform;

CREATE TABLE flower(
	flower_id MEDIUMINT NOT NULL AUTO_INCREMENT primary key,
   profile_pict_url varchar(255) NOT NULL,
    flower_story TEXT NOT NULL,
    flower_name varchar(30),
    floriography varchar(30),
    CHECK(profile_pict_url LIKE 'https://%')
);


CREATE TABLE flower_pictures(
	flower_id MEDIUMINT,
    pict_url varchar(255),
    uploaded_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    primary key(flower_id, pict_url),
    FOREIGN KEY(flower_id) REFERENCES flower(flower_id) ON DELETE CASCADE ON UPDATE CASCADE,
    CHECK(pict_url LIKE 'https://%')
);

CREATE TABLE authentication_providers(
	provider varchar(30) PRIMARY KEY
);

CREATE TABLE users(
	user_id BIGINT auto_increment primary key,
	email varchar(50),
    password varchar(255),
    role varchar(40) NOT NULL,
    authentication_provider varchar(20),
    registration_id varchar(40),
    unique(authentication_provider, registration_id), 
    unique(email),
    FOREIGN KEY(authentication_provider) REFERENCES authentication_providers(provider), 
    CHECK(email LIKE '%@%.___'),
    CHECK(role IN('USER', 'ADMIN', 'REGISTRATION_NOT_COMPLETE_USER'))
);


CREATE TABLE session(
	session_id BIGINT auto_increment primary key,
	user_id BIGINT,
	expires_at TIMESTAMP,
	refresh_token varchar(7000),
	FOREIGN KEY(user_id) REFERENCES users(user_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE INDEX session_expiresAt_index
ON session(expires_at);

CREATE EVENT delete_expired_session
ON SCHEDULE EVERY 5 MINUTE
DO DELETE FROM session WHERE expires_at < current_timestamp() LIMIT 30;

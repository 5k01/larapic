CREATE DATABASE IF NOT EXISTS laravel_master;
USE laravel_master;
CREATE TABLE IF NOT EXISTS users(
    id INT(255) auto_increment not null,
    role VARCHAR(20),
    name VARCHAR(100),
    surname VARCHAR(200),
    nick VARCHAR(100),
    email VARCHAR(255),
    password VARCHAR(255),
    image VARCHAR(255),
    created_at DATETIME,
    updated_at DATETIME,
    remember_token VARCHAR(255),
    constraint PK_users PRIMARY KEY (id)
) ENGINE = InnoDb;
CREATE TABLE IF NOT EXISTS images(
    id INT(255) auto_increment not null,
    user_id INT(255),
    image_path VARCHAR(255),
    description TEXT,
    created_at DATETIME,
    updated_at DATETIME,
    constraint PK_images PRIMARY KEY (id),
    constraint FK_images_users FOREIGN KEY (user_id) REFERENCES users(id)
) ENGINE = InnoDb;
CREATE TABLE IF NOT EXISTS comments(
    id INT(255) auto_increment not null,
    user_id INT(255),
    image_id INT(255),
    content TEXT,
    created_at DATETIME,
    updated_at DATETIME,
    constraint PK_comment PRIMARY KEY (id),
    constraint FK_comment_users FOREIGN KEY (user_id) REFERENCES users(id),
    constraint FK_comment_images FOREIGN KEY (image_id) REFERENCES images(id)
) ENGINE = InnoDb;
CREATE TABLE IF NOT EXISTS likes(
    id INT(255) auto_increment not null,
    user_id INT(255),
    image_id INT(255),
    created_at DATETIME,
    updated_at DATETIME,
    constraint PK_likes PRIMARY KEY (id),
    constraint FK_likes_users FOREIGN KEY (user_id) REFERENCES users(id),
    constraint FK_likes_images FOREIGN KEY (image_id) REFERENCES images(id)
) ENGINE = InnoDb;
INSERT INTO users
VALUES(
        null,
        'user',
        'Alonso',
        'Figueroa',
        'AlonsoFV',
        'alonso@figueroa.com',
        'pass',
        null,
        CURTIME(),
        CURTIME(),
        null
    );
INSERT INTO users
VALUES(
        null,
        'user',
        'Alonso2',
        'Figueroa',
        'AlonsoFV2',
        'alonso2@figueroa.com',
        'pass',
        null,
        CURTIME(),
        CURTIME(),
        null
    );
INSERT INTO users
VALUES(
        null,
        'user',
        'Alonso3',
        'Figueroa',
        'AlonsoFV3',
        'alonso3@figueroa.com',
        'pass',
        null,
        CURTIME(),
        CURTIME(),
        null
    );
INSERT INTO images
VALUES(
        null,
        1,
        'test1.jpg',
        'descripción de prueba 1',
        CURTIME(),
        CURTIME()
    );
INSERT INTO images
VALUES(
        null,
        1,
        'test2.jpg',
        'descripción de prueba 2',
        CURTIME(),
        CURTIME()
    );
INSERT INTO images
VALUES(
        null,
        1,
        'test3.jpg',
        'descripción de prueba 3',
        CURTIME(),
        CURTIME()
    );
INSERT INTO images
VALUES(
        null,
        3,
        'test4.jpg',
        'descripción de prueba4',
        CURTIME(),
        CURTIME()
    );
INSERT INTO comments
VALUES(
        null,
        1,
        4,
        'Comentario 1',
        CURTIME(),
        CURTIME()
    );
INSERT INTO comments
VALUES(
        null,
        2,
        1,
        'Comentario 2',
        CURTIME(),
        CURTIME()
    );
INSERT INTO comments
VALUES(
        null,
        2,
        4,
        'Comentario 3',
        CURTIME(),
        CURTIME()
    );
INSERT INTO likes
VALUES(
        null,
        1,
        4,
        CURTIME(),
        CURTIME()
    );
INSERT INTO likes
VALUES(
        null,
        2,
        4,
        CURTIME(),
        CURTIME()
    );
INSERT INTO likes
VALUES(
        null,
        3,
        1,
        CURTIME(),
        CURTIME()
    );
INSERT INTO likes
VALUES(
        null,
        3,
        2,
        CURTIME(),
        CURTIME()
    );
INSERT INTO likes
VALUES(
        null,
        2,
        1,
        CURTIME(),
        CURTIME()
    );
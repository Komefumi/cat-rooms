CREATE TABLE IF NOT EXISTS users
(
    id INT GENERATED ALWAYS AS IDENTITY,
    username text NOT NULL,
    passwordHash text NOT NULL,
    PRIMARY KEY(id)
);
--
CREATE TABLE IF NOT EXISTS posts
(
    id INT GENERATED ALWAYS AS IDENTITY,
    imageId text,
    ext text,
    content text NOT NULL,
    userId integer NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT fk_author
      FOREIGN KEY(userId)
        REFERENCES users(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);
--
CREATE TABLE IF NOT EXISTS comments
(
    id INT GENERATED ALWAYS AS IDENTITY,
    content text,
    postId integer NOT NULL,
    userId integer NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT fk_author
      FOREIGN KEY(userId)
        REFERENCES users(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT fk_post
      FOREIGN KEY(postId)
        REFERENCES posts(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);
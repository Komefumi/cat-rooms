CREATE TABLE IF NOT EXISTS users
(
    id INT GENERATED ALWAYS AS IDENTITY,
    username text NOT NULL,
    password_hash text NOT NULL,
    PRIMARY KEY(id)
);
--
CREATE TABLE IF NOT EXISTS posts
(
    id INT GENERATED ALWAYS AS IDENTITY,
    image_id text,
    ext text,
    content text NOT NULL,
    user_id integer NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT fk_author
      FOREIGN KEY(user_id)
        REFERENCES users(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);
--
CREATE TABLE IF NOT EXISTS comments
(
    id INT GENERATED ALWAYS AS IDENTITY,
    content text,
    post_id integer NOT NULL,
    user_id integer NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT fk_author
      FOREIGN KEY(user_id)
        REFERENCES users(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT fk_post
      FOREIGN KEY(post_id)
        REFERENCES posts(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);
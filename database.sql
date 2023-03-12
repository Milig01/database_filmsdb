--CREATE DATABASE filmsdb;

CREATE TABLE genres (
    name VARCHAR(50) PRIMARY KEY
);

CREATE TABLE person (
    id SERIAL PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    surname VARCHAR(30) NOT NULL
);

CREATE TABLE films (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    yearOfProduction INTEGER,
    country VARCHAR(30),
    regisseurId INTEGER REFERENCES person(id),
    scenarioId INTEGER REFERENCES person(id),
    producerId INTEGER REFERENCES person(id),
    operatorId INTEGER REFERENCES person(id),
    composerId INTEGER REFERENCES person(id),
    painterId INTEGER REFERENCES person(id),
    editorId INTEGER REFERENCES person(id),
    budget MONEY,
    marketing MONEY,
    collectionInUSA MONEY,
    collectionInWorld MONEY,
    premiereInRussia DATE,
    premiereInWorld DATE,
    releaseOnDVD DATE,
    ageToView INTEGER,
    ratingMPAA CHAR(1),
    duration TIME
);

CREATE TABLE audience (
    filmsId INTEGER PRIMARY KEY REFERENCES films(id) ON DELETE CASCADE,
    country VARCHAR(50) NOT NULL,
    quantity INTEGER CHECK (quantity > 0)
);

CREATE TABLE filmsAndGenres (
    filmsId INTEGER NOT NULL REFERENCES films(id) ON DELETE CASCADE,
    genresId VARCHAR(50) NOT NULL REFERENCES genre(name) ON DELETE CASCADE,
    PRIMARY KEY (filmsId, genresId)
);

CREATE TABLE inLeadingRoles (
    filmsId INTEGER NOT NULL REFERENCES films(id) ON DELETE CASCADE,
    roleId INTEGER NOT NULL REFERENCES person(id),
    PRIMARY KEY (filmsId, roleId)
);

CREATE TABLE rolesDuplicated (
    filmsId INTEGER NOT NULL REFERENCES films(id) ON DELETE CASCADE,
    roleId INTEGER NOT NULL REFERENCES person(id),
    PRIMARY KEY (filmsId, roleId)
);
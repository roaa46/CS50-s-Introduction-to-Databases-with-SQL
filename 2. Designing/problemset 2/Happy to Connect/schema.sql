CREATE TABLE
    "Users" (
        "first_name" TEXT NOT NULL,
        "last_name" TEXT NOT NULL,
        "username" TEXT,
        "password" TEXT NOT NULL,
        PRIMARY KEY ("username")
    );

CREATE TABLE
    "Schools" (
        "id" INTEGER,
        "name" TEXT NOT NULL,
        "type" TEXT NOT NULL,
        "location" TEXT NOT NULL,
        "year" INTEGER NOT NULL,
        PRIMARY KEY ("id")
    );

CREATE TABLE
    "Companies" (
        "id" INTEGER,
        "name" TEXT NOT NULL,
        "industry" TEXT NOT NULL,
        "location" TEXT NOT NULL,
        PRIMARY KEY ("id")
    );

CREATE TABLE
    "UserConnections" (
        "user_a" TEXT,
        "user_b" TEXT,
        FOREIGN KEY ("user_a") REFERENCES "Users" ("username"),
        FOREIGN KEY ("user_b") REFERENCES "Users" ("username")
    );

CREATE TABLE
    "SchoolsConnections" (
        "start_date" TEXT NOT NULL,
        "end_date" TEXT,
        "type" TEXT NOT NULL,
        "username" TEXT,
        "school_id" INTEGER,
        FOREIGN KEY ("username") REFERENCES "Users" ("username"),
        FOREIGN KEY ("school_id") REFERENCES "Schools" ("id")
    );

CREATE TABLE
    "CompaniesConnections" (
        "start_date" TEXT NOT NULL,
        "end_date" TEXT NOT NULL,
        "title" TEXT NOT NULL,
        "username" TEXT,
        "company_id" INTEGER,
        FOREIGN KEY ("username") REFERENCES "Users" ("username"),
        FOREIGN KEY ("company_id") REFERENCES "Companies" ("id")
    );

CREATE TABLE "priority" (
	"id"	INTEGER NOT NULL UNIQUE,
	"name"	TEXT NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);

CREATE TABLE "todo" (
	"id"	INTEGER NOT NULL UNIQUE,
	"name"	TEXT NOT NULL,
	"description"	TEXT NOT NULL,
	"priorityId"	INTEGER NOT NULL DEFAULT 0,
	"isDone"	INTEGER NOT NULL DEFAULT 0,
	FOREIGN KEY("priorityId") REFERENCES "priority"("id"),
	PRIMARY KEY("id" AUTOINCREMENT)
);

INSERT INTO "priority" ("id", "name") VALUES ('2', 'High');
INSERT INTO "priority" ("id", "name") VALUES ('1', 'Medium');
INSERT INTO "priority" ("id", "name") VALUES ('0', 'Low');
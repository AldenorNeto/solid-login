/*
  Warnings:

  - Added the required column `gym_id` to the `CheckIn` table without a default value. This is not possible if the table is not empty.
  - Added the required column `user_id` to the `CheckIn` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_CheckIn" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "validated_at" DATETIME,
    "user_id" TEXT NOT NULL,
    "gym_id" TEXT NOT NULL,
    CONSTRAINT "CheckIn_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "CheckIn_gym_id_fkey" FOREIGN KEY ("gym_id") REFERENCES "Gym" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_CheckIn" ("created_at", "id", "validated_at") SELECT "created_at", "id", "validated_at" FROM "CheckIn";
DROP TABLE "CheckIn";
ALTER TABLE "new_CheckIn" RENAME TO "CheckIn";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;

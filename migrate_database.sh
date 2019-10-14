psql -f ./db/migrations/00_create_database.sql
psql -f ./db/migrations/01_create_bookmarks_table.sql
psql -f ./db/migrations/02_create_comments_table.sql

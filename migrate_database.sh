psql -U postgres -f ./db/migrations/00_create_database.sql
psql -U postgres -d bookmark_manager -f ./db/migrations/01_create_bookmarks_table.sql
psql -U postgres -d bookmark_manager_test -f ./db/migrations/01_create_bookmarks_table.sql
psql -U postgres -d bookmark_manager -f ./db/migrations/02_create_comments_table.sql
psql -U postgres -d bookmark_manager_test -f ./db/migrations/02_create_comments_table.sql

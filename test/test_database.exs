defmodule Sqlitex.TestDatabase do
  # Functions for initializing an in-memory golf database

  def init(db) do
    db
    |> init_courses_table
    |> init_games_table
    |> init_player_table
    |> init_scores_table
    |> init_players_teams_table
  end

  defp init_courses_table(db) do
    :ok =
      :esqlite3.exec(
        "CREATE TABLE courses (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, name varchar(255), created_at datetime NOT NULL, updated_at datetime NOT NULL)",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO courses (name, created_at, updated_at) VALUES ('ron jon', '2012-10-14 05:46:28.312941', '2012-10-14 05:46:28.312941')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO courses (name, created_at, updated_at) VALUES ('trafalga', '2012-10-14 05:46:35.758815', '2012-10-14 05:46:35.758815')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO courses (name, created_at, updated_at) VALUES ('cascade arches', '2012-10-15 14:35:27.925986', '2012-10-15 14:35:27.925986')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO courses (name, created_at, updated_at) VALUES ('cascade falls', '2013-06-09 04:39:33.238256', '2013-06-09 04:39:33.238256')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO courses (name, created_at, updated_at) VALUES ('Mulligans Lighthouse', '2013-07-19 21:36:03.538344', '2013-07-19 21:36:03.538344')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO courses (name, created_at, updated_at) VALUES ('Trafalga Orem Windmill', '2013-08-23 23:21:42.642694', '2013-08-23 23:21:42.642694')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO courses (name, created_at, updated_at) VALUES ('Trafalga Orem Lighthouse', '2013-08-30 22:54:10.967274', '2013-08-30 22:54:10.967274')",
        db
      )

    db
  end

  defp init_games_table(db) do
    :ok =
      :esqlite3.exec(
        "CREATE TABLE games (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, played_at datetime, created_at datetime NOT NULL, updated_at datetime NOT NULL, num_holes integer, course_id integer, teams boolean)",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO games (played_at, created_at, updated_at, num_holes, course_id) VALUES ('2012-08-17 21:15:00.000000', '2012-10-14 05:46:28.314757', '2012-10-14 05:46:28.314757', 9, 1)",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO games (played_at, created_at, updated_at, num_holes, course_id) VALUES ('2012-08-17 21:00:00.000000', '2012-10-14 05:46:32.085092', '2012-10-14 05:46:32.085092', 9, 1)",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO games (played_at, created_at, updated_at, num_holes, course_id) VALUES ('2012-07-26 14:49:00.000000', '2012-10-14 05:46:35.759799', '2012-10-14 05:46:35.759799', 18, 2)",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO games (played_at, created_at, updated_at, num_holes, course_id) VALUES ('2012-08-03 14:49:00.000000', '2012-10-14 05:47:13.067145', '2012-10-14 05:47:13.067145', 18, 2)",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO games (played_at, created_at, updated_at, num_holes, course_id) VALUES ('2012-08-16 20:59:00.000000', '2012-10-15 14:35:24.968787', '2012-10-15 14:35:24.968787', 9, 1)",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO games (played_at, created_at, updated_at, num_holes, course_id) VALUES ('2012-08-01 16:15:00.000000', '2012-10-15 14:35:27.927227', '2012-10-15 14:35:27.927227', 18, 3)",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO games (played_at, created_at, updated_at, num_holes, course_id) VALUES ('2012-08-09 12:29:00.000000', '2012-10-15 14:35:39.908749', '2012-10-15 14:35:39.908749', 18, 2)",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO games (played_at, created_at, updated_at, num_holes, course_id) VALUES ('2012-07-11 14:49:00.000000', '2012-10-15 14:35:47.327672', '2012-10-15 14:35:47.327672', 18, 2)",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO games (played_at, created_at, updated_at, num_holes, course_id) VALUES ('2012-08-23 12:31:00.000000', '2012-10-15 14:35:50.434003', '2012-10-15 14:35:50.434003', 18, 2)",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO games (played_at, created_at, updated_at, num_holes, course_id) VALUES ('2012-08-30 12:39:00.000000', '2012-10-15 14:35:53.790719', '2012-10-15 14:35:53.790719', 18, 2)",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO games (played_at, created_at, updated_at, num_holes, course_id) VALUES ('2012-10-05 14:25:00.000000', '2012-10-15 14:35:58.060317', '2012-10-15 14:35:58.060317', 18, 2)",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO games (played_at, created_at, updated_at, num_holes, course_id) VALUES ('2013-05-10 15:15:00.000000', '2013-05-12 03:17:01.470870', '2013-05-12 03:17:01.470870', 18, 2)",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO games (played_at, created_at, updated_at, num_holes, course_id) VALUES ('2013-06-06 13:15:00.000000', '2013-06-06 21:33:12.346582', '2013-06-06 21:36:08.439837', 18, 3)",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO games (played_at, created_at, updated_at, num_holes, course_id) VALUES ('2013-05-31 13:14:00.000000', '2013-06-06 21:42:14.836358', '2013-06-06 21:42:14.836358', 18, 2)",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO games (played_at, created_at, updated_at, num_holes, course_id) VALUES ('2013-06-08 19:45:00.000000', '2013-06-09 04:39:33.239771', '2013-06-09 04:39:33.239771', 18, 5)",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO games (played_at, created_at, updated_at, num_holes, course_id) VALUES ('2013-06-14 13:15:00.000000', '2013-06-14 23:13:49.324996', '2013-06-14 23:13:49.324996', 18, 5)",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO games (played_at, created_at, updated_at, num_holes, course_id) VALUES ('2013-06-21 13:30:00.000000', '2013-06-21 21:56:42.492575', '2013-06-21 21:56:42.492575', 18, 3)",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO games (played_at, created_at, updated_at, num_holes, course_id) VALUES ('2013-07-12 13:01:00.000000', '2013-07-12 21:32:59.916270', '2013-07-12 21:32:59.916270', 18, 5)",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO games (played_at, created_at, updated_at, num_holes, course_id) VALUES ('2013-07-19 14:00:00.000000', '2013-07-19 21:36:03.654778', '2013-07-19 21:36:03.654778', 18, 6)",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO games (played_at, created_at, updated_at, num_holes, course_id) VALUES ('2013-08-22 14:00:00.000000', '2013-08-23 23:21:42.681303', '2013-08-23 23:21:42.681303', 18, 7)",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO games (played_at, created_at, updated_at, num_holes, course_id) VALUES ('2013-08-30 14:00:00.000000', '2013-08-30 22:54:11.035734', '2013-08-30 22:54:11.035734', 18, 8)",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO games (played_at, created_at, updated_at, num_holes, course_id, teams) VALUES ('2013-08-30 14:01:00.000000', '2013-08-30 22:58:52.942508', '2013-09-01 03:15:03.594610', 18, 8, 1)",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO games (played_at, created_at, updated_at, num_holes, course_id) VALUES ('2013-09-06 14:00:00.000000', '2013-09-06 22:21:03.692315', '2013-09-06 22:21:03.692315', 18, 8)",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO games (played_at, created_at, updated_at, num_holes, course_id, teams) VALUES ('2013-09-06 14:01:00.000000', '2013-09-06 22:24:14.611987', '2013-09-06 22:24:35.948302', 18, 8, 1)",
        db
      )

    db
  end

  defp init_player_table(db) do
    :ok =
      :esqlite3.exec(
        "CREATE TABLE players (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, name varchar(255), created_at datetime NOT NULL, updated_at datetime NOT NULL, type varchar(255))",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO players (name, created_at, updated_at) VALUES ('Mikey', '2012-10-14 05:46:28.318107', '2013-09-06 22:29:36.610911')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO players (name, created_at, updated_at) VALUES ('jon', '2012-10-14 05:46:28.321310', '2012-10-14 05:46:28.321310')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO players (name, created_at, updated_at) VALUES ('matte', '2012-10-14 05:46:35.762348', '2012-10-14 05:46:35.762348')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO players (name, created_at, updated_at) VALUES ('mattd', '2012-10-14 05:46:35.765167', '2012-10-14 05:46:35.765167')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO players (name, created_at, updated_at) VALUES ('bry', '2012-10-14 05:46:35.767830', '2012-10-14 05:46:35.767830')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO players (name, created_at, updated_at) VALUES ('jated', '2012-10-14 05:46:35.769930', '2012-10-14 05:46:35.769930')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO players (name, created_at, updated_at) VALUES ('brnt', '2012-10-14 05:46:35.772602', '2012-10-14 05:46:35.772602')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO players (name, created_at, updated_at) VALUES ('lane', '2012-10-14 05:47:13.077601', '2012-10-14 05:47:13.077601')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO players (name, created_at, updated_at) VALUES ('cathy', '2012-10-15 14:35:25.031584', '2012-10-15 14:35:25.031584')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO players (name, created_at, updated_at) VALUES ('sarah', '2012-10-15 14:35:25.035501', '2012-10-15 14:35:25.035501')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO players (name, created_at, updated_at) VALUES ('paul', '2012-10-15 14:35:27.930982', '2012-10-15 14:35:27.930982')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO players (name, created_at, updated_at) VALUES ('ny', '2012-10-15 14:35:27.967000', '2012-10-15 14:35:27.967000')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO players (name, created_at, updated_at) VALUES ('mike corrigan', '2012-10-15 14:35:27.969733', '2012-10-15 14:35:27.969733')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO players (name, created_at, updated_at) VALUES ('gp', '2012-10-15 14:35:27.971940', '2012-10-15 14:35:27.971940')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO players (name, created_at, updated_at) VALUES ('derek', '2012-10-15 14:35:27.974134', '2012-10-15 14:35:27.974134')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO players (name, created_at, updated_at) VALUES ('chris', '2012-10-15 14:35:27.976243', '2012-10-15 14:35:27.976243')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO players (name, created_at, updated_at) VALUES ('sloan', '2012-10-15 14:35:50.441170', '2012-10-15 14:35:50.441170')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO players (name, created_at, updated_at) VALUES ('duane', '2012-10-15 14:35:53.796919', '2012-10-15 14:35:53.796919')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO players (name, created_at, updated_at) VALUES ('ben', '2012-10-15 14:35:53.800582', '2012-10-15 14:35:53.800582')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO players (name, created_at, updated_at) VALUES ('russell', '2012-10-15 14:35:58.065161', '2012-10-15 14:35:58.065161')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO players (name, created_at, updated_at) VALUES ('jared cook', '2013-05-12 03:17:01.500997', '2013-05-12 03:17:01.500997')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO players (name, created_at, updated_at) VALUES ('chris hopkins', '2013-05-31 20:38:10.508409', '2013-05-31 20:38:10.508409')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO players (name, created_at, updated_at) VALUES ('nate priego', '2013-08-23 23:21:42.697119', '2013-08-23 23:21:42.697119')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO players (name, created_at, updated_at, type) VALUES ('Neil DeGrasse Tyson', '2013-08-30 22:58:52.945124', '2013-09-06 22:29:09.872678', 'Team')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO players (name, created_at, updated_at, type) VALUES ('Slothstronauts', '2013-08-30 22:58:52.947709', '2013-09-06 22:27:17.820250', 'Team')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO players (name, created_at, updated_at, type) VALUES ('Ny and Chris', '2013-08-30 22:58:52.950786', '2013-09-06 22:30:25.684407', 'Team')",
        db
      )

    db
  end

  defp init_scores_table(db) do
    :ok =
      :esqlite3.exec(
        "CREATE TABLE scores (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, game_id integer, player_id integer, hole01 integer, hole02 integer, hole03 integer, hole04 integer, hole05 integer, hole06 integer, hole07 integer, hole08 integer, hole09 integer, hole10 integer, hole11 integer, hole12 integer, hole13 integer, hole14 integer, hole15 integer, hole16 integer, hole17 integer, hole18 integer, created_at datetime NOT NULL, updated_at datetime NOT NULL)",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, created_at, updated_at) VALUES (1, 1, 3, 3, 2, 3, 2, 2, 4, 2, 2, '2012-10-14 05:46:28.319164', '2012-10-14 05:46:28.319164')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, created_at, updated_at) VALUES (1, 2, 2, 3, 1, 2, 2, 3, 2, 6, 3, '2012-10-14 05:46:28.321881', '2012-10-14 05:46:28.321881')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, created_at, updated_at) VALUES (2, 1, 3, 5, 4, 4, 2, 4, 4, 3, 2, '2012-10-14 05:46:32.086277', '2012-10-14 05:46:32.086277')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, created_at, updated_at) VALUES (2, 2, 2, 3, 2, 3, 2, 3, 2, 4, 2, '2012-10-14 05:46:32.087250', '2012-10-14 05:46:32.087250')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (3, 1, 1, 3, 4, 1, 3, 5, 2, 4, 4, 2, 2, 3, 2, 4, 1, 3, 5, 1, '2012-10-14 05:46:35.760558', '2012-10-14 05:46:35.760558')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (3, 3, 3, 3, 2, 3, 2, 2, 2, 3, 4, 2, 2, 2, 3, 4, 3, 5, 3, 2, '2012-10-14 05:46:35.763207', '2012-10-14 05:46:35.763207')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (3, 4, 1, 2, 2, 3, 3, 3, 5, 3, 2, 2, 2, 3, 3, 4, 1, 3, 2, 2, '2012-10-14 05:46:35.765864', '2012-10-14 05:46:35.765864')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (3, 5, 3, 2, 2, 6, 2, 2, 2, 2, 2, 2, 2, 3, 3, 4, 3, 4, 3, 2, '2012-10-14 05:46:35.768391', '2012-10-14 05:46:35.768391')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (3, 6, 2, 1, 2, 1, 3, 3, 4, 3, 2, 2, 2, 2, 4, 2, 6, 3, 4, 4, '2012-10-14 05:46:35.770461', '2012-10-14 05:46:35.770461')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (3, 7, 1, 3, 4, 6, 3, 3, 2, 3, 2, 2, 2, 3, 2, 3, 5, 3, 4, 2, '2012-10-14 05:46:35.773433', '2012-10-14 05:46:35.773433')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (4, 1, 2, 1, 1, 2, 1, 4, 2, 6, 3, 4, 2, 3, 4, 3, 5, 2, 3, 1, '2012-10-14 05:47:13.069136', '2012-10-14 05:47:13.069136')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (4, 4, 3, 1, 2, 2, 1, 3, 4, 3, 3, 3, 3, 2, 3, 2, 3, 3, 3, 2, '2012-10-14 05:47:13.071854', '2012-10-14 05:47:13.071854')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (4, 5, 4, 3, 2, 4, 3, 3, 4, 3, 2, 2, 3, 2, 4, 2, 2, 4, 3, 3, '2012-10-14 05:47:13.073446', '2012-10-14 05:47:13.073446')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (4, 7, 3, 1, 3, 3, 5, 4, 3, 2, 2, 3, 5, 2, 6, 3, 2, 6, 4, 2, '2012-10-14 05:47:13.075463', '2012-10-14 05:47:13.075463')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (4, 8, 2, 1, 4, 2, 3, 3, 3, 2, 2, 2, 2, 2, 2, 2, 2, 6, 4, 2, '2012-10-14 05:47:13.078231', '2012-10-14 05:47:13.078231')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, created_at, updated_at) VALUES (5, 1, 2, 4, 2, 3, 1, 3, 1, 2, 2, '2012-10-15 14:35:25.020949', '2012-10-15 14:35:25.020949')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, created_at, updated_at) VALUES (5, 9, 4, 2, 2, 2, 3, 2, 4, 2, 3, '2012-10-15 14:35:25.032744', '2012-10-15 14:35:25.032744')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, created_at, updated_at) VALUES (5, 2, 2, 5, 1, 2, 3, 3, 2, 4, 1, '2012-10-15 14:35:25.033829', '2012-10-15 14:35:25.033829')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, created_at, updated_at) VALUES (5, 10, 4, 2, 3, 4, 3, 2, 2, 4, 4, '2012-10-15 14:35:25.036546', '2012-10-15 14:35:25.036546')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (6, 1, 2, 2, 1, 2, 4, 3, 2, 4, 3, 4, 2, 3, 2, 2, 3, 2, 3, 3, '2012-10-15 14:35:27.928114', '2012-10-15 14:35:27.928114')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (6, 4, 2, 3, 2, 2, 2, 6, 6, 5, 4, 2, 3, 3, 2, 3, 2, 2, 1, 3, '2012-10-15 14:35:27.929198', '2012-10-15 14:35:27.929198')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (6, 11, 5, 4, 2, 2, 2, 6, 2, 4, 1, 2, 6, 3, 1, 3, 3, 4, 2, 4, '2012-10-15 14:35:27.931569', '2012-10-15 14:35:27.931569')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (6, 12, 4, 6, 2, 4, 3, 4, 6, 3, 3, 2, 2, 4, 3, 3, 3, 5, 4, 2, '2012-10-15 14:35:27.967901', '2012-10-15 14:35:27.967901')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (6, 13, 4, 3, 2, 2, 4, 3, 5, 4, 1, 6, 5, 2, 6, 3, 4, 2, 1, 3, '2012-10-15 14:35:27.970307', '2012-10-15 14:35:27.970307')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (6, 14, 6, 3, 2, 3, 3, 3, 4, 2, 2, 6, 2, 2, 2, 2, 2, 3, 6, 3, '2012-10-15 14:35:27.972493', '2012-10-15 14:35:27.972493')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (6, 15, 4, 3, 4, 2, 3, 2, 3, 4, 3, 4, 3, 3, 1, 3, 3, 6, 3, 4, '2012-10-15 14:35:27.974681', '2012-10-15 14:35:27.974681')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (6, 16, 4, 3, 1, 2, 4, 4, 3, 4, 3, 3, 3, 3, 3, 3, 3, 6, 2, 3, '2012-10-15 14:35:27.976829', '2012-10-15 14:35:27.976829')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (7, 1, 2, 1, 1, 2, 1, 4, 2, 6, 3, 4, 2, 3, 4, 3, 5, 2, 3, 1, '2012-10-15 14:35:39.910148', '2012-10-15 14:35:39.910148')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (7, 4, 3, 1, 2, 2, 1, 3, 4, 3, 3, 3, 3, 2, 3, 2, 3, 3, 3, 2, '2012-10-15 14:35:39.912066', '2012-10-15 14:35:39.912066')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (7, 5, 4, 3, 2, 4, 3, 3, 4, 3, 2, 2, 3, 2, 4, 2, 2, 4, 3, 3, '2012-10-15 14:35:39.912972', '2012-10-15 14:35:39.912972')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (7, 7, 3, 1, 3, 3, 5, 4, 3, 2, 2, 3, 5, 2, 6, 3, 2, 6, 4, 2, '2012-10-15 14:35:39.913865', '2012-10-15 14:35:39.913865')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (7, 8, 2, 1, 4, 2, 3, 3, 3, 2, 2, 2, 2, 2, 2, 2, 2, 6, 4, 2, '2012-10-15 14:35:39.914787', '2012-10-15 14:35:39.914787')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (8, 1, 1, 2, 3, 4, 2, 4, 1, 2, 2, 5, 2, 2, 2, 4, 3, 4, 3, 2, '2012-10-15 14:35:47.328745', '2012-10-15 14:35:47.328745')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (8, 3, 1, 3, 3, 4, 2, 3, 6, 3, 2, 2, 2, 6, 2, 2, 2, 3, 2, 3, '2012-10-15 14:35:47.329772', '2012-10-15 14:35:47.329772')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (8, 5, 3, 2, 2, 3, 3, 2, 3, 2, 3, 2, 3, 2, 3, 4, 4, 3, 2, 3, '2012-10-15 14:35:47.330661', '2012-10-15 14:35:47.330661')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (9, 1, 2, 1, 3, 3, 2, 3, 3, 5, 4, 2, 3, 3, 3, 2, 3, 2, 1, 5, '2012-10-15 14:35:50.435036', '2012-10-15 14:35:50.435036')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (9, 4, 2, 4, 1, 3, 3, 2, 2, 2, 3, 4, 2, 2, 2, 2, 1, 5, 6, 2, '2012-10-15 14:35:50.436365', '2012-10-15 14:35:50.436365')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (9, 5, 5, 1, 2, 4, 1, 3, 2, 2, 2, 3, 3, 3, 4, 2, 3, 4, 6, 2, '2012-10-15 14:35:50.437426', '2012-10-15 14:35:50.437426')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (9, 7, 2, 3, 1, 3, 4, 2, 4, 2, 2, 3, 2, 2, 2, 2, 2, 5, 4, 2, '2012-10-15 14:35:50.438399', '2012-10-15 14:35:50.438399')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (9, 11, 2, 1, 3, 3, 3, 3, 3, 3, 3, 3, 5, 2, 4, 2, 2, 3, 3, 3, '2012-10-15 14:35:50.439323', '2012-10-15 14:35:50.439323')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (9, 17, 6, 5, 1, 2, 5, 2, 5, 3, 4, 4, 1, 2, 6, 4, 2, 3, 4, 4, '2012-10-15 14:35:50.441815', '2012-10-15 14:35:50.441815')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (10, 4, 4, 1, 1, 2, 2, 2, 2, 3, 2, 2, 2, 2, 1, 3, 1, 2, 3, 2, '2012-10-15 14:35:53.791794', '2012-10-15 14:35:53.791794')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (10, 7, 2, 1, 1, 3, 3, 3, 2, 2, 2, 2, 2, 3, 3, 2, 2, 2, 3, 6, '2012-10-15 14:35:53.792828', '2012-10-15 14:35:53.792828')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (10, 3, 2, 1, 3, 4, 3, 2, 3, 2, 2, 3, 4, 2, 4, 2, 2, 3, 3, 2, '2012-10-15 14:35:53.793902', '2012-10-15 14:35:53.793902')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (10, 5, 3, 1, 2, 2, 5, 2, 3, 1, 3, 3, 3, 2, 3, 4, 3, 2, 4, 2, '2012-10-15 14:35:53.794997', '2012-10-15 14:35:53.794997')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (10, 18, 5, 2, 1, 2, 3, 2, 3, 3, 4, 3, 3, 2, 3, 2, 3, 2, 3, 2, '2012-10-15 14:35:53.797653', '2012-10-15 14:35:53.797653')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (10, 19, 6, 2, 3, 2, 4, 2, 2, 4, 2, 3, 3, 2, 2, 2, 1, 3, 5, 3, '2012-10-15 14:35:53.801339', '2012-10-15 14:35:53.801339')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (10, 1, 6, 3, 2, 2, 4, 3, 4, 2, 3, 1, 4, 2, 3, 2, 3, 3, 3, 2, '2012-10-15 14:35:53.803754', '2012-10-15 14:35:53.803754')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (10, 11, 2, 3, 3, 2, 4, 2, 4, 6, 5, 3, 2, 3, 6, 2, 3, 4, 5, 1, '2012-10-15 14:35:53.805123', '2012-10-15 14:35:53.805123')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (11, 1, 3, 1, 2, 3, 1, 2, 3, 5, 2, 2, 3, 2, 3, 2, 2, 4, 3, 1, '2012-10-15 14:35:58.061401', '2012-10-15 14:35:58.061401')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (11, 4, 3, 3, 2, 3, 3, 3, 2, 2, 4, 2, 3, 2, 4, 2, 2, 3, 3, 2, '2012-10-15 14:35:58.062437', '2012-10-15 14:35:58.062437')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (11, 11, 4, 6, 2, 3, 3, 3, 3, 2, 2, 4, 2, 2, 3, 2, 1, 3, 4, 1, '2012-10-15 14:35:58.063439', '2012-10-15 14:35:58.063439')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (11, 20, 5, 6, 2, 3, 1, 4, 2, 2, 3, 3, 2, 2, 3, 2, 2, 4, 4, 4, '2012-10-15 14:35:58.065760', '2012-10-15 14:35:58.065760')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (12, 1, 2, 2, 3, 2, 3, 2, 3, 3, 3, 4, 4, 5, 2, 2, 3, 3, 4, 5, '2013-05-12 03:17:01.484934', '2013-05-12 03:17:01.484934')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (12, 21, 3, 1, 3, 2, 3, 4, 5, 3, 4, 3, 2, 4, 2, 3, 2, 2, 2, 2, '2013-05-12 03:17:01.502327', '2013-05-12 03:17:01.502327')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (12, 11, 2, 1, 2, 3, 5, 6, 5, 1, 3, 2, 6, 3, 4, 2, 1, 4, 3, 4, '2013-05-12 03:17:01.503663', '2013-05-12 03:17:01.503663')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (12, 20, 4, 1, 2, 2, 4, 3, 3, 3, 3, 3, 2, 4, 3, 3, 3, 2, 4, 3, '2013-05-12 03:17:01.504568', '2013-05-12 03:17:01.504568')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (14, 21, 3, 3, 2, 3, 2, 2, 2, 2, 3, 3, 2, 2, 3, 3, 3, 3, 2, 2, '2013-06-06 21:33:12.347747', '2013-06-06 21:33:12.347747')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (14, 11, 3, 2, 2, 3, 4, 3, 4, 1, 3, 2, 3, 2, 2, 4, 3, 3, 2, 2, '2013-06-06 21:33:12.348782', '2013-06-06 21:33:12.348782')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (14, 20, 4, 3, 2, 2, 2, 3, 2, 4, 3, 3, 4, 3, 3, 2, 2, 2, 3, 2, '2013-06-06 21:33:12.349635', '2013-06-06 21:33:12.349635')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (14, 1, 2, 3, 3, 3, 4, 4, 2, 4, 2, 2, 3, 3, 1, 3, 2, 5, 2, 2, '2013-06-06 21:33:12.350506', '2013-06-06 21:33:12.350506')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (14, 12, 2, 4, 2, 5, 3, 3, 2, 3, 4, 2, 2, 4, 5, 3, 4, 6, 2, 2, '2013-06-06 21:33:12.351368', '2013-06-06 21:33:12.351368')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (14, 22, 5, 2, 2, 4, 5, 5, 3, 4, 5, 6, 4, 2, 4, 4, 2, 2, 2, 2, '2013-06-06 21:33:12.352258', '2013-06-06 21:33:12.352258')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (15, 21, 2, 1, 3, 3, 2, 3, 2, 3, 2, 2, 6, 3, 3, 4, 2, 1, 2, 2, '2013-06-06 21:42:14.838368', '2013-06-06 21:42:14.838368')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (15, 11, 3, 1, 2, 2, 3, 2, 2, 4, 2, 4, 3, 5, 4, 5, 2, 1, 2, 2, '2013-06-06 21:42:14.839932', '2013-06-06 21:42:14.839932')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (15, 20, 2, 6, 2, 2, 1, 2, 3, 3, 2, 3, 2, 4, 2, 3, 3, 2, 3, 6, '2013-06-06 21:42:14.840800', '2013-06-06 21:42:14.840800')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (15, 1, 4, 1, 2, 2, 4, 2, 3, 2, 4, 3, 2, 3, 2, 3, 3, 6, 4, 2, '2013-06-06 21:42:14.841704', '2013-06-06 21:42:14.841704')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (15, 22, 5, 1, 6, 3, 3, 2, 5, 3, 2, 3, 2, 6, 2, 4, 6, 3, 5, 3, '2013-06-06 21:42:14.842579', '2013-06-06 21:42:14.842579')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (16, 1, 3, 3, 3, 3, 2, 3, 2, 4, 4, 2, 2, 2, 2, 2, 3, 2, 2, 3, '2013-06-09 04:39:33.241342', '2013-06-09 04:39:33.241342')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (16, 10, 3, 3, 2, 5, 5, 2, 4, 2, 4, 3, 2, 1, 2, 5, 3, 3, 3, 3, '2013-06-09 04:39:33.243650', '2013-06-09 04:39:33.243650')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (17, 11, 3, 3, 1, 4, 2, 2, 3, 3, 3, 2, 3, 3, 2, 2, 6, 1, 2, 2, '2013-06-14 23:13:49.361542', '2013-06-14 23:13:49.361542')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (17, 21, 2, 3, 2, 4, 3, 3, 2, 1, 3, 4, 2, 5, 4, 1, 2, 3, 2, 2, '2013-06-14 23:13:49.362824', '2013-06-14 23:13:49.362824')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (17, 20, 3, 2, 3, 4, 5, 3, 6, 2, 3, 3, 2, 1, 2, 4, 3, 2, 2, 3, '2013-06-14 23:13:49.363701', '2013-06-14 23:13:49.363701')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (17, 1, 2, 3, 3, 4, 2, 2, 1, 3, 5, 2, 4, 2, 3, 6, 3, 3, 3, 3, '2013-06-14 23:13:49.364597', '2013-06-14 23:13:49.364597')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (18, 1, 2, 2, 3, 3, 1, 3, 3, 2, 3, 3, 2, 4, 2, 2, 3, 6, 4, 3, '2013-06-21 21:56:42.538431', '2013-06-21 21:56:42.538431')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (18, 20, 4, 3, 2, 3, 3, 4, 2, 4, 3, 3, 3, 2, 2, 3, 2, 3, 2, 3, '2013-06-21 21:56:42.539593', '2013-06-21 21:56:42.539593')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (18, 21, 2, 4, 3, 2, 4, 6, 3, 4, 3, 4, 2, 4, 2, 2, 5, 3, 3, 1, '2013-06-21 21:56:42.540628', '2013-06-21 21:56:42.540628')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (18, 12, 4, 4, 2, 4, 4, 6, 4, 2, 3, 3, 2, 3, 6, 3, 4, 5, 2, 3, '2013-06-21 21:56:42.541614', '2013-06-21 21:56:42.541614')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (18, 22, 6, 4, 2, 2, 4, 6, 4, 6, 5, 3, 4, 3, 3, 3, 2, 2, 4, 3, '2013-06-21 21:56:42.542496', '2013-06-21 21:56:42.542496')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (18, 11, 3, 4, 2, 5, 4, 6, 1, 6, 4, 2, 2, 5, 4, 4, 5, 3, 5, 4, '2013-06-21 21:56:42.543357', '2013-06-21 21:56:42.543357')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (20, 20, 2, 1, 3, 1, 3, 2, 2, 3, 4, 4, 3, 2, 2, 5, 4, 3, 2, 3, '2013-07-12 21:32:59.917231', '2013-07-12 21:32:59.917231')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (20, 21, 2, 3, 3, 2, 3, 2, 2, 3, 5, 2, 1, 5, 3, 4, 2, 3, 2, 5, '2013-07-12 21:32:59.918550', '2013-07-12 21:32:59.918550')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (20, 1, 2, 3, 3, 4, 2, 3, 3, 3, 4, 6, 2, 2, 2, 5, 3, 3, 5, 2, '2013-07-12 21:32:59.919493', '2013-07-12 21:32:59.919493')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (20, 22, 2, 3, 3, 2, 3, 3, 4, 3, 6, 4, 4, 3, 2, 5, 4, 4, 2, 3, '2013-07-12 21:32:59.920326', '2013-07-12 21:32:59.920326')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (21, 20, 2, 3, 4, 2, 2, 5, 3, 1, 3, 3, 4, 2, 2, 2, 3, 3, 3, 2, '2013-07-19 21:36:03.656648', '2013-07-19 21:42:32.807385')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (21, 21, 3, 3, 2, 3, 1, 2, 4, 4, 2, 3, 2, 3, 2, 6, 3, 6, 2, 4, '2013-07-19 21:36:03.663552', '2013-07-19 21:42:50.303246')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (21, 1, 3, 3, 2, 5, 2, 2, 5, 6, 6, 3, 4, 2, 3, 3, 6, 3, 2, 3, '2013-07-19 21:36:03.664394', '2013-07-19 21:36:03.664394')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (21, 22, 2, 5, 4, 3, 2, 6, 4, 4, 3, 3, 4, 2, 3, 1, 4, 2, 5, 4, '2013-07-19 21:36:03.665230', '2013-07-19 21:36:03.665230')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (22, 1, 3, 3, 3, 5, 4, 1, 3, 2, 2, 3, 2, 1, 2, 2, 3, 2, 1, 2, '2013-08-23 23:21:42.682639', '2013-08-23 23:21:42.682639')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (22, 21, 2, 3, 3, 3, 1, 2, 3, 2, 2, 2, 4, 2, 2, 3, 3, 2, 4, 2, '2013-08-23 23:21:42.683795', '2013-08-23 23:21:42.683795')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (22, 12, 2, 3, 5, 3, 3, 1, 3, 2, 3, 2, 3, 1, 4, 2, 2, 3, 2, 3, '2013-08-23 23:21:42.685153', '2013-08-23 23:21:42.685153')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (22, 20, 3, 5, 4, 4, 3, 2, 2, 3, 2, 3, 3, 2, 2, 2, 2, 3, 2, 2, '2013-08-23 23:21:42.686613', '2013-08-23 23:21:42.686613')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (22, 23, 2, 6, 3, 6, 3, 4, 4, 3, 4, 3, 4, 1, 3, 3, 4, 3, 2, 1, '2013-08-23 23:21:42.704986', '2013-08-23 23:21:42.704986')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (22, 22, 4, 3, 5, 1, 1, 3, 3, 4, 4, 4, 3, 3, 4, 3, 5, 4, 4, 3, '2013-08-23 23:21:42.706617', '2013-08-23 23:21:42.706617')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (23, 1, 2, 2, 3, 2, 5, 3, 3, 2, 4, 4, 2, 5, 5, 2, 5, 3, 3, 3, '2013-08-30 22:54:11.038166', '2013-08-30 22:54:11.038166')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (23, 21, 3, 3, 3, 3, 3, 4, 2, 2, 2, 4, 4, 2, 6, 3, 5, 4, 2, 2, '2013-08-30 22:54:11.040338', '2013-08-30 22:54:11.040338')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (23, 12, 2, 3, 3, 3, 5, 2, 2, 2, 4, 4, 3, 3, 3, 1, 2, 6, 1, 2, '2013-08-30 22:54:11.041742', '2013-08-30 22:54:11.041742')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (23, 20, 4, 2, 5, 3, 4, 2, 2, 3, 3, 4, 5, 4, 4, 4, 4, 2, 2, 2, '2013-08-30 22:54:11.042888', '2013-08-30 22:54:11.042888')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (23, 23, 3, 2, 5, 2, 4, 3, 3, 3, 4, 3, 5, 5, 2, 4, 2, 6, 2, 2, '2013-08-30 22:54:11.043942', '2013-08-30 22:54:11.043942')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (23, 22, 4, 3, 3, 3, 2, 2, 2, 3, 4, 5, 5, 3, 6, 2, 3, 6, 3, 2, '2013-08-30 22:54:11.044986', '2013-08-30 22:54:11.044986')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (24, 24, 2, 2, 3, 2, 4, 3, 3, 2, 4, 3, 2, 5, 2, 2, 2, 3, 2, 2, '2013-08-30 22:58:52.946005', '2013-08-30 22:58:52.946005')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (24, 25, 3, 2, 3, 3, 3, 2, 2, 2, 2, 4, 4, 2, 4, 3, 4, 2, 2, 2, '2013-08-30 22:58:52.948441', '2013-08-30 22:58:52.948441')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (24, 26, 2, 3, 3, 3, 2, 2, 2, 2, 4, 4, 3, 3, 3, 1, 2, 6, 1, 2, '2013-08-30 22:58:52.951351', '2013-08-30 22:58:52.951351')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (26, 21, 3, 2, 3, 2, 3, 3, 2, 2, 5, 3, 3, 5, 6, 1, 2, 4, 2, 2, '2013-09-06 22:21:03.693327', '2013-09-06 22:21:03.693327')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (26, 1, 2, 3, 4, 3, 4, 3, 3, 2, 2, 3, 3, 4, 4, 2, 3, 4, 3, 2, '2013-09-06 22:21:03.694400', '2013-09-06 22:21:03.694400')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (26, 20, 5, 3, 3, 1, 5, 2, 2, 2, 3, 4, 3, 4, 6, 4, 4, 3, 3, 2, '2013-09-06 22:21:03.695331', '2013-09-06 22:21:03.695331')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (26, 23, 4, 3, 4, 2, 5, 3, 2, 2, 5, 3, 3, 4, 4, 1, 4, 5, 4, 2, '2013-09-06 22:21:03.696349', '2013-09-06 22:21:03.696349')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (26, 12, 3, 3, 3, 3, 5, 4, 2, 2, 4, 3, 3, 3, 6, 4, 3, 5, 3, 2, '2013-09-06 22:21:03.697756', '2013-09-06 22:21:03.697756')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (26, 22, 5, 4, 5, 1, 3, 2, 2, 2, 3, 6, 3, 4, 6, 5, 5, 3, 2, 2, '2013-09-06 22:21:03.698880', '2013-09-06 22:21:03.698880')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (27, 24, 2, 3, 4, 2, 4, 3, 2, 2, 2, 3, 3, 4, 4, 1, 3, 4, 3, 2, '2013-09-06 22:24:14.615979', '2013-09-06 22:24:14.615979')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (27, 25, 3, 2, 3, 1, 3, 2, 2, 2, 3, 3, 3, 4, 6, 1, 2, 3, 2, 2, '2013-09-06 22:24:14.618268', '2013-09-06 22:24:14.618268')",
        db
      )

    :ok =
      :esqlite3.exec(
        "INSERT INTO scores (game_id, player_id, hole01, hole02, hole03, hole04, hole05, hole06, hole07, hole08, hole09, hole10, hole11, hole12, hole13, hole14, hole15, hole16, hole17, hole18, created_at, updated_at) VALUES (27, 26, 3, 3, 3, 1, 3, 2, 2, 2, 3, 3, 3, 3, 6, 4, 3, 3, 2, 2, '2013-09-06 22:24:14.619506', '2013-09-06 22:24:14.619506')",
        db
      )

    db
  end

  defp init_players_teams_table(db) do
    :ok = :esqlite3.exec("CREATE TABLE players_tables (team_id integer, player_id, integer)", db)
    :ok = :esqlite3.exec("INSERT INTO players_tables (team_id, player_id) VALUES (25, 21)", db)
    :ok = :esqlite3.exec("INSERT INTO players_tables (team_id, player_id) VALUES (25, 20)", db)
    :ok = :esqlite3.exec("INSERT INTO players_tables (team_id, player_id) VALUES (24, 23)", db)
    :ok = :esqlite3.exec("INSERT INTO players_tables (team_id, player_id) VALUES (24, 1)", db)
    :ok = :esqlite3.exec("INSERT INTO players_tables (team_id, player_id) VALUES (26, 12)", db)
    :ok = :esqlite3.exec("INSERT INTO players_tables (team_id, player_id) VALUES (26, 22)", db)
    db
  end
end

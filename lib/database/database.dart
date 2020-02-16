import 'package:postgres/postgres.dart';

var connection = new PostgreSQLConnection("localhost", 5432, "activos_entidades", username: "postgres", password: "123456");
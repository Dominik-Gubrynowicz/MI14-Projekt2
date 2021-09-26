<?php

//db config
$db_host = 'mi14db';
$db_user = 'root';
$db_pass = 'qwerty';
$db_name = 'klub_sportowy';

class Klub
{
    public $trener;
    public $pilkarze;
    public $nazwa;
}


$kluby = [];

$db = new mysqli($db_host, $db_user, $db_pass, $db_name);
$sql = "SELECT * FROM Kluby";
$clubs = $db->query($sql);

while($row = $clubs->fetch_assoc()) {

    $name = '';
    $players = [];
    $trainer = '';


    $name = $row['Nazwa'];
    $club_id = $row['Id_k'];

    $sql = "SELECT Kluby.Nazwa, Piłkarze.Imie, Piłkarze.Nazwisko, Trener.Imie AS ImieTrenera, Trener.Nazwisko AS NazwiskoTrenera FROM Kluby JOIN Piłkarze JOIN Trener ON Kluby.Id_k = Trener.Id_k AND Kluby.Id_k = Piłkarze.Id_k AND Kluby.Id_k = $club_id WHERE Piłkarze.Id_p NOT IN ( SELECT Id_p FROM Wypozyczenia WHERE Wypozyczenia.Id_p = Id_p )";
    $pl = $db->query($sql);
    $i = 0;
    while($player_row = $pl->fetch_assoc()) {
        $trainer = $player_row["ImieTrenera"] . " " . $player_row["NazwiskoTrenera"];
        $players[] = $player_row["Imie"] . " " . $player_row["Nazwisko"];
    }
    $pl->free_result();

    $klub = new Klub();
    $klub->nazwa = $name;
    $klub->trener = $trainer;
    $klub->pilkarze = $players;
    $kluby[] = $klub;
}

header('Content-Type: application/json; charset=utf-8');
echo json_encode($kluby, JSON_UNESCAPED_UNICODE);

$db->close();
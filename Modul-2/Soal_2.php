<?php
$matkul = ["PTI","ALPRO","DPW","STRUKDAT","JARKOM","PAW","PSBF","RPL"];

foreach ($matkul as $mtk) {
    switch ($mtk) {
        case "PTI":
            echo "Saya suka " . $mtk;
            echo "<br>";
            break;
        case "ALPRO":
            echo "Saya suka " . $mtk;
            echo "<br>";
            break;
        case "DPW":
            echo "Saya suka " . $mtk;
            echo "<br>";
            break;
        case "STRUKDAT":
            echo "Saya suka " . $mtk;
            echo "<br>";
            break;
        case "JARKOM":
            echo "Saya suka " . $mtk;
            echo "<br>";
            break;
        case "PAW":
            echo "Saya suka " . $mtk;
            echo "<br>";
            break;
        default:
            echo "Saya tidak mengambil matkul " . $mtk;
            echo "<br>";
    }
}

?>
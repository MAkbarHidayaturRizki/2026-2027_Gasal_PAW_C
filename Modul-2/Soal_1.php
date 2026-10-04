<?php
$matkul = ["PTI","ALPRO","DPW","STRUKDAT","JARKOM","PAW","PSBF","RPL"];
$praktikum = ["JARKOM","PAW"];

for ($x = 0; $x < count($matkul); $x++) {
    if ($x == 6 || $x == 7) {
        echo "Saya belum mengambil matkul " . $matkul[$x];
        echo "<br>";
    } else if (in_array($matkul[$x], $praktikum)) { 
        echo "Saya sedang mengambil matkul " . $matkul[$x] . " termasuk praktikumnya";
        echo "<br>";
    } else {
        echo "Saya sudah mengambil matkul " . $matkul[$x] . " semester lalu";
        echo "<br>";
    }
};

?>



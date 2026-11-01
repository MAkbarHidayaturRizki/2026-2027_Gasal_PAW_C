<?php
if ($_SERVER['REQUEST_METHOD'] == "GET") {
	$id = $_GET['id'];
} else if ($_SERVER['REQUEST_METHOD'] == "POST") {
	$id = $_POST['id'];
};

try {
	$koneksi = mysqli_connect("localhost", "root", "", "tp_05");
	$ambil = mysqli_query($koneksi, "select * from supplier where id = $id");
	$row = mysqli_fetch_assoc($ambil);

	$nama = $row["nama"];
	$telp = $row["telp"];
	$alamat = $row["alamat"];
} catch (mysqli_sql_exception $e) {
	die("Koneksi ke database gagal:" . $e->getMessage());
};



if (isset($_POST["submit"]) and isset($_POST['id'])) {
	$new_nama = $_POST['nama'];
	$new_telp = $_POST['telp'];
	$new_alamat = $_POST['alamat'];
	if ($nama !== $new_nama) {
		mysqli_query($koneksi, "UPDATE supplier SET nama = '$new_nama' where id = $id");
	}
	if ($telp !== $new_telp) {
		mysqli_query($koneksi, "UPDATE supplier SET telp = '$new_telp' where id = $id");
	}
	if ($alamat !== $new_alamat) {
		mysqli_query($koneksi, "UPDATE supplier SET alamat = '$new_alamat' where id = $id");
	}
	header("Location: index.php");

};
?>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title></title>
	<style>
		.field {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }

        label {
            width: 100px;
            margin-right: 30px;
            flex-shrink: 0;
            text-align: right;
        }
        button {
        	width: 80px;
        	color: white;
        	outline: none;
        	border-radius: 5px;
        	border: none;
        	height: 30px;
        }
        input {
        	border: 1px solid lightgray;
        	border-radius: 5px;
        	height: 25px;
        	padding-left: 10px;
        }
        body {
		    font-family: Arial;
		}
	</style>
</head>
<body>
	<h2 style="color: skyblue; font-weight: normal;">Edit Data Master Supplier</h2>
	<hr>
	<form action="edit.php" method="POST">

		<input type="hidden" name="id" value='<?= $id?>'>
		<div class="field" >
			<label for="nama"><b>Nama</b></label>
			<input type="text" name="nama" placeholder="Nama" size="30" value='<?= $nama ?>'>  
		</div>

		<div class="field">
			<label for="telp"><b>Telp</b></label>
			<input type="text" name="telp" placeholder="Telp" value='<?= $telp ?>'>  
		</div>

		<div class="field">
			<label for="alamat"><b>Alamat</b></label>
			<input type="text" name="alamat" placeholder="Alamat" value='<?= $alamat ?>'>  
		</div>

		<div class="field">
			<button style="background: #80BD3F; margin-left: 130px;" name="submit" type="submit">Update</button>
			<button style="background: #D32329; margin-left: 5px;" type="reset" onclick="window.location.href='index.php'">Batal</button>
		</div>

	</form>

</body>
</html>
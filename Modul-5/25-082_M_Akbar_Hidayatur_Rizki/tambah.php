<?php 
$kosong = "";

if (isset($_POST['submit'])) {
		if (!isset($_POST['nama']) || empty($_POST['nama'])
			|| !isset($_POST['telp']) || empty($_POST['telp'])
			|| !isset($_POST['alamat']) || empty($_POST['alamat'])) 
		{
			$kosong = "Semua data harus di isi lengkap";	
		} else {
			try {
				$koneksi = mysqli_connect("localhost", "root", "", "tp_05");
				$nama = $_POST['nama'];
				$telp = $_POST['telp'];
				$alamat = $_POST['alamat'];


				$query = "INSERT INTO supplier(nama,telp,alamat) VALUES('$nama','$telp','$alamat')";
				$run = mysqli_query($koneksi, $query);
				header("Location: index.php");
			} catch (mysqli_sql_exception $e) {	
				die("Koneksi ke database gagal:" . $e->getMessage());
			};
		}
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

		#warning {
			font-weight: bold;
			color: white;
			width: 245px;
 			border: 1px solid darkgray;
 			border-radius: 5px;
 			background: #D32329;
 			padding: 5px 15px;
    		text-decoration: none;
    		margin-top: 20px;
    		margin-left: 45px;
		}
	</style>
</head>
<body>
	<h2 style="color: skyblue; font-weight: normal;">Tambah Data Master Supplier Baru</h2>
	<hr>
	<form action="tambah.php" method="POST">
		<input type="hidden" name="tipe" value="tambah">
		<div class="field">
			<label for="nama"><b>Nama</b></label>
			<input type="text" name="nama" placeholder="Nama" size="30">  
		</div>

		<div class="field">
			<label for="telp"><b>Telp</b></label>
			<input type="text" name="telp" placeholder="Telp"> 
		</div>

		<div class="field">
			<label for="alamat"><b>Alamat</b></label>
			<input type="text" name="alamat" placeholder="Alamat">  
		</div>

		<div class="field">
			<button style="background: #80BD3F; margin-left: 130px;" type="submit" name="submit">Simpan</button>
			<button style="background: #D32329; margin-left: 5px;" type="reset" onclick="window.location.href='index.php'">Batal</button>
		</div>

		<?php if(!empty($kosong)):?>
			<p id="warning">
				<?= $kosong?>
			</p>
		<?php endif; ?>

	</form>

</body>
</html>
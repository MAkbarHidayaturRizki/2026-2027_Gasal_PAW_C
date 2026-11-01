<?php 
try {
	$koneksi = mysqli_connect("localhost", "root", "", "tp_05");
	$conn = mysqli_query($koneksi, "select * from supplier");
} catch (mysqli_sql_exception $e) {
	die("Koneksi ke database gagal:" . $e->getMessage());
};



if(isset($_POST["hapus"])) {
	$id = $_POST["id"];
	$delete = mysqli_query($koneksi, "DELETE FROM supplier where id = $id");
	header("Location: index.php");
};


 ?>

 <!DOCTYPE html>
 <html>
 <head>
 	<meta charset="utf-8">
 	<meta name="viewport" cotnent="width=device-width, initial-scale=1">
 	<title>Tugas Praktikum 05</title>
 	<style>
 		table,tr,td {
 			border: 1px solid darkgray;
 			border-collapse: collapse;
 		}

 		body {
		    font-family: Arial;
		}
 		#tambah {
 			color: white;
 			border: 1px solid darkgray;
 			border-radius: 5px;
 			background: #80BD3F;
 			padding: 5px 15px;
    		text-decoration: none;
    		margin-left: 285px;
 		}
 		#edit {
 			color: white;
 			border: 1px solid darkgray;
 			border-radius: 5px;
 			background: orangered;
 			padding: 5px 15px;
    		text-decoration: none;
    		font-size: 15px;
	 		}
 		#hapus {
 			color: white;
 			border: 1px solid darkgray;
 			border-radius: 5px;
 			background: #D32329;
 			padding: 5px 15px;
    		text-decoration: none;
    		font-size: 15px;
    	}
 	</style>
 </head>
 <body>
 	<h2 style="color: skyblue; font-weight: normal; display: inline;">Data Master Supplier</h2>
 	<a href="tambah.php" id="tambah">Tambah Data</a>
	<hr>
 	<table cellpadding="5">
 		<tr style="background: lightblue;">
 			<td style="width: 100px;">No</td>
 			<td style="width: 150px;">Nama</td>
 			<td style="width: 120px;">Telp</td>
 			<td style="width: 150px;">Alamat</td>
 			<td style="width: 145px;">Tindakan</td>
 		</tr>
 		<?php if (mysqli_num_rows($conn) > 0):?>
 			<?php $no = 1; ?>
	 		<?php while ($row = mysqli_fetch_assoc($conn)):?>
	 			<tr>
	 				<td><?= $no ?></td>
	 				<td><?= $row["nama"]?></td>
	 				<td><?= $row["telp"]?></td>
	 				<td><?= $row["alamat"]?></td>
	 				<td>
	 					<form method="POST" onsubmit="return confirm('Anda yakin akan menghapus supplier ini?')">
	 						<a href='edit.php?id=<?=$row["id"]?>' id="edit">Edit</a> 
	 						<input type="hidden" name="id" value='<?= $row["id"]?>'>
		 					<button type="submit" id="hapus" name="hapus">Hapus</button> 
		 				</form>
	 				</td>
	 			</tr>
	 			<?php $no++	; ?>
	 		<?php endwhile;?>
 		<?php endif;?>

 	</table>
 </body>
 </html>
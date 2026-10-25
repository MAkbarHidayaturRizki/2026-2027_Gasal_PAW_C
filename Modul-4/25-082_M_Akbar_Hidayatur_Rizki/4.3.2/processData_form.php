<?php
$surname = "";
$email = "";
$passwd = "";
$address = "";
$state = "";
$sex = "";
$vegetarian = "";
$errors = array();



if (isset($_POST['submit'])) {
    require_once 'validate.inc';
    validateName($errors, $_POST, 'surname');
    validateEmail($errors, $_POST, 'email');
    validatePassword($errors, $_POST, 'passwd');

    if ($errors) {
        echo '<h1>Invalid, correct the following errors:</h1>';
        foreach ($errors as $field => $error) {
            echo "$error</br>";
        }
        // tampilkan kembali form
        include 'form.inc';
    } else {
        echo 'Form submitted successfully with no errors';
    } 
} else {
    // tampilkan kembali form
    include 'form.inc';
};
?>




<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style> 

        .field {
            display: flex;
            align-items: center;
        }

        label {
            width: 120px;
            margin-left: 50px;
            flex-shrink: 0;
        }

        #fieldset {
            background-color: #DDDDFF;
        }
    </style>
</head>
<body>
</body>
</html>
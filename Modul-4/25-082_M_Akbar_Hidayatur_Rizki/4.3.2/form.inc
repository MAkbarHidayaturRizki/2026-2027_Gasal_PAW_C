<?php 
    require_once 'validate.inc';
    $option = cekValue($_POST, "state") ?? "-1";
    $radio = cekValue($_POST, "sex");
    $vegetarian = cekValue($_POST, "vegetarian");
?>
<fieldset id="fieldset">
    <legend>Person Details</legend>
    <form name="myForm" action="processData_form.php" method="POST">
        <div class="field">
            <label for="surname">Surname</label>
            <input type="text" name="surname" size="31" value="<?php  echo cekValue($_POST, "surname");?>"/>
        </div>
        <div class="field">
            <label for="email">Email address</label>
            <input type="text" name="email" size="31" value="<?php  echo cekValue($_POST, "email");?>"/>
        </div>
        <div class="field">
            <label for="passwd">Password</label>
            <input type="password" name="passwd" size="31" value="<?php  echo cekValue($_POST, "passwd");?>"/>
        </div>
        <div class="field">
            <label for="address">Street Address</label>
            <textarea name="address" rows="3" cols="22"><?php  echo cekValue($_POST, "address");?></textarea>
        </div>
        <div class="field">
            <label for="state">State</label>
            <select name="state">
                <option value ="-1" <?= $option == "-1" ? 'selected' : ''?>>[choose your state]</option>
                <option value ="1" <?= $option == "1" ? 'selected' : ''?>>Australian Capital Territory</option>
                <option value ="2" <?= $option == "2" ? 'selected' : ''?>>Queensland</option>
                <option value ="3" <?= $option == "3" ? 'selected' : ''?>>Wictoria</option>
                <option value ="4" <?= $option == "4" ? 'selected' : ''?>>New South Wales</option>
                <option value ="5" <?= $option == "5" ? 'selected' : ''?>>Tasmania</option>
                <option value ="6" <?= $option == "6" ? 'selected' : ''?>>South Australia</option>
                <option value ="7" <?= $option == "7" ? 'selected' : ''?>>Western Australia</option>
                <option value ="8" <?= $option == "8" ? 'selected' : ''?>>Nothern Territory</option>
            </select>
        </div>
        <div class="field">
            <input type="hidden" name="country" value="Australia">
        </div>
        <div class="field">
            <label for="sex">Gender</label>
            <input type="radio" name="sex" value="male" <?= $radio == "male" ? "checked" : ""?>/>Male
            <input type="radio" name="sex" value="female" <?= $radio == "female" ? "checked" : ""?>/>Female
        </div>
        <div class="field">
            <label for="vegetarian">Wegetarian ?</label>
            <input type="checkbox" name="vegetarian" <?=$vegetarian == "on" ? "checked" : ""?>/>
        </div>
        <div class="field">
            <label>&nbsp; </label>
            <input type="submit" value="Submit" name="submit" /><input type="reset" value="Reset" name="reset" />
        </div>
    </form>
</fieldset>
<?php
function validateName(&$errors, $field_list, $field_name) {
    $pattern = "/^[a-zA-Z'-]+$/"; // format surname (alfabet);
    if (!isset($field_list[$field_name]) || empty($field_list[$field_name])) {
        $errors[$field_name] = "$field_name is required";
    } else if (!preg_match($pattern, $field_list[$field_name])) {
        $errors[$field_name] = 'invalid name format';
    }
};
function validateEmail(&$errors, $field_list, $field_name) {
    if (!isset($field_list[$field_name]) || empty($field_list[$field_name])) {
        $errors[$field_name] = "$field_name is required";
    } else if (!filter_var($field_list[$field_name], FILTER_VALIDATE_EMAIL))
        $errors[$field_name] = 'invalid email';
    
};
function validatePassword(&$errors, $field_list, $field_name) {
    $pattern = "/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$/";
    if (!isset($field_list[$field_name]) || empty($field_list[$field_name])) {
        $errors[$field_name] = "$field_name is required";
    } else if (!preg_match($pattern, $field_list[$field_name])) {
        $errors[$field_name] = 'invalid password (minimal 8 karakter, memiliki huruf besar, huruf kecil, dan angka)';
    }
};

function cekValue($field_list, $field_name) {
    if (isset($field_list[$field_name])) {
        return htmlspecialchars($field_list[$field_name]);
    };
};

?>
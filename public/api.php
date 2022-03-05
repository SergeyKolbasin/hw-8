<?php

unset($_POST['apiMethod']);

if (empty($_POST['apiMethod'])) {
    error('не передан apiMethod');
}


die;

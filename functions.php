<?php
$is_auth = rand(0, 1);
$user_name = 'Valeria'; // Имя
$categorii = array("boards" => "Доски и лыжи", "attachment" => "Крепления", "boots" => "Ботинки", "clothing" => "Одежда", "tools" => "Инструменты", "other" => "Разное"); //Массив категорий
$tovari= array(array("name" => "2014 Rossignol District Snowboard", "category" => "Доски и лыжи", "cost" => 10999, "src" => "img/lot-1.jpg"),   //Массив товаров
            array("name" => "DC Ply Mens 2016/2017 Snowboard", "category" => "Доски и лыжи", "cost" => 159999, "src" => "img/lot-2.jpg"),
            array("name" => "Крепления Union Contact Pro 2015 года размер L/XL", "category" => "Крепления", "cost" => 8000, "src" => "img/lot-3.jpg"),
            array("name" => "Ботинки для сноуборда DC Mutiny Charocal", "category" => "Ботинки", "cost" => 10999, "src" => "img/lot-4.jpg"),
            array("name" => "Куртка для сноуборда DC Mutiny Charocal", "category" => "Одежда", "cost" => 7500, "src" => "img/lot-5.jpg"),
            array("name" => "Маска Oakley Canopy", "category" => "Разное", "cost" => 5400, "src" => "img/lot-6.jpg"));
//Фунция 3его задания
    
$rub_visible = true;

function price ($q,$e)
    {  
     $q = ceil($q);
        if($e == true)
        { $b = '<p class="rub">р</p>'; }
        else { $b = ''; }
        if($q < 1000)
        { return $q . $b; }
        else { return number_format($q, 0, " ", " ") . $b; }     
    }
    //Функция 4ого задания
function include_template($name, $data) 
{
    $name = 'templates/' . $name;
    $result = '404';

    if (!file_exists($name)) {
        return $result;
    }

    ob_start();
    extract($data);
    require $name;

    $result = ob_get_clean();

    return $result;
}

?>
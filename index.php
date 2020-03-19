<?php
require_once('functions.php');

$page_content = include_template('index.php', [
   'categorii' => $categorii,
   'tovari' => $tovari,
   'rub_visible' => $rub_visible
]);

$layout_content = include_template('layout.php', [
  'page_title' => 'Главная страница',
  'is_auth' => $is_auth,
  'user_avatar' => $user_avatar,
  'user_name' => $user_name,
  'page_content' => $page_content,
  'categorii' => $categorii
  ]);
  print($layout_content);
?>

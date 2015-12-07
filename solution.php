<?php
    require_once "connect.php";

    $db = new PDO("mysql:host=localhost;dbname=university", 'root', '');
    $sql = "Select sol.* from Solutions sol join Tasks tas on (sol.Ident_Task=tas.Ident_Task); WHERE tas.Ident_Task=" . $_GET['task'];
    $rez = $db->query($sql)->fetchAll();
//echo "<pre>";
//var_dump($rez);
//echo "</pre>";
//exit;
?>

<!DOCTYPE html>
<html>
<head>
    <title>Завдання</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="bootstrap.min.css">
</head>
<body>

<div id="header">
    <div class="container">
        <ul>
            <li><a href="/" class="btn btn-default navbar-btn">Головна</a></li>
            <li><a href="/teachers.php" class="btn btn-default navbar-btn">Викладачі</a></li>
            <li><a href="/subjects.php" class="btn btn-default navbar-btn">Предмети</a></li>
            <li><a href="/faculties.php" class="btn btn-default navbar-btn">Факультети</a></li>
            <li><a href="/solutions.php" class="btn btn-default navbar-btn">Рішення</a></li>
        </ul>
    </div>
</div>
        <div id="content">
            <div class="container">
                <table class="table table-hover">
                    <thead>
                    <th>Ident_St</th>
                    <th>SLink</th>
                    <th>SDate</th>
                    </thead>
                    <tbody>
                    <?php foreach ($rez as $subject): ?>
                        <tr>
                            <td><?php echo $subject["Ident_St"]; ?></td>
                            <td><?php echo $subject["SLink"]; ?></td>
                            <td><?php echo $subject["SDate"]; ?></td>
                        </tr>
                    <?php endforeach; ?>
                    </tbody>
                </table>
            </div>

        </div>
    </div>

</body>
</html>
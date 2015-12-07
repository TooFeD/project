<?php
    require_once "connect.php";

    $sql = "Select * from Faculties";
	    $db->query("SET NAMES utf8");
    $rez = $db->query($sql)->fetchAll();
//echo "<pre>";
//var_dump($rez[0]);
//echo "</pre>";
//exit;
?>

<!DOCTYPE html>
<html>
<head>
    <title>Групи</title>
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
                    <th>Ident_Fac</th>
                    <th>Name_Fac</th>
                    <th>Link</th>
                    </thead>
                    <tbody>

                    <?php foreach ($rez as $faculties): ?>
                        <tr>
                            <td><?php echo $faculties["Ident_Fac"]; ?></td>
                            <td><?php echo $faculties["Name_Fac"]; ?></td>
                            <td><a href="/groups.php?fac=<?php echo $faculties["Ident_Fac"]; ?>">Show groups</a></td>
                        </tr>
                    <?php endforeach; ?>

                    </tbody>
                </table>
            </div>

        </div>
    </div>

</body>
</html>
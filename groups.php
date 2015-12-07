<?php
    require_once "connect.php";

    $sql = "Select * from Groups gr join Faculties fac on (gr.Ident_Fac = fac.Ident_Fac) WHERE fac.Ident_Fac=" . $_GET['fac'];
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
    <title>Предмети</title>
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
                    <th>Ident_Group</th>
                    <th>Name_Gr</th>
                    <th>Count_St</th>
                    <th>Name_Fac</th>
                    <th>Students</th>
                    </thead>
                    <tbody>

                    <?php foreach ($rez as $group): ?>
                        <tr>
                            <td><?php echo $group["Ident_Group"]; ?></td>
                            <td><?php echo $group["Name_Gr"]; ?></td>
                            <td><?php echo $group["Count_St"]; ?></td>
                            <td><?php echo $group["Name_Fac"]; ?></td>
                            <td><a href="/students.php?students=<?php echo $group["Ident_Group"]; ?>">Students</a></td>
                        </tr>
                    <?php endforeach; ?>

                    </tbody>
                </table>
            </div>

        </div>
    </div>

</body>
</html>
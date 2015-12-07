<?php
    require_once "connect.php";

    $sql = "Select st.* from Students st join Groups gr on (st.Ident_Group = gr.Ident_Group) WHERE gr.Ident_Group=" . $_GET['students'];
	    $db->query("SET NAMES utf8");
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
                    <th>SFull_name</th>
                    </thead>
                    <tbody>

                    <?php foreach ($rez as $student): ?>
                        <tr>
                            <td><?php echo $student["Ident_St"]; ?></td>
                            <td><?php echo $student["SFull_name"]; ?></td>
							<td><a href="/add_st.php">Додати</a></td>
                        </tr>
                    <?php endforeach; ?>
                    </tbody>
                </table>
            </div>

        </div>
    </div>

</body>
</html>
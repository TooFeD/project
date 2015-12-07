<?php
require_once "connect.php";   

    $sql = "Select tas.* from Tasks tas join Subjects sub on (tas.Ident_Subj=sub.Ident_Subj) WHERE sub.Ident_Subj=" . $_GET['sub'];
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
                    <th>Ident_Task</th>
                    <th>TLink</th>
                    <th>Deadline</th>
                    <th>Solution</th>
                    </thead>
                    <tbody>

                    <?php foreach ($rez as $subject): ?>
                        <tr>
                            <td><?php echo $subject["Ident_Task"]; ?></td>
                            <td><?php echo $subject["TLink"]; ?></td>
                            <td><?php echo $subject["Deadline"]; ?></td>
                            <td><a href="/solution.php?task=<?php echo $subject["Ident_Task"]; ?>">Show solution</a></td>
                        </tr>
                    <?php endforeach; ?>

                    </tbody>
                </table>
            </div>

        </div>
    </div>

</body>
</html>
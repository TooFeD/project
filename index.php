<?php
    require_once "connect.php";

    $sql = "select st.Ident_St, st.SFull_name, t.Ident_Task, t.Deadline from Students st join Solutions s on (st.Ident_St = s.Ident_St) join Tasks t on (s.Ident_Task = t.Ident_Task) join Groups gr on (gr.Ident_Group = st.Ident_Group) where (select count(Ident_Task) from Tasks where Ident_Group = (select Ident_Group from Students where Ident_St = st.Ident_St)) =  (select count(Ident_Task) from Solutions where Ident_St = (select Ident_St from Students where Ident_St=st.Ident_St))";
    $rez = $db->query($sql)->fetchAll();
//echo "<pre>";
//var_dump($rez);
//echo "</pre>";
//exit;
?>

<!DOCTYPE html>
<html>
<head>
    <title>home</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="bootstrap.min.css">
</head>
<body>

<div id="header">
    <div class="container">
        <ul>
            <li><a href="/test" class="btn btn-default navbar-btn">Головна</a></li>
            <li><a href="/test/teachers.php" class="btn btn-default navbar-btn">Викладачі</a></li>
            <li><a href="/test/subjects.php" class="btn btn-default navbar-btn">Предмети</a></li>
            <li><a href="/test/faculties.php" class="btn btn-default navbar-btn">Факультети</a></li>
            <li><a href="/test/solutions.php" class="btn btn-default navbar-btn">Рішення</a></li>
        </ul>
    </div>
</div>
        <div id="content">
            <div class="container">
                <table class="table table-hover">
                    <thead>
                    <th>Ident_St</th>
                    <th>SFull_name</th>
                    <th>Ident_Task</th>
                    <th>Deadline</th>
                    </thead>
                    <tbody>

                    <?php foreach ($rez as $student): ?>
                        <tr>
                            <td><?php echo $student["Ident_St"]; ?></td>
                            <td><?php echo $student["SFull_name"]; ?></td>
                            <td><?php echo $student["Ident_Task"]; ?></td>
                            <td><?php echo $student["Deadline"]; ?></td>
                        </tr>
                    <?php endforeach; ?>

                    </tbody>
                </table>
            </div>

        </div>
    </div>

</body>
</html>
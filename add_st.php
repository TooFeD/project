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
                <form method="post" action="/adds.php">
					<span>Група</span>
					<input type="text" name="ident_group" >
					<span>ПІБ</span>
					<input type="text" name="sfull_name" >
					<span>Пільга</span>
					<input type="text" name="privilege" >
					<input type="submit" value="OK">
				</form>
            </div>

        </div>
    </div>

</body>
</html>
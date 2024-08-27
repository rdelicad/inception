<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to My Website</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            color: #333;
            text-align: center;
            margin-top: 50px;
        }
        h1 {
            color: #0073e6;
        }
        table {
            margin: 20px auto;
            border-collapse: collapse;
            width: 60%;
            max-width: 600px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #0073e6;
            color: #fff;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
    </style>
</head>
<body>
    <h1>Welcome to My PHP Website</h1>
    <p>This is a simple PHP page.</p>

    <table>
        <thead>
            <tr>
                <th>Feature</th>
                <th>Description</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>PHP Version</td>
                <td><?php echo phpversion(); ?></td>
            </tr>
            <tr>
                <td>Server Software</td>
                <td><?php echo $_SERVER['SERVER_SOFTWARE']; ?></td>
            </tr>
            <tr>
                <td>Client IP Address</td>
                <td><?php echo $_SERVER['REMOTE_ADDR']; ?></td>
            </tr>
            <tr>
                <td>Current Date and Time</td>
                <td><?php echo date('Y-m-d H:i:s'); ?></td>
            </tr>
        </tbody>
    </table>
</body>
</html>


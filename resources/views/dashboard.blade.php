<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Welcome to Dashboard</title>
</head>
<body>
   <hr>
   <table class='table'>
      <thead>
        <th>Name</th>
        <th>E-Mail</th>
        <th>Action</th>

      </thead>

      <tbody>
           <td>{{ $data->name  }}</td>
           <td>{{ $data->email }}</td>
           <td><a href="logout">Logout</a></td>
      </tbody>

   </table>
</body>
</html>
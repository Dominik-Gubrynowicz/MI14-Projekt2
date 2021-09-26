# Player diplay

## Setup:
#### Databse:

 - MariaDB / MySQL
 - Import `klub_sportowy.sql` database

#### Xampp:  

- Move src contents to htdoc
- Modify the parameters in `get-clubs.php` file:

```injectablephp
//db config
$db_host = 'localhost';
$db_user = 'root';
$db_pass = '';
$db_name = 'klub_sportowy';
  ```
- visit your site on the localhost

#### Docker:

- Navigate terminal path to mi14-2 directory
- Run `docker-compose -d up` command
- Modify the parameters of `get-clubs.php` file:

```injectablephp
//db config
$db_host = 'mi14db';
$db_user = 'root';
$db_pass = 'qwerty';
$db_name = 'klub_sportowy';
```
 - Your site would be available on: `localhost:8000`
 - Your phpMyAdmin would be available on `localhost:8080`
 - At the end we recommend to cleanup resources using `docker-compose down` command from the root of the project



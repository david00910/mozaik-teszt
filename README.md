# mozaik-teszt

Applikáció setup:

1. Git pull
2. A '.env.example' fájlt módosítani '.env'-re, majd a benne lévő config fáljban az adatbázis nevét, felhasználónevet/jelszót (ha van) módosítani.
4. composer install
5. php artisan key:generate
6. npm install
7. A 'resources/includes' mappában van egy saját SQL dump, ami létrhozza, majd feltölti az adatbázis táblákat a szükséges adatokkal (megyékkel és székhelyekkel a másik táblát). Ezt lefuttatni egy adatbázis-kezelőben. (MySQL Workbench vagy phpMyadmin)
8. php artisan serve (elindít egy local szervert. Ha megy az adatbázis és kapcsolódik a .env fáljban beállított adatok alapján, akkor mennie kell mindennek)

A webapplikáció Laravel 7x és VueJS 3x 

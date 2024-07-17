@echo off

start "" "C:\xampp\xampp_start.exe"
timeout /t 10 /nobreak >nul

start cmd /c "cd C:\xampp\htdocs\projects\largGYM\githup\GYM-site\GYM-site\laragym-main && php artisan serve"
timeout /t 5 /nobreak >nul

start cmd /c "cd C:\xampp\htdocs\projects\largGYM\githup\GYM-site\GYM-site\laragym-main\resources\apps\admin && npm run dev"
timeout /t 10 /nobreak >nul

start chrome http://localhost:5173/

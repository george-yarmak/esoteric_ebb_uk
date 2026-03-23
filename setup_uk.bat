@echo off
chcp 65001 >nul
title Українізатор Esoteric Ebb
echo ==========================================
echo      Українізатор Esoteric Ebb 
echo ==========================================
echo.

set "DATA_DIR=Esoteric Ebb_Data"
set "PATCH_DIR=patches_uk"

if not exist "%DATA_DIR%\resources.assets" (
    echo [Помилка] Не знайдено файли гри! 
    echo Будь ласка, переконайтеся, що цей скрипт запущено з головної папки гри
    echo ^(там, де лежить файл Esoteric Ebb.exe^).
    echo.
    pause
    exit
)

if not exist "xdelta3.exe" (
    echo [Помилка] Не знайдено програму xdelta3.exe! Перевірте цілісність архіву.
    echo.
    pause
    exit
)

echo Встановлюю.
echo.

for %%f in ("%PATCH_DIR%\*.xdelta") do (
    echo Оновлення %%~nf...
    xdelta3.exe -d -f -s "%DATA_DIR%\%%~nf" "%%f" "%DATA_DIR%\%%~nf.tmp"
    move /y "%DATA_DIR%\%%~nf.tmp" "%DATA_DIR%\%%~nf" >nul
)

echo.
echo ==========================================
echo Готово
echo ==========================================
pause
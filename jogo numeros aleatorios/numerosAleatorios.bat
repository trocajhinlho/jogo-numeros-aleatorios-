@echo off
rem comentario
title Exercicio - Sorteio
mode 60,40
color 9F


:inicio
cls
SET /A test=%RANDOM% * 50 / 32768 + 1
set /A cont = 5
goto:gamestart

:gamestart
cls

echo.
echo                       (o o)
echo ------------------ooO--(_)--Ooo---------------------
echo  ADIVINHE O NUMERO QUE SERA SORTEADO ENTRE 01 E 50
echo ----------------------------------------------------
echo       QUANTIDADE DE TENTATIVAS: %cont%
echo ----------------------------------------------------
echo.
echo.
set /p palpite=Digite o seu Palpite:

set /A cont= %cont% - 1

if %cont% == -1 (
goto:gameover )

if %palpite% == %test% (
goto:fim )

if %palpite% GTR 50 (goto:numinvalido)

if %palpite% LEQ 1 (goto:numinvalido ) else (
goto:tentativas )



:numinvalido
echo.
echo ----------------------------------------------------
echo            DIGITE UM VALOR ENTRE 01 E 50!
echo ----------------------------------------------------
pause > nul
goto:gamestart 

:tentativas
echo.
echo ----------------------------------------------------
echo              TENTE A SORTE NOVAMENTE!
echo ----------------------------------------------------
pause > nul
goto:gamestart

:fim
echo.
echo ----------------------------------------------------
echo                      YOU WIN! ! !
echo ----------------------------------------------------
set /p sair=Deseja Iniciar novo jogo: [S/N]
if /i %sair% == S (goto:inicio) else (exit)

:gameover
echo.
echo ----------------------------------------------------
echo                      VOCE PERDEU!
echo                VALOR SORTEADO: %test%
echo ----------------------------------------------------
set /p sair=Deseja Iniciar novo jogo: [S/N]
if /i %sair% == S (goto:inicio) else (exit)
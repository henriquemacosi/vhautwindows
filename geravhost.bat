REM[Desenvolvido por Lauro Guedes - leowgweb.com]
:: https://github.com/lauroguedes/vhautwindows
:: http://tableless.com.br/como-automatizar-criacao-de-virtual-hosts/
:: https://www.youtube.com/watch?v=V5dTgaUfUgU
@ECHO OFF
CLS
:: Caminho para o arquivo hosts
cd c:\windows\system32\drivers\etc
:: Variavel NOME = nova url (ex.: omeuprojeto.dev)
SET /P NOME=Insira o nome do host:
echo 127.0.0.1		%NOME% >> hosts

REM[Desenvolvido para WAMP por Henrique Macosi - henriquemacosi.com]

cd / 
:: Variavel APACHE = caminho para o arquivo httpd-vhosts.conf
:: Versão do Apache = wamp (left click) > apache > version 
SET APACHE=c:\wamp\bin\apache\apache2.2.22\conf\extra\httpd-vhosts.conf
:: Variavel CAMINHO = caminho para o projeto (ex.: c:\wamp\www\omeuprojeto)
SET /P CAMINHO=Insira o caminho:

echo. >> %APACHE%
echo # %NOME% VirtualHost>> %APACHE%
echo ^<^VirtualHost *:80^>^ >> %APACHE%
echo 	ServerAdmin admin@localhost.com >> %APACHE%
echo 	DocumentRoot ^"^%CAMINHO%^"^ >> %APACHE%
echo 	ServerName %NOME% >> %APACHE%
echo 	ServerAlias %NOME% >> %APACHE%
echo   	^<^Directory ^"^%CAMINHO%^"^>^ >> %APACHE%
echo 		AllowOverride All >> %APACHE%
echo 		Allow from all >> %APACHE%
echo 	^<^/Directory^>^ >> %APACHE%
echo ^<^/VirtualHost^>^ >> %APACHE%
echo.
:: Para ter efeito o apache deverá de ser reiniciado
echo REINICIAR APACHE
cd wamp/www

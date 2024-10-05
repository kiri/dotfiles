@echo off
rem 管理者権限で実行する
cd /d %~dp0

mklink /d %USERPROFILE%\.goneovim %~dp0\goneovim\.goneovim
mklink /d %LOCALAPPDATA%\nvim %~dp0\neovim\nvim

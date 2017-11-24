del *.flv
for /r %%v in (*.gif) do gifsicle --crop 0,120+431x431 "%%v" -o "%%v"
del script.bat
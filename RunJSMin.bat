@echo off
SET JSDir=D:\jsmin\js\
SET JSNew=D:\jsmin\minjs\
CALL JsMinfy.bat %JSDir% app.15b69265169196478ee3.js %JSNew%
CALL JsMinfy.bat %JSDir% manifest.48a656e28a597906ad2a.js %JSNew%
CALL JsMinfy.bat %JSDir% vendor.eacbc029ff7e032206c0.js %JSNew%

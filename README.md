# jsmin
基于jsmin.exe 压缩程序做的js压缩脚步,可以直接把文件夹里面的所有js进行压缩，并且生成新的文件夹！

#http://www.crockford.com/javascript/jsmin.zip
在上面的链接下载使用与MS-DOC的文件，

#2019年3月30号
下载完成后运行cmd，
然后在命令提示符输入：
C:\jsmin.exe <C:\before.js>C:\after.js

C:\jsmin.exe 为jsmin.exe的位置；

C:\before.js 为需要压缩的文件位置和文件名；

C:\after.js 为压缩后的文件位置和文件名
必须填写绝对路径，
js文件的编码最好为utf-8。
使用JSMin压缩js文件，
文件必须符合JSLint的编写风格，
不然容易出现错误。

JSMin的压缩主要是清除多余空白和备注。



#2019年5月30号

#更新 添加了spannedFile.bat 文件

直接打开 spannedFile.bat，输入你需要压缩的文件路径 ，

可以直接输入文件路径来直接生成 RunJSMin.bat文件，并且运行jsmin.exe,
文件路径下的js直接 压缩在当前的路径的minjs文件夹下面

比如：D:\jsmin\js 为生成的目录
压缩后的js 存放在D:\jsmin\minjs下面

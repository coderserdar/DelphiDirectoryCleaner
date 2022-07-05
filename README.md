# Delphi Directory Cleaner

![GitHub stars](https://img.shields.io/github/stars/coderserdar/DelphiDirectoryCleaner?style=social) ![GitHub forks](https://img.shields.io/github/forks/coderserdar/DelphiDirectoryCleaner?style=social) ![GitHub watchers](https://img.shields.io/github/watchers/coderserdar/DelphiDirectoryCleaner?style=social) ![GitHub repo size](https://img.shields.io/github/repo-size/coderserdar/DelphiDirectoryCleaner?style=plastic) ![GitHub language count](https://img.shields.io/github/languages/count/coderserdar/DelphiDirectoryCleaner?style=plastic) ![GitHub top language](https://img.shields.io/github/languages/top/coderserdar/DelphiDirectoryCleaner?style=plastic) ![GitHub last commit](https://img.shields.io/github/last-commit/coderserdar/DelphiDirectoryCleaner?color=red&style=plastic) ![GitHub issues](https://img.shields.io/github/issues/coderserdar/DelphiDirectoryCleaner)

This is a **Windows Console** app which is used to *clear temp Delphi files* from a folder in file system.
This app is written in **Delphi** programming language and in **Delphi 7** IDE.

This app works by two methods.
 - If you run console app with double click, app will clear the temp files in folder which is app's location folder.
 - If you run app by command prompt with a specific path, app will clear the temp files in folder which we gave as a parameter.
 
 Actually [CnPack](http://www.cnpack.org/showdetail.php?id=385&lang=en) plug in for *Delphi IDE* makes it with one click. 
 In Delphi project compilation, IDE creates temp files with extension like *.dcu* etc.
 But I want to make it by myself with a recursive algorithm. 

# Documentation and Screenshots

You can look up the source code's documentation in [Documentation](https://github.com/coderserdar/DelphiDirectoryCleaner/blob/main/Documentation/DelphiDirectoryCleaner.pdf) section. In this *PDF* file you can analyze source code. This PDF file supports Hyperlink, so you can go to a specific function easily. I try to write detailed comments in functions.

program prjDelphiDirectoryCleaner;

{$APPTYPE CONSOLE}

// DeleteFile ve FindClose metotlarýnýn düzgün çalýþabilmesi için
// uses kýsmýnda WinTypes uniti, SysUtils'in önünde olmalýdýr
// Yoksa FindClose metodunda aþaðýdaki koddaki gibi TSearchRec
// yerine Cardinal türünde parametre alýyor
// bu nokta önemli dikkat edilmeli
uses
  Windows, WinTypes, SysUtils;

var
  directoryPath: string;


// bu metot recursive bir þekilde belirtilen klasörü dolaþýyor
// varsa alt klasörüne gidiyor
// yoksa da dosyanýn isimlerini kontrol ediyor
// dosya uzantýsý .dcu olan veya .~ gibi olan bütün dosyalarý
// tek tek siliyor
// sildiði dosyalarýn bilgilerini de console üzerinde gösteriyor

procedure DeleteTempFiles(directoryPath: string);
var
  deleteFileRec: TSearchRec;
  result: Integer;
begin
  result := FindFirst(directoryPath + '\*.*', faDirectory, deleteFileRec);
  while result = 0 do
  begin
    if (deleteFileRec.Name <> '.') and (deleteFileRec.Name <> '..') then
    begin
      DeleteTempFiles(directoryPath + '\' + deleteFileRec.Name);
    end;
    result := FindNext(deleteFileRec);
  end;
  FindClose(deleteFileRec);

  result := FindFirst(directoryPath + '\*.~*', faAnyFile, deleteFileRec);
  while result = 0 do
  begin
    if not DeleteFile(PAnsiChar(directoryPath + deleteFileRec.Name)) then
    begin
      FileSetAttr(directoryPath + deleteFileRec.Name, 0);
      DeleteFile(PAnsiChar(directoryPath + '\' + deleteFileRec.Name));
      Writeln('The file ' + directoryPath + '\' + deleteFileRec.Name + ' has been deleted');
    end;
    result := FindNext(deleteFileRec);
  end;
  FindClose(deleteFileRec);

  result := FindFirst(directoryPath + '\*.dcu', faAnyFile, deleteFileRec);
  while result = 0 do
  begin
    if not DeleteFile(PAnsiChar(directoryPath + deleteFileRec.Name)) then
    begin
      FileSetAttr(directoryPath + deleteFileRec.Name, 0);
      DeleteFile(PAnsiChar(directoryPath + '\' + deleteFileRec.Name));
      Writeln('The file ' + directoryPath + '\' + deleteFileRec.Name + ' has been deleted');
    end;
    result := FindNext(deleteFileRec);
  end;
  FindClose(deleteFileRec);
end;

// program bir console application
// burada önemli olan nokta ise
// eðer bu exe dosyasý çalýþtýrýlýrken parametre almýþsa
// aldýðý parametre dosyalarýn silineceði dizin oluyor ve
// ilgili metoda yönlendiriyor
// parametre almazsa bulunduðu klasördeki dosyalarý silmeye baþlýyor
begin
  if ParamCount = 1 then
  begin
    directoryPath := ParamStr(1);
    if DirectoryExists(directoryPath) then
    begin
      DeleteTempFiles(directoryPath);
    end;
  end
  else
  begin
    directoryPath := GetCurrentDir;
    DeleteTempFiles(directoryPath);
  end;
//  Writeln(directoryPath);
//  Writeln('Press a key to terminate program');
//  Readln(a);
end.


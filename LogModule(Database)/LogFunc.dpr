library LogFunc;

{
Company: HyperSoftware
Author: Halil Han Badem }

uses
 System.SysUtils,
 System.Classes,
 Winapi.Windows,
 Uni, SQLServerUniProvider;
{$R *.res}


Procedure Log(SLog, CString, TAdi: String);
var
Baglanti: TUniConnection;
Query: TUniQuery;
Provider: TSQLServerUniProvider;
begin
Provider := TSQLServerUniProvider.Create(nil);

Baglanti := TUniConnection.Create(nil);
Baglanti.ConnectString := CString;
Baglanti.Connected := True;


Query := TUniQuery.Create(nil);

Query.Connection := Baglanti;
Query.SQL.Text := 'select * from '+TAdi;
Query.Active := True;

Query.SQL.Text := 'insert into '+TAdi+' (Date, Comment) VALUES(:Date, :Comment)';
Query.ParamByName('Date').AsDateTime := Now;
Query.ParamByName('Comment').AsString := SLog;
Query.ExecSQL;
end;

Exports Log;

begin
end.
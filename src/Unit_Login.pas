unit Unit_Login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, sLabel, sButton, sEdit, ExtCtrls, sPanel, IBDatabase,
  DB, IBCustomDataSet, IBQuery, ActiveX;  //, WbemScripting_TLB

type
  TForm_Login = class(TForm)
    sPanel_Login: TsPanel;
    sEdit_Login: TsEdit;
    sEdit_Pass: TsEdit;
    sButton_Login: TsButton;
    sLabel1: TsLabel;
    sLabel2: TsLabel;
    sPanel_Activation: TsPanel;
    sLabel3: TsLabel;
    sLabel4: TsLabel;
    sEdit_key: TsEdit;
    sButton_active: TsButton;
    sButton2: TsButton;
    sButton1: TsButton;
    procedure sButton1Click(Sender: TObject);
    procedure sButton2Click(Sender: TObject);
    procedure sButton_activeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sButton_LoginClick(Sender: TObject);
    procedure sEdit_keyKeyPress(Sender: TObject; var Key: Char);
    procedure sEdit_PassKeyPress(Sender: TObject; var Key: Char);
    procedure sEdit_LoginKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Login: TForm_Login;

implementation

uses Unit_Main;

{$R *.dfm}

{
function GetWMIstring (wmiHost, wmiClass, wmiProperty : string):string; 
var  // These are all needed for the WMI querying process 
  Locator:  ISWbemLocator;
  Services: ISWbemServices; 
  SObject:  ISWbemObject; 
  ObjSet:   ISWbemObjectSet; 
  SProp:    ISWbemProperty; 
  Enum:     IEnumVariant; 
  Value:    Cardinal; 
  TempObj:  OleVariant; 
  SN: string; 
begin 
  try 
  Locator := CoSWbemLocator.Create;  // Create the Location object 
  // Connect to the WMI service, with the root\cimv2 namespace 
   Services :=  Locator.ConnectServer(wmiHost, 'root\cimv2', '', '', '','', 0, nil); 
  ObjSet := Services.ExecQuery('SELECT * FROM '+wmiClass, 'WQL', 
    wbemFlagReturnImmediately and wbemFlagForwardOnly , nil); 
  Enum :=  (ObjSet._NewEnum) as IEnumVariant; 
  while (Enum.Next(1, TempObj, Value) = S_OK) do 
  begin 
    SObject := IUnknown(tempObj) as ISWBemObject; 
    SProp := SObject.Properties_.Item(wmiProperty, 0); 
    if VarIsNull(SProp.Get_Value) then 
      result := '' 
    else 
    begin 
      SN := SProp.Get_Value; 
      result :=  SN; 
    end; 
  end; 
  except // Trap any exceptions (Not having WMI installed will cause one!) 
   on exception do 
    result := ''; 
   end;
end;
}

//---------------------------------------------------------------------------------------------------------------\\
function GetHardDiskSerial(const DriveLetter: Char): string;
var
  NotUsed:     DWORD;
  VolumeFlags: DWORD;
  VolumeInfo:  array[0..MAX_PATH] of Char;
  VolumeSerialNumber: DWORD;
begin
  GetVolumeInformation(PChar(DriveLetter + ':\'),
    nil, SizeOf(VolumeInfo), @VolumeSerialNumber, NotUsed,
    VolumeFlags, nil, 0);
  Result := Format('Label = %s   VolSer = %8.8X',
    [VolumeInfo, VolumeSerialNumber]);
  Result := Format('%0.8X',[VolumeSerialNumber]);
end;
//---------------------------------------------------------------------------------------------------------------\\

procedure TForm_Login.sButton1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm_Login.sButton2Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm_Login.sButton_activeClick(Sender: TObject);
begin
  if Trim(sEdit_key.Text) = GetHardDiskSerial('c') then
  begin
    with Form_Main.Qu1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('delete from VERIFY');
      ExecSQL;
      Close;
      SQL.Clear;
      SQL.Add('insert into VERIFY (SN) values ('''+Trim(sEdit_key.Text)+''')');
      ExecSQL;
    end;
    Form_Main.IBTransaction1.Commit;
    sPanel_Login.Visible:=true;
    sPanel_Activation.Visible:=false;
    MessageDlg('Программа успешно активировано',mtInformation,[mbOK],1);
  end else
  begin
    sLabel3.Caption := 'Неверный код активации';
    sLabel3.Font.Color := clred;
  end;
end;

procedure TForm_Login.FormCreate(Sender: TObject);
begin
  Form_Main.Qu1.Close;
  Form_Main.Qu1.SQL.Clear;
  Form_Main.Qu1.SQL.Add('select * from Verify');
  Form_Main.Qu1.Open;
  if Form_Main.Qu1.FieldByName('SN').AsString = GetHardDiskSerial('c') then
  begin
    sPanel_Login.Visible:=true;
    sPanel_Activation.Visible:=false;
  end else
  begin
    sPanel_Activation.Visible:=true;
    sPanel_Login.Visible:=false;
  end;
  if Form_Main.Qu1.FieldByName('isFirst').AsString = '0' then
    isFirst := true
  else isFirst := false;
end;

procedure TForm_Login.sButton_LoginClick(Sender: TObject);
var qwe: integer;
begin
  Form_Main.Qu1.Close;
  Form_Main.Qu1.SQL.Clear;
  Form_Main.Qu1.SQL.Add('select count(*) as qwe from LOGIN where LOGIN='+QuotedStr(sEdit_Login.Text)+' and PASS='+QuotedStr(sEdit_Pass.Text));
  Form_Main.Qu1.Open;
  qwe := Form_Main.Qu1.FieldByName('qwe').AsInteger;
  if qwe>0 then
  begin
    Close;
    myb := true;
    UsrName := sEdit_Login.Text;
  end else
  begin
    MessageDlg('Неверное имя пользователя или пароль',mtError,[mbOK],0);
    sEdit_Pass.Text := '';
    sEdit_Login.SetFocus;
  end;
end;

procedure TForm_Login.sEdit_keyKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then sButton_active.Click;
end;

procedure TForm_Login.sEdit_PassKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then sButton_Login.Click;
end;

procedure TForm_Login.sEdit_LoginKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then sButton_Login.Click;
end;

end.

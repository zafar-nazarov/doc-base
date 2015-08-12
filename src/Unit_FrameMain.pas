unit Unit_FrameMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, Buttons, sSpeedButton, IBTable, DB;

type
  TFrame_Main = class(TFrame)
    sSpeedButton_Open: TsSpeedButton;
    sSpeedButton_Save: TsSpeedButton;
    procedure sSpeedButton_OpenClick(Sender: TObject);
    procedure FrameMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sSpeedButton_SaveClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses Unit_Main, Unit_Add;

{$R *.dfm}

procedure TFrame_Main.sSpeedButton_OpenClick(Sender: TObject);
begin
  Form_Add := TForm_Add.Create(Application);
  try
    Form_Add.ShowModal;
  finally
    if SaveBtnStatus=1 then
      sSpeedButton_Save.Enabled := true;
    Form_Add.free;
    Form_Add:=nil;
  end;
end;

procedure TFrame_Main.FrameMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  CurrPicName := '';
  Form_Main.PicNormal;
end;

procedure TFrame_Main.sSpeedButton_SaveClick(Sender: TObject);
var
  i, step, kol: integer;
begin
  kol := 0;
  Form_Main.IBTransaction1.Active := true;
  Form_Main.IBTable1.Active := true;
  Form_Main.sGauge1.Visible := true;
  Form_Main.sGauge1.Progress := 0;
  step := round(100/docs_kol);
  for i:=0 to docs_kol-1 do
  begin
    if (docs[i]<>nil) and (docs[i].state=0) then
    begin
      try
        Form_Main.IBTable1.Insert;
        Form_Main.IBTable1.FieldValues['ID'] := '0';
        Form_Main.IBTable1.FieldValues['NAME'] := docs[i].Title;
        Form_Main.IBTable1.FieldValues['CREATEDDATE'] := docs[i].cDate;
        Form_Main.IBTable1.FieldValues['DESC'] := docs[i].Desc;
        Form_Main.IBTable1.FieldValues['CONAGENT'] := docs[i].Conag;
        docs[i].buff.Position := 0;
        TBlobField(Form_Main.IBTable1.FieldByName('DOCFILE')).LoadFromStream(docs[i].buff);
        Form_Main.IBTable1.Post;
        docs[i].state := 1;
        kol := kol+1;
      except
        Form_Main.IBTable1.Cancel;
      end;
    end;
    Form_Main.sGauge1.Progress := Form_Main.sGauge1.Progress + step;
  end;
  Form_Main.IBTransaction1.Commit;
 // ShowMessage('Всего '+IntToStr(kol)+' документ(ов) было сохранено'));
  Form_Main.sGauge1.Progress := 0;
  Form_Main.sGauge1.Visible := false;
  Form_Main.PicsShow;
  sSpeedButton_Save.Enabled := false;
end;

end.

unit Unit_Pic;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, sPanel, StdCtrls, sButton, Buttons, sSpeedButton,
  sBevel;

type
  TForm_Pic = class(TForm)
    Image1: TImage;
    sPanel_Bottom: TsPanel;
    sSpeedButton_Print: TsSpeedButton;
    sButton_Close: TsButton;
    sBevel1: TsBevel;
    PrintDialog1: TPrintDialog;
    procedure sButton_CloseClick(Sender: TObject);
    procedure sSpeedButton_PrintClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Pic: TForm_Pic;

implementation

{$R *.dfm}

procedure TForm_Pic.sButton_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TForm_Pic.sSpeedButton_PrintClick(Sender: TObject);
begin
  PrintDialog1.Execute;
end;

end.

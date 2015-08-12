unit Unit_FrameTemps;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, sListView, Buttons, sSpeedButton, ExtCtrls, sPanel;

type
  TFrame_Temps = class(TFrame)
    sPanel1: TsPanel;
    sSpeedButton_Open: TsSpeedButton;
    sListView1: TsListView;
    sSpeedButton1: TsSpeedButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses Unit_Main;

{$R *.dfm}

end.

program DocBase;

uses
  Forms,
  Unit_Main in 'Unit_Main.pas' {Form_Main},
  Unit_Add in 'Unit_Add.pas' {Form_Add},
  Unit_FrameMain in 'Unit_FrameMain.pas' {Frame_Main: TFrame},
  Unit_FrameSearch in 'Unit_FrameSearch.pas' {Frame_Search: TFrame},
  Unit_FrameTemps in 'Unit_FrameTemps.pas' {Frame_Temps: TFrame},
  Unit_Login in 'Unit_Login.pas' {Form_Login},
  Unit_Pic in 'Unit_Pic.pas' {Form_Pic},
  Unit_ViewBase in 'Unit_ViewBase.pas' {Form_ViewBase};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm_Main, Form_Main);
  Application.CreateForm(TForm_ViewBase, Form_ViewBase);
  // Application.CreateForm(TForm_Login, Form_Login);
 // Application.CreateForm(TForm_Pic, Form_Pic);
  //Application.CreateForm(TForm_Add, Form_Add);
  Application.Run;
end.

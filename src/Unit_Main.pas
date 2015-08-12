unit Unit_Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, sSpeedButton, StdCtrls, sGroupBox, ExtCtrls, sPanel,
  sScrollBox, DB, IBCustomDataSet, IBQuery, IBDatabase, ComCtrls, ToolWin,
  sToolBar, Menus, JPEG, sSkinProvider, sSkinManager, ImgList,
  acAlphaImageList, acPNG, sEdit, OleCtnrs, sFrameBar, sSplitter,
  sStatusBar, sListView, sComboBoxes, sComboBox, sBevel,
  IBTable, sGauge, ShellApi;

type
  TGraphType = (gtBitmap, gtJpeg, gtPdf, gtDoc);
  TForm_Main = class(TForm)
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    Qu1: TIBQuery;
    sPanel_Right: TsPanel;
    sScrollBox1: TsScrollBox;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    sSkinManager1: TsSkinManager;
    sSkinProvider1: TsSkinProvider;
    Image_bg: TImage;
    sPanel_Left: TsPanel;
    sFrameBar1: TsFrameBar;
    sSplitter1: TsSplitter;
    sPanel_Top: TsPanel;
    sStatusBar1: TsStatusBar;
    sAlphaImageList1: TsAlphaImageList;
    sSpeedButton_Open: TsSpeedButton;
    sSpeedButton_Save: TsSpeedButton;
    sBevel1: TsBevel;
    sComboBox1: TsComboBox;
    Label1: TLabel;
    PopupMenu_Pic: TPopupMenu;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    IBTable1: TIBTable;
    sGauge1: TsGauge;
    procedure FormCreate(Sender: TObject);
    procedure sScrollBox1Resize(Sender: TObject);
    procedure PicsShow;
    procedure PicEnlarge(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure sFrameBar1Items0CreateFrame(Sender: TObject;
      var Frame: TCustomFrame);
    procedure sFrameBar1Items1CreateFrame(Sender: TObject;
      var Frame: TCustomFrame);
    procedure sFrameBar1Items2CreateFrame(Sender: TObject;
      var Frame: TCustomFrame);
    procedure sFrameBar1Resize(Sender: TObject);
    procedure PicNormal;
    procedure sScrollBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sFrameBar1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sPanel_TopMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sComboBox1Change(Sender: TObject);
    procedure sSpeedButton_OpenClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure ImgDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TDocs = class
    Name, Format: string;
    Conag, Title, Desc: string;
    buff: TMemoryStream;
    cDate: TDate;
    X, Y, state, ID: integer;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Main: TForm_Main;
  img, bg: array of TImage;
  pdfs: array of TOleContainer;
  img_kol, docs_kol: integer;
  i, j, CurrPicNo, h,w: integer;
  Docs: array of TDocs;
  CurrPicName, AppPath, UsrName: string;
  NotSavedLabel, SavedLabel, SearchLabel: TLabel;
  tempPic : TOleContainer;
  myb, isFirst: boolean;

implementation

uses Unit_Add, Unit_FrameMain, Unit_FrameSearch, Unit_FrameTemps, Unit_Pic,
  Unit_Login;

{$R *.dfm}

procedure TForm_Main.FormCreate(Sender: TObject);
begin
  AppPath := ExtractFilePath(Application.ExeName);
  IBDatabase1.DatabaseName := AppPath+'DATA.GDB';
  IBDatabase1.Connected := true;
  IBTransaction1.Active := true;
  IBTable1.Active := true;

  myb := false;
  Form_Login:= TForm_Login.Create(Application);
  try
    Form_Login.ShowModal;  
  finally
    Form_Login.Free;
    Form_Login:=nil;
  end;
  if myb = false then
    Application.Terminate;
{  if UsrName <> 'Admin' then
  begin
    sSpeedButton_Open.Enabled := false;
    sSpeedButton_Save.Enabled := false;
  end;   }

  if isFirst then
  begin

  end;

  img_kol := 0;
  docs_kol := 0;
  CurrPicNo := -1;
  i := 0;
  j := 0;
  w := 70;
  h := 99;
  sFrameBar1.ExpandAll(false);
  NotSavedLabel.Free;
  NotSavedLabel := nil;
  SavedLabel.Free;
  SavedLabel := nil;
  SearchLabel.Free;
  SearchLabel := nil;
  temp[0] := 0;
  temp[1] := 140;
  temp[2] := 170;            //komponentlaga koordinata berish
end;

procedure TForm_Main.sScrollBox1Resize(Sender: TObject);
var
  kol: integer;
begin
  kol := trunc(sScrollBox1.Width/(w+10));
  if kol<=docs_kol then
    PicsShow;
end;

procedure TForm_Main.ImgDblClick(Sender: TObject);
var
  path: string;
begin
  path := ExtractFilePath(Application.ExeName) + '\temp\file.jpg';
  (Sender as TImage).Picture.SaveToFile(path);
  ShellExecute(0,'open',PAnsiChar(path),nil,nil,SW_SHOWNORMAL);
end;

procedure TForm_Main.PicsShow;
var
  i, kol, x,y, NotSavedKol, SavedKol, SearchKol: integer;
  pw,ph,pro: real;
  GraphType: TGraphType;
  Jpg: TJpegImage;
  st: string;
begin
  NotSavedKol := 0;
  SavedKol := 0;
  SearchKol := 0;
  kol := trunc(sScrollBox1.Width/(w+10));
 if kol>0 then
 begin
  sScrollBox1.AutoScroll:=false;
  x:=15;
  y:=10;

  for i:=0 to docs_kol-1 do
  begin
    if docs[i] <> nil then
    begin
      if docs[i].state = 0 then
        NotSavedKol := NotSavedKol+1
      else if docs[i].state = 1 then
        SavedKol := SavedKol+1
      else if docs[i].state = 2 then
        SearchKol := SearchKol+1;
    end;
  end;

  for i:=0 to img_kol-1 do
  begin
    img[i].Free;
    img[i] := nil;
    bg[i].Free;
    bg[i] := nil;
    pdfs[i].Free;
    pdfs[i] := nil;
  end;
  if NotSavedLabel <> nil then
  begin
    NotSavedLabel.Free;
    NotSavedLabel := nil;
  end;
  if SavedLabel <> nil then
  begin
    SavedLabel.Free;
    SavedLabel := nil;
  end;
  if SearchLabel <> nil then
  begin
    SearchLabel.Free;
    SearchLabel := nil;
  end;
  img_kol := docs_kol;
  SetLength(img, img_kol);
  SetLength(bg, img_kol);
  SetLength(pdfs, img_kol);

 if NotSavedKol > 0 then
 begin
  NotSavedLabel := TLabel.Create(sScrollBox1);
  with NotSavedLabel do
  begin
    Parent:=sScrollBox1;
    Left := x;
    Top := y;
    Caption := 'Не сохраненные:';
    ParentColor := false;
    Font.Color := clRed;
  end;
  x:=20;
  y:=40;

  for i:=0 to docs_kol-1 do
  begin
    if (docs[i] <> nil) and (docs[i].state=0) then
    begin
      bg[i] := TImage.Create(sScrollBox1);
      with bg[i] do
      begin
        Parent:=sScrollBox1;
        Left := x-1;
        Top := y-1;
        Width := w+4;
        Height := h+4;
        Name := 'bg'+ IntToStr(i+1);
        Stretch := true;
        Picture := Image_bg.Picture;
      end;

      if ((docs[i].Format = 'BMP') OR (docs[i].Format = 'JPG')) then
      begin
        img[i] := TImage.Create(sScrollBox1);
        with img[i] do
        begin
          Parent:=sScrollBox1;
          Left := x;
          Top := y;
          Width := w;
          Height := h;
          Name:='pic'+IntToStr(i+1);
          Hint := 'Название: ' + docs[i].Title + #13 + 'Контрагент: ' + docs[i].Conag + #13 + 'Тип: Рисунок';
          ShowHint := true;
          OnMouseMove := PicEnlarge;
          PopupMenu := PopupMenu_Pic;
          OnDblClick := ImgDblClick;
          Stretch := true;

          docs[i].X := x;
          docs[i].Y := y;

          if docs[i].buff.Size > 0 then
          begin
            Jpg := nil;
            docs[i].buff.Position := 0;
            docs[i].buff.Read(GraphType, 1);
            case GraphType of
              gtBitmap:   img[i].Picture.Bitmap.LoadFromStream(docs[i].buff);
              gtJpeg: begin
                Jpg := TJpegImage.Create;
                Jpg.LoadFromStream(docs[i].buff);
                img[i].Picture.Assign(Jpg);
              end
              else
                img[i].Picture.Assign(nil);  // Clear the image
            end;

         { ph:=img[i].Picture.Height;
          pw:=img[i].Picture.Width;
          if ph>pw then
          begin
            pro:=ph/pw;
            img[i].Height := h;
            img[i].Width := round(h / pro);
            img[i].Left := img[i].Left + round((w-img[i].Width)/2);
          end else if pw>ph then
          begin
            pro:=pw/ph;
            img[i].Width := w;
            img[i].Height := round(w / pro);
            img[i].Top := img[i].Top + round((h-img[i].Height)/2);
          end;  }

          end
          else
            img[i].Picture.Assign(nil);
        end;
      end

      else if ((docs[i].Format = 'PDF') OR (docs[i].Format = 'DOC')) then
      begin
        pdfs[i] := TOleContainer.Create(sScrollBox1);
        with pdfs[i] do
        begin
          Parent:=sScrollBox1;
          Left := x;
          Top := y;
          Width := w;
          Height := h;
          Name:='pic'+IntToStr(i+1);
          if (docs[i].Format = 'PDF') then st:='PDF файл'
          else if (docs[i].Format = 'DOC') then st:='Документ MS Word';
          Hint := 'Название: ' + docs[i].Title + #13 + 'Контрагент: ' + docs[i].Conag + #13 + 'Тип: ' + st;
          ShowHint := true;
          OnMouseMove := PicEnlarge;
          PopupMenu := PopupMenu_Pic;
          AutoVerbMenu := false;

          AllowInPlace:=false;
          AllowActiveDoc:=false;

          SizeMode := smStretch;
         // BorderStyle := bsNone;

          docs[i].X := x;
          docs[i].Y := y;

          if docs[i].buff.Size > 0 then
          begin
            docs[i].buff.Position := 0;
            docs[i].buff.Read(GraphType, 1);
            case GraphType of
              gtPdf: pdfs[i].LoadFromStream(docs[i].buff);   //----------(betta faqat PDF edi)----------nimaga Graphtype tekshirilgan???-----
              gtDoc: pdfs[i].LoadFromStream(docs[i].buff);
            end;
          end;
        end;
      end;
      x:=x+w+10;
      if (kol>0) and (((i+1)mod kol)=0) then
      begin
        x:=20;
        y:=y+h+10;
      end;
    end;
  end;

  x:=15;
  y:=y+h+30;
 end;

 if SavedKol > 0 then
 begin
  SavedLabel := TLabel.Create(sScrollBox1);
  with SavedLabel do
  begin
    Parent:=sScrollBox1;
    Left := x;
    Top := y;
    Caption := 'Сохраненные:';
    ParentColor := false;
    Font.Color := clGreen;
  end;

  x:=20;
  y:=y+30;

  for i:=0 to docs_kol-1 do
  begin
    if (docs[i] <> nil) and (docs[i].state=1) then
    begin
      bg[i] := TImage.Create(sScrollBox1);
      with bg[i] do
      begin
        Parent:=sScrollBox1;
        Left := x-1;
        Top := y-1;
        Width := w+4;
        Height := h+4;
        Name := 'bg'+ IntToStr(i+1);
        Stretch := true;
        Picture := Image_bg.Picture;
      end;

      if ((docs[i].Format = 'BMP') OR (docs[i].Format = 'JPG')) then
      begin
        img[i] := TImage.Create(sScrollBox1);
        with img[i] do
        begin
          Parent:=sScrollBox1;
          Left := x;
          Top := y;
          Width := w;
          Height := h;
          Name:='pic'+IntToStr(i+1);
          Hint := 'Название: ' + docs[i].Title + #13 + 'Контрагент: ' + docs[i].Conag + #13 + 'Тип: Рисунок';
          ShowHint := true;
          OnMouseMove := PicEnlarge;
          PopupMenu := PopupMenu_Pic;
          OnDblClick := ImgDblClick;
          Stretch := true;

          docs[i].X := x;
          docs[i].Y := y;

          if docs[i].buff.Size > 0 then
          begin
            Jpg := nil;
            docs[i].buff.Position := 0;
            docs[i].buff.Read(GraphType, 1);
            case GraphType of
              gtBitmap:   img[i].Picture.Bitmap.LoadFromStream(docs[i].buff);
              gtJpeg: begin
                Jpg := TJpegImage.Create;
                Jpg.LoadFromStream(docs[i].buff);
                img[i].Picture.Assign(Jpg);
              end
              else
                img[i].Picture.Assign(nil);  // Clear the image
            end;
          end
          else
            img[i].Picture.Assign(nil);
        end;
      end
      else if ((docs[i].Format = 'PDF') OR (docs[i].Format = 'DOC')) then
      begin
        pdfs[i] := TOleContainer.Create(sScrollBox1);
        with pdfs[i] do
        begin
          Parent:=sScrollBox1;
          Left := x;
          Top := y;
          Width := w;
          Height := h;
          Name:='pic'+IntToStr(i+1);
          if (docs[i].Format = 'PDF') then st:='PDF файл'
          else if (docs[i].Format = 'DOC') then st:='Документ MS Word';
          Hint := 'Название: ' + docs[i].Title + #13 + 'Контрагент: ' + docs[i].Conag + #13 + 'Тип: ' + st;
          ShowHint := true;
          OnMouseMove := PicEnlarge;
          PopupMenu := PopupMenu_Pic;
          AutoVerbMenu := false;

          AllowInPlace:=false;
          AllowActiveDoc:=false;

          SizeMode := smStretch;
         // BorderStyle := bsNone;

          docs[i].X := x;
          docs[i].Y := y;

          if docs[i].buff.Size > 0 then
          begin
            docs[i].buff.Position := 0;
            docs[i].buff.Read(GraphType, 1);
            case GraphType of
              gtPdf: pdfs[i].LoadFromStream(docs[i].buff);
              gtDoc: pdfs[i].LoadFromStream(docs[i].buff);
            end;
          end;
        end;
      end;
      x:=x+w+10;
      if (kol>0) and (((i+1)mod kol)=0) then
      begin
        x:=20;
        y:=y+h+10;
      end;
    end;
  end;

  x:=15;
  y:=y+h+30;
 end;

 if SearchKol > 0 then
 begin
  SearchLabel := TLabel.Create(sScrollBox1);
  with SearchLabel do
  begin
    Parent:=sScrollBox1;
    Left := x;
    Top := y;
    Caption := 'Результаты поиска:';
    ParentColor := false;
    Font.Color := clBlue;
  end;

  x:=20;
  y:=y+30;

  for i:=0 to docs_kol-1 do
  begin
    if (docs[i] <> nil) and (docs[i].state=2) then
    begin
      bg[i] := TImage.Create(sScrollBox1);
      with bg[i] do
      begin
        Parent:=sScrollBox1;
        Left := x-1;
        Top := y-1;
        Width := w+4;
        Height := h+4;
        Name := 'bg'+ IntToStr(i+1);
        Stretch := true;
        Picture := Image_bg.Picture;
      end;

      if ((docs[i].Format = 'BMP') OR (docs[i].Format = 'JPG')) then
      begin
        img[i] := TImage.Create(sScrollBox1);
        with img[i] do
        begin
          Parent:=sScrollBox1;
          Left := x;
          Top := y;
          Width := w;
          Height := h;
          Name:='pic'+IntToStr(i+1);
          Hint := 'Название: ' + docs[i].Title + #13 + 'Контрагент: ' + docs[i].Conag + #13 + 'Тип: Рисунок';
          ShowHint := true;
          OnMouseMove := PicEnlarge;
          PopupMenu := PopupMenu_Pic;
          OnDblClick := ImgDblClick;
          Stretch := true;

          docs[i].X := x;
          docs[i].Y := y;

          if docs[i].buff.Size > 0 then
          begin
            Jpg := nil;
            docs[i].buff.Position := 0;
            docs[i].buff.Read(GraphType, 1);
            case GraphType of
              gtBitmap:   img[i].Picture.Bitmap.LoadFromStream(docs[i].buff);
              gtJpeg: begin
                Jpg := TJpegImage.Create;
                Jpg.LoadFromStream(docs[i].buff);
                img[i].Picture.Assign(Jpg);
              end
              else
                img[i].Picture.Assign(nil);  // Clear the image
            end;
          end
          else
            img[i].Picture.Assign(nil);
        end;
      end
      else if ((docs[i].Format = 'PDF') OR (docs[i].Format = 'DOC')) then
      begin
        pdfs[i] := TOleContainer.Create(sScrollBox1);
        with pdfs[i] do
        begin
          Parent:=sScrollBox1;
          Left := x;
          Top := y;
          Width := w;
          Height := h;
          Name:='pic'+IntToStr(i+1);
          if (docs[i].Format = 'PDF') then st:='PDF файл'
          else if (docs[i].Format = 'DOC') then st:='Документ MS Word';
          Hint := 'Название: ' + docs[i].Title + #13 + 'Контрагент: ' + docs[i].Conag + #13 + 'Тип: ' + st;
          ShowHint := true;
          OnMouseMove := PicEnlarge;
          PopupMenu := PopupMenu_Pic;
          AutoVerbMenu := false;
          
          AllowInPlace:=false;
          AllowActiveDoc:=false; //------------------------------------------------------------------------

          SizeMode := smStretch;
         // BorderStyle := bsNone;

          docs[i].X := x;
          docs[i].Y := y;

          if docs[i].buff.Size > 0 then
          begin
            docs[i].buff.Position := 0;
            docs[i].buff.Read(GraphType, 1);
            case GraphType of
              gtPdf: pdfs[i].LoadFromStream(docs[i].buff);
              gtDoc: pdfs[i].LoadFromStream(docs[i].buff);
            end;
          end;
        end;
      end;
      x:=x+w+10;
      if (kol>0) and (((i+1)mod kol)=0) then
      begin
        x:=20;
        y:=y+h+10;
      end;
    end;
  end;
 end;

  sScrollBox1.AutoScroll:=true;
 end;
end;

procedure TForm_Main.PicEnlarge(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var
  i, dx,dy: integer;
begin
  if Sender.ClassName = 'TImage' then
  begin
    with (Sender as TImage) do
    begin
      if CurrPicName<>Name then
      begin
        PicNormal;
        for i:=0 to docs_kol-1 do
        begin
          if docs[i] <> nil then
            if docs[i].Name = Name then
            begin
              dx := docs[i].X;
              dy := docs[i].Y;
              CurrPicNo := i;
              CurrPicName := Name;
              break;
            end;
        end;
        Top := dy-10;
        Left := dx-10;
        Width := w+20;
        Height := h+20;
        bg[i].Top := dy-11;
        bg[i].Left := dx-11;
        bg[i].Width := w+24;
        bg[i].Height := h+24;
        bg[i].BringToFront;
        BringToFront;
      end;
    end;
  end
  else if Sender.ClassName = 'TOleContainer' then
  begin
    with (Sender as TOleContainer) do
    begin
      if CurrPicName<>Name then
      begin
        PicNormal;
        for i:=0 to docs_kol-1 do
        begin
          if docs[i] <> nil then
            if docs[i].Name = Name then
            begin
              dx := docs[i].X;
              dy := docs[i].Y;
              CurrPicNo := i;
              CurrPicName := Name;
              break;
            end;
        end;
        Top := dy-10;
        Left := dx-10;
        Width := w+20;
        Height := h+20;
        bg[i].Top := dy-11;
        bg[i].Left := dx-11;
        bg[i].Width := w+24;
        bg[i].Height := h+24;
        bg[i].BringToFront;
        BringToFront;
      end;
    end;
  end;
end;

procedure TForm_Main.PicNormal;
begin
  if CurrPicNo>-1 then
  begin
    if docs[CurrPicNo] <> nil then
    begin
      if ((docs[CurrPicNo].Format = 'BMP') OR (docs[CurrPicNo].Format = 'JPG')) then
      begin
        img[CurrPicNo].Top := docs[CurrPicNo].Y;
        img[CurrPicNo].Left := docs[CurrPicNo].X;
        img[CurrPicNo].Width := w;
        img[CurrPicNo].Height := h;
      end
      else if ((docs[CurrPicNo].Format = 'PDF') OR (docs[CurrPicNo].Format = 'DOC')) then
      begin
        pdfs[CurrPicNo].Top := docs[CurrPicNo].Y;
        pdfs[CurrPicNo].Left := docs[CurrPicNo].X;
        pdfs[CurrPicNo].Width := w;
        pdfs[CurrPicNo].Height := h;
      end;
      bg[CurrPicNo].Top := docs[CurrPicNo].Y-1;
      bg[CurrPicNo].Left := docs[CurrPicNo].X-1;
      bg[CurrPicNo].Width := w+4;
      bg[CurrPicNo].Height := h+4;
    end;
  end;
end;

procedure TForm_Main.sFrameBar1Items0CreateFrame(Sender: TObject;
  var Frame: TCustomFrame);
begin
  Frame:= TFrame_Main.Create(nil);
{  if UsrName <> 'Admin' then
    (Frame as TFrame_Main).sSpeedButton_Open.Enabled := false;   }
end;

procedure TForm_Main.sFrameBar1Items1CreateFrame(Sender: TObject;
  var Frame: TCustomFrame);
begin
  Frame:= TFrame_Search.Create(nil);
  temp[0] := 0;
  temp[1] := 140;
  temp[2] := 170;
end;

procedure TForm_Main.sFrameBar1Items2CreateFrame(Sender: TObject;
  var Frame: TCustomFrame);
begin
  Frame:= TFrame_Temps.Create(nil);
end;

procedure TForm_Main.sFrameBar1Resize(Sender: TObject);
begin
 // sListView1.Width := sFrameBar1.Width;
end;

procedure TForm_Main.sScrollBox1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  CurrPicName := '';
  PicNormal;
end;

procedure TForm_Main.sFrameBar1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  CurrPicName := '';
  PicNormal;
end;

procedure TForm_Main.sPanel_TopMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  CurrPicName := '';
  PicNormal;
end;

procedure TForm_Main.sComboBox1Change(Sender: TObject);
begin
  case sComboBox1.ItemIndex of
  0:begin
      w:=70;
      h:=99;
    end;
  1:begin
      w:=105;
      h:=148;
    end;
  end;
  PicsShow;
end;

procedure TForm_Main.sSpeedButton_OpenClick(Sender: TObject);
begin
  Form_Add := TForm_Add.Create(Application);
  try
    Form_Add.ShowModal;
  finally
    Form_Add.free;
    Form_Add:=nil;
  end;
end;

procedure TForm_Main.FormResize(Sender: TObject);
var
  kol: integer;
begin
 { kol := trunc(sScrollBox1.Width/(w+10));
  if kol<=docs_kol then
    PicsShow;     }
end;

procedure TForm_Main.N5Click(Sender: TObject);
var
  ti: integer;
  st: string;
begin
  if MessageDlg('Действительно хотите удалить?',mtConfirmation,[mbYes,mbNo],1) = mrYes then
  begin
    if docs[CurrPicNo].state = 0 then
    begin
      docs[CurrPicNo] := nil;
    end else
    begin
      st := 'Delete from DOCS where ID=' + IntToStr(docs[CurrPicNo].ID);
      Qu1.Close;
      Qu1.SQL.Clear;
      Qu1.SQL.Add(st);
      Qu1.ExecSQL;
      docs[CurrPicNo] := nil;
    end;
    Form_Main.PicsShow;
  end;
end;

procedure TForm_Main.FormClose(Sender: TObject; var Action: TCloseAction);
var
  path: string;
begin
  path := ExtractFilePath(Application.ExeName) + '\temp\file.jpg';
  DeleteFile(path);
end;

end.

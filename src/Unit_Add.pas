unit Unit_Add;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtDlgs, sDialogs, StdCtrls, sButton, ExtCtrls, sEdit, sMemo,
  Mask, sMaskEdit, sCustomComboEdit, sTooledit, Clipbrd, JPEG, sBevel,
  sLabel, OleCtnrs, sGroupBox;

type
  TGraphType = (gtBitmap, gtJpeg, gtPdf, gtDoc);
  TForm_Add = class(TForm)
    sOpenDialog1: TsOpenDialog;
    sButton_OK: TsButton;
    sButton_Cancel: TsButton;
    sBevel1: TsBevel;
    Image1: TImage;
    OleContainer1: TOleContainer;
    sGroupBox1: TsGroupBox;
    sMemo1: TsMemo;
    sLabel4: TsLabel;
    sLabel3: TsLabel;
    sLabel2: TsLabel;
    sLabel1: TsLabel;
    sEdit_Title: TsEdit;
    sEdit_Conag: TsEdit;
    sDateEdit1: TsDateEdit;
    sButton_Load: TsButton;
    procedure sButton_LoadClick(Sender: TObject);
    procedure sButton_OKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sButton_CancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Add: TForm_Add;
  FileExt, FilePath: string;
  SaveBtnStatus: integer;

implementation

uses Unit_Main, Unit_FrameMain;

{$R *.dfm}

procedure TForm_Add.sButton_LoadClick(Sender: TObject);
var
  Jpg: TJpegImage;
  h,w, pro: real;
begin
  Jpg := nil;
  sOpenDialog1.Execute;
  if sOpenDialog1.FileName<>'' then
  begin
    Image1.Picture := nil;
    Image1.Left := 327;
    Image1.Top := 8;
    FilePath := sOpenDialog1.FileName;
    FileExt := LowerCase(ExtractFileExt(FilePath));
    try
      if (FileExt = '.bmp') or (FileExt = '.dib') then
      begin
        OleContainer1.Visible := false;
        Image1.Visible := true;
        Image1.Picture.Bitmap.LoadFromFile(FilePath);
      end
      else if (FileExt = '.jpg') or (FileExt = '.jpeg') then
      begin
        OleContainer1.Visible := false;
        Image1.Visible := true;
        Jpg := TJpegImage.Create;
        Jpg.LoadFromFile(FilePath);
        Image1.Picture.Assign(Jpg);
      end
      else if (FileExt = '.pdf') then
      begin
        OleContainer1.Visible := true;
        Image1.Visible := false;
        OleContainer1.CreateObjectFromFile(FilePath, false);
      end
      else if (FileExt = '.doc') or (FileExt = '.docx') then
      begin
        OleContainer1.Visible := true;
        Image1.Visible := false;
        OleContainer1.CreateObjectFromFile(FilePath, false);
      end;
      h:=Image1.Picture.Height;
      w:=Image1.Picture.Width;
      if h>w then
      begin
        pro:=h/w;
        Image1.Height := 297;
        Image1.Width := round(Image1.Height / pro);
        Image1.Left := Image1.Left + round((210-Image1.Width)/2);
      end else if w>h then
      begin
        pro:=w/h;
        Image1.Width := 210;
        Image1.Height := round(Image1.Width / pro);
        Image1.Top := Image1.Top + round((297-Image1.Height)/2);
      end;
      Image1.Stretch := true;
    except
      MessageDlg('Неверный формат файла',mtError,[mbOK],1);
    end;
  end;
end;

procedure TForm_Add.sButton_OKClick(Sender: TObject);
var
  hol: integer;
  msg: string;
  GraphType: TGraphType;
  Jpg: TJpegImage;
  myb: boolean;
begin
  hol:=0;
  myb := false;
  if sEdit_Title.Text='' then
  begin
    hol:=hol+1;
    msg := 'Введите название документа';
  end;
  if sEdit_Conag.Text='' then
  begin
    hol:=hol+1;
    msg := msg + #13 + 'Введите контрагент';
  end;
  if sOpenDialog1.FileName='' then
  begin
    hol:=hol+1;
    msg := msg + #13 + 'Выберите документ';
  end;

  if hol=0 then
  begin
    Jpg := nil;
    SetLength(Docs, docs_kol+1);
    Docs[docs_kol] := TDocs.Create;
    Docs[docs_kol].Name := 'pic' + IntToStr(docs_kol+1);
    Docs[docs_kol].Conag := sEdit_Conag.Text;
    Docs[docs_kol].Title := sEdit_Title.Text;
    Docs[docs_kol].cDate := sDateEdit1.Date;
    Docs[docs_kol].Desc := sMemo1.Text;
    Docs[docs_kol].state := 0;
    try
      Docs[docs_kol].buff := nil;
      Docs[docs_kol].buff := TMemoryStream.Create;
      if (FileExt = '.bmp') then
      begin
        docs[docs_kol].Format := 'BMP';
        GraphType := gtBitmap;
        Docs[docs_kol].buff.Write(GraphType, 1);
        Image1.Picture.Bitmap.SaveToStream(Docs[docs_kol].buff);
      end
      else
      if (FileExt = '.jpg') or (FileExt = '.jpeg') then
      begin
        docs[docs_kol].Format := 'JPG';
        Jpg := TJpegImage.Create;
        Jpg.LoadFromFile(sOpenDialog1.FileName);
        GraphType := gtJpeg;
        Docs[docs_kol].buff.Write(GraphType, 1);
        Jpg.SaveToStream(Docs[docs_kol].buff);
      end
      else
      if (FileExt = '.pdf') then
      begin
        docs[docs_kol].Format := 'PDF';
        GraphType := gtPdf;
        Docs[docs_kol].buff.Write(GraphType, 1);
        OleContainer1.SaveToStream(Docs[docs_kol].buff);
      end
      else
      if (FileExt = '.doc') or (FileExt = '.docx') then
      begin
        docs[docs_kol].Format := 'DOC';
        GraphType := gtDoc;
        Docs[docs_kol].buff.Write(GraphType, 1);
        OleContainer1.SaveToStream(Docs[docs_kol].buff);
      end;
      docs_kol := docs_kol+1;
      myb := true;
    except
      jpg.Free;
      Docs[docs_kol].buff.Free;
      Docs[docs_kol] := nil;
      SetLength(Docs, docs_kol);
      raise;
    end;
    if myb then
    begin
      Form_Add.Close;
      Form_Main.PicsShow;
      SaveBtnStatus := 1;
    end;
  end else
    ShowMessage(msg);
end;

procedure TForm_Add.FormCreate(Sender: TObject);
begin
  sDateEdit1.Date := now;
end;

procedure TForm_Add.sButton_CancelClick(Sender: TObject);
begin
  Close;
  SaveBtnStatus := 0;          //-----------------------------------------------------------------------------------------
end;

end.

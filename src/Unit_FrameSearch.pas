unit Unit_FrameSearch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, sButton, Buttons, sSpeedButton, sLabel, Mask,
  sMaskEdit, sCustomComboEdit, sTooledit, sEdit, sCheckBox, sGroupBox,
  sBitBtn;

type
  TGraphType = (gtBitmap, gtJpeg, gtPdf, gtDoc);
  TFrame_Search = class(TFrame)
    sGroupBox1: TsGroupBox;
    sCheckBox1: TsCheckBox;
    sCheckBox2: TsCheckBox;
    sCheckBox3: TsCheckBox;
    Edit_Title: TsEdit;
    Edit_Conag: TsEdit;
    DateEdit1: TsDateEdit;
    sLabel3: TsLabel;
    sLabel2: TsLabel;
    sLabel1: TsLabel;
    sButton1: TsButton;
    sWebLabel1: TsWebLabel;
    sBitBtn_ViewBase: TsBitBtn;
    procedure FrameMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sCheckBox2Click(Sender: TObject);
    procedure sCheckBox1Click(Sender: TObject);
    procedure sCheckBox3Click(Sender: TObject);
    procedure sButton1Click(Sender: TObject);
    procedure Edit_TitleChange(Sender: TObject);
    procedure TextCheck();
    procedure DateEdit1Change(Sender: TObject);
    procedure Edit_ConagChange(Sender: TObject);
    procedure sBitBtn_ViewBaseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
temp : array [0..2] of integer;
qaz, i : integer;
 qwe : array [0..2] of integer = (110, 140, 170);

implementation

uses Unit_Main, DB, IBQuery, Unit_ViewBase;

{$R *.dfm}

procedure TFrame_Search.FrameMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  CurrPicName := '';
  Form_Main.PicNormal;
end;

procedure TFrame_Search.sCheckBox2Click(Sender: TObject);
begin
  TextCheck;
  i:=0;
  if sCheckBox2.Checked=true then
  begin
    sButton1.Visible := true;
    sLabel2.Visible := true;
    Edit_Conag.Visible := true;
    for i:=0 to 2 do
    if not(temp[i] = 0) then
    begin
      sLabel2.Top := temp[i];
      Edit_Conag.Top := temp[i];
      sButton1.Top := temp[i]+30;
      sBitBtn_ViewBase.Top := temp[i]+30;
      sWebLabel1.Top := temp[i]+66;
      temp[i] := 0;
      Break;
    end;
  end else
  begin
    sLabel2.Visible:=false;
    Edit_Conag.Visible:=false;

    if sLabel2.Top = qwe[0] then
    begin
      if sCheckBox1.Checked = true then
      begin
        if sLabel1.Top = qwe[2] then temp[2]:=qwe[2] else temp[1]:=qwe[1];
        sLabel1.Top := sLabel1.Top - 30;
        Edit_Title.Top := Edit_Title.Top - 30;
      end;
      if sCheckBox3.Checked = true then
      begin
        if sLabel3.Top = qwe[2] then temp[2]:=qwe[2] else temp[1]:=qwe[1];
        sLabel3.Top := sLabel3.Top - 30;
        DateEdit1.Top := DateEdit1.Top - 30;
      end;
      if (sCheckBox1.Checked = false) and (sCheckBox3.Checked = false) then
      begin
        temp[0] := qwe[0];
        sButton1.Visible := false;
      end;
      sButton1.Top := sButton1.Top - 30;
      sBitBtn_ViewBase.Top := sBitBtn_ViewBase.Top - 30;
      sWebLabel1.Top := sWebLabel1.Top - 30;
    end;

    if sLabel2.Top = qwe[1] then
    begin
      if (sCheckBox1.Checked = true) and (sLabel1.Top = qwe[2]) then
      begin
        sLabel1.Top := sLabel1.Top - 30;
        Edit_Title.Top := Edit_Title.Top - 30;
        sButton1.Top := sButton1.Top - 30;
        sBitBtn_ViewBase.Top := sBitBtn_ViewBase.Top - 30;
        sWebLabel1.Top := sWebLabel1.Top - 30;
        temp[2] := qwe[2];
      end else
      if (sCheckBox3.Checked = true) and (sLabel3.Top = qwe[2]) then
      begin
        sLabel3.Top := sLabel3.Top - 30;
        DateEdit1.Top := DateEdit1.Top - 30;
        sButton1.Top := sButton1.Top - 30;
        sBitBtn_ViewBase.Top := sBitBtn_ViewBase.Top - 30;
        sWebLabel1.Top := sWebLabel1.Top - 30;
        temp[2] := qwe[2];
      end;
      if (sCheckBox1.Checked = false) or (sCheckBox3.Checked = false) then
      begin
        temp[1] := qwe[1];
        sButton1.Top := sButton1.Top - 30;
        sBitBtn_ViewBase.Top := sBitBtn_ViewBase.Top - 30;
        sWebLabel1.Top := sWebLabel1.Top - 30;
      end;
    end;

    if sLabel2.Top = qwe[2] then
    begin
      temp[2] := qwe[2];
      sButton1.Top := sButton1.Top - 30;
      sBitBtn_ViewBase.Top := sBitBtn_ViewBase.Top - 30;
      sWebLabel1.Top := sWebLabel1.Top - 30;
    end;
  end;
end;

procedure TFrame_Search.sCheckBox1Click(Sender: TObject);
begin
  TextCheck;
  i:=0;
  if sCheckBox1.Checked=true then
  begin
    sButton1.Visible := true;
    sLabel1.Visible := true;
    Edit_Title.Visible := true;
    for i:=0 to 2 do
    if not(temp[i] = 0) then
    begin
      sLabel1.Top := temp[i];
      Edit_Title.Top := temp[i];
      sButton1.Top := temp[i]+30;
      sBitBtn_ViewBase.Top := temp[i] + 30;
      sWebLabel1.Top := temp[i] + 66;
      temp[i] := 0;
      Break;
    end;
  end else
  begin
    sLabel1.Visible:=false;
    Edit_Title.Visible:=false;

    if sLabel1.Top = qwe[0] then
    begin
      if sCheckBox2.Checked = true then
      begin
        if sLabel2.Top = qwe[2] then temp[2]:=qwe[2] else temp[1]:=qwe[1];
        sLabel2.Top := sLabel2.Top - 30;
        Edit_Conag.Top := Edit_Conag.Top - 30;
      end;
      if sCheckBox3.Checked = true then
      begin
        if sLabel3.Top = qwe[2] then temp[2]:=qwe[2] else temp[1]:=qwe[1];
        sLabel3.Top := sLabel3.Top - 30;
        DateEdit1.Top := DateEdit1.Top - 30;
      end;
      if (sCheckBox2.Checked = false) and (sCheckBox3.Checked = false) then
      begin
        temp[0] := qwe[0];
        sButton1.Visible := false;
      end;
      sButton1.Top := sButton1.Top - 30;
      sBitBtn_ViewBase.Top := sBitBtn_ViewBase.Top - 30;
      sWebLabel1.Top := sWebLabel1.Top - 30;
    end;

    if sLabel1.Top = qwe[1] then
    begin
      if (sCheckBox2.Checked = true) and (sLabel2.Top = qwe[2]) then
      begin
        sLabel2.Top := sLabel2.Top - 30;
        Edit_Conag.Top := Edit_Conag.Top - 30;
        sButton1.Top := sButton1.Top - 30;
        sBitBtn_ViewBase.Top := sBitBtn_ViewBase.Top - 30;
        sWebLabel1.Top := sWebLabel1.Top - 30;
        temp[2] := qwe[2];
      end else
      if (sCheckBox3.Checked = true) and (sLabel3.Top = qwe[2]) then
      begin
        sLabel3.Top := sLabel3.Top - 30;
        DateEdit1.Top := DateEdit1.Top - 30;
        sButton1.Top := sButton1.Top - 30;
        sBitBtn_ViewBase.Top := sBitBtn_ViewBase.Top - 30;
        sWebLabel1.Top := sWebLabel1.Top - 30;
        temp[2] := qwe[2];
      end;
      if (sCheckBox2.Checked = false) or (sCheckBox3.Checked = false) then
      begin
        temp[1] := qwe[1];
        sButton1.Top := sButton1.Top - 30;
        sBitBtn_ViewBase.Top := sBitBtn_ViewBase.Top - 30;
        sWebLabel1.Top := sWebLabel1.Top - 30;
      end;
    end;

    if sLabel1.Top = qwe[2] then
    begin
      temp[2] := qwe[2];
      sButton1.Top := sButton1.Top - 30;
      sBitBtn_ViewBase.Top := sBitBtn_ViewBase.Top - 30;
      sWebLabel1.Top := sWebLabel1.Top - 30;
    end;
  end;
end;

procedure TFrame_Search.sCheckBox3Click(Sender: TObject);
begin
  TextCheck;
  i:=0;
  if sCheckBox3.Checked=true then
  begin
    sButton1.Visible := true;
    sLabel3.Visible := true;
    DateEdit1.Visible := true;
    for i:=0 to 2 do
    if not(temp[i] = 0) then
    begin
      sLabel3.Top := temp[i];
      DateEdit1.Top := temp[i];
      sButton1.Top := temp[i]+30;
      sBitBtn_ViewBase.Top := temp[i] + 30;
      sWebLabel1.Top := temp[i] + 66;
      temp[i] := 0;
      Break;
    end;
  end else
  begin
    sLabel3.Visible:=false;
    DateEdit1.Visible:=false;

    if sLabel3.Top = qwe[0] then
    begin
      if sCheckBox1.Checked = true then
      begin
        if sLabel1.Top = qwe[2] then temp[2]:=qwe[2] else temp[1]:=qwe[1];
        sLabel1.Top := sLabel1.Top - 30;
        Edit_Title.Top := Edit_Title.Top - 30;
      end;
      if sCheckBox2.Checked = true then
      begin
        if sLabel2.Top = qwe[2] then temp[2]:=qwe[2] else temp[1]:=qwe[1];
        sLabel2.Top := sLabel2.Top - 30;
        Edit_Conag.Top := Edit_Conag.Top - 30;
      end;
      if (sCheckBox1.Checked = false) and (sCheckBox2.Checked = false) then
      begin
        temp[0] := qwe[0];
        sButton1.Visible := false;
      end;
      sButton1.Top := sButton1.Top - 30;
      sBitBtn_ViewBase.Top := sBitBtn_ViewBase.Top - 30;
      sWebLabel1.Top := sWebLabel1.Top - 30;
    end;

    if sLabel3.Top = qwe[1] then
    begin
      if (sCheckBox1.Checked = true) and (sLabel1.Top = qwe[2]) then
      begin
        sLabel1.Top := sLabel1.Top - 30;
        Edit_Title.Top := Edit_Title.Top - 30;
        sButton1.Top := sButton1.Top - 30;
        sBitBtn_ViewBase.Top := sBitBtn_ViewBase.Top - 30;
        sWebLabel1.Top := sWebLabel1.Top - 30;
        temp[2] := qwe[2];
      end else
      if (sCheckBox2.Checked = true) and (sLabel2.Top = qwe[2]) then
      begin
        sLabel2.Top := sLabel2.Top - 30;
        Edit_Conag.Top := Edit_Conag.Top - 30;
        sButton1.Top := sButton1.Top - 30;
        sBitBtn_ViewBase.Top := sBitBtn_ViewBase.Top - 30;
        sWebLabel1.Top := sWebLabel1.Top - 30;
        temp[2] := qwe[2];
      end;
      if (sCheckBox1.Checked = false) or (sCheckBox2.Checked = false) then
      begin
        temp[1] := qwe[1];
        sButton1.Top := sButton1.Top - 30;
        sBitBtn_ViewBase.Top := sBitBtn_ViewBase.Top - 30;
        sWebLabel1.Top := sWebLabel1.Top - 30;
      end;
    end;

    if sLabel3.Top = qwe[2] then
    begin
      temp[2] := qwe[2];
      sButton1.Top := sButton1.Top - 30;
      sBitBtn_ViewBase.Top := sBitBtn_ViewBase.Top - 30;
      sWebLabel1.Top := sWebLabel1.Top - 30;
    end;
  end;
end;

procedure TFrame_Search.sButton1Click(Sender: TObject);
var
  st: string;
  ti: integer;
  GraphType: TGraphType;
begin
  try
    for ti:=0 to docs_kol-1 do
      if docs[ti] <> nil then
        if docs[ti].state = 2 then
          docs[ti] := nil;
  except
  end;
  with Form_Main.Qu1 do
  begin
    Close;
    SQL.Clear;
    st := 'select * from DOCS where ';
    if sCheckBox1.Checked = true then st := st + 'NAME like ''%' + Edit_Title.Text + '%''';
    if sCheckBox2.Checked = true then
      if sCheckBox1.Checked then
        st := st + 'and CONAGENT like ''%'+Edit_Conag.Text  + '%'''
      else st := st + 'CONAGENT like ''%'+Edit_Conag.Text  + '%''';
    if sCheckBox3.Checked = true then
      if (sCheckBox1.Checked)or(sCheckBox2.Checked) then
        st := st + ' and CREATEDDATE like ''%'+DateEdit1.Text  + '%'''
      else st := st + 'CREATEDDATE like ''%'+DateEdit1.Text  + '%''';
    SQL.Add(st);
    Open;

    if RecordCount > 0 then
    begin

      for ti:=0 to docs_kol-1 do
        if docs[ti] <> nil then
          if docs[ti].state = 1 then
            docs[ti] := nil;

      while not Eof do
      begin
        SetLength(Docs, docs_kol+1);
        Docs[docs_kol] := TDocs.Create;
        Docs[docs_kol].Name := 'pic' + IntToStr(docs_kol+1);
        Docs[docs_kol].Conag := FieldByName('CONAGENT').AsString;
        Docs[docs_kol].Title := FieldByName('NAME').AsString;
        Docs[docs_kol].cDate := FieldByName('CREATEDDATE').AsDateTime;
        Docs[docs_kol].Desc := FieldByName('DESC').AsString;
        Docs[docs_kol].state := 2;
        Docs[docs_kol].ID := FieldByName('ID').AsInteger;;
        Docs[docs_kol].buff := nil;
        Docs[docs_kol].buff := TMemoryStream.Create;
        TBlobField(FieldByName('DOCFILE')).SaveToStream(Docs[docs_kol].buff);
        Docs[docs_kol].buff.Position := 0;
        Docs[docs_kol].buff.Read(GraphType, 1);
        case GraphType of                       
          gtBitmap: Docs[docs_kol].Format := 'BMP';
          gtJpeg: Docs[docs_kol].Format := 'JPG';
          gtPdf: Docs[docs_kol].Format := 'PDF';
          gtDoc: Docs[docs_kol].Format := 'DOC';
        end;
        docs_kol := docs_kol+1;
        Next;
      end;
      Form_Main.PicsShow;
    end else
    begin
      ShowMessage('По запросу ничего не найдено');
      Form_Main.PicsShow;
    end;
  end;
end;

procedure TFrame_Search.TextCheck();
var hol :integer; msg :string;
begin
  hol:=0;
  msg:='';
  qaz:=0;
  if sCheckBox1.Checked then
  if Edit_Title.Text='' then
  begin
    hol:=hol+1;
    msg := 'Введите название документа';
  end;
  if sCheckBox2.Checked then
  if Edit_Conag.Text='' then
  begin
    hol:=hol+1;
    msg := msg + #13 + 'Введите контрагент';
  end;
  if sCheckBox3.Checked then
  if DateEdit1.Text = '  .  .    ' then
  begin
    hol:=hol+1;
    msg := msg + #13 + 'Выберите дату';
  end;
  if hol > 0 then sButton1.Enabled := false else sButton1.Enabled := true;

end;

procedure TFrame_Search.Edit_TitleChange(Sender: TObject);
begin
  TextCheck;
end;

procedure TFrame_Search.DateEdit1Change(Sender: TObject);
begin
  TextCheck;
end;

procedure TFrame_Search.Edit_ConagChange(Sender: TObject);
begin
  TextCheck;
end;

procedure TFrame_Search.sBitBtn_ViewBaseClick(Sender: TObject);
begin
  Form_ViewBase := TForm_ViewBase.Create(Application);
  try
    Form_ViewBase.ShowModal;
  finally
    Form_ViewBase.Free;
    Form_ViewBase := nil;
  end;
end;

end.

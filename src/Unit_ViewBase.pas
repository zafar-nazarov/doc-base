unit Unit_ViewBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, sPageControl, ExtCtrls, sPanel, sListView, ImgList,
  acAlphaImageList, DB, IBCustomDataSet, IBQuery, sTreeView;

type
  TForm_ViewBase = class(TForm)
    sPanel_Top: TsPanel;
    sPanel_Bottom: TsPanel;
    sPageControl1: TsPageControl;
    sTabSheet1: TsTabSheet;
    sTabSheet2: TsTabSheet;
    sAlphaImageList1: TsAlphaImageList;
    sListView1: TsListView;
    sListView2: TsListView;
    sPanel1: TsPanel;
    IBQuery1: TIBQuery;
    sTreeView1: TsTreeView;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_ViewBase: TForm_ViewBase;

implementation

{$R *.dfm}

end.

{Define a la ventana de sesión. Esta ventana permite mostrar el texto que va llegando
 de un proceso. Servirá para visualizar como se interactúa con la sesión y para poder
 iniciar conexiones a sqlplus mediante el telnet.}

unit FormPrincipal;
{$mode objfpc}{$H+}

interface
uses
  Classes, SysUtils, FileUtil, LazUTF8, SynEdit, Forms, Controls, Graphics,
  Dialogs, Menus, ActnList, ExtCtrls, ComCtrls, SynEditKeyCmds,
  SynEditMarkupHighAll, SynEditMiscClasses, LCLType, LCLProc, LCLIntf, StdActns,
  UnTerminal, Clipbrd, FormConfig,
  FormEditMacros, MisUtils, Globales, FrameCfgConex, FormSelFuente,
  TermVT, uResaltTerm, SynFacilUtils;

type

  { TfrmPrincipal }

  TfrmPrincipal = class(TForm)
  published
    AcArcSalir: TAction;
    acEdCopy: TEditCopy;
    acEdCut: TEditCut;
    acEdModCol: TAction;
    acEdRedo: TAction;
    acEdSelecAll: TAction;
    acEdUndo: TAction;
    AcHerCfg: TAction;
    AcTerDetPrm: TAction;
    AcTerDescon: TAction;
    AcTerConec: TAction;
    AcTerLimBuf: TAction;
    AcPCmEnvLin: TAction;
    AcPCmEnvTod: TAction;
    AcTerConfig: TAction;
    acPCmEnvCtrC: TAction;
    AcTerEnvCtrlC: TAction;
    AcTerEnvEnter: TAction;
    AcTerEnvCR: TAction;
    AcTerEnvCRLF: TAction;
    AcTerEnvLF: TAction;
    acEdPaste: TAction;
    AcVerBarEst: TAction;
    AcVerEdiMac: TAction;
    AcVerPanCom: TAction;
    ActionList1: TActionList;
    ImageList1: TImageList;
    MainMenu1: TMainMenu;
    MenuItem13: TMenuItem;
    mnEdicion: TMenuItem;
    mnVer: TMenuItem;
    MenuItem16: TMenuItem;
    MenuItem17: TMenuItem;
    MenuItem18: TMenuItem;
    MenuItem19: TMenuItem;
    mnArchivo: TMenuItem;
    MenuItem20: TMenuItem;
    MenuItem21: TMenuItem;
    MenuItem22: TMenuItem;
    MenuItem23: TMenuItem;
    MenuItem26: TMenuItem;
    MenuItem30: TMenuItem;
    MenuItem31: TMenuItem;
    MenuItem46: TMenuItem;
    MenuItem48: TMenuItem;
    MenuItem49: TMenuItem;
    MenuItem50: TMenuItem;
    MenuItem51: TMenuItem;
    MenuItem52: TMenuItem;
    MenuItem53: TMenuItem;
    MenuItem54: TMenuItem;
    MenuItem55: TMenuItem;
    MenuItem56: TMenuItem;
    MenuItem57: TMenuItem;
    MenuItem58: TMenuItem;
    MenuItem59: TMenuItem;
    MenuItem60: TMenuItem;
    MenuItem61: TMenuItem;
    mnTerSend: TMenuItem;
    MenuItem68: TMenuItem;
    MenuItem69: TMenuItem;
    MenuItem70: TMenuItem;
    MenuItem71: TMenuItem;
    MenuItem72: TMenuItem;
    MenuItem73: TMenuItem;
    MenuItem74: TMenuItem;
    MenuItem75: TMenuItem;
    MenuItem76: TMenuItem;
    MenuItem77: TMenuItem;
    MenuItem78: TMenuItem;
    MenuItem79: TMenuItem;
    MenuItem80: TMenuItem;
    MenuItem81: TMenuItem;
    MenuItem82: TMenuItem;
    MenuItem83: TMenuItem;
    MenuItem84: TMenuItem;
    MenuItem85: TMenuItem;
    MenuItem86: TMenuItem;
    mnPopLeng: TMenuItem;
    mnLenguajes: TMenuItem;
    MenuItem47: TMenuItem;
    mnAbrMacro: TMenuItem;
    mnEjecMacro: TMenuItem;
    mnPanCom: TMenuItem;
    MenuItem37: TMenuItem;
    mnHerram: TMenuItem;
    MenuItem40: TMenuItem;
    MenuItem5: TMenuItem;
    mnTerminal: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    OpenDialog1: TOpenDialog;
    Panel1: TPanel;
    Panel2: TPanel;
    PopupMenu1: TPopupMenu;
    PopupMenu2: TPopupMenu;
    SaveDialog1: TSaveDialog;
    Splitter1: TSplitter;
    StatusBar1: TStatusBar;
    edTerm: TSynEdit;
    edPCom: TSynEdit;
    tbPCom: TToolBar;
    tbTerm: TToolBar;
    Timer1: TTimer;
    ToolButton1: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    ToolButton17: TToolButton;
    ToolButton2: TToolButton;
    ToolButton20: TToolButton;
    ToolButton21: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    procedure AcArcSalirExecute(Sender: TObject);
    procedure acEdPasteExecute(Sender: TObject);
    procedure acEdRedoExecute(Sender: TObject);
    procedure acEdUndoExecute(Sender: TObject);
    procedure AcPcmConfigExecute(Sender: TObject);
    procedure acPCmEnvCtrCExecute(Sender: TObject);
    procedure AcPCmEnvLinExecute(Sender: TObject);
    procedure AcPCmEnvTodExecute(Sender: TObject);
    procedure AcHerCfgExecute(Sender: TObject);
    procedure AcTerConecExecute(Sender: TObject);
    procedure AcTerConfigExecute(Sender: TObject);
    procedure AcTerDesconExecute(Sender: TObject);
    procedure AcTerDetPrmExecute(Sender: TObject);
    procedure AcTerEnvCRExecute(Sender: TObject);
    procedure AcTerEnvCRLFExecute(Sender: TObject);
    procedure AcTerEnvCtrlCExecute(Sender: TObject);
    procedure AcTerEnvEnterExecute(Sender: TObject);
    procedure AcTerEnvLFExecute(Sender: TObject);
    procedure AcTerLimBufExecute(Sender: TObject);
    function BuscaUltPrompt: integer;
    procedure AcVerEdiMacExecute(Sender: TObject);
    procedure ChangeEditorState;
    procedure edPComEnter(Sender: TObject);
    procedure edPComKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edPComKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edPComSpecialLineMarkup(Sender: TObject; Line: integer;
      var Special: boolean; Markup: TSynSelectedColor);
    procedure edTermEnter(Sender: TObject);
    procedure edTermSpecialLineMarkup(Sender: TObject; Line: integer;
      var Special: boolean; Markup: TSynSelectedColor);
    procedure ePComFileOpened;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormDropFiles(Sender: TObject; const FileNames: array of String);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: char);
    procedure FormShow(Sender: TObject);
    procedure itemEjecMacro(Sender: TObject);
    procedure itemAbreMacro(Sender: TObject);
    procedure mnAbrMacroClick(Sender: TObject);
    procedure mnEjecMacroClick(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure procChangeState(info: string; pFinal: TPoint);
    procedure procInitScreen(const grilla: TtsGrid; fIni, fFin: integer);
    procedure procAddLine(HeightScr: integer);
    procedure procLlegoPrompt(prmLine: string; pIni: TPoint; HeightScr: integer);
    procedure procRefreshLine(const grilla: TtsGrid; fIni, HeightScr: integer);
    procedure procRefreshLines(const grilla: TtsGrid; fIni, fFin, HeightScr: integer);
    procedure StatusBar1DrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel;
      const Rect: TRect);
    procedure Timer1Timer(Sender: TObject);
  private
    hlTerm    : TResaltTerm;
    CtrlPulsado: boolean;
    ePCom     : TSynFacilEditor;  //ventana de editor
    eTerm     : TSynFacilEditor;  //ventana de terminal
    LlegoPrompt: boolean;   //bandera
    parpadPan0: boolean;   //para activar el parpadeo del panel0
    ticComRec : integer;   //contador para comando recurrente
    procedure AbrirSesion(ses: string);
    function BuscaPromptAba: integer;
    function BuscaPromptArr: integer;
    procedure DistribuirPantalla;
    procedure EnviarTxt(txt: string);
    procedure InicTerminal;
    procedure PosicionarCursor(HeightScr: integer);
  public
    proc   : TConsoleProc; //referencia al proceso actual
    ejecMac: boolean;   //indica que está ejecutando una macro
    ejecCom: boolean;   //indica que está ejecutando un comando (editor remoto, exp. remoto ...)
    SesAct : string;    //nombre de la sesión actual
    procedure InicConect;
    procedure ActualizarInfoPanel0;
    function ConexDisponible: boolean;
    procedure SetLanguage(lang: string);
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation
{$R *.lfm}

{ TfrmPrincipal }

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  SesAct := '';
  ticComRec  := 0;

  ejecMac := false;
  hlTerm := TResaltTerm.Create(Self);  //crea resaltador

  //configura editor de terminal
  eTerm := TSynFacilEditor.Create(edTerm,'SinNombre','sh');   //Crea Editor
  eTerm.PanCursorPos := StatusBar1.Panels[2];  //panel para la posición del cursor
  InicTerminal;  //configura ventana de terminal

  //configura editor de Panel de comando
  InicEditorC1(edPCom); //configura panel de comandos
  edPCom.OnSpecialLineMarkup:=@edPComSpecialLineMarkup; //solo para corregir bug de SynEdit (falla de resaltado de línea actual)
  ePCom := TSynFacilEditor.Create(edPCom,'SinNombre','sh');   //Crea Editor
  ePCom.OnChangeEditorState:=@ChangeEditorState;
  ePCom.OnKeyUp:=@edPComKeyUp;    //evento
  ePCom.OnKeyDown:=@edPComKeyDown; //evento
  ePcom.OnFileOpened:=@ePComFileOpened;
  ePCom.PanCursorPos := StatusBar1.Panels[2];  //panel para la posición del cursor
  ePCom.PanLangName := StatusBar1.Panels[4];  //lenguaje

  ePCom.NewFile;   //para actualizar estado
  ePCom.InitMenuLanguages(mnLenguajes, rutLenguajes);
  ePCom.LoadSyntaxFromPath;

  //inicia proceso
  proc := TConsoleProc.Create(StatusBar1.Panels[1]);
  StatusBar1.OnDrawPanel:=@StatusBar1DrawPanel;

  //proc.OnRefreshAll:=@procRefreshEdit;
  proc.OnInitScreen :=@procInitScreen;
  proc.OnRefreshLine:=@procRefreshLine;
  proc.OnRefreshLines:=@procRefreshLines;
  proc.OnAddLine:=@procAddLine;

  proc.OnGetPrompt:=@procLlegoPrompt;
  proc.OnChangeState:=@procChangeState;

  AcTerDescon.Enabled:=false;  //Se supone que inicia siempre sin conectar

end;
procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
  ePCom.Free;
  eTerm.Free;
  proc.Free;
  hlTerm.Free;
end;
procedure TfrmPrincipal.FormDropFiles(Sender: TObject;
  const FileNames: array of String);
begin
  //Carga archivo arrastrados
  if ePCom.SaveQuery then Exit;   //Verifica cambios
  ePCom.LoadFile(FileNames[0]);
end;
procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  TranslateMsgs := true;  //activa la traducción en los mensajes
  SetLanguage('en');
  Config.SetLanguage('en');
  frmEditMacros.SetLanguage('en');
  //aquí ya sabemos que Config está creado. Lo configuramos
  Config.edTerm := edTerm;  //pasa referencia de editor.
  Config.edPCom := edPCom;  //pasa referencia de Panel de comando
  Config.edMacr := frmEditMacros.ed;
  Config.prTel := proc;     //pasa referencia a proceso

  Config.Iniciar(ePCom.hl);  //Inicia la configuración
  DistribuirPantalla; //ubica componentes
  //muestra dirección IP actual
  ActualizarInfoPanel0;
  //actualiza menús
  mnEjecMacroClick(self);
  mnAbrMacroClick(self);

  ePComFileOpened; //para actualizar barra de título
end;

procedure TfrmPrincipal.InicTerminal;
var
  SynMarkup: TSynEditMarkupHighlightAllCaret;  //para resaltar palabras iguales
begin
  edTerm.Highlighter := hlTerm;  //asigna resaltador

  //Inicia resaltado de palabras iguales
  SynMarkup := TSynEditMarkupHighlightAllCaret(edTerm.MarkupByClass[TSynEditMarkupHighlightAllCaret]);
  SynMarkup.MarkupInfo.FrameColor := clSilver;
  SynMarkup.MarkupInfo.Background := clBlack;
  SynMarkup.MarkupInfo.StoredName:='ResPalAct';  //para poder identificarlo

  SynMarkup.WaitTime := 250; // millisec
  SynMarkup.Trim := True;     // no spaces, if using selection
  SynMarkup.FullWord := True; // only full words If "Foo" is under caret, do not mark it in "FooBar"
  SynMarkup.IgnoreKeywords := False;

  //  edTerm.Font.Name:='Courier New';
 //  edTerm.Font.Size:=10;
 //resalta
  edTerm.Options:=[eoBracketHighlight];
  //Limita posición X del cursor para que no escape de la línea
  edTerm.Options := edTerm.Options + [eoKeepCaretX];
  //permite indentar con <Tab>
  edTerm.Options := edTerm.Options + [eoTabIndent];
  //trata a las tabulaciones como un caracter
  edTerm.Options2 := edTerm.Options2 + [eoCaretSkipTab];
  edTerm.OnSpecialLineMarkup:=@edTermSpecialLineMarkup;  //solo para corregir falla de resaltado de línea actual
end;
procedure TfrmPrincipal.edTermSpecialLineMarkup(Sender: TObject; Line: integer;
  var Special: boolean; Markup: TSynSelectedColor);
begin
//vacío
end;
procedure TfrmPrincipal.ePComFileOpened;
begin
  ePCom.LoadSyntaxFromPath;  //para que busque el archivo apropiado
  //actualiza encabezado
  if SesAct = '' then begin
    Caption := NOM_PROG + dic(' - Archivo: ')+ ePCom.NomArc;
  end else begin
    Caption := NOM_PROG + ' - Sesión: ' + ExtractFileName(SesAct) +
                          dic(' - Archivo: ')+ ePCom.NomArc;
  end;
end;
procedure TfrmPrincipal.edPComSpecialLineMarkup(Sender: TObject; Line: integer;
  var Special: boolean; Markup: TSynSelectedColor);
begin
//vacío
end;
procedure TfrmPrincipal.edTermEnter(Sender: TObject);
begin
  ChangeEditorState;  //para actualizar los menús
  eTerm.PanCursorPos := nil; //para forzar a actualiazr la posición del cursor
  eTerm.PanCursorPos := StatusBar1.Panels[2];
end;
procedure TfrmPrincipal.PopupMenu1Popup(Sender: TObject);  //abre menú contextual
//prepara el menú de "lenguajes", en el menú contextual
begin
  CopiarMemu(mnLenguajes, mnPopLeng);
end;

/////////////// Funciones para manejo de macros///////////////
procedure TfrmPrincipal.mnEjecMacroClick(Sender: TObject);
begin
  mnEjecMacro.Clear;
  LeeArchEnMenu(rutMacros + DirectorySeparator +'*.ttm', mnEjecMacro,@itemEjecMacro);
end;
procedure TfrmPrincipal.mnAbrMacroClick(Sender: TObject);
begin
  mnAbrMacro.Clear;
  LeeArchEnMenu(rutMacros + DirectorySeparator +'*.ttm', mnAbrMacro,@itemAbreMacro);
end;

procedure TfrmPrincipal.AbrirSesion(ses: string);
//Abre una sesión
var
  arc0: String;
  rpta: Byte;
begin
  if proc.state <> ECO_STOPPED then begin
    rpta := MsgYesNoCancel('Hay una conexión abierta. ¿Cerrarla?');
    if rpta in [2,3] then begin  //cancelar
      exit;    //sale
    end;
    if rpta = 1 then begin  //detener primero
      AcTerDesconExecute(nil);
    end;
  end;
  SesAct := ses;  //actualiza sesión actual
  arc0 := SesAct;    //el archivo de sesión debe incluir el contendio además de la ocnfig.
  config.LeerArchivoIni(arc0);  //carga configuración
  //actualiza menús
  mnEjecMacroClick(self);
  mnAbrMacroClick(self);

  DistribuirPantalla; //ubica componentes
  //muestra dirección IP actual
  ActualizarInfoPanel0;

  ePComFileOpened; //para actualizar barra de título
end;
procedure TfrmPrincipal.itemEjecMacro(Sender: TObject);
//Ejecuta la macro elegida
begin
  frmEditMacros.Ejecutar(rutMacros + DirectorySeparator + TMenuItem(Sender).Caption);
end;
procedure TfrmPrincipal.itemAbreMacro(Sender: TObject);
begin
  frmEditMacros.Show;
  frmEditMacros.Abrir(rutMacros + DirectorySeparator + TMenuItem(Sender).Caption);
end;
procedure TfrmPrincipal.PosicionarCursor(HeightScr: integer);
//Coloca el cursor del editor, en la misma posición que tiene el cursor del
//terminal VT100 virtual.
var
  yvt: Integer;
begin
  if Config.fcPantTerm.curSigPrm then begin
    yvt := edTerm.Lines.Count-HeightScr-1;  //calcula fila equivalente a inicio de VT100
    edTErm.CaretXY := Point(proc.term.curX, yvt+proc.term.CurY+1);
  end;
end;

procedure TfrmPrincipal.procLlegoPrompt(prmLine: string; pIni: TPoint; HeightScr: integer);
begin
  LlegoPrompt := true;  //activa bandera
//  yvt := edTerm.Lines.Count-HeightScr-1;  //calcula fila equivalente a inicio de VT100
//debugln('  llegoPrompt en:'+IntToStr(yvt + pIni.y+1));
end;
procedure TfrmPrincipal.procChangeState(info: string; pFinal: TPoint);
//Hubo un cambio de estado
begin
  AcTerConec.Enabled := proc.state = ECO_STOPPED;
  AcTerDescon.Enabled:= not (proc.state = ECO_STOPPED);
end;
procedure TfrmPrincipal.procInitScreen(const grilla: TtsGrid; fIni, fFin: integer);
var
  i: Integer;
begin
//  debugln('procAddLastLins: '+IntToStr(fIni)+','+IntToSTr(fFin));
  for i:=fIni to fFin do
    edTerm.Lines.Add(grilla[i]);
end;
procedure TfrmPrincipal.procRefreshLine(const grilla: TtsGrid; fIni, HeightScr: integer);
var
  yvt: Integer;
begin
//  debugln('procRefreshLine: '+IntToStr(fIni));
  yvt := edTerm.Lines.Count-HeightScr-1;  //calcula fila equivalente a inicio de VT100
  edTerm.Lines[yvt+fIni] := grilla[fIni];
  PosicionarCursor(HeightScr);
end;
procedure TfrmPrincipal.procRefreshLines(const grilla: TtsGrid; fIni, fFin, HeightScr: integer);
var
  yvt: Integer;
  f: Integer;
begin
//  debugln('procRefreshLines: '+IntToStr(fIni)+','+IntToSTr(fFin));
  yvt := edTerm.Lines.Count-HeightScr-1;  //calcula fila equivalente a inicio de VT100
  edTerm.BeginUpdate();
  for f:=fIni to fFin do
    edTerm.Lines[yvt+ f] := grilla[f];
  PosicionarCursor(HeightScr);
  edTerm.EndUpdate;
  edTerm.Refresh;  //para mostrar el cambio
end;
procedure TfrmPrincipal.procAddLine(HeightScr: integer);
var
  i: Integer;
begin
//  debugln('procAddLine: ');
  edTerm.BeginUpdate();
  if edTerm.Lines.Count> Config.fcPantTerm.maxLinTer then begin
    //hace espacio
    for i:= 1 to 100 do
      edTerm.Lines.Delete(0);   { TODO : Debe verificarse que no se deba eliminar tanto
como para dejar menos líneas que la que tiene el VT100 }
  end;
  edTerm.Lines.Add('');
//  edTerm.ExecuteCommand(ecEditorBottom,'', nil);  //mueve al final
  edTerm.EndUpdate;
  edTerm.ExecuteCommand(ecLineEnd,'', nil);  //mueve al final
end;

procedure TfrmPrincipal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if edTerm.Focused then begin
     case Key of
     VK_RETURN:
       proc.Sendln('');  //se envía con la configuración de saltos
     VK_LEFT, VK_RIGHT, VK_UP, VK_DOWN, VK_HOME, VK_END : begin
         //teclas direccionales
         if Config.fcPantTerm.interDirec then begin
           //se interceptan, no se envían
         end else begin  //se envían como secuencias de escape
           proc.SendVT100Key(Key, Shift);
           Key := 0;  //para que nos e procesen
         end;
       end;
     VK_TAB:
       if Shift = [ssCtrl] then begin  //Ctrl+Tab
         edPCom.SetFocus;  //pasa el enfoque
       end else begin
         proc.SendVT100Key(Key, Shift);  //envía
       end;
     else
       proc.SendVT100Key(Key, Shift);
     end;
//     debugln('KeyDown:');
   end else if edPCom.Focused then begin
     case Key of
     VK_TAB: if Shift = [ssCtrl] then begin  //Ctrl+Tab
         edterm.SetFocus;  //pasa el enfoque
       end;
     end;
   end;
end;
procedure TfrmPrincipal.FormKeyPress(Sender: TObject; var Key: char);
//Aaquí se interceptan el teclado a los controles
begin
  if edTerm.Focused then begin
    proc.Send(Key);
//    debugln('KeyPress:'+Key);
  end;
end;
procedure TfrmPrincipal.FormClose(Sender: TObject; var CloseAction: TCloseAction
  );
begin
  Config.escribirArchivoIni;  //guarda configuración
end;

procedure TfrmPrincipal.FormCloseQuery(Sender: TObject; var CanClose: boolean);
var
  rpta: Byte;
begin
  if ejecMac then begin
    if MsgYesNo('En este momento, se está ejecutando una macro. ¿Detenerla?') = 1 then begin
      frmEditMacros.DetenerEjec;
      exit;
    end;
    canClose := false;  //cancela el cierre
  end;
  if proc.state <> ECO_STOPPED then begin
    rpta := MsgYesNoCancel('Hay una conexión abierta. ¿Cerrarla?');
    if rpta in [2,3] then begin  //cancelar
      canClose := false;  //cancela el cierre
      exit;    //sale
    end;
    if rpta = 1 then begin  //detener primero
      AcTerDesconExecute(nil);
      exit;
    end;
  end;
end;

procedure TfrmPrincipal.StatusBar1DrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
begin
  if panel.Index = 0 then begin
    if ejecMac then begin
      if parpadPan0 then begin
//        StatusBar.Canvas.Font.Bold := true;
        StatusBar.Canvas.Font.Color:=clBlue;
        StatusBar.Canvas.Pen.Color := clWhite;
        StatusBar.Canvas.Brush.Color := clWhite;
        StatusBar.Canvas.Rectangle(Rect);
        StatusBar.Canvas.TextRect(Rect, 2 + Rect.Left, 2 + Rect.Top, dic('Ejecutando macro'));
      end else begin
//        StatusBar.Canvas.Font.Bold := true;
        StatusBar.Canvas.Font.Color:=clWhite;
        StatusBar.Canvas.Pen.Color := clBlue;
        StatusBar.Canvas.Brush.Color := clBlue;
        StatusBar.Canvas.Rectangle(Rect);
        StatusBar.Canvas.TextRect(Rect, 2 + Rect.Left, 2 + Rect.Top, dic('Ejecutando macro'));
      end;
    end else begin
      StatusBar.Canvas.Font.Color:=clBlack;
//      StatusBar.Canvas.Font.Bold := true;
      StatusBar.Canvas.TextRect(Rect, 2 + Rect.Left, 2 + Rect.Top, StatusBar1.Panels[0].Text);
    end;
  end;
  if panel.Index = 1 then proc.DrawStatePanel(StatusBar.Canvas, Rect);
end;

procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
//Temporizador cada de 0.5 segundos
begin
  //muestra mensaje de ejecución
  if ejecMac then begin
    //fuerza refresco del panel
    parpadPan0 := not parpadPan0;  //para el parpadeo
    StatusBar1.InvalidatePanel(0,[ppText]);
  end;
end;

procedure TfrmPrincipal.InicConect;  //Inicia la conexión actual
begin
  //se supone que el proceso ya está configurado y listo para abrir
  proc.Open(Config.fcConex.Command , '');  //lo abre
  if msjError<>'' then begin
    msgerr(msjError);
  end;
  ActualizarInfoPanel0;  //por si ha cambiado la conexión
end;
procedure TfrmPrincipal.ActualizarInfoPanel0;
//Actualiza el panel 0, con información de la conexión o de la ejecución de macros
begin
   StatusBar1.Panels[0].Text:='Proc: '+Config.fcConex.Command;
   //refresca para asegurarse, porque el panel 0 está en modo gráfico
   StatusBar1.InvalidatePanel(0,[ppText]);
end;

function TfrmPrincipal.ConexDisponible: boolean;
//Indica si la conexión está en estado ECO_READY, es decir, que puede
//recibir un comando
begin
   Result := (proc.state = ECO_READY);
end;

function TfrmPrincipal.BuscaPromptArr: integer;
//Busca el primer prompt desde la posición actual hacia arriba
//Si no lo encuentra devuelve -1
var
  cy: Integer;
begin
  cy := edterm.CaretY;
  repeat
    dec(cy)
  until (cy<1) or config.ContienePrompt(edTerm.Lines[cy-1]);
  if cy<1 then exit(-1) else exit(cy);
end;
function TfrmPrincipal.BuscaPromptAba: integer;
//Busca el primer prompt desde la posición actual hacia abajo
//Si no lo encuentra devuelve -1
var
  cy: Integer;
begin
  cy := edterm.CaretY;
  repeat
    inc(cy)
  until (cy>edTerm.Lines.Count) or config.ContienePrompt(edTerm.Lines[cy-1]);
  if cy>edTerm.Lines.Count then exit(-1) else exit(cy);
end;
function TfrmPrincipal.BuscaUltPrompt: integer;
//Busca el último prompt de todo el terminal
//Si no lo encuentra devuelve -1
var
  cy: Integer;
begin
  cy := edterm.Lines.Count+1;
  repeat
    dec(cy)
  until (cy<1) or config.ContienePrompt(edTerm.Lines[cy-1]);
  if cy<1 then exit(-1) else exit(cy);
end;

procedure TfrmPrincipal.edPComKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Shift = [ssCtrl] then begin  //Ctrl pulsado
    if not CtrlPulsado then begin   //primera pulsación
      CtrlPulsado := true;    //activa
{      if edPCom.LineHighlightColor.Background<>clNone then begin
        coLFonLin := edPCom.LineHighlightColor.Background;  //guarda color actual
        //calcula color aclarado
        GetRGBIntValues(coLFonLin,r,g,b);
        coLClaro := RGB(min(r+70,255), min(g+70,255), min(b+70,255));
        edPCom.LineHighlightColor.Background:=colClaro;  //cambia
      end;}
    end;
  end;
end;
procedure TfrmPrincipal.edPComKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Shift = [ssCtrl] then begin
    if key = VK_RETURN then begin //envía línea actual
      AcPCmEnvLinExecute(self);
      if edPCom.SelAvail then begin  //había selección
        //no se cambia la selección
      end else if edPCom.CaretY = edPCom.Lines.Count then begin
        //estamos en la última línea
        if edPCom.LineText = '' then exit; //no hay nada que enviar ni agregar
        edpCom.Lines.Add('');  //agrega una línea
        edPCom.ExecuteCommand(ecDown, '',nil);  //baja cursor
      end else begin
        //es una línea normal
        edPCom.ExecuteCommand(ecDown, '',nil);  //baja cursor
      end;
    end;
  end else begin  //Ctrl soltado
    if CtrlPulsado then begin   //primera soltada
      CtrlPulsado := false;    //activa
//      if edPCom.LineHighlightColor.Background<>clNone then
//        edPCom.LineHighlightColor.Background:=coLFonLin;  //restaura
    end;
  end;
end;

procedure TfrmPrincipal.DistribuirPantalla;
//Redistribuye los paneles de la pantalla
begin
  //primero quita alineamiento de componentes móviles
  PAnel2.Align:=alNone;
  Panel1.Align:=alNone;
  Splitter1.Align:=alNone;
  //alinea de acuerdo a TipAlineam
  Panel1.Align:=alLeft;
  Splitter1.Align:=alLeft;
  Panel2.Align:=alClient;
  if Panel1.Width > Trunc(0.9*self.Width) then Panel1.Width := Trunc(0.5*self.Width);
end;
procedure TfrmPrincipal.ChangeEditorState;
//Si llega aquí es porque cambia el estado del editor. Actualiza los menús:
begin
  if edPCom.Focused then begin
    //este es el único editor que acepta Undo/Redo
    acEdUndo.Enabled:=ePCom.CanUndo;
    acEdRedo.Enabled:=ePCom.CanRedo;
    acEdPaste.Enabled := ePCom.CanPaste;
    //Cut Copy son acciones predefinidas, se activan solas.
  end else begin
    acEdUndo.Enabled:=false;
    acEdRedo.Enabled:=false;
    acEdPaste.Enabled := true;   //para poder pegar lo que haya en el portapapeles
  end;


end;
/////////////////////// ACCIONES ////////////////////////
procedure TfrmPrincipal.AcArcSalirExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrincipal.acEdUndoExecute(Sender: TObject);
begin
  if edPCom.Focused then begin //El único editor que acepta Undo/Redo
    ePCom.Undo;
  end;
end;
procedure TfrmPrincipal.acEdRedoExecute(Sender: TObject);
begin
  if edPCom.Focused then begin //El único editor que acepta Undo/Redo
    ePCom.Redo;
  end;
end;
procedure TfrmPrincipal.acEdPasteExecute(Sender: TObject);
begin
  if edpCom.Focused then begin
    ePCom.Paste;  //pega en el editor
  end;
  if edTerm.Focused then begin
    proc.SendLn(ClipBoard.AsText);  //envía al terminal
  end;
end;
procedure TfrmPrincipal.edPComEnter(Sender: TObject);  //Toma el enfoque
begin
  ChangeEditorState;  //para actualizar los menús
  ePCom.PanCursorPos := nil; //para forzar a actualiazr la posición del cursor
  ePCom.PanCursorPos := StatusBar1.Panels[2];
end;
procedure TfrmPrincipal.AcVerEdiMacExecute(Sender: TObject);
begin
  frmEditMacros.Show;
end;
procedure TfrmPrincipal.EnviarTxt(txt: string);
//Envía un tetxo al terminal, aplicando el preprocesamiento si es necesario
begin
  proc.SendLn(txt);
end;
procedure TfrmPrincipal.AcPCmEnvLinExecute(Sender: TObject);
var
  lin: String;
begin
  if proc = nil then exit;
  if edPCom.SelAvail then begin  //hay selección
    //envía texto seleccionado
    EnviarTxt(edPCom.SelText);
  end else begin  //no hay selección, envía la línea actual
    lin := edPCom.LineText;  //línea actual
    EnviarTxt(lin);
  end;
end;
procedure TfrmPrincipal.AcPCmEnvTodExecute(Sender: TObject);
//Envía todo el texto
begin
  if proc = nil then exit ;
  if edPCom.SelAvail then begin
    //hay selección
    frmSelFuente.optSel.Checked := true;
    frmSelFuente.optLin.Enabled := false;
    frmSelFuente.ShowModal;
    If frmSelFuente.cancelado Then Exit;  //cancelado
    //se eligió
    If frmSelFuente.optTod.Checked Then begin  //todo
      EnviarTxt(edPCom.Text);
    end else if frmSelFuente.optSel.Checked Then begin  //selección
      EnviarTxt(edPCom.SelText);
    end Else begin   //solo la línea actual
      EnviarTxt(edPCom.LineText);
    End;
  end else begin
    //no hay selección, envía todo
    EnviarTxt(edPCom.Text);
  end;
end;
procedure TfrmPrincipal.acPCmEnvCtrCExecute(Sender: TObject); //Envía Ctrl+C
begin
  proc.Send(#3);
end;
procedure TfrmPrincipal.AcPcmConfigExecute(Sender: TObject);
begin
  Config.Configurar('3.1');
end;

procedure TfrmPrincipal.AcTerConecExecute(Sender: TObject);
begin
  InicConect;   //inicia conexión
end;
procedure TfrmPrincipal.AcTerDesconExecute(Sender: TObject); //desconectar
begin
   if not proc.Close then
     msgerr('No se puede cerrar el proceso actual.');
end;
procedure TfrmPrincipal.AcTerConfigExecute(Sender: TObject); //configurar
begin
   Config.Configurar('2.1');
end;

procedure TfrmPrincipal.AcTerDetPrmExecute(Sender: TObject); //Detecta prompt
begin
  proc.AutoConfigPrompt;  //auto-detección
  config.fcDetPrompt.DetecPrompt := proc.detecPrompt;
  config.fcDetPrompt.prIni := proc.promptIni;
  config.fcDetPrompt.prFin := proc.promptFin;
  config.fcDetPrompt.TipDetec:=proc.promptMatch;
  config.fcDetPrompt.OnUpdateChanges;  //actualiza resaltador y al mismo proceso
end;
procedure TfrmPrincipal.AcTerEnvCtrlCExecute(Sender: TObject);  //Ctrl+C
begin
  proc.Send(#3);
end;
procedure TfrmPrincipal.AcTerEnvEnterExecute(Sender: TObject);  //Enter
begin
  proc.SendLn('');
end;
procedure TfrmPrincipal.AcTerEnvCRExecute(Sender: TObject);
begin
  proc.Send(#13);
end;
procedure TfrmPrincipal.AcTerEnvLFExecute(Sender: TObject);
begin
  proc.Send(#10);
end;
procedure TfrmPrincipal.AcTerEnvCRLFExecute(Sender: TObject);
begin
  proc.Send(#13#10);
end;
procedure TfrmPrincipal.AcTerLimBufExecute(Sender: TObject);
//limpia la salida
begin
  edterm.ClearAll;
  proc.ClearTerminal;  //generará el evento OnInitLines()
end;
procedure TfrmPrincipal.AcHerCfgExecute(Sender: TObject);
begin
  Config.Configurar;
  ActualizarInfoPanel0;
end;

procedure TfrmPrincipal.SetLanguage(lang: string);
//Rutina de traducción
begin
  case lowerCase(lang) of
  'es': begin
      mnArchivo.Caption:='&Archivo';
      mnEdicion.Caption:='&Edición';
      mnVer.Caption:='&Ver';
      mnPanCom.Caption:='Panel de &Comandos';
      mnTerminal.Caption:='&Terminal';
      mnHerram.Caption:='&Herramientas';

      mnLenguajes.Caption:='&Lenguaje';
      mnEjecMacro.Caption:='&Ejecutar Macro';
      mnAbrMacro.Caption:='&Abrir Macro';
      mnTerSend.Caption:='&Enviar';
      MenuItem82.Caption:='Copiar Elemento';
      MenuItem72.Caption:='&Enviar';

      AcArcSalir.Caption := '&Salir';
      acEdUndo.Caption := '&Deshacer';
      acEdRedo.Caption := '&Rehacer';
      acEdCut.Caption := 'Cor&tar';
      acEdCopy.Caption := '&Copiar';
      acEdPaste.Caption := '&Pegar';
      acEdSelecAll.Caption := 'Seleccionar &Todo';
      acEdModCol.Caption := 'Modo Columna';
      AcVerPanCom.Caption := '&Panel de Comandos';
      AcVerBarEst.Caption := 'Barra de estado';
      AcVerEdiMac.Caption := 'Editor de &Macros';
      AcPCmEnvLin.Caption := 'Enviar &Línea';
      AcPCmEnvTod.Caption := 'Enviar &Todo';
      acPCmEnvCtrC.Caption := 'Enviar Ct&rl+C';
      AcTerConec.Caption := '&Conectar';
      AcTerDescon.Caption := '&Desconectar';
      AcTerLimBuf.Caption := '&Limpiar Buffer';
      AcTerDetPrm.Caption := 'Detectar &Prompt';
      AcTerConfig.Caption := 'Confi&gurar';
      AcTerEnvCtrlC.Caption := 'Enviar &Ctrl-C';
      AcTerEnvEnter.Caption := 'Enviar &Enter';
      AcTerEnvCR.Caption := 'Enviar &CR';
      AcTerEnvCRLF.Caption := 'Enviar CR+&LF';
      AcTerEnvLF.Caption := 'Enviar LF';
      AcHerCfg.Caption := 'Confi&guración...';
      dicClear;  //los mensajes ya están en español
    end;
  'en': begin
      mnArchivo.Caption:='&File';
      mnEdicion.Caption:='&Edit';
      mnVer.Caption:='&View';
      mnPanCom.Caption:='&Command Panel';
      mnTerminal.Caption:='&Terminal';
      mnHerram.Caption:='&Tools';

      mnLenguajes.Caption:='&Language';
      mnEjecMacro.Caption:='&Execute Macro';
      mnAbrMacro.Caption:='&Open Macro';
      mnTerSend.Caption:='&Send';
      MenuItem82.Caption:='Copy Element';
      MenuItem72.Caption:='&Send';

      AcArcSalir.Caption := '&Exit';
      acEdUndo.Caption := '&Undo';
      acEdRedo.Caption := '&Redo';
      acEdCut.Caption := 'C&ut';
      acEdCopy.Caption := '&Copy';
      acEdPaste.Caption := '&Paste';
      acEdSelecAll.Caption := 'Select &All';
      acEdModCol.Caption := 'Column Mode';
      AcVerPanCom.Caption := '&Comand Panel';
      AcVerBarEst.Caption := 'Status Bar';
      AcVerEdiMac.Caption := '&Macro Editor';
      AcPCmEnvLin.Caption := 'Send &Line';
      AcPCmEnvTod.Caption := 'Send &All';
      acPCmEnvCtrC.Caption := 'Send Ct&rl+C';
      AcTerConec.Caption := '&Connect';
      AcTerDescon.Caption := '&Disconnect';
      AcTerLimBuf.Caption := '&Clean Buffer';
      AcTerDetPrm.Caption := 'Detect &Prompt';
      AcTerConfig.Caption := 'Confi&gure';
      AcTerEnvCtrlC.Caption := 'Send &Ctrl-C';
      AcTerEnvEnter.Caption := 'Send &Enter';
      AcTerEnvCR.Caption := 'Send &CR';
      AcTerEnvCRLF.Caption := 'Send CR+&LF';
      AcTerEnvLF.Caption := 'Send LF';
      AcHerCfg.Caption := 'Confi&gure...';
      //traducción
      dicSet('Hay una conexión abierta. ¿Cerrarla?','There is an opened connection. Close?');
      dicSet(' - Archivo: ', ' - File: ');
      dicSet('No se encuentra archivo: %s','File not found: %s');
      dicSet('En este momento, se está ejecutando una macro. ¿Detenerla?',
             'There is a Macro runnig. Stop it?');
      dicSet('Ejecutando macro','Running macro');
      dicSet('No hay conexión disponible','No available connection');
      dicSet('Tiempo de espera agotado','Timeout');
      dicSet('Error detectando el prompt del comando. ','Error detecting prompt.');
      dicSet('Probablemente deba ampliar la cantidad de líneas de la pantalla.',
             'Probably you must increase the max number of lines in screen');
      dicSet('Archivo de sesión|*.ses|Todos los archivos|*.*','Sesion file|*.ses|All files|*.*');
      dicSet('El archivo %s ya existe.' + LineEnding + '¿Deseas sobreescribirlo?',
             'File % salready exists. Overwrite?');
      dicSet('#Archivo de comandos','#Command file');
    end;
  end;
end;

end.


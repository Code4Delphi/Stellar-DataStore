program StellarDataStoreVCL;

uses
  Vcl.Forms,
  Main.View in 'Src\Main.View.pas' {MainView};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Stellar DataStore';
  Application.CreateForm(TMainView, MainView);
  Application.Run;
end.

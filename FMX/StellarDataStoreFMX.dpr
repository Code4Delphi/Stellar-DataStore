program StellarDataStoreFMX;

uses
  System.StartUpCopy,
  FMX.Forms,
  Main.View in 'Src\Main.View.pas' {MainView},
  Products.View in 'Src\Products.View.pas' {ProductsView};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainView, MainView);
  Application.CreateForm(TProductsView, ProductsView);
  Application.Run;
end.

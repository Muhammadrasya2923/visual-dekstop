unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    btnHitung: TButton;
    btnUlang: TButton;
    btnKeluar: TButton;
    CBKode: TComboBox;
    EQTY: TEdit;
    ENama: TEdit;
    EHarga: TEdit;
    ESubTotal: TEdit;
    EDiskon: TEdit;
    ETotal: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    procedure btnHitungClick(Sender: TObject);
    procedure btnKeluarClick(Sender: TObject);
    procedure btnUlangClick(Sender: TObject);
    procedure CBKodeChange(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.btnHitungClick(Sender: TObject);
var
  qty, harga, subtotal, diskon, total: Integer;
begin
  // Validasi Quantity
  if not TryStrToInt(EQTY.Text, qty) then
  begin
    ShowMessage('Masukkan jumlah yang valid');
    Exit;
  end;

  if (qty < 1) or (qty > 10) then
  begin
    ShowMessage('Quantity harus antara 1 hingga 10');
    Exit;
  end;

  // Tentukan harga berdasarkan kode barang
  case CBKode.ItemIndex of
    0: begin
         ENama.Text := 'pulpen';
         harga := 50000;
       end;
    1: begin
         ENama.Text := 'pensil';
         harga := 25000;
       end;
    2: begin
         ENama.Text := 'buku';
         harga := 750000;
       end;
    3: begin
         ENama.Text := 'penghapus';
         harga := 5000;
       end;
  else
    ShowMessage('Pilih kode barang yang valid');
    Exit;
  end;

  EHarga.Text := IntToStr(harga);

  // Hitung subtotal
  subtotal := harga * qty;
  ESubTotal.Text := IntToStr(subtotal);

  // Hitung diskon
  if subtotal >= 100000 then
    diskon := 15
  else if subtotal >= 50000 then
    diskon := 10
  else if subtotal >= 25000 then
    diskon := 5
  else
    diskon := 0;

  EDiskon.Text := IntToStr(diskon) + '%';

  // Hitung total
  total := subtotal - (subtotal * diskon div 100);
  ETotal.Text := IntToStr(total);

end;

procedure TForm1.btnKeluarClick(Sender: TObject);
begin
  close;
end;

procedure TForm1.btnUlangClick(Sender: TObject);
begin
  // Reset
  CBKode.ItemIndex := -1;
  EQTY.Text := '';
  ENama.Text := '';
  EHarga.Text := '';
  ESubTotal.Text := '';
  EDiskon.Text := '';
  ETotal.Text := '';

end;

procedure TForm1.CBKodeChange(Sender: TObject);
begin

end;

end.


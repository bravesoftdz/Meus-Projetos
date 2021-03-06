{-----------------------------------------------------------------------------
The contents of this file are subject to the Mozilla Public License
Version 1.1 (the "License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at
http://www.mozilla.org/MPL/MPL-1.1.html

Software distributed under the License is distributed on an "AS IS" basis,
WITHOUT WARRANTY OF ANY KIND, either expressed or implied. See the License for
the specific language governing rights and limitations under the License.

The Original Code is: JvDBActionsEngineControlcxVerticalGrid.Pas, released on 2004-12-30.

The Initial Developer of the Original Code is Jens Fudickar [jens dott fudicker  att oratool dott de]
Portions created by Jens Fudickar are Copyright (C) 2002 Jens Fudickar.
All Rights Reserved.

Contributor(s): -

You may retrieve the latest version of this file at the Project JEDI's JVCL home page,
located at http://jvcl.delphi-jedi.org

Known Issues:
-----------------------------------------------------------------------------}
// $Id: JvControlActionsEngineCxVerticalGrid.pas 12461 2009-08-14 17:21:33Z obones $

unit JvControlActionsEngineCxVerticalGrid;

{$I jvcl.inc}

interface

uses
  {$IFDEF UNITVERSIONING}
  JclUnitVersioning,
  {$ENDIF UNITVERSIONING}
  Forms, Controls, Classes, DB,
  {$IFDEF USE_3RDPARTY_DEVEXPRESS_CXVERTICALGRID}
  cxVGrid,
  {$ENDIF USE_3RDPARTY_DEVEXPRESS_CXVERTICALGRID}
  JvControlActionsEngine;

{$IFDEF USE_3RDPARTY_DEVEXPRESS_CXVERTICALGRID}
type
  TJvControlActioncxVerticalGridEngine = class(TJvControlActionEngine)
  private
  protected
    procedure ExportGrid(aGrid: TcxVerticalGrid);
    function GetGrid(AActionComponent: TComponent): TcxVerticalGrid;
    function GetSupportedOperations: TJvControlActionOperations; override;
  public
    function ExecuteOperation(const aOperation: TJvControlActionOperation; const
        aActionControl: TControl): Boolean; override;
    function SupportsComponent(aActionComponent: TComponent): Boolean; override;
  end;

{$ENDIF USE_3RDPARTY_DEVEXPRESS_CXVERTICALGRID}

{$IFDEF UNITVERSIONING}
const
  UnitVersioning: TUnitVersionInfo = (
    RCSfile: '$URL: https://jvcl.svn.sourceforge.net/svnroot/jvcl/branches/JVCL3_40_PREPARATION/run/JvControlActionsEngineCxVerticalGrid.pas $';
    Revision: '$Revision: 12461 $';
    Date: '$Date: 2009-08-14 19:21:33 +0200 (ven., 14 août 2009) $';
    LogPath: 'JVCL\run'
    );
{$ENDIF UNITVERSIONING}

implementation

uses
  {$IFDEF USE_3RDPARTY_DEVEXPRESS_CXVERTICALGRID}
  cxCustomData, cxExportVGLink,
  {$ENDIF USE_3RDPARTY_DEVEXPRESS_CXVERTICALGRID}
  Variants, SysUtils, Dialogs;

//=== { TJvDatabaseActionDevExpcxVerticalGridControlEngine } =========================

{$IFDEF USE_3RDPARTY_DEVEXPRESS_CXVERTICALGRID}

function TJvControlActioncxVerticalGridEngine.ExecuteOperation(const aOperation:
    TJvControlActionOperation; const aActionControl: TControl): Boolean;
begin
  Result := false;
  if Assigned(GetGrid(aActionControl)) then
    Case aOperation of
      caoCollapse : GetGrid(aActionControl).FullCollapse;
      caoExpand : GetGrid(aActionControl).FullExpand;
      caoExport : ExportGrid(GetGrid(aActionControl));
      caoCustomize : GetGrid(aActionControl).Customizing.Visible := Not GetGrid(aActionControl).Customizing.Visible;  
    End;
end;

procedure TJvControlActioncxVerticalGridEngine.ExportGrid(aGrid: TcxVerticalGrid);
var
  SaveDialog: TSaveDialog;
begin
  if not Assigned(aGrid) then
    Exit;
  SaveDialog := TSaveDialog.Create(Self);
  try
    SaveDialog.Name    := 'SaveDialog';
    SaveDialog.DefaultExt := 'XLS';
    SaveDialog.Filter  := 'MS-Excel-Files (*.XLS)|*.XLS|XML-Files (*.XML)|*.HTM|HTML-Files (*.HTM)|*.HTM|Text-Files (*.TXT)|*.TXT|All Files (*.*)|*.*';
    SaveDialog.Options := [ofOverwritePrompt, ofHideReadOnly, ofPathMustExist];
    if SaveDialog.Execute then
      if SaveDialog.FileName <> '' then
      begin
        if (Pos('.XLS', UpperCase(SaveDialog.FileName)) = Length(SaveDialog.FileName) - 3) then
          cxExportVGToExcel(SaveDialog.FileName, aGrid)
        else if (Pos('.XML', UpperCase(SaveDialog.FileName)) = Length(SaveDialog.FileName) - 3) then
          cxExportVGToXML(SaveDialog.FileName, aGrid)
        else if ((Pos('.HTM', UpperCase(SaveDialog.FileName)) = Length(SaveDialog.FileName) - 3) or
          (Pos('.HTML', UpperCase(SaveDialog.FileName)) = Length(SaveDialog.FileName) - 4)) then
          cxExportVGToHTML(SaveDialog.FileName, aGrid)
        else
          cxExportVGToText(SaveDialog.FileName, aGrid);
      end;
  finally
    SaveDialog.Free;
  end;
end;

function TJvControlActioncxVerticalGridEngine.GetGrid(AActionComponent: TComponent):
    TcxVerticalGrid;
begin
  if Assigned(AActionComponent) then
    if AActionComponent is TcxVerticalGrid then
      Result := TcxVerticalGrid(AActionComponent)
    else
      Result := nil
  else
    Result := nil;
end;

function TJvControlActioncxVerticalGridEngine.GetSupportedOperations:
    TJvControlActionOperations;
begin
  Result := [caoCollapse, caoExpand, caoCustomize, caoExport];
end;

function TJvControlActioncxVerticalGridEngine.SupportsComponent(aActionComponent:
    TComponent): Boolean;
begin
  Result := Assigned(GetGrid(AActionComponent));
end;

{$ENDIF USE_3RDPARTY_DEVEXPRESS_CXVERTICALGRID}

procedure InitActionEngineList;
begin
  {$IFDEF USE_3RDPARTY_DEVEXPRESS_CXVERTICALGRID}
  RegisterControlActionEngine(TJvControlActioncxVerticalGridEngine);
  {$ENDIF USE_3RDPARTY_DEVEXPRESS_CXVERTICALGRID}
end;


initialization
  {$IFDEF UNITVERSIONING}
  RegisterUnitVersion(HInstance, UnitVersioning);
  {$ENDIF UNITVERSIONING}
  InitActionEngineList;

finalization
  {$IFDEF UNITVERSIONING}
  UnregisterUnitVersion(HInstance);
  {$ENDIF UNITVERSIONING}

end.

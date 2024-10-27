// SPDX-FileCopyrightText: © 2024 Ștefan-Iulian Alecu <uneven-shiver@protonmail.com>

// SPDX-License-Identifier: GPL-3.0-or-later

unit DITE2Laz.Converter.Utils;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  DITE2Laz.Theme.Types,
  DOM,
  fgl,
  SysUtils,
  XMLRead;

type
  TLanguage =
    (lgPlainText, lgObjectPascal, lgFormDefinition, lgXML, lgHTML, lgC, lgCSS,
    lgPo, lgPike, lgPerl, lgJava, lgUNIXShell, lgPython, lgPHP,
    lgSQL, lgJavascript, lgDiffFile, lgBatchFile, lgINIFile);

  TLanguagePaths = specialize TFPGMap<TLanguage, string>;

function CreateConfigXPath(const Category: string): string; inline;
function GetGlobalElementXPath: string; inline;
function GetLanguageElementXPath(Language: TLanguage): string;

implementation

var
  LanguagePaths: TLanguagePaths;

function CreateConfigXPath(const Category: string): string; inline;
begin
  Result := Format('/CONFIG/Lazarus/ColorSchemes/%s', [Category]) + '/%s/%s';
end;

function GetGlobalElementXPath: string; inline;
begin
  Result := CreateConfigXPath('Globals');
end;

function GetLanguageElementXPath(Language: TLanguage): string;
begin
  if LanguagePaths.IndexOf(Language) = -1 then
    raise Exception.Create('Invalid language specified.');

  Result := CreateConfigXPath(LanguagePaths[Language]);
end;

initialization
  LanguagePaths := TLanguagePaths.Create;
  LanguagePaths.Add(lgPlainText, 'LangPlain_Text');
  LanguagePaths.Add(lgObjectPascal, 'LangObjectPascal');
  LanguagePaths.Add(lgFormDefinition, 'LangLazarus_Form_definition');
  LanguagePaths.Add(lgXML, 'LangXML_document');
  LanguagePaths.Add(lgHTML, 'LangHTML_document');
  LanguagePaths.Add(lgC, 'LangC__');
  LanguagePaths.Add(lgCSS, 'LangCascading_style_sheets');
  LanguagePaths.Add(lgPo, 'Langpo_language_files');
  LanguagePaths.Add(lgPike, 'LangPike');
  LanguagePaths.Add(lgPerl, 'LangPerl');
  LanguagePaths.Add(lgJava, 'LangJava');
  LanguagePaths.Add(lgUNIXShell, 'LangUNIX_Shell_Script');
  LanguagePaths.Add(lgPython, 'LangPython');
  LanguagePaths.Add(lgPHP, 'LangPHP');
  LanguagePaths.Add(lgSQL, 'LangSQL');
  LanguagePaths.Add(lgJavascript, 'LangJavascript');
  LanguagePaths.Add(lgDiffFile, 'LangDiff_File');
  LanguagePaths.Add(lgBatchFile, 'LangMS_DOS_Batch_language');
  LanguagePaths.Add(lgINIFile, 'LangINI_file');

finalization
  LanguagePaths.Free;

end.

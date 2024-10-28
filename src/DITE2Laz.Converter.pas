// SPDX-FileCopyrightText: © 2024 Ștefan-Iulian Alecu <uneven-shiver@protonmail.com>
//
// SPDX-License-Identifier: GPL-3.0-or-later

unit DITE2Laz.Converter;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  DITE2Laz.Converter.Utils,
  DITE2Laz.Theme.Types,
  DOM,
  SysUtils,
  XMLRead,
  XMLWrite,
  XPath;

type
  TBackgroundStyle = record
    Color:    string;
    Priority: integer;
  end;

  TForegroundStyle = record
    Color:    string;
    Alpha:    integer;
    Priority: integer;
  end;

  TFrameStyle = record
    Color:    string;
    Style:    string;
    Priority: integer;
    Edges:    string;
  end;

  TStyle = (fsBold, fsItalic);

  TAhaNodeAttribute = record
    Style:      TStyle;
    Background: TBackgroundStyle;
    Foreground: TForegroundStyle;
    Frame:      TFrameStyle;
    MarkupFoldLineColor: string;
  end;

function DITEThemeToLazarusTheme(const ATheme: TDITETheme;
  const ThemeName, OutputFolder: unicodestring): boolean;

implementation

procedure CreateNamesNode(Doc: TXMLDocument; var ColorSchemesNode: TDOMNode;
  const ThemeName: unicodestring);
var
  NamesNode, Item1Node: TDOMNode;
begin
  if ColorSchemesNode = nil then
    Exit;

  // <Names Count="1">
  NamesNode := Doc.CreateElement('Names');
  (NamesNode as TDOMElement).SetAttribute('Count', '1');
  ColorSchemesNode.AppendChild(NamesNode);

  //   <Item1 Value="Theme Name">
  Item1Node := Doc.CreateElement('Item1');
  (Item1Node as TDOMElement).SetAttribute('Value', ThemeName);
  NamesNode.AppendChild(Item1Node);
end;

procedure CreateGlobalsNode(Doc: TXMLDocument; var ColorSchemesNode: TDOMNode;
  const SchemeName: unicodestring; const Theme: TDITETheme);
var
  GlobalsNode, SchemeNode, ahaNode: TDOMNode;

  procedure CreateAhaNode(const Name: string);
  var
    ahaNode: TDOMNode;
  begin
    ahaNode := Doc.CreateElement(Name);

    (ahaNode as TDOMElement).SetAttribute('Version', '13');

    SchemeNode.AppendChild(ahaNode);
  end;

begin
  if ColorSchemesNode = nil then
    Exit;

  // <Globals Version="13">
  GlobalsNode := Doc.CreateElement('Globals');
  (GlobalsNode as TDOMElement).SetAttribute('Version', '13');
  ColorSchemesNode.AppendChild(GlobalsNode);

  //   <SchemeTheme_Name>
  SchemeNode := Doc.CreateElement(SchemeName);
  GlobalsNode.AppendChild(SchemeNode);

  //      <ahaBracketMatch ...>
  CreateAhaNode('ahaBracketMatch');
  ahaNode := Doc.CreateElement('ahaBracketMatch');
  (GlobalsNode as TDOMElement).SetAttribute('Version', '13');
  (GlobalsNode as TDOMElement).SetAttribute('Version', '13');
  (GlobalsNode as TDOMElement).SetAttribute('Version', '13');
  (GlobalsNode as TDOMElement).SetAttribute('Version', '13');
  SchemeNode.AppendChild(ahaNode);
end;

function DITEThemeToLazarusTheme(const ATheme: TDITETheme;
  const ThemeName, OutputFolder: unicodestring): boolean;
var
  Doc: TXMLDocument;
  RootNode, LazarusNode, ColorSchemesNode: TDOMNode;
  ValidTagName: unicodestring;
  SchemeName: unicodestring;
  SchemeFileName: unicodestring;
begin
  Result := False;
  ValidTagName := MakeValidTagName(ThemeName);

  SchemeName     := 'Scheme' + ValidTagName;
  SchemeFileName := 'Color' + ValidTagName + '.xml';

  Doc := TXMLDocument.Create;

  try
    // <CONFIG>
    RootNode := Doc.CreateElement('CONFIG');
    Doc.AppendChild(RootNode);

    //   <Lazarus>
    LazarusNode := Doc.CreateElement('Lazarus');
    RootNode.AppendChild(LazarusNode);

    //     <ColorSchemes Version="13">
    ColorSchemesNode := Doc.CreateElement('ColorSchemes');
    (ColorSchemesNode as TDOMElement).SetAttribute('Version', '13');
    LazarusNode.AppendChild(ColorSchemesNode);

    CreateNamesNode(Doc, ColorSchemesNode, ThemeName);
    CreateGlobalsNode(Doc, ColorSchemesNode, SchemeName, ATheme);

    WriteXMLFile(Doc, ansistring(SchemeFileName));
  finally
    Doc.Free;
  end;
end;

end.

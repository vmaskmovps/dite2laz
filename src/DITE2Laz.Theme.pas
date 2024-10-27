// SPDX-FileCopyrightText: © 2024 Ștefan-Iulian Alecu <uneven-shiver@protonmail.com>

// SPDX-License-Identifier: GPL-3.0-or-later

unit DITE2Laz.Theme;

{$mode objfpc}{$H+}

interface

uses
  Classes, DITE2Laz.Theme.Types, DOM, SysUtils, XMLRead;

function XMLToDITETheme(const FileName: String): TDITETheme;

implementation

function NodeText(const ANode: TDOMNode; const ATag: UnicodeString): UnicodeString;
  var
    ChildNode: TDOMNode;
  begin
    Result    := '';
    ChildNode := ANode.FindNode(ATag);
    if Assigned(ChildNode) then
      Result := ChildNode.TextContent;
  end;

  function TagToBool(const ANode: TDOMNode; const ATag: UnicodeString): Boolean;
  begin
    Result := StrToBoolDef(AnsiString(NodeText(ANode, ATag)), False);
  end;

  function GetThemeElement(const ANode: TDOMNode): TDITEThemeElement;
  var
    Element: TDITEThemeElement;
  begin
    Element.Bold      := TagToBool(ANode, 'Bold');
    Element.Italic    := TagToBool(ANode, 'Italic');
    Element.Underline := TagToBool(ANode, 'Underline');

    Element.DefaultBackground := TagToBool(ANode, 'DefaultBackground');
    Element.DefaultForeground := TagToBool(ANode, 'DefaultForeground');

    Element.ForegroundColorNew := String(NodeText(ANode, 'ForegroundColorNew'));
    Element.BackgroundColorNew := String(NodeText(ANode, 'BackgroundColorNew'));

    Result := Element;
  end;

  procedure SetThemeElement(const APropName: UnicodeString; const AElement: TDITEThemeElement;
  var Theme: TDITETheme);
  begin
    case APropName of 
    'AdditionalSearchMatchHighlight':    
      Theme.AdditionalSearchMatchHighlight := AElement;
    'Assembler':    
      Theme.&Assembler := AElement;
    'AttributeNames':    
      Theme.AttributeNames := AElement;
    'AttributeValues':    
      Theme.AttributeValues := AElement;
    'BraceHighlight':    
      Theme.BraceHighlight := AElement;
    'Character':    
      Theme.Character := AElement;
    'CodeFoldingTree':    
      Theme.CodeFoldingTree := AElement;
    'Comment':    
      Theme.Comment := AElement;
    'DiffAddition':    
      Theme.DiffAddition := AElement;
    'DiffDeletion':    
      Theme.DiffDeletion := AElement;
    'DiffMove':    
      Theme.DiffMove := AElement;
    'DisabledBreak':    
      Theme.DisabledBreak := AElement;
    'EnabledBreak':    
      Theme.EnabledBreak := AElement;
    'ErrorLine':    
      Theme.ErrorLine := AElement;
    'ExecutionPoint':    
      Theme.ExecutionPoint := AElement;
    'Float':    
      Theme.Float := AElement;
    'FoldedCode':    
      Theme.FoldedCode := AElement;
    'Hex':    
      Theme.Hex := AElement;
    'HotLink':    
      Theme.HotLink := AElement;
    'Identifier':    
      Theme.Identifier := AElement;
    'IllegalChar':    
      Theme.IllegalChar := AElement;
    'InvalidBreak':    
      Theme.InvalidBreak := AElement;
    'LineHighlight':    
      Theme.LineHighlight := AElement;
    'LineNumber':    
      Theme.LineNumber := AElement;
    'MarkedBlock':    
      Theme.MarkedBlock := AElement;
    'ModifiedLine':    
      Theme.ModifiedLine := AElement;
    'Number':    
      Theme.Number := AElement;
    'Octal':    
      Theme.Octal := AElement;
    'PlainText':    
      Theme.PlainText := AElement;
    'Preprocessor':    
      Theme.Preprocessor := AElement;
    'ReservedWord':    
      Theme.ReservedWord := AElement;
    'RightMargin':    
      Theme.RightMargin := AElement;
    'Scripts':    
      Theme.Scripts := AElement;
    'SearchMatch':    
      Theme.SearchMatch := AElement;
    'String':    
      Theme.&String := AElement;
    'Symbol':    
      Theme.Symbol := AElement;
    'SyncEditBackground':    
      Theme.SyncEditBackground := AElement;
    'SyncEditHighlight':    
      Theme.SyncEditHighlight := AElement;
    'Tags':    
      Theme.Tags := AElement;
    'Whitespace':    
      Theme.Whitespace := AElement;
  end;
end;

function XMLToDITETheme(const FileName: String): TDITETheme;
var
  Doc:      TXMLDocument;
  RootNode: TDOMNode;
  ThemeNode: TDOMNode;
  ThemeElement: TDITEThemeElement;
  I: Integer = 0;

  

begin
  Result := Default(TDITETheme);
  ReadXMLFile(Doc, FileName);
  try
    RootNode := Doc.DocumentElement;

    for I := 0 to RootNode.ChildNodes.Count - 1 do
    begin
      ThemeNode    := RootNode.ChildNodes[I];
      ThemeElement := GetThemeElement(ThemeNode);

      SetThemeElement(ThemeNode.NodeName, ThemeElement, Result);
    end;

  finally
    Doc.Free;
  end;
end;

end.
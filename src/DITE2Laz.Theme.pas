// SPDX-FileCopyrightText: © 2024 Ștefan-Iulian Alecu <uneven-shiver@protonmail.com>
//
// SPDX-License-Identifier: GPL-3.0-or-later

unit DITE2Laz.Theme;

{$mode delphi}{$H+}

interface

uses
  Classes, DITE2Laz.Theme.Types, DOM, SysUtils, XMLRead;

function XMLToDITETheme(const FileName: String): TDITETheme;

implementation

function XMLToDITETheme(const FileName: String): TDITETheme;
var
  Doc:      TXMLDocument;
  RootNode: TDOMNode;
  ThemeNode: TDOMNode;
  ThemeElement: TDITEThemeElement;

  I: Integer;

  function NodeText(const ANode: TDOMNode; const ATag: String): String;
  var
    ChildNode: TDOMNode;
  begin
    Result    := '';
    ChildNode := ANode.FindNode(ATag);
    if Assigned(ChildNode) then
    begin
      Result := ChildNode.TextContent;
    end;
  end;

  function TagToBool(const ANode: TDOMNode; const ATag: String): Boolean;
  begin
    Result := StrToBoolDef(NodeText(ANode, ATag), False);
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

    Element.ForegroundColorNew := NodeText(ANode, 'ForegroundColorNew');
    Element.BackgroundColorNew := NodeText(ANode, 'BackgroundColorNew');

    Result := Element;
  end;

begin
  Result := Default(TDITETheme);

  ReadXMLFile(Doc, FileName);
  try
    RootNode := Doc.DocumentElement;
    for I := 0 to RootNode.ChildNodes.Count - 1 do
    begin
      ThemeNode    := RootNode.ChildNodes[I];
      ThemeElement := GetThemeElement(ThemeNode);

      if ThemeNode.NodeName = 'AdditionalSearchMatchHighlight' then
      begin
        Result.AdditionalSearchMatchHighlight := ThemeElement;
      end
      else if ThemeNode.NodeName = 'Assembler' then
      begin
        Result.&Assembler := ThemeElement;
      end
      else if ThemeNode.NodeName = 'AttributeNames' then
      begin
        Result.AttributeNames := ThemeElement;
      end
      else if ThemeNode.NodeName = 'AttributeValues' then
      begin
        Result.AttributeValues := ThemeElement;
      end
      else if ThemeNode.NodeName = 'BraceHighlight' then
      begin
        Result.BraceHighlight := ThemeElement;
      end
      else if ThemeNode.NodeName = 'Character' then
      begin
        Result.Character := ThemeElement;
      end
      else if ThemeNode.NodeName = 'CodeFoldingTree' then
      begin
        Result.CodeFoldingTree := ThemeElement;
      end
      else if ThemeNode.NodeName = 'Comment' then
      begin
        Result.Comment := ThemeElement;
      end
      else if ThemeNode.NodeName = 'DiffAddition' then
      begin
        Result.DiffAddition := ThemeElement;
      end
      else if ThemeNode.NodeName = 'DiffDeletion' then
      begin
        Result.DiffDeletion := ThemeElement;
      end
      else if ThemeNode.NodeName = 'DiffMove' then
      begin
        Result.DiffMove := ThemeElement;
      end
      else if ThemeNode.NodeName = 'DisabledBreak' then
      begin
        Result.DisabledBreak := ThemeElement;
      end
      else if ThemeNode.NodeName = 'EnabledBreak' then
      begin
        Result.EnabledBreak := ThemeElement;
      end
      else if ThemeNode.NodeName = 'ErrorLine' then
      begin
        Result.ErrorLine := ThemeElement;
      end
      else if ThemeNode.NodeName = 'ExecutionPoint' then
      begin
        Result.ExecutionPoint := ThemeElement;
      end
      else if ThemeNode.NodeName = 'Float' then
      begin
        Result.Float := ThemeElement;
      end
      else if ThemeNode.NodeName = 'FoldedCode' then
      begin
        Result.FoldedCode := ThemeElement;
      end
      else if ThemeNode.NodeName = 'Hex' then
      begin
        Result.Hex := ThemeElement;
      end
      else if ThemeNode.NodeName = 'HotLink' then
      begin
        Result.HotLink := ThemeElement;
      end
      else if ThemeNode.NodeName = 'Identifier' then
      begin
        Result.Identifier := ThemeElement;
      end
      else if ThemeNode.NodeName = 'IllegalChar' then
      begin
        Result.IllegalChar := ThemeElement;
      end
      else if ThemeNode.NodeName = 'InvalidBreak' then
      begin
        Result.InvalidBreak := ThemeElement;
      end
      else if ThemeNode.NodeName = 'LineHighlight' then
      begin
        Result.LineHighlight := ThemeElement;
      end
      else if ThemeNode.NodeName = 'LineNumber' then
      begin
        Result.LineNumber := ThemeElement;
      end
      else if ThemeNode.NodeName = 'MarkedBlock' then
      begin
        Result.MarkedBlock := ThemeElement;
      end
      else if ThemeNode.NodeName = 'ModifiedLine' then
      begin
        Result.ModifiedLine := ThemeElement;
      end
      else if ThemeNode.NodeName = 'Number' then
      begin
        Result.Number := ThemeElement;
      end
      else if ThemeNode.NodeName = 'Octal' then
      begin
        Result.Octal := ThemeElement;
      end
      else if ThemeNode.NodeName = 'PlainText' then
      begin
        Result.PlainText := ThemeElement;
      end
      else if ThemeNode.NodeName = 'Preprocessor' then
      begin
        Result.Preprocessor := ThemeElement;
      end
      else if ThemeNode.NodeName = 'ReservedWord' then
      begin
        Result.ReservedWord := ThemeElement;
      end
      else if ThemeNode.NodeName = 'RightMargin' then
      begin
        Result.RightMargin := ThemeElement;
      end
      else if ThemeNode.NodeName = 'Scripts' then
      begin
        Result.Scripts := ThemeElement;
      end
      else if ThemeNode.NodeName = 'SearchMatch' then
      begin
        Result.SearchMatch := ThemeElement;
      end
      else if ThemeNode.NodeName = 'String' then
      begin
        Result.&String := ThemeElement;
      end
      else if ThemeNode.NodeName = 'Symbol' then
      begin
        Result.Symbol := ThemeElement;
      end
      else if ThemeNode.NodeName = 'SyncEditBackground' then
      begin
        Result.SyncEditBackground := ThemeElement;
      end
      else if ThemeNode.NodeName = 'SyncEditHighlight' then
      begin
        Result.SyncEditHighlight := ThemeElement;
      end
      else if ThemeNode.NodeName = 'Tags' then
      begin
        Result.Tags := ThemeElement;
      end
      else if ThemeNode.NodeName = 'Whitespace' then
      begin
        Result.Whitespace := ThemeElement;
      end;
    end;
  finally
    Doc.Free;
  end;
end;

end.

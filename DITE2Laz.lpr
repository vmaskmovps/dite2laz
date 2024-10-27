// SPDX-FileCopyrightText: © 2024 Ștefan-Iulian Alecu <uneven-shiver@protonmail.com>

// SPDX-License-Identifier: GPL-3.0-or-later

program DITE2Laz;

uses
  DITE2Laz.Converter,
  DITE2Laz.Converter.Utils,
  DITE2Laz.Theme,
  DITE2Laz.Theme.Types,
  DOM,
  SysUtils,
  XMLRead;

var
  Doc:   TXMLDocument;
  Theme: TDITETheme;
begin
  Theme := XMLToDITETheme('sample.theme.xml');
  Writeln(Theme.FoldedCode.Bold);
  Writeln(Theme.FoldedCode.Italic);
  Writeln(Theme.FoldedCode.Underline);
  Writeln(Theme.FoldedCode.DefaultBackground);
  Writeln(Theme.FoldedCode.DefaultForeground);
  Writeln(Theme.FoldedCode.BackgroundColorNew);
  Writeln(Theme.FoldedCode.ForegroundColorNew);
end.

// SPDX-FileCopyrightText: © 2024 Ștefan-Iulian Alecu <uneven-shiver@protonmail.com>

// SPDX-License-Identifier: GPL-3.0-or-later

program DITE2Laz;

uses
  DOM,
  XMLRead;

var
  Doc: TXMLDocument;
begin
  try
    ReadXMLFile(Doc, 'sample.xml');
  finally
    Doc.Free;
  end;
end.

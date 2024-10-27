// SPDX-FileCopyrightText: © 2024 Ștefan-Iulian Alecu <uneven-shiver@protonmail.com>

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
  XMLRead;

function DITEThemeToLazarusTheme(const ATheme: TDITETheme;
  const ThemeName, OutputFolder: string): boolean;

implementation

function DITEThemeToLazarusTheme(const ATheme: TDITETheme;
  const ThemeName, OutputFolder: string): boolean;
begin
  Result := True;
end;

end.

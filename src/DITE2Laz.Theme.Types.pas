// SPDX-FileCopyrightText: © 2024 Ștefan-Iulian Alecu <uneven-shiver@protonmail.com>

// SPDX-License-Identifier: GPL-3.0-or-later

unit DITE2Laz.Theme.Types;

{$mode delphi}{$H+}

interface

type
  TDITEThemeElement = record
    Bold:      boolean;
    Italic:    boolean;
    Underline: boolean;

    DefaultForeground: boolean;
    DefaultBackground: boolean;

    ForegroundColorNew: string;
    BackgroundColorNew: string;
  end;

  TDITETheme = record
    AdditionalSearchMatchHighlight: TDITEThemeElement;
    &Assembler: TDITEThemeElement;
    AttributeNames: TDITEThemeElement;
    AttributeValues: TDITEThemeElement;
    BraceHighlight: TDITEThemeElement;
    Character: TDITEThemeElement;
    CodeFoldingTree: TDITEThemeElement;
    Comment: TDITEThemeElement;
    DiffAddition: TDITEThemeElement;
    DiffDeletion: TDITEThemeElement;
    DiffMove: TDITEThemeElement;
    DisabledBreak: TDITEThemeElement;
    EnabledBreak: TDITEThemeElement;
    ErrorLine: TDITEThemeElement;
    ExecutionPoint: TDITEThemeElement;
    Float:   TDITEThemeElement;
    FoldedCode: TDITEThemeElement;
    Hex:     TDITEThemeElement;
    HotLink: TDITEThemeElement;
    Identifier: TDITEThemeElement;
    IllegalChar: TDITEThemeElement;
    InvalidBreak: TDITEThemeElement;
    LineHighlight: TDITEThemeElement;
    LineNumber: TDITEThemeElement;
    MarkedBlock: TDITEThemeElement;
    ModifiedLine: TDITEThemeElement;
    Number:  TDITEThemeElement;
    Octal:   TDITEThemeElement;
    PlainText: TDITEThemeElement;
    Preprocessor: TDITEThemeElement;
    ReservedWord: TDITEThemeElement;
    RightMargin: TDITEThemeElement;
    Scripts: TDITEThemeElement;
    SearchMatch: TDITEThemeElement;
    &String: TDITEThemeElement;
    Symbol:  TDITEThemeElement;
    SyncEditBackground: TDITEThemeElement;
    SyncEditHighlight: TDITEThemeElement;
    Tags:    TDITEThemeElement;
    Whitespace: TDITEThemeElement;
  end;

implementation

end.

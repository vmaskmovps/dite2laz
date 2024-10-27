unit DITE2Laz.Theme.Types;

{$mode delphi}{$H+}

interface

type
  TDITEThemeElement = record
    Bold:      Boolean;
    Italic:    Boolean;
    Underline: Boolean;

    DefaultForeground: Boolean;
    DefaultBackground: Boolean;

    ForegroundColorNew: String;
    BackgroundColorNew: String;
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
    Float: TDITEThemeElement;
    FoldedCode: TDITEThemeElement;
    Hex: TDITEThemeElement;
    HotLink: TDITEThemeElement;
    Identifier: TDITEThemeElement;
    IllegalChar: TDITEThemeElement;
    InvalidBreak: TDITEThemeElement;
    LineHighlight: TDITEThemeElement;
    LineNumber: TDITEThemeElement;
    MarkedBlock: TDITEThemeElement;
    ModifiedLine: TDITEThemeElement;
    Number: TDITEThemeElement;
    Octal: TDITEThemeElement;
    PlainText: TDITEThemeElement;
    Preprocessor: TDITEThemeElement;
    ReservedWord: TDITEThemeElement;
    RightMargin: TDITEThemeElement;
    Scripts: TDITEThemeElement;
    SearchMatch: TDITEThemeElement;
    &String: TDITEThemeElement;
    Symbol: TDITEThemeElement;
    SyncEditBackground: TDITEThemeElement;
    SyncEditHighlight: TDITEThemeElement;
    Tags: TDITEThemeElement;
    Whitespace: TDITEThemeElement;
  end;

implementation

end.

// SPDX-FileCopyrightText: © 2024 Ștefan-Iulian Alecu <uneven-shiver@protonmail.com>
// SPDX-License-Identifier: GPL-3.0-or-later
unit DITE2Laz.LazarusColorTheme.AhaNode;

{$mode ObjFPC}{$H+}

interface

uses
  Classes,
  SysUtils;

type
  // These enums are directly from Lazarus' source code, so I can use
  // these without having Lazarus as a dependency.

  TAdditionalHilightAttribute =
    (ahaNone, ahaTextBlock, ahaExecutionPoint,
    ahaEnabledBreakpoint, ahaDisabledBreakpoint, ahaInvalidBreakpoint,
    ahaUnknownBreakpoint, ahaErrorLine, ahaIncrementalSearch,
    ahaHighlightAll, ahaBracketMatch, ahaMouseLink,
    ahaLineNumber, ahaLineHighlight, ahaModifiedLine,
    ahaCodeFoldingTree, ahaCodeFoldingTreeCurrent, ahaHighlightWord,
    ahaFoldedCode, ahaFoldedCodeLine, ahaHiddenCodeLine,
    ahaWordGroup, ahaTemplateEditCur, ahaTemplateEditSync,
    ahaTemplateEditOther, ahaSyncroEditCur, ahaSyncroEditSync,
    ahaSyncroEditOther, ahaSyncroEditArea, ahaGutterSeparator,
    ahaGutter, ahaRightMargin, ahaSpecialVisibleChars,
    ahaTopInfoHint, ahaCaretColor, ahaOverviewGutter,
    ahaGutterCurrentLine, ahaGutterNumberCurrentLine,
    ahaIfDefBlockInactive, ahaIfDefBlockActive, ahaIfDefBlockTmpActive,
    ahaIfDefNodeInactive, ahaIfDefNodeActive, ahaIfDefNodeTmpActive,
    ahaIdentComplWindow, ahaIdentComplWindowBorder, ahaIdentComplRecent,
    ahaIdentComplWindowSelection, ahaIdentComplWindowHighlight,
    ahaIdentComplWindowEntryVar, ahaIdentComplWindowEntryType,
    ahaIdentComplWindowEntryConst,
    ahaIdentComplWindowEntryProc, ahaIdentComplWindowEntryFunc,
    ahaIdentComplWindowEntryMethAbstract, ahaIdentComplWindowEntryMethodLowVis,
    ahaIdentComplWindowEntryProp, ahaIdentComplWindowEntryIdent,
    ahaIdentComplWindowEntryLabel,
    ahaIdentComplWindowEntryEnum, ahaIdentComplWindowEntryUnit,
    ahaIdentComplWindowEntryNameSpace,
    ahaIdentComplWindowEntryText, ahaIdentComplWindowEntryTempl,
    ahaIdentComplWindowEntryKeyword,
    ahaIdentComplWindowEntryUnknown,
    ahaOutlineLevel1Color, ahaOutlineLevel2Color, ahaOutlineLevel3Color,
    ahaOutlineLevel4Color, ahaOutlineLevel5Color, ahaOutlineLevel6Color,
    ahaOutlineLevel7Color, ahaOutlineLevel8Color, ahaOutlineLevel9Color,
    ahaOutlineLevel10Color
    );

type
  TAhaNode = record
    Kind: TAdditionalHilightAttribute;
    case TAdditionalHilightAttribute of
      ahaNone, ahaTextBlock, ahaExecutionPoint, ahaEnabledBreakpoint,
      ahaDisabledBreakpoint, ahaInvalidBreakpoint, ahaUnknownBreakpoint,
      ahaErrorLine, ahaIncrementalSearch, ahaHighlightAll, ahaBracketMatch,
      ahaMouseLink, ahaLineHighlight, ahaHighlightWord, ahaFoldedCode,
      ahaFoldedCodeLine, ahaHiddenCodeLine, ahaWordGroup, ahaTemplateEditCur,
      ahaTemplateEditSync, ahaTemplateEditOther, ahaSyncroEditCur,
      ahaSyncroEditSync, ahaSyncroEditOther, ahaSyncroEditArea, ahaSpecialVisibleChars,
      ahaTopInfoHint, ahaIfDefBlockInactive, ahaIfDefBlockActive, ahaIfDefBlockTmpActive,
      ahaIfDefNodeInactive, ahaIfDefNodeActive, ahaIfDefNodeTmpActive:
      (BackColor, ForeColor, FrameColor, Alpha, Prior, FrameStyle,
        FrameEdges, Style, StyleMask: string);

      ahaLineNumber, ahaGutterNumberCurrentLine: (BackColor,
        ForeColor, FrameColor, Style: string);

      ahaModifiedLine, ahaCodeFoldingTree, ahaOverviewGutter:
      (BackColor, ForeColor, FrameColor: string);

      ahaCodeFoldingTreeCurrent, ahaRightMargin, ahaIdentComplWindowBorder,
      ahaIdentComplRecent, ahaIdentComplWindowHighlight, ahaIdentComplWindowEntryVar,
      ahaIdentComplWindowEntryType, ahaIdentComplWindowEntryConst,
      ahaIdentComplWindowEntryProc,
      ahaIdentComplWindowEntryFunc, ahaIdentComplWindowEntryMethAbstract,
      ahaIdentComplWindowEntryMethodLowVis, ahaIdentComplWindowEntryProp,
      ahaIdentComplWindowEntryIdent, ahaIdentComplWindowEntryLabel,
      ahaIdentComplWindowEntryUnit,
      ahaIdentComplWindowEntryEnum, ahaIdentComplWindowEntryNameSpace,
      ahaIdentComplWindowEntryText, ahaIdentComplWindowEntryTempl,
      ahaIdentComplWindowEntryKeyword,
      ahaIdentComplWindowEntryUnknown: (ForeColor: string);

      ahaCaretColor, ahaIdentComplWindow, ahaIdentComplWindowSelection:
      (BackColor, ForeColor: string);

      ahaGutterSeparator: (BackColor, ForeColor: string);

      ahaGutter, ahaGutterCurrentLine: (BackColor: string);

      ahaFoldLevel1Color, ahaFoldLevel2Color, ahaFoldLevel3Color,
      ahaFoldLevel4Color, ahaFoldLevel5Color, ahaFoldLevel6Color,
      ahaFoldLevel7Color, ahaFoldLevel8Color, ahaFoldLevel9Color,
      ahaFoldLevel10Color: (BackColor, ForeColor, FrameColor,
        Alpha, Prior, FrameStyle,
        FrameEdges, Style, StyleMask, MarkupFoldColor: string);
  end;

implementation

end.

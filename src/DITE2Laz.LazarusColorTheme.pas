// SPDX-FileCopyrightText: © 2024 Ștefan-Iulian Alecu <uneven-shiver@protonmail.com>
//
// SPDX-License-Identifier: GPL-3.0-or-later

unit DITE2Laz.LazarusColorTheme;

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

  TAhaGroupName = (
    agnDefault, agnLanguage, agnText, agnLine, agnGutter, agnTemplateMode,
    agnSyncronMode, agnIfDef, agnIdentComplWindow, agnOutlineColors
    );

  TColorSchemeAttributeFeature  = (hafBackColor, hafForeColor,
    hafFrameColor, hafAlpha, hafPrior, hafStyle, hafStyleMask,
    hafFrameStyle, hafStyleMask, hafMarkupFoldColor,
    hafCustomWords);
  TColorSchemeAttributeFeatures = set of TColorSchemeAttributeFeature;

const
  ahaSupportedFeatures: array[TAdditionalHilightAttribute] of
    TColorSchemeAttributeFeatures =
    (
    { ahaNone }
    [hafBackColor, hafForeColor, hafFrameColor, hafAlpha, hafPrior,
    hafFrameStyle, hafFrameEdges, hafStyle, hafStyleMask],

    { ahaTextBlock }
    [hafBackColor, hafForeColor, hafFrameColor, hafAlpha, hafPrior,
    hafFrameStyle, hafFrameEdges, hafStyle, hafStyleMask],

    { ahaExecutionPoint }
    [hafBackColor, hafForeColor, hafFrameColor, hafAlpha, hafPrior,
    hafFrameStyle, hafFrameEdges, hafStyle, hafStyleMask],

    { ahaEnabledBreakpoint }
    [hafBackColor, hafForeColor, hafFrameColor, hafAlpha, hafPrior,
    hafFrameStyle, hafFrameEdges, hafStyle, hafStyleMask],

    { ahaDisabledBreakpoint }
    [hafBackColor, hafForeColor, hafFrameColor, hafAlpha, hafPrior,
    hafFrameStyle, hafFrameEdges, hafStyle, hafStyleMask],

    { ahaInvalidBreakpoint }
    [hafBackColor, hafForeColor, hafFrameColor, hafAlpha, hafPrior,
    hafFrameStyle, hafFrameEdges, hafStyle, hafStyleMask],

    { ahaUnknownBreakpoint }
    [hafBackColor, hafForeColor, hafFrameColor, hafAlpha, hafPrior,
    hafFrameStyle, hafFrameEdges, hafStyle, hafStyleMask],

    { ahaErrorLine }
    [hafBackColor, hafForeColor, hafFrameColor, hafAlpha, hafPrior,
    hafFrameStyle, hafFrameEdges, hafStyle, hafStyleMask],

    { ahaIncrementalSearch }
    [hafBackColor, hafForeColor, hafFrameColor, hafAlpha, hafPrior,
    hafFrameStyle, hafFrameEdges, hafStyle, hafStyleMask],

    { ahaHighlightAll }
    [hafBackColor, hafForeColor, hafFrameColor, hafAlpha, hafPrior,
    hafFrameStyle, hafFrameEdges, hafStyle, hafStyleMask],

    { ahaBracketMatch }
    [hafBackColor, hafForeColor, hafFrameColor, hafAlpha, hafPrior,
    hafFrameStyle, hafFrameEdges, hafStyle, hafStyleMask],

    { ahaMouseLink }
    [hafBackColor, hafForeColor, hafFrameColor, hafAlpha, hafPrior,
    hafFrameStyle, hafFrameEdges, hafStyle, hafStyleMask],

    { ahaLineNumber }
    [hafBackColor, hafForeColor, hafFrameColor, hafStyle],

    { ahaLineHighlight }
    [hafBackColor, hafForeColor, hafFrameColor, hafAlpha, hafPrior,
    hafFrameStyle, hafFrameEdges, hafStyle, hafStyleMask],

    { ahaModifiedLine }
    [hafBackColor, hafForeColor, hafFrameColor],

    { ahaCodeFoldingTree }
    [hafBackColor, hafForeColor, hafFrameColor],

    { ahaCodeFoldingTreeCurrent }
    [hafForeColor, hafFrameColor],

    { ahaHighlightWord }
    [hafBackColor, hafForeColor, hafFrameColor, hafAlpha, hafPrior,
    hafFrameStyle, hafFrameEdges, hafStyle, hafStyleMask],

    { ahaFoldedCode }
    [hafBackColor, hafForeColor, hafFrameColor, hafAlpha, hafPrior,
    hafFrameStyle, hafFrameEdges, hafStyle, hafStyleMask],

    { ahaFoldedCodeLine }
    [hafBackColor, hafForeColor, hafFrameColor, hafAlpha, hafPrior,
    hafFrameStyle, hafFrameEdges, hafStyle, hafStyleMask],

    { ahaHiddenCodeLine }
    [hafBackColor, hafForeColor, hafFrameColor, hafAlpha, hafPrior,
    hafFrameStyle, hafFrameEdges, hafStyle, hafStyleMask],

    { ahaWordGroup }
    [hafBackColor, hafForeColor, hafFrameColor, hafAlpha, hafPrior,
    hafFrameStyle, hafFrameEdges, hafStyle, hafStyleMask],

    { ahaTemplateEditCur }
    [hafBackColor, hafForeColor, hafFrameColor, hafAlpha, hafPrior,
    hafFrameStyle, hafFrameEdges, hafStyle, hafStyleMask],

    { ahaTemplateEditSync }
    [hafBackColor, hafForeColor, hafFrameColor, hafAlpha, hafPrior,
    hafFrameStyle, hafFrameEdges, hafStyle, hafStyleMask],

    { ahaTemplateEditOther }
    [hafBackColor, hafForeColor, hafFrameColor, hafAlpha, hafPrior,
    hafFrameStyle, hafFrameEdges, hafStyle, hafStyleMask],

    { ahaSyncroEditCur }
    [hafBackColor, hafForeColor, hafFrameColor, hafAlpha, hafPrior,
    hafFrameStyle, hafFrameEdges, hafStyle, hafStyleMask],

    { ahaSyncroEditSync }
    [hafBackColor, hafForeColor, hafFrameColor, hafAlpha, hafPrior,
    hafFrameStyle, hafFrameEdges, hafStyle, hafStyleMask],

    { ahaSyncroEditOther }
    [hafBackColor, hafForeColor, hafFrameColor, hafAlpha, hafPrior,
    hafFrameStyle, hafFrameEdges, hafStyle, hafStyleMask],

    { ahaSyncroEditArea }
    [hafBackColor, hafForeColor, hafFrameColor, hafAlpha, hafPrior,
    hafFrameStyle, hafFrameEdges, hafStyle, hafStyleMask],

    { ahaGutterSeparator }
    [hafBackColor, hafForeColor],

    { ahaGutter }
    [hafBackColor],

    { ahaRightMargin}
    [hafForeColor],

    { ahaSpecialVisibleChars }
    [hafBackColor, hafForeColor, hafFrameColor, hafAlpha, hafPrior,
    hafFrameStyle, hafFrameEdges, hafStyle, hafStyleMask],

    { ahaTopInfoHint }
    [hafBackColor, hafForeColor, hafFrameColor, hafAlpha, hafPrior,
    hafFrameStyle, hafFrameEdges, hafStyle, hafStyleMask],

    { ahaCaretColor }
    [hafBackColor, hafForeColor],

    { ahaOverviewGutter }
    [hafBackColor, hafForeColor, hafFrameColor],

    { ahaGutterCurrentLine }
    [hafBackColor],

    { ahaGutterNumberCurrentLine }
    [hafBackColor, hafForeColor, hafFrameColor, hafStyle],

    { ahaIfDefBlockInactive }
    [hafBackColor, hafForeColor, hafFrameColor, hafAlpha, hafPrior,
    hafFrameStyle, hafFrameEdges, hafStyle, hafStyleMask],

    { ahaIfDefBlockActive }
    [hafBackColor, hafForeColor, hafFrameColor, hafAlpha, hafPrior,
    hafFrameStyle, hafFrameEdges, hafStyle, hafStyleMask],

    { ahaIfDefBlockTmpActive }
    [hafBackColor, hafForeColor, hafFrameColor, hafAlpha, hafPrior,
    hafFrameStyle, hafFrameEdges, hafStyle, hafStyleMask],

    { ahaIfDefNodeInactive }
    [hafBackColor, hafForeColor, hafFrameColor, hafAlpha, hafPrior,
    hafFrameStyle, hafFrameEdges, hafStyle, hafStyleMask],

    { ahaIfDefNodeActive }
    [hafBackColor, hafForeColor, hafFrameColor, hafAlpha, hafPrior,
    hafFrameStyle, hafFrameEdges, hafStyle, hafStyleMask],

    { ahaIfDefNodeTmpActive }
    [hafBackColor, hafForeColor, hafFrameColor, hafAlpha, hafPrior,
    hafFrameStyle, hafFrameEdges, hafStyle, hafStyleMask],

    { ahaIdentComplWindow }
    [hafBackColor, hafForeColor],

    { ahaIdentComplWindowBorder }
    [hafForeColor],

    { ahaIdentComplRecent}
    [hafForeColor],

    { ahaIdentComplWindowSelection }
    [hafBackColor, hafForeColor],

    { ahaIdentComplWindowHighlight }
    [hafForeColor],

    { ahaIdentComplWindowEntryVar}
    [hafForeColor],

    { ahaIdentComplWindowEntryType}
    [hafForeColor],

    { ahaIdentComplWindowEntryConst}
    [hafForeColor],

    { ahaIdentComplWindowEntryProc}
    [hafForeColor],

    { ahaIdentComplWindowEntryFunc}
    [hafForeColor],

    { ahaIdentComplWindowEntryMethAbstract}
    [hafForeColor],

    { ahaIdentComplWindowEntryMethodLowVis}
    [hafForeColor],

    { ahaIdentComplWindowEntryProp}
    [hafForeColor],

    { ahaIdentComplWindowEntryIdent}
    [hafForeColor],

    { ahaIdentComplWindowEntryLabel}
    [hafForeColor],

    { ahaIdentComplWindowEntryUnit}
    [hafForeColor],

    { ahaIdentComplWindowEntryEnum}
    [hafForeColor],

    { ahaIdentComplWindowEntryNameSpace}
    [hafForeColor],

    { ahaIdentComplWindowEntryText}
    [hafForeColor],

    { ahaIdentComplWindowEntryTempl}
    [hafForeColor],

    { ahaIdentComplWindowEntryKeyword}
    [hafForeColor],

    { ahaIdentComplWindowEntryUnknown}
    [hafForeColor],

    { ahaFoldLevel1Color }
    [hafBackColor, hafForeColor, hafFrameColor, hafAlpha, hafPrior,
    hafFrameStyle, hafFrameEdges, hafStyle, hafStyleMask, hafMarkupFoldColor],

    { ahaFoldLevel2Color }
    [hafBackColor, hafForeColor, hafFrameColor, hafAlpha, hafPrior,
    hafFrameStyle, hafFrameEdges, hafStyle, hafStyleMask, hafMarkupFoldColor],

    { ahaFoldLevel3Color }
    [hafBackColor, hafForeColor, hafFrameColor, hafAlpha, hafPrior,
    hafFrameStyle, hafFrameEdges, hafStyle, hafStyleMask, hafMarkupFoldColor],

    { ahaFoldLevel4Color }
    [hafBackColor, hafForeColor, hafFrameColor, hafAlpha, hafPrior,
    hafFrameStyle, hafFrameEdges, hafStyle, hafStyleMask, hafMarkupFoldColor],

    { ahaFoldLevel5Color }
    [hafBackColor, hafForeColor, hafFrameColor, hafAlpha, hafPrior,
    hafFrameStyle, hafFrameEdges, hafStyle, hafStyleMask, hafMarkupFoldColor],

    { ahaFoldLevel6Color }
    [hafBackColor, hafForeColor, hafFrameColor, hafAlpha, hafPrior,
    hafFrameStyle, hafFrameEdges, hafStyle, hafStyleMask, hafMarkupFoldColor],

    { ahaFoldLevel7Color }
    [hafBackColor, hafForeColor, hafFrameColor, hafAlpha, hafPrior,
    hafFrameStyle, hafFrameEdges, hafStyle, hafStyleMask, hafMarkupFoldColor],

    { ahaFoldLevel8Color }
    [hafBackColor, hafForeColor, hafFrameColor, hafAlpha, hafPrior,
    hafFrameStyle, hafFrameEdges, hafStyle, hafStyleMask, hafMarkupFoldColor],

    { ahaFoldLevel9Color }
    [hafBackColor, hafForeColor, hafFrameColor, hafAlpha, hafPrior,
    hafFrameStyle, hafFrameEdges, hafStyle, hafStyleMask, hafMarkupFoldColor],

    { ahaFoldLevel10Color }
    [hafBackColor, hafForeColor, hafFrameColor, hafAlpha, hafPrior,
    hafFrameStyle, hafFrameEdges, hafStyle, hafStyleMask, hafMarkupFoldColor]);


implementation

end.

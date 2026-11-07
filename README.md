# Denotative Object Parser Fix

Entering `:=` as a method name in DenotativeObject Browser opens the debugger
with `DenotativeObjectParser>>selector` instead of displaying a syntax error.

During selector-only parsing, the parser uses itself as its encoder.
`Parser>>sourceDelta` incorrectly asks that object for a selector before the
syntax error can reach the editor.

The fix returns a zero source offset when the encoder is missing or is the
parser itself. Normal DoIt and DoItIn selection offsets remain unchanged.
The editor then displays `:Message pattern expected ->=` without opening the
debugger or installing a method.

## Installation

File in `Parser-SourceDelta-SyntaxError-Fix.cs.st` inside CuisUniversity.
Save the image if you want to keep the fix between sessions.

Validated in a disposable CuisUniversity 7.9-8309 image: **7 regression tests passed**.
The patch changes the shared Parser class; it does not require VisualFileDialogs.

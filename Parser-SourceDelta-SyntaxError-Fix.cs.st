'From Cuis7.9 [latest update: #8309] on 7 November 2026 at 12:00:00 pm'!

!Parser methodsFor: 'error correction' stamp: 'SyntaxFix 7/Nov/2026 12:00:00'!
sourceDelta
 "Selector-only parsing uses the parser itself as encoder; it has no selector getter."
 (encoder isNil or: [encoder == self]) ifTrue: [ ^ 0 ].
 (encoder selector = Scanner doItSelector or: [encoder selector = Scanner doItInSelector]) ifTrue: [
 requestor notNil ifTrue: [
 ^ requestor selectionInterval ifEmpty: [0] ifNotEmpty: [:selection | selection first - 1]]].
 ^ 0
! !

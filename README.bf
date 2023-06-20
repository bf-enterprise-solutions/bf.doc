[BF.DOC---EFFECTIVE BRAINFUCK DOCUMENTATION FORMAT

 bf.doc is an outcome of a long history of Brainfuck coding, with
 incomplete documentation formats and comment conventions. The goals
 that bf.doc sets for itself is:
 - Being embeddable into any Brainfuck code with little to no effort.
 - Being readable yet concise.
 - Being intuitive enough to be easily adopted and reproduced.

 The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL
 NOT", "SHOULD", "SHOULD NOT", "RECOMMENDED",  "MAY", and
 "OPTIONAL" in this document are to be interpreted as described in
 RFC 2119 (https://datatracker.ietf.org/doc/html/rfc2119).

 [1 HISTORY OF BRAINFUCK DOCUMENTATION FORMATS

  [1.1 DOCUMENTATION FILES

   Brainfuck programmers often neglect creating separate documentation
   files, using inline commentaries and comment loops instead. Daniel
   B. Christofani has gone as far as to write complex Brainfuck files
   in a literate programming style, with code and documentation for it
   interleaved together. This style puts too much restrictions on the
   prose, removing all the dots and commas.]

  [1.2 COMMENTS

   Brainfuck code comments are the first (and, possibly the main) type
   of documentation that Brainfuck codebases had. Many comment
   syntaxes were conjured in the absence of a standardized one:

   [ comment loop ]
   ======Urban Muller's syntax======
   ********** Clive Gifford's syntax **********
   // C-like syntax
   /* C89-like syntax */
   ; Lisp/asm-like syntax
   Absence of syntax altogether
   * Brian Raiter's syntax
   # sh-like syntax

   Most of those, with the notable exception of comment loop, were
   qute restrictive in what type of characters can be used, with
   Brainfuck command characters (+-<>,.[]) and debug characters (!#)
   being impossible to use.

   Because of comment loops being almost unrestricted in their syntax,
   they gained a certain use, especially as a header/footer comments
   documenting the general program structure, behavior, and
   copyright.]

  [1.3 MEMORY LAYOUTS

   Because there appeared a way to describe program structure and
   memory use in program comments, there appeared ways to represent
   memory layouts in those, with varying levels of verboseness and
   expressiveness (see https://github.com/rdebath/Brainfuck for most
   of these examples):

   = = = = = = = = = = = =
   u r b a n   m u l l e r
   = = = = = = = = = = = =
   |i|n|t|u|i|t|i|v|e|
   ... D a n 'i' e l  ... B ... 'C' h r '1' s t 0 f 'a' n i ...
   ___________________________________________________
   |m |a |k |s |i |m |  |K |o |r |z |h |/ |d |b|f |i |
   [r,e,s,0,0,0,1]
   === J a m e s result=Stanley ===
   {u n/k*n o%w n w/i t*h o/p/e r a*t i%o*n s}
   cell #1=Justice, cell #2=Suh

   Out of those, most are only usable inside comment loops, with the
   notable exception of res0001 syntax being a comment loop in
   itself. Syntax of Daniel B Christofani is inspiring in how it
   separates cell integer values (0), char values ('a'), and sequences
   of cells (...).]

  [1.4 CHARACTER ENCODINGS

   Only two significant character encodings emerged:

   Spelled out characters: 3 plus 5 minus 8
   Parenthesised spelled out characters: 3 (plus) 5 (minus) 8 (dot)]

  [1.5 MEMORY POINTERS

   Two concise pointer representations appeared:
   'cell
   ^cell

   Both are good enough, but using apostrophes interferes with
   character representation.]]

 [2 BF.DOC

  bf.doc, inspired by the long history of Brainfuck documentation
  syntaxes, synthesizes the most reasonable of the syntaxes for code
  comments and memory layouts.

  [2.1 DOCUMENTATION FILES

   bf.doc-conformant documentation files MUST be written a one big
   nested comment loop, with the (all caps) title of the file
   following the opening bracket, and (all caps) (sub)section headings
   following their respective opening brackets with section numbers
   prepended to them. Closing brackets SHOULD follow the last word of
   the (sub)section, and, if the (sub)section is the last in the
   document/section/subsection, then closing brackets of those SHOULD
   compound together. A small example:

   [bf.doc:
    [TITLE
     ..
     [1 SECTION ONE
      ...
      [1.1 SUBSECTION ONE-ONE
       ...]
      [1.2 SUBSECTION ONE-TWO
       ...]]
     [2 SECTION TWO
      ...]]]

   Note that this document is bf.doc conformant too, so you can use it
   as an example.]

  [2.2 COMMENT SYNTAX & ENCODING

   Comments conforming to bf.doc are to follow these rules:
   - All comments MUST be lowercase ASCII text.
   - File-level comment MUST belong to a comment loop, conventional
   for other BF codebases.
   - Block-level comments SHOULD precede the block.
   -- OPTIONALLY, end those with a colon
   -- Loop header comments SHOULD follow the opening bracket.
   --- Closing bracket SHOULD have the exact same comment, but with
   "ends" appended to it, as in "[ main loop" -> "] main loop
   ends".
   - Line-level comments MUST directly follow the code.
   - Comments (be it loop headers, block comments, or line comments)
   SHOULD start with a space, separating them from the commands.
   - Comments SHOULD always end with a newline. No comment-code
   mixing.

   Comments MUST use spelled out encoding without parentheses. The
   list of characters to encode is:
   - '+'   -> plus
   - '-'   -> minus
   - ','   -> comma
   - '.'   -> dot, period
   - '<'   -> less than, lt
   - '>'   -> greater than, gt
   - '[/]' -> opening bracket/closing bracket
   - '#'   -> hash
   - '!'   -> bang, exclamation mark

   For example:

   [bf:
    [-] empty the character (taken from https://whatever minus website dot com)]]

  [2.3 CODE/VERBATIM BLOCKS

   All code/verbatim blocks MUST be wrapped into a comment loop of
   their own, with the language/type of code as the loop header. For
   example:

   [bf:
    +[>+]]

   Such a convention ensures that all the elements of the code block
   are self-contained and clear about which language they are written
   in.]

  [2.4 MEMORY LAYOUTS

   Given the complexity of memory layouts that should be represented,
   bf.doc adopts an exhaustive memory representation syntax that MUST
   be followed in program/library documentation:
   [0]     : a cell with a numeric value equal to the number
   ['a']   : a cell with a value equal to the char
   [a]     : a cell with a variable in it
   [...]   : an arbitrary sequence of cells with whatever (unimportant) values
   [x...]  : a variable holding a sequence of null-terminated cells (a string)
   [^d]    : a cell with the pointer on it
   [^x...] : a sequence of cells (string) with the pointer in the beginning
   [x^...] : a sequence of cells (string) with the pointer in the end

   In the cases where it's obvious that cell values are characters,
   it's possible to omit the single quotes, as in
   [h][e][l][l][o] == ['h']['e']['l']['l']['o']

   This syntax is quite similar to Daniel B Cristofani one, but wraps
   all cells into square brackets. Because of this, memory layout
   schemes can appear inline in the code as part of or instead of
   comment loops.]]]

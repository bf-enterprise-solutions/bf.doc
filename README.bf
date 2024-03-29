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
   prose, in particular by removing all the dots, hyphens, and commas
   critical to one's understanding of written text.]

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
   notable exception of res0001 syntax being a comment loop
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
   character representation seen in Daniel B Christofani's code.]]

 [2 BF.DOC

  bf.doc, inspired by the long history of Brainfuck documentation
  syntaxes, synthesizes the most reasonable of the syntaxes for code
  comments and memory layouts.

  [2.1 DOCUMENTATION FILES

   bf.doc-conformant documentation files MUST be written a one big
   nested comment loop, with the (all caps) title of the file
   following the opening bracket, and (all caps) (sub)section headings
   following their respective opening brackets with section numbers
   prepended to them. Section numbers are 1-indexed and there is no
   whitespace between the section opening bracket and section
   number. Closing brackets SHOULD follow the last word of the
   (sub)section, and, if the (sub)section is the last in the
   document/section/subsection, then closing brackets of those SHOULD
   compound together. A small example:

   [bf.doc:
    [TITLE
     ..
     [1 SECTION ONE
      ...
      [1.1 SUBSECTION ONE POINT ONE
       ...]
      [1.2 SUBSECTION ONE POINT TWO
       ...]]
     [2 SECTION TWO
      ...]]]

   Note that this document is bf.doc conformant too, so you can use it
   as an example.

   [2.1.1 ENUMERATIONS AND NESTED LISTS IN DOCUMENTATION FILES

    It's often the case that one needs to enumerate certain values or
    list certain points when documenting the software. In such cases,
    the most intuitive hyphen-space unordered list (or number-indexed
    ordered list) syntax is to be used:

    - This is the first-level item. Hyphen+space starting marker.
    - This is another first-level item, but spilling into next line:
    Notice next line indented the same level as the non-list text.
    -- Second-level item: two hyphens.
    -- Second-level item long enough to spill over to the next line:
    Notice the zero indentation again.
    --- Third-level.
    ---- Fourth-level.
    - Et cetera.

    [2.1.1.1 ORDERED/NUMBERED LISTS

     Unordered lists are only useful for small drafts and chaotic
     notes (which is not to say these are useless, but...) Ordered
     lists are more linkable and structured. These lists allow one to
     refer to a certain point with a clear numeric label, which,
     augmented by the section number, provides a robust way of linking
     to list elements. So the syntax of the ordered lists in bf.doc is:
     .1 Ordered lists start from 1.
     .2 They should normally have the dot before the number.
     3 Hovever, this dot can be dropped for readability.
     2.1.1.1.4 This dot is an abbreviation for the section-qualified
     item number.
     .5 Notice the zero indentation above---same as for unordered lists.
     .6 Having the number, one can expand it to the full
     section-qualified reference, like 2.1.1.1.6, and use it to refer
     to the list item from outside the document.

     .7 Ordered lists can be nested, much like unordered lists---the
     child item number is just get an index based on the parent item
     index:
     .7.1 This nested item has a parent item index suffixed by a
     nested item index (1-indexed).
     7.2 Parent elements' leading dot can be omitted, but other
     elements beyond it MUST NOT be omitted.

     Having the ordered lists spelled out, one can enjoy much more
     coherent documentation with more normative reference links to
     point others to.

     For the documentation writer/reader/referencer convenience,
     unordered list can be implicitly ordered for greater linkability:

     - This unordered list is numbered as .8 (due to previous list
       ending in .7).
     - This one is .9.
     -- This is .9.1 (nested ordered 1-indexed list)]

    See the example of the real nested lists in the next section.]]

  [2.2 COMMENT SYNTAX & ENCODING

   Comments conforming to bf.doc are to follow these rules:
   - All comments (and all the Brainfuck file text at that) MUST be
   lowercase 7-bit ASCII text.
   -- In case one needs non-ASCII text in the file, a proper ASCII
   encoding should be used, like ArmSCII for Armenian or Romaji for
   Japanese.
   - File-level comment MUST belong to a comment loop, conventional
   for other BF codebases.
   - Block-level comments SHOULD precede the block.
   -- OPTIONALLY, end those with a colon to indicate that what follows
   is a block (akin to Python block syntax.)
   -- Loop header comments SHOULD follow the opening bracket.
   --- Closing bracket SHOULD have the exact same comment, but with
   "ends" appended to it, as in
   [bf:
    [ main loop
     ->
    ] main loop ends]
   - Line-level comments MUST directly follow the code.
   - Line-level comments (be it loop headers, block comments, or line comments)
   SHOULD start with a space, separating them from the commands.
   - Comments SHOULD always end with a newline. Comment and code
   SHOULD NOT be mixed unless direly needed.

   Comments documenting lines/blocks with cell initialization or
   modification SHOULD list the value in that cell as either of:
   - A numeric value in parentheses.
   -- As decimal number.
   -- Or as hexadecimal number (that MUST be prefixed with an
   unambiguous prefix like "0x", "x", "h", or or hash sign).
   -- Or any other base given (MUST have an unambiguous base
   indication).
   - A display char corresponding to it, in single quotes.
   -- For control characters, the display char is OPTIONAL.
   -- For non-graphic characters, an existing C-like escape sequence
   like '\n' MAY be used.
   - An unambiguous spelled out name.
   - For characters that might be interpreted as commands, an encoding
   below SHOULD be used.

   Comments MUST use spelled out encoding without parentheses and with
   spaces between the encoded character and surrounding text. The list
   of characters to encode is:
   - '+'     -> plus
   - '-'     -> minus
   - ','     -> comma
   - '.'     -> dot, period
   - '<'     -> less than, lt
   - '>'     -> greater than, gt
   - '['/']' -> opening bracket/closing bracket
   - '#'     -> hash
   - '!'     -> bang, exclamation mark

   For example:

   [bf:
    [-] empty the cell (taken from https://whatever minus website dot com)]]

  [2.3 CODE/VERBATIM BLOCKS

   All code/verbatim blocks MUST be wrapped into a comment loop of
   their own, with the language/type of code as the loop header, with
   no space between the comment loop opening bracket and the
   language/type marker. For example:

   [bf:
    +[>+]]

   Such a convention ensures that all the elements of the code block
   are self-contained and clear about which language/format they are
   written in.]

  [2.4 MEMORY LAYOUTS

   Given the complexity of memory layouts that should be represented,
   bf.doc adopts an exhaustive memory representation syntax that MUST
   be followed in program/library documentation:
   - [0]     : a cell with a numeric value equal to the number.
   - ['a']   : a cell with a value equal to the char.
   - [a]     : a cell with a variable in it.
   - [...]   : an arbitrary sequence of cells with whatever (unimportant) values.
   - [x...]  : a variable holding a sequence of null-terminated cells (a string).
   - [^d]    : a cell with the pointer on it.
   - [^x...] : a sequence of cells (string) with the pointer in the beginning.
   - [x^...] : a sequence of cells (string) with the pointer in the end.
   - [x...^] : ditto.

   In the cases where it's obvious that cell values are characters,
   it's possible to omit the single quotes, as in
   [h][e][l][l][o] == ['h']['e']['l']['l']['o']

   In the cases where it's obvious that a bracketed sequence is a
   sequence of characters, one can list all the characters in a single
   set of brackets without single quotes or only using single/double
   quotes around the sequence contents:
   [hello]
   == ["hello"]
   == ['hello']
   == [h][e][l][l][o]
   == ['h']['e']['l']['l']['o']

   This syntax is quite similar to Daniel B Cristofani one, but wraps
   all cells into square brackets. Because of this, memory layout
   schemes can appear inline in the code as part of or instead of
   comment loops.]]]

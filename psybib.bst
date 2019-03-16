% BibTeX non-standard `psychbib' bibliography style (18-October-90 version)
% Adapted from the `alpha' style, version 0.99a; for BibTeX version 0.99a.
% And further adapted from the `apalike' style, 24-Jan-88 version.
% Copyright (C) 1988, all rights reserved.
% Copying of this file is allowed, provided that if you make any changes at all
% you name it something other than `apalike.bst'.
% This restriction helps ensure that all copies are identical.
% Differences between this style and `alpha' are generally heralded by a `%'.
% The file btxbst.doc has the documentation for alpha.bst.
%
% This style should be used with the `psychbib' LaTeX style (psychbib.sty).
% \cite's come out like "1986" or "1977b" in the text, so only one citation
% argument should be given per \cite command.  (This will be enforced
% by an error handler in a later version.)  No labels are in the bibliography.
% Author names appear as last name, comma,
% initials.  A `year' field is required for every entry, and so is either
% an author (or in some cases, an editor) field or a key field.
%
% Editorial note:
% Many journals require a style like `apalike', but I strongly, strongly,
% strongly recommend that you not use it if you have a choice---use something
% like `plain' instead.  Mary-Claire van Leunen (A Handbook for Scholars,
% Knopf, 1979) argues convincingly that a style like `plain' encourages better
% writing than one like `apalike'.  Furthermore the strongest arguments for
% using an author-date style like `apalike'---that it's "the most practical"
% (The Chicago Manual of Style, University of Chicago Press, thirteenth
% edition, 1982, pages 400--401)---fall flat on their face with the new
% computer-typesetting technology.  For instance page 401 anachronistically
% states "The chief disadvantage of [a style like `plain'] is that additions
% or deletions cannot be made after the manuscript is typed without changing
% numbers in both text references and list."  LaTeX sidesteps the disadvantage.
%
% History:
%   15-sep-86	(SK,OP)	Original version, by Susan King and Oren Patashnik.
%   10-nov-86	(OP)	Truncated the sort.key$ string to the correct length
%			in bib.sort.order to eliminate error message.
%   24-jan-88	(OP)	Updated for BibTeX version 0.99a, from alpha.bst 0.99a;
%			apalike now sorts by author, then year, then title;
%			THIS `apalike' VERSION DOES NOT WORK WITH BIBTEX 0.98i.
%   26-aug-89   (SDM)	Got rid of the "pages" tag in the output;
%			volume numbers are in italics, as APA has decreed; 
%			articles with volume and number items now work ok;
%			bibitem's label field is now just the (extended) year;
%			the word "and" in author and editor lists is always
%			abbreviated with the ampersand (\&)
%   27-aug-89   (SDM)   Editor names presented last name last.  Page and
% 			volume numbers for books handled correctly.
%   28-aug-89   (SDM)   Fixed "city: publisher" format for books.
%   29-aug-89   (SDM)   Put period after (Ed.) when appropriate.  Chapter
%			fields are now ignored, with a warning printed.
%   5-oct-89    (SDM)   Many more changes.  Only the following formats are
%			supported (and the optional/required fields may
%			be different than those listed in the LaTeX book):
%			article, book, inbook, booklet, techreport,
%			inproceedings, incollection; crossref stuff probably
%			doesn't work
%   oct-90	(SDM)	added C preprocessor stuff to allow multiple versions
%			to be extracted from this template; also fixed some
%			sorting bugs
%   feb-91	(SDM)	articles by "Smith" now precede those by "Smith, & 
%			Jones"; if 2 names appear in the author position, they
%			are separated by ", &", as per APA requirements;
%			multipart last names are sorted as if no space 
%			separates the parts (even though such space is included
%			in the visible output)-- e.g., as required, "DeBase" is
%			sorted before "De Vries"; by default, "von" "de" etc.
%			is not treated as part of the multipart last name, but
%			as a kind of middle name-- e.g., as "H. L. F. von 
%			Helmholtz" will sort and appear under "Helmholtz, H. L.
%			F. von"; 
%			known bug: when a "von" name appears last in an author
%			list, it incorrectly is followed by a period-- e.g., 
%			"Helmholtz, H. L.~F. von. (1872)...."; workaround: 
%			edit the .bbl file by hand to remove this dot


ENTRY
  { abstract		% used in this style only
    address
    annote		% used in this style only
    author
    booktitle
    chapter
    edition
    editor
    edtitle
    firstyear
    howpublished
    institution
    journal
    key
    libnote	% only used in this style, for library call numbers and notes
    month		
    note
    number
    organization
    pages
    publisher
    school
    series
    title
    type
    volume
    year
  }
  {}
  { label extra.label sort.label cite.year }

INTEGERS { output.state before.all mid.sentence after.sentence after.block }

FUNCTION {init.consts}
{ #0 'before.all :=
  #1 'mid.sentence :=
  #2 'after.sentence :=
  #3 'after.block :=
}

STRINGS { s t }

FUNCTION {output.nonnull}
{ 's :=
  output.state mid.sentence =
    { ", " * write$ }
    { output.state after.block =
	{ add.period$ write$
	  newline$
	  "\newblock " write$
	}
	{ output.state before.all =
	    'write$
	    { add.period$ " " * write$ }
	  if$
	}
      if$
      mid.sentence 'output.state :=
    }
  if$
  s
}

FUNCTION {output}
{ duplicate$ empty$
    'pop$
    'output.nonnull
  if$
}

FUNCTION {output.check}
{ 't :=
  duplicate$ empty$
    { pop$ "empty " t * " in " * cite$ * warning$ }
    'output.nonnull
  if$
}

FUNCTION {not}
{   { #0 }
    { #1 }
  if$
}

FUNCTION {and}
{   'skip$
    { pop$ #0 }
  if$
}

FUNCTION {or}
{   { pop$ #1 }
    'skip$
  if$
}

FUNCTION {n.dashify}
{ 't :=
  ""
    { t empty$ not }
    { t #1 #1 substring$ "-" =
	{ t #1 #2 substring$ "--" = not
	    { "--" *
	      t #2 global.max$ substring$ 't :=
	    }
	    {   { t #1 #1 substring$ "-" = }
		{ "-" *
		  t #2 global.max$ substring$ 't :=
		}
	      while$
	    }
	  if$
	}
	{ t #1 #1 substring$ *
	  t #2 global.max$ substring$ 't :=
	}
      if$
    }
  while$
}

%					apalike needs this function because
%					the year has special punctuation
FUNCTION {output.year.check}
{ year empty$
    { "empty year in " cite$ * warning$ }
    { add.period$ write$
      month empty$
	{ " (" year n.dashify * extra.label * ")" * }
	{ " (" year n.dashify * extra.label * ", " * month * ")" * }
      if$
      mid.sentence 'output.state :=
    }
  if$
}

FUNCTION {output.bibitem}
{ newline$
  "\bibitem[" write$
  firstyear empty$
    { year n.dashify extra.label * write$ }
    { firstyear n.dashify "/" * year n.dashify * extra.label * write$ }
  if$
  "]{" write$
  cite$ write$
  "}" write$  
  newline$
  ""
  before.all 'output.state :=
}

FUNCTION {fin.entry}
{ add.period$
  write$
  newline$
  note missing$
    'skip$
    { "\newblock " write$
      note write$
      newline$
    }
  if$




}

FUNCTION {new.block}
{ output.state before.all =
    'skip$
    { after.block 'output.state := }
  if$
}

FUNCTION {new.sentence}
{ output.state after.block =
    'skip$
    { output.state before.all =
	'skip$
	{ after.sentence 'output.state := }
      if$
    }
  if$
}

FUNCTION {new.block.checkb}
{ empty$
  swap$ empty$
  and
    'skip$
    'new.block
  if$
}

FUNCTION {field.or.null}
{ duplicate$ empty$
    { pop$ "" }
    'skip$
  if$
}

FUNCTION {emphasize}
{ duplicate$ empty$
    { pop$ "" }
    { "{\em " swap$ * "}" * }
  if$
}

INTEGERS { nameptr namesleft numnames }

FUNCTION {format.names}
{ 's :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr "{ll}{, f.}{ vv}{, jj}" format.name$ 't :=   % last name first
      nameptr #1 >
	{ namesleft #1 >
	    { ", " * t * }
	    { t "others" =
		{ " et~al." * }
		{ ", \& " * t * }
	      if$
	    }
	  if$
	}
	't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

FUNCTION {format.editor.names}	% like format.names, but last name last
				% also: if 2 names, no comma before the &
{ 's :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr "{f.~}{vv~}{ll}{, jj}" format.name$ 't :=   % last name last
      nameptr #1 >
	{ namesleft #1 >
	    { ", " * t * }
	    { numnames #2 >
		{ "," * }
		'skip$
	      if$
	      t "others" =
		{ " et~al." * }
		{ " \& " * t * }
	      if$
	    }
	  if$
	}
	't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

FUNCTION {format.authors}
{ author empty$
    { "" }
    { author format.names }
  if$
}

FUNCTION {format.key}			% this function is just for apalike
{ empty$
    { key field.or.null }
    { "" }
  if$
}

FUNCTION {format.editors}
{ editor empty$
    { "" }
    { editor format.editor.names
      edtitle empty$
	{ editor num.names$ #1 >
	    { " (Eds.)" * }
	    { " (Ed.)" * }
	  if$
	}
	{ " " * edtitle * }
      if$
    }
  if$
}

FUNCTION {format.initial.editors}
{ editor empty$
    { "" }
    { editor format.names
      edtitle empty$
	{ editor num.names$ #1 >
	    { " (Eds.)" * }
	    { " (Ed.)" * }
	  if$
	}
	{ " " * edtitle * }
      if$
    }
  if$
}

FUNCTION {format.title}
{ title empty$
    { "" }
    { title "t" change.case$ }
  if$
}

FUNCTION {tie.or.space.connect}
{ duplicate$ text.length$ #3 <
    { "~" }
    { " " }
  if$
  swap$ * *
}

FUNCTION {either.or.check}
{ empty$
    'pop$
    { "can't use both " swap$ * " fields in " * cite$ * warning$ }
  if$
}

INTEGERS { multiresult }

FUNCTION {multi.num.check}
{ 't :=
  #0 'multiresult :=
    { multiresult not
      t empty$ not
      and
    }
    { t #1 #1 substring$
      duplicate$ "-" =
      swap$ duplicate$ "," =
      swap$ "+" =
      or or
	{ #1 'multiresult := }
	{ t #2 global.max$ substring$ 't := }
      if$
    }
  while$
  multiresult
}

FUNCTION {format.bvolume}
{ volume empty$
    { "" }
    { edition empty$
    	{ volume multi.num.check
	    { "Vols." volume n.dashify tie.or.space.connect }
	    { "Vol." volume tie.or.space.connect }
	  if$
        }
	{ volume multi.num.check
	    { ", Vols." volume n.dashify tie.or.space.connect }
	    { ", Vol." volume tie.or.space.connect }
	  if$
        }
      if$
      "volume and number" number either.or.check
    }
  if$
}

FUNCTION {format.number.series}
{ volume empty$
    { number empty$
	{ series field.or.null }
	{ output.state mid.sentence =
	    { "number" }
	    { "Number" }
	  if$
	  number tie.or.space.connect
	  series empty$
	    { "there's a number but no series in " cite$ * warning$ }
	    { " in " * series * }
	  if$
	}
      if$
    }
    { "" }
  if$
}

FUNCTION {format.edition}
{ edition empty$
    { "" }
    { output.state mid.sentence =
	{ edition "l" change.case$ " ed." * }
	{ edition "t" change.case$ " ed." * }
      if$
    }
  if$
}

FUNCTION {format.pages}
{ pages empty$
    { "" }
    { pages multi.num.check
	{ "" pages n.dashify tie.or.space.connect }
	{ "" pages tie.or.space.connect }
      if$
    }
  if$
}

FUNCTION {format.verbose.pages}
{ pages empty$
    { "" }
    { pages multi.num.check
	{ volume empty$ edition empty$ and
	    { "pp." pages n.dashify tie.or.space.connect }
	    { ", pp." pages n.dashify tie.or.space.connect }
	  if$
        }
	{ volume empty$ edition empty$ and
	    { "p." pages tie.or.space.connect }
	    { ", p." pages tie.or.space.connect }
	  if$
        }
      if$
    }
  if$
}

FUNCTION {format.num.pages}
{ number empty$
    { "" }
    { "(" number * ")" * *
      volume empty$
	{ "there's a number but no volume in " cite$ * warning$ }
	{ "" }
      if$
    }
  if$
  pages empty$
    'skip$
    { duplicate$ empty$
	{ pop$ format.pages }
	{ "," * pages n.dashify * }
      if$
    }
  if$
}

FUNCTION {format.chapter.pages}
{ chapter empty$
    'format.verbose.pages
    { "ignoring chapter field in " cite$ * warning$ }
  if$
}

FUNCTION {format.publisher}
{ publisher empty$
    { "no publisher specified in " cite$ * warning$ 
      "" 
    }
    { address empty$
	{ "no address specified in " cite$ * warning$ 
	  publisher
	}
	{ address ": " * publisher * }
      if$
    }
  if$
}

FUNCTION {format.institution}
{ institution empty$
    { "no institution specified in " cite$ * warning$ }
    { address empty$
	{ "no address specified in " cite$ * warning$ }
	{ address ": " * institution * }
      if$
    }
  if$
}

FUNCTION {format.booktitle.parensuf}
{ edition empty$
  volume empty$
  and
  pages empty$
  and
    { "" }
    { " (" format.edition * 
	format.bvolume *
	format.chapter.pages * 
	")" * }
  if$
}	

FUNCTION {format.reptitle.parensuf}
{ number empty$
    { "empty number in " cite$ * warning$ }
    { type empty$
	{ " (Report No. " number n.dashify * }
	{ " (" type * " No. " * number n.dashify * }
      if$
      pages empty$
	{ ")" * }
	{ pages multi.num.check
	    { ", p. " * pages * ")" * }
	    { ", pp. " * pages n.dashify * ")" * }
	  if$
	}
      if$
    }
  if$
}	

FUNCTION {format.btitle}
{ title emphasize format.booktitle.parensuf *
}

FUNCTION {format.reptitle}
{ title emphasize format.reptitle.parensuf *
}

FUNCTION {format.in.ed.booktitle}
{ booktitle empty$
    { "" }
    { editor empty$
	{ "In " booktitle emphasize * format.booktitle.parensuf * }
	{ "In " format.editors * ", " * booktitle emphasize * 
	format.booktitle.parensuf * }
      if$
    }
  if$
}

FUNCTION {format.thesis.type}
{ type empty$
    'skip$
    { pop$
      type "t" change.case$
    }
  if$
}

FUNCTION {format.article.crossref}
{ "In"							% this is for apalike
  " \cite{" * crossref * "}" *
}

FUNCTION {format.book.crossref}
{ volume empty$
    { "empty volume in " cite$ * "'s crossref of " * crossref * warning$
      "In "
    }
    { "Volume" volume tie.or.space.connect
      " of " *
    }
  if$
  "\cite{" * crossref * "}" *				% this is for apalike
}

FUNCTION {format.incoll.inproc.crossref}
{ "In"							% this is for apalike
  " \cite{" * crossref * "}" *
}

FUNCTION {article}
{ output.bibitem
  author missing$
    { editor missing$
	{ format.title "title" output.check }
	{ format.initial.editors output }
      if$
    }
    { format.authors output }
  if$
  output.year.check					
  author missing$
  editor missing$
  and
    { new.block }
    { new.block
      format.title "title" output.check
      new.block
    }
  if$
  crossref missing$
    { journal emphasize "journal" output.check
      volume emphasize "volume" output.check
      format.num.pages output
    }
    { format.article.crossref output.nonnull
      format.pages output
    }
  if$
  fin.entry
}

FUNCTION {inbook}	% general format for books or unnamed parts of books
{ output.bibitem
  author missing$
    { editor missing$
	{ format.btitle "title" output.check }
	{ format.initial.editors output }
      if$
    }
    { format.authors output }
  if$
  output.year.check				% special for apalike
  author missing$
  editor missing$
  and
    { new.block }
    { new.block
      format.btitle "title" output.check
    }
  if$
  new.sentence
  format.publisher output
  fin.entry
}

FUNCTION {book}    % a book is just an inbook with pages prohibited
{ inbook
  pages empty$
    'skip$
    { "page numbers in reference to whole book in " cite$ * warning$ }
  if$
}

FUNCTION {proceedings} { book }

FUNCTION {booklet}	% like book, but ignores address and publisher
{ output.bibitem
  author missing$
    { editor missing$
	{ format.btitle "title" output.check }
	{ format.initial.editors output }
      if$
    }
    { format.authors output }
  if$
  output.year.check				% special for apalike
  author missing$
  editor missing$
  and
    { new.block }
    { new.block
      format.btitle "title" output.check
    }
  if$
  fin.entry
}

FUNCTION {manual} { booklet }

FUNCTION {misc} { booklet }

FUNCTION {unpublished} { booklet }

FUNCTION {incollection}
{ output.bibitem
  format.authors "author" output.check
  author format.key output				% special for
  output.year.check					% apalike
  new.block
  format.title "title" output.check
  new.block
  crossref missing$
    { format.in.ed.booktitle "booktitle" output.check
      new.sentence
      format.publisher output
    }
    { format.incoll.inproc.crossref output.nonnull
      format.chapter.pages output
    }
  if$
  fin.entry
}

FUNCTION {inproceedings} { incollection }

FUNCTION {conference} { inproceedings }

FUNCTION {phdthesis}	% unpublished; if published, treat as article
{ output.bibitem
  format.authors "author" output.check
  output.year.check				% special for apalike
  new.block
  format.btitle "title" output.check
  new.block
  "Unpublished doctoral dissertation" output.nonnull
  school "school" output.check
  address output
  new.block
  fin.entry
}

FUNCTION {mastersthesis}	% unpublished; if published, treat as article
{ output.bibitem
  format.authors "author" output.check
  output.year.check				% special for apalike
  new.block
  format.btitle "title" output.check
  new.block
  "Unpublished master's thesis" output.nonnull
  school "school" output.check
  address output
  new.block
  fin.entry
}

FUNCTION {techreport}	% format very similar to inbook
{ output.bibitem
  author missing$
    { editor missing$
	{ format.reptitle "title" output.check }
	{ format.initial.editors output }
      if$
    }
    { format.authors output }
  if$
  output.year.check				% special for apalike
  author missing$
  editor missing$
  and
    { new.block }
    { new.block
      format.reptitle "title" output.check
    }
  if$
  new.sentence
  format.institution output
  fin.entry
}

FUNCTION {default.type} { misc }

MACRO {jan} {"January"}

MACRO {feb} {"February"}

MACRO {mar} {"March"}

MACRO {apr} {"April"}

MACRO {may} {"May"}

MACRO {jun} {"June"}

MACRO {jul} {"July"}

MACRO {aug} {"August"}

MACRO {sep} {"September"}

MACRO {oct} {"October"}

MACRO {nov} {"November"}

MACRO {dec} {"December"}

% Journal macros
% Journal Abbreviations (only available in psychbib bibliography style)

MACRO {actapsy} {"Acta Psychologica"}
MACRO {amjpsy}	{"American Journal of Psychology"}
MACRO {ampsy}   {"American Psychologist"}
MACRO {alb}	{"Animal Learning \& Behavior"}
MACRO {anrevpsy}{"Annual Review of Psychology"}
MACRO {apamon}  {"APA Monitor"}
MACRO {bbs} 	{"The Behavioral and Brain Sciences"}
MACRO {behneuro}{"Behavioral Neuroscience"}
MACRO {brmi}	{"Behavior Research Methods and Instrumentation"}
MACRO {brmic}	{"Behavior Research Methods, Instruments, and Computers"}
MACRO {bullps}	{"Bulletin of the Psychonomic Society"}
MACRO {cpsycog} {"Cahiers de Psychologie Cognitive"}
MACRO {childev}	{"Child Development"}
MACRO {cogdev}  {"Cognitive Development"}
MACRO {cogpsy}  {"Cognitive Psychology"}
MACRO {cogsci}	{"Cognitive Science"}
MACRO {conpsy}  {"Contemporary Psychology"}
MACRO {devpsy}  {"Developmental Psychology"}
MACRO {envbeh}  {"Environment and Behavior"}
MACRO {ejcogpsy}{"European Journal of Cognitive Psychology"}
MACRO {jabpsy}	{"Journal of Abnormal Psychology"}
MACRO {japlpsy} {"Journal of Applied Psychology"}
MACRO {jcmppsy} {"Journal of Comparative Psychology"}
MACRO {jccpsy}	{"Journal of Consulting \& Clinical Psychology"}
MACRO {jcnpsy}  {"Journal of Counseling Psychology"}
MACRO {jedpsy}  {"Journal of Educational Psychology"}
MACRO {jenvpsy} {"Journal of Environmental Psychology"}
MACRO {jep} 	{"Journal of Experimental Psychology"}
MACRO {jepabp}	{"Journal of Experimental Psychology: Animal Behavior Processes"}
MACRO {jepgen} 	{"Journal of Experimental Psychology: General"}
MACRO {jephlm}  {"Journal of Experimental Psychology: Human Learning and Memory"}
MACRO {jephpp} 	{"Journal of Experimental Psychology: Human Perception and Performance"}
MACRO {jeplmc} 	{"Journal of Experimental Psychology: Learning, Memory, and Cognition"}
MACRO {jml} 	{"Journal of Memory and Language"}
MACRO {jpers}	{"Journal of Personality"}
MACRO {jpsp}   	{"Journal of Personality and Social Psychology"}
MACRO {jvlvb}   {"Journal of Verbal Learning and Verbal Behavior"}
MACRO {memcog} 	{"Memory \& Cognition"}
MACRO {memlang}	{"Memory \& Language"}
MACRO {pp}	{"Perception \& Psychophysics"}
MACRO {profpsy} {"Professional Psychology: Research and Practice"}
MACRO {psyabs}  {"Psychological Abstracts"}
MACRO {psyass}  {"Psychological Assessment"}
MACRO {psybul}  {"Psychological Bulletin"}
MACRO {psydoc}  {"Psychological Documents"}
MACRO {psyrev}  {"Psychological Review"}
MACRO {psysci}  {"Psychological Science"}
MACRO {psyage}  {"Psychology \& Aging"}
MACRO {psytoday}{"Psychology Today"}
MACRO {qjep}    {"Quarterly Journal of Experimental Psychology"}
% MACRO {qjepa}   {"Quarterly Journal of Experimental Psychology, A"}
% MACRO {qjepb}   {"Quarterly Journal of Experimental Psychology, B"}
% note: use qjep with volume like "34A" instead of qjepa
MACRO {sciam}	{"Scientific American"}
MACRO {soccog}	{"Social Cognition"}

% journals abbrevs used in plain bibliography style

MACRO {dai} 	{"Dissertation Abstracts International"}
MACRO {acmcs} 	{"ACM Computing Surveys"}
MACRO {acta} 	{"Acta Informatica"}
MACRO {cacm} 	{"Communications of the ACM"}
MACRO {ibmjrd} 	{"IBM Journal of Research and Development"}
MACRO {ibmsj} 	{"IBM Systems Journal"}
MACRO {ieeese} 	{"IEEE Transactions on Software Engineering"}
MACRO {ieeetc} 	{"IEEE Transactions on Computers"}
MACRO {ieeetcad}{"IEEE Transactions on Computer-Aided Design of Integrated Circuits"}
MACRO {ipl} 	{"Information Processing Letters"}
MACRO {jacm} 	{"Journal of the ACM"}
MACRO {jcss} 	{"Journal of Computer and System Sciences"}
MACRO {scp} 	{"Science of Computer Programming"}
MACRO {sicomp} 	{"SIAM Journal on Computing"}
MACRO {tocs} 	{"ACM Transactions on Computer Systems"}
MACRO {tods} 	{"ACM Transactions on Database Systems"}
MACRO {tog} 	{"ACM Transactions on Graphics"}
MACRO {toms} 	{"ACM Transactions on Mathematical Software"}
MACRO {toois} 	{"ACM Transactions on Office Information Systems"}
MACRO {toplas} 	{"ACM Transactions on Programming Languages and Systems"}
MACRO {tcs} 	{"Theoretical Computer Science"}

% obsolete macros -- do not use

MACRO {ampsych}	{"American Psychologist"} % backward
MACRO {cogpsych}{"Cognitive Psychology"} % backward
MACRO {devpsych}{"Developmental Psychology"} % backward
MACRO {psychass}{"Psychological Assessment"} % backward
MACRO {psychbull} {"Psychological Bulletin"} % backward
MACRO {psychrev} {"Psychological Review"} % backward
MACRO {psychsci} {"Psychological Science"} % backward
MACRO {psychage} {"Psychology \& Aging"} % backward
MACRO {psychtoday} {"Psychology Today"} % backward

READ

FUNCTION {sortify}
{ purify$
  "l" change.case$
}

INTEGERS { len }

FUNCTION {chop.word}
{ 's :=
  'len :=
  s #1 len substring$ =
    { s len #1 + global.max$ substring$ }
    's
  if$
}

%			There are three apalike cases: one person (Jones),
%			two (Jones & de~Bruijn), and more (Jones et~al.).
%			This function is much like format.crossref.editors.
%
FUNCTION {format.lab.names}
{ 's :=
  s #1 "{vv~}{ll}" format.name$
  s num.names$ duplicate$
  #2 >
    { pop$ " et~al." * }
    { #2 <
	'skip$
	{ s #2 "{ff }{vv }{ll}{ jj}" format.name$ "others" =
	    { " et~al." * }
	    { " \& " * s #2 "{vv~}{ll}" format.name$ * }
	  if$
	}
      if$
    }
  if$
}

FUNCTION {author.key.label}
{ author empty$
    { key empty$
	{ cite$ #1 #3 substring$ }
	'key					% apalike uses the whole key
      if$
    }
    { author format.lab.names }
  if$
}

FUNCTION {author.editor.key.label}
{ author empty$
    { editor empty$
	{ key empty$
	    { cite$ #1 #3 substring$ }
	    'key				% apalike uses the whole key
	  if$
	}
	{ editor format.lab.names }
      if$
    }
    { author format.lab.names }
  if$
}

FUNCTION {editor.key.label}
{ editor empty$
    { key empty$
	{ cite$ #1 #3 substring$ }
	'key			% apalike uses the whole key, no organization
      if$
    }
    { editor format.lab.names }
  if$
}

FUNCTION {sort.format.names}
{ 's :=
  #1 'nameptr :=
  ""
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { nameptr #1 >
	{ "   " * }
	'skip$
      if$						% apalike uses initials
      s nameptr "{ll{}}{  f{ }}{  vv{ }}{  jj{ }}" format.name$ 't := % <= here
%     s nameptr "{vv{ } }{ll{ }}{  f{ }}{  jj{ }}" format.name$ 't := % <= here
%%    s nameptr "{vv~}{ll}{,  f.}{, jj}" format.name$ 't := % <= here
      nameptr numnames = t "others" = and
  	{ "et al" * }
	{ t sortify * }
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

FUNCTION {sort.format.title}
{ 't :=
  "A " #2
    "An " #3
      "The " #4 t chop.word
    chop.word
  chop.word
  sortify
  #1 global.max$ substring$
}

% FUNCTION {author.sort}
% { author empty$
%    { key empty$
%	{ title empty$
%	    { "to sort, need author, key, or title in " cite$ * warning$
%	      ""
%	    }
%	    { title sort.format.title sortify }
%	  if$
%	}
%	{ key sortify }
%      if$
%    }
%    { author sort.format.names }
%  if$
% }

FUNCTION {author.editor.sort}
{ author empty$
    { editor empty$
	{ key empty$
	    { title empty$
		{ "to sort, need author, editor, key, or title in " cite$ * warning$
		  ""
		}
		{ title sort.format.title sortify }
	      if$
	    }
	    { key sortify }
	  if$
	}
	{ editor sort.format.names }
      if$
    }
    { author sort.format.names }
  if$
}

%			apalike uses two sorting passes; the first one sets the
%			labels so that the `a's, `b's, etc. can be computed;
%			the second pass puts the references in "correct" order.
%			The presort function is for the first pass. It computes
%			label, sort.label, and title, and then concatenates.
FUNCTION {presort}
{ ""
  author.editor.sort
  "    "
  *
  year field.or.null
  *
  #1 entry.max$ substring$	% for
  'sort.label :=		% apalike
  sort.label			% style
  *
  "    "
  *
  title field.or.null
  sort.format.title
  *
  #1 entry.max$ substring$
  'sort.key$ :=
}

ITERATE {presort}


SORT		% by sort.label and title---for final label calculation


STRINGS { last.label next.extra }	% apalike labels are only for the text;

INTEGERS { last.extra.num }		% there are none in the bibliography

FUNCTION {initialize.extra.label.stuff}	% and hence there is no `longest.label'
{ #0 int.to.chr$ 'last.label :=
  "" 'next.extra :=
  #0 'last.extra.num :=
}

FUNCTION {forward.pass}
{ last.label sort.label =
    { last.extra.num #1 + 'last.extra.num :=
      last.extra.num int.to.chr$ 'extra.label :=
    }
    { "a" chr.to.int$ 'last.extra.num :=
      "" 'extra.label :=
      sort.label 'last.label :=
    }
  if$
}

FUNCTION {reverse.pass}
{ next.extra "b" =
    { "a" 'extra.label := }
    'skip$
  if$
  sort.label extra.label * 'sort.label :=
  extra.label 'next.extra :=
}

EXECUTE {initialize.extra.label.stuff}

ITERATE {forward.pass}

REVERSE {reverse.pass}

%				Now that the label is right we sort for real,
%				on sort.label then title.  This is
%				for the second sorting pass.
FUNCTION {bib.sort.order}
{ sort.label
  "    "
  *
  title field.or.null
  sort.format.title
  *
  #1 entry.max$ substring$
  'sort.key$ :=
}

ITERATE {bib.sort.order}


SORT		% by sort.label, year, title---giving final bibliography order


FUNCTION {begin.bib}
{ preamble$ empty$				% no \etalchar in apalike
    'skip$
    { preamble$ write$ newline$ }
  if$
  "\begin{thebibliography}{}" write$ newline$		% no labels in apalike
}

EXECUTE {begin.bib}

EXECUTE {init.consts}

ITERATE {call.type$}

FUNCTION {end.bib}
{ newline$
  "\end{thebibliography}" write$ newline$
}

EXECUTE {end.bib}

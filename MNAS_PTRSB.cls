%% This is file `MNAS_PTRSB.cls'
%% class file for approximating Royal Society PTRS-B formatting
%% By Mark Humphries
%%
%% Based on:
%% Created by Alistair Smith, Sunrise Setting Ltd, 31 March 2004
%% rsifpublic.cls --- For J. R. Soc. Lond. Interface

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{MNAS_PTRSB}[2004/08/06 v1.01 Royal Society---PTRSB]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions
\LoadClass[twocolumn]{article}
\RequirePackage{latexsym,ifthen,theorem,booktabs,endnotes}
\RequirePackage{amsfonts,amssymb,amsbsy,amsmath,amscd}
\RequirePackage[dvips]{graphicx}
\RequirePackage[errorshow]{tracefnt}

\renewcommand{\normalsize}{\fontsize{9.5}{11pt}\selectfont}
\renewcommand{\small}{\fontsize{9}{10pt}\selectfont}
\renewcommand{\footnotesize}{\fontsize{9}{10pt}\selectfont}
%\renewcommand{\scriptsize}{\fontsize{7}{8pt}\selectfont}
%\renewcommand{\tiny}{\fontsize{5}{6pt}\selectfont}
\renewcommand{\large}{\fontsize{10}{12pt}\selectfont}
%\renewcommand{\Large}{\fontsize{14}{18pt}\selectfont}
%\renewcommand{\LARGE}{\fontsize{17}{22pt}\selectfont}
%\renewcommand{\huge}{\fontsize{20}{25pt}\selectfont}
%\renewcommand{\Huge}{\fontsize{25}{30pt}\selectfont}
\renewcommand{\footnote}{\endnote}
\renewcommand{\notesname}{Endnotes}

\newcommand{\authorsize}{\fontsize{13}{16pt}\selectfont}
\newcommand{\titlesize}{\fontsize{20}{24pt}\selectfont}


% approximate column widths
\newcommand{\PTRSBcol}{8cm}
\newcommand{\PTRSBdblcol}{\textwidth}

%Page and general

\@twosidetrue
\frenchspacing
\flushbottom

\setlength\voffset{-1in}
\setlength\hoffset{-1in}
\setlength\paperheight{297mm}
\setlength\paperwidth{210mm}
\setlength\columnsep{1.5pc}
\textwidth 41.5pc
\topskip 11.5pt
\textheight 724.5pt %63x11.5
\topmargin 18pt
\setlength\oddsidemargin{20mm}
\setlength\evensidemargin{18mm}

%Needed to set PDF page size
\special{papersize=210mm,297mm}

\parindent 12pt
\headsep 12pt
\headheight 20pt
\footskip 20pt
\hyphenpenalty=800
\doublehyphendemerits=10000
\lefthyphenmin=3
%\pretolerance=8000
%\tolerance=9500
\hbadness=10000
\vbadness=10000
\brokenpenalty=10000
\displaywidowpenalty=0
\clubpenalty=10000
\widowpenalty=10000
\sloppy
\setlength{\abovedisplayskip}{10\p@ plus2\p@ minus5\p@}
\setlength{\belowdisplayskip}{\abovedisplayskip}
\setlength{\abovedisplayshortskip}{\z@ \@plus3\p@}
\setlength{\belowdisplayshortskip}{6\p@ \@plus3\p@ \@minus3\p@}
\setcounter{topnumber}{5}
\def\topfraction{1}
\setcounter{bottomnumber}{5}
\def\bottomfraction{.8}
\setcounter{totalnumber}{10}
\def\textfraction{0}
\renewcommand{\floatpagefraction}{0.95}
\renewcommand{\dblfloatpagefraction}{0.95}
\renewcommand{\dbltopfraction}{1}

\newcommand{\rd}{\mathrm{d}}            % Roman d for differential
\newcommand{\re}{\mathrm{e}}            % Roman e for exponential
\newcommand{\ri}{\mathrm{i}}            % Roman i for imaginary number
\DeclareMathOperator{\sgn}{sgn}           % Sign
\DeclareMathOperator{\Real}{Re}  % Real part
\DeclareMathOperator{\Imag}{Im}  % Imaginary part
\newcommand{\const}{\mathrm{const.}}    % Abbreviation for `constant'

\hyphenation{homeo-morphisms}
\hyphenation{homeo-morphism}
\hyphenation{homo-morphisms}
\hyphenation{homo-morphism}
\hyphenation{diffeo-morphisms}
\hyphenation{diffeo-morphism}

\thinmuskip = 4mu
\medmuskip = 4mu
\thickmuskip = 4mu
\multlinegap = 0pt
\setlength{\jot}{5pt}

\theorembodyfont{\it}
\theoremheaderfont{\bf}
\setlength{\theorempreskipamount}{8pt plus 2pt}
\setlength{\theorempostskipamount}{8pt plus 2pt}

\begingroup \makeatletter
\gdef\th@plain{\normalfont\itshape
  \def\@begintheorem##1##2{%
        \item[\hskip\labelsep\hspace*{\parindent}\theorem@headerfont ##1\ {##2.}]}%
\def\@opargbegintheorem##1##2##3{%
   \item[\hskip\labelsep\hspace*{\parindent}\theorem@headerfont ##1\ ##2\ (##3).]}}
\endgroup

\newenvironment{proof}{%
\vspace{\theorempreskipamount}{\it Proof.}\hspace{1ex}\ignorespaces}%
{~{\hfill$\blacksquare$}\vspace{\theorempostskipamount}}

\newenvironment{remarknn}{\vspace{\theorempostskipamount}
\textbf{Remark.}}{\vspace{\theorempostskipamount}}

\def\refname{REFERENCES}
\def\figurename{Figure}
\def\tablename{Table}
\def\abstractname{Abstract}

%Timestamp
%timestamp{proof}{their number}{our number}
\newcounter{sheetcount}\setcounter{sheetcount}{1}
\def\timestamp#1#2#3{%
\gdef\@timestamp{\parbox[t]{\textwidth}{\small\textsf{\today\quad #1\ proof\quad
Ref:\ #2/#3\quad Sheet number\ \thesheetcount}}
}}

\gdef\notimestamp#1{\gdef\@timestamp{\parbox[t]{\textwidth}{#1}}}

% Title page

\newenvironment{topmatter}[1]
{\twocolumn[\vspace*{18pt}\parbox{\textwidth}{#1}
\vspace*{1pc}]}{}

% print integer as a zero filled 2 digit field
\def\twodigits#1{\ifnum #1 < 10{0#1}\else{#1}\fi}

% print integer as a zero filled 4 digit field
\def\fourdigits#1{\ifnum #1 < 10{000#1}\else
  \ifnum #1 < 100{00#1}\else
    \ifnum #1 < 1000{0#1}\else{#1}\fi
  \fi
\fi}

%\gdef\received#1{\gdef\@myreceive{\emph{Received} #1}}
%\gdef\accepted#1{\gdef\@myaccepted{\emph{Accepted} #1}}
%\gdef\online#1{\gdef\@myonline{\emph{Published online} #1}}
%\gdef\noreceived#1{\gdef\@myreceive{#1}}
%\gdef\noaccepted#1{\gdef\@myaccepted{#1}}
%\gdef\noonline#1{\gdef\@myonline{#1\mbox{}}}

%First page catchline
%RSOC{first page}{last page}{vol}{year}{doi}
\def\RSOC#1#2#3#4#5{
\gdef\@mymainhead{\parbox[t]{\textwidth}{\parbox[b]{8cm}{%
\footnotesize\emph{Prepared using \textsf{MNAS\_PTRSB.cls}}\\
\mbox{}\\
\mbox{}}%
\hfill\parbox[b]{8cm}{%
\hfill\footnotesize{\textit{\thejournal}\ (\theyear)}\\
\mbox{}\hfill\footnotesize{DOI: \thedoipream\thedoi}\\
\mbox{}}
\baselineskip=9pt\\
%\rule{\textwidth}{0.5pt}%
}}
\setcounter{page}{#1}
\def\thefirstpage{#1}
\def\thelastpage{#2}
\def\thevolume{#3}
\def\theyear{#4}
\def\thedoi{#5}}

\gdef\@mymainfoot{%
\parbox[t]{\textwidth}{%
\parbox[t]{15pc}{\footnotesize\@myreceive}\hfill{\small\thepage}\hfill%
\parbox[t]{15pc}{\mbox{}\hfill\footnotesize Article submitted to The Royal Society}\\
\footnotesize \@myaccepted\\
\footnotesize \@myonline}}

\def\ps@myplain{\let\@mkboth\@gobbletwo
  \def\@oddhead{\parbox[t]{\textwidth}{%\@timestamp\\[42pt]%
  \vspace*{-7pt}
  \@mymainhead}}
  \def\@evenhead{}
  \def\@evenfoot{}
\def\@oddfoot{\@mymainfoot}}

\thispagestyle{myplain}

%Headers and footers for non-title pages

\def\runningheads#1#2{\markboth{#1}{#2}}

\def\rhdot{\hspace*{0.5em}\hspace*{0.5em}}
\def\ps@rsoc{%
\let\@mkboth\@gobbletwo
\def\@evenhead{\parbox[b]{\textwidth}{%\addtocounter{sheetcount}{1}\@timestamp\\[42pt]%
\normalsize%
\thepage\hspace*{1.5pc}\textit{\rightmark}{\rhdot}{\leftmark}\hfill$\phantom{\thepage}$\\[-6pt]
\rule{\textwidth}{0.5pt}}}
\def\@oddhead{\parbox[b]{\textwidth}{%\addtocounter{sheetcount}{1}\@timestamp\\[42pt]%
\normalsize%
$\phantom{\thepage}$\hfill\textit{\rightmark}{\rhdot}{\leftmark}\hspace*{1.5pc}\thepage\\[-6pt]
\rule{\textwidth}{0.5pt}}}
\def\@evenfoot{{\footnotesize\textit{Prepared using \textsf{MNAS\_PTRSB.cls}}}\hfill}
\def\@oddfoot{{\footnotesize\textit{Prepared using \textsf{MNAS\_PTRSB.cls}}}\hfill}
}

\pagestyle{rsoc}

%%%%%%%%%
%Title, author, etc

\def\title#1{\addtocounter{footnote}{1}
\vspace*{4pt}
\begin{center}%
\rule{\textwidth}{0.5pt}
\sffamily\titlesize\textbf{#1} \\
\rule{\textwidth}{0.5pt}
}

\def\author#1{\vspace*{-10pt}\normalfont\authorsize\textbf{#1}\par\vspace*{4pt}}

\def\address#1{\normalsize\textit{#1}\end{center}}

\def\abstract{\begin{center}\vspace*{-1pt}\begin{minipage}[c]{14.7cm}\normalsize\noindent\ignorespaces}%
\def\endabstract{\par\end{minipage}\end{center}}

\def\keywords#1{\baselineskip 10pt
\begin{center}{\small\bfseries Keywords:\ \normalfont #1}
\end{center}\normalsize}

\def\nosections{\vspace{30\p@ plus12\p@ minus12\p@}
\noindent\ignorespaces}

%define section heads etc for style

\def\thesection{\arabic{section}}
\def\thesubsection{\@alph\c@subsection}
\def\thesubsubsection{\@roman\c@subsubsection}
%\def\theparagraph{\thesubsubsection.\arabic{paragraph}}
%\def\thesubparagraph{\theparagraph.\arabic{subparagraph}}

%% define section heading text formatting
\def\@seccntformat#1{{\csname the#1\endcsname.}\hspace{1ex}}

%% define section heading position formatting
\renewcommand\section{\renewcommand{\@seccntformat}[1]{%
   \csname thesection\endcsname.\hspace{0.5em}}%
\@startsection {section}{1}{\z@}%
                                   {-12pt plus -3pt minus -1pt}%
                                   {+6pt}%
                                   {\centering\sffamily\large\bfseries}}

\def\subsection{\renewcommand{\@seccntformat}[1]{%
   \normalfont\rmfamily(\normalfont\itshape
   \csname thesubsection\endcsname\/% Italic correction
   \normalfont\rmfamily)\hspace{0.5em}}%
\@startsection
{subsection}%           the name
{2}%                 the level
{\z@}%               the indent
{-3.5ex plus -1ex minus -.2ex}%  the beforeskip
{1pt}%     the afterskip
{\centering\normalsize\bfseries\itshape}}% the style
%%
%%
\def\subsubsection{\renewcommand{\@seccntformat}[1]{%
   \normalfont\rmfamily(\csname thesubsubsection\endcsname)\hspace{0.5em}}
\@startsection
{subsubsection}%           the name
{3}%                 the level
{\z@}%               the indent
{-3.5ex}%  the beforeskip
{1pt}%     the afterskip
{\normalsize\itshape}}% the style
%%%%%%%%%%%%%%%%%%%%%%

\renewcommand{\appendix}{\setcounter{section}{0}\renewcommand{\thesection}{\Alph{section}}
\renewcommand{\section}{\makeatletter
\renewcommand{\@seccntformat}[1]{{\appendixname\ \csname thesection\endcsname}\hspace{1ex}}
\makeatother
\@startsection
{section}%                                            the name
{1}%                                                  the level
{0pt}%                                                the indent
{\baselineskip}%                                      the beforeskip
{0.5\baselineskip}%                                  the afterskip
{\centering\normalfont\large\bfseries}}%  the style
}

%lists etc
\def\enumerate{\ifnum \@enumdepth >3 \@toodeep\else
      \advance\@enumdepth \@ne
      \edef\@enumctr{enum\romannumeral\the\@enumdepth}\list
      {\csname label\@enumctr\endcsname}{\usecounter
        {\@enumctr}\itemsep 0pt\parsep 0pt
         \def\makelabel##1{\hss\llap{##1}}}\fi}

\let\endenumerate =\endlist

\def\itemize{\ifnum \@itemdepth >3 \@toodeep\else \advance\@itemdepth \@ne
\edef\@itemitem{labelitem\romannumeral\the\@itemdepth}%
\list{\csname\@itemitem\endcsname}{\itemsep 0pt\parsep 0pt
\def\makelabel##1{\hss\llap{##1}}}\fi}

\let\enditemize =\endlist

%%%%%%%%%%%%%%%%
%Footnotes
\renewcommand{\thefootnote}{\fnsymbol{footnote}}
\long\def\@makefntext#1{\parindent 1em%
\noindent{$\m@th^{\@thefnmark}$}#1}
\renewcommand{\footnoterule}{}

\def\comma{$^{\text{,}}$}

%Figure and tables

%To force more space above graphics
\renewenvironment{figure}{%
\@ifnextchar[%
{\@float{figure}}
{\@float{figure}\vspace*{7pt}}}
{\end@float}

\renewenvironment{figure*}{%
\@ifnextchar[%
{\@float{figure*}}
{\@float{figure*}\vspace*{7pt}}}
{\end@float}

\setlength\abovecaptionskip{10\p@}
\setlength\belowcaptionskip{10\p@}
\long\def\@makecaption#1#2{%
  \ifnum\@tempcnta<64\vspace\abovecaptionskip\fi
  \sbox\@tempboxa{\small{#1}. #2}%
  \ifdim \wd\@tempboxa >\hsize
    \small{#1}. #2\par
  \else
    \global \@minipagefalse
    \hbox to\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \ifnum\@tempcnta<64\else\vskip\belowcaptionskip\fi}

\long\def\@dcolcaption#1#2{%
  \ifnum\@tempcnta<64\vspace\abovecaptionskip\fi
  \sbox\@tempboxa{\small{#1}. #2}%
  \ifdim \wd\@tempboxa >\hsize
    \small{#1}. #2\par
  \else
    \global \@minipagefalse
    \hbox to\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \ifnum\@tempcnta<64\else\vskip\belowcaptionskip\fi}

\renewenvironment{figure*}{\let\@makecaption\@dcolcaption\@dblfloat{figure}}%
{\end@dblfloat}

\renewenvironment{table*}{\let\@makecaption\@dcolcaption\@dblfloat{table}}%
{\end@dblfloat}

\heavyrulewidth=1.0pt
\lightrulewidth=0.5pt
\cmidrulewidth=0.3pt

%%%%%%%%%%%%%%%%%%

%Acks
\def\ack{\subsubsection*{Acknowledgement.}}%
\def\acks{\subsubsection*{Acknowledgements.}}

\newenvironment{acknowledgements}{%
  \par\medskip\noindent\small\ignorespaces}{\par}

%references

\def\makelabel#1{\hbox to\labelwidth{#1\hss}}
\def\thebibliography#1{\vspace{26pt plus6pt minus7pt}
  \begin{center}
\textsc{\refname}\end{center}\vspace*{6pt}%
\list{[{\bf\arabic{enumi}}]}{\def\makelabel##1{{\bf##1}\hss}\topsep=0\p@\parsep=0\p@
 \partopsep=0\p@\itemsep=0\p@
 \labelsep=12\p@\itemindent=0\p@
 \settowidth\labelwidth{\footnotesize[#1]}%
 \leftmargin\labelwidth
 \advance\leftmargin\labelsep
 \advance\leftmargin -\itemindent
 \usecounter{enumi}}\footnotesize
 \def\newblock{\ }
 \sloppy\clubpenalty4000\widowpenalty4000
 \sfcode`\.=1000\relax}
\let\endthebibliography=\endlist
\def\numrefs#1{\begin{thebibliography}{#1}}
\def\endnumrefs{\end{thebibliography}}

% Macro to used for references in the Harvard system

\newenvironment{thereferences}{\section*{\refname}\par
\list{}{\topsep=0\p@\parsep=0\p@
\partopsep=0\p@\itemsep=0\p@\labelsep=0\p@\itemindent=-12\p@
\labelwidth=0\p@\leftmargin=12\p@
}\small\rm
\def\newblock{\ }
\sloppy\clubpenalty4000\widowpenalty4000
\sfcode`\.=1000\relax}{\endlist}

\def\corraddr#1{\footnotetext[2]{\raggedright Author for correspondence #1.}\stepcounter{footnote}}
\def\corrauth{\footnotemark[2]}

\def\affil#1{$^{#1}$}
\def\affilnum#1{$^{#1}$}

\def\email#1{\emph{(#1)}}

\def\endcolumn{\parfillskip=0pt\par\newpage
   \noindent\parfillskip=0pt plus 1fil{}}

\def\thejournal{Phil.\ Trans.\ R.\ Soc.\ Lond.\ B}
\def\thedoipream{10.1098/rstb}

\gdef\@myreceive{\mbox{}}
\gdef\@myaccepted{\mbox{}}
\gdef\@myonline{\mbox{}}
\RSOC{1}{2}{00}{0000}{0000.0000}

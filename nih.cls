% vim:tabstop=4 expandtab syntax=tex:
% This is nih.cls by Alan Shields, May 2003
% email: Alan-Shields2omrf.ouhsc.edu
% Heavily based upon (read: copied almost exactly from)
%    nih.sty by Bruce R. Donald and Matthew L. Fidler
%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{nih}[2003/05/08 NIH PHS 398 as of January 2003]

% includes needed for preliminary code
\RequirePackage{ifthen}

% Preliminary code
\newcommand{\nih@kk}{~}

\newboolean{nih@blank}
\setboolean{nih@blank}{false}% not strictly necessary, but let's be clear about it

% Options
%%%% Changed by M A Lewis, Ph.D. (mal11 at alumni.cwru.edu)
%%%% NIH suggests Helvetica or Arial 12pt. Use Helvetica Postscript fonts for 12pt also.
\DeclareOption{12pt}{\AtEndOfClass{\RequirePackage{helvet}\renewcommand{\familydefault}{\sfdefault}}}
%\DeclareOption{12pt}{\AtEndOfClass{\RequirePackage{times}}}
%\DeclareOption{12pt}{\AtEndOfClass{\RequirePackage{arial}}}
\DeclareOption{11pt}{\AtEndOfClass{\RequirePackage{helvet}\renewcommand{\familydefault}{\sfdefault}}}
\DeclareOption{nihblank}{\setboolean{nih@blank}{true}}
\DeclareOption{kk}{\renewcommand{\nih@kk}{\small KK}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

% The class we're overwriting
\LoadClassWithOptions{article}


% Begin Requirements
%%%% Changed by M A Lewis, Ph.D. (mal11 at alumni.cwru.edu)
%%%% PHS 398 allows 0.5in magins everywhere. Simplify page layout using geometry package.
%\RequirePackage{fullpage}
\RequirePackage[letterpaper,margin=0.5in,includeheadfoot]{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{amsmath}



%%%% More code
% preamble stuff
\newcommand{\nih@PIname}{Vestigator, Paul I.}
\newcommand{\piname}[1]{\renewcommand{\nih@PIname}{#1}}

% constants
\newcommand{\nih@sillysize}{\scriptsize}

% set the page style
\pagestyle{fancy}
\chead{\fancyplain{}{%
        \ifthenelse{\boolean{nih@blank}}%
            {}% fi
            {%
                {{\sf\scriptsize Principal Investigator/Program Director%
                    (Last, First, middle):}}%
            }% esle
    }
}
\rhead{\fancyplain{}{%
        \ifthenelse{\boolean{nih@blank}}%
            {\ \ \ {\nih@PIname}\ \ \ \ \ }% fi
            {%
                \underline{\ \ \ {\nih@PIname}\ \ \ \ \ }%
            }% esle
    }
}
\lhead{\fancyplain{}{\nih@kk}}
\lfoot{\fancyplain{}{%
        \ifthenelse{\boolean{nih@blank}}%
            {}% fi
            {\sf\footnotesize PHS 398/2590 (Rev.~5/01)\\}% esle
    }
}
\cfoot{\ifthenelse{\boolean{nih@blank}}%
        {\thepage}% fi
        {\sf\footnotesize{Page}}% esle
    \ \underline{\ \ \ {\sf\thepage}\ \ \ }%
}
\rfoot{\fancyplain{}%
    {\sf\footnotesize{\textbf{Continuation Format Page}}}%
}

\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0.75pt}

%%%% Changed by M A Lewis, Ph.D. (mal11 at alumni.cwru.edu)
%%%% Simplify page layout by using geometry package above.
% page dimensions (note: assumes 8.5x11)
%\setlength{\oddsidemargin}{31pt}
%\setlength{\textwidth}{8.5in}
%\addtolength{\textheight}{0in} % 0.5in margins on both sides
%\addtolength{\textwidth}{-1.1in}
%\setlength{\oddsidemargin}{-1in}
%\addtolength{\oddsidemargin}{0.505in}
%\setlength{\evensidemargin}{\oddsidemargin}
%\addtolength{\textheight}{0.2in}
%\addtolength{\topmargin}{-0.2in}
%\renewcommand{\baselinestretch}{.9}
%\headwidth=\textwidth

\addtolength{\headheight}{2.5pt}

% rename the bibliography section
\AtBeginDocument{\renewcommand{\refname}{Literature~Cited}}
%FIXME: something is going on with the bibliography style. Dunno what.

% UCTHESIS DOCUMENT CLASS -- Release info is below.
%    for LaTeX version 2e - 11/3/94
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{my_ucthesis} [2012/05/08 CTA 1996/06/26 JTW's modification of 1994/10/31 v3.0 University of California Thesis Class]

% stuff
%    ****************************************
%    *               OPTIONS                *
%    ****************************************
%
% Option values are now declared first thing.
% Options inclued 'Xpt [X=10,11,12]','final/draft','oneside/twoside',
% Defaults are set to 12 point, onesided, final (ie not draft) mode (BBF 10/31/94)
\newcommand\@ptsize{}
\newcommand\@draftmark{}
\newif\if@openright
\newif\if@mainmatter \@mainmattertrue
\DeclareOption{10pt}{\renewcommand\@ptsize{0}}
\DeclareOption{11pt}{\renewcommand\@ptsize{1}}
\DeclareOption{12pt}{\renewcommand\@ptsize{2}}
\DeclareOption{oneside}{\@twosidefalse \@mparswitchfalse}
\DeclareOption{twoside}{\@twosidetrue  \@mparswitchtrue}
\DeclareOption{draft}{\setlength\overfullrule{5pt}\renewcommand\@draftmark{1}}
\DeclareOption{final}{\setlength\overfullrule{0pt}\renewcommand\@draftmark{0}}
\DeclareOption{openright}{\if@twoside \@openrighttrue \else \@openrightfalse \fi}
\DeclareOption{openany}{\@openrightfalse}

\ExecuteOptions{12pt,oneside,final}
\ProcessOptions

% CHOOSING THE TYPE SIZE:
\input uct1\@ptsize.clo\relax

%    ****************************************
%    *            Some Definitions          *
%    ****************************************

\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
% For single and double spacing
% \smallssp is used to produce tabular environments in the small font.
% \scriptsizessp is a still smaller version of the same thing.
\def\ssp{\def\baselinestretch{1.0}\large\normalsize}
%\def\dsp{\def\baselinestretch{1.5}\large\normalsize}
\def\dsp{\def\baselinestretch{1.655}\large\normalsize}
\def\smallssp{\def\baselinestretch{1.0}\large\small}
\def\scriptsizessp{\def\baselinestretch{1.0}\large\scriptsize}

% PREPARING A FOREIGN LANGUAGE VERSION:
%
% This document style is for documents prepared in the English language.
% To prepare a version for another language, various English words must
% be replaced.  Many of the English words that required replacement are
% indicated below, where we give the name of the command in which the
% words appear, and which must be redefined, with the actual words
% underlined.
%
% Other English words that need replacement can be found in the macros
% supporting the title and approval pages.
%
\def\contentsname{Contents}
\def\listfigurename{List of Figures}
\def\listtablename{List of Tables}
\def\bibname{Bibliography}
\def\indexname{Index}
\def\figurename{Figure}
\def\tablename{Table}
\def\chaptername{Chapter}
\def\appendixname{Appendix}
\def\partname{Part}
\def\abstractname{Abstract}
\def\acknowledgename{Acknowledgements}
\def\disclaimername{Disclaimer}
\def\vitaename{Curriculum Vit\ae}
\def\@chapapp{\chaptername} % For use in the old 'book' style commands


%    ****************************************
%    *            PAGE STYLES               *
%    ****************************************
%  This section set the page size margins, header and footer according to the
%  UC recommendations
%
%
%\mark{{}{}}        % Initializes TeX's marks
\if@twoside         % If two-sided printing.
  \def\ps@headings{
      \def\@oddfoot{\rm\hfil\thepage\hfil}
      \def\@evenfoot{\rm\hfil\thepage\hfil}     % Page numbers on ALL pages.
      \def\@evenhead{\hfil\slshape\leftmark}%
      \def\@oddhead{{\slshape\rightmark}\hfil}%
      \let\@mkboth\markboth
    \def\chaptermark##1{%
      \markboth {\MakeUppercase{%
        \ifnum \c@secnumdepth >\m@ne
          \if@mainmatter
            \@chapapp\ \thechapter. \ %
          \fi
        \fi
        ##1}}{}}%
    \def\sectionmark##1{%
      \markright {\MakeUppercase{%
        \ifnum \c@secnumdepth >\z@
          \thesection. \ %
        \fi
        ##1}}}}
\else               % If one-sided printing.
  \def\ps@headings{%
    \def\@oddfoot{\rm\hfil\thepage\hfil}
    \def\@oddhead{{\slshape\rightmark}\hfil}%
    \let\@mkboth\markboth
    \def\chaptermark##1{%
      \markright {\MakeUppercase{%
        \ifnum \c@secnumdepth >\m@ne
          \if@mainmatter
            \@chapapp\ \thechapter. \ %
          \fi
        \fi
        ##1}}}}
\fi

% Definition of 'myheadings' page style.
%
\if@twoside         % If two-sided printing.
\def\ps@myheadings{\let\@mkboth\markboth
 \def\@oddfoot{\rm\hfil\thepage\hfil}
 \def\@evenfoot{\rm\hfil\thepage\hfil}     % Page numbers on ALL pages.
 \def\@evenhead{\hfil \slshape \leftmark}  %    Left heading.
 \def\@oddhead{{\slshape \rightmark}\hfil} %   Right heading.
 \def\chaptermark##1{\markboth {\uppercase{\ifnum \c@secnumdepth >\m@ne
 \@chapapp\ \thechapter. \ \fi} ##1}{}}%
 \def\sectionmark##1{\markright {\uppercase{\ifnum \c@secnumdepth >\z@
   \thesection. \ \fi} ##1}}}
\else               % If one-sided printing.
  \def\ps@myheadings{\let\@mkboth\markboth
  \def\@oddfoot{\rm\hfil\thepage\hfil}
  \def\@evenfoot{\rm\hfil\thepage\hfil}
  \def\@oddhead{{\slshape \leftmark}\hfil} % Heading.
  \def\chaptermark##1{\markboth {\uppercase{\ifnum \c@secnumdepth >\m@ne
  \@chapapp\ \thechapter. \ \fi} ##1}{}}}%
\fi

% Definition of 'plain' page style.
\def\ps@plain{\let\@mkboth\markboth
\def\@oddfoot{\rm\hfil\thepage\hfil}
\def\@evenfoot{\rm\hfil\thepage\hfil}           % page numbers in feet
\def\@oddhead{}\def\@evenhead{}
}
% Definition of 'empty' page style.
\def\ps@empty{\let\@mkboth\markboth
\def\@oddfoot{}\def\@evenfoot{}\def\@oddhead{}\def\@evenhead{}}

%    ****************************************
%    *             FRONT MATTER             *
%    ****************************************
%

% DECLARATIONS
%
% These macros are used to declare arguments needed for the
% construction of the front matter.

\def\degreemonth#1{\gdef\@degreemonth{#1}}  % degree month
\def\degreeyear#1{\gdef\@degreeyear{#1}}    % degree year
\def\defensemonth#1{\gdef\@defensemonth{#1}}% defense month
\def\defenseyear#1{\gdef\@defenseyear{#1}}  % defense year
\def\degree#1{\gdef\@degree{#1}}            % full (unabbreviated) name of the degree
\def\chair#1{\gdef\@chair{#1}}              % committee's chair
\def\othermemberA#1{\gdef\@othermemberA{#1}}% committe members, one per line
\def\othermemberB#1{\gdef\@othermemberB{#1}}
\def\othermemberC#1{\gdef\@othermemberC{#1}}
\def\othermemberD#1{\gdef\@othermemberD{#1}}
\def\othermembers#1{\gdef\@othermembers{#1}}%
\def\field#1{\gdef\@field{#1}}              % degree's field (e.g. Psychology, Computer Science)
\def\campus#1{\gdef\@campus{#1}}
\def\fmfont{\fontsize\@xiipt{14.5}\selectfont} % Set the font for frontmatter
\def\fmsmallfont{\fontsize\@xiipt{14pt}\selectfont}

% REPORT    type of report:Dissertation or dissertation or proposal etc...
\def\report#1{\gdef\@report{#1}}

% FRONTMATTER environment
%
% The FRONTMATTER environment makes sure that page numbering is set
% correctly (roman, lower-case, starting at 2) for the front matter.
% It also resets to arabic the page-numbering for the remainder of the dissertation.

%\newif\if@resttwoside
\newenvironment{frontmatter}{
  \renewcommand{\thepage}{\roman{page}}
  \pagestyle{plain}}
  {\newpage\renewcommand{\thepage}{\arabic{page}}\setcounter{page}{1}}

%%% TITLE PAGE %%%%
%%%%%%%%%%%%%%%%%%%
\def\maketitle{
{ \ssp
  \let\footnotesize\small \let\footnoterule\relax
  \thispagestyle{empty}
  \setcounter{page}{1}

  \null\vfil
  \begin{center}
    UNIVERSITY of CALIFORNIA \par \@campus \par
    \bigskip \medskip \vspace{6ex}
    \fmfont {\bfseries \Large {\@title} \par}   % Formatting of the Dissertation title
    \bigskip \medskip \vspace{6ex}
    A Dissertation submitted in partial satisfaction  \par
    \smallskip
    of the requirements for the degree \par
    \bigskip {\@degree} \par
    \smallskip in \par
    \smallskip {\@field} \par
    \bigskip \medskip by \par
    \bigskip \medskip {\@author} \par
  \end{center}
  {\vspace{6ex}
        Committee in Charge:
        \begin{quote}
          {\@chair}, Chair \\ {\@othermemberA} \\ {\@othermemberB} \\
          \ifnum \@numberofmembers > 3 {\@othermemberC} \\ \fi
          \ifnum \@numberofmembers > 4 {\@othermemberD} \\ \fi
          \ifnum \@numberofmembers > 5 {\@othermembers} \\  \fi
       \end{quote}
       \medskip
       \begin{center} {\@degreemonth~\@degreeyear}\end{center}
  }
  \vfil\null \setcounter{footnote}{0}
  \if@openright
    \clearpage \thispagestyle{empty} \mbox{} \newpage
  \fi
}}

% APPROVALPAGE
%
% The \approvalpage macro emits a UC-approved approval page ready for
% your committee's signature.  The number of committee members,
% affects both the number of lines and the amount of space between lines
% on the approval page.
\def\@numberofmembers{3}
\def\@approvalspace{.75}
\def\@approvaladjust{-1\@ptsize pt}
\def\numberofmembers#1{\gdef\@numberofmembers{#1}
\ifnum \@numberofmembers > 3
\gdef\@approvalspace{.5in}
\def\@approvaladjust{-1\@ptsize pt}
\fi}

\def\approvalpage{
  \newpage
  \thispagestyle{empty}
  \null\vfill
  \begin{center}
    {\fmfont The Dissertation of {\@author} is approved.} \\

    \vspace{.25in} \vspace{\@approvalspace}
    $\:\overline{~~~~ \mbox{\rule{0in}{0.16in} \hspace{3.5in}}}\:$ \\
    \vspace{\@approvaladjust} {\@othermemberA} \\

    \vspace{\@approvalspace}
    $\:\overline{~~~~ \mbox{\rule{0in}{0.16in} \hspace{3.5in}}}\:$ \\
    \vspace{\@approvaladjust} {\@othermemberB} \\

    \vspace{\@approvalspace}
    \ifnum \@numberofmembers > 3
      $\:\overline{~~~~ \mbox{\rule{0in}{0.16in} \hspace{3.5in}}}\:$ \\
      \vspace{\@approvaladjust} {\@othermemberC} \\
      \vspace{\@approvalspace}
    \fi

    \ifnum \@numberofmembers > 4
      $\:\overline{~~~~ \mbox{\rule{0in}{0.16in} \hspace{3.5in}}}\:$ \\
      \vspace{\@approvaladjust} {\@othermemberD} \\
      \vspace{\@approvalspace}
    \fi

    \ifnum \@numberofmembers > 5
      $\:\overline{~~~~ \mbox{\rule{0in}{0.16in} \hspace{3.5in}}}\:$ \\
      \vspace{\@approvaladjust} {\@othermembers} \\
      \vspace{\@approvalspace}
    \fi

    $\:\overline{~~~~ \mbox{\rule{0in}{0.16in} \hspace{3.15in}}}\:$ \\
    \vspace{\@approvaladjust} {\@chair}, Committee Chair \\
    \vspace{\@approvalspace}
    \vspace{-.25in}
    \vspace{\@approvalspace}
    {\fmfont \@defensemonth~\@defenseyear}
  \end{center}
  \vfill\null
%  \if@openright
%    \clearpage \thispagestyle{empty} \mbox{} \newpage
%  \fi
}

% COPYRIGHTPAGE
%
% While it's technically optional, you probably want a copyright page.
% This is a macro, not an environment, because it can be generated
% with the \title, \author, and \year macros.

\def\copyrightpage{
  \if@openright\cleardoublepage\else\clearpage\fi
  \begin{center}
      {\fmfont {\@title} \par
      \vspace{1in}  Copyright \copyright ~\@degreeyear\par
      \vspace{.1in} by\par
      \vspace{.1in} \@author}
  \end{center}
%  \if@openright
%      \clearpage \thispagestyle{empty} \mbox{} \newpage
%  \fi
}

% DEDICATION
\newenvironment{dedication}{
  \if@openright\cleardoublepage \else\clearpage \fi
}{}

% ACKNOWLEDGEMENTS
\newenvironment{acknowledgements}{
  \if@openright\cleardoublepage \else\clearpage \fi
  \begin{center} {\large \bfseries \acknowledgename}
  \end{center}
  \ifnum \@draftmark = 1    \ssp \else  \dsp \fi
}{}

% DISCLAIMER
\newenvironment{disclaimer}{
  \if@openright\cleardoublepage \else\clearpage \fi
  \begin{center} {\large \bfseries \disclaimername}
  \end{center}
  \ifnum \@draftmark = 1    \ssp \else  \dsp \fi
}{}

% VITAE
\newenvironment{vitae}{
  \if@openright\cleardoublepage \else\clearpage \fi
  \ssp
  \begin{center}
    {\large \bfseries \vitaename} \par
    {\large \@author}
  \end{center}
  \begin{list}{}{\leftmargin 0in \itemsep .2in}
  }{\end{list}
}{\par\vfil\null}
\newcommand{\vitaelabels}[1]{#1 \hfil}
\newenvironment{vitaesection}[1]{
  \item {\bf #1}
  \begin{list}{}{\leftmargin 1.5in \labelwidth 1.3in \labelsep .2in
  \parsep 0in
  \let\makelabel\vitaelabels}}{\end{list}}

% ABSTRACT
% The ABSTRACT environment allows for multi-page abstracts and needs the
% \title and \author macros
\def\abstract{
    \if@openright\cleardoublepage \else\clearpage \fi
    \begin{center}
      {\fmfont {\bfseries \abstractname}\par
      \vspace{.3in} \@title\par
      \vspace{.1in} by\par
      \vspace{.1in} \@author\par}
%      \vspace{.5in} \@title\par
%      \vspace{.1in} by\par
%      \vspace{.1in} \@author\par}
    \end{center}
    \ifnum \@draftmark = 1  \ssp \else  \dsp \fi
}{\par\vfil\null}


%    ****************************************
%    *             MAIN  MATTER             *
%    ****************************************
%

% MAINMATTER environment
%
% The MAINMATTER environment makes sure that for two side printing,
% the chapters start at odd pages, sets the pagenumbering and pagestyles
%

\newenvironment{mainmatter}{%
    \if@openright\cleardoublepage \else\clearpage \fi
    \ifnum \@draftmark = 1  \ssp \else  \dsp \fi
    \pagestyle{headings}
    \setcounter{page}{1}
    \pagenumbering{arabic}
}

%    ****************************************
%    *                LISTS                 *
%    ****************************************
%

\if@twocolumn
  \setlength\leftmargini  {2em}
\else
  \setlength\leftmargini  {2.5em}
\fi
\leftmargin  \leftmargini
\setlength\leftmarginii  {2.2em}
\setlength\leftmarginiii {1.87em}
\setlength\leftmarginiv  {1.7em}
\if@twocolumn
  \setlength\leftmarginv  {.5em}
  \setlength\leftmarginvi {.5em}
\else
  \setlength\leftmarginv  {1em}
  \setlength\leftmarginvi {1em}
\fi
\setlength  \labelsep  {.5em}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
\renewcommand\theenumi{\@arabic\c@enumi}
\renewcommand\theenumii{\@alph\c@enumii}
\renewcommand\theenumiii{\@roman\c@enumiii}
\renewcommand\theenumiv{\@Alph\c@enumiv}
\newcommand\labelenumi{\theenumi.}
\newcommand\labelenumii{(\theenumii)}
\newcommand\labelenumiii{\theenumiii.}
\newcommand\labelenumiv{\theenumiv.}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi(\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}
\newcommand\labelitemi{\textbullet}
\newcommand\labelitemii{\normalfont\bfseries \textendash}
\newcommand\labelitemiii{\textasteriskcentered}
\newcommand\labelitemiv{\textperiodcentered}

% DESCRIPTION, VERSE, QUOTE & QUOTATION
\newenvironment{description}
               {\list{}{\labelwidth\z@ \itemindent-\leftmargin
                        \let\makelabel\descriptionlabel}}
               {\endlist}
\newcommand*\descriptionlabel[1]{\hspace\labelsep
                                \normalfont\bfseries #1}
\newenvironment{verse}
               {\let\\\@centercr
                \list{}{\itemsep      \z@
                        \itemindent   -1.5em%
                        \listparindent\itemindent
                        \rightmargin  \leftmargin
                        \advance\leftmargin 1.5em}%
                \item\relax}
               {\endlist}
\newenvironment{quotation}
               {\list{}{\listparindent 1.5em%
                        \itemindent    \listparindent
                        \rightmargin   \leftmargin
                        \parsep        \z@ \@plus\p@}%
                \item\relax}
               {\endlist}
\newenvironment{quote}
               {\list{}{\rightmargin\leftmargin}%
                \item\relax}
               {\endlist}


% VERBATIM
\def\@verbatim{\trivlist\ssp \item[]\if@minipage\else\vskip\parskip\fi
\leftskip\@totalleftmargin\rightskip\z@
\parindent\z@\parfillskip\@flushglue\parskip\z@
\@@par
\@tempswafalse \def\par{\if@tempswa\hbox{}\fi\@tempswatrue\@@par
\penalty\interlinepenalty}%
\obeylines \ttfamily \catcode``=13 \@noligs \let\do\@makeother \dospecials}

% ARRAY AND TABULAR
%

\arraycolsep 5pt     % Half the space between columns in an array
                     % environment.
\tabcolsep 6pt       % Half the space between columns in a tabular
                     % environment.
\arrayrulewidth .4pt % Width of rules in array and tabular environment.
\doublerulesep 2pt   % Space between adjacent rules in array or tabular
                     % environment.

% We have to redefine array here in order to make it single-spaced.
% (Not sure if this is really necessary.)
\def\array{\let\@acol\@arrayacol \let\@classz\@arrayclassz
 \let\@classiv\@arrayclassiv \let\\\@arraycr\let\@halignto\@empty\@tabarray}

% TABBING
%
\tabbingsep \labelsep   % Space used by the \' command.
                        %  (See LaTeX manual.)

% We have to redefine tabular here in order to make it single-spaced.
\def\tabular{\par\ssp\let\@halignto\@empty\@tabular}
\expandafter \def\csname tabular*\endcsname #1%
{\par\ssp\def\@halignto{to#1}\@tabular}

% \smalltabular and \smalltabular* are alternative tabular styles
% in the \small font.  They are required because single-spacing implies a
% change of font to a particular size.
% EVM, 7/20/93
\def\smalltabular{\par\smallssp\let\@halignto\@empty\@tabular}
\def\endsmalltabular{\endtabular}
\expandafter \def\csname smalltabular*\endcsname #1%
{\par\smallssp\def\@halignto{to#1}\@tabular}
\expandafter \let \csname endsmalltabular*\endcsname = \endtabular

% \scriptsizetabular and \scriptsizetabular* are analogs of \smalltabular
\def\scriptsizetabular{\par\scriptsizessp\let\@halignto\@empty\@tabular}
\def\endscriptsizetabular{\endtabular}
\expandafter \def\csname scriptsizetabular*\endcsname #1%
{\par\scriptsizessp\def\@halignto{to#1}\@tabular}
\expandafter \let \csname endscriptsizetabular*\endcsname = \endtabular

% MINIPAGE
%  \@minipagerestore is called upon entry to a minipage environment to
%  set up things that are to be handled differently inside a minipage
%  environment. In the current styles, it does nothing.
%
% \skip\@mpfootins : plays same role for footnotes in a minipage as
%                    \skip\footins does for ordinary footnotes

\skip\@mpfootins = \skip\footins

% FRAMEBOX
%
\fboxsep = 3pt    % Space left between box and text by \fbox and
                  % \framebox.
\fboxrule = .4pt  % Width of rules in box made by \fbox and \framebox.


%    ****************************************
%    *        CHAPTERS AND SECTIONS         *
%    ****************************************
%
% DEFINE COUNTERS:
%
% \newcounter{NEWCTR}[OLDCTR] : Defines NEWCTR to be a counter, which is
%                               reset to zero when counter OLDCTR is
%                               stepped.
%                               Counter OLDCTR must already be defined.

% Must redefine chapter so that we always get a 'completely' blank page in twosideprinting.
\renewcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi
                    \thispagestyle{plain}%
                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef\@chapter\@schapter}

% Must redefine @startsection so that we always get indentation.
\def\@startsection#1#2#3#4#5#6{\if@noskipsec \leavevmode \fi
   \par \@tempskipa #4\relax
   \@afterindenttrue
   \ifdim \@tempskipa <\z@ \@tempskipa -\@tempskipa \relax\fi
   \if@nobreak \everypar{}\else
     \addpenalty{\@secpenalty}\addvspace{\@tempskipa}\fi \@ifstar
     {\@ssect{#3}{#4}{#5}{#6}}{\@dblarg{\@sect{#1}{#2}{#3}{#4}{#5}{#6}}}}

%% Redefine @sect so that the abbreviated name is used only for %%
%% the page heading, and the full name goes into the table of   %%
%% contents -- JTW                                              %%

\def\@sect#1#2#3#4#5#6[#7]#8{\ifnum #2>\c@secnumdepth
     \let\@svsec\@empty\else
     \refstepcounter{#1}%
     \let\@@protect\protect
     \def\protect{\noexpand\protect\noexpand}%
     \edef\@svsec{\@seccntformat{#1}}%
     \let\protect\@@protect\fi
     \@tempskipa #5\relax
      \ifdim \@tempskipa>\z@
        \begingroup #6\relax
          \@hangfrom{\hskip #3\relax\@svsec}%
                    {\interlinepenalty \@M #8\par}%
        \endgroup
       \csname #1mark\endcsname{#7}\addcontentsline
         {toc}{#1}{\ifnum #2>\c@secnumdepth \else
                      \protect\numberline{\csname the#1\endcsname}\fi
%%                     #7}\else
                    #8}\else
        \def\@svsechd{#6\hskip #3\relax  %% \relax added 2 May 90
                   \@svsec #8\csname #1mark\endcsname
                      {#7}\addcontentsline
                           {toc}{#1}{\ifnum #2>\c@secnumdepth \else
                           \protect\numberline{\csname the#1\endcsname}%
                                     \fi
%%                        #7}}\fi
                       #8}}\fi
     \@xsect{#5}}


\newcounter {part}
\newcounter {chapter}
\newcounter {section}[chapter]
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\newcounter {paragraph}[subsubsection]
\newcounter {subparagraph}[paragraph]

% For any counter CTR, \theCTR is a macro that defines the printed
% version of counter CTR.  It is defined in terms of the following
% macros:
%
%  \arabic{COUNTER} : The value of COUNTER printed as an arabic numeral.
%  \roman{COUNTER}  : Its value printed as a lower-case roman numberal.
%  \Roman{COUNTER}  : Its value printed as an upper-case roman numberal.
%  \alph{COUNTER}   : Value of COUNTER printed as a lower-case letter:
%                         1 = a, 2 = b, etc.
%  \Alph{COUNTER}   : Value of COUNTER printed as an upper-case letter:
%                           1 = A, 2 = B, etc.
%

\def\thepart          {\Roman{part}}
\def\thechapter       {\arabic{chapter}}
\def\thesection       {\thechapter.\arabic{section}}
\def\thesubsection    {\thesection.\arabic{subsection}}
\def\thesubsubsection {\thesubsection .\arabic{subsubsection}}
\def\theparagraph     {\thesubsubsection.\arabic{paragraph}}
\def\thesubparagraph  {\theparagraph.\arabic{subparagraph}}


%% Kludge to get multiple appendices lettered rather than numbered %%
%% Added by John T. Whelan 1996 June 21                            %%
%% Added forced single spacing by Ashish A., removed               %%
%% the \appendixon, changed it to \appendix     - 2002 July 18     %%

%\newcommand{\appendixon}{
%    \def\thesection{\thechapter.\Alph{section}}
%    \setcounter{section}{0}
%}
\renewcommand\appendix{\par
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \def\@chapapp{\appendixname}%
  \def\thechapter{\@Alph\c@chapter}
  \ssp}

\newcommand{\appendixoff}{
    \def\thesection{\thechapter.\arabic{section}}
    \ifnum \@draftmark = 1  \ssp \else  \dsp \fi
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                        PART                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\def\part{\cleardoublepage   % Starts new page.
   \thispagestyle{plain}%    % Page style of part page is 'plain'
   \if@twocolumn             % IF two-column style
     \onecolumn              %  THEN \onecolumn
     \@tempswatrue           %       @tempswa := true
  \else
  \@tempswafalse             %  ELSE @tempswa := false
  \fi                        % FI
  \hbox{}\vfil               % Add fil glue to center title
%%  \bgroup  \centering      % BEGIN centering %% Removed 19 Jan 88
  \secdef\@part\@spart}

\def\@part[#1]#2{\ifnum \c@secnumdepth >-2\relax  % IF secnumdepth > -2
        \refstepcounter{part}%                    %   THEN step
                                                  %         part counter
        \addcontentsline{toc}{part}{\partname~\thepart      %        add toc line
        \hspace{1em}#1}\else                      %   ELSE add
                                                  %         unnumb. line
        \addcontentsline{toc}{part}{#1}\fi        % FI
   \markboth{}{}%
   {\centering                       % %% added 19 Jan 88
    \interlinepenalty \@M            %% RmS added 11 Nov 91
    \ifnum \c@secnumdepth >-2\relax  % IF secnumdepth > -2
      \huge\bfseries \partname~\thepart    %   THEN Print '\partname' and
    \par                             %         number in \huge bold.
    \vskip 20\p@\fi                  %        Add space before title.
    \Huge \bfseries                        % FI
    #2\par}\@endpart}                % Print Title in \Huge bold.
                                     % Bug Fix 13 Nov 89: #1 -> #2

\def\@endpart{\vfil\newpage \if@twoside \hbox{} \thispagestyle{empty}
\newpage
\fi \if@tempswa \twocolumn \fi}

%    ****************************************
%    *         TABLE OF CONTENTS, ETC.      *
%    ****************************************
%
% A \subsection command writes a
%       \contentsline{subsection}{TITLE}{PAGE}
% command on the .toc file, where TITLE contains the contents of the
% entry and PAGE is the page number.  If subsections are being numbered,
% then TITLE will be of the form
%       \numberline{NUM}{HEADING}
% where NUM is the number produced by \thesubsection.  Other sectioning
% commands work similarly.
%
% A \caption command in a 'figure' environment writes
%    \contentsline{figure}{\numberline{NUM}{CAPTION}}{PAGE}
% on the .lof file, where NUM is the number produced by \thefigure and
% CAPTION is the figure caption.  It works similarly for a 'table'
% environment.
%
% The command \contentsline{NAME} expands to \l@NAME.  So, to specify
% the table of contents, we must define \l@chapter, \l@section,
% \l@subsection, ... ; to specify the list of figures, we must define
% \l@figure; and so on.  Most of these can be defined with the
% \@dottedtocline command, which works as follows.
%
% \@dottedtocline{LEVEL}{INDENT}{NUMWIDTH}{TITLE}{PAGE}
%    LEVEL    : An entry is produced only if LEVEL < or = value of
%               'tocdepth' counter.  Note, \chapter is level 0, \section
%               is level 1, etc.
%    INDENT   : The indentation from the outer left margin of the start
%               of the contents line.
%    NUMWIDTH : The width of a box in which the section number is to go,
%               if TITLE includes a \numberline command.
%
% This command uses the following three parameters, which are set
% with a \def (so em's can be used to make them depend upon the font).
%   \@pnumwidth : The width of a box in which the page number is put.
%   \@tocrmarg  : The right margin for multiple line entries.  One
%                 wants \@tocrmarg > or = \@pnumwidth
%   \@dotsep    : Separation between dots, in mu units.  Should be
%                 \def'd to a number like 2 or 1.7

\def\@pnumwidth{1.55em}
\def\@tocrmarg {2.55em}
\def\@dotsep{4.5}
\setcounter{tocdepth}{1}


% TABLEOFCONTENTS
%  In ucthesis style, \tableofcontents, \listoffigures, etc. are always
%  set in single-column style.  @restonecol

\def\tableofcontents{\@restonecolfalse
  \if@twocolumn\@restonecoltrue\onecolumn\fi
  \chapter*{\contentsname
        \@mkboth{\uppercase{\contentsname}}{\uppercase{\contentsname}}}%
  {\ssp\@starttoc{toc}}\if@restonecol\twocolumn\fi}

\def\l@part#1#2{\addpenalty{-\@highpenalty}%
   \addvspace{2.25em plus\p@}% space above part line
   \begingroup
   \@tempdima 3em         % width of box holding part number, used by
     \parindent \z@ \rightskip \@pnumwidth             %% \numberline
     \parfillskip -\@pnumwidth
     {\large \bfseries          % set line in \large boldface
     \leavevmode          % TeX command to enter horizontal mode.
     #1\hfil \hbox to\@pnumwidth{\hss #2}}\par
     \nobreak             % Never break after part entry
    \global\@nobreaktrue                        %% Added 24 May 89 as
    \everypar{\global\@nobreakfalse\everypar{}}%% suggested by
                                               %% Jerry Leichter
   \endgroup}

%% First line of l@chapter changed 24 May 89, as suggested
%% by Jerry Leichter.
%%
\def\l@chapter#1#2{\addpenalty{-\@highpenalty}%
   \vskip 1.0em plus\p@   % space above chapter line
   \@tempdima 1.5em       % width of box holding chapter number
   \begingroup
     \parindent \z@ \rightskip \@pnumwidth
     \parfillskip -\@pnumwidth
     \bfseries                  % Boldface.
     \leavevmode          % TeX command to enter horizontal mode.
      \advance\leftskip\@tempdima  %% added 5 Feb 88 to conform to
      \hskip -\leftskip            %% 25 Jan 88 change to \numberline
     #1\nobreak\hfil \nobreak\hbox to\@pnumwidth{\hss #2}\par
     \penalty\@highpenalty %% added 24 May 89, suggested by J. Leichter
   \endgroup}

\def\l@section{\@dottedtocline{1}{1.5em}{2.3em}}
\def\l@subsection{\@dottedtocline{2}{3.8em}{3.2em}}
\def\l@subsubsection{\@dottedtocline{3}{7.0em}{4.1em}}
\def\l@paragraph{\@dottedtocline{4}{10em}{5em}}
\def\l@subparagraph{\@dottedtocline{5}{12em}{6em}}

% LIST OF FIGURES
%
% Single-space list of figures, add it to the table of contents.
\def\listoffigures{\@restonecolfalse
  \if@twocolumn\@restonecoltrue\onecolumn\fi
  \chapter*{\listfigurename\@mkboth{\uppercase{\listfigurename}}%
  {\uppercase{\listfigurename}}}
   \addcontentsline{toc}{chapter}{\listfigurename}
   {\ssp\@starttoc{lof}}\if@restonecol
    \twocolumn\fi}

\def\l@figure{\@dottedtocline{1}{1.5em}{2.3em}}

% LIST OF TABLES
%
\def\listoftables{\@restonecolfalse
  \if@twocolumn\@restonecoltrue\onecolumn\fi
  \chapter*{\listtablename\@mkboth{\uppercase{\listtablename}}%
   {\uppercase{\listtablename}}}\@starttoc{lot}\if@restonecol
  \twocolumn\fi}
\def\listoftables{\@restonecolfalse
  \if@twocolumn\@restonecoltrue\onecolumn\fi
  \chapter*{\listtablename\@mkboth{\uppercase{\listtablename}}%
{\uppercase{\listtablename}}}
   \addcontentsline{toc}{chapter}{\listtablename}
   {\ssp\@starttoc{lot}}\if@restonecol
  \twocolumn\fi}


\let\l@table\l@figure



%    ****************************************
%    *             BIBLIOGRAPHY             *
%    ****************************************
%
% The thebibliography environment executes the following commands:
%
%  \def\newblock{\hskip .11em plus .33em minus .07em} --
%      Defines the `closed' format, where the blocks (major units of
%      information) of an entry run together.
%
%  \sloppy  -- Used because it's rather hard to do line breaks in
%      bibliographies,
%
%  \sfcode`\.=1000\relax --
%      Causes a `.' (period) not toproduce an end-of-sentence space.

%% RmS 91/10/27 [ .. ] replaced by \@biblabel{ .. }
%% RmS 91/11/13: Changed counter enumi to enumiv,
%%               as it says in the comment in latex.tex
%% RmS 92/01/14: Set \p@enumiv to {} and \theenumiv to \arabic{enumiv}
%%               to get correct references
%% RmS 02/07/18: Force biblio to be single spaced (and revert back to double if draft
\def\thebibliography#1{\chapter*{\bibname\@mkboth{%
\uppercase{\bibname}}{\uppercase{\bibname}}}
  \addcontentsline{toc}{chapter}{\bibname}
  \list{\@biblabel{\arabic{enumiv}}}{\settowidth\labelwidth{\@biblabel{#1}}%
    \leftmargin\labelwidth
    \advance\leftmargin\labelsep
    \usecounter{enumiv}%
    \let\p@enumiv\@empty
    \def\theenumiv{\arabic{enumiv}}}%
    \def\newblock{\hskip .11em plus.33em minus.07em}%
    \sloppy\clubpenalty4000\widowpenalty4000
    \sfcode`\.=\@m
    \ssp}


%% 91/08/26 FMI & RmS: introduced warning instead of error

\def\endthebibliography{%
  \def\@noitemerr{\@warning{Empty `thebibliography' environment}}%
  \endlist
  \ifnum \@draftmark = 1    \ssp \else  \dsp \fi
}


% \def\@biblabel#1{[#1]\hfill}  % Produces the label for a \bibitem[...]
                                % command.
% \def\@cite#1{[#1]}            % Produces the output of the \cite
                                % command.



%    ****************************************
%    *              THE INDEX               *
%    ****************************************
%
% THE THEINDEX ENVIRONMENT
% Produces double column format, with each paragraph a separate entry.
% The user commands \item, \subitem and \subsubitem are used to
% produce the entries, and \indexspace adds an extra vertical space
% that's the right size to put above the first entry with a new letter
% of the alphabet.

\newif\if@restonecol

\def\theindex{\@restonecoltrue\if@twocolumn\@restonecolfalse\fi
\columnseprule \z@
\columnsep 35\p@\twocolumn[\@makeschapterhead{\indexname}]%
    \@mkboth{\uppercase{\indexname}}{\uppercase{\indexname}}%
    \thispagestyle{plain}\parindent\z@
    \parskip\z@ plus .3\p@\relax\let\item\@idxitem}

\def\@idxitem{\par\hangindent 40\p@}

\def\subitem{\par\hangindent 40\p@ \hspace*{20\p@}}

\def\subsubitem{\par\hangindent 40\p@ \hspace*{30\p@}}

\def\endtheindex{\if@restonecol\onecolumn\else\clearpage\fi}

\def\indexspace{\par \vskip 10\p@ plus5\p@ minus3\p@\relax}


%    ****************************************
%    *             FOOTNOTES                *
%    ****************************************
%
% \footnoterule is a macro to draw the rule separating the footnotes
% from the text.  It should take zero vertical space, so it needs a
% negative skip to compensate for any positive space taken by the rule.
% (See PLAIN.TEX.)

\def\footnoterule{\kern-3\p@
  \hrule width .4\columnwidth
  \kern 2.6\p@}                 % The \hrule has default height of .4pt.

% \newcounter{footnote}
\@addtoreset{footnote}{chapter}  % Numbers footnotes within chapters

%   \@makefntext{NOTE} :
%        Must produce the actual footnote, using \@thefnmark as the mark
%        of the footnote and NOTE as the text.  It is called when
%        effectively inside a \parbox of width \columnwidth (i.e., with
%        \hsize = \columnwidth).
%
%        The following macro indents all lines of the footnote by 10pt,
%        and indents the first line of a new paragraph by 1em.  To
%        change these dimensions, just substitute the desired value for
%        '10pt' [in both places] or '1em'.  The mark is flushright
%        against the footnote.
%          \long\def\@makefntext#1{\@setpar{\@@par\@tempdima \hsize
%             \advance\@tempdima-10pt\parshape \@ne 10pt \@tempdima}\par
%             \parindent 1em\noindent
%             \hbox to \z@{\hss$\m@th^{\@thefnmark}$}#1}
%
%        A simpler macro is used, in which the footnote text is
%        set like an ordinary text paragraph, with no indentation except
%        on the first line of a paragraph, and the first line of the
%        footnote.  Thus, all the macro must do is set \parindent
%        to the appropriate value for succeeding paragraphs and put the
%        proper indentation before mark.

\long\def\@makefntext#1{\parindent 1em\noindent
            \hbox to 1.8em{\hss$\m@th^{\@thefnmark}$}#1}

% \@makefnmark : A macro to generate the footnote marker that goes
%    in the text.  Default used.
%


% Single-space footnotes.
\long\def\@footnotetext#1{\insert\footins{\ssp\reset@font\footnotesize
    \interlinepenalty\interfootnotelinepenalty
    \splittopskip\footnotesep
    \splitmaxdepth \dp\strutbox \floatingpenalty \@MM
    \hsize\columnwidth \@parboxrestore
   \edef\@currentlabel{\csname p@footnote\endcsname\@thefnmark}\@makefntext
    {\rule{\z@}{\footnotesep}\ignorespaces
      #1\strut}}}

%    ****************************************
%    *         FIGURES AND TABLES           *
%    ****************************************
%
% Float placement parameters.  See LaTeX manual for their definition.
%
\setcounter{topnumber}{2}
\def\topfraction{.7}
\setcounter{bottomnumber}{1}
\def\bottomfraction{.3}
\setcounter{totalnumber}{3}
\def\textfraction{.2}
\def\floatpagefraction{.5}
\setcounter{dbltopnumber}{2}
\def\dbltopfraction{.7}
\def\dblfloatpagefraction{.5}

% \@makecaption{NUMBER}{TEXT} : Macro to make a figure or table caption.
%      NUMBER : Figure or table number--e.g., 'Figure 3.2'
%      TEXT   : The caption text.
%  Macro should be called inside a \parbox of right width, with
%  \normalsize.
% changed 25 Jun 86 to fix according to Howard Trickey:
% instead of \unhbox\@tempboxa\par we do #1: #2\par

% 15 Nov 93: further changes to support captions BEFORE the figure
% or table.  Changes suggested by Donald Arseneau, installed by Ethan
% Munson.  Detailed reasons are:
%   The \unhbox allows \vadjust material (\vspace) to get out;
%   the \vbox to\topskip{} is for captions at the top of top-floats;
%   the \ifdim is for captions above the figure or table;
%   the strut is for tables below the caption.

%% The following makecaption macro created by Ashish Singhal, 10/06/2000
%% Needs to use package tabularx
\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{10\p@}
\setlength\belowcaptionskip{0\p@}
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{\smallssp {#1}: #2}%
    % Changed by Ashish A. for smaller font size
%  \sbox\@tempboxa{\scriptsizessp {#1}: #2}%
  \ifdim \wd\@tempboxa >\hsize
   \hbox to\hsize{\hfil{\parbox{0.9\textwidth}{\smallssp\unhbox\@tempboxa}}\hfil}
%        \smallssp {#1}: {#2}
  \else
   \hbox to\hsize{\hfil\box\@tempboxa\hfil}
%    \global \@minipagefalse
%    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}


%% ------------------------------------------

% To define a float of type TYPE (e.g., TYPE = figure), the document
% style must define the following.
%
%  \fps@TYPE   : The default placement specifier for floats of type
%                TYPE.
%
% \ftype@TYPE : The type number for floats of type TYPE.  Each TYPE
%                has associated a unique positive TYPE NUMBER, which
%                is a power of two.  E.g., figures might have type
%                number 1, tables type number 2, programs type number
%                4, etc.
%
% \ext@TYPE : The file extension indicating the file on which the
%                contents list for float type TYPE is stored.  For
%                example, \ext@figure = 'lof'.
%
%  \fnum@TYPE  : A macro to generate the figure number for a caption.
%                For example, \fnum@TYPE == Figure \thefigure.
%
%  The actual float-making environment commands--e.g., the commands
%  \figure and \endfigure--are defined in terms of the macros \@float
%  and \end@float, which are described below.
%
% \@float{TYPE}[PLACEMENT] : Macro to begin a float environment for a
%     single-column float of type TYPE with PLACEMENT as the placement
%     specifier.  The default value of PLACEMENT is defined by
%     \fps@TYPE.  The environment is ended by \end@float.  E.g.,
%     \figure == \@float{figure}, \endfigure == \end@float.


% FIGURE

\newcounter{figure}[chapter]
\def\thefigure{\thechapter.\@arabic\c@figure}

\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename~\thefigure}
\def\figure{\@float{figure}}
\let\endfigure\end@float
\@namedef{figure*}{\@dblfloat{figure}}
\@namedef{endfigure*}{\end@dblfloat}

% TABLE
%
\newcounter{table}[chapter]
\def\thetable{\thechapter.\@arabic\c@table}

\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename~\thetable}
\def\table{\@float{table}}
\let\endtable\end@float
\@namedef{table*}{\@dblfloat{table}}
\@namedef{endtable*}{\end@dblfloat}

%    ****************************************
%    *            MISCELLANEOUS             *
%    ****************************************
%
% DATE
%
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}
\def\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}

% EQUATION and EQNARRAY -- put here because it must follow \chapter
% definition
%
% \newcounter{equation}
%
\@addtoreset{equation}{chapter}   % Makes \chapter reset 'equation'
                                  % counter.
\def\theequation{\thechapter.\arabic{equation}}

%    ****************************************
%    *            PROOF, QED and Theorem    *
%    ****************************************

\def\QED{\mbox{\rule[0pt]{1.5ex}{1.5ex}}}
\def\proof{\noindent\hspace{2em}{\it Proof: }}
\def\endproof{\hspace*{\fill}~\QED\par\endtrivlist\unskip}


%    ****************************************
%    *           INITIALIZATION             *
%    ****************************************
%
% Default initializations

\ps@plain                   % plain page style
\pagenumbering{arabic}      % Arabic page numbers
\if@twoside\else\raggedbottom\fi % Ragged bottom unless twoside
\ifnum \@draftmark = 1  \ssp \else  \dsp \fi

%\setlength\lineskip{1\p@}
\setlength\lineskip{0.8\p@}
\setlength\parindent{0.25in}
\setlength\paperheight {11in}%
\setlength\paperwidth  {8.5in}

%% change sizes and margins
%\topmargin      0.25in
%\oddsidemargin  0.5in
%\evensidemargin 0.25in
%\textheight     7.75in
%\textwidth      5.75in
%\headsep        25pt
%\headheight     12pt
%\marginparsep  12pt
%\marginparwidth    54pt
%\footskip      0.5in


\endinput

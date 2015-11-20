%
% lboro v2.0
% Developed by Gary Bennett <g.bennett-13@student.lboro.ac.uk>
%
% Originally created for Computer Science MSci Thesis at Loughboroough University.
%
%---------------------------- Identification -----------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{lboro}[2014/12/24 v1.0 lboro thesis class]
%-------------------------------------------------------------------------------

\newif\if@tableenvironment
\@tableenvironmentfalse

\newif\if@numchapter
\@numchapterfalse

\ProcessOptions\relax

\LoadClass[a4paper,twoside]{report}

%---------------------------- Packages -----------------------------------------
\RequirePackage{color}
%-------------------------------------------------------------------------------

%- Page Margins ----------------------------------------------------------------
\setlength{\textwidth}{140mm}
\setlength{\textheight}{227mm}
\setlength{\topmargin}{0\p@}
\setlength\oddsidemargin{10mm}
\setlength\evensidemargin{10mm}
\setlength\marginparwidth{35mm}
\setlength\headsep{12\p@}
%-------------------------------------------------------------------------------

%--------------------------- Declarations --------------------------------------
\def\degree#1{\gdef\@degree{#1}}
\def\subtitle#1{\gdef\@subtitle{#1}}
\def\submitdate#1{\gdef\@submitdate{#1}}
%-------------------------------------------------------------------------------

\gdef\@degree{}
\gdef\@subtitle{}
\gdef\@submitdate{}

\AtBeginDocument%
{%
  \let\@uthor\@author%
  \let\@itle\@title%
  \let\@ate\@date%
}%

%--------------------------- Font && Linespacing -------------------------------
\renewcommand\normalsize%
{%
  \@setfontsize\normalsize\@xpt\@xiipt%
  \abovedisplayskip 10\p@%
  \abovedisplayshortskip \z@%
  \belowdisplayshortskip 6\p@%
  \belowdisplayskip \abovedisplayskip%
  \let\@listi\@listI%
}%

\renewcommand\small%
{%
  \@setfontsize\small{8.5}{10}%
  \abovedisplayskip 8.5\p@%
  \abovedisplayshortskip \z@%
  \belowdisplayshortskip 4\p@%
  \def\@listi%
    {%
      \leftmargin\leftmargini%
      \parsep \z@ \@plus\p@ \@minus\p@%
      \topsep 6\p@ \@plus2\p@ \@minus4\p@%
      \itemsep\z@
    }%
  \belowdisplayskip \abovedisplayskip%
}%

\let\footnotesize=\small
\renewcommand\Large{\@setfontsize\large{14}{16}}
\newcommand\LArge{\@setfontsize\Large{16}{18}}
\renewcommand\LARGE{\@setfontsize\LARGE{18}{20}}

\newcommand{\normallinespacing}{\renewcommand{\baselinestretch}{1.5}\normalsize}
\newcommand{\mediumlinespacing}{\renewcommand{\baselinestretch}{1.2}\normalsize}
\newcommand{\narrowlinespacing}{\renewcommand{\baselinestretch}{1.1}\normalsize}
%-------------------------------------------------------------------------------


%---------------------------- Section Style ------------------------------------
\newcommand{\partnumsize}{\LArge}
\newcommand{\partnumstyle}{\bfseries\boldmath}
\newcommand{\partsize}{\LARGE}
\newcommand{\partstyle}{\bfseries\boldmath}
\newcommand{\chapnumsize}{\Large}
\newcommand{\chapnumstyle}{\bfseries\boldmath}
\newcommand{\chapsize}{\LArge}
\newcommand{\chapstyle}{\bfseries\boldmath}
\newcommand{\chapauthsize}{\normalsize}
\newcommand{\chapauthstyle}{\bfseries\boldmath}
\newcommand{\mottosize}{\small}
\newcommand{\mottostyle}{\itshape\unboldmath\raggedright}
\newcommand{\secsize}{\large}
\newcommand{\secstyle}{\bfseries\boldmath}
\newcommand{\subsecsize}{\large}
\newcommand{\subsecstyle}{\bfseries\itshape\boldmath}
\newcommand{\subsubsecstyle}{\bfseries\boldmath}


\renewcommand\section%
{%
  \@startsection{section}{1}{\z@}%
  {-30\p@}%
  {16\p@}%
  {\normalfont\secsize\secstyle\rightskip=\z@%
    \@plus 8em\pretolerance=10000}%
}%


\renewcommand\subsection%
{%
  \@startsection{subsection}{2}{\z@}%
  {-30\p@}%
  {16\p@}%
  {\normalfont\subsecsize\subsecstyle\rightskip=\z@%
    \@plus 8em\pretolerance=10000}%
}%


\renewcommand\subsubsection%
{%
  \@startsection{subsubsection}{3}{\z@}%
  {-24\p@}%
  {12\p@}%
  {\normalfont\normalsize\subsubsecstyle\rightskip=\z@%
    \@plus 8em\pretolerance=10000}%
}%
%-------------------------------------------------------------------------------


%--------------------------- Environments && Definitions -----------------------
\def\maketitle%
{%
  {%
    \thispagestyle{empty}%
    \addtocounter{page}\m@ne%
    {%
      \noindent%
      \LARGE%
      \lineskip .5em%
      \@author%
      \par%
    }%
    \vskip 2cm%
    {%
      \noindent\Huge\bfseries\@title \par%
    }
    \vskip 1cm%
    \if!\@subtitle!\else
      {%
        \noindent%
        \LARGE%
        \ignorespaces%
        \@subtitle%
        \par%
      }%
      \vskip 1cm%
    \fi
    \if!\@date!\else
      {%
        \noindent%
        \@date%
        \par%
        \vskip 1.5em%
      }%
    \fi
    \if!\@submitdate!\else
      {%
        \noindent%
        \@submitdate%
        \par%
        \vskip 1.5em%
      }%
    \fi
    \if!\@degree!\else
      {%
        \noindent%
        \@degree%
        \par%
        \vskip 1.5em%
      }%
    \fi
    \vfill%
    {%
      \noindent%
      \Large%
      \bfseries%
      Loughborough University%
      \par%
    }%
    \clearpage%
  }%
}


\def\frontmatter%
{%
  \clearpage
  \@numchapterfalse
  \normalsize
  \pagenumbering{roman}
  \pagestyle{frontmatterpagestyle}
}%


\def\mainmatter%
{%
  \clearpage
  \@numchaptertrue
  \normalsize
  \pagenumbering{arabic}
  \pagestyle{mainmatterpagestyle}
}%


\def\backmatter%
{%
  \clearpage
  \@numchaptertrue
  \normalsize
}%


\newenvironment{dedication}%
{%
  \clearpage
  \thispagestyle{empty}
  \vspace*{\stretch{1}}
  \itshape
  \centering
}%
{%
  \par
  \vspace{\stretch{3}}
  \clearpage
}%


\newenvironment{acknowledgement}%
{%
  \addtocounter{page}
  \m@ne
  \clearpage
  \chapter*{Acknowledgements}
  \addcontentsline{toc}{chapter}{Acknowledgements}
}%
{%
  \par
  \clearpage
}%


\renewenvironment{abstract}%
{%
  \clearpage
  \chapter*{Abstract}
  \addcontentsline{toc}{chapter}{Abstract}
}%
{%
  \par
  \clearpage
}%


\definecolor{shadecolor}{gray}{.90}%
\newenvironment{graybox}%
{%
  \fboxsep=12pt\relax%
  \begin{shaded}%
  \list{}{\leftmargin=12pt\rightmargin=2\leftmargin\leftmargin=\z@\topsep=\z@\relax}%
  \expandafter\item\parindent%
  \listparindent%
}%
{%
  \endlist%
  \end{shaded}%
}%


\def\fps@figure{htbp}
\def\fps@table{htbp}


\def\mpicplace#1#2%
{%
  \vbox%
  {%
    \hbox to #1{\vrule\@width \fboxrule \@height #2\hfill}%
  }%
}%


\@ifundefined{floatlegendstyle}{\def\floatlegendstyle{\bfseries}}{}
\def\floatcounterend{\enspace}
\def\capstrut{\vrule\@width\z@\@height\topskip}
\@ifundefined{captionstyle}{\def\captionstyle{\normalfont\small}}{}
\@ifundefined{instindent}{\newdimen\instindent}{}


\long\def\@caption#1[#2]#3%
{%
  \par\addcontentsline%
    {\csname ext@#1\endcsname}{#1}%
    {\protect\numberline{\csname the#1\endcsname}{\ignorespaces#2}}
  \begingroup%
    \@parboxrestore%
    \if@minipage%
      \@setminipage%
    \fi%
    \@makecaption{\csname fnum@#1\endcsname}{\ignorespaces #3}%
    \par%
  \endgroup%
}%


\let\oldtable\table
\let\oldendtable\endtable
\renewenvironment{table}%
{%
  \oldtable%
  \@tableenvironmenttrue%
}%
{%
  \@tableenvironmentfalse%
  \oldendtable%
}%


\newdimen\figcapgap\figcapgap=5\p@
\newdimen\tabcapgap\tabcapgap=3\p@


\long\def\@makecaption#1#2%
{%
  \captionstyle%
  \if@tableenvironment%
    {{\floatlegendstyle #1\floatcounterend}\capstrut #2}%
  \else%
    \centering%
    {{\floatlegendstyle #1\floatcounterend}\capstrut #2}%
  \fi%
}%


\newcounter{merk}
\def\endfigure{\resetsubfig\end@float}
\@namedef{endfigure*}{\resetsubfig\end@dblfloat}
\def\resetsubfig{\global\let\last@subfig=\undefined}
\def\r@setsubfig{\xdef\last@subfig{\number\value{figure}}%
\setcounter{figure}{\value{merk}}%
\setcounter{merk}{0}}


\def\subfigures%
{%
  \refstepcounter{figure}%
  \@tempcnta=\value{merk}%
  \setcounter{merk}{\value{figure}}%
  \setcounter{figure}{\the\@tempcnta}%
  \def\thefigure{\thechapter.\@arabic\c@merk\alph{figure}}%
  \let\resetsubfig=\r@setsubfig%
}%


\def\thechapterend{}


\def\@chapapp{Chapter}


\def\l@chapter#1#2%
{%
  \par\addpenalty{-\@highpenalty}
  \addvspace{1.0em \@plus \p@}
  \@tempdima \tocchpnum \begingroup
  \parindent \z@ \rightskip \@tocrmarg
  \advance\rightskip by \z@ \@plus 2cm
  \parfillskip -\rightskip \pretolerance=10000
  \leavevmode \advance\leftskip\@tempdima \hskip -\leftskip
  {\bfseries\boldmath#1}
  \if x0#2 \hfil \null
  \else
      \nobreak
      \leaders\hbox{$\m@th \mkern \@dotsep mu\hbox{.}\mkern
      \@dotsep mu$}\hfill
      \nobreak\hbox to\@pnumwidth{\hfil #2}%
  \fi\par
  \penalty\@highpenalty \endgroup
}%


\renewcommand\chapter%
{%
  \clearpage
  \setcounter{section}{0}%
  \setcounter{subsection}{0}%
  \setcounter{figure}{0}
  \setcounter{table}{0}
  \setcounter{equation}{0}
  \setcounter{footnote}{0}%
  \begingroup
    \let\@elt\@stpelt
    \csname cl@chapter\endcsname
  \endgroup
  \global\@topnum\z@
  \@afterindentfalse
  \secdef\@chapter\@schapter
}%


\def\@chapter[#1]#2%
{%
  \refstepcounter{chapter}%
  \if@numchapter
    \addcontentsline{toc}{chapter}{\protect\numberline{\thechapter\thechapterend}#1}%
  \else
    \addcontentsline{toc}{chapter}{#1}%
  \fi
  \addtocontents{lof}{\protect\addvspace{10\p@}}%
  \addtocontents{lot}{\protect\addvspace{10\p@}}%
  \if@twocolumn
    \@topnewpage[\@makechapterhead{#2}]%
  \else
    \@makechapterhead{#2}%
    \@afterheading
  \fi
}%


\def\@schapter#1%
{%
  \if@twocolumn
    \@topnewpage[\@makeschapterhead{#1}]%
  \else
    \@makeschapterhead{#1}%
    \@afterheading
  \fi
}%


\def\@makechapterhead#1%
{%
  {%
    \parindent\z@\raggedright\normalfont
    \hyphenpenalty \@M
    \interlinepenalty\@M
    \chapnumsize\chapnumstyle
    \@chapapp\ \thechapter\thechapterend\par
    \vskip 2\p@
    \chapsize\chapstyle
    \ignorespaces#1\par\nobreak
    \processchapsubtit
    \processchapauthor
    \processmotto
    \ifdim\pagetotal>64\p@
      \vskip 11\p@
    \else
      \@tempdima=64\p@\advance\@tempdima by-\pagetotal
      \vskip\@tempdima
    \fi
  }%
}%


\def\@makeschapterhead#1%
{%
  {%
    \parindent \z@ \raggedright\normalfont
    \hyphenpenalty \@M
    \interlinepenalty\@M
    \chapsize\chapstyle
    \ignorespaces#1\par\nobreak
    \processmotto
    \ifdim\pagetotal>48\p@
      \vskip 11\p@
    \else
      \@tempdima=48\p@\advance\@tempdima by-\pagetotal
      \vskip\@tempdima
    \fi
  }%
}%


\newdimen\mottowidth
\newcommand\motto[2][77mm]%
{%
  \setlength{\mottowidth}{#1}%
  \gdef\m@ttotext{#2}
}%


\newcommand{\processmotto}%
{%
  \@ifundefined{m@ttotext}{}%
  {%
    \setbox0=\hbox%
    {%
      \vbox%
      {
        \hyphenpenalty=50%
        \begin{flushright}%
          \begin{minipage}{\mottowidth}%
            \vrule\@width\z@\@height21\p@\@depth\z@
            \normalfont\mottosize\mottostyle\m@ttotext
          \end{minipage}%
        \end{flushright}%
      }%
    }%
    \@tempdima=\pagetotal
    \advance\@tempdima by\ht0
    \ifdim\@tempdima<157\p@
      \multiply\@tempdima by-1
      \advance\@tempdima by157\p@
      \vskip\@tempdima
    \fi
    \box0\par
    \global\let\m@ttotext=\undefined
  }%
}%


\newcommand{\chapsubtitle}[1]%
{%
  \gdef\ch@psubtitle{#1}%
}%


\newcommand{\chapauthor}[1]%
{%
  \gdef\ch@pauthor{#1}%
}%


\newcommand{\processchapsubtit}%
{%
  \@ifundefined{ch@psubtitle}{}%
  {%
    {%
      \normalfont\chapnumsize\chapnumstyle
      \vskip 14\p@
      \ch@psubtitle
      \par
    }%
    \global\let\ch@psubtitle=\undefined
  }%
}%


\newcommand{\processchapauthor}%
{%
  \@ifundefined{ch@pauthor}{}%
  {%
    {%
      \normalfont\chapauthsize\chapauthstyle%
      \vskip 20\p@%
      \ch@pauthor%
      \par%
    }%
    \global\let\ch@pauthor=\undefined
  }%
}%


\newdimen\tocchpnum
\newdimen\tocsecnum
\newdimen\tocsectotal
\newdimen\tocsubsecnum
\newdimen\tocsubsectotal
\newdimen\tocsubsubsecnum
\newdimen\tocsubsubsectotal
\newdimen\tocparanum
\newdimen\tocparatotal
\newdimen\tocsubparanum
\tocchpnum=20\p@
\tocsecnum=28.5\p@
\tocsubsecnum=36.5\p@
\tocsubsubsecnum=43\p@
\tocparanum=45\p@
\tocsubparanum=53\p@


\def\calctocindent%
{%
  \tocsectotal=\tocchpnum
  \advance\tocsectotal by\tocsecnum
  \tocsubsectotal=\tocsectotal
  \advance\tocsubsectotal by\tocsubsecnum
  \tocsubsubsectotal=\tocsubsectotal
  \advance\tocsubsubsectotal by\tocsubsubsecnum
  \tocparatotal=\tocsubsubsectotal
  \advance\tocparatotal by\tocparanum
}%


\calctocindent


\def\@dottedtocline#1#2#3#4#5%
{%
  \ifnum #1>\c@tocdepth \else
    \vskip \z@ \@plus.2\p@
    {%
      \leftskip #2\relax \rightskip \@tocrmarg \advance\rightskip by \z@ \@plus 2cm
      \parfillskip -\rightskip \pretolerance=10000
      \parindent #2\relax\@afterindenttrue
      \interlinepenalty\@M
      \leavevmode
      \@tempdima #3\relax
      \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
      {#4}\nobreak
      \leaders\hbox{$\m@th
        \mkern \@dotsep mu\hbox{.}\mkern \@dotsep
        mu$}\hfill
      \nobreak
      \hb@xt@\@pnumwidth{\hfil\normalfont \normalcolor #5}%
      \par%
    }%
  \fi
}%


\def\l@section{\@dottedtocline{1}{\tocchpnum}{\tocsecnum}}
\def\l@subsection{\@dottedtocline{2}{\tocsectotal}{\tocsubsecnum}}
\def\l@subsubsection{\@dottedtocline{3}{\tocsubsectotal}{\tocsubsubsecnum}}
\def\l@paragraph{\@dottedtocline{4}{\tocsubsubsectotal}{\tocparanum}}
\def\l@subparagraph{\@dottedtocline{5}{\tocparatotal}{\tocsubparanum}}


\renewcommand\tableofcontents%
{%
  \chapter*{\contentsname\markboth{{\contentsname}}{{\contentsname}}}%
  \@starttoc{toc}%
}%


\renewcommand\listoffigures%
{%
  \chapter*{\listfigurename\markboth{\listfigurename}{\listfigurename}}%
  \@starttoc{lof}%
}%


\renewcommand\listoftables%
{%
  \chapter*{\listtablename\markboth{\listtablename}{\listtablename}}%
  \@starttoc{lot}%
}%


\def\thesection{\thechapter.\@arabic\c@section}%
\def\thefigure{\thechapter.\@arabic\c@figure}%
\def\thetable{\thechapter.\@arabic\c@table}%


\renewcommand\appendix%
{%
  \clearpage%

  \setcounter{chapter}{0}%
  \stepcounter{section}%
  \setcounter{section}{0}%
  \setcounter{equation}{0}%
  \setcounter{figure}{0}%
  \setcounter{table}{0}%
  \setcounter{footnote}{0}%

  \def\@chapapp{Appendix}%

  \renewcommand\thechapter{\@Alph\c@chapter}%
  \renewcommand\thesection{\thechapter.\@arabic\c@section}%
  \renewcommand\thesubsection{\thesection.\@arabic\c@subsection}%
  \renewcommand\theequation{\thechapter.\@arabic\c@equation}%
  \renewcommand\thefigure{\thechapter.\@arabic\c@figure}%
  \renewcommand\thetable{\thechapter.\@arabic\c@table}%
}%


\@ifundefined{thechapterend}{\def\thechapterend{}}{}
\newdimen\betweenumberspace
\betweenumberspace=5\p@
\newdimen\headlineindent
\headlineindent=2.5cc


\renewcommand\part%
{%
  \clearpage%
  \secdef\@part\@spart%
}%


\def\@part[#1]#2%
{%
  \ifnum \c@secnumdepth >-2\relax
    \refstepcounter{part}
    \addcontentsline{toc}{part}{\partname\ 
      \thepart\thechapterend\hspace{\betweenumberspace}#1}
  \else
    \addcontentsline{toc}{part}{#1}
  \fi
  \markboth{}{}
  {%
    \raggedleft%
    \hyphenpenalty \@M%
    \interlinepenalty\@M%
    \ifnum \c@secnumdepth >-2\relax%
      \normalfont\partnumsize\partnumstyle
      \partname\ \thepart
      \par%
      \vskip 2\p@%
    \fi
    \partsize\partstyle #2\par%
  }%
  \vfil%
}%


\def\@spart#1%
{%
  {%
    \raggedleft
     \normalfont\partsize\partstyle#1\par
  }%
  \vfil%
}%


\def\ps@frontmatterpagestyle%
{%
  \let\@oddhead\@empty\let\@evenhead\@empty%
  \def\@oddfoot{\reset@font\small\hfil\thepage\hfil}%
  \let\@evenfoot\@oddfoot%
}%


\def\ps@mainmatterpagestyle%
{%
  \let\@oddhead\@empty\let\@evenhead\@empty%
  \def\@oddfoot{\reset@font\small\hfil\thepage}%
  \let\@evenfoot\@oddfoot%
}%
%-------------------------------------------------------------------------------

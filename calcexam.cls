% for CCSF/Calculus II exam prep

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{calcexam}[2021/03/11, v0.0.1]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions*
\LoadClass[fleqn,twoside]{article}

\RequirePackage[framemethod=TikZ]{mdframed}
\RequirePackage{floatrow}
\RequirePackage[showzone=false]{datetime2}
\RequirePackage{tkz-euclide}
\RequirePackage{anyfontsize}
\RequirePackage{multicol}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}  % Number of pages in the document
\RequirePackage{hyperref}
\RequirePackage{ifthen}
\RequirePackage{etoolbox}
\RequirePackage{xparse}
\RequirePackage{relsize}
\RequirePackage[utf8]{inputenc}
\RequirePackage{lmodern}
\RequirePackage[T1]{fontenc}
\RequirePackage[charter]{mathdesign}
\RequirePackage{amsmath}
\RequirePackage{mathtools}
\RequirePackage{commath}
\RequirePackage{microtype}
\usepackage{xstring}
% \RequirePackage{changepage}
\RequirePackage{enumitem}
\RequirePackage{caption}
\RequirePackage{subcaption}
% \RequirePackage{graphicx}% images from mwe package
\RequirePackage{pdfpages}

\RequirePackage[
  paperheight=8.5in,
  paperwidth=5.5in,
width=26pc,
height=42pc,
nomarginpar,
% left=3.5pc,
% landscape,
% headheight=2pc,
footskip=2pc,
% headsep=0pc,
% top=9pc,
% height=48pc,
% width=56pc,
% right=2pc,
% top=4pc,
% bottom=6pc,
bindingoffset=2pc,
%  heightrounded,
% showframe,
% verbose,
% includefoot,
]{geometry}

%%%%%%%%%%%%%%%%%%% LENGTHS

\setlength{\parindent}{0em}
\setlength{\parskip}{1em}
\setlength{\mathindent}{1em}
% \setlength{\columnsep}{4pc}
% \setlength{\columnseprule}{0.0001pt}

%%%%%%%%%%%%%%%%%%% COLOURS

\definecolor{beaublue}{cmyk}{0.15, 0.07, 0,0.15}% rgb 89, 134, 166}
\definecolor{airforceblue}{cmyk}{0.45, 0.20, 0, 0.35}

%%%%%%%%%%%%%%%%%%% FRAMES

\mdfdefinestyle{solution}{%
    userdefinedwidth=\textwidth,
    linecolor=airforceblue,
    outerlinewidth=0.5pt,
    roundcorner=27pt,
    innertopmargin=\baselineskip,
    innerbottommargin=\baselineskip,
    innerrightmargin=20pt,
    innerleftmargin=20pt,
}


\mdfdefinestyle{prompt}{%
    userdefinedwidth=\textwidth,
    linecolor=airforceblue,
    outerlinewidth=0.25pt,
    innertopmargin=\baselineskip,
    innerbottommargin=\baselineskip,
    innerrightmargin=0pt,
    innerleftmargin=0pt,
    leftline=false,
    rightline=false,
}

%%%%%%%%%%%%%%%%%%% TIME & DATE

% \DTMnewstyle{iso}
% {\renewcommand*{\DTMdisplaydate}[4]{##1 \DTMtwodigits{##2}\DTMtwodigits{##3}}\renewcommand*{\DTMDisplaydate}{\DTMdisplaydate}}
% {\renewcommand*{\DTMdisplaytime}[3]{\DTMtwodigits{##1}\DTMtwodigits{##2}}}
% {\renewcommand*{\DTMdisplayzone}[2]{\DTMtwodigits{##1}\DTMtwodigits{##2}}}
% {\renewcommand*{\DTMdisplay}[9]{%
% \DTMDisplaydate{##1}{##2}{##3}{##4}
% \DTMdisplaytime{##5}{##6}{##7}\ifDTMshowzone
% \DTMdisplayzone{##8}{##9}\fi}\renewcommand*{\DTMDisplay}{\DTMdisplay}
% }
% custom date style
\DTMnewstyle{threefours}
{\renewcommand*{\DTMdisplaydate}[4]{##1 \DTMtwodigits{##2}\DTMtwodigits{##3}}\renewcommand*{\DTMDisplaydate}{\DTMdisplaydate}}
{\renewcommand*{\DTMdisplaytime}[3]{\DTMtwodigits{##1}\DTMtwodigits{##2}}}
{\renewcommand*{\DTMdisplayzone}[2]{\DTMtwodigits{##1}\DTMtwodigits{##2}}}
{\renewcommand*{\DTMdisplay}[9]{%
\DTMDisplaydate{##1}{##2}{##3}{##4}
\DTMdisplaytime{##5}{##6}{##7}\ifDTMshowzone
\DTMdisplayzone{##8}{##9}\fi}\renewcommand*{\DTMDisplay}{\DTMdisplay}
}


% \pagenumbering{gobble}
\interlinepenalty=\maxdimen%
\raggedcolumns%
\def\tightlist{}

\def\prompt#1{\gdef\@prompt{#1}}\def\@prompt{}
\def\prompttitle#1{\gdef\@prompttitle{#1}}\def\@prompttitle{}
% \newif\ifprompt\promptfalse


%%%%%%%%%%%%%%%%%%% ASSIGNMENT-SPECIFIC

\newcommand{\displayprompt}{
  \begin{mdframed}[style=prompt]
    \ifx\@prompttitle\empty\else
    \textbf{\@prompttitle}

    \fi
    \ifx\@prompt\empty\else
      \@prompt
    \fi
  \end{mdframed}
}



\date{\today}
\makeatletter
\renewcommand{\@maketitle}{%
{\raggedright\sffamily\bfseries\fontsize{20}{25}\selectfont\@title\par}{\raggedright\sffamily\fontsize{12}{16}\selectfont\@author\\\@date\par}
\bigskip
\displayprompt
\bigskip
}%
\makeatother


\makeatletter
\title{
  \vspace*{-5pc}
    \normalsize{City College of San Francisco}\\
        \large{Calculus II}\\
        \Huge{\@assignment } % \@assignment}
}
\makeatother

\makeatletter
\newcommand{\draft}[1]{\renewcommand\@draft{#1}}%
\newcommand{\@draft}{}
\newcommand{\assignment}[1]{\renewcommand\@assignment{#1}}%
\newcommand{\@assignment}{}
\makeatother

%%%%%%%%%%%%%%%%%%% END ASSIGNMENT-SPECIFIC


\renewcommand{\headrule}{}
\pagestyle{fancy}
\fancyhf{}
% % custom header
% \fancypagestyle{firstpage}{\rhead{}}

% \renewcommand{\headrulewidth}{0.75pt}% 2pt header rule
% \renewcommand{\headrule}{\hbox to\headwidth{%
%   \color{airforceblue}\leaders\hrule height \headrulewidth\hfill
% }}
% \renewcommand{\footrulewidth}{0.75pt}% 2pt header rule
% \renewcommand{\footrule}{\hbox to\headwidth{%
%   \color{airforceblue}\leaders\hrule height \footrulewidth\hfill
% }}


% ASSIGNMENT #
\makeatletter
% draft
\fancyfoot[LO,LE]{
\DTMsetstyle{threefours}
\ifthenelse{\equal{\@draft}{}}{}{\small\texttt{\color{beaublue}\DTMnow\hspace{2em}\@draft}}
}
% \def\no{foo}
% \def\theintegral{bar}
% page/of
\fancyfoot[RO,LE]{\circled\no}
% \makeatother
% \fancypagestyle{plain}{
% \renewcommand{\headrulewidth}{0pt}
% }
\fancyfoot[C]{\theintegral}
\makeatother
% \fancypagestyle{plain}{
% \renewcommand{\headrulewidth}{0pt}
% }

\fancypagestyle{blankpage}{
  \fancyfoot{}%
  \fancyhead{}%
}
\NewDocumentCommand\blankpage
{
sO{This page is intentionally blank.}
}{
\thispagestyle{empty}
\IfBooleanTF#1{\null}{#2}
\clearpage
}


% \renewcommand{\headrulewidth}{0.75pt}% 2pt header rule
% \renewcommand{\headrule}{\hbox to\headwidth{%
%   \color{airforceblue}\leaders\hrule height \headrulewidth\hfill
% }}
% \renewcommand{\footrulewidth}{0.75pt}% 2pt header rule
% \renewcommand{\footrule}{\hbox to\headwidth{%
%   \color{airforceblue}\leaders\hrule height \footrulewidth\hfill
% }}


\pagenumbering{gobble}

%%%%%%%%%%%%%%%%%%% CUSTOM MATH OPERATORS

\DeclareMathOperator{\arcsec}{arcsec}
\DeclareMathOperator{\arccot}{arccot}
\DeclareMathOperator{\arccsc}{arccsc}


% \newcommand{\sectionpage}[1]{
% \vspace*{10pc}
% \centering
% \section*{#1}
% \cleardoublepage
% }

\newcommand*\circled[1]{%
\tikz[baseline=(char.base)]{%
% \useasboundingbox (0,-.3) rectangle (0,0.3);
\node[shape=circle,draw,inner sep=1.25pt] (char) {#1};%
% \tkzShowBB%
}}


% % for pages to be cut in half
% \newcommand{\footeqn}[2]{
% \vspace*{\fill}
% \noindent\rule{\columnwidth}{0.5pt}\vspace{1.5em}\\
% \resizebox{!}{16pt}{\circled{#1}}\vspace{1em}
% \hfill\hfill
% \resizebox{!}{20pt}{\textls{\(\displaystyle #2\)}}
% }

% for pages to be bound in a small binder
%TODO: make this fake footer a real footer
% \NewDocumentCommand{\footeqnleft}{ m m }{%
% \;\circled{#1}%
% \hfill%
% \resizebox{!}{20pt}{\textls{\(\displaystyle #2\)}}%
% \hfill\;%
% }
% \newcommand{\leftside}{\def\side{L}}
% \newcommand{\rightside}{\def\side{L}}
%TODO: make this fake footer a real footer
% \NewDocumentCommand{\footeqnright}{ m m }{%
% \begin{minipage}{\columnwidth}
% \hfill%
% \resizebox{!}{20pt}{\textls{\(\displaystyle #2\)}}%
% \hfill%
% \circled{#1}%
% \end{minipage}
% }

% \NewDocumentCommand{\footeqn}{ o m m }{%
% \vspace{\fill}
% \noindent\rule{\columnwidth}{0.5pt}\vspace{1.5em}\\
% \ifdefstring{\side}{R}
%   {\footeqnright{#2}{#3}}%
%   {\ifdefstring{\side}{L}
%     {\footeqnleft{#2}{#3}}%
%     {\ifstrequal{#1}{R}%
%         {\footeqnright{#2}{#3}}%
%         {\ifstrequal{#1}{L}%
%           {\footeqnleft{#2}{#3}}%
%           {\ifnumodd{#2}%
%             {\footeqnright{#2}{#3}}%
%             {\footeqnleft{#2}{#3}}%
%           }
%         }
%     }
%   }
% }


%%%%%%%%%%%%%%%%%%% MATH MODE SHORTCUTS


\NewDocumentCommand{\andso}{ s }{%
\IfBooleanF{#1}{\aroundarrows}%
\andsoarrow%
\IfBooleanF{#1}{\aroundarrows}%
}
\newcommand{\andsoarrow}{\longrightarrow}%
\newcommand{\aroundarrows}{\enspace}

\NewDocumentCommand{\nb}{
  O{}  %  space before
  O{}  %  space after
  m    %  text, ignored if blank
  o    %  math to put in aligned environment
  O{t} %  alignement of aligned environment
}{%
\notblank{#1}{\\[#1]}{}
\intertext{
\centering\smaller%
\notblank{#3}{#3}{}%
\IfValueT{#4}{\(\begin{aligned}[#5]#4\end{aligned}\)}%
\notblank{#2}{\vspace{#2}}{}
}%
}

\NewDocumentCommand{\simplify}{s}{%
Simplify%
\IfBooleanT{#1}{ for asethetic reasons}%
}

\NewDocumentCommand{\sub}{s O{} O{} }{
\ifblank{#2}{%  no args     {Let}{%  no argsargs
\IfBooleanTF{#1}%
{Where}%
{Let}%
}{%  >0 args
\ifblank{#3}{%  1 arg
\IfBooleanTF{#1}%
{In terms of \(#2\), where}%
{In terms of \(#2\)}%
}{%  2 args}
\IfBooleanTF{#1}%
{Substitute \(#2\) for \(#3\), which means}%
{Substitute \(#2\) for \(#3\)}%
}%
}%
}
\NewDocumentCommand{\unsub}{ s O{} O{} }{
\ifblank{#2}{% no args
\IfBooleanTF{#1}%
{Reverse the substitution, where}%
{Reverse the substitution}%
}{%  >0 args
\ifblank{#3}{% 1 arg
\IfBooleanTF{#1}%
{Reverse the substitution of \(#2\), where}%
{Reverse the substitution of \(#2\)}%
}{%  2 args}
\IfBooleanTF{#1}%
{Express \(#2\) in terms of \(#3\), where}%
{Express \(#2\) in terms of \(#3\)}%
}%  2 args}
}
}

\NewDocumentCommand{\partscore}{sO{}O{u}mmmm}{
\nb{Integrate by parts }[
\enspace\left\{\enspace\begin{aligned}
{#4}\enspace=&\enspace\left({#5}\right)'\\[.75em]
\left({#6}\right)'\enspace=&\enspace{#7}
\end{aligned}\right.
][c]
}
\NewDocumentCommand{\parts}{sO{}O{u}mmmm}{
\IfBooleanTF{#1}{%
  \nb{Integrate by parts }[
  \enspace\left\{\enspace\begin{aligned}
  \left({#4}\right)'\enspace=&\enspace{#5}\\[.75em]
  {#6}\enspace=&\enspace\left({#7}\right)'
  \end{aligned}\right.
  ][c]
  =&  \left( #4 \right)\left( #7 \right)
    - \int#2
        \left( #5 \right)\left( #7 \right)
      \dif #3
}{
  \nb{Integrate by parts }[
  \enspace\left\{\enspace\begin{aligned}
  {#4}\enspace=&\enspace\left({#5}\right)'\\[.75em]
  \left({#6}\right)'\enspace=&\enspace{#7}
  \end{aligned}\right.
  ][c]
  =&  \left( #5 \right)\left( #6 \right)
    - \int#2
        \left( #5 \right)\left( #7 \right)
      \dif #3
}
}

\NewDocumentCommand{\sohcahtoabare}{sO{\theta}mmm}{
\begin{tikzpicture}[baseline={([yshift={\ht\strutbox}]current bounding box.north)}]
\useasboundingbox (0,0) rectangle (1.5,0.5);
\tkzDefPoint(1.25,1.5){A}
\tkzDefPoint(1.25,0){B}
\tkzDefPoint(0,0){C}
\tkzDrawPolygon[fill=gray!5](A,B,C)
\tkzMarkRightAngle[color=black](A,B,C)
\IfBooleanTF{#1}{%
\tkzLabelSegment[right=4pt](A,B){\(#4\)}
\tkzLabelSegment[below=6pt](B,C){\(#3\)}
\tkzLabelSegment[above left=6pt](C,A){\(#5\)}
\tkzLabelAngle[pos=0.5](C,A,B){\(#2\)}
}
{%
\tkzLabelSegment[right=4pt](A,B){\(#3\)}
\tkzLabelSegment[below=6pt](B,C){\(#4\)}
\tkzLabelSegment[above left=6pt](C,A){\(#5\)}
\tkzLabelAngle[pos=0.5](B,C,A){\(#2\)}
}
% \tkzShowBB
\end{tikzpicture}
}
\NewDocumentCommand{\sohcahtoa}{sO{\quad}O{0pt}O{\theta}mmm}{
\(
\enspace\sin{#4}=\dfrac{#5}{#7},
\enspace\cos{#4}=\dfrac{#6}{#7}
\andso\tan{#4}=\dfrac{#5}{#6}
\)#2%
\raisebox{#3}{\IfBooleanTF{#1}%
{\sohcahtoabare*[#4]{#5}{#6}{#7}}%
{\sohcahtoabare[#4]{#5}{#6}{#7}}%
}
}



\raggedright%
\addtolength{\jot}{2ex}


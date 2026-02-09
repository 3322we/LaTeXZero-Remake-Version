% -----------------------------------
% The Reissue Version of Template LaTeXZero.
% Origin Github URL: https://github.com/fenglielie/latexzero
% -----------------------------------

%%% ========== Info ========== %%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{LaTeXZero}[2026/02/08 v1.1]
%%% ========== Info Finished ========== %%%

%%% ========== Options ========== %%%
\RequirePackage{kvoptions}
\RequirePackage{etoolbox} % ifdefstring

\SetupKeyvalOptions{
    family=LaTeXZero, 
    prefix=LaTeXZero@, 
    setkeys=\kvsetkeys
}
\newcommand{\ekv}[1]{\kvsetkeys{LaTeXZero}{#1}}

\DeclareStringOption[leftsidebox]{mode}
\DeclareVoidOption{leftsidebox}{\ekv{mode=leftsidebox}}
\DeclareVoidOption{box}{\ekv{mode=box}}
\DeclareVoidOption{borderless}{\ekv{mode=borderless}}
\DeclareVoidOption{mdframed}{\ekv{mode=mdframed}}
\DeclareVoidOption{simple}{\ekv{mode=simple}}

\DeclareStringOption[en]{lang}
\DeclareVoidOption{en}{\ekv{lang=en}}
\DeclareVoidOption{cn}{\ekv{lang=cn}}
\DeclareVoidOption{fr}{\ekv{lang=fr}}
\DeclareVoidOption{de}{\ekv{lang=de}}

\DeclareStringOption[origin]{color}
\DeclareVoidOption{origin}{\ekv{color=origin}}
\DeclareVoidOption{summer}{\ekv{color=summer}}
\DeclareVoidOption{winter}{\ekv{color=winter}}

\DeclareStringOption[section]{counter}
\DeclareVoidOption{section}{\ekv{counter=section}}
\DeclareVoidOption{chapter}{\ekv{counter=chapter}}

\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessKeyvalOptions*\relax
%%% ========== Options Finished ========== %%%

%%% ========== Languages ========== %%%
\ifdefstring{\LaTeXZero@lang}{cn}{
  \newcommand{\notename}{注解}
  \newcommand{\definitionname}{定义}
  \newcommand{\theoremname}{定理}
  \newcommand{\axiomname}{公理}
  \newcommand{\claimname}{断言}
  \newcommand{\lemmaname}{引理}
  \newcommand{\propositionname}{命题}
  \newcommand{\corollaryname}{推论}
  \newcommand{\examplename}{例} %
  \newcommand{\problemname}{问题} % 问题
  \newcommand{\exercisename}{习题} % 改练习为习题
  \newcommand{\remarkname}{评注}
  \newcommand{\solutionname}{解}
  \newcommand{\propertyname}{性质}
}{\relax}

\ifdefstring{\LaTeXZero@lang}{en}{
  \newcommand{\notename}{Note}
  \newcommand{\problemname}{Problem}
  \newcommand{\definitionname}{Definition}
  \newcommand{\theoremname}{Theorem}
  \newcommand{\axiomname}{Axiom}
  \newcommand{\claimname}{Claim}
  \newcommand{\lemmaname}{Lemma}
  \newcommand{\propositionname}{Proposition}
  \newcommand{\corollaryname}{Corollary}
  \newcommand{\examplename}{Example}
  \newcommand{\exercisename}{Exercise}
  \newcommand{\remarkname}{Remark}
  \newcommand{\solutionname}{Solution}
  \newcommand{\propertyname}{Property}
  \newcommand{\introductionname}{Introduction}
}{\relax}
%%% ========== Languages Finished ========== %%%

%%% ========== Load Class ========== %%%
\ifdefstring{\LaTeXZero@lang}{cn}{
\LoadClass[a4paper,oneside]{ctexbook}
}{
\LoadClass[a4paper,oneside]{book}
}
%%% ========== Load Class Finished ========== %%%

%%% ========== Paper Control ========== %%%
%% ======== Paper format ========
\RequirePackage{geometry}
    \geometry{
    a4paper,
    margin=1in
    }

%% ======== Hyperref ========
\RequirePackage{hyperref}
\hypersetup{
    colorlinks=true,linkcolor=,urlcolor=cyan
}

\RequirePackage{indentfirst}
\RequirePackage{multicol}
\RequirePackage{appendix}

%% ======== Counter ========
\ifdefstring{\LaTeXZero@counter}{section}{
\newcommand{\thmcnt}{section}
}{
\newcommand{\thmcnt}{chapter}
\renewcommand{\thesection}{\arabic{section}}

\RequirePackage[titles]{tocloft}
\renewcommand{\cftsecpresnum}{\S~}
%\addtolength{\cftsecnumwidth}{0.8em}
}
%%% ========== Paper Control Finished ========== %%%

%%% ========== Fonts Setting ========== %%%
\RequirePackage{amsmath}
\RequirePackage{iftex}
\RequirePackage{anyfontsize}

%% ======== English Fonts ========
\ifXeTeX
    \RequirePackage[no-math]{fontspec}
    \RequirePackage{unicode-math}
        \setmathfont{NewComputerModernMath}
        \AtBeginDocument{
            \@ifundefined{square}{\let\square\mdlgwhtsquare}{}
        } %qed symbol patch for XeLaTeX.
\else 
    \RequirePackage{amssymb,amsfonts,mathrsfs,bm}
    \RequirePackage{extarrows,esint}
\fi

%% ======== Chinese Fonts ========

%%% ========== Fonts Finished ========== %%%

%%% ========== Define Colors ========== %%%
\RequirePackage[dvipsnames,table]{xcolor}

\ifdefstring{\LaTeXZero@color}{origin}{
\colorlet{structurecolor}{RoyalPurple}
\colorlet{main}{NavyBlue}
\colorlet{second}{ForestGreen}
\colorlet{third}{RawSienna}
\colorlet{fourth}{WildStrawberry}
}{\relax}

\ifdefstring{\LaTeXZero@color}{summer}{
\definecolor{structurecolor}{RGB}{0,174,247}
\colorlet{main}{structurecolor!90!white}
\definecolor{second}{RGB}{123,225,36}
\definecolor{third}{RGB}{247,194,0}
\colorlet{fourth}{WildStrawberry}
}{\relax}

\ifdefstring{\LaTeXZero@color}{winter}{
\definecolor{structurecolor}{RGB}{31,186,190}
\colorlet{main}{structurecolor!90!white}
\definecolor{second}{RGB}{60,179,113}
\definecolor{third}{RGB}{235,202,160}
\colorlet{fourth}{WildStrawberry}
}{\relax}



%%% ========== Colors Finished ========== %%%

%%% ========== Theorems Styles ========== %%%
\RequirePackage{amsthm,thmtools}

\let\oldproofname\proofname
\renewcommand*{\proofname}{\normalfont\bfseries \oldproofname}

\ifdefstring{\LaTeXZero@mode}{mdframed}{
\RequirePackage[framemethod=TikZ]{mdframed}
\mdfsetup{skipabove=0.5em,skipbelow=0.5em}

%% ======== Define Boxs ========
\newcommand{\mydeclaretheoremstyle}[3]{
    \declaretheoremstyle[headfont=\bfseries\sffamily#2, bodyfont=\normalfont, mdframed={#3}]{#1}
}

\mydeclaretheoremstyle{purplehalfbox}{\color{structurecolor!70!black}}{linewidth=2pt, rightline=false, topline=false, bottomline=false, linecolor=structurecolor, backgroundcolor=structurecolor!8}
\mydeclaretheoremstyle{bluehalfbox}{\color{SkyBlue!70!black}}{linewidth=2pt, rightline=false, topline=false, bottomline=false, linecolor=main, backgroundcolor=SkyBlue!8}

\mydeclaretheoremstyle{greenfullbox}{\color{second!40!black}}{linewidth=1pt, linecolor=second, backgroundcolor=second!5}
\mydeclaretheoremstyle{redfullbox}{\color{third!70!black}}{linewidth=1pt, linecolor=third, backgroundcolor=third!5}

\mydeclaretheoremstyle{pinkemptybox}{\color{fourth!70!black}}{linewidth=0pt, linecolor=fourth, backgroundcolor=fourth!5}
\mydeclaretheoremstyle{brownemptybox}{\color{brown!70!black}}{leftline=false, rightline=false, topline=false, bottomline=false, skipabove=0em, skipbelow=0em}
\mydeclaretheoremstyle{greenemptybox}{\color{second!40!black}}{leftline=false, rightline=false, topline=false, bottomline=false, skipabove=0em, skipbelow=0em}

%% ======== Define Environments ========
\declaretheorem[style=purplehalfbox, name=\theoremname, numbered=yes, numberwithin=\thmcnt]{theorem}
\declaretheorem[style=purplehalfbox, name=\theoremname, numbered=no]{theorem*}

\declaretheorem[style=purplehalfbox, name=\propositionname, numbered=yes, sibling=theorem]{proposition}
\declaretheorem[style=purplehalfbox, name=\propositionname, numbered=no]{proposition*}

\declaretheorem[style=bluehalfbox, name=\corollaryname, numbered=yes, sibling=theorem]{corollary}
\declaretheorem[style=bluehalfbox, name=\corollaryname, numbered=no]{corollary*}

\declaretheorem[style=bluehalfbox, name=\lemmaname, numbered=yes, sibling=theorem]{lemma}
\declaretheorem[style=bluehalfbox, name=\lemmaname, numbered=no]{lemma*}

\declaretheorem[style=bluehalfbox, name=\claimname, numbered=yes, sibling=theorem]{claim}
\declaretheorem[style=bluehalfbox, name=\claimname, numbered=no]{claim*}

\declaretheorem[style=greenfullbox, name=\definitionname, numbered=yes, numberwithin=\thmcnt]{definition}
\declaretheorem[style=greenfullbox, name=\definitionname, numbered=no]{definition*}

\declaretheorem[style=redfullbox, name=\examplename, numbered=yes, numberwithin=\thmcnt]{example}
\declaretheorem[style=redfullbox, name=\examplename, numbered=no]{example*}

\declaretheorem[style=pinkemptybox, name=\problemname, numbered=yes, numberwithin=\thmcnt]{problem}
\declaretheorem[style=pinkemptybox, name=\problemname, numbered=no]{problem*}

\declaretheorem[style=brownemptybox, name=\remarkname, numbered=yes, numberwithin=\thmcnt]{remark}
\declaretheorem[style=brownemptybox, name=\remarkname, numbered=no]{remark*}

\declaretheoremstyle[headfont=\color{orange!80}\bfseries, bodyfont=\normalfont, spaceabove=3pt, spacebelow=3pt]{notestyle}

\declaretheorem[style=notestyle, name=\notename, numbered=yes, numberwithin=\thmcnt]{note}
\declaretheorem[style=notestyle, name=\notename, numbered=no]{note*}

\declaretheoremstyle[headfont=\bfseries, bodyfont=\normalfont, spaceabove=3pt, spacebelow=3pt, qed=\ensuremath{\square}]{solutionstyle}

\declaretheorem[style=solutionstyle, name=\solutionname, numbered=yes, numberwithin=\thmcnt]{solution}
\declaretheorem[style=solutionstyle, name=\solutionname, numbered=no]{solution*}

%% ======== Cbox Environment ========
\newmdenv[
    linecolor=SkyBlue,
    backgroundcolor=SkyBlue!8,
    leftline=true,
    rightline=false,
    topline=false,
    bottomline=false,
    linewidth=2pt,
    roundcorner=0pt, % sharp corners
    frametitlebackgroundcolor=SkyBlue!20,
]{cbox}
}{% none-mdframed theorem style
%% ======== Define Environments ========
\declaretheorem[style=plain, name=\theoremname, numbered=yes, numberwithin=\thmcnt]{theorem}
\declaretheorem[style=plain, name=\theoremname, numbered=no]{theorem*}

\declaretheorem[style=plain, name=\propositionname, numbered=yes, sibling=theorem]{proposition}
\declaretheorem[style=plain, name=\propositionname, numbered=no]{proposition*}

\declaretheorem[style=plain, name=\corollaryname, numbered=yes, sibling=theorem]{corollary}
\declaretheorem[style=plain, name=\corollaryname, numbered=no]{corollary*}

\declaretheorem[style=plain, name=\lemmaname, numbered=yes, sibling=theorem]{lemma}
\declaretheorem[style=plain, name=\lemmaname, numbered=no]{lemma*}

\declaretheorem[style=plain, name=\claimname, numbered=yes, sibling=theorem]{claim}
\declaretheorem[style=plain, name=\claimname, numbered=no]{claim*}

\declaretheorem[style=definition, name=\definitionname, numbered=yes, numberwithin=\thmcnt]{definition}
\declaretheorem[style=definition, name=\definitionname, numbered=no]{definition*}

\declaretheorem[style=definition, name=\examplename, numbered=yes, numberwithin=\thmcnt]{example}
\declaretheorem[style=definition, name=\examplename, numbered=no]{example*}

\declaretheorem[style=definition, name=\problemname, numbered=yes, numberwithin=\thmcnt]{problem}
\declaretheorem[style=definition, name=\problemname, numbered=no]{problem*}

\declaretheorem[style=remark, name=\remarkname, numbered=yes, numberwithin=\thmcnt]{remark}
\declaretheorem[style=remark, name=\remarkname, numbered=no]{remark*}

\ifdefstring{\LaTeXZero@mode}{simple}{
\declaretheoremstyle[headfont=\color{orange!80}\bfseries, bodyfont=\normalfont, spaceabove=3pt, spacebelow=3pt]{notestyle}

\declaretheorem[style=notestyle, name=\notename, numbered=yes, numberwithin=\thmcnt]{note}
\declaretheorem[style=notestyle, name=\notename, numbered=no]{note*}
}{
\declaretheorem[style=remark, name=\notename, numbered=yes, numberwithin=\thmcnt]{note}
\declaretheorem[style=remark, name=\notename, numbered=no]{note*}
}

\declaretheoremstyle[headfont=\bfseries, bodyfont=\normalfont, spaceabove=3pt, spacebelow=3pt, qed=\ensuremath{\square}]{solutionstyle}

\declaretheorem[style=solutionstyle, name=Solution, numbered=yes, numberwithin=\thmcnt]{solution}
\declaretheorem[style=solutionstyle, name=Solution, numbered=no]{solution*}

%% ======== Derive Boxes ======
\RequirePackage[most]{tcolorbox}

\ifdefstring{\LaTeXZero@mode}{leftsidebox}{
\newcommand{\newtcbenvironment}[2]{
    \tcolorboxenvironment{#1}{#2, enhanced, breakable, sharp corners, left=8pt, leftrule=2pt, rightrule=0pt, toprule=0pt, bottomrule=0pt}
    \tcolorboxenvironment{#1*}{#2, enhanced, breakable, rounded corners, left=8pt, leftrule=2pt, rightrule=0pt, toprule=0pt, bottomrule=0pt}
}
}{\relax}

\ifdefstring{\LaTeXZero@mode}{borderless}{
\newcommand{\newtcbenvironment}[2]{
    \tcolorboxenvironment{#1}{#2, enhanced, breakable, sharp corners, left=8pt, boxrule=0pt, colframe=white}
    \tcolorboxenvironment{#1*}{#2, enhanced, breakable, rounded corners, left=8pt,  boxrule=0pt, colframe=white}
}
}{\relax}

\ifdefstring{\LaTeXZero@mode}{box}{
\newcommand{\newtcbenvironment}[2]{
    \tcolorboxenvironment{#1}{#2, enhanced, breakable, sharp corners, left=8pt,  boxrule=1pt}
    \tcolorboxenvironment{#1*}{#2, enhanced, breakable, rounded corners, left=8pt,  boxrule=1pt}
}
}{\relax}

%% ======== Define Styles ========
\ifdefstring{\LaTeXZero@mode}{simple}{
\relax
}{
\newtcbenvironment{theorem}{colframe=structurecolor, colback=structurecolor!8}
\newtcbenvironment{proposition}{colframe=structurecolor, colback=structurecolor!8}
\newtcbenvironment{corollary}{colframe=main, colback=SkyBlue!8}
\newtcbenvironment{lemma}{colframe=main, colback=SkyBlue!8}
\newtcbenvironment{claim}{colframe=main, colback=SkyBlue!8}

\newtcbenvironment{definition}{colframe=second, colback=second!5}
\newtcbenvironment{example}{colframe=third, colback=third!5}
\newtcbenvironment{problem}{colframe=fourth!30, colback=fourth!5}
}

%% ======== Cbox Environment ========
\newtcolorbox{cbox}[1][]{%
    enhanced,
    breakable,
    sharp corners,
    leftrule=2pt, rightrule=0pt, toprule=0pt, bottomrule=0pt,
    colframe=SkyBlue,
    colback=SkyBlue!8,
    #1
}
}% none-mdframed theorem style

%% ======== Exercise Environment ========
\ifdefstring{\LaTeXZero@lang}{cn}{
\newenvironment{exercise}[1][]{
  \par\vspace{0.5em}
  \noindent
  \begin{center}
    \makebox[0.6\linewidth]{
    % --- left line ---
    \leaders\hrule height \dimexpr0.55ex+0.3pt\relax depth \dimexpr-0.55ex+0.3pt\relax \hfill
    \quad\quad
    % --- head ---
    \textbf{\large{\exercisename}~\thesection~#1}
    % --- right line ---
    \quad\leaders\hrule height \dimexpr0.55ex+0.3pt\relax depth \dimexpr-0.55ex+0.3pt\relax \hfill
    }
  \end{center}
  \rmfamily
}{\par\ignorespacesafterend}
}{
\newenvironment{exercise}[1][]{
  \par\vspace{0.5em}
  \noindent
  \textbf{\large{\exercisename}~\thesection~#1 \hfill}
  \par\vspace{0.5em}
  \noindent
}{\par\ignorespacesafterend}
}

%%% ========== Theorems Finished ========== %%%

%%% ========== Cover ========== %%%
\RequirePackage{graphicx}
\graphicspath{
    {./figure/}{./figures/}{./image/}{./images/}{./graphic/}{./graphics/}{./picture/}{./pictures/}
}
\RequirePackage{titling}
\newcommand{\extrainfo}{}
\renewcommand{\extrainfo}[1]{\renewcommand{\extrainfocontent}{#1}}
\newcommand{\extrainfocontent}{}
\newcommand{\makecover}[1]{%
    \begin{titlepage}
    \newgeometry{margin=0in}
    \parindent=0pt
    \includegraphics[width=\linewidth]{#1} % size = 1280*1024
    \vfill
    \begin{center}
        \parbox{0.618\textwidth}{%
            \raggedleft{\bfseries \Huge \thetitle} \\[0.6pt]
            \rule{0.618\textwidth}{4pt} \\
        }
    \end{center}
    \vfill
    \begin{center}
        \parbox{0.618\textwidth}{%
          \raggedleft\Large
            \begin{tabular}{r}
                \theauthor \\
                \thedate \\
            \end{tabular}%
        }
    \end{center}
    \vfill
    \begin{center}
        \parbox[t]{0.7\textwidth}{\centering \itshape \extrainfocontent}
    \end{center}
    \vfill
    \end{titlepage}
    \restoregeometry
    \thispagestyle{empty}
}
% USAGE
% \extrainfo{xxx}
% \makecover{/path/to/cover.png}

%%% ========== Cover Finished ========== %%%


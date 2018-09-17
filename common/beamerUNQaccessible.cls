% Copyright 2004 by Madhusudan Singh <madhusudan.singh@gmail.com>
%
% This file may be distributed and/or modified
%
% 1. under the LaTeX Project Public License and/or
% 2. under the GNU Public License.
%
% See the file doc/licenses/LICENSE for more details.
% Based on beamerthemeCambridgeUS. Modified by Fidel by
%   * changing the structure color and
%   * adding UNQlogo beamer template

\ProvidesClass{beamerUNQaccessible}[2018/03/09 v0.1 EPyL' modified beamer accessible class]
\LoadClass{article}

\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[spanish]{babel}
\RequirePackage{hyperref}
\RequirePackage{xcolor}
\RequirePackage{listings}
\RequirePackage{graphicx}
\RequirePackage{iflang}
\RequirePackage{ifthen}
\RequirePackage{tocloft}
\RequirePackage{colortbl}
\RequirePackage{amssymb}

% Support beamer basic commands
\renewenvironment{frame}[2][]{
    \subsubsection*{#2.}
}{}

\newcommand\titleframe{
  \begin{frame}[plain]
    \titlepage
  \end{frame}
}

\newcommand\finaltitleframe{~\\\textbf{\Large{Fin de la lección.}}}

\newenvironment{columns}{}{}
\newenvironment{column}[1]{~\\}{~\\}
\newenvironment{block}{}{}

\newcommand\toc[1][\relax]{
    \ifthenelse{\equal{#1}{\relax}}{
        % \tableofcontents
        \pagebreak
    }{}
}

\newcommand\Tiny[1]{#1}

\newcommand{\image}[3][]{
  ~\\
  \centerline{Descripción de imágen: #3}
  ~\\
}

\makeatletter
\renewcommand{\thesection}{Sección \arabic{section}}
\renewcommand{\thesubsection}{Parte \arabic{subsection}}
\renewcommand{\cftsecnumwidth}{6em}
\renewcommand{\cftsubsecnumwidth}{6em}
%\renewcommand\cftsecindent{3em}
%\renewcommand\cftsubsecindent{5em}

\def\@subtitle{\relax}
\newcommand{\subtitle}[1]{\gdef\@subtitle{#1}}

\renewcommand{\titlepage}{
    \centerline{\textbf{{\@author.}}}
    \centerline{\textbf{\@date.}}
    \jump
    \centerline{\Huge{\textbf{\@title.}}}
    \centerline{\Large{\textbf{\@subtitle.}}}
}
\makeatother

\pagenumbering{gobble}

% Support additional data defined in beamerUNQ
\newcommand\emptyline{~\\}

\newcommand\jump{~\\}

\newcommand\bolder[1]{\textbf{#1}}
\newcommand\info[1]{#1}
\newcommand\success[1]{#1}
\newcommand\warn[1]{#1}
\newcommand\error[1]{#1}
\newcommand\colored[1]{\textit{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Logic definitions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\true}{\success{V}}
\newcommand{\false}{\error{F}}
\newcommand{\fulltrue}{\success{VERDADERO}}
\newcommand{\fullfalse}{\error{FALSO}}
\newcommand{\lthen}{\to}
\newcommand{\liff}{\leftrightarrow}
\newcommand{\lseq}{\vdash}
\newenvironment{lreasoning}{}{}
\newcommand{\lpremise}[1]{#1\\}
\newcommand{\lconclusion}[1]{%
  \lreasonrule%
  #1%
}%
\newcommand{\lreasonrule}{
  \vspace{3pt}
  \hrule
  \vspace{3pt}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Custom languages used
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\lstdefinelanguage{markdown}
{
 % list of keywords
 alsoletter={
 \#,
 =,
 -,
 +,
},
 keywords={
   \#,
   \#\#,
   \#\#\#,
   \#\#\#\#,
   \#\#\#\#\#,
   \#\#\#\#\#\#,
   +,
   -,
   --,
   ---,
   % Well, this is annoying, but no other way exists
   ----,
   -----,
   ------,
   -------,
   --------,
   ---------,
   ----------,
   -----------,
   ------------,
   -------------,
   --------------,
   ---------------,
   ----------------,
   -----------------,
   ------------------,
   -------------------,
   --------------------,
   ---------------------,
   ----------------------,
   -----------------------,
   ------------------------,
   -------------------------,
   --------------------------,
   ---------------------------,
   ----------------------------,
   -----------------------------,
   ------------------------------,
   -------------------------------,
   --------------------------------,
   ---------------------------------,
   ----------------------------------,
   -----------------------------------,
   ------------------------------------,
   -------------------------------------,
   --------------------------------------,
   ---------------------------------------,
   ----------------------------------------,
   -----------------------------------------,
   ------------------------------------------,
   -------------------------------------------,
   --------------------------------------------,
   ---------------------------------------------,
   ----------------------------------------------,
   -----------------------------------------------,
   ------------------------------------------------,
   -------------------------------------------------,
   --------------------------------------------------,
   ---------------------------------------------------,
   ----------------------------------------------------,
   -----------------------------------------------------,
   ------------------------------------------------------,
   -------------------------------------------------------,
   --------------------------------------------------------,
   ---------------------------------------------------------,
   ----------------------------------------------------------,
   -----------------------------------------------------------,
   ------------------------------------------------------------,
   -------------------------------------------------------------,
   --------------------------------------------------------------,
   ---------------------------------------------------------------,
   ----------------------------------------------------------------,
   -----------------------------------------------------------------,
   ------------------------------------------------------------------,
   -------------------------------------------------------------------,
   --------------------------------------------------------------------,
   ---------------------------------------------------------------------,
   ----------------------------------------------------------------------,
   -----------------------------------------------------------------------,
   ------------------------------------------------------------------------,
   -------------------------------------------------------------------------,
   --------------------------------------------------------------------------,
   ---------------------------------------------------------------------------,
   ----------------------------------------------------------------------------,
   ==,
   ===,
   ====,
   =====,
   ======,
   =======,
   ========,
   =========,
   ==========,
   ===========,
   ============,
   =============,
   ==============,
   ===============,
   ================,
   =================,
   ==================,
   ===================,
   ====================,
   =====================,
   ======================,
   =======================,
   ========================,
   =========================,
   ==========================,
   ===========================,
   ============================,
   =============================,
   ==============================,
   ===============================,
   ================================,
   =================================,
   ==================================,
   ===================================,
   ====================================,
   =====================================,
   ======================================,
   =======================================,
   ========================================,
   =========================================,
   ==========================================,
   ===========================================,
   ============================================,
   =============================================,
   ==============================================,
   ===============================================,
   ================================================,
   =================================================,
   ==================================================,
   ===================================================,
   ====================================================,
   =====================================================,
   ======================================================,
   =======================================================,
   ========================================================,
   =========================================================,
   ==========================================================,
   ===========================================================,
   ============================================================,
   =============================================================,
   ==============================================================,
   ===============================================================,
   ================================================================,
   =================================================================,
   ==================================================================,
   ===================================================================,
   ====================================================================,
   =====================================================================,
   ======================================================================,
   =======================================================================,
   ========================================================================,
   =========================================================================,
   ==========================================================================,
   ===========================================================================,
   ============================================================================,
   *,
   **,
   ***,
   ****,
   *****,
   ******,
   *******,
   ********,
   *********,
   **********,
   ***********,
   ************,
   *************,
   **************,
   ***************,
   ****************,
   *****************,
   ******************,
   *******************,
   ********************,
   *********************,
   **********************,
   ***********************,
   ************************,
   *************************,
   **************************,
   ***************************,
   ****************************,
   ****************************?,
   ******************************,
   *******************************,
   ********************************,
   *********************************,
   **********************************,
   ***********************************,
   ************************************,
   *************************************,
   **************************************,
   ***************************************,
   ****************************************,
   *****************************************,
   ******************************************,
   *******************************************,
   ********************************************,
   *********************************************,
   **********************************************,
   ***********************************************,
   ************************************************,
   *************************************************,
   **************************************************,
   ***************************************************,
   ****************************************************,
   *****************************************************,
   ******************************************************,
   *******************************************************,
   ********************************************************,
   *********************************************************,
   **********************************************************,
   ***********************************************************,
   ************************************************************,
   *************************************************************,
   **************************************************************,
   ***************************************************************,
   ****************************************************************,
   *****************************************************************,
   ******************************************************************,
   *******************************************************************,
   ********************************************************************,
   *********************************************************************,
   **********************************************************************,
   ***********************************************************************,
   ************************************************************************,
   *************************************************************************,
   **************************************************************************,
   ***************************************************************************,
   ****************************************************************************
 },
 sensitive=false, % keywords are not case-sensitive
 string=[m]{*},
 morestring=[m]{_},
 comment=[s]{**}{**}, % s is for start and end delimiter
 morecomment=[s]{__}{__} % s is for start and end delimiter
}

\newcommand\qpaint[1]{
  \ifthenelse{\equal{#1}{White}}{\textcolor{Black}{$\chi$}}{\textcolor{#1}{$\blacksquare$}}%
}
\newcommand\qmove[1]{
  \ifthenelse{\equal{#1}{Down}}{$\downarrow$}{%
  \ifthenelse{\equal{#1}{Left}}{$\leftarrow$}{%
  \ifthenelse{\equal{#1}{Right}}{$\rightarrow$}{%
  \ifthenelse{\equal{#1}{Up}}{$\uparrow$}{}}}}
}
\newcommand\qis[1]{
  \qpaint{#1}?
}

\lstdefinelanguage{qdraw}
{
 moredelim=[s][\color{WildStrawberry}]{\$}{\ },
 moredelim=[s][\color{Orange}]{0}{\ },
 moredelim=[s][\color{Orange}]{1}{\ },
 moredelim=[s][\color{Orange}]{2}{\ },
 moredelim=[s][\color{Orange}]{3}{\ },
 moredelim=[s][\color{Orange}]{4}{\ },
 moredelim=[s][\color{Orange}]{5}{\ },
 moredelim=[s][\color{Orange}]{6}{\ },
 moredelim=[s][\color{Orange}]{7}{\ },
 moredelim=[s][\color{Orange}]{8}{\ },
 moredelim=[s][\color{Orange}]{9}{\ },
 keywords={
  programa,
  procedimiento,
  repetir,
  veces,
  si,
  entonces,
  sino
 },
 comment=[s]{/*}{*/}
}

\lstset
{
    escapeinside={(*}{*)},%
    frame=single,
    backgroundcolor=\color{White},
    numbers=left,
    numbersep=10pt,
    numberstyle=\footnotesize\color{Gray},
    basicstyle=\small\ttfamily,
    showstringspaces=false,
    tabsize=2,
    commentstyle=\color{Green},
    stringstyle=\color{Mulberry},
    keywordstyle=\color{NavyBlue},
    firstnumber=1,
    extendedchars=true,
    literate={á}{{\'a}}1 {é}{{\'e}}1 {í}{{\'i}}1 {ó}{{\'o}}1 {ú}{{\'u}}1
    {ñ}{{\~n}}1 {Á}{{\'A}}1 {É}{{\'E}}1 {Í}{{\'I}}1 {Ó}{{\'O}}1 {Ú}{{\'U}}1,
}
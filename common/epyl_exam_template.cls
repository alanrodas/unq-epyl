%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% EPyL Exam Template
%%
%% Author: Alan Rodas Bonjout
%% Version: 1.0
%%
%% Usage: Set exam as the document class and then include this file
%%   \documentclass[12pt]{exam}
%%   \include{epyl_exam_template}
%%
%% Add your definitions to specify the title, date and other header info:
%%   \title{Primer exámen}
%%   \date{25/04/2016}
%%   \timelimit{60 Minutos}
%%   \instance{Integrador}
%%   \topic{Programación}
%%   \professor{John Doe}
%%
%%
%% Start your document, add the header, the description and start writing your questions as in a normal exam document.
%%   \begin{document}
%%      \makeexamheader
%%      \makeexamtitle
%%      \examrule
%%      \makeexamextradata
%%      \makeexamwarning
%%      \examrule
%%
%%     \begin{questions}
%%        ...
%%
%% That's it, you have the exam template up and running.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{epyl_exam_template}[2018/03/09 v0.1 EPyL' modified exam class]

% Passes and class options to the underlying article class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{exam}}
\ProcessOptions

% Load LaTeX's article class with the `titlepage' option so that \maketitle creates a title page, not just a title block
\LoadClass{exam}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Set UTF-8 as default encoding
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage[spanish]{babel}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Add needed packages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage{iflang}
\usepackage{ifthen}
\usepackage{hyperref}
\usepackage{listings}
\usepackage{color}
\usepackage[dvipsnames]{xcolor}
\usepackage{tcolorbox}
\usepackage{graphicx}
\usepackage{multirow}
\usepackage[margin=1in]{geometry}
\usepackage{amsmath,amssymb}
\usepackage{multicol}
\usepackage{parskip}
\usepackage{mdframed}
\usepackage{colortbl}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Configure exam template in spanish and with custom styles
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setlength{\parskip}{8pt}

\checkboxchar{$\Box$}

\pagestyle{head}
\firstpageheader{}{}{}
\runningheader{\classacronym}{\thetitle\ - Hoja \thepage\ de \numpages}{\thedate}
\pointpoints{punto}{puntos}
\renewcommand{\solutiontitle}{\noindent\textbf{Solución:}\par\noindent}
\runningheadrule

\vqword{Pregunta} \hqword{Pregunta} \bvqword{Pregunta} \bhqword{Pregunta} \chqword{Pregunta}
\vpgword{Página} \hpgword{Página} \bvpgword{Página} \bhpgword{Página} \chpgword{Página}
\vpword{Puntos} \hpword{Puntos} \bvpword{Puntos} \bhpword{Puntos} \chpword{Puntos}
\vsword{Puntaje} \hsword{Puntaje} \bvsword{Puntaje} \bhsword{Puntaje} \chsword{Puntaje}
\vtword{Total} \htword{Total} \bvtword{Total} \bhtword{Total} \chtword{Total}

\newcommand\examrule[0]{
  \rule[2ex]{\textwidth}{2pt}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Create a set of custom variables and their corresponding setters and getters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand\classname{Elementos de Programación y Lógica}
\newcommand\classacronym{EPyL - UNQ}

\makeatletter
\def\@professor{\relax}
\newcommand{\professor}[1]{\gdef\@professor{#1}}
\newcommand{\theprofessor}{%
  \ifthenelse{\equal{\@professor}{\relax}}{}{\textbf{Profesor: \@professor}}%
}

\def\@topic{\relax}
\newcommand{\topic}[1]{\gdef\@topic{#1}}
\newcommand{\thetopic}{%
  \ifthenelse{\equal{\@topic}{\relax}}{}{\textbf{Tema: \@topic}}%
}

\def\@timelimit{\relax}
\newcommand{\timelimit}[1]{\gdef\@timelimit{#1}}
\newcommand{\thetimelimit}{%
  \ifthenelse{\equal{\@timelimit}{\relax}}{}{\textbf{Tiempo Límite: \@timelimit}}%
}

\def\@instance{\relax}
\newcommand{\instance}[1]{\gdef\@instance{#1}}
\newcommand{\theinstance}{%
  \ifthenelse{\equal{\@instance}{\relax}}{}{\textbf{Instancia: \@instance}}%
}

\newcommand{\thetitle}{%
  \ifthenelse{\equal{\@title}{}}{}{\@title}%
}
\newcommand{\thedate}{%
  \ifthenelse{\equal{\@date}{}}{}{\@date}%
}

\newcommand\examlogo{\includegraphics[scale=0.07]{../../common/unq_logo.jpg}}
\makeatother

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Additional styles and commands
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newmdenv[
  topline=false,
  bottomline=false,
  skipabove=\topsep,
  skipbelow=\topsep
]{quoted}

\newmdenv[
  topline=true,
  leftline=false,
  rightline=false,
  bottomline=false
]{emptyboxed}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Exam sections
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand\makeexamheader{
  \begin{center}
    \begin{tabular*}{\textwidth}{c c @{\extracolsep{\fill}} r}
      {\multirow{4}{*}{\examlogo} }
       & & \textbf{\thedate}\\
       & & \textbf{Ciclo Introductorio}\\
       & & \textbf{\classname}\\
       & & \\
    \end{tabular*}
  \end{center}
}

\newcommand\makeexamtitle{
  \center{\Large{\thetitle}}\normalsize
  \vspace{0.1cm}
}
\newcommand\makeexamextradata{
  \begin{tabular*}{\textwidth}{l @{\extracolsep{\fill}} r}
      & \\
      \theprofessor & \thetimelimit \\
      \thetopic & \textbf{Comisión: \makebox[1in]{\hrulefill}} \\
      \theinstance & \textbf{Nombre: \makebox[1.58in]{\hrulefill}} \\
  \end{tabular*}
  \examrule
}

\newcommand\makepointstable{
  \begin{center}
    \gradetable[h][questions]\\
  \end{center}
}

\newcommand\makeexamwarning{
  \noindent
  Tomesé el tiempo de leer todas las preguntas cuidadosamente antes de comenzar
  y realice las consultas que crea oportunas sobre el enunciado. Intente
  comenzar por los enunciados que le resulten más sencillos.\\
  Las respuestas al examen pueden escribirse en la parte posterior de las hojas
  o puede usar hojas adicional para expandir su respuesta de ser necesario.\\
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Line numbering supressing for listings
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\let\origthelstnumber\thelstnumber
\makeatletter
\newcommand*\Suppressnumber{%
  \lst@AddToHook{OnNewLine}{%
    \let\thelstnumber\relax%
    \advance\c@lstnumber-\@ne\relax%
  }%
}

\newcommand*\Reactivatenumber[1][\relax]{%
  \lst@AddToHook{OnNewLine}{%
    \ifthenelse{\equal{#1}{\relax}}{}
      {\global\c@lstnumber#1}%
    \let\thelstnumber\origthelstnumber%
    \advance\c@lstnumber\@ne\relax%
  }%
}

\makeatother

\newcommand\jump{\vspace{1em}}

\newcommand\success[1]{
  \textbf{\color{green!80!black}#1}
}

\newcommand\error[1]{
  \textbf{\color{red!80}#1}
}

\newcommand\colored[1]{
  {\color{red!80}#1}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Comands for propositional logic
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

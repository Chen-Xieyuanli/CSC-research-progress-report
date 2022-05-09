% arch-tag: 4e6a9f27-cbd8-4fe9-a2ce-2105039b24f9
% Author: Jan Schumacher <jschumac@physik.uni-bonn.de>
% Last Change: Nov 2004
\NeedsTeXFormat{LaTeX2e}  \ProvidesClass{briefcd_3en}
\RequirePackage{ifthen}
\RequirePackage{graphicx}
\RequirePackage{color}
\RequirePackage[latin1]{inputenc}   % SWD 2007
\newboolean{@german}      \setboolean{@german}{false}
\DeclareOption{ngerman}{\setboolean{@german}{false}}
\DeclareOption{english}{\setboolean{@german}{true}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{letter}}
\ExecuteOptions{ngerman}   \ProcessOptions
\LoadClass[a4paper]{letter}
\newcommand{\lettergerman}{}
\newcommand{\letterenglish}{}
\ifthenelse{\boolean{@german}}
  {\RequirePackage{ngerman}\lettergerman}{\letterenglish}

% Bibliography   SWD 2007
\newdimen\bibindent
\setlength\bibindent{1.5em}
\newenvironment{thebibliography}[1]
     {%%\section*{\refname}%
      \@mkboth{\MakeUppercase\refname}{\MakeUppercase\refname}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty
% end SWD 2007


% Seitenaufteilung
\setlength{\hoffset}{-1in}              % Horizontaler Offset des Druckertreibers kompensiert
\setlength{\voffset}{-1in}              % Vertikaler Offset des Druckertreibers kompensiert
\setlength{\marginparwidth}{40mm}       % Breite der Randboxen
\setlength{\oddsidemargin}{20mm}        % Linker Rand (ungerade Seiten)
\setlength{\evensidemargin}{20mm}       % Linker Rand (gerade Seiten)
\setlength{\headsep}{0mm}               % Abstand von der Kopfzeile zum Text
\setlength{\topmargin}{17mm}            % Oberer Rand
\newdimen\logoheight          \setlength{\logoheight}{22mm}             % H�he des graphischen Logos
\newdimen\divisionheight      \setlength{\divisionheight}{28.5pt}       % H�her der drei Zeilen f�r die �bergeordnete Funktionseinheit
\newdimen\subdivisionheight   \setlength{\subdivisionheight}{\divisionheight}  % H�her der drei Zeilen f�r die �bergeordnete Funktionseinheit
\newdimen\vheaderskip         \setlength{\vheaderskip}{2mm}             % vertikaler Abstand der Bl�cke im Header
\newdimen\headerskip          \setlength{\headerskip}{\vheaderskip}     % horizontaler Abstand der Bl�cke im Header
  \addtolength{\headerskip}{2mm}
\newdimen\addressskip         \setlength{\addressskip}{9mm}             % Erh�hung der Adresse �ber die Absenderinformationen
\newdimen\addressheight       \setlength{\addressheight}{31mm}
\newdimen\subjectheight       \setlength{\subjectheight}{20mm}
\newdimen\addresswidth        \setlength{\addresswidth}{78mm}
\newdimen\fromwidth           \setlength{\fromwidth}{58mm}
\newdimen\bottommargin        \setlength{\bottommargin}{0mm}           % Unterer Rand
\setlength{\textwidth}{4mm}             % Textbreite -- 4mm als fudge-factor n�tig.
  \addtolength{\textwidth}{\addresswidth}
  \addtolength{\textwidth}{\fromwidth}
\setlength{\headheight}{0mm}            % H�he der Kopfzeile bis unter die Kurzanschrift
  \addtolength{\headheight}{\logoheight}
  \addtolength{\headheight}{\divisionheight}
  \addtolength{\headheight}{2\vheaderskip}
  \addtolength{\headheight}{9.5pt}      % H�he einer Zeile in 8.00pt, entspricht der Funktion oder Name Zeile, auf die die Kurzadresse ausgerichtet ist
  \addtolength{\headheight}{\addressskip}
\setlength{\fboxsep}{0pt}               % Fboxen zum debuggen ohne Rand
\setlength{\textheight}{0mm}            % Texth�he
  \addtolength{\textheight}{296mm}
  \addtolength{\textheight}{-\topmargin}
  \addtolength{\textheight}{-\headheight}
  \addtolength{\textheight}{-\headsep}
  \addtolength{\textheight}{-\bottommargin}
  \addtolength{\textheight}{-13mm}
\newdimen\senderboxheight     \setlength{\senderboxheight}{296mm}       % H�he der Randspalte mit den Absenderinformationen
  \addtolength{\senderboxheight}{-\topmargin}
  \addtolength{\senderboxheight}{-\logoheight}
  \addtolength{\senderboxheight}{-2\divisionheight}
  \addtolength{\senderboxheight}{-3\vheaderskip}
  \addtolength{\senderboxheight}{-\bottommargin}
  \addtolength{\senderboxheight}{-13.5pt}                               % Mir ist nicht wirklich klar, warum das hierhin geh�rt



% Dummyvariablen
\newdimen\tmplength


% L�schung nicht ben�tigter Definitionen
\let\name\@undefined
\let\fromname\@undefined
\let\address\@undefined
\let\fromaddress\@undefined
\let\location\@undefined
\let\fromlocation\@undefined
\let\telephone\@undefined
\let\telephonenum\@undefined
\let\fromsig\@undefined

% Definitionen und Variablen
\newcommand{\cdaddress}{\includegraphics[height=20mm]{uniLogo}}
\newcommand{\cdaddressigg}{\includegraphics[width=28mm,height=22mm]{igg}}
\newcommand{\fromsig}{}
\def\signature#1{\renewcommand{\fromsig}{#1}}
\newcommand{\@shortsender}{\hspace{3em}}
\def\shortsender#1{\renewcommand{\@shortsender}{#1}}
\newcommand{\@shortaddress}{53115 Bonn}                      % Die Voreinstellung sollte �bernommen werden. 
\def\shortaddress#1{\renewcommand{\@shortaddress}{#1}}

\newcommand{\@replyaddress}{}
\newboolean{@replyaddressset}
\setboolean{@replyaddressset}{false}
\def\replyaddress#1{
  \renewcommand{\@replyaddress}{#1}
  \setboolean{@replyaddressset}{true}
}

\newcommand{\@name}{}                                        % Name (in Fettschrift)
\newboolean{@nameset}
\setboolean{@nameset}{false}
\def\name#1{
  \renewcommand{\@name}{#1}
  \setboolean{@nameset}{true}
}
\newcommand{\noname}{
  \setboolean{@nameset}{false}
}

\newcommand{\@function}{Department of Photogrammetry \& Robotics}                                    % Name und/oder Funktion
\def\function#1{\renewcommand{\@function}{#1}}
\newcommand{\@subject}{}
\def\subject#1{\renewcommand{\@subject}{#1}}

% Kommandos f�r den rechten Rand
\newcommand{\ap@name}{}                                      % Name des Ansprechpartners
\newboolean{ap@nameset}
\setboolean{ap@nameset}{false}
\def\apname#1{
  \renewcommand{\ap@name}{#1}
  \setboolean{ap@nameset}{true}
}

\newcommand{\ap@postalcode}{}                                % Postleitzahl
\def\appostalcode#1{\renewcommand{\ap@postalcode}{#1}}
\newcommand{\ap@town}{Bonn}                                  % Ort
\def\aptown#1{\renewcommand{\ap@town}{#1}}
\newcommand{\ap@street}{}                                    % Strasse

\newboolean{@altstreetstyle}\setboolean{@altstreetstyle}{false}     % Verwende den Postanschrift/Dienstgeb�ude-Stil
\def\altstreetstyle{\setboolean{@altstreetstyle}{true}}
\def\apstreet#1{\renewcommand{\ap@street}{#1}}

\newcommand{\ap@tel}{frei}                                        % Telefonnummer
\newcommand{\ap@telprefix}{+49-228-73-frei}
\newcommand{\aptel}[2][+49-228-73-]{
  \renewcommand{\ap@telprefix}{#1}
  \renewcommand{\ap@tel}{#2}
}

\newcommand{\ap@fax}{}                                        % Faxnummer
\newcommand{\ap@faxprefix}{+49-228-73-}
\newcommand{\apfax}[2][+49-228-73-]{
  \renewcommand{\ap@faxprefix}{#1}
  \renewcommand{\ap@fax}{#2}
}

\newcommand{\ap@email}{}
\def\apemail#1{\renewcommand{\ap@email}{#1}}
\newcommand{\ap@wwwuni}{www.uni-bonn.de} 
\def\apwwwuni#1{\renewcommand{\ap@wwwuni}{#1}}
\newcommand{\@division}{Institute of Geodesy and Geoinformation}
\def\division#1{\renewcommand{\@division}{#1}}
\newcommand{\@subdivision}{Department of Photogrammetry \& Robotics}
\def\subdivision#1{\renewcommand{\@subdivision}{#1}}
\newcommand{\@secretariat}{}
\def\secretariat#1{\renewcommand{\@secretariat}{#1}}

\newcommand{\@sectel}{}                                       % Telefonnummer Sekretariat
\newcommand{\@sectelprefix}{+49-228-73-}
\newcommand{\sectel}[2][+49-228-73-]{
  \renewcommand{\@sectelprefix}{#1}
  \renewcommand{\@sectel}{#2}
}

\newcommand{\@apsign}{}
\def\apsign#1{\renewcommand{\@apsign}{#1}}
\newcommand{\@bank}{
Universit\"atskasse Bonn: \\
\\
Sparkasse Bonn \\
Konto-Nr. 57695 \\
BLZ 380 500 00 \\
\\
Deutsche Bundesbank \\
Filiale Bonn \\
Konto-Nr. 380 015 21 \\
BLZ 380 000 00 \\
\\
Postbank K\"oln \\
Konto-Nr. 10933502 \\
BLZ 370 100 \\
\\
UmSt.Id.Nr. \\
DE 122 119 125
}
\newboolean{@showbank}\setboolean{@showbank}{false}   % Normalerweise wollen wir die Bankverbindung nicht haben
\def\nobank{\setboolean{@showbank}{false}}
\def\showbank{\setboolean{@showbank}{true}}
\newcommand{\bank}[2][true]{
  \setboolean{@showbank}{#1}
  \renewcommand{\@bank}{#2}
}


\newcommand{\righttext}{
\ifthenelse{\boolean{ap@nameset}}
  {\ap@name \\}
  {}
\ifthenelse{\boolean{@altstreetstyle}}
  {}
  {\ap@street\\
  \ap@postalcode{} \ap@town\\[2mm]}
Tel.: \ap@telprefix \ap@tel\\
Fax:  \ap@faxprefix \ap@fax\\
\ap@email\\[2mm]
\ifthenelse{\equal{\@secretariat}{}}
  {}
  {Secretary: \@secretariat\\
  Tel.: \@sectelprefix \@sectel \\
  Fax:  \ap@faxprefix \ap@fax\\
  }
\ifthenelse{\boolean{@altstreetstyle}}
  {Postanschrift: \mbox{\ap@postalcode{} \ap@town}\\
  Dienstgeb\"aude: \mbox{\ap@street}\\}
  {}
\ifthenelse{\equal{\ap@wwwuni}{}}
  {}
  %{\ap@wwwuni\\}wegkommentiert!!!!!!!!!!!!!!A
  % \\
\ifthenelse{\equal{\@apsign}{}}
  {}
  {Aktenzeichen: \@apsign\\
  \\}
{\flushleft
\ap@town{}, \@date\\
}
\ifthenelse{\boolean{@showbank}}
  {\vfill
  \begin{minipage}[t]{\marginparwidth}
    \@bank
  \end{minipage}}
  {}
}


% Zeichensatzauswahl
\renewcommand{\familydefault}{\sfdefault}



% Redefinition des Kopfes
\def\ps@firstpage{\def\@oddhead{%
  \begin{tabular}[b]{@{}p{\addresswidth}@{}@{\extracolsep{\headerskip}}p{\fromwidth}@{}@{}p{\marginparwidth}@{\extracolsep{0pt}}}
    %\hline
      %\fbox{MxM}
      &
      % Gibt es eine weniger verbose M�glichkeit L�ngen zu addieren?
      \setlength{\tmplength}{\logoheight}
      \addtolength{\tmplength}{\vheaderskip}
      \parbox[][\tmplength][t]{\fromwidth}{{\begin{flushright} \cdaddress \end{flushright}}}
      & 
      \setlength{\tmplength}{\logoheight}
      \addtolength{\tmplength}{\vheaderskip}
      \parbox[][\tmplength][t]{\fromwidth}{{\begin{flushleft} \cdaddressigg \end{flushleft}}}

      %\fbox{MxM}
      \\
    %\hline
      &
      \setlength{\tmplength}{\divisionheight}
      \addtolength{\tmplength}{\vheaderskip}
      \begin{minipage}[t][\tmplength][t]{\fromwidth}
        \begin{flushright}
        \footnotesize
        Rheinische \linebreak
        Friedrich-Wilhelms- \linebreak
        Universit\"at Bonn
        \end{flushright}
      \end{minipage}
      &
      \begin{minipage}[t][][t]{\marginparwidth}
        \begin{flushleft}
        \footnotesize
        \@division 
        \end{flushleft}
      \end{minipage}
      \\
    %\hline
      \begin{minipage}[t][2ex][t]{\addresswidth}
        \makebox[-3pt][r]{    % -3pt sind reine Empirik
          \parbox[t]{8mm}{      % ebenso Empirik; 9.5mm w�ren zu erwarten gewesen
            \mbox{} \\
            \setlength{\unitlength}{1mm}
            \begin{picture}(1,97)
              \multiput(0,0)(0,46){3}{     % 46 ist Empirik
                \definecolor{UniGray}{cmyk}{0, 0, 0.15, 0.55}
                \textcolor{UniGray}{\rule{1mm}{1mm}}
              }
            \end{picture}
          }
        }
        \begin{minipage}[t][][t]{\addresswidth}
          \begin{flushleft}
          \scriptsize

        \ifthenelse{\boolean{@replyaddressset}}
          {\@replyaddress}
          {Universit{\"a}t Bonn\,$\cdot$\,{IGG \,$\cdot$\, Photogrammetry \& Robotics}\, \\ \@shortsender{}\,$\cdot$\,\@shortaddress}
	  %universit\"at \textbf{bonn}  $\cdot$ \@shortsender{} $\cdot$ \@shortsender{} $\cdot$ \@shortaddress
	  %% Uni~Bonn%versit\"at Bonn
	  %%uni~\textbf{bonn}\,$\cdot$\,{Photogrammetrie}\,$\cdot$\,\@shortsender{}\,$\cdot$\,\@shortaddress
          \end{flushleft}
        \end{minipage}
      \end{minipage}
      &
      \setlength{\tmplength}{\subdivisionheight}
      \addtolength{\tmplength}{\vheaderskip}
      \begin{minipage}[t][\tmplength][t]{\fromwidth}
        \begin{flushright}
        \footnotesize
        \ifthenelse{\boolean{@nameset}}
          {\textbf{\@name} \\}
          {}
        \@function
        \end{flushright}
      \end{minipage}
      &
      \begin{minipage}[t][][t]{\marginparwidth}
        \begin{flushleft}
        \footnotesize
        \@subdivision
        \end{flushleft}
      \end{minipage}
      \parbox[t][\senderboxheight][t]{\marginparwidth}{{\footnotesize \righttext}}
      \\
    %\hline
      &
      &
      %\parbox[t][\senderboxheight][t]{\marginparwidth}{{\footnotesize \righttext}}
      \\
    %\hline
  \end{tabular}
  }
  \def\@oddfoot{}%
  \def\@evenhead{}%
  \def\@evenfoot{}%
  }

\def\ps@headings{\def\@evenhead{%
  \begin{tabular}[b]{@{}p{\addresswidth}@{}@{\extracolsep{\headerskip}}p{\fromwidth}@{}@{}p{\marginparwidth}@{\extracolsep{0pt}}}
    %\hline
      %\fbox{MxM}
      &
      % Gibt es eine weniger verbose M�glichkeit L�ngen zu addieren?
      \setlength{\tmplength}{\logoheight}
      \addtolength{\tmplength}{\vheaderskip}
      \parbox[][\tmplength][t]{\fromwidth}{{\begin{flushright} \cdaddress \end{flushright}}}
      & 
      %\fbox{MxM}
      \\
    %\hline
      &
      \setlength{\tmplength}{\divisionheight}
      \addtolength{\tmplength}{\vheaderskip}
      \begin{minipage}[t][\tmplength][t]{\fromwidth}
        \begin{flushright}
        \footnotesize
        Rheinische \linebreak
        Friedrich-Wilhelms- \linebreak
        Universit\"at Bonn
        \end{flushright}
      \end{minipage}
      &
      \\
    %\hline
      \parbox[][2cm][t]{0pt}{}
      &
      \\
  \end{tabular}
  }%
  \def\@oddfoot{}%
  \def\@oddhead{\@evenhead}%
  \def\@evenfoot{\@oddfoot}%
  }
\ps@headings


% Opening
\def\opening#1{
  \thispagestyle{firstpage}
%  \vspace*{3ex}
  \parbox[][\addressheight][t]{\addresswidth}{\toname \\ \toaddress}\\%
  \parbox[][\subjectheight][b]{\textwidth}{
    \textbf{\@subject}\\%
    \vspace*{1ex}%
  }\\%
  #1\par\nobreak
  \vspace{1\parskip}
  }

% Closing
\def\closing#1{
  \par\nobreak\vspace{\parskip}
  \setlength{\tmplength}{\parskip}
  \begin{minipage}[]{\textwidth}
    #1\\\par\nobreak
    \vspace*{3\tmplength}
    \fromsig
  \end{minipage}
  \vfill
  }



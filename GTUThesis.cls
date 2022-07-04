\ProvidesClass{GTUThesis}[2022/07/04 V2.0 by Usama Derbashi]
\NeedsTeXFormat{LaTeX2e}
\LoadClass[12pt]{report}


%%%
%%% === Packages ===
%%%

%%%%%% For Functions
\RequirePackage{etoolbox}
\RequirePackage{pgffor}%foreach
\RequirePackage{array}%table(m)
\RequirePackage{titlesec}%titleformat

%%%%%% Check for options using etoolbox
\newbool{isEN}
\newbool{isGrad}

\DeclareOption{en}{%
    \booltrue{isEN}}
\DeclareOption{tr}{%
    \boolfalse{isEN}}
\DeclareOption{undergrad}{%
    \boolfalse{isGrad}}
\DeclareOption{graduate}{%
    \booltrue{isGrad}}

\ExecuteOptions{en, graduate}
\ProcessOptions\relax

%%%%%% For Language and Typeset
\ifbool{isEN}{%
    \RequirePackage[english]{babel}
}{
    \RequirePackage[turkish,shorthands=:!]{babel}
}
\RequirePackage{newtxtext}%Times New Roman-esque font
\RequirePackage[utf8]{inputenc}
\RequirePackage[a4paper,top=25mm,bottom=25mm,left=40mm,right=25mm]{geometry}
\RequirePackage[onehalfspacing]{setspace}
\RequirePackage{indentfirst}
\RequirePackage{fancyhdr} % setting footers
\RequirePackage[bottom, perpage]{footmisc}%% amkes footnotes at the bottom

%%%%%%% Core packages
\RequirePackage[colorlinks=false]{hyperref}
\RequirePackage{amsmath}
\RequirePackage{titlesec} %titles
\RequirePackage{graphicx}
\RequirePackage[style=ieee]{biblatex}
\RequirePackage[style=american]{csquotes}% Needed for babel(in biblatex)


%%%
%%% === Set Settings ===
%%%

%%%%%% Typeset
\setlength{\parindent}{1cm}
\setlength{\abovecaptionskip}{12pt plus 0pt minus 0pt}
\setlength{\belowcaptionskip}{12pt plus 0pt minus 0pt}
\setlength{\textfloatsep}{18.0pt plus 0.0pt minus 0.0pt}
\setlength{\floatsep}{18.0pt plus 0.0pt minus 0.0pt}
\setlength{\intextsep}{18.0pt plus 0.0pt minus 0.0pt}
\setlength{\skip\footins}{18.0pt plus 0.0pt minus 0.0pt}

%%%%% Titles
\setcounter{secnumdepth}{4}
\setcounter{tocdepth}{4}
\titleformat{\chapter}[hang]{ \fontsize{18}{18}\normalfont\bfseries\MakeUppercase}{}{0pt}{\thechapter. }
\titleformat{\section}[hang]{\fontsize{16}{16}\normalfont\bfseries}{}{0pt}{\thesection. }
\titleformat{\subsection}[hang]{\fontsize{14}{14}\normalfont\bfseries}{}{0pt}{\thesubsection. }
\titleformat{\subsubsection}[hang]{\fontsize{14}{14}\normalfont\bfseries}{}{0pt}{\thesubsubsection. }
\titlespacing*{\chapter}{0pt}{0pt}{18pt}
\titlespacing*{\section}{0pt}{18pt}{18pt}
\titlespacing*{\subsection}{0pt}{18pt}{18pt}
\titlespacing*{\subsubsection}{0pt}{18pt}{18pt}
\patchcmd{\chapter}{\thispagestyle{plain}}{\thispagestyle{fancy}}{}{}
\renewcommand{\footnoterule}{%
  \hrule width \textwidth%
}
\renewcommand{\headrulewidth}{0pt}
\pagestyle{fancy}

%pointing the directory of images and refs
\graphicspath{{./Imgs/}}
\addbibresource{refs.bib}


%%%
%%% === Main writer parameters ===
%%%
\newcommand*{\GTUAuthor}[1]{\gdef\@GTUAuthor{#1}\author{#1}%
}
\newcommand*{\@GTUAuthor}{\@author}

\newcommand*{\GTUTitle}[1]{\gdef\@GTUTitle{#1}\title{#1}%
}
\newcommand*{\@GTUTitle}{\@title}

\newcommand*{\GTUFaculty}[1]{\gdef\@GTUFaculty{#1}%
}
\newcommand*{\@GTUFaculty}{FACULTY OF ENGINEERING}

\newcommand*{\GTUDepartment}[1]{\gdef\@GTUDepartment{#1}%
}
\newcommand*{\@GTUDepartment}{COMPUTER ENGINEERING DEPARTMENT}

\newcommand*{\GTUProject}[1]{\gdef\@GTUProject{#1}%
}
\newcommand*{\@GTUProject}{Final Thesis}

\newcommand*{\GTUYear}[1]{\gdef\@GTUYear{#1}%
}
\newcommand*{\@GTUYear}{\the\year{}}

\newcommand*{\GTUSupervisor}[1]{\gdef\@GTUSupervisor{#1}%
}
\newcommand*{\@GTUSupervisor}{\texttt{\string \GTUSupervisor} currently
not set. Please fix this.}

\newcommand*{\GTUDecreeNo}[1]{\gdef\@GTUDecreeNo{#1}%
}
\newcommand*{\@GTUDecreeNo}{\texttt{\string \GTUDecreeNo} currently
not set. Please fix this.}

\newcommand*{\GTUDecreeDate}[1]{\gdef\@GTUDecreeDate{#1}%
}
\newcommand*{\@GTUDecreeDate}{\texttt{\string \GTUDecreeDate} currently
not set. Please fix this.}

\newcommand*{\GTUDefenceDate}[1]{\gdef\@GTUDefenceDate{#1}%
}
\newcommand*{\@GTUDefenceDate}{\texttt{\string \GTUDefenceDate} currently
not set. Please fix this.}

\newcommand*{\GTUJury}[1]{\gdef\@GTUJury{#1}%
}
\newcommand*{\@GTUJury}{\texttt{\string \GTUJury} currently
not set. Please fix this.}


%%%
%%% === Set Environments ===
%%%
\newenvironment{outertitles}{%
    \titleformat{\chapter}[hang]{\fontsize{16}{16}\normalfont\bfseries\centering}{}{0pt}{\MakeUppercase}%
    \titleformat{\section}[hang]{\fontsize{14}{14}\normalfont\bfseries}{}{0pt}{}%
    \titlespacing*{\chapter}{0pt}{0pt}{24pt}%
}{}

\renewenvironment{quote}{%
\it``}{"}


%%%
%%% === Helping functions for predefined pages ===
%%%

\newcommand*{\GTUMakeCoverUndergrad}{%
    \begin{titlepage}
    {
        \setlength{\parindent}{0cm} %suppresses indentation
        \begin{center}
        {\fontsize{18}{27}\normalfont\bf\MakeUppercase{
            \ifbool{isEN}{%
                REPUBLIC OF TURKEY\\
                GEBZE TECHNICAL UNIVERSITY\\
            }{
                T.C.\\
                GEBZE TEKNİK ÜNİVERSİTESİ\\
            }
            \@GTUFaculty\\
            \@GTUDepartment\\
        }}
        \vspace{3.5cm}
        
        \begin{table}[hbt!]
            \centering
            \begin{tabular}{|p{14cm}|}
                \hline
                
                \begin{center}
                    \vspace{18pt}
                    {\fontsize{18}{27}\normalfont\MakeUppercase{\@GTUTitle\\}}
                    \vspace{36pt}
                    {\fontsize{18}{27}\normalfont\MakeUppercase{\@GTUAuthor\\}}
                    \vspace{72pt}
                    \ifbool{isEN}{%
                        {\fontsize{14}{14}\normalfont{SUPERVISOR\\}}
                    }{
                        {\fontsize{14}{14}\normalfont{DANIŞMANI\\}}
                    }
                    {\fontsize{16}{16}\normalfont\MakeUppercase{\@GTUSupervisor\\}}
                    \vspace{27pt}
                    {\fontsize{14}{21}\normalfont\MakeUppercase{
                        GEBZE\\
                        \@GTUYear
                    }}
                    \vspace{18pt}
                \end{center}\\
                
                \hline
            \end{tabular}
        \end{table}
        \end{center}
    }
    \end{titlepage}
}

\newcommand*{\GTUMakeCoverGraduate}{%
    \begin{titlepage}
    {
        \setlength{\parindent}{0cm} %suppresses indentation
        \begin{center}
        {\fontsize{14}{21}\normalfont\bf\MakeUppercase{
            \ifbool{isEN}{%
                REPUBLIC OF TURKEY\\
                GEBZE TECHNICAL UNIVERSITY\\
            }{
                T.C.\\
                GEBZE TEKNİK ÜNİVERSİTESİ\\
            }
            \@GTUFaculty\\
        }}
        \vfill
        
        {\fontsize{14}{21}\normalfont\bf\MakeUppercase{\@GTUTitle\\}}
        \vfill
        
        {\fontsize{14}{21}\normalfont\bf\MakeUppercase{
            \@GTUAuthor\\
            \@GTUProject\\
            \@GTUDepartment\\
        }}
        \vfill
        
        {\fontsize{14}{21}\normalfont\bf\MakeUppercase{
            GEBZE\\
            \@GTUYear
        }}
        
        \end{center}
    }
    \end{titlepage}
}

\newcommand*{\GTUMakeTitle}{%
    \begin{titlepage}
    {
        \setlength{\parindent}{0cm} %suppresses indentation
        \begin{center}
        {\fontsize{18}{27}\normalfont\bf\MakeUppercase{
            \ifbool{isEN}{%
                REPUBLIC OF TURKEY\\
                GEBZE TECHNICAL UNIVERSITY\\
            }{
                T.C.\\
                GEBZE TEKNİK ÜNİVERSİTESİ\\
            }
            \@GTUFaculty\\
        }}
        \vfill
        
        {\fontsize{20}{30}\normalfont\bf\MakeUppercase{\@GTUTitle\\}}
        \vfill
        
        {\fontsize{16}{24}\normalfont\bf\MakeUppercase{
            \@GTUAuthor\\
            \@GTUProject\\
            \@GTUDepartment\\
        }}
        \vfill
        
        \ifbool{isEN}{%
            {\fontsize{14}{14}\normalfont{SUPERVISOR\\}}
        }{
            {\fontsize{14}{14}\normalfont{DANIŞMANI\\}}
        }
        {\fontsize{14}{14}\normalfont\MakeUppercase{\@GTUSupervisor\\}}
        \vfill
        
        {\fontsize{16}{24}\normalfont\bf\MakeUppercase{
            GEBZE\\
            \@GTUYear
        }}
        
        \end{center}
    }
    \end{titlepage}
}

\newcommand*{\GTUMakeJuryEN}{%
    \thispagestyle{empty}
    \begin{center}
        \begin{tabular}{|m{6.75cm}|>{\centering\arraybackslash}m{6.75cm}|}
            \hline
            \vspace{1mm}\includegraphics[width=0.45\textwidth]{gtu_logo.jpg} & \MakeUppercase{\@GTUProject\ jury approval form}\\
            \hline
        \end{tabular}
    \end{center}
    
    \ifbool{isGrad}{%
        The thesis of \@GTUAuthor, which was defended on \@GTUDefenceDate\ in front of the jury formed by the decision of the board of Gebze Technical University, \@GTUFaculty\ number \@GTUDecreeNo\ dated \@GTUDecreeDate, was accepted as \@GTUProject\ in the field of \MakeLowercase{\@GTUDepartment}.
    }{%
        The thesis of \@GTUAuthor, was accepted on \@GTUDefenceDate\ by the jury as \@GTUProject\ in the field of \MakeLowercase{\@GTUDepartment}.
    }
    
    \begin{center}
        \bf JURY
    \end{center}
    
    % Create jury table content
    % unfortunately foreach doesn't work inside tabular environment
    \newcommand*\jurytablecontents{}
    \foreach \entry in \@GTUJury{
        \xappto\jurytablecontents{Member&:& \entry \\\\}
    }
    
    \begin{tabular}{lcl}
        Member\\(Supervisor)&:&  \@GTUSupervisor \\\\
        \jurytablecontents{}
    \end{tabular}
    
    \vfill
    \ifbool{isGrad}{%
        \begin{center}
            \bf APPROVAL
        \end{center}
        The decision of the board of Gebze Technical University, \@GTUFaculty\ number \@GTUDecreeNo\ dated \@GTUDecreeDate.
        
        \begin{center}
            Signature/Stamp
        \end{center}
    }{}
    
    \clearpage
}

\newcommand*{\GTUMakeJuryTR}{%
    \thispagestyle{empty}
    \begin{center}
        \begin{tabular}{|m{6.75cm}|>{\centering\arraybackslash}m{6.75cm}|}
            \hline
            \vspace{1mm}\includegraphics[width=0.45\textwidth]{gtu_logo.jpg} & \MakeUppercase{\@GTUProject\ jüri onay formu}\\
            \hline
        \end{tabular}
    \end{center}
    
    \ifbool{isGrad}{%
        Gebze Teknik Üniversitesi \@GTUFaculty\ Yönetim Kurulu'nun \@GTUDecreeDate\ tarih ve \@GTUDecreeNo\ sayılı kararıyla oluşturulan jüri tarafından \@GTUDefenceDate\ tarihinde tez savunma sınavı yapılan \@GTUAuthor 'ın tez çalışması \MakeLowercase{\@GTUDepartment} Anabilim Dalında \@GTUProject\ olarak kabul edilmiştir.
    }{%
        \@GTUDefenceDate\ tarihinde \@GTUAuthor 'ın tez çalışması \MakeLowercase{\@GTUDepartment} Anabilim Dalında \@GTUProject\ olarak kabul edilmiştir.
    }
    
    \begin{center}
        \bf JÜRİ
    \end{center}
    
    % Create jury table content
    % unfortunately foreach doesn't work inside tabular environment
    \newcommand*\jurytablecontents{}
    \foreach \entry in \@GTUJury{
        \xappto\jurytablecontents{ÜYE&:& \entry \\\\}
    }
    
    \begin{tabular}{lcl}
        ÜYE\\(DANIŞMANI)&:&  \@GTUSupervisor \\\\
        \jurytablecontents{}
    \end{tabular}
    
    \vfill
    \ifbool{isGrad}{%
        \begin{center}
            \bf ONAY
        \end{center}
        Gebze Teknik Üniversitesi \@GTUFaculty\ Yönetim Kurulu'nun \@GTUDecreeDate\ tarih ve \@GTUDecreeNo\ sayılı kararı.
        
        \begin{center}
            İMZA/MÜHÜR
        \end{center}
    }{}
    \clearpage
}

\newcommand*{\GTUMakeFront}{%
    \pagenumbering{roman} %start with roman numbering
    \fancyhf{}
    \fancyfoot[C]{\fontsize{11pt}{11pt}\thepage}
    \ifbool{isGrad}{%
        \GTUMakeCoverGraduate
    }{
        \GTUMakeCoverUndergrad
    }
    \GTUMakeTitle
    
    \setcounter{page}{3} %the first two title pages are not counted so this is a buffer
    \begin{outertitles} % makes titles centred
    
    \ifbool{isEN}{%
        \GTUMakeJuryEN
    }{
        \GTUMakeJuryTR
    }
    \input{./Body/Frontmatter/Abstract}
    \input{./Body/Frontmatter/Ozet}
    \input{./Body/Frontmatter/Acknowledgement}
    
    \tableofcontents
    \ifbool{isEN}{%
        \addcontentsline{toc}{chapter}{Contents}
    }{
        \addcontentsline{toc}{chapter}{İçindekiler}
    }
    \clearpage
    
    \input{./Body/Frontmatter/ListOfAcro}
  
    \ifbool{isEN}{}{%
        \renewcommand{\listfigurename}{Şekiller Dizini}
        \renewcommand{\listtablename}{Tablolar Dizini}
    }
    
    \listoffigures
    \ifbool{isEN}{%
        \addcontentsline{toc}{chapter}{List of Figures}
    }{
        \addcontentsline{toc}{chapter}{Şekiller Dizini}
    }
    \clearpage
    
    \listoftables
    \ifbool{isEN}{%
        \addcontentsline{toc}{chapter}{List of Tables}
    }{
        \addcontentsline{toc}{chapter}{Tablolar Dizini}
    }
    \clearpage
    
    \end{outertitles}
    \fancyhf{}%reset footer
    \fancyfoot[R]{\fontsize{11pt}{11pt}\thepage}%page numbers in the corner
    \addtocontents{toc}{\protect\vspace{24pt}}
    \pagenumbering{arabic}%turn to arabic numbers
}

\newcommand*{\GTUMakeBack}[1]{%
    \begin{outertitles}
    \clearpage
    \setlength{\emergencystretch}{1em}
    \printbibliography
    \addtocontents{toc}{\protect\vspace{24pt}}
    \ifbool{isEN}{%
        \addcontentsline{toc}{chapter}{Bibliography}
    }{
        \addcontentsline{toc}{chapter}{Kaynakça}
    }
   
    \ifnum\pdfmatch{cv}{#1}=1
        \input{./Body/Backmatter/CV}%
    \fi
    \ifnum\pdfmatch{ap}{#1}=1
        \input{./Body/Backmatter/Appendices} %
    \fi
    
    \end{outertitles}
}

\endinput
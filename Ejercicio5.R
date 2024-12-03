% Options for packages loaded elsewhere
\PassOptionsToPackage{unicode}{hyperref}
\PassOptionsToPackage{hyphens}{url}
\PassOptionsToPackage{dvipsnames,svgnames*,x11names*}{xcolor}
%
\documentclass[
]{article}
\usepackage{lmodern}
\usepackage{amssymb,amsmath}
\usepackage{ifxetex,ifluatex}
\ifnum 0\ifxetex 1\fi\ifluatex 1\fi=0 % if pdftex
  \usepackage[T1]{fontenc}
  \usepackage[utf8]{inputenc}
  \usepackage{textcomp} % provide euro and other symbols
\else % if luatex or xetex
  \usepackage{unicode-math}
  \defaultfontfeatures{Scale=MatchLowercase}
  \defaultfontfeatures[\rmfamily]{Ligatures=TeX,Scale=1}
\fi
% Use upquote if available, for straight quotes in verbatim environments
\IfFileExists{upquote.sty}{\usepackage{upquote}}{}
\IfFileExists{microtype.sty}{% use microtype if available
  \usepackage[]{microtype}
  \UseMicrotypeSet[protrusion]{basicmath} % disable protrusion for tt fonts
}{}
\makeatletter
\@ifundefined{KOMAClassName}{% if non-KOMA class
  \IfFileExists{parskip.sty}{%
    \usepackage{parskip}
  }{% else
    \setlength{\parindent}{0pt}
    \setlength{\parskip}{6pt plus 2pt minus 1pt}}
}{% if KOMA class
  \KOMAoptions{parskip=half}}
\makeatother
\usepackage{xcolor}
\IfFileExists{xurl.sty}{\usepackage{xurl}}{} % add URL line breaks if available
\IfFileExists{bookmark.sty}{\usepackage{bookmark}}{\usepackage{hyperref}}
\hypersetup{
  pdftitle={Examen 2 Ejercicio 5},
  pdfauthor={Armando Jessica Luz},
  colorlinks=true,
  linkcolor=Maroon,
  filecolor=Maroon,
  citecolor=Blue,
  urlcolor=blue,
  pdfcreator={LaTeX via pandoc}}
\urlstyle{same} % disable monospaced font for URLs
\usepackage[margin=1in]{geometry}
\usepackage{color}
\usepackage{fancyvrb}
\newcommand{\VerbBar}{|}
\newcommand{\VERB}{\Verb[commandchars=\\\{\}]}
\DefineVerbatimEnvironment{Highlighting}{Verbatim}{commandchars=\\\{\}}
% Add ',fontsize=\small' for more characters per line
\usepackage{framed}
\definecolor{shadecolor}{RGB}{248,248,248}
\newenvironment{Shaded}{\begin{snugshade}}{\end{snugshade}}
\newcommand{\AlertTok}[1]{\textcolor[rgb]{0.94,0.16,0.16}{#1}}
\newcommand{\AnnotationTok}[1]{\textcolor[rgb]{0.56,0.35,0.01}{\textbf{\textit{#1}}}}
\newcommand{\AttributeTok}[1]{\textcolor[rgb]{0.77,0.63,0.00}{#1}}
\newcommand{\BaseNTok}[1]{\textcolor[rgb]{0.00,0.00,0.81}{#1}}
\newcommand{\BuiltInTok}[1]{#1}
\newcommand{\CharTok}[1]{\textcolor[rgb]{0.31,0.60,0.02}{#1}}
\newcommand{\CommentTok}[1]{\textcolor[rgb]{0.56,0.35,0.01}{\textit{#1}}}
\newcommand{\CommentVarTok}[1]{\textcolor[rgb]{0.56,0.35,0.01}{\textbf{\textit{#1}}}}
\newcommand{\ConstantTok}[1]{\textcolor[rgb]{0.00,0.00,0.00}{#1}}
\newcommand{\ControlFlowTok}[1]{\textcolor[rgb]{0.13,0.29,0.53}{\textbf{#1}}}
\newcommand{\DataTypeTok}[1]{\textcolor[rgb]{0.13,0.29,0.53}{#1}}
\newcommand{\DecValTok}[1]{\textcolor[rgb]{0.00,0.00,0.81}{#1}}
\newcommand{\DocumentationTok}[1]{\textcolor[rgb]{0.56,0.35,0.01}{\textbf{\textit{#1}}}}
\newcommand{\ErrorTok}[1]{\textcolor[rgb]{0.64,0.00,0.00}{\textbf{#1}}}
\newcommand{\ExtensionTok}[1]{#1}
\newcommand{\FloatTok}[1]{\textcolor[rgb]{0.00,0.00,0.81}{#1}}
\newcommand{\FunctionTok}[1]{\textcolor[rgb]{0.00,0.00,0.00}{#1}}
\newcommand{\ImportTok}[1]{#1}
\newcommand{\InformationTok}[1]{\textcolor[rgb]{0.56,0.35,0.01}{\textbf{\textit{#1}}}}
\newcommand{\KeywordTok}[1]{\textcolor[rgb]{0.13,0.29,0.53}{\textbf{#1}}}
\newcommand{\NormalTok}[1]{#1}
\newcommand{\OperatorTok}[1]{\textcolor[rgb]{0.81,0.36,0.00}{\textbf{#1}}}
\newcommand{\OtherTok}[1]{\textcolor[rgb]{0.56,0.35,0.01}{#1}}
\newcommand{\PreprocessorTok}[1]{\textcolor[rgb]{0.56,0.35,0.01}{\textit{#1}}}
\newcommand{\RegionMarkerTok}[1]{#1}
\newcommand{\SpecialCharTok}[1]{\textcolor[rgb]{0.00,0.00,0.00}{#1}}
\newcommand{\SpecialStringTok}[1]{\textcolor[rgb]{0.31,0.60,0.02}{#1}}
\newcommand{\StringTok}[1]{\textcolor[rgb]{0.31,0.60,0.02}{#1}}
\newcommand{\VariableTok}[1]{\textcolor[rgb]{0.00,0.00,0.00}{#1}}
\newcommand{\VerbatimStringTok}[1]{\textcolor[rgb]{0.31,0.60,0.02}{#1}}
\newcommand{\WarningTok}[1]{\textcolor[rgb]{0.56,0.35,0.01}{\textbf{\textit{#1}}}}
\usepackage{graphicx,grffile}
\makeatletter
\def\maxwidth{\ifdim\Gin@nat@width>\linewidth\linewidth\else\Gin@nat@width\fi}
\def\maxheight{\ifdim\Gin@nat@height>\textheight\textheight\else\Gin@nat@height\fi}
\makeatother
% Scale images if necessary, so that they will not overflow the page
% margins by default, and it is still possible to overwrite the defaults
% using explicit options in \includegraphics[width, height, ...]{}
\setkeys{Gin}{width=\maxwidth,height=\maxheight,keepaspectratio}
% Set default figure placement to htbp
\makeatletter
\def\fps@figure{htbp}
\makeatother
\setlength{\emergencystretch}{3em} % prevent overfull lines
\providecommand{\tightlist}{%
  \setlength{\itemsep}{0pt}\setlength{\parskip}{0pt}}
\setcounter{secnumdepth}{-\maxdimen} % remove section numbering
\usepackage[spanish]{babel}
\usepackage[utf8]{inputenc}
\decimalpoint
\usepackage{booktabs}
\usepackage{longtable}
\usepackage{array}
\usepackage{multirow}
\usepackage{wrapfig}
\usepackage{float}
\usepackage{colortbl}
\usepackage{pdflscape}
\usepackage{tabu}
\usepackage{threeparttable}
\usepackage{threeparttablex}
\usepackage[normalem]{ulem}
\usepackage{makecell}
\usepackage{xcolor}
\usepackage{booktabs}
\usepackage{longtable}
\usepackage{array}
\usepackage{multirow}
\usepackage{wrapfig}
\usepackage{float}
\usepackage{colortbl}
\usepackage{pdflscape}
\usepackage{tabu}
\usepackage{threeparttable}
\usepackage{threeparttablex}
\usepackage[normalem]{ulem}
\usepackage{makecell}
\usepackage{xcolor}

\title{Examen 2 Ejercicio 5}
\author{Armando Jessica Luz}
\date{}

\begin{document}
\maketitle

Para empezar, importamos nuestra base a R Studio

\begin{Shaded}
\begin{Highlighting}[]
\NormalTok{base <-}\StringTok{ }\KeywordTok{read.csv}\NormalTok{(}\StringTok{"./Ex5.csv"}\NormalTok{, }\DataTypeTok{header =} \OtherTok{TRUE}\NormalTok{)}
\KeywordTok{str}\NormalTok{(base) }\CommentTok{# Nuestra variable Trat es char }
\end{Highlighting}
\end{Shaded}

\begin{verbatim}
## 'data.frame':    300 obs. of  3 variables:
##  $ Ant : num  19.1 14.1 19.4 14.7 12.3 ...
##  $ Trat: chr  "Med" "Med" "Med" "Med" ...
##  $ Edad: int  27 39 20 56 53 35 40 49 40 25 ...
\end{verbatim}

\begin{Shaded}
\begin{Highlighting}[]
\NormalTok{base}\OperatorTok{$}\NormalTok{Trat <-}\StringTok{ }\KeywordTok{factor}\NormalTok{(base}\OperatorTok{$}\NormalTok{Trat) }\CommentTok{# Pasamos a factor la variable Trat}
\NormalTok{base <-}\StringTok{ }\NormalTok{base }\OperatorTok{%>%}\StringTok{ }\KeywordTok{rename}\NormalTok{(}\DataTypeTok{y =}\NormalTok{ Ant,}
                          \DataTypeTok{x1 =}\NormalTok{ Edad) }\OperatorTok{%>%}\StringTok{ }
\StringTok{                   }\KeywordTok{mutate}\NormalTok{(}\DataTypeTok{xA =} \KeywordTok{if_else}\NormalTok{(Trat }\OperatorTok{==}\StringTok{ "Med"}\NormalTok{,}\DecValTok{1}\NormalTok{,}\DecValTok{0}\NormalTok{),}
                          \DataTypeTok{xB =} \KeywordTok{if_else}\NormalTok{(Trat }\OperatorTok{==}\StringTok{ "Control"}\NormalTok{,}\DecValTok{1}\NormalTok{,}\DecValTok{0}\NormalTok{))}
\KeywordTok{levels}\NormalTok{(base}\OperatorTok{$}\NormalTok{Trat) }\CommentTok{# Ya considera niveles en nuestra base}
\end{Highlighting}
\end{Shaded}

\begin{verbatim}
## [1] "Control" "Med"
\end{verbatim}

Nos encontramos con dos níveles en la variable categórica

\hypertarget{i.-realice-un-anuxe1lisis-descriptivo}{%
\section{i. Realice un análisis
descriptivo}\label{i.-realice-un-anuxe1lisis-descriptivo}}

\begin{table}[H]

\caption{\label{tab:unnamed-chunk-2}Principales estadísticas de la Efectividad por Tratamiento}
\centering
\begin{tabular}[t]{ccccc}
\toprule
Trat & Observaciones & Media & Mediana & Varianza\\
\midrule
Control & 200 & 13 & 13 & 19.7\\
Med & 100 & 17 & 17 & 9.2\\
\bottomrule
\end{tabular}
\end{table}

\begin{itemize}
\tightlist
\item
  La cantidad de observaciones es el doble en la categoría de personas
  que reibieron placebo(n=200) en contra de las que recibieron
  medicamento (n=100)
\item
  En promedio la cantidad de anticuerpos en personas medicadas es de
  16.54 mientras que en las no medicadas es de 13.40
\item
  Hay mayor variabilidad en pacientes que que no recibieron el
  medicamento(19.71), casi el doble de los que sí lo hicieron(9.18)
\end{itemize}

\includegraphics{Ejercicio5_files/figure-latex/unnamed-chunk-3-1.pdf}
Observamos en nuestras boxplots que la media de la categoría Med está
por encima de la categoría Control, en otras palabras no está diciendo
que es más probable encontrar una cantidad mayor de anticuerpos en una
persona que sí recibió el medicamento

\includegraphics{Ejercicio5_files/figure-latex/unnamed-chunk-4-1.pdf} Lo
que observamos en cambio con nuestra variable Edad es que al parecer,
mientras mayor sea nuestro paciente, menor es la cantidad de anticuerpos
presentes. Aunque también nos damos cuenta de que esto se refleja más
aún en pacientes que recibieron placebo Por tanto, esta gráfica indica
que la edad influye en el estudio de nuestros pacientes

Descriptor de varaibles:

\begin{itemize}
  \item $y_i = $ Medida de efectividad del tratamiento para el individuo $i$.
  \item $x_{i1} = $ Edad del individuo $i$.
  \item $x_{i\mathrm{A}} = \left.
  \begin{cases}
    1, & \text{Si el individuo } i \text{ recibió el Medicamento} \\
    0, & \text{e.o.c}
  \end{cases}
  \right.$
  \item $x_{i\mathrm{B}} = \left.
  \begin{cases}
    1, & \text{Si el individuo } i \text{ recibió el Placebo} \\
    0, & \text{e.o.c}
  \end{cases}
  \right.$
\end{itemize}

\hypertarget{ii.-ajuste-un-modelo-adecuado}{%
\section{ii. Ajuste un modelo
adecuado}\label{ii.-ajuste-un-modelo-adecuado}}

Ajuste un modelo adecuado para evaluar la efectividad del medicamento
ajustando por la edad de los pacientes. Es decir, un modelo que incluya
como explicativas las variables edad, la binaria asociada a la
administración del medicamento y la interacción obtenida como el
producto de estas dos.

\begin{Shaded}
\begin{Highlighting}[]
\NormalTok{fit <-}\StringTok{ }\KeywordTok{lm}\NormalTok{(y }\OperatorTok{~}\StringTok{ }\NormalTok{x1 }\OperatorTok{+}\StringTok{ }\NormalTok{xB }\OperatorTok{+}\StringTok{ }\NormalTok{x1}\OperatorTok{:}\NormalTok{xB, }\DataTypeTok{data =}\NormalTok{ base) }\CommentTok{# Ajustamos nuestro modelo a los datos}
\KeywordTok{summary}\NormalTok{(fit)}
\end{Highlighting}
\end{Shaded}

\begin{verbatim}
## 
## Call:
## lm(formula = y ~ x1 + xB + x1:xB, data = base)
## 
## Residuals:
##    Min     1Q Median     3Q    Max 
## -7.935 -1.689 -0.013  1.623  6.261 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  22.5452     0.8073   27.93  < 2e-16 ***
## x1           -0.1567     0.0201   -7.81  1.0e-13 ***
## xB            2.0300     0.9834    2.06     0.04 *  
## x1:xB        -0.1297     0.0243   -5.34  1.8e-07 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 2.5 on 296 degrees of freedom
## Multiple R-squared:  0.672,  Adjusted R-squared:  0.669 
## F-statistic:  203 on 3 and 296 DF,  p-value: <2e-16
\end{verbatim}

El modelo queda parametrizado de la siguiente manera:
\[y_i = \beta_{0} + \beta_{1}x_{i1} + \beta_{2}x_{iB} + \beta_{3}x_{i1}x_{iB}\]
Nuestro modelo quedó parametrizado considerando la categoría Med(xA)
como nivel de referencia

\[\hat{E}(y_{i};Tratamiento;Edad) = \hat{\beta}_{0} + \hat{\beta}_{1}x_{i1} + \hat{\beta}_{2}x_{iB} + \hat{\beta}_{3}x_{i1}x_{iB}\]
Donde:

\begin{itemize}
  \item $y_i = $ Medida de efectividad del tratamiento para el individuo $i$.
  \item $x_{i1} = $ Edad del individuo $i$.
  \item $x_{i\mathrm{B}} = \left.
  \begin{cases}
    1, & \text{Si el individuo } i \text{ recibió el placebo} \\
    0, & \text{e.o.c}
  \end{cases}
  \right.$
\end{itemize}

Las expresiones quedan de la siguiente manera:

\begin{itemize}
  \item Si el individuo recibió el medicamento, entonces $x_{iB} = 0$
  \begin{align*}
  \Rightarrow \hat{E}(y_{i};Med;x_{1i}) &= \hat{\beta}_{0} + \hat{\beta}_{1}x_{i1} +     \hat{\beta}_{2}x_{iB} + \hat{\beta}_{3}x_{i1}x_{iB}\\
  &=\hat{\beta}_{0} + \hat{\beta}_{1}x_{i1} + \hat{\beta}_{2}*0 +         \hat{\beta}_{3}x_{i1}*0 \\
  &= \hat{\beta}_{0} + \hat{\beta}_{1}x_{i1}\\
  \end{align*}
  \item Si el individuo recibió el placebo, entonces $x_{1B} = 1$
  \begin{align*}
  \Rightarrow \hat{E}(y_{i};Control;x_{1i}) &= \hat{\beta}_{0} + \hat{\beta}_{1}x_{i1}   + \hat{\beta}_{2}x_{iB} + \hat{\beta}_{3}x_{i1}x_{iB}\\
  &= \hat{\beta}_{0} + \hat{\beta}_{1}x_{i1} + \hat{\beta}_{2}*1 + \hat{\beta}_{3}x_{i1}*1 \\
  &= \hat{\beta}_{0} + \hat{\beta}_{1}x_{i1} + \hat{\beta}_{2} + \hat{\beta}_{3}x_{i1}
  \end{align*}
\end{itemize}

Observemos lo que sucede con nuestros parámetros:

\begin{verbatim}
## (Intercept)          x1          xB       x1:xB 
##       22.55       -0.16        2.03       -0.13
\end{verbatim}

Las estimaciones de los parámetros son:
\[\hat\beta_0=22.55,~\hat\beta_1=-0.16,~ \hat\beta_2=2.03,~\hat\beta_3=-0.13\]

Las expresiones del valor esperado de la efectividad para cada
tratamiento son:

\begin{itemize}
  \item Caso Med
  \begin{align*}
  \Rightarrow\hat{E}(y_{i};Med;x_{1i}) &= \hat{\beta}_{0} + \hat{\beta}_{1}x_{i1}\\
  &=22.55 - 0.16*x_{i1}\\
  \end{align*}
  \item Caso Control
  \begin{align*}
  \Rightarrow \hat{E}(y_{i};Control;x_{1i}) &= \hat{\beta}_{0} + \hat{\beta}_{1}x_{i1}   + \hat{\beta}_{2} + \hat{\beta}_{3}x_{i1}\\
  &= 22.55 - 0.16*x_{i1} + 2.03 - 0.13x_{i1}\\
  &= (22.55 + 2.03 ) + (-0.16  - 0.13)*x_{i1}\\
  &= 24.58 - 0.29*x_{i1}\\
  \end{align*}
\end{itemize}

Con base en esto graficaremos las rectas asociadas

\begin{align*}
\therefore \widehat{\mathrm{E}}(y_i;\mathrm{Tratamiento},x_{i1}=x_1^*)&=\left.
  \begin{cases}
    22.55 - 0.16x_1^*, & \text{Si el individuo } i \text{ recibió el Medicamento} \\
    \\
    24.58 - 0.29x_1^*, & \text{Si el individuo } i \text{ recibió el Placebo} 
  \end{cases}
  \right. \\ \\
\end{align*}

\includegraphics{Ejercicio5_files/figure-latex/unnamed-chunk-7-1.pdf}

\hypertarget{iii.-indique-las-expresiones-asociadas-a-la-relaciuxf3n}{%
\section{iii. Indique las expresiones asociadas a la
relación}\label{iii.-indique-las-expresiones-asociadas-a-la-relaciuxf3n}}

De acuerdo con el modelo ajustado, indique las expresiones asociadas a
la relación de la generación promedio de anticuerpos con la edad en a)
el grupo control y b) en el grupo que recibe el medicamento.

\[H_0: \hat{\beta}_1 = 0\quad\text{y} \quad \hat{\beta}_2 = 0\quad\text{y} \quad \hat{\beta}_3 = 0\quad\text{vs}\quad H_\alpha:\hat{\beta}_1 \neq 0\quad\text{o} \quad \hat{\beta}_2 \neq 0\quad\text{o} \quad \hat{\beta}_3 \neq 0\]

\begin{Shaded}
\begin{Highlighting}[]
\NormalTok{matz <-}\StringTok{ }\KeywordTok{matrix}\NormalTok{(}\KeywordTok{c}\NormalTok{(}\DecValTok{0}\NormalTok{,}\DecValTok{1}\NormalTok{,}\DecValTok{0}\NormalTok{,}\DecValTok{0}\NormalTok{,}
                \DecValTok{0}\NormalTok{,}\DecValTok{0}\NormalTok{,}\DecValTok{1}\NormalTok{,}\DecValTok{0}\NormalTok{,}
                \DecValTok{0}\NormalTok{,}\DecValTok{0}\NormalTok{,}\DecValTok{0}\NormalTok{,}\DecValTok{1}\NormalTok{), }\DataTypeTok{ncol=}\DecValTok{4}\NormalTok{, }\DataTypeTok{nrow=}\DecValTok{3}\NormalTok{, }\DataTypeTok{byrow=}\OtherTok{TRUE}\NormalTok{)}
\NormalTok{z <-}\StringTok{ }\KeywordTok{c}\NormalTok{(}\DecValTok{0}\NormalTok{,}\DecValTok{0}\NormalTok{,}\DecValTok{0}\NormalTok{)}
\KeywordTok{summary}\NormalTok{(}\KeywordTok{glht}\NormalTok{(fit, }\DataTypeTok{linfct=}\NormalTok{matz, }\DataTypeTok{rhs=}\NormalTok{z),}\DataTypeTok{test=}\KeywordTok{Ftest}\NormalTok{())}
\end{Highlighting}
\end{Shaded}

\begin{verbatim}
## 
##   General Linear Hypotheses
## 
## Linear Hypotheses:
##        Estimate
## 1 == 0   -0.157
## 2 == 0    2.030
## 3 == 0   -0.130
## 
## Global Test:
##     F DF1 DF2   Pr(>F)
## 1 203   3 296 2.12e-71
\end{verbatim}

Veamos que con la prueba asociada a la tabla ANOVA, concluimos con una
confianza de .95, se rechaza H0 en el contraste ay que el p-value
\textless{} 0.05

\hypertarget{iv.}{%
\section{iv.}\label{iv.}}

¿Se puede decir que la edad afecta de la misma forma la generación de
anticuerpos en el grupo control que en el grupo que recibe el
medicamento? Realice una prueba de hipótesis apropiada e interprete.

Planteamos la prueba de Hipótesis ante la duda si nuestras rectas tienen
la misma pendiente:

\[H_0 : \beta_3 = 0 \quad \text{v.s} \quad H_\alpha : \beta_3 \neq 0\]

\[H_0: \begin{pmatrix}
0 & 0 & 0 & 1  \\
\end{pmatrix} 
\begin{pmatrix}
\beta_0 \\
\beta_1 \\
\beta_2 \\
\beta_3 \\
\end{pmatrix} = \begin{pmatrix}
0 \\
\end{pmatrix} \quad \text{v.s} \quad H_a: \beta_3 \neq 0  \]

\begin{verbatim}
## 
##   General Linear Hypotheses
## 
## Linear Hypotheses:
##        Estimate
## 1 == 0    -0.13
## 
## Global Test:
##      F DF1 DF2   Pr(>F)
## 1 28.5   1 296 1.84e-07
\end{verbatim}

Realizando la prueba relacionada a nuestras pruebas de hipótesis, con
una significancia del 5\%y un p-value = 1.8e-07 \textless{} 0.05,
rechazando \(H_0\), podemos concluir que el efecto de la variable
Edad(x1) es diferente para las personas que recibieron el medicamento y
las que no lo hicieron. Así que ambas pendientes son distintas

\hypertarget{v.}{%
\section{v.}\label{v.}}

Comente sobre el ajuste del modelo incluyendo la interpretación de cada
uno de los coeficientes.

\begin{itemize}
\tightlist
\item
  El ajuste del modelo parece ser el indicado puesto que gracias a
  nuestras gráficas es fácil ver que los datos de ambas categorías no
  siguen el mismo camino.
\item
  De igual forma nos apoyamos en el hecho de que en nuestro ajuste fit,
  analizando de manera individual el p-value de cada una de nuestras
  variables, con una confianza del 95\% no es necesario eliminar ninguna
  de estas variables pues estas sí nos agregan información a nuestro
  modelo.
\end{itemize}

\hypertarget{vi.}{%
\section{VI.}\label{vi.}}

Argumente en contra o a favor de la afirmación: ``El medicamente
funciona aumentando el número de anticuerpos para todos los pacientes
entre 30 y 60 años''. Se puede apoyar de pruebas de hipótesis o
intervalos de confianza simultáneos.

\includegraphics{Ejercicio5_files/figure-latex/unnamed-chunk-11-1.pdf}
Observamos que en todas las edades entre 30 a 60 años nuestros
intervalos en un caso quedan por encima del otro en cuanto a los
tratamientos. Los intervalos de las personas que recibieron el
medicamento están por encima de los que no lo recibieron. Por tanto,
concluimos que el medicamento aumenta el número de anticuerpos en
personas entre los 30 y 60 años de edad.

\end{document}

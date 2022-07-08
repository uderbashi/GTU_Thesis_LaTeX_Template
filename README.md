# Gebze Technical University Thesis: LaTeX Template

## Table of Content
- [Intro](#intro)
	- [About](#about)
	- [Acknowledgment](#acknowledgment)
- [Usage](#usage)
	- [Project Structure](#project-structure)
	- [Backmatter and Frontmatter](#backmatter-and-frontmatter)
	- [Mainmatter](#mainmatter)
	- [Imgs and refs.bib](#imgs-and-refs.bib)
	- [GTUThesis.cls](#gtuthesiscls)
	- [main.tex](#maintex)
	- [Important Note](#important-note)
- [GTUThesis Class](#gtuthesis-class)
	- [Declare class](#declare-class)
	- [GTU Fields](#gtu-fields)
	- [GTU Make](#gtu-make)

## Intro

### About

This a student-made template following the thesis template guidelines of Gebze Technical University found [here](https://www.gtu.edu.tr/Files/Yonetmelik_ve_Yonergeler/Y%C3%B6netmelikler/Tez%20Yaz%C4%B1m%20K%C4%B1lavuzu%20-GT%C3%9C06012015.pdf). I decided to create it out of frustration that a *technical, research-focused* university does not have a proper LaTeX template, where most publications encourage on using LaTeX to make it easier to comply, and instead opt into an old outdated MSWord template.

The template is a recreation of the original MSWord template, and not in any way a new thing. The reason behind that is that despite it being easier to create a template from the ground up, it is harder to convince the administration of moving to a new territory, not to mention that I am pro-choice, (I want people to choose LaTeX over MSWord, not for LaTeX to be imposed upon them like MSWord was imposed upon us,) and I am not ready to create an MSWord template.

### Acknowledgment

Big thank you to Asst. Prof. Zafeirakis Zafeirakopoulos for encouraging me to start the project, Melike Ilteralp for helping me in the first steps, Sibel Gulmez for creating the undergrad cover page (although I have refactored it, it is still based on her work), Asst. Prof. Alp Arslan Bayrakci for giving the use of the template a green light for the undergraduate students (Autumn 2021) and giving me some feedback ideas on how to improve it, which alongside the feedback of numerous students who used it that semester led to the improved V.2 where I have moved from a package with a lot of functions to a class with most things defined there, which was inspired by the IEEEtran class.


## Usage

### Project Structure

In order to use the project more efficiently I thought an explanation of the structure of the project would be a good place to start to further the understanding of the different elements of the project.

	.
	├── Body			# A directory to host the .tex files of the thesis
	│	├── Backmatter		# A directory with predefined .tex files containing the chapters succeeding the main thesis
	│	├── Frontmatter		# A directory with predefined .tex files containing the chapters preceding the main thesis
	│	└── Mainmatter		# A directory holding the .tex files of the main body of the thesis
	├── Imgs			# A directory with the images to be used in the thesis
	├── GTUThesis.cls		# The class file, containing the custom function and style of the thesis !DO NOT MODIFY UNLESS YOU KNOW WHAT YOURE DOING!
	├── main.tex			# The main .tex file where the thesis is declared and the rest is included
	└── refs.bib			# The BibTeX reference file 

### Backmatter and Frontmatter

As mentioned in the structure, these directories (`./Body/Backmatter` and `./Body/Frontmatter`) contain `.tex` files with the chapters preceding and succeeding the main body of the thesis, like abstract, list of acronyms, and appendices. The comments in the files themselves indicate where and what to write. Please don't edit the areas not meant to be edited.

### Mainmatter

The `./Body/Mainmatter` directory is to house the `.tex` files of the main body of the thesis to be later included in the `./main.tex` (see [main.tex](#maintex)). They can be named anything and organised within the directory in any way deemed fit. The example has two files (`C1.tex` and `C2.tex`) demonstrating a way of using the files, but it can be used in any other way, name or convention deemed appropriate by the user.

### Imgs and refs.bib

As mentioned in the structure, the `./Imgs` is a directory to house the images to be used in the figures of the thesis. The files in the directory could be further organised into subdirectories, but the file `./Imgs/gtu_logo.jpg` to stay in its place.

As for `refs.bib`, this is a BibTeX file to be filled in with the references to be used for the thesis. (copied from the publisher or scholar.google.com)

### GTUThesis.cls

This is the file containing the custom functions and style of the GTU thesis. See [GTUThesis Class](#gtuthesis-class) for the documentation. ***DO NOT*** modify this file unless you know what you're doing and sure about the changes you want to do.

### main.tex

This is the main `.tex` file where the user firstly declares the document class as `GTUThesis` and then fills in the GTU-fields, followed by the used packages, and then starts the document environment, where they are expected to call the `GTUMakeFront` and `GTUMakeBack` functions respectively right after the start and before the end of the document environment. See [GTUThesis Class](#gtuthesis-class) for the documentation.

Between the `GTUMakeFront` and `GTUMakeBack` functions the user can include the files of the Main matter (recommended, see [Mainmatter](#mainmatter)) using the include function as follows:

	\include{./Body/Mainmatter/FILE.tex}

or write their thesis in the way they see fitting.

### Important Note

***DO NOT*** delete, rename, or move the following files or directories because their paths are hard-coded:
	- `./Body`
	- `./Body/Backmatter`
	- `./Body/Backmatter/Appendices.tex`
	- `./Body/Backmatter/CV.tex`
	- `./Body/Frontmatter`
	- `./Body/Frontmatter/Abstract.tex`
	- `./Body/Frontmatter/Acknowledgement.tex`
	- `./Body/Frontmatter/ListOfAcro.tex`
	- `./Body/Frontmatter/Ozet.tex`
	- `./Imgs`
	- `./Imgs/gtu_logo.jpg`
	- `./GTUThesis.cls`
	- `./refs.bib`


## GTUThesis Class

The [GTUThesis.cls](#gtuthesiscls) is the star of the show here, where the style of the thesis of GTU is defined. The user is expected to use some functions, and the demo `main.tex` shows how it is used. But for the sake of completion,  here is the documentation for the functions which the user is expected to call in their main.

### Declare Class

	\documentclass[lang,degree]{GTUThesis}

The `lang` and `degree` options are set to set the language of the thesis (including titles and predefined text), and the degree which mainly changes some slight things in the Frontmatter. `lang` can take either `en` or `tr` with the former being the default, and `degree` takes either `undergrad` or `graduate` with the latter being the default.

### GTU Fields

These are the fields required to be filled in at the beggining of the documents, they all take one argument in the following matter

	\GTUField{argument}

and they are the following.

| GTU Field		| Taken Argument 											| Note          |
| --------- 	| -------------- 											| ------------- |
|GTUAuthor		|Name of the author of the thesis (student)					| |
|GTUTitle		|The title of the thesis 									| |
|GTUFaculty		|The faculty or institute of the author 					| |
|GTUDepartment	|The department of the author 								| |
|GTUProject		|The project the author is working on (ex. PhD thesis) 		| |
|GTUSupervisor	|Name of the supervisor 									| |
|GTUYear		|The year of the publication of the thesis 					| |
|GTUJury		|Names of the jury for the thesis 							| Make sure the names are comma separated|
|GTUDefenceDate	|The date when the author presents the project to the jury 	| |
|GTUDecreeNo	|The decree number of the jury formation 					| Only required if the `degree` is `graduate`|
|GTUDecreeDate	|The above decree's date 									|Only required if the `degree` is `graduate`|

### GTU Make

These are two functions which produce the front-matter and the back-matter of the thesis.

	\GTUMakeFront

The function above produces the front-matter including the cover, the lists of content, figures, tables, and acronyms etc. in the correct order and in the correct format for the declared class's arguments (see [Declare class](#declare-class) for more).

	\GTUMakeBack{arg}

The function above produces the back-matter including the bibliography, and the optional CV and appendices. `arg` is a string that takes in the optional sections which the user wants to add comma separated (`cv` for the CV and `ap` for the appendices). If the user still doesn't want any optional sections, they still have to add the empty `{}` since the function waits for an argument which can be an empty string. So, the valid uses of the function are 

	\GTUMakeBack{}			% for only bibliography
	\GTUMakeBack{cv}		% for bibliography and CV
	\GTUMakeBack{ap}		% for bibliography and appendices
	\GTUMakeBack{cv,ap}		% for bibliography, CV, and appendices


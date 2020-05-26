(* ::Package:: *)

(* ::Section:: *)
(*Header*)


(* :Title: Package *)
(* :Context: Package` *)
(* :Author: Flip Phillips *)
(* :Summary: This package provides various things and stuff to Mathematica. *)
(* :Package Version: 0.1.0 *)
(* :Mathematica Version: 10.0+ *)
(* :Copyright: Copyright 2019, Flip Phillips, All Rights Reserved.  *)
(* :History: *)
(* :Keywords:  *)
(* :Limitations:  *)
(* :Discussion:  *)


(* ::Text:: *)
(*Some special version notes:*)


(* ::Text:: *)
(*Version 0.1 - *)


(* ::Section:: *)
(*Set up the package context, including any imports*)


BeginPackage["Package`"];


(* ::Subsection:: *)
(*Unprotect exported symbols*)


Unprotect[{PackageGo,
	$PackageDebug,$PackageVersion}];


(* ::Subsection:: *)
(*Usage Messages*)


(* ::Subsubsection:: *)
(*Package*)


Package::usage="Package is a package."


$PackageDebug::usage="Package package built with debugging on.";


$PackageVersion::usage="Package package version.";


(* ::Subsubsection:: *)
(*Functions*)


PackageGo::usage="PackageGo[rm] goes like crazy."


(* ::Subsection:: *)
(*Begin the private context*)


Begin["`Private`"];


(* ::Subsection:: *)
(*Unprotect any system functions for which rules will be defined*)


(* ::Subsection:: *)
(*Load external files *)


Package::ix="Package running from interactive thing";


Module[{files,dir},
	(* load in any session *)
	files={"Globals.wl"};

	If[$InputFileName=="",Message[Package::ix],
		Map[Get[FileNameJoin[{DirectoryName[$InputFileName], #}]] &, files];
		(* only load in a notebook session *)
		
		If[Head[$FrontEnd] === FrontEndObject,
			files = {};(*"Dock.wl","Notebook.wl"*)
			Map[Get[FileNameJoin[{DirectoryName[$InputFileName], #}]] &, files];]
	]
];


(* ::Subsection:: *)
(*Definition of auxiliary functions and local (static) variables*)


(* ::Text:: *)
(*N-related*)


nN[rm_]:=First[Dimensions[rm]]


(* ::Subsection:: *)
(*Error messages for the exported objects*)


(* ::Text:: *)
(*These are inline / adjacent as I don't like this particular format.*)


(* ::Subsection:: *)
(*Definition of the exported functions*)


(* ::Subsubsection:: *)
(*Internal Halpar Function*)


(* ::Text:: *)
(*The threshold function is # > 0 & - could generalize, looks like my other thing uses !PossibleZeroQ[x]*)


occupied[x_]:=!PossibleZeroQ[x]


(* ::Subsubsection:: *)
(*External Function*)


PackageGo[p_]:=Print["go"]


(* ::Subsection:: *)
(*Rules for the system functions*)


(* ::Subsection:: *)
(*Restore protection of system functions*)


(* ::Subsection:: *)
(*End the private context*)


End[];


(* ::Subsection:: *)
(*Protect exported symbols*)


Protect[{PackageGo,
	$PackageDebug,$PackageVersion}];


(* ::Subsection:: *)
(*End the package context*)


EndPackage[]

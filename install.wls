#!/usr/bin/env wolframscript
(* ::Package:: *)

packageName =""; 


dir = FileNameJoin[{$UserBaseDirectory, "Applications", packageName}];
Print["Installing into "<>dir];


(* ::Text:: *)
(*OK, this is a shell script and won't work for windows installing, but, I don't use windows much. It just makes a symbolic link from here to make things a little easier to debug.*)


here = FileNameJoin[{DirectoryName[$InputFileName],packageName}]


res = Run["ln -sf " <> here <> " " <> dir];


Print["Done: "<>ToString[res]]

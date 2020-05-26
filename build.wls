#!/usr/bin/env wolframscript

Get["FPTools`Versioning`"];

(* gerbils *)
$globalsFile="Globals.wl";
$directory= Directory[];
$packageInfo=VersionInformation[$directory];
$packageName=$packageInfo["name"];

Print["Building ",$packageName, " from: ", $directory];

pacletDirectory = FileNameJoin[{$directory, $packageName}];

(* bump build *)
VersionBumpBuild[$directory];

(* globals *)
Unprotect[{$RQADebug,$RQAVersion}];
$RQADebug=False;
$RQAVersion=VersionString[$directory,"Build"->True,"Prerelease"->True];

(* create global file *)
gfile=FileNameJoin[{$directory,$packageName,$globalsFile}];
If[FileExistsQ[gfile], DeleteFile[gfile]];
Save[gfile, {$RQADebug, $RQAVersion}];

(*
(* delete old paclet *)
files = FileNames["*.paclet", $directory];
Print["Found paclets (to be deleted): ", files];
DeleteFile /@ files;
*)

(* build new paclet *)
Print["Updating paclet file"];
UpdatePacletFile[pacletDirectory,$directory];

(*
paclet = PackPaclet[pacletDirectory];
Print["New paclet: ", paclet];

paclets = PacletFind[$packageName];
Print["Found the following old paclets (uninstalling): ", Map[ #["Location"]&, paclets]];
Map[ PacletUninstall, paclets ];

(* install new paclet *)
Print["Installing new paclet"]
PacletInstall[paclet, IgnoreVersion -> True];

(* Build wiki docs *)
wikidir=FileNameJoin[{"..",$packageName<>".wiki"}];
If[DirectoryQ[wikidir],
    Print["Building wiki at ",wikidir];
    BuildWikiDocumentation[wikidir,$packageName]];
*)

Print["Done"]


//fsch

//var $file_f : 4D.Folder
//$file_f:=Folder(fk desktop folder).file("document.pdf")
//WP EXPORT DOCUMENT(WP_Area; $file_f.platformPath; wk pdf)



$doc:=Select document(System folder(Documents folder)+"Report.pdf"; "pdf"; "Report name:"; File name entry)
If (OK=1)
	//BLOB TO DOCUMENT(Document; $blob)  // $blob contains document to record
	WP EXPORT DOCUMENT(WP_Area; document; wk pdf)
	
End if 
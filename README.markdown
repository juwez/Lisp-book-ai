<h1> Lisp</h1>
<p>In deze repo kan u wat meer info vinden over lisp meer bepaald common lisp</p> 
<h1>opzetten<h1>
<h2>implementaties</h2>
<p>Vooraleer u kan beginnen moet u eerst een implementatie van common lisp kiezen, voor dit project heb ik steel bank common lisp gebruikt of sbcl afgekort</p>
<p>Ik koos hiervoor, voor de goede debugger, het heeft u zeer snel warnings, iets wat ik wel kon gebruiken bij mijn alereerste lisp project</p>

<h2>Ide<h2>
<p>De keuze hierin is zeer beperkt en hangt grotendeels van uw os af ook</p>
<p>Hier koos ik voor doom emacs </p>

<h1>Gebruik</h1>
<p>Alle dependencies worden ingeladen met quicklisp, zo kan je bijvoorbeeld yason inladen met (ql:quickload :yason)</p>
<p>Alles werkt met de sly repl </p>

<h1>Deployement</h1>
<p>Aangezien wij werken op een debian server en ik niet op een debian platform werk, gebruik ik docker om te compileren met het commando <b> sbcl --eval "(asdf:operate :build-op :lisp)"</b></p>
















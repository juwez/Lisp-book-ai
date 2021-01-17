<h1> Lisp</h1>
<p>in deze repo kan u wat meer info vinden over lisp meer bepaald common lisp</p> 
<h1>opzetten<h1>
<h2>implementaties</h2>
<p>vooraleer u kan beginnen moet u eerst een implementatie van common lisp kiezen, voor dit project heb ik steel bank common lisp gebruikt of sbcl afgekort</p>
<p> ik koos hiervoor voor de goede debugger, het heeft u zeer snel warnings , iets wat ik wel kon gebruiken bij mijn alereerste lisp project</p>

<h2>ide<h2>
<p>uw keuze hierin is zeer beperkt en hangt grotendeels van uw os af ook</p>
<p> hier koos ik voor doom emacs </p>

<h1>gebruik</h1>
<p>alle dependancies worden ingeladen met quicklisp zo kan je bijvoorbeeld yason inladen met (ql:quickload :yason)</p>
<p>alles werkt met de sly repl </p>

<h1>deployement</h1>
<p>aangezien wij werken op een debian server en ik niet op een debian platform werk gebruik ik docker om te compileren met het commando <b> sbcl --eval "(asdf:operate :build-op :lisp)"</b></p>
















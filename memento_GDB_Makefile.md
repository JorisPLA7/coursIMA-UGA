<h1>Memento inf203</h1>
<h2>GDB</h2>

<p>Pour obtenir un code débuggable : <code> clang -g monfich.c ; gdb a.out</code></p>

Principales commandes de GDB :
* <code><strong>b</strong>reak nom/num_ligne</code> : ajoute un point d'arrêt lors de l'execution.
* <code><strong>r</strong>un arg1 arg2 (...)</code> : lance l'execution du programme jusqu' au prochain breakpoint. <!-- * <abbr title="HyperText Markup Language">HTML</abbr> SURVOL-->
* <code><strong>c</strong>ontinue</code> : reprends l'execution du code depuis le dernier point d'arrêt.
* <code><strong>d</strong>isplay var1</code> : affiche la variable à chaque breakpoint.
* <code>undisplay</code>
* <code><strong>n</strong>ext</code> : exécute entièrement la prochaine ligne de code
* info
    * <code>info d</code> : affiche les expressions auto-affichées.
    * <code>info b</code> : ... breakpoint
    * <code>info <strong>s</strong>tack</code> : affiche la `pile` d’appels
* <code>up/down</code> monte ou descends dans le stack.

<h2>Exemple de Makefile</h2>

ici 
<pre><code>main : main.o aireCercle.o
    clang -o main aireCercle.o main.o
main.o : main.c
    clang -Wall -Werror -c  main.c
aireCercle.o : aireCercle.c aireCercle.h
    clang -Wall -Werror -c  aireCercle.c
</code></pre>

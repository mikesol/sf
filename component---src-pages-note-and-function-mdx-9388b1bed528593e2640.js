"use strict";(self.webpackChunksoundly_functional=self.webpackChunksoundly_functional||[]).push([[151],{12321:function(e,t,a){a.r(t),a.d(t,{_frontmatter:function(){return N},default:function(){return C}});var n=a(63366),i=(a(67294),a(64983)),o=a(407),r=a(86599),l=a(37409),s=a(94906),p=a(5308),m=a(9785),h=a(92294),c=a(29520),u=a(95119),d=a(17497),k=a(59606),f=a(2477),g=a(17643),w=a(77606),y=a(88014),b=["components"],N={},v={_frontmatter:N};function C(e){var t=e.components,a=(0,n.Z)(e,b);return(0,i.kt)("wrapper",Object.assign({},v,a,{components:t,mdxType:"MDXLayout"}),(0,i.kt)("h1",null,"The note and the function"),(0,i.kt)("p",null,"We'll start our journey with a single note. This note will be produced by a sine-wave oscillator. When you click ",(0,i.kt)(w.G,{icon:y.aQp,mdxType:"FontAwesomeIcon"}),", the computer will send instructions to your loudspeaker or headphones to oscillate back and forth in sinusoidal motion. This creates wave-like variations in air pressure that propagate all the way to your ear. Middle-C, the note below, will cause the air around you to oscillate 264 times a second. This pattern is far too fast for us to perceive each individual oscillation. Our ear clumps the oscillations together as a pattern, and we hear it as the note middle-C. You can also check out this ",(0,i.kt)("a",{parentName:"p",href:"https://pudding.cool/2018/02/waveforms/"},"amazing interactive article about how sound works"),"."),(0,i.kt)(o.J,{player:l.main,code:r,mdxType:"Player"}),(0,i.kt)("p",null,"Our single note is accompanied by a short program: the minimal amount of information we need to play back the note. The program starts by defining a ",(0,i.kt)("strong",{parentName:"p"},"module"),". By calling this module ",(0,i.kt)("inlineCode",{parentName:"p"},"Main"),", we're telling the compiler that this is where the main action of our program resides. This is followed by a series of ",(0,i.kt)("inlineCode",{parentName:"p"},"import"),' statements declaring what types and terms we\'ll use from other libraries (I\'ll define "type" and "term" below). Lastly, the actual program called ',(0,i.kt)("inlineCode",{parentName:"p"},"main")," exists on two levels: the type-level (its type is ",(0,i.kt)("inlineCode",{parentName:"p"},"Player"),") and on the term-level (its terms are ",(0,i.kt)("inlineCode",{parentName:"p"},"play")," and ",(0,i.kt)("inlineCode",{parentName:"p"},"c4"),"). This distinction between, and eventually interplay of, types and terms will be crucial to our reasoning about music and functional programs."),(0,i.kt)("h2",null,"Types and terms"),(0,i.kt)("p",null,"Functional programs contain two basic units of composition: ",(0,i.kt)("em",{parentName:"p"},"types")," and ",(0,i.kt)("em",{parentName:"p"},"terms"),". These units form the basis of a play staring three core protagonists: you, a compiler, and a computer. A ",(0,i.kt)("em",{parentName:"p"},"term")," points to some chunk of memory on a computer that stores an opaque series of bytes. We give the term a name like ",(0,i.kt)("inlineCode",{parentName:"p"},"c4")," or ",(0,i.kt)("inlineCode",{parentName:"p"},"play")," to indicate to other readers what it ",(0,i.kt)("em",{parentName:"p"},"is")," or ",(0,i.kt)("em",{parentName:"p"},"does"),". A ",(0,i.kt)("em",{parentName:"p"},"type")," is an assertion to the compiler about how a term can be used in a program. Types have names like ",(0,i.kt)("inlineCode",{parentName:"p"},"Player"),". When the compiler receives an assertion in the form of a type, it can either accept the assertion, reject it, or punt until it receives more information. In our program above, the compiler ",(0,i.kt)("em",{parentName:"p"},"accepts")," the assertion that ",(0,i.kt)("inlineCode",{parentName:"p"},"play c4")," has the type ",(0,i.kt)("inlineCode",{parentName:"p"},"Player"),". When all the assertions in a program are accepted, we say a program compiles, and the compiler sends the program off to the computer to do something interesting like render it to your screen, play it through your loudspeakers, or save it for a rainy day."),(0,i.kt)("p",null,"Let's revisit the program above:"),(0,i.kt)(o.J,{player:l.main,code:r,mdxType:"Player"}),(0,i.kt)("p",null,"It contains one type assertion - that ",(0,i.kt)("inlineCode",{parentName:"p"},"main")," is ",(0,i.kt)("inlineCode",{parentName:"p"},"Player")," - and three terms:"),(0,i.kt)("ul",null,(0,i.kt)("li",{parentName:"ul"},(0,i.kt)("inlineCode",{parentName:"li"},"main"),", whose type is asserted to be ",(0,i.kt)("inlineCode",{parentName:"li"},"Player"),";"),(0,i.kt)("li",{parentName:"ul"},(0,i.kt)("inlineCode",{parentName:"li"},"play"),", whose type is ",(0,i.kt)("inlineCode",{parentName:"li"},"Function Pitch Player"),"; and"),(0,i.kt)("li",{parentName:"ul"},(0,i.kt)("inlineCode",{parentName:"li"},"c4"),", whose type is ",(0,i.kt)("inlineCode",{parentName:"li"},"Pitch"),".")),(0,i.kt)("p",null,"Often times, when talking about functions, we'll use an infix notation of a right-pointing arrow ",(0,i.kt)("inlineCode",{parentName:"p"},"->"),". So, ",(0,i.kt)("inlineCode",{parentName:"p"},"play")," can be rewritten as ",(0,i.kt)("inlineCode",{parentName:"p"},"Pitch -> Player"),"."),(0,i.kt)("p",null,"When the compiler compiles the program, it treats every function as an ",(0,i.kt)("em",{parentName:"p"},"if/then")," proposition and makes sure that we've provided enough evidence to prove this proposition. In the case above, ",(0,i.kt)("inlineCode",{parentName:"p"},"play"),' is a proposition saying "If you give me a ',(0,i.kt)("inlineCode",{parentName:"p"},"Pitch"),", I'll give you a term of type ",(0,i.kt)("inlineCode",{parentName:"p"},"Player"),'". In the program, ',(0,i.kt)("inlineCode",{parentName:"p"},"c4")," is ",(0,i.kt)("em",{parentName:"p"},"evidence")," to play (we can also call it an argument to ",(0,i.kt)("inlineCode",{parentName:"p"},"play")," or ",(0,i.kt)("inlineCode",{parentName:"p"},"play"),"'s input). Evidence to propositions, or equivalently arguments to functions, act like keys to a lock. The term ",(0,i.kt)("inlineCode",{parentName:"p"},"c4")," of type ",(0,i.kt)("inlineCode",{parentName:"p"},"Pitch")," unlocks the proposition ",(0,i.kt)("inlineCode",{parentName:"p"},"Pitch -> Player"),", producing an ",(0,i.kt)("inlineCode",{parentName:"p"},"Player"),". Because we have annotated our program ",(0,i.kt)("inlineCode",{parentName:"p"},"main")," as ",(0,i.kt)("inlineCode",{parentName:"p"},"Player"),", the compiler accepts the program, sends it to your loudspeaker and plays a note. w00t!"),(0,i.kt)("p",null,"The fluidity with which one can switch between the language of logic (proving a proposition with evidence) and programming (applying to a function an argument) is called the ",(0,i.kt)("a",{parentName:"p",href:"https://en.wikipedia.org/wiki/Curry%E2%80%93Howard_correspondence"},"Curry-Howard correspondence"),". Informally, it posits that programs are logical proofs and vice versa. Granted, music is a highly ",(0,i.kt)("em",{parentName:"p"},"illogical")," endeavor, so this type of rigorous formalism may seem out of place given the high degree of fantasy present in music composition and listening. The point of types here is to provide a set of constraints that accomplish two goals:"),(0,i.kt)("ol",null,(0,i.kt)("li",{parentName:"ol"},"The constraints act as a proof that what you're building has the best chance to work as expected and produce the sound you're aiming to produce. This makes experimentation go faster."),(0,i.kt)("li",{parentName:"ol"},"Like all art-forms, the constraints act simultaneously as a dialectical guide through ",(0,i.kt)("em",{parentName:"li"},"and")," impediment to creation. It's the epiphanies we have as we are guided and impeded that help us make great work.")),(0,i.kt)("h2",null,"Our first composition(s)"),(0,i.kt)("p",null,"In the example above, we listened to our first note ",(0,i.kt)("inlineCode",{parentName:"p"},"c4")," by applying the function ",(0,i.kt)("inlineCode",{parentName:"p"},"play")," to it. Let's add together some more functions to see how far we can push that note."),(0,i.kt)("p",null,"We'll start by acting on the volume of the note as a function of time.  Let's make the note taper down to zero-volume over 5 seconds. To do so, we'll write a function that multiplies time by 0.1 and subtracts it from 1.0, which will smoothly interpolate from 1 to 0 over 5 seconds."),(0,i.kt)(o.J,{player:p.main,code:s,mdxType:"Player"}),(0,i.kt)("p",null,"An equivalent way to write that would be the following:"),(0,i.kt)(o.J,{player:h.main,code:m,mdxType:"Player"}),(0,i.kt)("p",null,(0,i.kt)("a",{parentName:"p",href:"https://github.com/mikesol/purescript-wags/blob/81dd024e13ad2bdb6a2598b29e86105fa762b7a9/src/WAGS/Math.purs#L7"},(0,i.kt)("inlineCode",{parentName:"a"},"calcSlope"))," and ",(0,i.kt)("a",{parentName:"p",href:"https://github.com/mikesol/purescript-wags-lib/blob/a1569215c2360461f70f1e6505d01ec3d5a72f05/src/WAGS/Lib/Tidal/Tidal.purs#L953"},(0,i.kt)("inlineCode",{parentName:"a"},"betwixt"))," are functions provided by the libraries ",(0,i.kt)("a",{parentName:"p",href:"https://github.com/mikesol/purescript-wags"},(0,i.kt)("inlineCode",{parentName:"a"},"wags"))," and ",(0,i.kt)("a",{parentName:"p",href:"https://github.com/mikesol/purescript-wags-lib"},(0,i.kt)("inlineCode",{parentName:"a"},"wags-lib")),", as will be the case of many of the functions we'll encounter along our path.  While we'll use these functions for convenience, it's often helpful to write them out by hand for learning purposes.  As a challenge throughout this and other articles, after reading the article once, try to write some these functions from scratch and compare them to the reference implementations."),(0,i.kt)("p",null,"When working with functions of time like calcSlope, one common convention is to leave ",(0,i.kt)("inlineCode",{parentName:"p"},"time")," as the last argument. If we write a function ",(0,i.kt)("inlineCode",{parentName:"p"},"f")," of ",(0,i.kt)("inlineCode",{parentName:"p"},"time")," that internally calls a function ",(0,i.kt)("inlineCode",{parentName:"p"},"g")," of ",(0,i.kt)("inlineCode",{parentName:"p"},"time"),", we say that ",(0,i.kt)("inlineCode",{parentName:"p"},"time")," is an ",(0,i.kt)("a",{parentName:"p",href:"https://wiki.haskell.org/Eta_conversion"},(0,i.kt)("em",{parentName:"a"},"abstraction"))," over the function ",(0,i.kt)("inlineCode",{parentName:"p"},"g"),". Without the time term, we call the function ",(0,i.kt)("inlineCode",{parentName:"p"},"f")," eta-reduced."),(0,i.kt)("deckgo-highlight-code",{language:"haskell"},"\n          ",(0,i.kt)("code",{parentName:"deckgo-highlight-code",slot:"code"},"f time = g time -- time abstracted over g\nf = g -- eta-reduced"),"\n        "),(0,i.kt)("p",null,"This is similar to reducing a term in algebra:"),(0,i.kt)("deckgo-highlight-code",{language:"haskell"},"\n          ",(0,i.kt)("code",{parentName:"deckgo-highlight-code",slot:"code"},"f + 2 = g + 2 -- ...is the same as stating that...\nf = g"),"\n        "),(0,i.kt)("p",null,"The idea of abstraction (creating a function), along with application (otherwise known as ",(0,i.kt)("em",{parentName:"p"},"invoking")," a function) are core to the ",(0,i.kt)("a",{parentName:"p",href:"https://en.wikipedia.org/wiki/Lambda_calculus"},"Simple Lambda Calculus")," and act as a basis for functional programming."),(0,i.kt)("p",null,"In order to eta-reduce the function in the example above, we introduce one of the most powerful ideas in functional programming - composition, which we will represent as ",(0,i.kt)("inlineCode",{parentName:"p"},"<<<"),". When you compose two functions, you pipe the output of one into the input of another without ",(0,i.kt)("em",{parentName:"p"},"abstracting")," the input to either function.  If we write ",(0,i.kt)("inlineCode",{parentName:"p"},"h time = f (g time)"),", ",(0,i.kt)("inlineCode",{parentName:"p"},"time")," is abstracted over ",(0,i.kt)("inlineCode",{parentName:"p"},"g")," and ",(0,i.kt)("inlineCode",{parentName:"p"},"(g time)")," is abstracted over ",(0,i.kt)("inlineCode",{parentName:"p"},"f"),". However, if we write ",(0,i.kt)("inlineCode",{parentName:"p"},"h = f <<< g"),", the abstraction is eta-reduced ",(0,i.kt)("em",{parentName:"p"},"both")," for ",(0,i.kt)("inlineCode",{parentName:"p"},"g"),"'s input ",(0,i.kt)("em",{parentName:"p"},"and")," for ",(0,i.kt)("inlineCode",{parentName:"p"},"f"),"'s input. Let's see that in the example using ",(0,i.kt)("inlineCode",{parentName:"p"},"betwixt")," and ",(0,i.kt)("inlineCode",{parentName:"p"},"calcSlope"),"."),(0,i.kt)(o.J,{player:u.main,code:c,mdxType:"Player"}),(0,i.kt)("p",null,"Function composition is not just about terser syntax - as we will see in subsequent lessons on profunctors and free-semigroupoids, composition as an operation can be applied to other things besides functions. So working with at this higher level of abstraction, we unteather ourselves from functions and talk in more general terms about two things being composed. For me, describing the world abstractly in this way is one of the joys of both music and functional programming, making it possible to exploit structural similarities at multiple levels of abstraction."),(0,i.kt)("h3",null,"A bouquet of functions"),(0,i.kt)("p",null,"Let's write another function of time that makes our note step between different volumes in a cyclic fashion. We'll accomplish this using the ",(0,i.kt)("a",{parentName:"p",href:"https://pursuit.purescript.org/packages/purescript-math/3.0.0/docs/Math#v:remainder"},"remainder operator")," and ",(0,i.kt)("a",{parentName:"p",href:"https://github.com/purescript/documentation/blob/master/language/Pattern-Matching.md#guards"},"guards"),"."),(0,i.kt)(o.J,{player:k.main,code:d,mdxType:"Player"}),(0,i.kt)("p",null,"Lastly, we'll control the volume with a ",(0,i.kt)("a",{parentName:"p",href:"https://en.wikipedia.org/wiki/Low-frequency_oscillation"},"low-frequency oscilator, or LFO"),"."),(0,i.kt)(o.J,{player:g.main,code:f,mdxType:"Player"}),(0,i.kt)("p",null,"The one thing that all of these examples have in common is that they are functions of a ",(0,i.kt)("inlineCode",{parentName:"p"},"Number")," that ouput a number. As the output of one can be the input of another, we can ",(0,i.kt)("em",{parentName:"p"},"compose")," them together. Composition is an essential term in both music and functional programming, and their meanings largely overlap. When we compose music, we blend together sounds either in a sequence or simultaneously to crete a larger work. When we compose functions, we use the output of one as the input of another to create complex control parameters."),(0,i.kt)("p",null,"Let's compose three functions together using the purescript operator ",(0,i.kt)("inlineCode",{parentName:"p"},"<<<"),". The first one will be our LFO, the second will add a constant offset, and the third will clip the wave at boundaires."),(0,i.kt)(o.J,{stub:!0,player:l.main,code:r,mdxType:"Player"}),(0,i.kt)("p",null,"Visually, the result looks something like this:"),(0,i.kt)(o.J,{stub:!0,player:l.main,code:r,mdxType:"Player"}),(0,i.kt)("p",null,"There's a special term for functions whose input type is the same as the output type. We call these ",(0,i.kt)("em",{parentName:"p"},"endo"),' functions - endo being a prefix from the Greek ἔνδον (endon) meaning "within, inner, absorbing, or containing." We can chain together compositions of endo-functions to create some pretty jolting sounds.'),(0,i.kt)("p",null,"The beautiful thing about chaining compositions where the input type and outp is that you can comment out different functions using two dashes ",(0,i.kt)("inlineCode",{parentName:"p"},"--")," to radically change the result. In the example below, in addition to playing around with the values, try to comment out some functions (add ",(0,i.kt)("inlineCode",{parentName:"p"},"--"),") and comment in (remove ",(0,i.kt)("inlineCode",{parentName:"p"},"--"),") others."),(0,i.kt)(o.J,{stub:!0,player:l.main,code:r,mdxType:"Player"}),(0,i.kt)("h2",null,"A taste of things to come"),(0,i.kt)("p",null,"In this article series, I will try to keep the pacing of the material more or less consistent. However, at certain points, I will glimpse into the future to show you where we are heading by subtly tweaking an example to provide a teaser for a future concept. We will have entire articles devoted to functors, applicatives, folds, semigroups and monoids, so consider this a small ",(0,i.kt)("em",{parentName:"p"},"mise en bouche")," for the not-too-distant future."),(0,i.kt)("h3",null,"Functors and applicatives"),(0,i.kt)("p",null,"Currently, while we have a way to pipe output into an input via composition, we have no way to ",(0,i.kt)("em",{parentName:"p"},"blend")," two results together. For example, if we want to add the result of an LFO to the result of a terraced function, we would write something like ",(0,i.kt)("inlineCode",{parentName:"p"},"(\\t -> lfo t + terraced t)"),". While this is fine in small doses, it gets tedious if ",(0,i.kt)("em",{parentName:"p"},"everything")," is a function of time. We'd like to somehow abstract away time so that we never directly have to deal with it. In functional programming, there are many ways to do this, including the ",(0,i.kt)("inlineCode",{parentName:"p"},"Reader")," pattern (treating time as an environment) and the ",(0,i.kt)("inlineCode",{parentName:"p"},"Behavior")," pattern (representing functions of time as a separate type). We'll see both of those in a later article, but what I'd like to show here is how to accomplish this using functors and applicatives."),(0,i.kt)("p",null,"The example above, using the Functor operation ",(0,i.kt)("inlineCode",{parentName:"p"},"<$>")," and the Applicative operation ",(0,i.kt)("inlineCode",{parentName:"p"},"<*>"),", can be written as ",(0,i.kt)("inlineCode",{parentName:"p"},"add <$> lfo <*> terraced"),". There is no longer a ",(0,i.kt)("inlineCode",{parentName:"p"},"t")," term and it still works. Let's hear it in a larger example:"),(0,i.kt)(o.J,{stub:!0,player:l.main,code:r,mdxType:"Player"}),(0,i.kt)("p",null,"If you're wondering what ",(0,i.kt)("inlineCode",{parentName:"p"},"<$>")," and ",(0,i.kt)("inlineCode",{parentName:"p"},"<*>")," are doing under the hood and how they relate to functions, there will be a whole lesson on applicatives that go over that. Here, I mostly want to build intution that you can blend together functions of time using binary operations like ",(0,i.kt)("inlineCode",{parentName:"p"},"add"),", ",(0,i.kt)("inlineCode",{parentName:"p"},"pow"),", ",(0,i.kt)("inlineCode",{parentName:"p"},"sub"),", ",(0,i.kt)("inlineCode",{parentName:"p"},"mul")," and ",(0,i.kt)("inlineCode",{parentName:"p"},"div")," using ",(0,i.kt)("inlineCode",{parentName:"p"},"<$>")," and ",(0,i.kt)("inlineCode",{parentName:"p"},"<*>"),"."),(0,i.kt)("h3",null,"Folds"),(0,i.kt)("p",null,"In functional programming, rather than applying a function to arguments, we often store arguments in a structure called a ",(0,i.kt)("em",{parentName:"p"},"free")," structure and then ",(0,i.kt)("em",{parentName:"p"},"interpret")," that structure later. Let's do that with composition. ",(0,i.kt)("a",{parentName:"p",href:""},(0,i.kt)("inlineCode",{parentName:"a"},"compose")),' is, after all, a function that is applied to two arguments. So, rather than applying it directly, let\'s store its arguments in a free structure (an Array, also known as a "free monoid") and then interpret it using a simple interpreter called ',(0,i.kt)("inlineCode",{parentName:"p"},"foldl")," that applies a function (in this case, ",(0,i.kt)("inlineCode",{parentName:"p"},"compose"),") to the arguments starting from an initial argument."),(0,i.kt)(o.J,{stub:!0,player:l.main,code:r,mdxType:"Player"}),(0,i.kt)("h2",null,"Etude"),(0,i.kt)("p",null,"Already, just using this technique, we can make some wicked one-note beats that give the one-note samba a run for its money! Below, I've written three functions - ",(0,i.kt)("inlineCode",{parentName:"p"},"f0"),", ",(0,i.kt)("inlineCode",{parentName:"p"},"f1")," and ",(0,i.kt)("inlineCode",{parentName:"p"},"f2")," - each of which create a one-note piece. The one currently slotted to play is called ",(0,i.kt)("inlineCode",{parentName:"p"},"f0"),". Go ahead and substitute in and out different functions. Tweak them. Compose them. If you're up to it, try using ",(0,i.kt)("inlineCode",{parentName:"p"},"<$>"),", ",(0,i.kt)("inlineCode",{parentName:"p"},"<*>")," or ",(0,i.kt)("inlineCode",{parentName:"p"},"foldl")," and see where they can take you!"),(0,i.kt)(o.J,{stub:!0,player:l.main,code:r,mdxType:"Player"}),(0,i.kt)("h2",null,"Scales"),(0,i.kt)("p",null,"Armed with our composition skills, we can approach pitch in the same way that we approached volume.  Before we do, though, it'd be useful to talk a bit about scales and perception of pitch and volume. While one can be plenty creative without knowing these scales, mastering them makes it easier to anticipate how music will be heard in certain cultural contexts."),(0,i.kt)("p",null,"In the previous example, when we were linearly changing volume between 0 and 1, the change from ",(0,i.kt)("inlineCode",{parentName:"p"},"0.0-0.5")," felt ",(0,i.kt)("em",{parentName:"p"},"much")," greater than the change from ",(0,i.kt)("inlineCode",{parentName:"p"},"0.5-1.0"),". This is because, while we scaled the amplitude of the waves in the air linearly, we hear that change ",(0,i.kt)("em",{parentName:"p"},"logarithmically"),". The unit for logarithmic amplitude is the ",(0,i.kt)("strong",{parentName:"p"},"bel"),", and in almsot all literature on sound, you'll hear folks talking about tenths of bels, or ",(0,i.kt)("strong",{parentName:"p"},"decibels")," (dB for short).  Below is a chart that shows linear increase of loudness from 0 to 1 and the corresponding change in decibels."),(0,i.kt)(o.J,{stub:!0,player:l.main,code:r,mdxType:"Player"}),(0,i.kt)("p",null,"We can bring this even closer to human perception using ",(0,i.kt)("a",{parentName:"p",href:"https://en.wikipedia.org/wiki/Equal-loudness_contour"},"Fletcher-Munson curves"),", also known as equal-loudness contours. This adds ripples into our logarithmic model that represent the ideosyncracies of human hearing. Many sensible defaults in industry-grade automatic equalization and mastering software are based on these curves.  In the examples below, we'll use a function that changes volume on a logarithmic rather than linear scale, and perhaps you will perceive it as being more smooth or gradual."),(0,i.kt)("p",null,"Pitch also exists on many different scales, and depending on our choice of scale, we can have radically different musical outocmes that are evokative of cultures that span the globe. When we use notes like ",(0,i.kt)("inlineCode",{parentName:"p"},"c4")," or ",(0,i.kt)("inlineCode",{parentName:"p"},"aFlat3")," in the examples, we are using a scale called the equally-tempered chromatic scale which became standardized in Europe in the 18th century and is currently the basis of most popular music.  The equally-tempered scale is also a logarithmic one: we perceive two pitches to be of the same class when one is a multiple of two of the other one. For example, most people hear 220.0, 440.0, 880.0 and 1760.0 as the same note shifted higher and higher.  In fact, let's let that be the basis of our first exmaple on pitch.  We'll use a function similar to the terraced function we used for volume, but we will use values that correspond to jumping octaves."),(0,i.kt)(o.J,{stub:!0,player:l.main,code:r,mdxType:"Player"}),(0,i.kt)("h2",null,"Pitch"),(0,i.kt)("p",null,"All of the same functions we used to control volume can also be used to control the pitch of our single note. Let's scale them from their 0-1 range as values to a range that makes more sense for pitch. Again, we'll use composition for this."),(0,i.kt)(o.J,{stub:!0,player:l.main,code:r,mdxType:"Player"}),(0,i.kt)("p",null,"We can also use ",(0,i.kt)("inlineCode",{parentName:"p"},"<$>")," and ",(0,i.kt)("inlineCode",{parentName:"p"},"<*>")," to apply binary operators to pitch, just as we did on rhythm.  Interestingly, we see that when we add an octave twice to a pitch, this has the effect of multiplying it by 4"),(0,i.kt)(o.J,{stub:!0,player:l.main,code:r,mdxType:"Player"}),(0,i.kt)("p",null,"This is because ",(0,i.kt)("inlineCode",{parentName:"p"},"Pitch")," adheres to a different meaning of ",(0,i.kt)("inlineCode",{parentName:"p"},"add")," and ",(0,i.kt)("inlineCode",{parentName:"p"},"mul")," than ",(0,i.kt)("inlineCode",{parentName:"p"},"Number"),".  In functional programming, the behavior of operators like ",(0,i.kt)("inlineCode",{parentName:"p"},"add")," and ",(0,i.kt)("inlineCode",{parentName:"p"},"mul")," can vary from type to type so long as they adhere to certain predefined laws. Here, addition and multiplcation are the two operators that form a ",(0,i.kt)("a",{parentName:"p",href:"https://en.wikipedia.org/wiki/Semiring"},"Semiring")," and, as such, need to conform to semiring laws of being commutative over addition and distributive over multiplication. Let's test out those laws in music!"),(0,i.kt)(o.J,{stub:!0,player:l.main,code:r,mdxType:"Player"}),(0,i.kt)("p",null,"Indeed, we see that the addition of pitch commutes - ",(0,i.kt)("inlineCode",{parentName:"p"},"a + (b + c) = (a + b) + c"),". Furthermore, multiplication distributes: ",(0,i.kt)("inlineCode",{parentName:"p"},"a * (b + c) = a * b + a * c"),". The abiltiy to define custom behavior of functions on types based on laws is a core feature of most programming languages in the ",(0,i.kt)("a",{parentName:"p",href:"https://en.wikipedia.org/wiki/ML_(programming_language)"},"ML-family"),", including ",(0,i.kt)("a",{parentName:"p",href:""},"Haskell"),", ",(0,i.kt)("a",{parentName:"p",href:""},"Idris"),", and the language used for these examples - ",(0,i.kt)("inlineCode",{parentName:"p"},"PureScript"),". The fact that a single function operates differently on different types according to an underlying law is a deeply musical idea. It is the essence of a ",(0,i.kt)("em",{parentName:"p"},"theme")," or ",(0,i.kt)("em",{parentName:"p"},"motif"),": something that can function differently in different contexts while retaining its identity."),(0,i.kt)("p",null,"Getting less mathy for a bit, I'll close this section on pitch with two examples. The first will shows how to use simple data structures - in this case an array - to hold a musical score that we can play back to get a fun little Bach minuet."),(0,i.kt)(o.J,{stub:!0,player:l.main,code:r,mdxType:"Player"}),(0,i.kt)("p",null,"The second is more abstract and experimental in nature, weaving a tapestry of pitches that brings me to a trance-like place."),(0,i.kt)(o.J,{stub:!0,player:l.main,code:r,mdxType:"Player"}),(0,i.kt)("p",null,"In both cases, the same basic operations - functions of time - lead to different worlds, all the while keeping the rather austere constraint of a single note that can change only in pitch or volume."),(0,i.kt)("h2",null,"Deconstructing and reconstructing"),(0,i.kt)("p",null,"One of my favorite aspects about both music and functional programming is that anything can be a unit of construction or a subject of deconstruction. Often these two processes can happen at the same time. As a last exercise, and as a glimpse into the future, let's take our first ",(0,i.kt)("inlineCode",{parentName:"p"},"lfo")," example and write it in a slightly different syntax with a different timbre. Here, instead of using one note, we'll use six. However, as the six notes will be playing at the same time, we'll hear them as a single organ-like sound."),(0,i.kt)(o.J,{stub:!0,player:l.main,code:r,mdxType:"Player"}),(0,i.kt)("p",null,"Now, let's undercut the unity of our sound by pulling it apart over time. To do this, we'll again use ",(0,i.kt)("inlineCode",{parentName:"p"},"<$>")," and ",(0,i.kt)("inlineCode",{parentName:"p"},"<*>"),". And again, we'll have a whole article devoted entirely to unpacking what ",(0,i.kt)("inlineCode",{parentName:"p"},"<$>")," and ",(0,i.kt)("inlineCode",{parentName:"p"},"<*>")," mean - for now we can treat them as building blocks for binary operations on functions of time."),(0,i.kt)(o.J,{stub:!0,player:l.main,code:r,mdxType:"Player"}),(0,i.kt)("h2",null,"Conclusion"),(0,i.kt)("p",null,"In this section, we learned how to use functional programming to shape a single note. We saw how we can compose together functions to modulate the pitch and amplitude of that note, and we saw how to compose together several notes into one larger note that decomposes and recomposes as we listen to it. With these techniques, we can make fun little instruments like the one below, the source code of which can be found ",(0,i.kt)("a",{parentName:"p",href:""},"here"),". I hope you enjoy playing it, and I'll see you in the next article!"),(0,i.kt)("blockquote",null,(0,i.kt)("p",{parentName:"blockquote"},(0,i.kt)("a",{parentName:"p",href:"https://github.com/mikesol/purescript-wags"},"Click here")," for additional resources for working with these examples on the cloud, on Windows, on Mac or on Linux. ",(0,i.kt)("a",{parentName:"p",href:"https://purescript.org"},"Click here")," to learn more about the PureScript programming language.")))}C.isMDXComponent=!0}}]);
//# sourceMappingURL=component---src-pages-note-and-function-mdx-9388b1bed528593e2640.js.map
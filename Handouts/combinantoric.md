% Combinatorics
% Phillip Alday
% April 2011

# Basic Idea

As we saw in our brief exploration of set theory, counting is a non
trivial problem. One thing that is particularly important to count are
arrangements of elements of a set. We call such arrangements
**permutations**. Together with **combinations**, they
provide an important tool in experimental design and evaluation as well
as in understanding the range of possibilities for a given linguistic
structure.

For the purposes of the following discussion, we will assume all sets
are finite, unless explicitly stated otherwise. The sole exception to
this is the set of natural numbers, which we will often use as the
superset of the sets we are manipulating.

# Definitions

There are several ways to think of permutations that are relevant for
linguistic use.[^1] Each of the following definitions is more or less
equivalent.

A **permutation** is:
* an ordering
* a way of arranging a certain (sub)set of elements
* a way of putting together elements from different collections in a particular
order

For example, the permutations of $S = \{a,b,c\}$ are:
$$abc, acb, bac, bca, cab, cba$$ We can also take "shorter"
permutations. The permutations of $S$ taken two at a time are:
$$ab, ba, ac, ca, ba, cb$$ Now, unlike in "regular"[^2] sets, we allow
for repeated elements in the sets we wish to permute.[^3] The
permutations of $R = \{a,a,b\}$ are: $$aab, aba, baa$$ Notice that the
number of distinct permutations has decreased compared to a set with
three distinct elements.

Sometimes we wish to consider the possibilities where order doesn’t
matter: $ab$ and $ba$ don’t count as separate items. At this point, we
could be using a combintation.\
 For example, $S = \{a,b,c\}$ only has one combination when taken in its
entirety: $abc$. When we take combinations of two elements of $S$, there
are only three: $ab, bc, ac$. We note right away that there are fewer
combinations of $S$ than permutations. In fact, this holds generally:

The number of permutations is always greater than or equal to the number
of combinations.[^4]

Computation
===========

In many linguistic applications, we care more about the number of
possible permutations or combinations than actually enumerating them.
Since enumeration quickly becomes problematic for all but the most
trivial cases, it would be convenient to be able to calculate the number
of possibilities without enumeration.

Before we begin calculating how many permutations or combinations are
possible given a particular input set, we need to state the Fundamental
Counting Principle. Given a choice of $X$, consisting of $n$ subchoices,
the total number of options available is the product of the number of
options available in each subchoice.

[Fundamental Counting Principle] Given $a$ ways of performing an action
$A$ and $b$ ways of performing an action $B$, there are $a\cdot{}b$ ways
of performing both actions. More generally, given $r$ actions and
$n_{i}$ ways for performing an action $i$, there are
$n_{1}\cdot{}n_{2}\cdot{}\ldots{}\cdot{}n_{r-2}\cdot{}n_{r-1}\cdot{}n_{r}$
all of the actions together.

Up until now, we’ve have only allowed each element in the input set to
occur once in the output permutation or combination. That is, we’ve
largely viewed combinations as a subset of the input set, and
permutations as an ordering on that set. Now, there are also instances
where we wish to allow input elements to be repeated in the output. An
example of this is drawing colored balls from a bag. If I put the balls
back in the bag after each draw, then repetitions can occur. If I don’t
replace the balls, then they can’t occur (unless there are duplicates of
some elements in the bag like our $R$ example earlier – but more on that
later). The formulae for calculating the number of permutations of $n$
objects taken $k$ at a time ($P(n,k)$) both with and without repetition,
as well as the analogous formulae for the number of combinations
($C(,n,k)$) are presented in Table [tab:formulae-basic]. The derivations
for these formulae from the counting principle were presented in class
and provide good examples of the application of the counting principle!

[htb]

<span>p<span>4cm</span> c c</span> Situation & $P(n,k)$ & $C(n,k)$\
no repetitions & $\displaystyle{}\frac{n!}{(n-k)!}$ &
$\displaystyle{}\binom{n}{k} = \frac{n!}{k!(n-k)!}$\
& &\
repetitions & $\displaystyle{}n^{k}$ &
$\displaystyle{}\binom{n+k-1}{k} = \frac{(n+k-1)!}{k!(n-1)!}$\

[tab:formulae-basic]

The number of choices of $k$ objects from $n$ without repetition, that
is $C(n,k) = \binom{n}{k}$, is a calculation that comes up in many areas
of math, science and linguistics. It is called the <span>binomial
coefficient</span> for reasons we will not go into here. It is a very
important formula to learn and recognize! (Expect an exam question!)

Occasionally, we must also deal with the permutations of sets with
repeated elements, like $R = \{a,a,b\}$ from above. Not allowing for
repetitions here (in the sense of "returning" an element to the set for
future selection), we still encounter the issue that there is a repeated
element in the set. So, we have repeats of a sort built in. The
permutation $aab$ is the same, regardless of whether the left most $a$
corresponds to the first $a$ in $R$ or the second.

A more concrete example is: how many different distinct strings can you
build from the letters of "MISSISSIPPI"? We note that <span>‘S’</span>
and <span>‘I’</span> are each repeated four times and <span>‘P’</span>
twice. We can use this fact to modify our previous calculation for
permutations. A letter $l$ repeated $r$ times, represents $r!$ different
ways of rearranging the order of the duplicates. That is, we have $r!$
times too many permutations when we use the base $n!$ calculation for
total number of permutations. So, for each repeated letter $l$, we
divide by $r!$.

More generally, suppose there is a string $S$ of length $n$, such that
there are $r_{1}$ identical letters of one type, $r_{2}$ of another,
$r_{i}$ of the $i$-th repeated type. Then the number of distinct
permutations of $S$ is:

$$\frac{n!}{r_{1}!\cdot{}r_{2}!\cdot{}\ldots{}\cdot{}r_{i-1}!\cdot{}r_{i}!}$$

So for our "MISSISSIPPI" example, there are
$$\frac{11!}{4!4!2!} = 34650$$ distinct permutations, certainly not a
number we would want to have to enumerate.\

Permutations as Mappings
========================

Sometimes, we wish to look at permutations more abstractly as a
reordering of any sequence (ordered set). Without loss of generality, we
assume that the base sequence is the first $n$ natural numbers:
$1,2,3,\ldots,n$.[^5] We can express a permutation on this sequence so:

$$\left(
\begin{array}{*{7}{c}}
1 & 2 & 3 & 4 & 5 & \cdots &n\\
p_{1} & p_{2} & p_{3} & p_{4} & p_{5} & \cdots & p_{n}\\
\end{array}
\right)$$

where the $p_{i}$’s are the position that each element is moved to. More
concretely,

$$\left(
\begin{array}{*{4}{c}}
1 & 2 & 3 & 4 \\
3 & 1 & 4 & 2\\
\end{array}
\right)\label{eq:expermute}$$

would take the sequence $(1 2 3 4)$ and map it to $(2 4 1 3)$. Now, what
happens if we take this same permutation ([eq:expermute]) and apply to
$(2 4 1 3)$? We get yet another sequence: $(4 3 2 1)$. Repeating the
process yet again, we get $(3 1 4 2)$. Doing it one more time, gives us
our original sequence: $(1 2 3 4)$. So, we have something like this:

$$\label{eq:cycle}
(1 2 3 4) \mapsto (2 4 1 3) \mapsto (4 3 2 1) \mapsto (3 1 4 2) \mapsto (1 2 3 4)$$

This type of circular path is called a <span>cycle</span>. We can
express permutations in terms of cycles; in this case, we only need one:
$(1,3,4,2)$. That notation reads "one goes to three, three goes to four,
four goes to two, two goes to one" and expresses both the individual
movements we need at each step as well as the path that each element
follows during the cycle. Cycle notation is equivalent to matrix
notation; from here on out, we’ll be using cycle notation.

So, we’re examining permutations as mappings, and like most mappings, we
can compose them (apply them successively), as we saw when applied the
permutation in ([eq:expermute]) repeatedly to its own output. We write
the permutations to be applied so: $\pi_{1}\pi_{2}\ldots\pi_{n}$, that
is, like multiplication. There is one caveat though: we read the product
from right to left, like with function composition. So, given the
product $(1,3)(1,4)(1,2)$, we first move one to two and two to one,
**then** the new one (what was two at the beginning) to four and four to
one, etc. Using the base sequence $(1 2 3 4)$ again, we do the process
like so:

$$(1 2 3 4) \overset{(1,2)}{\mapsto} (2 1 3 4) \overset{(1,4)}{\mapsto} (4 1 3 2) \overset{(1,3)}{\mapsto} (3 1 4 2)$$

We see that this is actually our the permutation from ([eq:expermute])!
We performed a complex permutation using only transposition (swapping of
two elements). This is an example of an important fact in abstract
algebra:

Every permutation can be written as the product of transpositions.

Every mathematics student learns this in his first year, yet this idea
is what is forms the basis of Merge in Chomsky’s Minimalist Program
[@chomsky1995a], where it was considered a major innovation.

Further reading on groups: "Group Think" by Steven
Strogatz.[@strogatz2010b] (In ILIAS!)

[^1]: The concept "permutation" has a few different, albeit closely
    related, meanings in abstract mathematics. Broadly speaking, it is a
    mapping of a finite set onto itself. We will consider this idea in
    more detail later: it actually provides the basis for a relatively
    "new" theory in Chomskyan linguistics.

[^2]: 'üblich'

[^3]: Such sets are also called **multisets** and an element
    that appears $m$ times is said to have **multiplicity
    $m$**.

[^4]: The "or equal to" part is important here: the trivial example of a
    one-element set has only one possible permutation and one possible
    combination.

[^5]: If you’re having trouble understanding why we can make this
    assumption without loss of generality, then think of these as
    subscripts: $x_{1},x_{2},\ldots,x_{n}$.

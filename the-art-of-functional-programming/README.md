> Title: The Art of Functional Programming
> 
> Author: Minh Quang Tran, PhD
> 
> Link: https://www.amazon.es/dp/3000735348?psc=1&ref=ppx\_yo2ov\_dt\_b\_product\_details
> 
> Functional programming is a powerful and elegant programming paradigm. Initially only popular among university researchers, it’s gained much traction in the software industry in the last few years. From big companies to start-ups, engineers and managers have realized that functional programming excels at abstraction and composition. Functional programming allows for highly concise solutions with increased safety. This has led to rising demand for software engineers with functional programming skills. This book will help you move your programming skills to the next level.

<img src="https://m.media-amazon.com/images/I/61oDqMnuCoL._SY522_.jpg" alt="book cover">

## Notes

### Chapter 1

Imperative programming influence can be attributed to the Von Neumann computing architecture, where everything is an instruction (even conditionals and loops)

Functional programming popularity thanks to the increase of declarative languages/technologies (e.g., HTML, Flutter, Swift UI, JetPack Compose) adoption to build modern frontend products.

***

Quiz

* Q1: Choice A) (influence of Von Neumann architecture)
* Q2: Choice A) and B) (microservices is an architecture style, not a programming paradigm)
* Q3: Choice B) and C) since those are one of the winning use cases of functional programming. Author says it's only choice A), need to ask him why
* Q4: Choice B) and C) ant is not declarative

### Chapter 2

Everything in functional programming is an expression (think like a math expression), even conditionals and loops. Since everything is an expression, everything can be evalutaded and applied (transformation).

In a `if` expression, there must be always an `else`, because an expression must **always** evaluate to a <strong>value</strong>.

Composition is the term used to describe expressions that can be the result of another expression (higher order function).

The `+-/*` symbols are called <strong>operators</strong>. The expression on the left or right of an operator is called an <strong>operand</strong>. A operator sitting on te middle of two operands is called a <strong>binary operator</strong>.

A way to understand expressions is to think about languages and their syntax. In the English language we have values (words), expressions (sentences) and symbols (letters). Expressions are formed of symbols and values.

<strong>Syntactic Checking</strong>: Validate if the program respects the language syntax (e.g., `a = 3 \ 3` fails synthatic check because `\` is not a valid operator)

<strong>Semantic Checking</strong>: Validate if the program makes sense (e.g., `a = 3 + ""` passes synthatic check, but fails semantic because it doesn't make sense to add a number with a string)

<strong>Type Checking</strong>: Evaluates expressions from their leaf nodes up to the root node to understand if the expression types are semantically correct.
<img src="https://raw.githubusercontent.com/freitzzz/cinderela/master/blog/general/fp/type-checking-ast.jpeg" alt="abstract syntax tree formed to check root nodes types">
<strong>Static Typing vs Dynamic Typing</strong>: In static typed languages, the compiler performs **syntactic** and **semantic** checks, whereas dynamic typed languages only perform **syntactic** checks.

<strong>Interpreted vs Compiled Languages</strong>: In interpreted languages, expressions are evaluated at runtime (on the fly), whereas in compiled languages, expressions are evaluated at compile time when translating to bytecode (if running on a VM) or native code (CPU).

<strong>Named Expressions (aka function names)</strong>: In Functional Programming there isn't the concept of variable names. Instead, named variables become expressions. In OCaml, this is achieved using the `let` keyword (e.g., `let pi = 3.14`, can now be used inan expression (`let circle_area = let radius = 2.0 in pi * radius * radius`))

***

Programming Challenges

Challenge 1)

```ocaml
let x = 10
let y = 2
let z = 5

let max_number = let m = if x > y then x else y in if m > z then m else z
```

Challenge 2)

```ocaml
let x = -10

let abs = let a = x in if x < 0 then -x else a
```

***

Quiz

* Q1: Choice B) and C) (only expression names exist, recursion replaces loops)
* Q2: Choice A) (the = operator acts as an equality operator after an expression has been named)
* Q3: Choice B) (syntax errors occur when the compiler doesn't recognize a symbol as part of the language syntax. In this case, there is no symbol that isn't part of the language. Furthermore, the expression tries to evaluate two different types, string and int, which is not allowed in OCaml)
* Q4: Choice A) (expression names can't start with numbers in OCaml)
* Q5: Choice B) (the conditional expression evaluates to even)
* Q6: Choice B) (last expression evaluates to boolean)
* Q7: Choice B) (local named expression a evaluates to 1 and then b to 2, but the scoped named expression a evaluates to 42)
* Q8: Choice A) (In Java an if conditional is a statement and not an expression)

### Chapter 3

Lambda calculus is the theoretical foundation of functional programming. It defines an expression with one input that maps to an output. These expressions are called lambda expressions and can be specified in three scenarios:

* Declaring a name for a value (variable) (e.g., `let x = 2`)
* Declaring a function that uses an expression (e.g., `let y = 2 * x`)
* Declaring a function that receives an expression and maps to an expression (e.g., `let z = y`)

When evaluating lambda expressions, these need to be reduced. Reduceable expressions are called <strong>redex</strong>.

Expressions can be reduced in two ways: evaluate the right expression or replace the left expression with the right expression. The former technique is called <strong>call-by-value</strong>, where the latter is **call-by-name** (or call by reference).
Usually they will resolve the same value, but in scenarios where an expression can’t be fully reduced, call-by-reference can’t be applied (since the expression can’t be resolved).

Call by name is available in **non-strict** languages (e.g., Haskell), whereas call by value is available in **strict** languages (e.g., OCaml).

**”Functions are first class citizens”**: this means that functions can be applied to everything (declarations, applications, operations (+-\*/), etc).

**Higher Order Functions**: also know as *HoF*, is a primitive from lambda calculus that enables passing functions as parameters of a function.

**Currying** the technique of partly applying functions on a function. This is achieved using higher order functions, by applying a function to one of the arguments. For example:

```ocaml
let product = fun x y -> x * y
let double = product 2
```

We define a function that computes the product of a number and then create function to compute the double of a number, by partially applying the product function to value 2.

**Recursive Functions**: the only way to achieve loops in functional programming is by recursively applying a function until a desired result is met.

```ocaml
let rec sum = fun n -> if n <= 0 then n else n + sum (n-1)

sum 3
= 3 + sum 2
= 3 + (2 + sum 1)
= 3 + (2 + (1 + sum 0))
= 3 + (2 + (1 + 0))
= 3 + (2 + 1)
= 3 + 3
= 6
```

The example above describes the summation of numbers from 0 to `n`, something we would achieve with a `for loop` in imperative languages.

**Tail Recursive Functions**: Recursive functions enable loops but have a counterpart. Each function invocation results in pushing a **temporary value** in the program stack, so that it can later be used to **evaluate** the expression. A program stack can only handle so many values, and once reaching its limits, the program ends with **Stack Overflow** error.

Tail recursive functions solve this issue by **fully evaluating **the expression without pushing temporary values in the program stack.

```ocaml
let rec sum_tail = fun n r -> if n <= 0 then r else sum_tail (n-1) (r + n)

sum_tail 3 0
= sum_tail 2 3
= sum_tail 1 5
= sum_tail 0 6
= 6
```

**Function Abstraction**: Just like in Object Oriented paradigm, there is also abstraction in the functional paradigm. Abstraction means abstracting a known domain (expressing what is known). In the functional paradigm, abstraction is achieved with **HoF**.

```ocaml
let rec summation = fun n e r -> if n <= 0 then r else summation (n-1) e (e r)
let sum = fun n -> let s = fun x -> x + 1 in summation n s 0
```

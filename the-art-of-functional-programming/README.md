> Title: The Art of Functional Programming
> 
> Author: Minh Quang Tran, PhD
> 
> Link: https://www.amazon.es/dp/3000735348?psc=1&ref=ppx\_yo2ov\_dt\_b\_product\_details
> 
> Functional programming is a powerful and elegant programming paradigm. Initially only popular among university researchers, it’s gained much traction in the software industry in the last few years. From big companies to start-ups, engineers and managers have realized that functional programming excels at abstraction and composition. Functional programming allows for highly concise solutions with increased safety. This has led to rising demand for software engineers with functional programming skills. This book will help you move your programming skills to the next level.

<p align="center"><img src="https://m.media-amazon.com/images/I/61oDqMnuCoL._SY522_.jpg" alt="book cover" style="width: 15%"></p>

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
<p align="center"><img src="https://raw.githubusercontent.com/freitzzz/cinderela/master/blog/general/fp/type-checking-ast.jpeg" alt="abstract syntax tree formed to check root nodes types" style="width: 30%;"></p>
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

Tail recursive functions solve this issue by **fully evaluating** the expression without pushing temporary values in the program stack.

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

<p align="center"><img src="https://raw.githubusercontent.com/freitzzz/cinderela/master/blog/general/fp/function-abstraction.png" alt="hierarchy of functions" style="width: 60%;"></p>

---

Programming Challenges

Challenge 1)

```ocaml
let is_prime = fun x -> let rec tail_is_prime = fun x y -> if y = 1 then true else if x mod y = 0 then false else tail_is_prime (x) (y - 1) in if x < 2 then false else tail_is_prime (x) (x-1)
```

Challenge 2)

```ocaml
let last_fib = fun n -> 
  let rec tail_last_fib = 
    fun p1 p2 m -> 
      if (p1 + p2) > m then p1 else tail_last_fib (p1 + p2) (p1) m 
  in if n <= 0 then n else if n <= 2 then 1 else tail_last_fib 3 2 n
```

Challenge 3)

```ocaml
let fib = fun n -> 
  let rec tail_fib = 
    fun p1 p2 m -> 
      if m = 0 then p1 else tail_fib (p1 + p2) (p1) (m - 1) 
  in if n <= 0 then n else if n <= 2 then 1 else tail_fib 2 1 (n - 3)
```

Challenge 4)

```ocaml
let twice = fun f x -> f(f x)
```

Challenge 5)

```ocaml
let compose = fun f g -> fun x -> f(g(x))
```

Note: Since `compose` is denoted as `f(g(x))` and we need to pass a value `x` to function `g`, then `compose` must return a function that receives a value `x` a applies it as `f(g(x))`.

Challenge 6)

```ocaml
let rec filtered_accumulate = fun combiner init term pred m n -> 
  if m > n then init 
  else if (pred m) then combiner (term m) (filtered_accumulate combiner init term pred (m + 1) n)
  else (filtered_accumulate combiner init term pred (m + 1) n)
```

---

Quiz

* Q1: Choice A) `y` can't be evaluated on the left-hand expression, so the end result must end with `y`
* Q2: Choice B) HoF enables passing functions as parameters, so one can abstract the function implementation by allowing multiple implementations that match a contract
* Q3: Choice A) OCaml expression evaluation strategy is call by value, so it will first try to evaluate the failure
* Q4: Choice B) It's an unary operator that returns another unary function
* Q5: Choice A) It will never terminate since OCaml uses call by value strategy
* Q6: Choice B)
* Q7: Choice A) The function checks if the number is odd, and since 11 is an odd number, it evaluates to "it's true"
* Q8: Choice B)

### Chapter 4

The **tuple** record is the primary compound data object we can use to construct data structures of two elements. Triplets can be written using two tuples (e.g., `(1, (2, 3))`).

Using compound data objects enables **pattern matching**: the ability to deconstruct the object by matching possible values it can take.

```ocaml
let point = (1, 2)
let translate = fun p -> match p with | (x, y) -> ((x*2), (y*2))
```

Sequences and lists are also constructed with tuples. In OCaml these are defined with operator `::`, also known as `cons`. The first element is called **head**, and the last element of a list is always an empty list constructor (reads as nil `[]`), called **tail**:

```ocaml
let list1 = 1::(2::(3::[]))
let list2 = [1; 2; 3;]
```

In OCaml lists are **linked lists** instead of indexable lists.

Common list operations can be defined by pattern matching the head and tail of the list:

```ocaml
let rec length = fun l -> match l with
    | [] -> 0
    | hd :: tl -> 1 + length tl;;
    
let rec append = fun l1 l2 -> match l1 with
    | [] -> l2
    | x :: xs -> x :: append xs l2;;
```

Another powerful compound data objects are **Algebraic Data Types** (ADT).  These objects represent data structures that can represent all **combinations** of a type (e.g., `int * string` represents a tuple whose first element is `int` and last is `string`) and **alternations** of types (e.g., a list can be empty or a combination of a head and tail).

Combination types are also known as a **product** types. Alternation types are also known as **sum** types (sum of all alternatives).

To define an alternation we use the **pipe** operator (`|`):

```ocaml
type shape = Circle of float | Rectangle of float * float | ComplexShape of shape list
```

ADT also allows us to define **parameterized data types**, also known as **generic data types**:

```ocaml
type 'X bin_tree = Leaf | Node of 'X bin_tree * 'X * 'X bin_tree
```

The Option and Either data types can also be modeled with ADT:

```ocaml
type 'X option = None | Some of 'X;;
type ('X, 'Y) either = Left of 'X | Right of 'Y;;

let safe_div = fun a b -> if b = 0 then Left "Division by zero" else Right (a/b);;
```

---

Programming Challenges

Challenge 1)

```ocaml
let longest_string = fun l -> 
  let rec longest_string_search = 
    fun ll r -> match ll with 
      | [] -> r
      | x :: xs -> if (String.length x) >= (String.length r) 
          then longest_string_search xs x 
          else longest_string_search xs r 
  in match l with
  | [] -> None 
  | x :: xs -> Some (longest_string_search xs x);;
```

Challenge 2)

```ocaml
let concat = fun s l -> 
  let rec concat_cons = 
    fun ll r -> match ll with 
      | [] -> r
      | x :: xs -> concat_cons xs (r ^ s ^ x)
  in match l with
  | [] -> ""
  | x :: xs -> concat_cons xs x;;
```

Challenge 3)

```ocaml
type 'a bin_tree = 
  | Leaf
  | Node of 'a bin_tree * 'a * 'a bin_tree;;

let rec height t = match t with
    | Leaf -> 0
    | Node (l, _, r) -> 1 + max (height l) (height r)
```

Challenge 4)

```ocaml
type nat = Zero | Succ of nat;;

let pred = fun n -> match n with
    | Zero -> None
    | Succ nat -> Some x;;
```

Challenge 5)

```ocaml
type nat = Zero | Succ of nat;;

let nat_len = fun n -> let rec nat_len_rec = fun nn r -> match nn with 
    | Zero -> r
    | Succ (nat) -> nat_len_rec nat (r + 1)
  in nat_len_rec n 0;;

let nat_of = fun n -> let rec nat_of_rec = fun nn r -> 
    if nn = 0
    then r
    else nat_of_rec (nn - 1) (Succ r) 
  in nat_of_rec n Zero;; 

let add = fun n1 n2 -> match (n1, n2) with
  | (Zero, Zero) -> Zero
  | (Zero, nat) -> nat
  | (nat, Zero) -> nat
  | (nat, nat2) -> nat_of ((nat_len nat) + (nat_len nat2));;
```

---

Quiz

* Q1: Choice B) The triple is a product data type so it can have all values within types string, int, bool, meaning it can have an infinite number of values.
* Q2:  Choice A) `mytype` can either be `True` | `False` | `Constant`
* Q3: Choice A)
* Q4: Choice B) Syntax error and OCaml data structures are immutable
* Q5: Choice B) Non-exhaustive pattern matching
* Q6: Choice B)
* Q7: Choice A)
* Q8: Choice C)
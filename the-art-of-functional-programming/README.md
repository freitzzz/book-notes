# the-art-of-functional-programming

![](https://m.media-amazon.com/images/I/61oDqMnuCoL._SY522_.jpg)

> Title: The Art of Functional Programming
>
> Author: Minh Quang Tran, PhD
>
> Link: https://www.amazon.es/dp/3000735348?psc=1&ref=ppx_yo2ov_dt_b_product_details
>
> Functional programming is a powerful and elegant programming paradigm. Initially only popular among university researchers, it’s gained much traction in the software industry in the last few years. From big companies to start-ups, engineers and managers have realized that functional programming excels at abstraction and composition. Functional programming allows for highly concise solutions with increased safety. This has led to rising demand for software engineers with functional programming skills. This book will help you move your programming skills to the next level.

## Notes

### Chapter 1

Imperative programming influence can be attributed to the Von Neumann computing architecture, where everything is an instruction (even conditionals and loops)

Functional programming popularity thanks to the increase of declarative languages/technologies (e.g., HTML, Flutter, Swift UI, JetPack Compose) adoption to build modern frontend products.

Quiz:

- Q1: Choice A) (influence of Von Neumann architecture)
- Q2: Choice A) and B) (microservices is an architecture style, not a programming paradigm)
- Q3: Choice B) and C) since those are one of the winning use cases of functional programming. Author says it's only choice A), need to ask him why
- Q4: Choice B) and C) ant is not declarative

### Chapter 2

Everything in functional programming is an expression (think like a math expression), even conditionals and loops. Since everything is an expression, everything can be evalutaded and applied (transformation).

In a `if` expression, there must be always an `else`, because an expression must **always** evaluate to a **value**.

Composition is the term used to describe expressions that can be the result of another expression (higher order function).

The `+-/*` symbols are called **operators**. The expression on the left or right of an operator is called an **operand**. A operator sitting on te middle of two operands is called a **binary operator**.

A way to understand expressions is to think about languages and their syntax. In the English language we have values (words), expressions (sentences) and symbols (letters). Expressions are formed of symbols and values.

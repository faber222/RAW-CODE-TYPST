#import "@preview/klaro-ifsc-sj:0.1.0": report

#show: doc => report(
  title: "Enumarated Raw Code",
  subtitle: "Um template para o Typst voltado para criar um Enumarated raw code",
  authors: ("Faber222",),
  date: "16 de Julho de 2024",
  doc,
)


// A partir dessa parte
#let style-number(number) = text(gray)[#number] // Seleciona a cor do numero contador
#show raw.where(block: true): it => grid(       // Aqui configuramos os parametros da grid do raw code
  columns: 2,
  align: (right, left),
  gutter: 0.5em,
  column-gutter: -0.2em,
  ..it.lines
    .enumerate()
    .map(((i, line)) => (style-number(i + 1), line)) // Aqui fazemos a iteração das linhas
    .flatten()
)

#show raw: it => block( // Define os parametros do design do raw code
  fill: rgb("#FFFFE6"),
  width: 100%,
  inset: 8pt,
  radius: 0pt,
  text(fill: rgb("#000000"), it),
)

#set rect(inset: 0pt, stroke: 2pt) // Define a expessura do retângulo

= Exemplo
// Para criar da forma, deve se iniciar o raw code com o #rect[] e dentro dele fazer seu raw code
// Este método não é o mais otimizado, pois pode ser implementado direto no edit do raw code block e add o rect dentro dele
\
Exemplo de código em C.
#rect[
```c
  #include <stdio.h>

  int main(){
    printf("hello world");
    
    return 0;
  }
```
]

Exemplo de código em Java.
#rect[
```Java
  package typst;

  public class App{
    public static void Main(String[] args){
      System.out.println("hello world");
    }
  }
```
]

Exemplo de código VHDL.
#rect[
```Sh
  library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;
  
  entity unsigned_adder is
  
  	generic
  	(
  		DATA_WIDTH : natural := 8
  	);
  
  	port 
  	(
  		a	      : in unsigned  ((DATA_WIDTH-1) downto 0);
  		b	      : in unsigned  ((DATA_WIDTH-1) downto 0);
  		result  : out unsigned ((DATA_WIDTH-1) downto 0)
  	);
  
  end entity;
  
  architecture rtl of unsigned_adder is
  begin
  
  	result <= a + b;
  
  end rtl;
```
]


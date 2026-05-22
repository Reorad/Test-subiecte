# Exercițiul 2: Proiectarea unui Generator de Secvențe cu ROM pe 4 biți

## Cerință (Requirement)
> **Requirement:** Implement a 4bit up-counter which has its outputs connected to the Address pins of a 16x4bit ROM. The ROM is storing the functions:
> - $f_1(a,b,c,d) = \sum(1,2,3,6,7,11)$
> - $f_2(a,c,d) = \sum(2,5,6,7)$
> - $f_3(b,c,d) = \prod(1,2,4,5,7)$

---

## Structura Proiectului (Top-Level)

Acest proiect realizează afișarea unei secvențe predefinite de stări stocate într-o memorie ROM pe 4 LED-uri (`Leds_out`), utilizând un numărător pe 4 biți și un divizor de ceas.

## Structura Proiectului (Top-Level)

Schema structurală a circuitului cuprinde trei componente principale interconectate:
1. **Divizorul de ceas (`CLK_Divider`):** Reduce frecvența ceasului principal (`CLK`) pentru a obține un ceas mai lent (`Clk_slow` / `Clk_1mhz`), asigurând o tranziție vizibilă a stărilor pe placă. Divizorul are un factor generic setat în Top Level la valoarea `1000`.
2. **Numărătorul pe 4 biți (`bit4counter`):** Funcționează sincron pe baza ceasului divizat. Generează secvența de adrese de la `0000` (0) la `1111` (15), crescând cu `1` la fiecare front crescător de ceas slow.
3. **Memoria ROM (`ROM`):** Este o memorie ROM asincronă cu capacitatea de 16 locații $\times$ 4 biți ($16 \times 4$ biți). Intrarea de adresă `Add_port` este conectată la ieșirea numărătorului, iar datele citite (`Rom_data_out`) sunt trimise direct la ieșirea de LED-uri (`Leds_out`).

![Schema Structurală Top-Level](../images/ex2%20top%20level.drawio.png)


## Logica Funcționării și Tabelul Adevărului (Memoria ROM)

Când numărătorul parcurge secvența de adrese de la 0 la 15, memoria ROM returnează la ieșire valorile corespunzătoare predefinite în vectorul `Memory_func`. 

Tabelul de mai jos ilustrează corespondența dintre valoarea numărătorului (adresa din ROM) și valoarea afișată pe LED-uri (datele din ROM):

| Pasul (Adresa ROM în Zecimal) | Adresa ROM în Binar (`Add_port`) | Date ROM în Binar (`Rom_data_out`) | Date ROM în Zecimal | LED-uri active (`Leds_out` - indexate 3 downto 0) |
| :---: | :---: | :---: | :---: | :---: |
| **0** | `0000` | `0100` | 4 | LED 2 |
| **1** | `0001` | `0001` | 1 | LED 0 |
| **2** | `0010` | `0011` | 3 | LED 1, LED 0 |
| **3** | `0011` | `0101` | 5 | LED 2, LED 0 |
| **4** | `0100` | `0000` | 0 | - (Toate stinse) |
| **5** | `0101` | `0000` | 0 | - (Toate stinse) |
| **6** | `0110` | `0111` | 7 | LED 2, LED 1, LED 0 |
| **7** | `0111` | `0001` | 1 | LED 0 |
| **8** | `1000` | `0100` | 4 | LED 2 |
| **9** | `1001` | `0010` | 2 | LED 1 |
| **10** | `1010` | `0010` | 2 | LED 1 |
| **11** | `1011` | `0111` | 7 | LED 2, LED 1, LED 0 |
| **12** | `1100` | `0000` | 0 | - (Toate stinse) |
| **13** | `1101` | `0010` | 2 | LED 1 |
| **14** | `1110` | `0110` | 6 | LED 2, LED 1 |
| **15** | `1111` | `0010` | 2 | LED 1 |
---

## Demonstrația Matematică a Funcțiilor ROM

Memoria ROM stochează 3 funcții logice separate pe biții ieșirii sale de date `Rom_data_out` (notat ca $(D_3, D_2, D_1, D_0)$ unde $D_0$ este LSB):
- **$f_1$ (pe bitul $D_0$)**: $f_1(a,b,c,d) = \sum(1,2,3,6,7,11)$
  - Bitul $D_0$ devine `1` pentru adresele (zecimal): $1, 2, 3, 6, 7, 11$.
- **$f_2$ (pe bitul $D_1$)**: $f_2(a,c,d) = \sum(2,5,6,7)$
  - Deoarece funcția depinde doar de 3 variabile $(a,c,d)$, variabila $b$ este indiferentă (don't care). Adresele corespunzătoare pe 4 biți sunt obținute prin expandarea lui $b$ (pozițiile binare sunt $a$ ca MSB, $d$ ca LSB):
    - Mintermul $2 \ (010_2 \text{ pe } a,c,d) \implies 0X10_2 \implies 2 \text{ și } 6$
    - Mintermul $5 \ (101_2 \text{ pe } a,c,d) \implies 1X01_2 \implies 9 \text{ și } 13$
    - Mintermul $6 \ (110_2 \text{ pe } a,c,d) \implies 1X10_2 \implies 10 \text{ și } 14$
    - Mintermul $7 \ (111_2 \text{ pe } a,c,d) \implies 1X11_2 \implies 11 \text{ și } 15$
  - Deci, bitul $D_1$ devine `1` la adresele: $2, 6, 9, 10, 11, 13, 14, 15$.
- **$f_3$ (pe bitul $D_2$)**: $f_3(b,c,d) = \prod(1,2,4,5,7)$
  - Fiind o formă canonică conjunctivă (produs de maxterme), funcția ia valoarea `0` la maxtermele precizate pe 3 variabile $(b,c,d)$. Variabila $a$ este indiferentă.
  - Adresele unde $f_3 = 0$:
    - Maxtermul $1 \ (001_2 \text{ pe } b,c,d) \implies X001_2 \implies 1 \text{ și } 9$
    - Maxtermul $2 \ (010_2 \text{ pe } b,c,d) \implies X010_2 \implies 2 \text{ și } 10$
    - Maxtermul $4 \ (100_2 \text{ pe } b,c,d) \implies X100_2 \implies 4 \text{ și } 12$
    - Maxtermul $5 \ (101_2 \text{ pe } b,c,d) \implies X101_2 \implies 5 \text{ și } 13$
    - Maxtermul $7 \ (111_2 \text{ pe } b,c,d) \implies X111_2 \implies 7 \text{ și } 15$
  - Prin urmare, $f_3 = 0$ la adresele: $1, 2, 4, 5, 7, 9, 10, 12, 13, 15$. La toate celelalte adrese ($0, 3, 6, 8, 11, 14$), bitul $D_2$ devine `1`.

---

### Detalii de implementare ROM în VHDL
Memoria este descrisă comportamental folosind un tip tablou (`array`) cu valori inițializate direct la declararea semnalului. Citirea datelor se face asincron (fără declanșare pe front de ceas):
```vhdl
Rom_Data_out <= Memory_func(to_integer(unsigned(Add_port)));
```
Deoarece citirea este pur combinațională/asincronă, ieșirea `Rom_data_out` își schimbă starea instantaneu (cu o întârziere minimă de propagare logică) la modificarea adresei furnizate de numărător.

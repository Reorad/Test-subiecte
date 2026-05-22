# Exercițiul 6: Proiectarea și Simularea unei Memorii RAM Generice

## Cerință (Requirement)
> **Requirement:** Implement a generic RAM module. Using this generic RAM module as the main component you will create a 64x16bit RAM. Simulate the system by first resetting all of the data in the RAM to x"0000" then write only at odd addresses the string 128,127,126...

---

## Descrierea Funcționării

Sistemul constă dintr-un modul de memorie RAM generic parametrizabil și un modul de test (testbench) care simulează scrierea și citirea datelor conform cerinței.

### 1. Modulul RAM Generic (`RAM`)
Modulul `RAM` permite definirea unei memorii RAM parametrizate prin generice:
* `ADD`: Numărul de biți de adresă (implicit `6`, determinând $2^6 = 64$ locații).
* `ADD_Lenght`: Lățimea în biți a cuvântului stocat (implicit `16` biți).

**Logica de funcționare:**
* **Resetare asincronă (`RST`):** Când resetul este activ (`'1'`), conținutul întregii memorii este șters complet (`x"0000"`).
* **Scriere sincronă:** Pe frontul crescător al ceasului (`CLK`), dacă `WE` (Write Enable) este `'1'`, datele prezente pe portul `Memory_in` sunt stocate la adresa specificată de `Add_in`.
* **Citire asincronă:** Datele stocate la adresa indicată de `Add_in` sunt disponibile în mod continuu pe portul de ieșire `Data_out`.

---

### 2. Simularea Funcționării (`RAM_test`)
Simularea din testbench validează funcționarea memoriei prin instanțierea directă a modulului generic `RAM` cu dimensiunile $64 \times 16$ biți (`ADD = 6`, `ADD_Lenght = 16`).

**Etapele simulării:**
1. **Resetarea inițială:** Semnalul `RST` este menținut pe `'1'` timp de 10 ns, curățând toate locațiile la `x"0000"`.
2. **Scrierea la adrese impare:**
   - Se parcurg adresele descrescător de la 63 la 0.
   - Dacă adresa curentă este impară (ex. `63`, `61`, `59`, ..., `1`), datele sunt scrise în RAM, iar valoarea introdusă scade succesiv (începând cu `128` la adresa `63`, `127` la adresa `61` etc.).
   - Dacă adresa este pară, scrierea este evitată, păstrându-se valoarea `x"0000"`.
3. **Citirea datelor:** Se dezactivează semnalul `WE` și se parcurg din nou toate adresele pentru a citi și vizualiza valorile scrise în portul de ieșire `Data_out`.

---

## Schema Bloc RAM 64x16

![Schema Bloc RAM 64x16](../images/ex6%20top%20level.drawio.png)

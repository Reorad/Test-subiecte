# Exercițiul 5: Proiectarea unui Sistem cu Numărător și Registru

## Cerință (Requirement)
> **Requirement:** Implement a system which contains a 4bit up-counter and a 4bit register. The register can only do a sync parallel load and an async reset. The counter has its output connected to LEDs and to the registers parallel input port. Using the Load command we can store the current counter value in the register.

---

## Descrierea Funcționării

Sistemul reprezintă interconectarea structurală a unui numărător pe 4 biți și a unui registru paralel pe 4 biți. Ambele componente sunt comandate de un ceas lent (`Sec_1clk`) obținut prin divizarea ceasului principal cu modulul `CLK_divider`.

### 1. Componentele Sistemului
* **Numărătorul pe 4 biți (`Counter_4bit`):**
  - Este un numărător sincron în sus (up-counter) care își incrementează starea la fiecare front crescător de ceas.
  - Are un semnal de reset asincron (`RST`) care aduce valoarea numărătorului la `"0000"`.
  - Ieșirea sa este conectată direct la primul set de LED-uri (`Leds_out_counter`) pentru monitorizarea valorii curente a numărării.

* **Registrul pe 4 biți (`Registere`):**
  - Are o intrare de date paralelă de 4 biți (`Q_in`), o intrare de încărcare sincronă (`Load`), reset asincron (`RST`) și ieșirea pe 4 biți (`Q_out`).
  - **Resetare asincronă:** Când `RST` este `'1'`, registrul este resetat imediat la `"0000"`, independent de ceas.
  - **Încărcare sincronă (Parallel Load):** Când semnalul `Load` este activ (`'1'`), valoarea prezentă pe portul de intrare paralelă `Q_in` este salvată în registru la următorul front crescător de ceas. Dacă `Load` este `'0'`, registrul își păstrează starea anterioară.
  - Ieșirea registrului este conectată la al doilea set de LED-uri (`Leds_out_register`).

### 2. Interconectarea în Top-Level (`Counter_Reg`)
- Ieșirea numărătorului (`Q_int`) este conectată la portul de intrare paralelă al registrului (`Q_in`).
- Prin acționarea comenzii de `Load`, valoarea curentă a numărătorului este memorată (capturată) în registru și rămâne stocată acolo, fiind afișată pe al doilea grup de LED-uri, permițând vizualizarea valorii salvate în timp ce numărătorul își continuă numărarea.

---

## Schema Top Level a Circuitului

![Schema Structurală Top-Level](../images/ex5%20top%20level.drawio.png)

# Exercițiul 1: Proiectarea unui Numărător pe 12 biți (Up/Down)

## Cerință (Requirement)
> **Requirement:** Implement a 12bit up-down counter using 4bit counters. The big counter must have an asynchronous reset and load. An extra enable input allows or not the counting ('1' counting enabled, '0' counting disabled).

---

## Descrierea Funcționării

Numărătorul pe 12 biți este implementat structural prin cascada a trei blocuri de numărătoare pe 4 biți (`bit4_counter`).

### 1. Numărătorul de 4 biți (`bit4_counter`)
Fiecare modul de 4 biți este un numărător reversibil (Up/Down) sincron, cu posibilitate de încărcare paralelă (`Load`) și resetare asincronă (`RST`):
- **Numărare în sus (Count Up):** Se realizează când semnalul de control al direcției (`Dir_count`) este `'1'`, cel de activare (`En_count`) este `'1'`, iar transportul de intrare (`Cin`) este `'1'`.
- **Numărare în jos (Count Down):** Se realizează când `Dir_count` este `'0'`, `En_count` este `'1'`, iar semnalul de împrumut de intrare (`Bin`) este `'1'`.
- **Propagarea semnalelor:** 
  - Ieșirea de transport (`Cout`) devine `'1'` când numărătorul atinge starea maximă (`"1111"`) în timpul numărării în sus.
  - Ieșirea de împrumut (`Bout`) devine `'1'` când numărătorul atinge starea minimă (`"0000"`) în timpul numărării în jos.

### 2. Conectarea structurală (pe 12 biți)
Cele trei module sunt conectate în cascadă pentru a forma un numărător pe 12 biți:
- **Primul numărător (LSB - cel mai puțin semnificativ, biții 0-3):** Are intrările `Cin` și `Bin` conectate permanent la `'1'`. Astfel, acesta își schimbă starea la fiecare ceas când enable-ul general `En_count` este activ.
- **Al doilea numărător (biții 4-7):** Are intrarea `Cin` conectată la ieșirea `Cout` a primului numărător, iar intrarea `Bin` conectată la `Bout` de la primul numărător. Acesta numără doar când primul numărător generează transport sau împrumut (la depășirea superioară sau inferioară).
- **Al treilea numărător (MSB - cel mai semnificativ, biții 8-11):** Are intrările `Cin` și `Bin` conectate la `Cout` și `Bout` de la al doilea numărător.

Ieșirile globale de depășire ale numărătorului pe 12 biți sunt `Cout` și `Bout` ale ultimului modul.

---

## Schema Top Level a Circuitului

![Numărător pe 12 biți Up/Down](../images/12%20BIT%20C%20UP%20DOWN.png)

# Exercițiul 8: Numărător Up/Down pe 4 biți cu Multiplexor 2:1

## Cerință (Requirement)
> **Requirement:** Implement a system containing a 4bit up-counter, a 4bit down-counter and 2 to 1 MUX. The MUX selects which counter is shown on the LEDs.

---

## Descrierea Funcționării

Sistemul implementează două tipuri de numărătoare independente pe 4 biți (unul crescător și unul descrescător) ale căror ieșiri sunt selectate prin intermediul unui multiplexor 2:1 și trimise atât către cele 4 LED-uri de pe placa de dezvoltare, cât și către afișajul cu 7 segmente (SSD) în format binar.

### 1. Componentele Sistemului

Sistemul este realizat structural în VHDL, fiind compus din următoarele module:

1. **Numărătorul în sus pe 4 biți (`bit4_up_counter`):**
   - Incrementat pe frontul crescător al semnalului de ceas.
   - Dispune de un port de reset asincron (`RST`) care aduce valoarea contorului la `"0000"`.
   - Modulul funcționează sincron și numără incremental (`Q_aux <= Q_aux + 1`).

2. **Numărătorul în jos pe 4 biți (`bit4_down_counter`):**
   - Decrementat pe frontul crescător al semnalului de ceas.
   - Dispune de un port de reset asincron (`RST`) care aduce valoarea contorului la `"0000"`.
   - Modulul funcționează sincron și numără decremental (`Q_aux <= Q_aux - 1`).

3. **Multiplexorul și logica de control (`Cnt_Top`):**
   - Instanțiază cele două numărătoare (`CNT_UP` și `CNT_Down`).
   - Conține un proces sensibil la intrările `Q_up`, `Q_down` și semnalul de selecție `Sel`.
   - Când `Sel = '0'`, multiplexorul direcționează valoarea numărătorului crescător (`Q_up`) către ieșirea `Q_leds_out`.
   - Când `Sel = '1'`, multiplexorul direcționează valoarea numărătorului descrescător (`Q_down`) către ieșirea `Q_leds_out`.

4. **Debouncer-ul (`MPG` - Mono-Pulse Generator):**
   - Filtrează zgomotul produs la apăsarea butonului fizic `BTN_Cont` (ceasul manual al numărătoarelor), oferind un singur impuls curat pe durata unui ciclu de ceas global la fiecare apăsare.

5. **Afișajul cu 7 segmente (`SSD_Driver`):**
   - Primește o valoare de 16 biți și o afișează multiplexat pe cele 4 cifre ale afișajului.
   - Pentru a afișa valoarea curentă a numărătorului direct în cod binar, valoarea pe 4 biți (`Data_out_counter`) este convertită (expandată) la o magistrală de 16 biți în modulul de top:
     `Binary_data_conv <= "000" & Data_out_counter(3) & "000" & Data_out_counter(2) & "000" & Data_out_counter(1) & "000" & Data_out_counter(0);`
     Această formatare determină fiecare dintre cele 4 digite ale afișajului cu 7 segmente să afișeze fie caracterul `0`, fie `1`, permițând vizualizarea directă a numărului în format binar.

---

### 2. Modulul Top-Level (`Top_Level`)

Modulul `Top_Level` interconectează toate aceste componente:
* Butonul de control al numărării (`BTN_Cont`) este trecut prin modulul `MPG` pentru a genera impulsuri curate de ceas (`BTN_Counter`) destinate blocului de numărare.
* Semnalul de selecție `SEL` controlează direct multiplexorul din `Cnt_Top`.
* Semnalul `RST` este utilizat pentru a reseta asincron ambele numărătoare.
* Ieșirea selectată de multiplexor (`Data_out_counter`) este direcționată direct pe cele 4 LED-uri (`Leds_out`) și trimisă expandată în binar către driverul afișajului cu 7 segmente (`Printer_7seg`).

---

## Schema Structurală a Circuitului

![Schema Bloc Up-Down Counter cu MUX](../images/ex8%20top%20level.drawio.png)

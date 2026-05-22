# Exercițiul 9: Unitate Aritmetico-Logică (ALU) pe 4 biți cu Memorie RAM 8x4

## Cerință (Requirement)
> **Requirement:** Implement an ALU which can do addition (without carries), bitwise AND, bitwise OR and logic shifting (to the right by two positions) on 4bit operands. The ALU has only one output which is connected to a 8x4bit RAM module. We can choose at any time to write in the RAM by enabling the WE pin (in combination with the selected address). We can read the RAM at any time.

---

## Descrierea Funcționării

Proiectul implementează interconectarea structurală a unei Unități Aritmetico-Logice (ALU) pe 4 biți cu o memorie RAM cu capacitatea de 8 locații de câte 4 biți fiecare ($8 \times 4$ biți). Rezultatul operației selectate de ALU este stocat în memorie la adresa specificată atunci când pinul de scriere (`WE`) este activat.

### 1. Componentele Sistemului

Sistemul este organizat ierarhic în VHDL folosind următoarele module componente:

1. **Unitatea Aritmetico-Logică (`ALU_4bits`):**
   - Execută operații logice și aritmetice pe operanzii de intrare pe 4 biți `A` și `B`.
   - Selecția operației se face pe baza intrării de control `Sel` (pe 2 biți), după cum urmează:
     - `Sel = "00"`: Adunare fără transport (addition without carries), implementată prin adunarea directă pe 4 biți: `A + B` (valoarea rezultată este trunchiată natural la 4 biți, ignorând bitul de carry-out).
     - `Sel = "01"`: ȘI pe biți (bitwise AND): `A AND B`.
     - `Sel = "10"`: SAU pe biți (bitwise OR): `A OR B`.
     - `Sel = "11"`: Deplasare logică la dreapta cu două poziții pentru operandul A: `"00" & A(3 downto 2)`.

2. **Memoria RAM 8x4 (`RAM`):**
   - Dispune de o intrare de adrese pe 3 biți (`Add`), permițând selectarea a 8 locații distincte.
   - Lungimea cuvântului de memorie este de 4 biți.
   - Are semnale de ceas (`CLK`), reset asincron (`RST`) și permisiune de scriere (`WE`).
   - **Scriere sincronă**: Când `WE = '1'`, datele de la intrarea `Data_in` sunt salvate în locația selectată pe frontul crescător al ceasului (`CLK`).
   - **Citire asincronă (continuă)**: Valoarea stocată la adresa selectată de `Add` este reflectată instantaneu pe portul de ieșire `Data_out`, independent de semnalul de ceas.

3. **Interconectarea structurală (`Alu_4bits_RAM`):**
   - Instanțiază componentele `ALU` și `RAM`.
   - Conectează ieșirea ALU (`Output_Alu`) la intrarea de date în RAM (`Data_in`), formând calea unică de date către memorie.

4. **Debouncer-ul (`MPG` - Mono-Pulse Generator):**
   - Asigură un impuls de ceas curat de un singur ciclu pe ceasul principal al plăcii la apăsarea butonului `CNT_BTN`, prevenind scrierile multiple în memorie din cauza zgomotului de contact.

5. **Modulul de Afișare cu 7 Segmente (`SSD_DRIVER`):**
   - Primește datele citite din RAM (`RAM_Data`) și le formatează pe o magistrală de 16 biți pentru a le trimite la afișaj.
   - Fiecare bit din ieșirea RAM este izolat și expandat:
     `Binary_Data_padded(3 downto 0) <= "000" & RAM_Data(0);`
     `Binary_Data_padded(7 downto 4) <= "000" & RAM_Data(1);`
     `Binary_Data_padded(11 downto 8) <= "000" & RAM_Data(2);`
     `Binary_Data_padded(15 downto 12) <= "000" & RAM_Data(3);`
     Această formatare permite citirea facilă, în format binar (cifrele `'0'` și `'1'`), a valorii stocate direct pe digiții afișajului.

---

### 2. Modulul Top-Level (`Top_Level`)

Modulul `Top_Level` reunește blocurile descrise:
* Operanzii `A`, `B`, codul operației `Sel` și adresa RAM `Add_in` sunt introduse folosind switch-urile plăcii.
* Butonul de scriere manuală (`CNT_BTN`) trece prin modulul `MPG` pentru a genera ceasul sincron al scrierii în RAM.
* Permisiunea de scriere (`We`) și resetul (`RST`) sunt controlate prin butoane/switch-uri dedicate.
* Datele citite în mod continuu din RAM sunt trimise simultan pe cele 4 LED-uri ale plăcii (`Leds_data_out`) și afișate sub formă binară pe digitii afișajului cu 7 segmente.

---

## Schema Structurală a Circuitului

![Schema Bloc ALU cu RAM](../images/ex9%20top%20level.drawio.png)

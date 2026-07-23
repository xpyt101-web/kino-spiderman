# 🕷️ Wyjazd na Spider-Mana

Strona dla znajomych: głosowanie na termin (1–20 sierpnia, 16:00–21:00) + rezerwacja miejsc w kinie.

## Jak to działa
- Każdy wchodzi na jeden link, wpisuje imię i nazwisko.
- **Terminy** – klika kratki: pusta → 🟢 mogę → 🔴 nie mogę → pusta.
- **Wyniki** – ranking najlepszych terminów (ilu może / nie może).
- **Miejsca** – klika wolne krzesło, żeby je zająć (podpisane imieniem). Kliknięcie swojego zwalnia je.

## Uruchomienie od ręki (test)
Otwórz `index.html` w przeglądarce. Działa w **trybie lokalnym** — dane siedzą tylko w Twojej
przeglądarce (dobre do sprawdzenia, jak wygląda; NIE współdzieli między osobami).

## Wdrożenie dla wszystkich (Supabase + Vercel)

### 1. Supabase (wspólna baza)
1. Załóż konto / projekt na https://supabase.com (na tym nowym mailu).
2. Wejdź w **SQL Editor → New query**, wklej całą zawartość `supabase.sql`, kliknij **Run**.
3. Wejdź w **Project Settings → API** i skopiuj:
   - **Project URL** (np. `https://abcxyz.supabase.co`)
   - **anon public** key (długi klucz)
4. Wklej te 2 wartości na górze `index.html` w sekcji KONFIGURACJA:
   ```js
   const SUPABASE_URL = "https://abcxyz.supabase.co";
   const SUPABASE_ANON_KEY = "eyJhbGciOi....";
   ```
   Zapisz plik. Status na stronie zmieni się na „☁️ połączono z bazą”.

### 2. Vercel (hosting linku)
- Najprościej: wejdź na https://vercel.com → **Add New → Project → Deploy** i przeciągnij folder,
  albo połącz repo z GitHuba. To zwykła strona statyczna (sam `index.html`), bez konfiguracji builda.
- Dostaniesz link typu `https://kino-spiderman.vercel.app` — rozsyłasz znajomym. Gotowe.

> Uwaga: klucz **anon** jest publiczny z założenia — to OK dla takiej zabawy między znajomymi.
> Dane może odczytać/zmienić każdy z linkiem (nikt postronny go nie zna).

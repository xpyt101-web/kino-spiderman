-- ============================================================
--  Kino Spider-Man — struktura bazy Supabase
--  Uruchom w Supabase → SQL Editor → New query → Run
-- ============================================================

-- 1) Dostępność (kto, kiedy może / nie może)
create table if not exists availability (
  person     text not null,
  slot       text not null,          -- "dzien-godzina", np. "8-18"
  status     text not null check (status in ('yes','no')),
  created_at timestamptz default now(),
  primary key (person, slot)
);

-- 2) Rezerwacje miejsc (jedno miejsce = jedna osoba)
create table if not exists seats (
  seat_id    text primary key,       -- "rzad-miejsce", np. "6-11"
  person     text not null,
  created_at timestamptz default now()
);

-- 3) RLS + polityki (publiczne narzędzie dla znajomych — pełny dostęp anon)
alter table availability enable row level security;
alter table seats        enable row level security;

drop policy if exists av_all on availability;
create policy av_all on availability
  for all to anon, authenticated using (true) with check (true);

drop policy if exists seats_all on seats;
create policy seats_all on seats
  for all to anon, authenticated using (true) with check (true);

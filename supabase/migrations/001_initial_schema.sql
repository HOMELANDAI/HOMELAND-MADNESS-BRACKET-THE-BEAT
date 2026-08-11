-- HomelandAI Madness: Bracket the Beat initial Supabase schema

create extension if not exists "uuid-ossp";

create table if not exists tournaments (
  id uuid primary key default uuid_generate_v4(),
  slug text unique not null,
  title text not null,
  theme text,
  status text not null default 'draft',
  starts_at timestamptz,
  ends_at timestamptz,
  created_at timestamptz default now()
);

create table if not exists regions (
  id uuid primary key default uuid_generate_v4(),
  tournament_id uuid references tournaments(id) on delete cascade,
  name text not null,
  display_order int default 0
);

create table if not exists entries (
  id uuid primary key default uuid_generate_v4(),
  tournament_id uuid references tournaments(id) on delete cascade,
  region_id uuid references regions(id) on delete set null,
  seed int not null,
  beat_title text not null,
  attached_song_title text not null,
  artist text not null,
  producer text not null,
  release_year int,
  source_url text,
  preview_url text,
  rights_status text default 'needs_review',
  verification_status text default 'pending',
  created_at timestamptz default now()
);

create table if not exists matchups (
  id uuid primary key default uuid_generate_v4(),
  tournament_id uuid references tournaments(id) on delete cascade,
  round_name text not null,
  left_entry_id uuid references entries(id),
  right_entry_id uuid references entries(id),
  winner_entry_id uuid references entries(id),
  status text not null default 'upcoming',
  opens_at timestamptz,
  closes_at timestamptz,
  created_at timestamptz default now()
);

create table if not exists votes (
  id uuid primary key default uuid_generate_v4(),
  matchup_id uuid references matchups(id) on delete cascade,
  entry_id uuid references entries(id),
  user_id uuid,
  ip_hash text,
  device_hash text,
  created_at timestamptz default now(),
  unique(matchup_id, user_id)
);

create table if not exists prediction_brackets (
  id uuid primary key default uuid_generate_v4(),
  tournament_id uuid references tournaments(id) on delete cascade,
  user_id uuid,
  picks jsonb not null default '{}'::jsonb,
  tiebreaker_total_votes int,
  locked_at timestamptz,
  score int default 0,
  created_at timestamptz default now()
);

create table if not exists listen_events (
  id uuid primary key default uuid_generate_v4(),
  tournament_id uuid references tournaments(id) on delete cascade,
  matchup_id uuid references matchups(id) on delete cascade,
  entry_id uuid references entries(id),
  user_id uuid,
  played_ms int default 0,
  completed_preview boolean default false,
  replay_count int default 0,
  mode text default 'visible',
  created_at timestamptz default now()
);

create table if not exists committees (
  id uuid primary key default uuid_generate_v4(),
  tournament_id uuid references tournaments(id) on delete cascade,
  region_id uuid references regions(id) on delete cascade,
  name text not null,
  buy_in_amount numeric(10,2) default 49.99,
  created_at timestamptz default now()
);

create table if not exists committee_scores (
  id uuid primary key default uuid_generate_v4(),
  committee_id uuid references committees(id) on delete cascade,
  base_points int default 0,
  upset_bonus int default 0,
  accuracy_bonus int default 0,
  fan_grade_multiplier numeric(4,2) default 1.00,
  final_score numeric(10,2) default 0,
  updated_at timestamptz default now()
);

create table if not exists legends (
  id uuid primary key default uuid_generate_v4(),
  display_name text not null,
  role text,
  bio text,
  created_at timestamptz default now()
);

create table if not exists legend_votes (
  id uuid primary key default uuid_generate_v4(),
  matchup_id uuid references matchups(id) on delete cascade,
  legend_id uuid references legends(id) on delete cascade,
  entry_id uuid references entries(id),
  locked_at timestamptz default now(),
  revealed_at timestamptz
);

create table if not exists badges (
  id uuid primary key default uuid_generate_v4(),
  slug text unique not null,
  name text not null,
  description text,
  category text
);

create table if not exists user_badges (
  id uuid primary key default uuid_generate_v4(),
  user_id uuid,
  badge_id uuid references badges(id) on delete cascade,
  tournament_id uuid references tournaments(id) on delete cascade,
  awarded_at timestamptz default now()
);

create table if not exists beat_upload_batches (
  id uuid primary key default uuid_generate_v4(),
  tournament_id uuid references tournaments(id) on delete cascade,
  uploaded_by uuid,
  status text default 'draft',
  source_file_name text,
  notes text,
  created_at timestamptz default now()
);

create table if not exists beat_modification_requests (
  id uuid primary key default uuid_generate_v4(),
  tournament_id uuid references tournaments(id) on delete cascade,
  entry_id uuid references entries(id) on delete set null,
  action text not null,
  requested_by uuid,
  payload jsonb not null default '{}'::jsonb,
  reason text,
  status text default 'pending',
  created_at timestamptz default now()
);

create table if not exists beat_verification_logs (
  id uuid primary key default uuid_generate_v4(),
  entry_id uuid references entries(id) on delete cascade,
  verified_by uuid,
  field_name text,
  old_value text,
  new_value text,
  source_url text,
  status text default 'pending',
  created_at timestamptz default now()
);

# Supabase Backend Architecture

HomelandAI Madness uses Supabase as the backend foundation.

## Supabase Services

- **Supabase Database:** tournaments, regions, entries, matchups, votes, predictions, listen events, committees, committee scores, legend votes, badges, NFTs, and events.
- **Supabase Auth:** fan accounts, committee accounts, admin roles, premium member roles, and staff roles.
- **Supabase Edge Functions:** submit votes, upload beat batches, verify beat metadata, advance rounds, record Legend Votes, calculate results, and trigger badges.
- **Supabase Realtime:** live vote windows, bracket updates, leaderboard refresh, Selection Sunday ticker, upset alerts, and Data Lab updates.
- **Supabase Storage:** images, clips, NPC assets, playlist visuals, bracket media, gateway cards, thumbnails, signage, and preview placeholders.

## Critical Tables

- tournaments
- regions
- entries
- matchups
- votes
- prediction_brackets
- listen_events
- blind_mode_votes
- committees
- committee_members
- committee_scores
- legends
- legend_votes
- badges
- user_badges
- nft_collectibles
- events
- beat_upload_batches
- beat_modification_requests
- beat_verification_logs

## Data Ownership

The app should avoid relying solely on Twitch, Instagram, or YouTube polls because those platforms do not give HomelandAI complete data ownership. The HomelandAI app/Supabase stack should own votes, bracket submissions, preview behavior, fan profiles, prediction accuracy, loyalty eligibility, and premium-member insights.

## Core Edge Functions

### submit-vote

Validates whether a matchup is live, prevents duplicate votes, stores the vote, and records listening analytics if available.

### advance-round

Counts votes, determines winners, flags upsets, advances bracket slots, updates leaderboards, and updates committee scores.

### legend-vote

Records a guest producer/artist/Legend pick before fan results reveal and later compares that pick against fan consensus.

### verify-beat-batch

Validates uploaded beat metadata, including producer name, attached song title, artist, release year, source URL, preview URL, and rights status.

## Admin Controls

Admins should be able to:

- Create tournaments
- Upload beat sets
- Modify one beat at a time
- Verify metadata
- Open and close voting windows
- Lock prediction brackets
- Record Legend Votes
- Advance rounds
- Trigger upset alerts
- Publish results
- Export data

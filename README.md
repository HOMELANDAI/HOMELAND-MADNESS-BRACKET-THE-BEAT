# HomelandAI Madness: Bracket the Beat

**By HAI / HomelandAI**

HomelandAI Madness: Bracket the Beat is a competitive music-voting tournament platform inspired by March Madness bracket pools, hip-hop debate culture, Selection Sunday reveals, live event voting, prediction contests, committee seeding, Legend Mode, Blind Preview Mode, mini-player previews, NPC commentary, and data-driven aftershows.

The product is designed to work as:

- An in-person event experience with private phone voting
- A remote gameplay platform with 10-30 second preview players
- A Twitch-friendly live show and clipping engine
- A Maestro.tv premium interactive experience
- A Supabase-backed app for voting, scoring, brackets, leaderboards, and data capture
- A recurring HomelandAI franchise built around music, culture, debate, and analytics

## Core Tagline

**Vote. Debate. Crown the Era.**

## Core User Promise

This is not only about choosing your favorite beat. It is about predicting what the culture will choose.

## Project Summary

HomelandAI Madness turns music debate into a competitive cultural sport. Beats or songs from a specific era, region, or theme are seeded into a tournament bracket. Fans fill out prediction brackets, vote privately by phone, listen to short previews, and compare their choices with the larger culture. Committees build and defend regions. Producers, DJs, or artists can cast live Legend Votes. Blind Preview Mode removes name bias. The Listen Effect captures how user behavior changes after hearing both previews.

## Core Systems

1. Tournament bracket engine
2. Phone voting and private ballot UX
3. Prediction brackets and leaderboard scoring
4. Selection Sunday reveal show
5. Regional committee selection and scoring
6. Legend Vote mode
7. Blind Preview mode
8. Mini-player preview system
9. Listen Effect data engine
10. Aftershow and premium data discussion content
11. NFT and badge layer
12. Supabase backend architecture
13. Beat upload and single beat modification patch
14. Twitch and Maestro.tv platform strategy

## MVP Features

- Tournament and bracket display
- Matchup voting
- Prediction bracket submission
- Leaderboard scoring
- Mini-player preview tracking
- Listen-to-Vote XP
- Committee scoring
- Legend Mode reveal
- Data Lab dashboard
- Maestro/Twitch presentation layers

## Supabase Backend

HomelandAI uses Supabase for backend development:

- Supabase Database for tournaments, entries, matchups, votes, predictions, committees, legend votes, badges, and analytics events
- Supabase Auth for fan accounts, committee accounts, admins, and premium roles
- Supabase Edge Functions for vote submission, beat upload validation, round advancement, and Legend Vote locking
- Supabase Realtime for live bracket updates, voting windows, leaderboards, Selection Sunday ticker, and upset alerts
- Supabase Storage for images, clips, NPC assets, playlist visuals, bracket media, and gateway cards

## Repository Structure

```txt
.
├── README.md
├── PROJECT_STRUCTURE.md
├── docs/
│   ├── project-summary.md
│   ├── game-design-document.md
│   ├── data-capture-and-listen-effect.md
│   ├── twitch-maestro-analysis.md
│   ├── committee-rules-scoring.md
│   ├── aftershow-bonus-content.md
│   ├── npc-personalities.md
│   ├── prize-structure.md
│   └── roadmap.md
├── prompts/
│   ├── google-studio-gemini-website-prompt.md
│   ├── figma-uiux-prompt.md
│   ├── signage-promo-prompts.md
│   └── nft-prompts.md
├── supabase/
│   ├── migrations/
│   ├── seed/
│   └── functions/
├── src/
│   ├── components/
│   ├── pages/
│   ├── lib/
│   ├── data/
│   └── styles/
├── templates/
├── admin/
└── beat-upload-patch/
```

## Platform Positioning

### Twitch

Twitch should be used for discovery, live chat energy, Selection Sunday reactions, upset moments, NPC commentary clips, and broad fan awareness.

### Maestro.tv

Maestro.tv should be used for premium interactive viewing, gated voting, data dashboards, committee rooms, aftershows, replayable insights, and sponsor-ready analytics.

### HomelandAI App

The HomelandAI app/Supabase layer should own the actual voting, identity, prediction brackets, leaderboard data, listening behavior, badges, loyalty eligibility, and premium content access.

## Legal and Licensing Note

The mini-player preview system is a proof-of-concept feature unless audio has been cleared, licensed, or embedded through approved platform APIs. Public commercial launch should use licensed previews, official embeds, platform APIs, or original/cleared audio.

## Existing ZIP Artifacts

This repository also includes downloadable ZIP archives generated earlier:

- `homelandai-madness-bracket-the-beat.zip`
- `homelandai-beat-upload-patch.zip`

Those files preserve full package snapshots. The expanded repo structure provides the readable GitHub version.

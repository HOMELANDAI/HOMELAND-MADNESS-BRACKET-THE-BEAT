export type TournamentStatus = 'draft' | 'selection_sunday' | 'open' | 'closed' | 'archived';
export type MatchupStatus = 'upcoming' | 'live' | 'closed' | 'revealed';
export type RegionName = 'East Coast' | 'West Coast' | 'South' | 'Midwest / International';

export interface TournamentEntry {
  id: string;
  tournamentId: string;
  region: RegionName | string;
  seed: number;
  beatTitle: string;
  attachedSongTitle: string;
  artist: string;
  producer: string;
  releaseYear: number;
  sourceUrl?: string;
  previewUrl?: string;
  rightsStatus: 'needs_review' | 'cleared' | 'platform_embed' | 'blocked';
  verificationStatus: 'pending' | 'verified' | 'disputed' | 'rejected';
}

export interface Matchup {
  id: string;
  tournamentId: string;
  roundName: string;
  leftEntryId: string;
  rightEntryId: string;
  winnerEntryId?: string;
  status: MatchupStatus;
  opensAt: string;
  closesAt: string;
}

export interface ListenEvent {
  userId: string;
  matchupId: string;
  entryId: string;
  playedMs: number;
  completedPreview: boolean;
  replayCount: number;
  mode: 'visible' | 'blind';
}

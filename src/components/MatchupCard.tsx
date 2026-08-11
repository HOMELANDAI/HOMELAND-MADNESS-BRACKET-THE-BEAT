import React from 'react';

type Entry = {
  seed: number;
  title: string;
  artist?: string;
  previewUrl?: string;
};

type MatchupCardProps = {
  left: Entry;
  right: Entry;
  status?: 'upcoming' | 'live' | 'closed';
  onVote?: (seed: number) => void;
};

export function MatchupCard({ left, right, status = 'upcoming', onVote }: MatchupCardProps) {
  return (
    <section className="matchup-card">
      <div className="matchup-status">{status.toUpperCase()}</div>
      {[left, right].map((entry) => (
        <article key={entry.seed} className="entry-card">
          <span className="seed">#{entry.seed}</span>
          <h3>{entry.title}</h3>
          <p>{entry.artist || 'Artist placeholder'}</p>
          {entry.previewUrl ? (
            <audio controls src={entry.previewUrl} />
          ) : (
            <button className="preview-placeholder">Preview Placeholder</button>
          )}
          <button disabled={status !== 'live'} onClick={() => onVote?.(entry.seed)}>
            Vote
          </button>
        </article>
      ))}
    </section>
  );
}

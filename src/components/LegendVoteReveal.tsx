import React from 'react';

type LegendVoteRevealProps = {
  legendName: string;
  legendPick: string;
  fanPick: string;
  fanPercent: number;
  opponentPercent: number;
};

export function LegendVoteReveal({ legendName, legendPick, fanPick, fanPercent, opponentPercent }: LegendVoteRevealProps) {
  const aligned = legendPick === fanPick;

  return (
    <section className="legend-reveal">
      <h2>Fan Consensus vs Legend's Vote</h2>
      <div className="reveal-grid">
        <div>
          <h3>Fan Consensus</h3>
          <p>{fanPick}</p>
          <progress value={fanPercent} max={100} />
          <p>{fanPercent}% vs {opponentPercent}%</p>
        </div>
        <div>
          <h3>{legendName}'s Pick</h3>
          <p>{legendPick}</p>
          <strong>{aligned ? 'Legend Agreed With The Culture' : 'Fans Overruled The Legend'}</strong>
        </div>
      </div>
    </section>
  );
}

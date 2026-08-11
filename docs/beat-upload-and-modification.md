# Beat Upload and Single Beat Modification Workflow

## Purpose

Each tournament needs a clean way to upload a full set of beats or songs, then modify individual entries without rebuilding the whole bracket manually.

This workflow supports:

- Full tournament beat set upload
- Single beat addition
- Single beat removal
- Single beat replacement
- Single beat metadata edit
- Re-verification of disputed metadata

## Required Beat Metadata

Each beat entry should include:

- tournament_slug
- region
- seed
- beat_title
- attached_song_title
- artist
- producer
- release_year
- source_url
- preview_url
- rights_status
- verification_status
- notes

## Verification Requirements

Before a beat can be published into a live tournament, admins should verify:

- Correct beat title
- Correct attached song title
- Correct artist name
- Correct producer credit
- Correct release year
- At least one source link
- Preview availability
- Rights status placeholder or clearance status

## Beat Upload Batch Statuses

- draft
- uploaded
- validation_failed
- pending_review
- verified
- published
- rejected

## Modification Types

### Add
Adds one new beat to a tournament or reserve list.

### Remove
Removes one beat from a tournament before bracket lock.

### Replace
Swaps one beat for another while preserving bracket structure.

### Edit Metadata
Corrects producer, song title, artist, year, region, seed, source, or preview fields.

### Reverify
Reopens a beat for verification when metadata is disputed.

## Admin Notes

Single beat modification should create an audit trail. HomelandAI should always know who changed a beat, when it changed, why it changed, and what data was corrected.

## Included Patch Artifact

This repository includes the previously generated `homelandai-beat-upload-patch.zip` and an expanded patch folder can be used as a standalone implementation module.

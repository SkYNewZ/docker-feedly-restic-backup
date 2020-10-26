# docker-feedly-restic-backup

![Deploy](https://github.com/SkYNewZ/docker-feedly-restic-backup/workflows/Build%20%26%20Push/badge.svg)

Docker image for:

- Fetch OPML [Feedly](https://feedly.com/) export
- Backup it using [Restic](https://restic.readthedocs.io/en/latest/)
- Monitor this task using https://healthchecks.io with [Runitor](https://github.com/bdd/runitor)

## Requirements

They are **my** requirements for **my** usage (written here as a reminder). Feel free to customize using the documentations of used tools, or by customizing the image !

- `GOOGLE_APPLICATION_CREDENTIALS` (used to access the bucket, this is a file path)
- `RESTIC_PASSWORD` (unlock the repository)
- `RESTIC_REPOSITORY` (name of the repository)
- `CHECK_UUID` (healthchecks.io UUID)
- `FEEDLY_ACCESS_TOKEN` (to access Feedly developer API)

## Start !

Simply run:

```shell
# Don't forget to set the required environments variables with `-e VAR=VALUE`
$ docker run -it --rm skynewz/feedly-backup:latest
```

## Documentation

- Check the [Restic documentation](https://restic.readthedocs.io/en/stable/) for more details about Restic
- Check the [Runitor repository](https://github.com/bdd/runitor) for more details about Runitor
- Using [SkYNewZ/feedly-opml-export](https://github.com/SkYNewZ/feedly-opml-export) to export Feedly OPML

All theses tools have been packaged into Docker images:

- [Restic](https://github.com/SkYNewZ/docker-restic)
- [Runitor](https://github.com/SkYNewZ/docker-runitor)
- [Feedly export](https://github.com/SkYNewZ/feedly-opml-export)

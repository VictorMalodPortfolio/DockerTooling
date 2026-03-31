## What does this PR do?

<!-- Describe the change and why it is needed. -->

## Type of change

- [ ] New tool / version bump
- [ ] CI / workflow change
- [ ] Bug fix
- [ ] Documentation

## Checklist

- [ ] Commit messages follow the conventional commits format
- [ ] The Trivy scan passes (or new CVEs are added to `.trivyignore.yaml` with a justification)

### If `.trivyignore.yaml` was touched

- [ ] Checked that all existing entries are still needed — run the Trivy scan without the ignore file and remove any CVE that no longer appears in the results


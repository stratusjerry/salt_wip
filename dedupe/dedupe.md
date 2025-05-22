Attempts to dedupe common files in a container layer

- download several vscode ssh-server files [./download_vscode_server.py](./download_vscode_server.py)
- extract locally [./output/extract.sh](./output/extract.sh)

Jump into a container with `output/` mounted in and:
- install dedupe
- scan to see potential storage savings

Test base Image layer
- copy to container image
- check image space

Test deduped base Image layer
- copy to container image
- run dedupe
- check image space

### Notes
RockLinux uses VScode ssh-server path like:
`/root/.vscode-server/bin/848b80aeb52026648a8ff9f7c45a9b0a80641e2e/`

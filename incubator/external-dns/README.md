This is a modified version of this chart:
https://artifacthub.io/packages/helm/external-dns/external-dns
So LICENCE applies from that repo.

We've had to add a Role and RoleBinding instead of ClusterRole/ClusterRoleBinding for locked down clusters where we can
install external-dns and let it operate only on a single namespace.

NOTE: This should probably be upstreamed as a PR.

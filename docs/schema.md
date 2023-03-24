# Open Policy Agent Input Document JSON Format
This section describes the JSON format for the OPA input document. This data document can contain a lot of information and therefore we are simplifying the representation to make it easier to understand.

The following is a pseudo representation of the OPA input document format:

```
input
├── plan
│   ├── format_version (string)
│   ├── terraform_version (string)
│   ├── variables (map of keys)
│   ├── planned_values (map of keys)
│   ├── resource_changes (map of keys)
│   ├── prior_state (map of keys)
│   └── configuration (map of keys)
└── run
    ├── id (string)
    ├── created_at (string)
    ├── message (string)
    ├── commit_sha (string)
    ├── is_destroy (boolean)
    ├── refresh (boolean)
    ├── refresh_only (boolean)
    ├── replace_addrs (array of strings)
    ├── speculative (boolean)
    ├── target_addrs (array of strings)
    ├── variables (map of keys)
    ├── organization
    │   └── name (string)
    └── workspace
        ├── id (string)
        ├── name (string)
        ├── created_at (string)
        ├── description (string)
        ├── auto_apply (bool)
        ├── tags (array of strings)
        ├── working_directory (string)
        └── vcs_repo (map of keys)
```
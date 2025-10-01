# DarkDeeds.CodingStandards

Shared coding standards for gerrkoff .NET projects.

## What's Included

- **Build Properties** (`Directory.Build.props`)
  - Target Framework: .NET 8.0
  - Nullable reference types enabled
  - Implicit usings enabled
  - Latest analysis level
  - Code style enforcement in build
  - XML documentation generation

- **Code Style Rules** (`.editorconfig`)
  - Formatting rules (indentation, spacing, line endings)
  - C# style preferences (var usage, file-scoped namespaces, etc.)
  - Analyzer diagnostic configuration
  - StyleCop rules customization

- **Analyzers**
  - StyleCop.Analyzers (included as a dependency)

## Installation

Install the NuGet package in your project:

```bash
dotnet add package DarkDeeds.CodingStandards
```

Or add it to your `.csproj` file:

```xml
<ItemGroup>
  <PackageReference Include="DarkDeeds.CodingStandards" Version="0.1.0" />
</ItemGroup>
```

## How It Works

When you install this package:

1. **Build properties** from `Directory.Build.props` are automatically applied to your project
2. **EditorConfig rules** are registered with Roslyn analyzers
3. **StyleCop.Analyzers** is added as a transitive dependency

All settings are applied transparently via MSBuild integration - no manual configuration needed!

## Usage

After installation, simply build your project:

```bash
dotnet build
```

You'll see:
- ✅ Code style warnings for violations
- ✅ StyleCop rules enforced
- ✅ Consistent formatting across projects

## Customization

To override specific rules, create a local `.editorconfig` file in your project root. Local settings take precedence over package settings.

Example:

```editorconfig
# .editorconfig in your project
root = true

[*.cs]
# Override specific rule
dotnet_diagnostic.SA1101.severity = warning
```

## Updating

To update to a newer version:

```bash
dotnet add package DarkDeeds.CodingStandards --version <new-version>
```

## Development

This package is designed to be moved to a separate repository in the future for centralized management across multiple DarkDeeds repositories.

## License

MIT

# Linter

## What’s Linting?
Linter/Lint is a tool that analyzes source code to flag programming errors, bugs, stylistic errors, and suspicious constructs. It supports verifying code quality.

## Some Common and Uncommon errors.
To get a much more visual have noticed some lines get underlined in your code like Unused variables or unused imports.
The underlined import in green shows that the file has been imported but has not been used. It’s appropriate to always use the imported files or remove them if they ain't necessary.

## How do we set up lint rules in Dart?
It’s usually advisable to set up lint rules at the beginning of a project rather than after starting a project since the warnings to be fixed might pile up.

There is usually a set of default linting configuration after setting a project in an IDE, however, you can customize your own set of rules to your specification to have a well-formatted code.

Rules are categorized into these major groups:
````
1.Error rules
2.Style rules
3.Pub
````

### There are two ways of enabling lint rules in Dart:

#### 1.Enabling default Google rules: pedantic

To use the lints add a dependency in your pubspec.yaml:
````
# If you use `package:pedantic/pedantic.dart`, add a normal dependency.
dependencies:
  pedantic: ^1.8.0

# Or, if you just want `analysis_options.yaml`, it can be a dev dependency.
dev_dependencies:
  pedantic: ^1.8.0
````
**Run the command flutter packages get in your terminal to update the dependencies, then update your analysis_options.yaml file.**

#### 2. Enabling individual rules.
These are rules that an individual sets on their own according to their own specifications without using the pedantic package that comes with already set rules. When enabling individual linter rules, add linter: to the analysis-options file, followed by rules:


***Note:*** Before setting individual rules from the Dart linter style guides, always read and understand the rule and check how it works.



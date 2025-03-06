# Contributing to Google Maps SDK for Flutter Sample Code

_See also: [Flutter's code of conduct](https://flutter.io/design-principles/#code-of-conduct)_

## 1. Essential Setup for Contributors

- **Operating System:** Linux, macOS, or Windows.
- **Version Control:** [git](https://git-scm.com).
- **Development Environment:** An IDE such as [Android Studio](https://developer.android.com/studio) or [Visual Studio Code](https://code.visualstudio.com/).

## 2. Setting Up Your Local Repository

- **Preparation:** Before starting, make sure you have all dependencies installed as mentioned in the prior section.
- **Fork the Repository:** Navigate to `https://github.com/googlemaps-samples/flutter-maps-samples` and create a fork in your GitHub account.
- **SSH Key Configuration:** If your machine doesn't have an SSH key registered with GitHub, generate one following the instructions at [Generating SSH Keys on GitHub](https://help.github.com/articles/generating-ssh-keys/).
- **Clone Your Fork:** Use the command `git clone git@github.com:<your_name_here>/flutter-maps-samples.git` to clone the repository to your local machine.
- **Add remote upstream:** Establish a link to the main repository for updates using command `git remote add upstream git@github.com:googlemaps-samples/flutter-maps-samples.git` This ensures you pull changes from the original source, not just your clone, when using git fetch and similar commands.

## 3. Install Melos

This project leverages [Melos](https://github.com/invertase/melos) to manage the project and its dependencies.

Run the following command to install Melos:

```bash
dart pub global activate melos
```

## 4. Running the Sample

First, you have to provide your own Google Maps API key in the appropriate files. See `README.md` for more. 

After that, simply run the app:

```bash
flutter run
```

## 5. Running tests

The sample doesn't really have business logic to test, but we do have a smoke test in `test/smoke_test.dart`. 

This test runs the app widget and visits every single demo sub-page. While this is far from a rigorous testing strategy, it does make it harder for runtime errors to slip by.

You can run the test in headless mode:

```bash
melos run test 
```

Alternatively, you can run the smoke test on an actual device or an emulator.

```bash
flutter run -d "your device" test/smoke_test.dart 
```

This has the benefit of acting as a sort of integration test because on physical devices and emulators, the app will use method channels and platform views to actually show the UI in full. 

## 6. Contributing code

We welcome contributions through GitHub pull requests.

Before working on any significant changes, please review the [Flutter style guide](https://github.com/flutter/flutter/blob/master/docs/contributing/Style-guide-for-Flutter-repo.md). These guidelines help maintain code consistency and avoid common pitfalls.

To begin working on a patch, follow these steps:

1. Fetch the latest changes from the upstream repository:
   ```bash
   git fetch upstream
   ```

2. Create a new branch based on the latest upstream master branch:
   ```bash
   git checkout upstream/master -b <name_of_your_branch>
   ```

3. Start coding!

Before committing your changes, it's important to ensure that your code passes the internal analyzer and formatting checks. You can run the following commands locally to identify any issues:

- Run the analyzer check:
  ```bash
  melos run flutter-analyze
  ```

- Format your code:
  ```bash
  melos run format
  ```

Assuming all is successful, commit and push your code using the following commands:

1. Stage your changes:
   ```bash
   git add .
   ```

2. Commit your changes with an informative commit message:
   ```bash
   git commit -m "<your informative commit message>"
   ```

3. Push your changes to the remote repository:
   ```bash
   git push origin <name_of_your_branch>
   ```

To send us a pull request:

- `git pull-request` (if you are using [Hub](http://github.com/github/hub/)) or
  go to `https://github.com/googlemaps-samples/flutter-maps-samples` and click the
  "Compare & pull request" button

Please ensure that all your commits have detailed commit messages explaining the changes made.

When naming the title of your pull request, please follow the [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0-beta.4/)
guide. For example, for a fix to a bug in the sample:

`fix: Fixed a bug!`

Automated tests will be run on your contributions using GitHub Actions. Depending on
your code changes, various tests will be performed automatically.

Once you have received an LGTM (Looks Good To Me) from a project maintainer and once your pull request has passed all automated tests, please wait for one of the package maintainers to merge your changes.

Before contributing, please ensure that you have completed the
[Contributor License Agreement](https://cla.developers.google.com/clas).
This can be done online and only takes a few moments.
If you are submitting code for the first time, please add your (or your
organization's) name and contact information to the [AUTHORS](AUTHORS) file.

This project uses Google's `addlicense` [here](https://github.com/google/addlicense) tool to add the license header to all necessary files. Running `addlicense` is a required step before committing any new files.

To install `addlicense`, run:

```bash
go install github.com/google/addlicense@latest
```

Make sure to include `$HOME/go/bin` in your `PATH` environment variable.
If you are using Bash on Linux or macOS, add `export PATH="$HOME/go/bin:$PATH"` to your `.bash_profile`.

To add the license header to all files, run the following command from the root of the repository:

```bash
melos run add-license-header
```

This command uses `addlicense` with all necessary flags.

To check the license header of all files, run from the root of the repository:
```bash
melos run check-license-header
```

## 7. Contributing documentation

We welcome contributions to the plugin documentation. The documentation for this project is generated using Dart Docs. All documentation for the app-facing API is described in Dart files.

Please refer to the "Contributing code" section above for instructions on how to prepare and submit a pull request to the repository.

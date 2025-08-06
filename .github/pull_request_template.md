### Merge exam feature (subject + question + exam modules) into development

## What type of PR is this? (check all applicable)

- [x] Feature

## Description

This PR merges the `exam` branch into `development`.

### Features included in this PR:
- Added **Subject** feature: CRUD operations and integration.
- Added **Question** feature: managing questions per subject/exam.
- Added **Exam** feature: exam creation, assignment, and validation logic.

## Related Tickets & Documents

- Closes #[Put related issue numbers if available]

## QA Instructions, Screenshots, Recordings

- Navigate to the "Subjects" page to test subject management.
- Navigate to the "Questions" section under each subject to manage questions.
- Go to "Exams" to test exam creation and linkage to subjects/questions.

Tested on:
- [x] Chrome
- [ ] Firefox
- [ ] Safari
- [ ] Edge

### UI accessibility checklist
- [x] Semantic HTML implemented
- [x] Keyboard operability supported
- [ ] Checked with axe DevTools
- [ ] Color contrast tested

## Added/updated tests?

- [ ] Yes
- [x] No, and this is why: tests not yet included, will be added in a separate PR
- [ ] I need help with writing tests

## [optional] Are there any post deployment tasks we need to perform?

- Run database migration if applicable

## [optional] What gif best describes this PR or how it makes you feel?



## What type of PR is this? (check all applicable)

- [ ] Refactor
- [x] Feature
- [ ] Bug Fix
- [ ] Optimization
- [ ] Documentation Update

## Description

✅ Added **Signup** feature:

- Built the Signup screen UI using Flutter widgets.
- Integrated Signup API using Retrofit & Dio.
- Followed Clean Architecture: separated logic into `data`, `domain`, and `presentation` layers.
- Used Cubit for managing signup state and handling success/error scenarios.
- Saved authentication token securely using SharedPreferences after successful registration.

## Related Tickets & Documents

<!-- Add related issue IDs if available -->
<!-- Example: Closes #45 -->

## QA Instructions, Screenshots, Recordings

To test this feature:

1. Go to the Signup screen.
2. Fill in name, email, and password:
   - Try valid data → expect success and navigation.
   - Try invalid data → expect proper validation messages.
3. After successful signup:
   - Confirm token is saved correctly in SharedPreferences.
   - (Optional) Test token usage in future requests.

**Screenshot:**
![Signup UI](https://github.com/user-attachments/assets/4369f8ab-c1de-413f-9758-d053eb1b02aa)


### UI accessibility checklist

- [x] Used semantic Flutter widgets (TextField, ElevatedButton, etc.)
- [x] Form fields validated and keyboard accessible
- [x] Checked contrast and error states manually

## Added/updated tests?

- [ ] Yes
- [x] No, _(will be added later / not in current scope)_

## [optional] Are there any post deployment tasks we need to perform?

- None. The token is automatically stored via SharedPreferences on successful signup.

## [optional] What gif best describes this PR or how it makes you feel?

![All set!](https://media.giphy.com/media/111ebonMs90YLu/giphy.gif)

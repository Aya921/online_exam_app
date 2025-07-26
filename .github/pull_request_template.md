### ✅ Pull Request: Merge `auth` → `development`

## What type of PR is this?

- [x] Feature
- [ ] Bug Fix
- [ ] Refactor
- [ ] Optimization
- [ ] Documentation Update

---

## Description

This PR introduces the full authentication module, including:

- **Login Screen**
- **Signup Screen**
- **Forgot Password Flow** (Send email → Verify code → Reset password)

The authentication flow follows the **BLoC pattern** and **Clean Architecture** structure, and is fully integrated with the API. Form validations are handled locally in each screen with proper error handling.

---

## Related Tickets & Documents

- Closes #[your issue number if exists]
- Part of the Authentication Module Implementation

---

## QA Instructions

1. Open the app.
2. Navigate to Login screen.
   - Test with valid and invalid credentials.
3. Click "Don't have an account?" → test the Signup form.
   - Try with existing and new emails.
4. Click "Forgot Password?" and follow the steps:
   - Enter valid/invalid email.
   - Verify with correct/incorrect code.
   - Reset with matching passwords.

### ✅ Expected Behavior

- All forms should validate input and show errors.
- Success/error messages should be clearly displayed.
- Navigation between screens should work smoothly.

---

## Screenshots



---

## Testing

- [ ] Manual QA done
- [ ] Unit tests (if added)
- [ ] Need help writing tests

---

## Deployment Notes

- No breaking changes
- Can be merged safely to `development`

---



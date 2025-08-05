### ✅ Pull Request

## What type of PR is this?

- [x] Feature  
- [ ] Bug Fix  
- [ ] Refactor  
- [ ] Optimization  
- [ ] Documentation Update  

---

## Description

This PR adds the full **Exam Module**, including:

- Fetching questions from API  
- Rendering different question types  
- Tracking user answers and progress  
- Timer per exam  
- Displaying results and feedback  

The exam flow follows **Clean Architecture** and uses the **BLoC pattern** for state management.  
All interactions with the API are handled via repository and data sources.

---

## Related Tickets & Documents

- Closes #[your issue number if applicable]  
- Part of the Exam Module Implementation  

---

## QA Instructions

1. Launch the app.  
2. Navigate to an exam.  
3. Answer various questions (multiple choice, checkbox, etc).  
4. Test timer and auto-submit behavior.  
5. Verify result screen and any error handling.

---

## Screenshots

_N/A_

---

## Testing

- [] Manual QA done  
- [ ] Unit tests (if added)  
- [ ] Need help writing tests  

---

## Deployment Notes

- No breaking changes  
- Safe to merge to `Exam`

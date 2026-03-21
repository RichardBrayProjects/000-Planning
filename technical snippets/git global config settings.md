# Primary  git settings

```
git config --global user.name "oxford-developer-tutorials"
git config --global user.email "user@example.com"
```

Here's a complete checklist to fix the Windows long path issue:

## Step 1: Verify Long Paths is Enabled

Run these commands in Git Bash (no admin needed):

```bash
git config --global core.longpaths true
git config --global core.longpaths
```

The second command should return `true`. If not, try again.

## Step 2: Enable Windows Long Path Support

**Option A: Via PowerShell (Admin required)**
1. Press `Win + X`
2. Select **"Terminal (Admin)"** or **"PowerShell (Admin)"**
3. Run:
   ```powershell
   New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem" -Name "LongPathsEnabled" -Value 1 -PropertyType DWORD -Force
   ```
4. Restart your computer

**Option B: Via Registry Editor**
1. Press `Win + R`, type `regedit`, press Enter
2. Navigate to: `HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem`
3. Find or create `LongPathsEnabled` (DWORD)
4. Set value to `1`
5. Restart your computer

## Step 3: Verify Windows Long Path is Enabled

In PowerShell, run:
```powershell
Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem" -Name "LongPathsEnabled"
```

Should show `LongPathsEnabled : 1`

## Step 4: Clean and Reclone

```bash
cd C:\Users\odt\github\odt-planner
rm -rf 000-Course-Planning
git clone <your-repo-url>
```

## Step 5: If Still Failing - Clone to Shorter Path

```bash
cd C:\
mkdir git
cd git
git clone <your-repo-url>
```

This reduces the base path from `C:\Users\odt\github\odt-planner\` (35 chars) to `C:\git\` (6 chars).

## Step 6: Last Resort - Fix the Repository Structure

If nothing works, you'll need to rename those extremely long folder paths on your Mac:

Shorten this:
```
Generic Resources/chatgpt-generated docs/tutorial - React/02 react tutorial project - generates repo 106 cursor-react-tutorial-simplified-version/
```

To something like:
```
Generic Resources/chatgpt-docs/react-tutorial/lesson-11/
```

---

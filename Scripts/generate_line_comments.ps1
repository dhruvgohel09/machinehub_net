param(
	[string]$Root = "."
)

$exclude = @('.git', '.vs', 'bin', 'obj')
$extensions = @{
	'.cs'     = '//'
	'.js'     = '//'
	'.ts'     = '//'
	'.json'   = '//'
	'.css'    = '/*'
	'.html'   = '<!--'
	'.htm'    = '<!--'
	'.xaml'   = '<!--'
	'.cshtml' = '@*'
	'.config' = '<!--'
	'.xml'    = '<!--'
	'.sql'    = '--'
	'.ps1'    = '#'
}

function Is-ExcludedPath($fullPath) {
	foreach ($ex in $exclude) {
		if ($fullPath -like "*\$ex\*") { return $true }
	}
	return $false
}

$rootFull = (Get-Item -Path $Root).FullName.TrimEnd("\")
$files = Get-ChildItem -Path $Root -Recurse -File | Where-Object {
	$ext = $_.Extension.ToLower()
	if (-not $extensions.ContainsKey($ext)) { return $false }
	if (Is-ExcludedPath($_.FullName)) { return $false }
	return $true
}

$processed = 0
foreach ($f in $files) {
	try {
		$rel = $f.FullName.Substring($rootFull.Length).TrimStart('\')
		$destPath = Join-Path $rootFull "line_comments\$rel"
		$destDir = Split-Path $destPath -Parent
		if (-not (Test-Path $destDir)) { New-Item -ItemType Directory -Path $destDir -Force | Out-Null }

		$ext = $f.Extension.ToLower()
		$marker = $extensions[$ext]
		switch ($marker) {
			'//' { $prefix = '// '; $suffix = '' }
			'#'  { $prefix = '# ';  $suffix = '' }
			'--' { $prefix = '-- '; $suffix = '' }
			'/*' { $prefix = '/* '; $suffix = ' */' }
			'<!--' { $prefix = '<!-- '; $suffix = ' -->' }
			'@*' { $prefix = '@* '; $suffix = ' *@' }
			default { $prefix = '// '; $suffix = '' }
		}

		$lines = Get-Content -LiteralPath $f.FullName -ErrorAction Stop
		$outLines = @()
		foreach ($line in $lines) {
			if ($suffix -ne '') {
				$outLines += "${prefix}${line}${suffix}"
			} else {
				$outLines += "${prefix}${line}"
			}
		}

		$outLines | Set-Content -LiteralPath $destPath -Encoding utf8
		$processed++
	} catch {
		Write-Host "Failed processing $($f.FullName): $($_.Exception.Message)" -ForegroundColor Yellow
	}
}

Write-Host "Processed $processed files. Output written under: $rootFull\line_comments" -ForegroundColor Green

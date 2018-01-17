param (
    [string]$DbPath
)

$processedDbPath = $DbPath.Replace('\', '/')
cat .\snapshot-report.sql | sqlite3 $processedDbPath 
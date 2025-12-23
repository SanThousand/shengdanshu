$baseUrl = "https://cdn.jsdelivr.net/npm/@mediapipe/hands/"
$targetDir = "d:\my_project\web_project\shengdan\libs\mediapipe\hands"

# Ensure target directory exists
if (-not (Test-Path -Path $targetDir)) {
    New-Item -ItemType Directory -Path $targetDir -Force
}

$files = @(
    "hands.js",
    "hands_solution_packed_assets_loader.js",
    "hands_solution_simd_wasm_bin.js",
    "hands_solution_simd_wasm_bin.wasm",
    "hands_solution_wasm_bin.js",
    "hands_solution_wasm_bin.wasm",
    "hands_solution_packed_assets.data",
    "hands.binarypb",
    "hand_landmark_full.tflite"
)

foreach ($file in $files) {
    $url = $baseUrl + $file
    $outputPath = Join-Path -Path $targetDir -ChildPath $file
    Write-Host "Downloading $file..."
    try {
        Invoke-WebRequest -Uri $url -OutFile $outputPath
        Write-Host "Successfully downloaded $file"
    } catch {
        Write-Error "Failed to download $file : $_"
    }
}

Write-Host "Download complete."

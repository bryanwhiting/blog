<%*
// Get all files in the vault
let allFiles = app.vault.getFiles();

// File extensions you want to include
let includedExtensions = ['md', 'jpg', 'png', 'jpeg']; // Add or remove extensions as needed

// Directories you want to exclude
let excludedDirectories = ['renv/', 'docs/', '_templates/']; // Replace with your directory names

// Filter files to meet ex/inclusions
let filteredFiles = allFiles.filter(file => 
    includedExtensions.includes(file.extension) && 
    !excludedDirectories.some(dir => file.path.includes(dir))
);

// Sort filtered files by modified date in descending order 
filteredFiles.sort((a, b) => b.stat.mtime - a.stat.mtime);

// Create a list of full file paths for the suggester
let fileFullPaths = filteredFiles.map(file => file.path);

// Use the suggester to select a file
let selectedFile = await tp.system.suggester(fileFullPaths, filteredFiles);


if (selectedFile) {

    // Extract title from file's YAML frontmatter or use file basename
    let frontMatter = app.metadataCache.getFileCache(selectedFile)?.frontmatter;
    let fileTitle = frontMatter?.title || selectedFile.basename;

    // Generate markdown path to the current file
    let fullMarkdownLink = app.fileManager.generateMarkdownLink(selectedFile, app.workspace.getActiveFile().path);
    
    // Use a regular expression to extract the relative path
    let relPathMatch = fullMarkdownLink.match(/\]\((.*?)\)/);
    let relPath = relPathMatch ? relPathMatch[1] : null;

    // Determine if the file is an image and insert appropriate markdown
    if (['jpg', 'png', 'jpeg'].includes(selectedFile.extension)) {
        let caption = await tp.system.prompt("Enter caption for the image:");
        tp.file.cursor_append(`![${caption}](${relPath}){.preview-image}`);
    } else {
    tp.file.cursor_append(`[${fileTitle}](${relPath})`);
    }
}
%>
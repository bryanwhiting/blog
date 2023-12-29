<%*
// Process selected file
let files = app.vault.g;
let fileNames = files.map(file => file.basename);
let selectedFile = await tp.system.suggester(fileNames, files);

if (selectedFile) {
    // Extract title from file's YAML frontmatter or use file basename
    let frontMatter = app.metadataCache.getFileCache(selectedFile)?.frontmatter;
    let fileTitle = frontMatter?.title || selectedFile.basename;

    // Generate relative path
    let fullMarkdownLink = app.fileManager.generateMarkdownLink(selectedFile, app.workspace.getActiveFile().path);
    // Use a regular expression to extract the relative path
    let relPathMatch = fullMarkdownLink.match(/\]\((.*?)\)/);
    
    let relPath = relPathMatch ? relPathMatch[1] : null;

    // Determine if the file is an image and insert appropriate markdown
    if (['jpg', 'png', 'jpeg'].includes(selectedFile.extension)) {
        let caption = await tp.system.prompt("Enter caption for the image:");
        tp.file.cursor_append(`![${caption}](${relPath}){.preview-image`);
    } else {
    tp.file.cursor_append(`[${fileTitle}](${relPath})`);
    }
}
%>


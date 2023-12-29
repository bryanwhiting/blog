<%*
// Function to extract title from file's YAML frontmatter
async function extractTitle(file) {
    let fileContent = await app.vault.read(file);
    let frontMatter = app.metadataCache.getFileCache(file)?.frontmatter;
    return frontMatter?.title || file.basename;
}

// Function to handle file selection and insert markdown
async function handleFileSelection(file) {
    let title = await extractTitle(file);
    let relPath = app.fileManager.generateMarkdownLink(file, app.workspace.getActiveFile().path);

    if (file.extension === 'jpg' || file.extension === 'png' || file.extension === 'jpeg') {
        let caption = await tp.system.prompt("Enter caption for the image:");
        return `![${caption}](${relPath})`;
    } else {
        return `[${title}](${relPath})`;
    }
}

// Main function to search and process files
async function main() {
    let files = app.vault.getMarkdownFiles();
    let fileNames = files.map(file => file.basename);

    let selectedFile = await tp.system.suggester(fileNames, files);
    if (selectedFile) {
        return await handleFileSelection(selectedFile);
    }
    return "";
}

tp.editor.insertText(await main());
%>
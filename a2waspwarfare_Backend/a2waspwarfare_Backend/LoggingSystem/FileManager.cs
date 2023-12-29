using System;
using System.IO;
using System.Collections.Generic;
using System.Text;

public static class FileManager
{
    public static void AppendText(string _pathToFileAndFileExtension, string _content)
    {
        try
        {
            using (Stream stream = File.Open(_pathToFileAndFileExtension,
                FileMode.Append, FileAccess.Write, FileShare.Write))
            {
                using (StreamWriter sw = new StreamWriter(stream))
                {
                    sw.WriteLine(_content);
                    sw.Close();
                }
                stream.Close();
            }
        }
        catch (Exception _ex)
        {
            Log.WriteLine(_ex.Message, LogLevel.CRITICAL);
            throw new InvalidOperationException(_ex.Message);
        }
    }

    public async static void CheckIfFileAndPathExistsAndCreateItIfNecessary(
        string _filePath, string _fileName, System.IO.Stream _optionalFileContent = null)
    {
        try 
        {
            string _filePathWithFileName = _filePath + @"\" + _fileName;

            Log.WriteLine("Starting to create: " + _filePathWithFileName);
            if (!Directory.Exists(_filePath))
            {
                Directory.CreateDirectory(_filePath);
                Log.WriteLine("Done creating: " + _filePath);
            }
            else
            {
                Log.WriteLine("Already exists, did not create : " + _filePath);
            }

            Log.WriteLine("Starting to create: " + _filePathWithFileName);
            if (!File.Exists(_filePathWithFileName))
            {
                using (var fileStream = new FileStream(_filePathWithFileName, FileMode.CreateNew))
                {
                    if (_optionalFileContent != null)
                    {
                        Log.WriteLine("File has content, setting stream");
                        await _optionalFileContent.CopyToAsync(fileStream);
                    }

                    fileStream.Dispose();
                    Log.WriteLine("Done creating: " + _filePathWithFileName);
                }
            }
            else if (File.Exists(_filePathWithFileName) && File.ReadAllText(_filePathWithFileName) == "0")
            {
                using (var fileStream = new FileStream(_filePathWithFileName, FileMode.Truncate))
                {
                    if (_optionalFileContent != null)
                    {
                        Log.WriteLine("File has content, setting stream");
                        await _optionalFileContent.CopyToAsync(fileStream);
                    }

                    fileStream.Dispose();
                    Log.WriteLine("Already exists, truncated: " + _filePathWithFileName);
                }
            }
        }
        catch (Exception _ex)
        {
            Log.WriteLine(_ex.Message, LogLevel.CRITICAL);
            throw new InvalidOperationException(_ex.Message);
        }
    }

    public static string FindStringsInFile(
        List<string> _searchStrings, string _targetPath, string _startReplaceFrom, string _endReplaceTo)
    {
        Log.WriteLine("Starting to find strings in file", LogLevel.VERBOSE);

        // Read the existing content from the file
        string fileContent = System.IO.File.ReadAllText(_targetPath);

        // Find the markers for insertion
        int startIndex = fileContent.IndexOf(_startReplaceFrom);
        int endIndex = fileContent.IndexOf(_endReplaceTo);

        StringBuilder foundStrings = new StringBuilder();

        // Search for the strings between the markers
        if (startIndex >= 0 && endIndex >= 0 && startIndex < endIndex)
        {
            string contentBetweenMarkers = fileContent.Substring(
                startIndex + _startReplaceFrom.Length, endIndex - startIndex - _startReplaceFrom.Length);

            foreach (string searchString in _searchStrings)
            {
                if (contentBetweenMarkers.Contains(searchString))
                {
                    foundStrings.AppendLine(searchString);
                }
            }
        }
        else
        {
            // Error handling: Marker not found or invalid
            Log.WriteLine("not found: " + _startReplaceFrom + " | " +
            _endReplaceTo + " on " + _targetPath, LogLevel.ERROR);
        }

        return foundStrings.ToString();
    }

    // Taken from the code of LoadoutManager.cs
    public static void InsertGeneratedCodeInToAFile(
        string _generatedCode, string _targetPath, string _startReplaceFrom, string _endReplaceTo)
    {
        Log.WriteLine("Inserting generated code into file", LogLevel.VERBOSE);

        // Read the existing content from the file
        string fileContent = System.IO.File.ReadAllText(_targetPath);

        // Find the markers for insertion
        int startIndex = fileContent.IndexOf(_startReplaceFrom);
        int endIndex = fileContent.IndexOf(_endReplaceTo);

        // Insert the generated code between the markers
        if (startIndex >= 0 && endIndex >= 0 && startIndex < endIndex)
        {
            string before = fileContent.Substring(0, startIndex + _startReplaceFrom.Length);
            string after = fileContent.Substring(endIndex);

            string newContent = before + _generatedCode + after;

            // Replace the old content with the new content
            System.IO.File.WriteAllText(_targetPath, newContent);
        }
        else
        {
            // Error handling: Marker not found or invalid
            Log.WriteLine("not found: " + _startReplaceFrom + " | " +
             _endReplaceTo + " on " + _targetPath, LogLevel.ERROR);
        }
    }

    // Orchestrates the process of copying files and directories from the source to the destination.
    // Ensures the destination directory exists, copies the files, and cleans up any extra files and directories.
    public static void CopyFilesFromSourceToDestination(string _source, string _destination, TerrainModStatus _terrainModStatus)
    {
        bool _isModdedTerrainBool = _terrainModStatus == TerrainModStatus.MODDED;

        EnsureDirectoryExists(_destination);
        CopyFiles(_source, _destination, _isModdedTerrainBool);
        RecursivelyCopySubdirectories(_source, _destination, _isModdedTerrainBool);
        DeleteExtraFiles(_source, _destination, _isModdedTerrainBool);
        DeleteExtraDirectories(_source, _destination);
    }

    // Recursively copies all subdirectories from the source to the destination using the main orchestrator method.
    private static void RecursivelyCopySubdirectories(string _source, string _destination, bool _isModdedTerrain)
    {
        List<string> blacklistedDirectories = new List<string>
        {
            "Textures",
            @"Server\Config",
            @"Core_Artillery",
            @"Core_Structures",
        };

        foreach (var directory in Directory.GetDirectories(_source))
        {
            string directoryName = Path.GetFileName(directory);
            bool shouldSkipDirectory = blacklistedDirectories.Any(blacklist => directory.EndsWith(blacklist));

            // Check if directoryName ends with any string in blacklistedDirectories
            // Only when copying to takistan
            if (shouldSkipDirectory && _destination.Contains("co.takistan"))
            {
                continue; // Exit the method if the directory is blacklisted
            }

            if (directoryName == null) continue;

            var terrainModStatusForReturnedTerrain = _isModdedTerrain ? TerrainModStatus.MODDED : TerrainModStatus.VANILLA;

            string destinationDirectory = Path.Combine(_destination, directoryName);
            CopyFilesFromSourceToDestination(directory, destinationDirectory, 
                terrainModStatusForReturnedTerrain);
        }
    }


    // Ensures that the directory exists at the specified path. Creates the directory if it doesn't exist.
    public static void EnsureDirectoryExists(string _directoryPath)
    {
        Directory.CreateDirectory(_directoryPath);
    }

    // Copies each file from the source directory to the destination directory. Overwrites existing files.
    private static void CopyFiles(string _source, string _destination, bool _isModdedTerrain)
    {
        foreach (var file in Directory.GetFiles(_source))
        {
            string fileName = Path.GetFileName(file);

            if (ShouldSkipFile(fileName, _isModdedTerrain))
            {
                continue;
            }

            string destFile = Path.Combine(_destination, fileName);
            try
            {
                using (FileStream sourceStream = new FileStream(file, FileMode.Open, FileAccess.Read, FileShare.Read))
                using (FileStream destStream = new FileStream(destFile, FileMode.Create, FileAccess.Write, FileShare.None))
                {
                    sourceStream.CopyTo(destStream);
                }
            }
            catch (IOException ex)
            {
                Console.WriteLine($"Error copying file: {ex.Message}");
            }
        }
    }

    // Determines whether the given file should be skipped based on its name. Skips files with specific extensions
    // or naming conventions (the ones that are unique to each of the terrains)
    private static bool ShouldSkipFile(string _fileName, bool _isModdedTerrain)
    {
        return (_fileName.EndsWith("mission.sqm", StringComparison.OrdinalIgnoreCase) ||
               _fileName.EndsWith("version.sqf", StringComparison.OrdinalIgnoreCase) ||
               // Convert to list to not to convert from Cherno to takistan,
               // use as parameter to add to the list above
               _fileName.EndsWith("GUI_Menu_Help.sqf", StringComparison.OrdinalIgnoreCase) ||
               _fileName.EndsWith("texHeaders.bin", StringComparison.OrdinalIgnoreCase) ||
               _fileName.EndsWith("StartVeh.sqf", StringComparison.OrdinalIgnoreCase) ||
               (_fileName.EndsWith("loadScreen.jpg", StringComparison.OrdinalIgnoreCase) && !_isModdedTerrain)
               ) &&
               !_fileName.EndsWith("Init_Version.sqf", StringComparison.OrdinalIgnoreCase); // because there's version.sqf
    }

    // Deletes extra files in the destination directory that do not exist in the source directory, skipping files based on naming conventions.
    private static void DeleteExtraFiles(string _source, string _destination, bool _isModdedTerrain)
    {
        foreach (var destFile in Directory.GetFiles(_destination))
        {
            string fileName = Path.GetFileName(destFile);

            if (ShouldSkipFile(fileName, _isModdedTerrain))
            {
                continue;
            }

            string correspondingSourceFile = Path.Combine(_source, fileName);
            if (!File.Exists(correspondingSourceFile))
            {
                File.Delete(destFile);
            }
        }
    }

    // Deletes extra directories in the destination that do not have corresponding directories in the source.
    private static void DeleteExtraDirectories(string _source, string _destination)
    {
        foreach (var destDir in Directory.GetDirectories(_destination))
        {
            string dirName = Path.GetFileName(destDir);
            if (dirName == null) continue;

            string correspondingSourceDir = Path.Combine(_source, dirName);
            if (!Directory.Exists(correspondingSourceDir))
            {
                Directory.Delete(destDir, true);
            }
        }
    }

    // Ensures that the program is being ran in the correct directory, throws error if this is not the case.
    public static DirectoryInfo FindA2WaspWarfareDirectory()
    {
        string currentDirectory = Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().Location);
        DirectoryInfo dir = new DirectoryInfo(currentDirectory);

        while (dir.Name != "a2waspwarfare" && dir.Parent != null)
        {
            dir = dir.Parent;
        }

        if (dir.Name != "a2waspwarfare")
        {
            throw new Exception("Could not find the 'a2waspwarfare' directory.");
        }

        return dir;
    }

    // This method traverses a directory and lists all the file paths.
    // It takes in a directory path and an optional file type.
    // If a file type is specified, it will only list files of that type.
    public static List<string> ListFilesInDirectory(string _directoryPath, string _fileType = "")
    {
        // Initialize the list to store file paths
        List<string> _filePaths = new List<string>();

        // Check if the directory exists
        if (!Directory.Exists(_directoryPath))
        {
            Console.WriteLine("The specified directory does not exist.");
            return _filePaths; // Return an empty list
        }

        // Traverse the directory and add file paths to the list
        foreach (string _filePath in Directory.EnumerateFiles(
            _directoryPath, "*", SearchOption.AllDirectories))
        {
            // If a file type is specified, filter the files
            if (!string.IsNullOrEmpty(_fileType) &&
                !Path.GetExtension(_filePath).Equals(_fileType, StringComparison.OrdinalIgnoreCase))
            {
                continue;
            }

            _filePaths.Add(_filePath);
        }

        // Return the list of file paths
        return _filePaths;
    }
}
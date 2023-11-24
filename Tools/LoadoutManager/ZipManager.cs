using System;
using System.IO;
using System.IO.Compression;

public class ZipManager
{
    public static void DoZipOperations()
    {
        string a2waspDirectory = FileManager.FindA2WaspWarfareDirectory().FullName;
        string[] missionDirectories = { "Missions", "Missions_Vanilla", "Modded_Missions" };
        // Create this directory if it doesn't exist
        string tempDirectory = Path.Combine(a2waspDirectory, "TempZippingDirectory");
        if (!Directory.Exists(tempDirectory))
        {
            CreateDirectory(tempDirectory);
        }
        
        string destinationFile = @"_MISSIONS.zip";

        CreateDirectory(tempDirectory);

        foreach (var missionDirectory in missionDirectories)
        {
            string sourceDirectory = Path.Combine(a2waspDirectory, missionDirectory);
            CopyFilesIgnoringSymlinks(sourceDirectory, tempDirectory);
        }

        CreateZipFromDirectory(tempDirectory, destinationFile);

        DeleteDirectory(tempDirectory);
    }

    // This method creates a new directory
    private static void CreateDirectory(string _directoryPath)
    {
        Directory.CreateDirectory(_directoryPath);
        Console.WriteLine($"Created directory: {_directoryPath}");
    }

    // This method deletes a directory
    private static void DeleteDirectory(string _directoryPath)
    {
        Directory.Delete(_directoryPath, true);
        Console.WriteLine($"Deleted directory: {_directoryPath}");
    }

    // This method creates a zip file from a directory
    private static void CreateZipFromDirectory(string _sourceDirectory, string _destinationFile)
    {
        ZipFile.CreateFromDirectory(_sourceDirectory, _destinationFile);
        Console.WriteLine($"Created zip file: {_destinationFile}");
    }

    // This method copies files from one directory to another, ignoring symlinks
    private static void CopyFilesIgnoringSymlinks(string _sourceDirectory, string _destinationDirectory)
    {
        foreach (var directory in Directory.GetDirectories(_sourceDirectory))
        {
            string _destination = Path.Combine(_destinationDirectory, Path.GetFileName(directory));
            CreateDirectory(_destination);
            CopyFilesIgnoringSymlinks(directory, _destination);
        }

        foreach (var file in Directory.GetFiles(_sourceDirectory))
        {
            if (!IsSymlink(file))
            {
                string destinationFile = Path.Combine(_destinationDirectory, Path.GetFileName(file));
                // Overwrite the file if it already exists
                File.Copy(file, destinationFile, true);
                Console.WriteLine($"Copied file: {file} to {_destinationDirectory}");
            }
        }
    }

    // This method checks if a file is a symlink
    private static bool IsSymlink(string _path)
    {
        var fileAttributes = File.GetAttributes(_path);
        bool isSymlink = fileAttributes.HasFlag(FileAttributes.ReparsePoint);
        if (isSymlink)
        {
            Console.WriteLine($"File {_path} is a symlink");
        }
        return isSymlink;
    }
}
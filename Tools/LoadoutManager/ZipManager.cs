using System;
using System.IO;
using System.Diagnostics;

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
        
        string destinationFile = Path.Combine(a2waspDirectory, "_MISSIONS.7z");

        if (File.Exists(destinationFile))
        {
            File.Delete(destinationFile);
            Console.WriteLine($"Deleted existing file: {destinationFile}");
        }

        CreateDirectory(tempDirectory);

        foreach (var missionDirectory in missionDirectories)
        {
            string sourceDirectory = Path.Combine(a2waspDirectory, missionDirectory);
            CopyFilesIgnoringSymlinks(sourceDirectory, tempDirectory);
        }

        Create7zFromDirectory(tempDirectory, destinationFile);

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

    // This method creates a 7z file from a directory
    private static void Create7zFromDirectory(string _sourceDirectory, string _destinationFile)
    {
        string sevenZipPath = Environment.GetEnvironmentVariable("7za");
        if (string.IsNullOrEmpty(sevenZipPath))
        {
            throw new Exception("7za environment variable is not set.");
        }

        ProcessStartInfo p = new ProcessStartInfo();
        p.FileName = "7za.exe";
        p.Arguments = $"a -t7z \"{_destinationFile}\" \"{_sourceDirectory}\\*\" -mx=9";
        p.WindowStyle = ProcessWindowStyle.Hidden;
        Process x = Process.Start(p);
        x.WaitForExit();
        Console.WriteLine($"Created 7z file: {_destinationFile}");
    }

    // This method copies files from one directory to another, ignoring symlinks
    private static void CopyFilesIgnoringSymlinks(string _sourceDirectory, string _destinationDirectory)
    {        
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
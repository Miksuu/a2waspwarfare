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
            using (FileStream fs = new FileStream(destinationFile, FileMode.Open))
            {
                fs.Close();
            }
            File.Delete(destinationFile);
            Console.WriteLine($"Deleted existing file: {destinationFile}");
        }

        CreateDirectory(tempDirectory);

        foreach (var missionDirectory in missionDirectories)
        {
            string sourceDirectory = Path.Combine(a2waspDirectory, missionDirectory);
            CopyDirectories(sourceDirectory, tempDirectory);
        }

        Create7zFromDirectory(tempDirectory, destinationFile);

        DeleteDirectory(tempDirectory);
    }

    // This method creates a new directory if it doesn't exist
    private static void CreateDirectory(string _directoryPath)
    {
        try
        {
            if (!Directory.Exists(_directoryPath))
            {
                Directory.CreateDirectory(_directoryPath);
                Console.WriteLine($"Created directory: {_directoryPath}");
            }
        }
        catch (IOException)
        {
            if (!Directory.Exists(_directoryPath))
            {
                return;
            }
        }
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

    // This method copies directories from one location to another, ignoring symlinks
    private static void CopyDirectories(string _sourceDirectory, string _destinationDirectory)
    {
        foreach (var directory in Directory.GetDirectories(_sourceDirectory))
        {
            var pathName = Path.GetFileName(directory);

            if (pathName.Contains("PromptLibrary"))
            {
                continue;
            }

            string destinationDirectory = Path.Combine(_destinationDirectory, pathName);

            // Create the directory if it doesn't exist
            if (!Directory.Exists(destinationDirectory))
            {
                Directory.CreateDirectory(destinationDirectory);
            }
            Console.WriteLine($"Copied directory: {directory} to {_destinationDirectory}");
        }
    }
}

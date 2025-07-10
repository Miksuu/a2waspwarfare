using System.Runtime.CompilerServices;
using System.Runtime.Serialization;
using System.Text;

[DataContract]
public class logEnum<T> where T : struct, Enum
{
    [DataMember]
    private T? _value = null;

    public logEnum() : base()
    {
        // _value is already initialized to null
    }

    public logEnum(T value)
    {
        Log.WriteLine("Creating " + nameof(logEnum<T>) + " with value: " + value, LogLevel.SET_VERBOSE);
        _value = value;
    }

    public T? GetValue(
        [CallerFilePath] string _filePath = "",
        [CallerMemberName] string _memberName = "",
        [CallerLineNumber] int _lineNumber = 0)
    {
        Log.WriteLine("Getting " + _memberName,
                     LogLevel.GET_VERBOSE, _filePath, "", _lineNumber);
        return _value;
    }

    public void SetValue(T value,
        [CallerFilePath] string _filePath = "",
        [CallerMemberName] string _memberName = "",
        [CallerLineNumber] int _lineNumber = 0)
    {
        Log.WriteLine("Setting " + _memberName +
            " TO: " + value, LogLevel.SET_VERBOSE, _filePath, "", _lineNumber);
        _value = value;
    }
}

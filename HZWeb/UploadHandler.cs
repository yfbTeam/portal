using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;

/// <summary>
/// UploadHandler ��ժҪ˵��
/// </summary>
public class UploadHandler : Handlers
{

    public UploadConfig UploadConfig { get; private set; }
    public UploadResult Result { get; private set; }

    public UploadHandler(HttpContext context, UploadConfig config)
        : base(context)
    {
        this.UploadConfig = config;
        this.Result = new UploadResult() { State = UploadState.Unknown };
    }

    public override void Process()
    {
        byte[] uploadFileBytes = null;
        string uploadFileName = null;

        if (UploadConfig.Base64)
        {
            uploadFileName = UploadConfig.Base64Filename;
            uploadFileBytes = Convert.FromBase64String(Request[UploadConfig.UploadFieldName]);
        }
        else
        {
            var file = Request.Files[UploadConfig.UploadFieldName];
            uploadFileName = file.FileName;

            if (!CheckFileType(uploadFileName))
            {
                Result.State = UploadState.TypeNotAllow;
                WriteResult();
                return;
            }
            if (!CheckFileSize(file.ContentLength))
            {
                Result.State = UploadState.SizeLimitExceed;
                WriteResult();
                return;
            }

            uploadFileBytes = new byte[file.ContentLength];
            try
            {
                file.InputStream.Read(uploadFileBytes, 0, file.ContentLength);
            }
            catch (Exception)
            {
                Result.State = UploadState.NetworkError;
                WriteResult();
            }
        }

        Result.OriginFileName = uploadFileName;

        string path = string.Empty;
        switch (UploadConfig.UploadParams)
        {
            case "UploadImgForNoticeShowBg":
                path = System.Configuration.ConfigurationManager.AppSettings["NoticeImgShowBgPath"];
                break;
            case "UploadImgForSchoolStyle":
                path = System.Configuration.ConfigurationManager.AppSettings["SchoolStylePath"];
                break;
            case "UploadImgForAdvertContent":
                path = System.Configuration.ConfigurationManager.AppSettings["AdvertImgContentPath"];
                break;
            case "UploadImgForLinkContent":
                path = System.Configuration.ConfigurationManager.AppSettings["LinkImgContentPath"];
                break;
            case "UploadImgForMessageContent":
                path = System.Configuration.ConfigurationManager.AppSettings["MessageImgContentPath"];
                break;
            case "UploadWordForContent":
                path = System.Configuration.ConfigurationManager.AppSettings["WordContentPath"];
                break;
        }
        var savePath = PathFormatter.Format(uploadFileName, path + UploadConfig.PathFormat);
        var localPath = Server.MapPath("~" + savePath);
        try
        {
            if (!Directory.Exists(Path.GetDirectoryName(localPath)))
            {
                Directory.CreateDirectory(Path.GetDirectoryName(localPath));
            }
            File.WriteAllBytes(localPath, uploadFileBytes);
            Result.Url = savePath;
            Result.State = UploadState.Success;
        }
        catch (Exception e)
        {
            Result.State = UploadState.FileAccessError;
            Result.ErrorMessage = e.Message;
        }
        finally
        {
            WriteResult();
        }
    }

    private void WriteResult()
    {
        this.WriteJson(new
        {
            state = GetStateMessage(Result.State),
            url = Result.Url,
            title = Result.OriginFileName,
            original = Result.OriginFileName,
            error = Result.ErrorMessage
        });
    }

    private string GetStateMessage(UploadState state)
    {
        switch (state)
        {
            case UploadState.Success:
                return "SUCCESS";
            case UploadState.FileAccessError:
                return "�ļ����ʳ�������д��Ȩ��";
            case UploadState.SizeLimitExceed:
                return "�ļ���С��������������";
            case UploadState.TypeNotAllow:
                return "��������ļ���ʽ";
            case UploadState.NetworkError:
                return "�������";
        }
        return "δ֪����";
    }

    private bool CheckFileType(string filename)
    {
        var fileExtension = Path.GetExtension(filename).ToLower();
        return UploadConfig.AllowExtensions.Select(x => x.ToLower()).Contains(fileExtension);
    }

    private bool CheckFileSize(int size)
    {
        return size < UploadConfig.SizeLimit;
    }
}

public class UploadConfig
{
    /// <summary>
    /// �ļ���������
    /// </summary>
    public string PathFormat { get; set; }

    /// <summary>
    /// �ϴ���������
    /// </summary>
    public string UploadFieldName { get; set; }

    /// <summary>
    /// �ϴ���С����
    /// </summary>
    public int SizeLimit { get; set; }

    /// <summary>
    /// �ϴ�������ļ���ʽ
    /// </summary>
    public string[] AllowExtensions { get; set; }

    /// <summary>
    /// �ļ��Ƿ��� Base64 ����ʽ�ϴ�
    /// </summary>
    public bool Base64 { get; set; }

    /// <summary>
    /// Base64 �ַ�������ʾ���ļ���
    /// </summary>
    public string Base64Filename { get; set; }

    public string UploadParams { get; set; }
}

public class UploadResult
{
    public UploadState State { get; set; }
    public string Url { get; set; }
    public string OriginFileName { get; set; }

    public string ErrorMessage { get; set; }
}

public enum UploadState
{
    Success = 0,
    SizeLimitExceed = -1,
    TypeNotAllow = -2,
    FileAccessError = -3,
    NetworkError = -4,
    Unknown = 1,
}


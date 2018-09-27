﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace PMSUtility
{
    public class HtmlImgRegex
    {
        /// <summary> 
        /// 取得HTML中所有图片的 URL。 
        /// </summary> 
        /// <param name="sHtmlText">HTML代码</param> 
        /// <returns>图片的URL列表</returns> 
        public string[] GetHtmlImageUrlList(string sHtmlText)
        {
            try
            {
                // 定义正则表达式用来匹配 img 标签 
                Regex regImg = new Regex(@"<img\b[^<>]*?\bsrc[\s\t\r\n]*=[\s\t\r\n]*[""']?[\s\t\r\n]*(?<src>[^\t\r\n""'<>]*)[^<>]*?/?[\s\t\r\n]*>", RegexOptions.IgnoreCase);

                // 搜索匹配的字符串 
                MatchCollection matches = regImg.Matches(sHtmlText);
                int i = 0;
                string[] sUrlList = new string[matches.Count];

                // 取得匹配项列表 
                foreach (Match match in matches)
                    sUrlList[i++] = match.Groups["src"].Value;
                return sUrlList;
            }
            catch (Exception)
            {
                return null;
            }
            
        }
    }
}

namespace JsonAndMongoDbExporter
{
    using System.Collections.Generic;
    using System.IO;

    using Newtonsoft.Json;

    public static class Json
    {
        public static void GenerateJsonReports(List<Report> reports)
        {
            foreach (var report in reports)
            {
                using (FileStream fs = File.Open("../../../Json-Reports/" + report.ProductId + ".json", FileMode.Create))
                using (StreamWriter sw = new StreamWriter(fs))
                using (JsonWriter jw = new JsonTextWriter(sw))
                {
                    jw.Formatting = Formatting.Indented;

                    JsonSerializer serializer = new JsonSerializer();
                    serializer.Serialize(jw, report);
                }
            }
        }
    }
}

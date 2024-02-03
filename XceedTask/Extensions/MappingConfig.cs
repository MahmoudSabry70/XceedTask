using Mapster;
using XceedTask.Core.Entity.ProductData;

namespace XceedTask.Extensions;

public class MappingConfig
{
    public static void ConfigureMappings()
    {
        TypeAdapterConfig<Product, ProductEditViewModel>
            .NewConfig()
            .Ignore(dest => dest.ImgFile);
    }
}
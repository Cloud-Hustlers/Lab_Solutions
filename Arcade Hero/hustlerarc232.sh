curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh
gcloud config set compute/region $REGION
export PROJECT_ID=$(gcloud config get-value project)


mkdir hustler && cd hustler


cat > Function.cs <<'EOF_END'
using Google.Cloud.Functions.Framework;
using Microsoft.AspNetCore.Http;
using System.Threading.Tasks;

namespace HelloWorld;

public class Function : IHttpFunction
{
    public async Task HandleAsync(HttpContext context)
    {
        await context.Response.WriteAsync("Hello World!", context.RequestAborted);
    }
}
EOF_END

cat > HelloHttp.csproj <<'EOF_END'
<Project Sdk="Microsoft.NET.Sdk">
  <PropertyGroup>
    <OutputType>Exe</OutputType>
    <TargetFramework>net6.0</TargetFramework>
  </PropertyGroup>

  <ItemGroup>
    <PackageReference Include="Google.Cloud.Functions.Hosting" Version="2.2.1" />
  </ItemGroup>
</Project>
EOF_END

#HelloHttp.Function entery point


  gcloud functions deploy cf-demo \
    --gen2 \
    --entry-point=HelloWorld.Function \
    --runtime=dotnet6 \
    --region=$REGION \
    --source=. \
    --trigger-http \
    --allow-unauthenticated \
    --quiet

curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh

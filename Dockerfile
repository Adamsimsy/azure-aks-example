FROM microsoft/dotnet:aspnetcore-runtime
LABEL maintainer="Adamsimsy <adamsimsy@gmai.com>"

WORKDIR /app
COPY ./publish .

ENTRYPOINT ["dotnet","ExampleWebApp.dll"]
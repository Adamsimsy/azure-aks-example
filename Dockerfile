#Create build image for dotnet core mvc app
FROM microsoft/dotnet:sdk AS build-env
WORKDIR /app

#Copy csproj and restore as distinct layers
COPY src/ExampleWebApp/*.csproj ./
RUN dotnet restore

#Copy everything else and build
COPY src/ExampleWebApp/. ./
RUN dotnet publish -c Release -o out

#Create runtime image for dotnet core mvc app
FROM microsoft/dotnet:aspnetcore-runtime
LABEL maintainer="Adamsimsy <adamsimsy@gmai.com>"
WORKDIR /app
COPY --from=build-env /app/out/ .
ENTRYPOINT ["dotnet","ExampleWebApp.dll"]
final String getCategoriesQuery = """
query GetCategories{
  getCategories{
    id
    name
    slug
    backgroundImg
    icon 
  }
}
""";
final String getAllCategoriesQuery = """
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

final String getAllProductsQuery = """
query GetProducts(\$categoryIds:[ID]){
    getProducts(categoryIds:\$categoryIds){
      id
      name
      slug
      supplier{
        id
        name
      }
      description
      image
      moq
      unit
      quantiyPrice{
        from
        to
        price
      }
      discountRate
    }
  }
""";
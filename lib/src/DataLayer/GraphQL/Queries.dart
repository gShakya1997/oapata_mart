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

String getProductByIdQuery = """
query GetProduct(\$id:ID!){
    getProduct(id:\$id){
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

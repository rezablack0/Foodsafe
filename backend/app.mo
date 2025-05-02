import Array "mo:base/Array";

import Time "mo:base/Time";

actor {
  type DistributionLog = {
    location : Text;
    timestamp : Time.Time;
    note : Text
  };

  type Product = {
    id : Text;
    name : Text;
    origin : Text;
    created_at : Time.Time;
    expiration : Time.Time;
    history : [DistributionLog]
  };

  var products : [Product] = [];

  public func addProduct(
    id : Text,
    name : Text,
    origin : Text,
    created_at : Time.Time,
    expiration : Time.Time
  ) : async () {
    let newProduct : Product = {
      id = id;
      name = name;
      origin = origin;
      created_at = created_at;
      expiration = expiration;
      history = []
    };
    products := Array.append(products, [newProduct])
  };

  public func getProduct(id : Text) : async ?Product {
    for (product in products.vals()) {
      if (product.id == id) {
        return ?product
      }
    };
    return null
  }
}

enum ConnectionType {
  wifi,
  mobile,
}
enum ButtonType { primary, secondary, tertiary }
enum ProductType { Merchandise,Song,Album}
enum QuantityType { increment,decrement}

enum ImagePickerType {
  gallery,
  camera,
  profile,
  album,
  cover;

  String get name {
    switch (this) {
      case ImagePickerType.gallery:
        return 'gallery';
      case ImagePickerType.camera:
        return 'camera';
      case ImagePickerType.album:
        return 'album';
      case ImagePickerType.profile:
        return 'account';
      case ImagePickerType.cover:
        return 'cover';
    }
  }
}

enum StatusType {
  Processing,
  Delivered,
  Shipped,
  Out_of_Delivery,
  Cancelled,
Ready_for_Ship,
New_Orders;

  String get name {
    switch (this) {
      case StatusType.Processing:
        return 'Processing';
      case StatusType.Delivered:
        return 'Delivered';
      case StatusType.Shipped:
        return 'Shipped';
      case StatusType.Out_of_Delivery:
        return 'Out of Delivery';
      case StatusType.Cancelled:
        return 'Cancelled';
      case StatusType.Ready_for_Ship:
        return 'Ready for Ship';
        case StatusType.New_Orders:
        return 'New Orders';
    }
  }

}

enum ImageType {
  file,
  network,
  asset
}



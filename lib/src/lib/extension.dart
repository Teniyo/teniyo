extension TeniyoExtention<T,T2> on Map<T,T2> {
  void changeKey(T oldKey, T newKey){
    if (containsKey(oldKey)) {
      this[newKey] = this[oldKey] as T2;
      remove(oldKey);
    }
  }
}
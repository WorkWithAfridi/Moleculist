extension SafeValue<T> on T? {
  T orDefault(T fallback) => this ?? fallback;
}

class ServerStatus {
  /// Model for server status
  ServerStatus({
    this.isConnected = false,
    this.underMaintenance = false,
  });
  bool underMaintenance;
  bool isConnected;
}

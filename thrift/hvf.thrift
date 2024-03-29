/**
 * hvf.svc.thrift
 */

namespace java com.hvf
namespace cpp hvf


/**
 * Common status reporting mechanism across all services
 */
enum hvf_status {
  DEAD = 0,
  STARTING = 1,
  ALIVE = 2,
  STOPPING = 3,
  STOPPED = 4,
  WARNING = 5,
}

struct ServiceDesc {
  1: required string ip_address;
  2: optional string hostname;
  3: required i32 port;
  4: required string svc_name;
}

/**
 * Standard base service
 */
service HVFService {

  /**
   * Discover the name of the registration service
   */
  list<string> findRegistrars(),

  /**
   * register a service w/ the registrar
   */
  hvf_status register_service(string registrar_ip, ServiceDesc srvc_desc),

  /**
   * de-register a service w/ the registrar
   */
  hvf_status deregister_service(string registrar_ip, ServiceDesc srvc_desc),


  /**
   * Returns a descriptive name of the service
   */
  string getName(),

  /**
   * Returns the version of the service
   */
  string getVersion(),

  /**
   * Gets the status of this service
   */
  hvf_status getStatus(),

  /**
   * User friendly description of status, such as why the service is in
   * the dead or warning state, or what is being started or stopped.
   */
  string getStatusDetails(),

  /**
   * Gets the counters for this service
   */
  map<string, i64> getCounters(),

  /**
   * Gets the value of a single counter
   */
  i64 getCounter(1: string key),

  /**
   * Sets an option
   */
  void setOption(1: string key, 2: string value),

  /**
   * Gets an option
   */
  string getOption(1: string key),

  /**
   * Gets all options
   */
  map<string, string> getOptions(),

  /**
   * Returns a CPU profile over the given time interval (client and server
   * must agree on the profile format).
   */
  string getCpuProfile(1: i32 profileDurationInSec),

  /**
   * Returns the unix time that the server has been running since
   */
  i64 aliveSince(),

  /**
   * Tell the server to reload its configuration, reopen log files, etc
   */
  oneway void reinitialize(),

  /**
   * Suggest a shutdown to the server
   */
  oneway void shutdown(),

}

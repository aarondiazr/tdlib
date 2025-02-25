
#pragma once

/**
 * \file
 * C interface for interaction with TDLib via JSON-serialized objects.
 * Can be used to easily integrate TDLib with any programming language which supports calling C functions
 * and is able to work with JSON.
 *
 * The JSON serialization of TDLib API objects is straightforward: all API objects are represented as JSON objects with
 * the same keys as the API object field names. The object type name is stored in the special field "@type", which is
 * optional in places where a type is uniquely determined by the context.
 * Bool object fields are stored as Booleans in JSON. int32, int53 and double fields are stored as Numbers.
 * int64 and string fields are stored as Strings. bytes fields are base64 encoded and then stored as String.
 * vectors are stored as Arrays.
 * The main TDLib interface is asynchronous. To match requests with a corresponding response a field "@extra" can
 * be added to the request object. The corresponding response will have an "@extra" field with exactly the same value.
 *
 * A TDLib client instance should be created through td_json_client_create.
 * Requests then can be sent using td_json_client_send from any thread.
 * New updates and request responses can be received through td_json_client_receive from any thread. This function
 * shouldn't be called simultaneously from two different threads. Also note that all updates and request responses
 * should be applied in the order they were received to ensure consistency.
 * Given this information, it's advisable to call this function from a dedicated thread.
 * Some service TDLib requests can be executed synchronously from any thread by using td_json_client_execute.
 * The TDLib client instance can be destroyed via td_json_client_destroy.
 *
 * General pattern of usage:
 * \code
 * void *client = td_json_client_create();
 * // somehow share the client with other threads, which will be able to send requests via td_json_client_send
 *
 * const double WAIT_TIMEOUT = 10.0; // seconds
 * int is_closed = 0;  // should be set to 1, when updateAuthorizationState with authorizationStateClosed is received
 * while (!is_closed) {
 *   const char *result = td_json_client_receive(client, WAIT_TIMEOUT);
 *   if (result) {
 *     // parse the result as JSON object and process it as an incoming update or an answer to a previously sent request
 *   }
 * }
 * td_json_client_destroy(client);
 * \endcode
 */

#include "tdjson_export.h"

#ifdef __cplusplus
extern "C" {
#endif

/**
 * Creates a new instance of TDLib.
 * \return Pointer to the created instance of TDLib.
 */
TDJSON_EXPORT void *td_json_client_create();

/**
 * Sends request to the TDLib client. May be called from any thread.
 * \param[in] client The client.
 * \param[in] request JSON-serialized null-terminated request to TDLib.
 */
TDJSON_EXPORT void td_json_client_send(void *client, const char *request);

/**
 * Receives incoming updates and request responses from the TDLib client. May be called from any thread, but
 * shouldn't be called simultaneously from two different threads.
 * Returned pointer will be deallocated by TDLib during next call to td_json_client_receive or td_json_client_execute
 * in the same thread, so it can't be used after that.
 * \param[in] client The client.
 * \param[in] timeout Maximum number of seconds allowed for this function to wait for new data.
 * \return JSON-serialized null-terminated incoming update or request response. May be NULL if the timeout expires.
 */
TDJSON_EXPORT const char *td_json_client_receive(void *client, double timeout);

/**
 * Synchronously executes TDLib request. May be called from any thread.
 * Only a few requests can be executed synchronously.
 * Returned pointer will be deallocated by TDLib during next call to td_json_client_receive or td_json_client_execute
 * in the same thread, so it can't be used after that.
 * \param[in] client The client.
 * \param[in] request JSON-serialized null-terminated request to TDLib.
 * \return JSON-serialized null-terminated request response. May be NULL if the request can't be parsed.
 */
TDJSON_EXPORT const char *td_json_client_execute(void *client, const char *request);

/**
 * Destroys the TDLib client instance. After this is called the client instance shouldn't be used anymore.
 * \param[in] client The client.
 */
TDJSON_EXPORT void td_json_client_destroy(void *client);

#ifdef __cplusplus
}  // extern "C"
#endif

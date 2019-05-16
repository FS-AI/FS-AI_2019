# FS-AI_2019

Library plus simple test executable for the CAN interface of the FS-AI ADS-DV.

`make` to build.

`./fs-ai_api_tester vcan0` to run on vcan0.

NOTE: See `setup.sh` for commands to setup vcan0.

## How to use
The library contains 3 functions plus associated data structures and enums:


### `int fs-ai_api_init(char *CAN_interface, int debug, int simulate);`
Accepts a character string referring to an available CAN interface (e.g. can0) and initialises the library.

Setting `debug` to a non-zero value outputs debugging info to `stdout` (otherwise the library is silent).

Setting `simulate` to a non-zero value causes simulated values to be loaded into the data structures.

NOTE: The simulated data is not representative of vehicle operation and simply changes on each call of `fs_ai_api_vcu2ai_get_data()`.


### `void fs_ai_api_vcu2ai_get_data(fs_ai_api_vcu2ai *data);`
Populates an instance of the `fs_ai_api_vcu2ai` data stucture with the latest values received from the vehicle. Data receives are asynchronous - each CAN frame is buffered as it is received.


### `void fs_ai_api_ai2vcu_set_data(fs_ai_api_ai2vcu *data);`
Transmits the CAN frames associated with the data passed in via the `fs_ai_api_ai2vcu` data struture.

NOTE: This function must be called frequently enough to prevent the CAN timeout diagnostics of the vehicle ECU from triggering. However calling the function too frequently could overload the CAN bus so an internal timer prevents re-transmission of CAN frames at a period less than approx. 4ms. Calling this function every 5ms is optimal, data updates will be sent to the vehicle as fast as possible.


## Further Documentation
Please refer to the full document published on the IMechE website for full information on the FS-AI ADS-DV CAN interface:

https://www.imeche.org/docs/default-source/1-oscar/formula-student/2019/fs-ai/ads-dv-software-interface-specification-v0-2.pdf

This software library exposes only those aspects of the full interface that are deemed essential for the 2019 Formula Student AI DDT cometition using the FS-AI ADS-DV.

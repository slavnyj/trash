from logging.handlers import SysLogHandler
import logging
if __name__ == '__main__':
    result = None

    while result is None:
        number = input("Input a number:")
        if number.isdigit():
            result = int(number) * 2
            logging.basicConfig(level="INFO")
            logger = logging.getLogger()
            logger.handlers = [] # Remove INFO:root: from output message
            handler = SysLogHandler(facility=SysLogHandler.LOG_DAEMON, address='/dev/log')
            logger.addHandler(handler)
            json_format = logging.Formatter('{"time": "%(asctime)s", "name": "PyApp", "message": "%(message)s"}')
            handler.setFormatter(json_format)
            logging.info(f'{number}')
            print(f"{number} x 2 = {result}")

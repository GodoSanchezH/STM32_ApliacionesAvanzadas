/* USER CODE BEGIN Header */
/* USER CODE END Header */
/* Includes ------------------------------------------------------------------*/
#include "main.h"
#include "usart.h"
#include "gpio.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
#include "stdio.h"
#include "string.h"
#include "stdlib.h"
#include "stdarg.h"

#include "FreeRTOS.h"
#include "task.h"
#include "semphr.h"
/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */
/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */
/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */
/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/

/* USER CODE BEGIN PV */
/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
/* USER CODE BEGIN PFP */
/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */


#define SYSTEM_VIEW				1

void SendUart(char *format,...);

TaskHandle_t TaskHandle1,TaskHandle2,TaskHandle3;
SemaphoreHandle_t xSemaphore;

void vTarea1(void *params);
void vTarea2(void *params);
void vTarea3(void *params);

/* USER CODE END 0 */

/**
  * @brief  The application entry point.
  * @retval int
  */
int main(void)
{
  /* USER CODE BEGIN 1 */
	BaseType_t status;
  /* USER CODE END 1 */

  /* MCU Configuration--------------------------------------------------------*/

  /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
  HAL_Init();

  /* USER CODE BEGIN Init */
  /* USER CODE END Init */

  /* Configure the system clock */
  SystemClock_Config();

  /* USER CODE BEGIN SysInit */
  /* USER CODE END SysInit */

  /* Initialize all configured peripherals */
  MX_GPIO_Init();
  MX_USART2_UART_Init();
  /* USER CODE BEGIN 2 */
#if SYSTEM_VIEW
//  NVIC_SetPriorityGrouping(0);
  DWT->CTRL |= 1;
  SEGGER_SYSVIEW_Conf();
  /*solo se va usar cuando se trabaje en modo one shot*/
  SEGGER_SYSVIEW_Start();

#endif



  status = xTaskCreate(vTarea1,
		  	  	  	  	  	  "Tarea 1",
							  250,
							  NULL,
							  1,
							  &TaskHandle1);
  configASSERT(status == pdPASS);

  status = xTaskCreate(vTarea2,
		  	  	  	  	  	  "Tarea 2",
							  250,
							  NULL,
							  1,
							  &TaskHandle2);
  configASSERT(status == pdPASS);

  status = xTaskCreate(vTarea3,
		  	  	  	  	  	  "Tarea 3",
							  250,
							  NULL,
							  1,
							  &TaskHandle3);
  configASSERT(status == pdPASS);

  /*creacion de la Semaforo*/

  xSemaphore = xSemaphoreCreateCounting(2,2);
  //configASSERT(xSemaphore != NULL);

  vTaskStartScheduler();//Arrancamos el kernel

  /* USER CODE END 2 */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */
    /* USER CODE END WHILE */

    /* USER CODE BEGIN 3 */
  /* USER CODE END 3 */
}

/**
  * @brief System Clock Configuration
  * @retval None
  */
void SystemClock_Config(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};

  /** Configure the main internal regulator output voltage
  */
  __HAL_RCC_PWR_CLK_ENABLE();
  __HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE2);

  /** Initializes the RCC Oscillators according to the specified parameters
  * in the RCC_OscInitTypeDef structure.
  */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSE;
  RCC_OscInitStruct.HSEState = RCC_HSE_BYPASS;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSE;
  RCC_OscInitStruct.PLL.PLLM = 4;
  RCC_OscInitStruct.PLL.PLLN = 84;
  RCC_OscInitStruct.PLL.PLLP = RCC_PLLP_DIV2;
  RCC_OscInitStruct.PLL.PLLQ = 4;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }

  /** Initializes the CPU, AHB and APB buses clocks
  */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV2;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_2) != HAL_OK)
  {
    Error_Handler();
  }
}

/* USER CODE BEGIN 4 */

void SendUart(char *format,...){
char str[100];
va_list args;
va_start(args,format);
vsprintf(str,format,args);
HAL_UART_Transmit(&huart2, (uint8_t*)str, strlen(str), 10);
va_end(args);


}

void vTarea1(void *params){


	for(;;){





		if (xSemaphoreTake(xSemaphore,pdMS_TO_TICKS(100))) {
			SEGGER_SYSVIEW_PrintfHost("Tarea 1 toma el Semaforo\n\r");
			SendUart("Tarea 1 toma el Semaforo\n\r");
			HAL_Delay(100);
			xSemaphoreGive(xSemaphore);
		}
		else{
			SEGGER_SYSVIEW_PrintfHost("Tarea 1 no puede usar el recurso\n\r");
			SendUart("Tarea 1 no puede usar el recurso\n\r");
		}

		vTaskDelay(pdMS_TO_TICKS(800));


	}
	vTaskDelete(NULL);
}

void vTarea2(void *params){

	for(;;){


		if (xSemaphoreTake(xSemaphore,pdMS_TO_TICKS(100))) {
			SEGGER_SYSVIEW_PrintfHost("Tarea 2 toma el Semaforo\n\r");
			SendUart("Tarea 2 toma el Semaforo\n\r");
			HAL_Delay(200);
			xSemaphoreGive(xSemaphore);
		}
		else{
			SEGGER_SYSVIEW_PrintfHost("Tarea 2 no puede usar el recurso\n\r");
			SendUart("Tarea 2 no puede usar el recurso\n\r");
		}


	}
	vTaskDelete(NULL);
}
void vTarea3(void *params){


	for(;;){




		if (xSemaphoreTake(xSemaphore,pdMS_TO_TICKS(100))) {
			SEGGER_SYSVIEW_PrintfHost("Tarea 3 toma el Semaforo\n\r");
			SendUart("Tarea 3 toma el Semaforo\n\r");
			HAL_Delay(300);
			xSemaphoreGive(xSemaphore);
		}
		else{
			SEGGER_SYSVIEW_PrintfHost("Tarea 3 no puede usar el recurso\n\r");
			SendUart("Tarea 3 no puede usar el recurso\n\r");
		}

		vTaskDelay(pdMS_TO_TICKS(500));


	}
}

/* USER CODE END 4 */

/**
  * @brief  Period elapsed callback in non blocking mode
  * @note   This function is called  when TIM11 interrupt took place, inside
  * HAL_TIM_IRQHandler(). It makes a direct call to HAL_IncTick() to increment
  * a global variable "uwTick" used as application time base.
  * @param  htim : TIM handle
  * @retval None
  */
void HAL_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *htim)
{
  /* USER CODE BEGIN Callback 0 */
  /* USER CODE END Callback 0 */
  if (htim->Instance == TIM11) {
    HAL_IncTick();
  }
  /* USER CODE BEGIN Callback 1 */
  /* USER CODE END Callback 1 */
}

/**
  * @brief  This function is executed in case of error occurrence.
  * @retval None
  */
void Error_Handler(void)
{
  /* USER CODE BEGIN Error_Handler_Debug */
  /* USER CODE END Error_Handler_Debug */
}

#ifdef  USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t *file, uint32_t line)
{
  /* USER CODE BEGIN 6 */
  /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */

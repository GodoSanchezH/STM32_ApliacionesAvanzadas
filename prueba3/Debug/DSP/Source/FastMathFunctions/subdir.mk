################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../DSP/Source/FastMathFunctions/arm_cos_f32.c \
../DSP/Source/FastMathFunctions/arm_cos_q15.c \
../DSP/Source/FastMathFunctions/arm_cos_q31.c \
../DSP/Source/FastMathFunctions/arm_sin_f32.c \
../DSP/Source/FastMathFunctions/arm_sin_q15.c \
../DSP/Source/FastMathFunctions/arm_sin_q31.c \
../DSP/Source/FastMathFunctions/arm_sqrt_q15.c \
../DSP/Source/FastMathFunctions/arm_sqrt_q31.c 

OBJS += \
./DSP/Source/FastMathFunctions/arm_cos_f32.o \
./DSP/Source/FastMathFunctions/arm_cos_q15.o \
./DSP/Source/FastMathFunctions/arm_cos_q31.o \
./DSP/Source/FastMathFunctions/arm_sin_f32.o \
./DSP/Source/FastMathFunctions/arm_sin_q15.o \
./DSP/Source/FastMathFunctions/arm_sin_q31.o \
./DSP/Source/FastMathFunctions/arm_sqrt_q15.o \
./DSP/Source/FastMathFunctions/arm_sqrt_q31.o 

C_DEPS += \
./DSP/Source/FastMathFunctions/arm_cos_f32.d \
./DSP/Source/FastMathFunctions/arm_cos_q15.d \
./DSP/Source/FastMathFunctions/arm_cos_q31.d \
./DSP/Source/FastMathFunctions/arm_sin_f32.d \
./DSP/Source/FastMathFunctions/arm_sin_q15.d \
./DSP/Source/FastMathFunctions/arm_sin_q31.d \
./DSP/Source/FastMathFunctions/arm_sqrt_q15.d \
./DSP/Source/FastMathFunctions/arm_sqrt_q31.d 


# Each subdirectory must supply rules for building sources it contributes
DSP/Source/FastMathFunctions/%.o DSP/Source/FastMathFunctions/%.su DSP/Source/FastMathFunctions/%.cyclo: ../DSP/Source/FastMathFunctions/%.c DSP/Source/FastMathFunctions/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -D__FPU_PRESENT=1U -DARM_MATH_CM4 -DUSE_HAL_DRIVER -DSTM32F401xE -c -I../Core/Inc -I"C:/Users/gssan/OneDrive/Documentos/GitHub/STM32_ApliacionesAvanzadas/prueba3/DSP/Include" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-DSP-2f-Source-2f-FastMathFunctions

clean-DSP-2f-Source-2f-FastMathFunctions:
	-$(RM) ./DSP/Source/FastMathFunctions/arm_cos_f32.cyclo ./DSP/Source/FastMathFunctions/arm_cos_f32.d ./DSP/Source/FastMathFunctions/arm_cos_f32.o ./DSP/Source/FastMathFunctions/arm_cos_f32.su ./DSP/Source/FastMathFunctions/arm_cos_q15.cyclo ./DSP/Source/FastMathFunctions/arm_cos_q15.d ./DSP/Source/FastMathFunctions/arm_cos_q15.o ./DSP/Source/FastMathFunctions/arm_cos_q15.su ./DSP/Source/FastMathFunctions/arm_cos_q31.cyclo ./DSP/Source/FastMathFunctions/arm_cos_q31.d ./DSP/Source/FastMathFunctions/arm_cos_q31.o ./DSP/Source/FastMathFunctions/arm_cos_q31.su ./DSP/Source/FastMathFunctions/arm_sin_f32.cyclo ./DSP/Source/FastMathFunctions/arm_sin_f32.d ./DSP/Source/FastMathFunctions/arm_sin_f32.o ./DSP/Source/FastMathFunctions/arm_sin_f32.su ./DSP/Source/FastMathFunctions/arm_sin_q15.cyclo ./DSP/Source/FastMathFunctions/arm_sin_q15.d ./DSP/Source/FastMathFunctions/arm_sin_q15.o ./DSP/Source/FastMathFunctions/arm_sin_q15.su ./DSP/Source/FastMathFunctions/arm_sin_q31.cyclo ./DSP/Source/FastMathFunctions/arm_sin_q31.d ./DSP/Source/FastMathFunctions/arm_sin_q31.o ./DSP/Source/FastMathFunctions/arm_sin_q31.su ./DSP/Source/FastMathFunctions/arm_sqrt_q15.cyclo ./DSP/Source/FastMathFunctions/arm_sqrt_q15.d ./DSP/Source/FastMathFunctions/arm_sqrt_q15.o ./DSP/Source/FastMathFunctions/arm_sqrt_q15.su ./DSP/Source/FastMathFunctions/arm_sqrt_q31.cyclo ./DSP/Source/FastMathFunctions/arm_sqrt_q31.d ./DSP/Source/FastMathFunctions/arm_sqrt_q31.o ./DSP/Source/FastMathFunctions/arm_sqrt_q31.su

.PHONY: clean-DSP-2f-Source-2f-FastMathFunctions


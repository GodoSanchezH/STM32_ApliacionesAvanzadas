################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../TouchGFX/generated/images/src/__generated/image_alternate_theme_images_backgrounds_320x240_gradient_dark.cpp \
../TouchGFX/generated/images/src/__generated/image_alternate_theme_images_widgets_button_regular_height_36_small_rounded_active.cpp \
../TouchGFX/generated/images/src/__generated/image_alternate_theme_images_widgets_button_regular_height_36_small_rounded_pressed.cpp \
../TouchGFX/generated/images/src/__generated/image_icon_theme_images_action_done_50_50_E8F6FB.svg.cpp 

OBJS += \
./TouchGFX/generated/images/src/__generated/image_alternate_theme_images_backgrounds_320x240_gradient_dark.o \
./TouchGFX/generated/images/src/__generated/image_alternate_theme_images_widgets_button_regular_height_36_small_rounded_active.o \
./TouchGFX/generated/images/src/__generated/image_alternate_theme_images_widgets_button_regular_height_36_small_rounded_pressed.o \
./TouchGFX/generated/images/src/__generated/image_icon_theme_images_action_done_50_50_E8F6FB.svg.o 

CPP_DEPS += \
./TouchGFX/generated/images/src/__generated/image_alternate_theme_images_backgrounds_320x240_gradient_dark.d \
./TouchGFX/generated/images/src/__generated/image_alternate_theme_images_widgets_button_regular_height_36_small_rounded_active.d \
./TouchGFX/generated/images/src/__generated/image_alternate_theme_images_widgets_button_regular_height_36_small_rounded_pressed.d \
./TouchGFX/generated/images/src/__generated/image_icon_theme_images_action_done_50_50_E8F6FB.svg.d 


# Each subdirectory must supply rules for building sources it contributes
TouchGFX/generated/images/src/__generated/%.o TouchGFX/generated/images/src/__generated/%.su: ../TouchGFX/generated/images/src/__generated/%.cpp TouchGFX/generated/images/src/__generated/subdir.mk
	arm-none-eabi-g++ "$<" -mcpu=cortex-m4 -std=gnu++14 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F401xE -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../TouchGFX/App -I../TouchGFX/target/generated -I../TouchGFX/target -I../Middlewares/ST/touchgfx/framework/include -I../TouchGFX/generated/fonts/include -I../TouchGFX/generated/gui_generated/include -I../TouchGFX/generated/images/include -I../TouchGFX/generated/texts/include -I../TouchGFX/generated/videos/include -I../TouchGFX/gui/include -O0 -ffunction-sections -fdata-sections -fno-exceptions -fno-rtti -fno-use-cxa-atexit -Wall -femit-class-debug-always -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-TouchGFX-2f-generated-2f-images-2f-src-2f-__generated

clean-TouchGFX-2f-generated-2f-images-2f-src-2f-__generated:
	-$(RM) ./TouchGFX/generated/images/src/__generated/image_alternate_theme_images_backgrounds_320x240_gradient_dark.d ./TouchGFX/generated/images/src/__generated/image_alternate_theme_images_backgrounds_320x240_gradient_dark.o ./TouchGFX/generated/images/src/__generated/image_alternate_theme_images_backgrounds_320x240_gradient_dark.su ./TouchGFX/generated/images/src/__generated/image_alternate_theme_images_widgets_button_regular_height_36_small_rounded_active.d ./TouchGFX/generated/images/src/__generated/image_alternate_theme_images_widgets_button_regular_height_36_small_rounded_active.o ./TouchGFX/generated/images/src/__generated/image_alternate_theme_images_widgets_button_regular_height_36_small_rounded_active.su ./TouchGFX/generated/images/src/__generated/image_alternate_theme_images_widgets_button_regular_height_36_small_rounded_pressed.d ./TouchGFX/generated/images/src/__generated/image_alternate_theme_images_widgets_button_regular_height_36_small_rounded_pressed.o ./TouchGFX/generated/images/src/__generated/image_alternate_theme_images_widgets_button_regular_height_36_small_rounded_pressed.su ./TouchGFX/generated/images/src/__generated/image_icon_theme_images_action_done_50_50_E8F6FB.svg.d ./TouchGFX/generated/images/src/__generated/image_icon_theme_images_action_done_50_50_E8F6FB.svg.o ./TouchGFX/generated/images/src/__generated/image_icon_theme_images_action_done_50_50_E8F6FB.svg.su

.PHONY: clean-TouchGFX-2f-generated-2f-images-2f-src-2f-__generated


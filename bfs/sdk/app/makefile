################################################################################
# Automatically-generated file. Do not edit!
################################################################################


APP := bfs

RM := rm -rf

BSP_DIR := bsp

LIBS := -lm -Wl,--start-group,-lxil,-lgcc,-lc,--end-group

# Add inputs and outputs from these tool invocations to the build variables 
OBJS += \
bfs.o \
fcuda_gen_bfs.o

# Each subdirectory must supply rules for building sources it contributes
%.o: %.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: ARM g++ compiler'
	arm-xilinx-eabi-g++ -Wall -O0 -g3 -I${FROOT}/include -c -fmessage-length=0 -I../$(BSP_DIR)/ps7_cortexa9_0/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
endif

# Add inputs and outputs from these tool invocations to the build variables 
ELFSIZE += \
$(APP).elf.size \


# All Target
all: $(APP).elf secondary-outputs

# Tool invocations
$(APP).elf: $(OBJS) lscript.ld
	@echo 'Building target: $@'
	@echo 'Invoking: ARM g++ linker'
	arm-xilinx-eabi-g++ -Wl,-T -Wl,lscript.ld -L../$(BSP_DIR)/ps7_cortexa9_0/lib -o "$(APP).elf" $(OBJS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '

$(APP).elf.size: $(APP).elf
	@echo 'Invoking: ARM Print Size'
	arm-xilinx-eabi-size $(APP).elf  |tee "$(APP).elf.size"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(OBJS) $(C_DEPS) $(EXECUTABLES) $(ELFSIZE) $(S_UPPER_DEPS) $(APP).elf *.d
	-@echo ' '

secondary-outputs: $(ELFSIZE)

.PHONY: all clean dependents

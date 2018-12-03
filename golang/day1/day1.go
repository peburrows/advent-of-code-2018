package main

import (
	"fmt"
	"io/ioutil"
	"strconv"
	"strings"
)

func FindFrequency(inputs []string) (acc int) {
	for _, val := range inputs {
		ival, _ := strconv.Atoi(val)
		acc += ival
	}
	return
}

func FindRepeating(lines []string, acc int, foundList map[int]bool) int {
	foundList[acc] = true
	for _, s := range lines {
		val, _ := strconv.Atoi(s)
		acc += val
		if foundList[acc] {
			return acc
		}
		foundList[acc] = true
	}
	return FindRepeating(lines, acc, foundList)
}

func valInSlice(a int, list []int) bool {
	for _, b := range list {
		if b == a {
			return true
		}
	}
	return false
}

func main() {
	content, _ := ioutil.ReadFile("../../inputs/day1.txt")
	lines := strings.Split(string(content), "\n")

	fmt.Println("problem1:", FindFrequency(lines))
	fmt.Println("problem2:", FindRepeating(lines, 0, map[int]bool{}))
}

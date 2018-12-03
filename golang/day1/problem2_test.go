package main

import (
	"fmt"
	"testing"
)

func TestProblem2Case1(t *testing.T) {
	result := FindRepeating([]string{"-1", "+1"}, 0, map[int]bool{})
	if 0 != result {
		t.Error(fmt.Sprintf("expected 0, but got %d", result))
	}
}
func TestProblem2Case2(t *testing.T) {
	result := FindRepeating([]string{"+3", "+3", "+4", "-2", "-4"}, 0, map[int]bool{})
	if 10 != result {
		t.Error(fmt.Sprintf("expected 10, but got %d", result))
	}
}
func TestProblem2Case3(t *testing.T) {
	result := FindRepeating([]string{"-6", "+3", "+8", "+5", "-6"}, 0, map[int]bool{})
	if 5 != result {
		t.Error(fmt.Sprintf("expected 5, but got %d", result))
	}
}
func TestProblem2Case4(t *testing.T) {
	result := FindRepeating([]string{"+7", "+7", "-2", "-7", "-4"}, 0, map[int]bool{})
	if 14 != result {
		t.Error(fmt.Sprintf("expected 14, but got %d", result))
	}
}

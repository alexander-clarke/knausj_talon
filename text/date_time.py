from talon import Module, Context, actions
import time

mod = Module()
mod.list("ampm", desc="AM or PM")

@mod.capture
def ampm(m) -> str:
	"AM or PM"

ctx = Context()
ctx.lists["self.ampm"] = {
	"AM": " AM",
	"PM": " PM",
	"A": " AM",
	"P": " PM"
}

@mod.capture(rule="{self.ampm}")
def ampm(m) -> str:
	return m.ampm

@mod.capture(rule="<number_small> | (twenty | thirty [<digits>])")
def day(m) -> int:
	if hasattr(m, 'number_small'): return m.number_small
	day = getattr(m, 'digits', 0)
	if m[0] == 'twenty': day += 20
	elif m[0] == 'thirty': day += 30
	return day

@mod.capture(rule="<number_small> [<number_small> | hundred | thousand]")
def year(m) -> int:
	if len(m) == 1: return m[0]
	if m[1] == 'thousand': return m[0] * 1000
	if m[1] == 'hundred': return m[0] * 100
	return (m[0] * 100) + m[1]

@mod.action_class
class Actions:
	def insert_time_ampm():
		"""Inserts the current time in 12-hour format"""
		actions.insert(time.strftime('%-I:%M %p'))

	def insert_date():
		"""Inserts the current date"""
		actions.insert(time.strftime('%x'))
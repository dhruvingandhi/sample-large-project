# Explore: explore_2515
# Auto-generated LookML Explore File

include: "/views/domain_46/view_07546.view.lkml"
include: "/views/domain_48/view_07548.view.lkml"
include: "/views/domain_49/view_07549.view.lkml"
include: "/views/domain_50/view_07550.view.lkml"

explore: explore_2515 {
  label: "Explore Explore 2515"
  description: "Comprehensive analytics explore joining base view_07546 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_07546
  
  always_filter: {
    filters: [view_07546.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07546.created_at_date: "7 days"]
    unless: [view_07546.id, view_07546.status]
  }

  join: view_07548 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07546.user_id} = ${view_07548.id} ;;
    required_joins: []
  }

  join: view_07549 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07546.account_id} = ${view_07549.account_id} ;;
    required_joins: [view_07548]
  }

  join: view_07550 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07546.category} = ${view_07550.category} ;;
  }

  access_filter: {
    field: view_07546.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07546.is_deleted} = false ;;
}

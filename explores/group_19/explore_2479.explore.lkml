# Explore: explore_2479
# Auto-generated LookML Explore File

include: "/views/domain_38/view_07438.view.lkml"
include: "/views/domain_40/view_07440.view.lkml"
include: "/views/domain_41/view_07441.view.lkml"
include: "/views/domain_42/view_07442.view.lkml"

explore: explore_2479 {
  label: "Explore Explore 2479"
  description: "Comprehensive analytics explore joining base view_07438 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_07438
  
  always_filter: {
    filters: [view_07438.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07438.created_at_date: "7 days"]
    unless: [view_07438.id, view_07438.status]
  }

  join: view_07440 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07438.user_id} = ${view_07440.id} ;;
    required_joins: []
  }

  join: view_07441 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07438.account_id} = ${view_07441.account_id} ;;
    required_joins: [view_07440]
  }

  join: view_07442 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07438.category} = ${view_07442.category} ;;
  }

  access_filter: {
    field: view_07438.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07438.is_deleted} = false ;;
}

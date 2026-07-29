# Explore: explore_1515
# Auto-generated LookML Explore File

include: "/views/domain_46/view_04546.view.lkml"
include: "/views/domain_48/view_04548.view.lkml"
include: "/views/domain_49/view_04549.view.lkml"
include: "/views/domain_50/view_04550.view.lkml"

explore: explore_1515 {
  label: "Explore Explore 1515"
  description: "Comprehensive analytics explore joining base view_04546 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_04546
  
  always_filter: {
    filters: [view_04546.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04546.created_at_date: "7 days"]
    unless: [view_04546.id, view_04546.status]
  }

  join: view_04548 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04546.user_id} = ${view_04548.id} ;;
    required_joins: []
  }

  join: view_04549 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04546.account_id} = ${view_04549.account_id} ;;
    required_joins: [view_04548]
  }

  join: view_04550 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04546.category} = ${view_04550.category} ;;
  }

  access_filter: {
    field: view_04546.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04546.is_deleted} = false ;;
}

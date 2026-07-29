# Explore: explore_0449
# Auto-generated LookML Explore File

include: "/views/domain_48/view_01348.view.lkml"
include: "/views/domain_50/view_01350.view.lkml"
include: "/views/domain_01/view_01351.view.lkml"
include: "/views/domain_02/view_01352.view.lkml"

explore: explore_0449 {
  label: "Explore Explore 0449"
  description: "Comprehensive analytics explore joining base view_01348 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_01348
  
  always_filter: {
    filters: [view_01348.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01348.created_at_date: "7 days"]
    unless: [view_01348.id, view_01348.status]
  }

  join: view_01350 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01348.user_id} = ${view_01350.id} ;;
    required_joins: []
  }

  join: view_01351 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01348.account_id} = ${view_01351.account_id} ;;
    required_joins: [view_01350]
  }

  join: view_01352 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01348.category} = ${view_01352.category} ;;
  }

  access_filter: {
    field: view_01348.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01348.is_deleted} = false ;;
}

# Explore: explore_1512
# Auto-generated LookML Explore File

include: "/views/domain_37/view_04537.view.lkml"
include: "/views/domain_39/view_04539.view.lkml"
include: "/views/domain_40/view_04540.view.lkml"
include: "/views/domain_41/view_04541.view.lkml"

explore: explore_1512 {
  label: "Explore Explore 1512"
  description: "Comprehensive analytics explore joining base view_04537 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_04537
  
  always_filter: {
    filters: [view_04537.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04537.created_at_date: "7 days"]
    unless: [view_04537.id, view_04537.status]
  }

  join: view_04539 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04537.user_id} = ${view_04539.id} ;;
    required_joins: []
  }

  join: view_04540 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04537.account_id} = ${view_04540.account_id} ;;
    required_joins: [view_04539]
  }

  join: view_04541 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04537.category} = ${view_04541.category} ;;
  }

  access_filter: {
    field: view_04537.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04537.is_deleted} = false ;;
}

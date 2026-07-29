# Explore: explore_1811
# Auto-generated LookML Explore File

include: "/views/domain_34/view_05434.view.lkml"
include: "/views/domain_36/view_05436.view.lkml"
include: "/views/domain_37/view_05437.view.lkml"
include: "/views/domain_38/view_05438.view.lkml"

explore: explore_1811 {
  label: "Explore Explore 1811"
  description: "Comprehensive analytics explore joining base view_05434 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_05434
  
  always_filter: {
    filters: [view_05434.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05434.created_at_date: "7 days"]
    unless: [view_05434.id, view_05434.status]
  }

  join: view_05436 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05434.user_id} = ${view_05436.id} ;;
    required_joins: []
  }

  join: view_05437 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05434.account_id} = ${view_05437.account_id} ;;
    required_joins: [view_05436]
  }

  join: view_05438 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05434.category} = ${view_05438.category} ;;
  }

  access_filter: {
    field: view_05434.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05434.is_deleted} = false ;;
}

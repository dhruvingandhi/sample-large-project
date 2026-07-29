# Explore: explore_2378
# Auto-generated LookML Explore File

include: "/views/domain_35/view_07135.view.lkml"
include: "/views/domain_37/view_07137.view.lkml"
include: "/views/domain_38/view_07138.view.lkml"
include: "/views/domain_39/view_07139.view.lkml"

explore: explore_2378 {
  label: "Explore Explore 2378"
  description: "Comprehensive analytics explore joining base view_07135 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_07135
  
  always_filter: {
    filters: [view_07135.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07135.created_at_date: "7 days"]
    unless: [view_07135.id, view_07135.status]
  }

  join: view_07137 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07135.user_id} = ${view_07137.id} ;;
    required_joins: []
  }

  join: view_07138 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07135.account_id} = ${view_07138.account_id} ;;
    required_joins: [view_07137]
  }

  join: view_07139 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07135.category} = ${view_07139.category} ;;
  }

  access_filter: {
    field: view_07135.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07135.is_deleted} = false ;;
}

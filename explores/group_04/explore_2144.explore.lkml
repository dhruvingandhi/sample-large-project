# Explore: explore_2144
# Auto-generated LookML Explore File

include: "/views/domain_33/view_06433.view.lkml"
include: "/views/domain_35/view_06435.view.lkml"
include: "/views/domain_36/view_06436.view.lkml"
include: "/views/domain_37/view_06437.view.lkml"

explore: explore_2144 {
  label: "Explore Explore 2144"
  description: "Comprehensive analytics explore joining base view_06433 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_06433
  
  always_filter: {
    filters: [view_06433.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06433.created_at_date: "7 days"]
    unless: [view_06433.id, view_06433.status]
  }

  join: view_06435 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06433.user_id} = ${view_06435.id} ;;
    required_joins: []
  }

  join: view_06436 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06433.account_id} = ${view_06436.account_id} ;;
    required_joins: [view_06435]
  }

  join: view_06437 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06433.category} = ${view_06437.category} ;;
  }

  access_filter: {
    field: view_06433.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06433.is_deleted} = false ;;
}

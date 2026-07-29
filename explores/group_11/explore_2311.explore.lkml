# Explore: explore_2311
# Auto-generated LookML Explore File

include: "/views/domain_34/view_06934.view.lkml"
include: "/views/domain_36/view_06936.view.lkml"
include: "/views/domain_37/view_06937.view.lkml"
include: "/views/domain_38/view_06938.view.lkml"

explore: explore_2311 {
  label: "Explore Explore 2311"
  description: "Comprehensive analytics explore joining base view_06934 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_06934
  
  always_filter: {
    filters: [view_06934.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06934.created_at_date: "7 days"]
    unless: [view_06934.id, view_06934.status]
  }

  join: view_06936 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06934.user_id} = ${view_06936.id} ;;
    required_joins: []
  }

  join: view_06937 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06934.account_id} = ${view_06937.account_id} ;;
    required_joins: [view_06936]
  }

  join: view_06938 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06934.category} = ${view_06938.category} ;;
  }

  access_filter: {
    field: view_06934.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06934.is_deleted} = false ;;
}

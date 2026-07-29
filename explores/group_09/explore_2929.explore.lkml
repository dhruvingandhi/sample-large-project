# Explore: explore_2929
# Auto-generated LookML Explore File

include: "/views/domain_38/view_08788.view.lkml"
include: "/views/domain_40/view_08790.view.lkml"
include: "/views/domain_41/view_08791.view.lkml"
include: "/views/domain_42/view_08792.view.lkml"

explore: explore_2929 {
  label: "Explore Explore 2929"
  description: "Comprehensive analytics explore joining base view_08788 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_08788
  
  always_filter: {
    filters: [view_08788.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08788.created_at_date: "7 days"]
    unless: [view_08788.id, view_08788.status]
  }

  join: view_08790 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08788.user_id} = ${view_08790.id} ;;
    required_joins: []
  }

  join: view_08791 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08788.account_id} = ${view_08791.account_id} ;;
    required_joins: [view_08790]
  }

  join: view_08792 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08788.category} = ${view_08792.category} ;;
  }

  access_filter: {
    field: view_08788.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08788.is_deleted} = false ;;
}

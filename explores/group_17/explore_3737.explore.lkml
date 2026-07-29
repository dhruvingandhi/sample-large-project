# Explore: explore_3737
# Auto-generated LookML Explore File

include: "/views/domain_12/view_11212.view.lkml"
include: "/views/domain_14/view_11214.view.lkml"
include: "/views/domain_15/view_11215.view.lkml"
include: "/views/domain_16/view_11216.view.lkml"

explore: explore_3737 {
  label: "Explore Explore 3737"
  description: "Comprehensive analytics explore joining base view_11212 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_11212
  
  always_filter: {
    filters: [view_11212.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11212.created_at_date: "7 days"]
    unless: [view_11212.id, view_11212.status]
  }

  join: view_11214 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11212.user_id} = ${view_11214.id} ;;
    required_joins: []
  }

  join: view_11215 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11212.account_id} = ${view_11215.account_id} ;;
    required_joins: [view_11214]
  }

  join: view_11216 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11212.category} = ${view_11216.category} ;;
  }

  access_filter: {
    field: view_11212.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11212.is_deleted} = false ;;
}

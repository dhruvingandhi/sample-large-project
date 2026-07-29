# Explore: explore_2737
# Auto-generated LookML Explore File

include: "/views/domain_12/view_08212.view.lkml"
include: "/views/domain_14/view_08214.view.lkml"
include: "/views/domain_15/view_08215.view.lkml"
include: "/views/domain_16/view_08216.view.lkml"

explore: explore_2737 {
  label: "Explore Explore 2737"
  description: "Comprehensive analytics explore joining base view_08212 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_08212
  
  always_filter: {
    filters: [view_08212.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08212.created_at_date: "7 days"]
    unless: [view_08212.id, view_08212.status]
  }

  join: view_08214 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08212.user_id} = ${view_08214.id} ;;
    required_joins: []
  }

  join: view_08215 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08212.account_id} = ${view_08215.account_id} ;;
    required_joins: [view_08214]
  }

  join: view_08216 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08212.category} = ${view_08216.category} ;;
  }

  access_filter: {
    field: view_08212.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08212.is_deleted} = false ;;
}

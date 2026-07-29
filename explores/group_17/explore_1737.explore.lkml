# Explore: explore_1737
# Auto-generated LookML Explore File

include: "/views/domain_12/view_05212.view.lkml"
include: "/views/domain_14/view_05214.view.lkml"
include: "/views/domain_15/view_05215.view.lkml"
include: "/views/domain_16/view_05216.view.lkml"

explore: explore_1737 {
  label: "Explore Explore 1737"
  description: "Comprehensive analytics explore joining base view_05212 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_05212
  
  always_filter: {
    filters: [view_05212.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05212.created_at_date: "7 days"]
    unless: [view_05212.id, view_05212.status]
  }

  join: view_05214 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05212.user_id} = ${view_05214.id} ;;
    required_joins: []
  }

  join: view_05215 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05212.account_id} = ${view_05215.account_id} ;;
    required_joins: [view_05214]
  }

  join: view_05216 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05212.category} = ${view_05216.category} ;;
  }

  access_filter: {
    field: view_05212.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05212.is_deleted} = false ;;
}

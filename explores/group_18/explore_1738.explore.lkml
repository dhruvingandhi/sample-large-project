# Update for 2000 file diff target
# Explore: explore_1738
# Auto-generated LookML Explore File

include: "/views/domain_15/view_05215.view.lkml"
include: "/views/domain_17/view_05217.view.lkml"
include: "/views/domain_18/view_05218.view.lkml"
include: "/views/domain_19/view_05219.view.lkml"

explore: explore_1738 {
  label: "Explore Explore 1738"
  description: "Comprehensive analytics explore joining base view_05215 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_05215
  
  always_filter: {
    filters: [view_05215.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05215.created_at_date: "7 days"]
    unless: [view_05215.id, view_05215.status]
  }

  join: view_05217 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05215.user_id} = ${view_05217.id} ;;
    required_joins: []
  }

  join: view_05218 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05215.account_id} = ${view_05218.account_id} ;;
    required_joins: [view_05217]
  }

  join: view_05219 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05215.category} = ${view_05219.category} ;;
  }

  access_filter: {
    field: view_05215.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05215.is_deleted} = false ;;
}

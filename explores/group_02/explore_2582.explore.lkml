# Explore: explore_2582
# Auto-generated LookML Explore File

include: "/views/domain_47/view_07747.view.lkml"
include: "/views/domain_49/view_07749.view.lkml"
include: "/views/domain_50/view_07750.view.lkml"
include: "/views/domain_01/view_07751.view.lkml"

explore: explore_2582 {
  label: "Explore Explore 2582"
  description: "Comprehensive analytics explore joining base view_07747 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_07747
  
  always_filter: {
    filters: [view_07747.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07747.created_at_date: "7 days"]
    unless: [view_07747.id, view_07747.status]
  }

  join: view_07749 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07747.user_id} = ${view_07749.id} ;;
    required_joins: []
  }

  join: view_07750 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07747.account_id} = ${view_07750.account_id} ;;
    required_joins: [view_07749]
  }

  join: view_07751 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07747.category} = ${view_07751.category} ;;
  }

  access_filter: {
    field: view_07747.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07747.is_deleted} = false ;;
}

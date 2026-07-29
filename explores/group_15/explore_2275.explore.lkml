# Explore: explore_2275
# Auto-generated LookML Explore File

include: "/views/domain_26/view_06826.view.lkml"
include: "/views/domain_28/view_06828.view.lkml"
include: "/views/domain_29/view_06829.view.lkml"
include: "/views/domain_30/view_06830.view.lkml"

explore: explore_2275 {
  label: "Explore Explore 2275"
  description: "Comprehensive analytics explore joining base view_06826 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_06826
  
  always_filter: {
    filters: [view_06826.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06826.created_at_date: "7 days"]
    unless: [view_06826.id, view_06826.status]
  }

  join: view_06828 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06826.user_id} = ${view_06828.id} ;;
    required_joins: []
  }

  join: view_06829 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06826.account_id} = ${view_06829.account_id} ;;
    required_joins: [view_06828]
  }

  join: view_06830 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06826.category} = ${view_06830.category} ;;
  }

  access_filter: {
    field: view_06826.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06826.is_deleted} = false ;;
}

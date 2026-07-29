# Explore: explore_1611
# Auto-generated LookML Explore File

include: "/views/domain_34/view_04834.view.lkml"
include: "/views/domain_36/view_04836.view.lkml"
include: "/views/domain_37/view_04837.view.lkml"
include: "/views/domain_38/view_04838.view.lkml"

explore: explore_1611 {
  label: "Explore Explore 1611"
  description: "Comprehensive analytics explore joining base view_04834 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_04834
  
  always_filter: {
    filters: [view_04834.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04834.created_at_date: "7 days"]
    unless: [view_04834.id, view_04834.status]
  }

  join: view_04836 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04834.user_id} = ${view_04836.id} ;;
    required_joins: []
  }

  join: view_04837 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04834.account_id} = ${view_04837.account_id} ;;
    required_joins: [view_04836]
  }

  join: view_04838 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04834.category} = ${view_04838.category} ;;
  }

  access_filter: {
    field: view_04834.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04834.is_deleted} = false ;;
}

# Explore: explore_1975
# Auto-generated LookML Explore File

include: "/views/domain_26/view_05926.view.lkml"
include: "/views/domain_28/view_05928.view.lkml"
include: "/views/domain_29/view_05929.view.lkml"
include: "/views/domain_30/view_05930.view.lkml"

explore: explore_1975 {
  label: "Explore Explore 1975"
  description: "Comprehensive analytics explore joining base view_05926 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_05926
  
  always_filter: {
    filters: [view_05926.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05926.created_at_date: "7 days"]
    unless: [view_05926.id, view_05926.status]
  }

  join: view_05928 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05926.user_id} = ${view_05928.id} ;;
    required_joins: []
  }

  join: view_05929 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05926.account_id} = ${view_05929.account_id} ;;
    required_joins: [view_05928]
  }

  join: view_05930 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05926.category} = ${view_05930.category} ;;
  }

  access_filter: {
    field: view_05926.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05926.is_deleted} = false ;;
}

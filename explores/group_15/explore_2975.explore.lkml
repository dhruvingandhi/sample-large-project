# Explore: explore_2975
# Auto-generated LookML Explore File

include: "/views/domain_26/view_08926.view.lkml"
include: "/views/domain_28/view_08928.view.lkml"
include: "/views/domain_29/view_08929.view.lkml"
include: "/views/domain_30/view_08930.view.lkml"

explore: explore_2975 {
  label: "Explore Explore 2975"
  description: "Comprehensive analytics explore joining base view_08926 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_08926
  
  always_filter: {
    filters: [view_08926.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08926.created_at_date: "7 days"]
    unless: [view_08926.id, view_08926.status]
  }

  join: view_08928 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08926.user_id} = ${view_08928.id} ;;
    required_joins: []
  }

  join: view_08929 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08926.account_id} = ${view_08929.account_id} ;;
    required_joins: [view_08928]
  }

  join: view_08930 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08926.category} = ${view_08930.category} ;;
  }

  access_filter: {
    field: view_08926.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08926.is_deleted} = false ;;
}

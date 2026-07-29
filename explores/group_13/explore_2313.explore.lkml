# Explore: explore_2313
# Auto-generated LookML Explore File

include: "/views/domain_40/view_06940.view.lkml"
include: "/views/domain_42/view_06942.view.lkml"
include: "/views/domain_43/view_06943.view.lkml"
include: "/views/domain_44/view_06944.view.lkml"

explore: explore_2313 {
  label: "Explore Explore 2313"
  description: "Comprehensive analytics explore joining base view_06940 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_06940
  
  always_filter: {
    filters: [view_06940.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06940.created_at_date: "7 days"]
    unless: [view_06940.id, view_06940.status]
  }

  join: view_06942 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06940.user_id} = ${view_06942.id} ;;
    required_joins: []
  }

  join: view_06943 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06940.account_id} = ${view_06943.account_id} ;;
    required_joins: [view_06942]
  }

  join: view_06944 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06940.category} = ${view_06944.category} ;;
  }

  access_filter: {
    field: view_06940.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06940.is_deleted} = false ;;
}

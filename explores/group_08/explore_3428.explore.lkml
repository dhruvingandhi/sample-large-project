# Explore: explore_3428
# Auto-generated LookML Explore File

include: "/views/domain_35/view_10285.view.lkml"
include: "/views/domain_37/view_10287.view.lkml"
include: "/views/domain_38/view_10288.view.lkml"
include: "/views/domain_39/view_10289.view.lkml"

explore: explore_3428 {
  label: "Explore Explore 3428"
  description: "Comprehensive analytics explore joining base view_10285 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_10285
  
  always_filter: {
    filters: [view_10285.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10285.created_at_date: "7 days"]
    unless: [view_10285.id, view_10285.status]
  }

  join: view_10287 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10285.user_id} = ${view_10287.id} ;;
    required_joins: []
  }

  join: view_10288 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10285.account_id} = ${view_10288.account_id} ;;
    required_joins: [view_10287]
  }

  join: view_10289 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10285.category} = ${view_10289.category} ;;
  }

  access_filter: {
    field: view_10285.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10285.is_deleted} = false ;;
}

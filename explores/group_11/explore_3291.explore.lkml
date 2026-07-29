# Explore: explore_3291
# Auto-generated LookML Explore File

include: "/views/domain_24/view_09874.view.lkml"
include: "/views/domain_26/view_09876.view.lkml"
include: "/views/domain_27/view_09877.view.lkml"
include: "/views/domain_28/view_09878.view.lkml"

explore: explore_3291 {
  label: "Explore Explore 3291"
  description: "Comprehensive analytics explore joining base view_09874 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_09874
  
  always_filter: {
    filters: [view_09874.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09874.created_at_date: "7 days"]
    unless: [view_09874.id, view_09874.status]
  }

  join: view_09876 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09874.user_id} = ${view_09876.id} ;;
    required_joins: []
  }

  join: view_09877 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09874.account_id} = ${view_09877.account_id} ;;
    required_joins: [view_09876]
  }

  join: view_09878 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09874.category} = ${view_09878.category} ;;
  }

  access_filter: {
    field: view_09874.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09874.is_deleted} = false ;;
}

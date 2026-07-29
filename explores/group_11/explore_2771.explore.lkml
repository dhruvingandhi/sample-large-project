# Explore: explore_2771
# Auto-generated LookML Explore File

include: "/views/domain_14/view_08314.view.lkml"
include: "/views/domain_16/view_08316.view.lkml"
include: "/views/domain_17/view_08317.view.lkml"
include: "/views/domain_18/view_08318.view.lkml"

explore: explore_2771 {
  label: "Explore Explore 2771"
  description: "Comprehensive analytics explore joining base view_08314 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_08314
  
  always_filter: {
    filters: [view_08314.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08314.created_at_date: "7 days"]
    unless: [view_08314.id, view_08314.status]
  }

  join: view_08316 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08314.user_id} = ${view_08316.id} ;;
    required_joins: []
  }

  join: view_08317 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08314.account_id} = ${view_08317.account_id} ;;
    required_joins: [view_08316]
  }

  join: view_08318 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08314.category} = ${view_08318.category} ;;
  }

  access_filter: {
    field: view_08314.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08314.is_deleted} = false ;;
}

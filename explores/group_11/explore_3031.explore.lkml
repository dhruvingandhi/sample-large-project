# Explore: explore_3031
# Auto-generated LookML Explore File

include: "/views/domain_44/view_09094.view.lkml"
include: "/views/domain_46/view_09096.view.lkml"
include: "/views/domain_47/view_09097.view.lkml"
include: "/views/domain_48/view_09098.view.lkml"

explore: explore_3031 {
  label: "Explore Explore 3031"
  description: "Comprehensive analytics explore joining base view_09094 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_09094
  
  always_filter: {
    filters: [view_09094.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09094.created_at_date: "7 days"]
    unless: [view_09094.id, view_09094.status]
  }

  join: view_09096 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09094.user_id} = ${view_09096.id} ;;
    required_joins: []
  }

  join: view_09097 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09094.account_id} = ${view_09097.account_id} ;;
    required_joins: [view_09096]
  }

  join: view_09098 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09094.category} = ${view_09098.category} ;;
  }

  access_filter: {
    field: view_09094.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09094.is_deleted} = false ;;
}

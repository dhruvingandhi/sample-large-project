# Explore: explore_3131
# Auto-generated LookML Explore File

include: "/views/domain_44/view_09394.view.lkml"
include: "/views/domain_46/view_09396.view.lkml"
include: "/views/domain_47/view_09397.view.lkml"
include: "/views/domain_48/view_09398.view.lkml"

explore: explore_3131 {
  label: "Explore Explore 3131"
  description: "Comprehensive analytics explore joining base view_09394 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_09394
  
  always_filter: {
    filters: [view_09394.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09394.created_at_date: "7 days"]
    unless: [view_09394.id, view_09394.status]
  }

  join: view_09396 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09394.user_id} = ${view_09396.id} ;;
    required_joins: []
  }

  join: view_09397 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09394.account_id} = ${view_09397.account_id} ;;
    required_joins: [view_09396]
  }

  join: view_09398 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09394.category} = ${view_09398.category} ;;
  }

  access_filter: {
    field: view_09394.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09394.is_deleted} = false ;;
}

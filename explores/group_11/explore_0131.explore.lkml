# Explore: explore_0131
# Auto-generated LookML Explore File

include: "/views/domain_44/view_00394.view.lkml"
include: "/views/domain_46/view_00396.view.lkml"
include: "/views/domain_47/view_00397.view.lkml"
include: "/views/domain_48/view_00398.view.lkml"

explore: explore_0131 {
  label: "Explore Explore 0131"
  description: "Comprehensive analytics explore joining base view_00394 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_00394
  
  always_filter: {
    filters: [view_00394.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00394.created_at_date: "7 days"]
    unless: [view_00394.id, view_00394.status]
  }

  join: view_00396 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00394.user_id} = ${view_00396.id} ;;
    required_joins: []
  }

  join: view_00397 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00394.account_id} = ${view_00397.account_id} ;;
    required_joins: [view_00396]
  }

  join: view_00398 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00394.category} = ${view_00398.category} ;;
  }

  access_filter: {
    field: view_00394.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00394.is_deleted} = false ;;
}

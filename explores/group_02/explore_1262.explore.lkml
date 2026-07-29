# Explore: explore_1262
# Auto-generated LookML Explore File

include: "/views/domain_37/view_03787.view.lkml"
include: "/views/domain_39/view_03789.view.lkml"
include: "/views/domain_40/view_03790.view.lkml"
include: "/views/domain_41/view_03791.view.lkml"

explore: explore_1262 {
  label: "Explore Explore 1262"
  description: "Comprehensive analytics explore joining base view_03787 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_03787
  
  always_filter: {
    filters: [view_03787.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03787.created_at_date: "7 days"]
    unless: [view_03787.id, view_03787.status]
  }

  join: view_03789 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03787.user_id} = ${view_03789.id} ;;
    required_joins: []
  }

  join: view_03790 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03787.account_id} = ${view_03790.account_id} ;;
    required_joins: [view_03789]
  }

  join: view_03791 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03787.category} = ${view_03791.category} ;;
  }

  access_filter: {
    field: view_03787.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03787.is_deleted} = false ;;
}

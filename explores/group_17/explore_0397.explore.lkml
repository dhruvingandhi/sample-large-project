# Explore: explore_0397
# Auto-generated LookML Explore File

include: "/views/domain_42/view_01192.view.lkml"
include: "/views/domain_44/view_01194.view.lkml"
include: "/views/domain_45/view_01195.view.lkml"
include: "/views/domain_46/view_01196.view.lkml"

explore: explore_0397 {
  label: "Explore Explore 0397"
  description: "Comprehensive analytics explore joining base view_01192 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_01192
  
  always_filter: {
    filters: [view_01192.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01192.created_at_date: "7 days"]
    unless: [view_01192.id, view_01192.status]
  }

  join: view_01194 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01192.user_id} = ${view_01194.id} ;;
    required_joins: []
  }

  join: view_01195 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01192.account_id} = ${view_01195.account_id} ;;
    required_joins: [view_01194]
  }

  join: view_01196 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01192.category} = ${view_01196.category} ;;
  }

  access_filter: {
    field: view_01192.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01192.is_deleted} = false ;;
}

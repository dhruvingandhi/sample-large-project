# Explore: explore_0931
# Auto-generated LookML Explore File

include: "/views/domain_44/view_02794.view.lkml"
include: "/views/domain_46/view_02796.view.lkml"
include: "/views/domain_47/view_02797.view.lkml"
include: "/views/domain_48/view_02798.view.lkml"

explore: explore_0931 {
  label: "Explore Explore 0931"
  description: "Comprehensive analytics explore joining base view_02794 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_02794
  
  always_filter: {
    filters: [view_02794.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02794.created_at_date: "7 days"]
    unless: [view_02794.id, view_02794.status]
  }

  join: view_02796 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02794.user_id} = ${view_02796.id} ;;
    required_joins: []
  }

  join: view_02797 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02794.account_id} = ${view_02797.account_id} ;;
    required_joins: [view_02796]
  }

  join: view_02798 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02794.category} = ${view_02798.category} ;;
  }

  access_filter: {
    field: view_02794.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02794.is_deleted} = false ;;
}

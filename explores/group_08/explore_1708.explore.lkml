# Explore: explore_1708
# Auto-generated LookML Explore File

include: "/views/domain_25/view_05125.view.lkml"
include: "/views/domain_27/view_05127.view.lkml"
include: "/views/domain_28/view_05128.view.lkml"
include: "/views/domain_29/view_05129.view.lkml"

explore: explore_1708 {
  label: "Explore Explore 1708"
  description: "Comprehensive analytics explore joining base view_05125 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_05125
  
  always_filter: {
    filters: [view_05125.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05125.created_at_date: "7 days"]
    unless: [view_05125.id, view_05125.status]
  }

  join: view_05127 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05125.user_id} = ${view_05127.id} ;;
    required_joins: []
  }

  join: view_05128 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05125.account_id} = ${view_05128.account_id} ;;
    required_joins: [view_05127]
  }

  join: view_05129 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05125.category} = ${view_05129.category} ;;
  }

  access_filter: {
    field: view_05125.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05125.is_deleted} = false ;;
}

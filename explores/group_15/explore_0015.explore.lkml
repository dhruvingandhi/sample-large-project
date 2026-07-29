# Explore: explore_0015
# Auto-generated LookML Explore File

include: "/views/domain_46/view_00046.view.lkml"
include: "/views/domain_48/view_00048.view.lkml"
include: "/views/domain_49/view_00049.view.lkml"
include: "/views/domain_50/view_00050.view.lkml"

explore: explore_0015 {
  label: "Explore Explore 0015"
  description: "Comprehensive analytics explore joining base view_00046 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_00046
  
  always_filter: {
    filters: [view_00046.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00046.created_at_date: "7 days"]
    unless: [view_00046.id, view_00046.status]
  }

  join: view_00048 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00046.user_id} = ${view_00048.id} ;;
    required_joins: []
  }

  join: view_00049 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00046.account_id} = ${view_00049.account_id} ;;
    required_joins: [view_00048]
  }

  join: view_00050 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00046.category} = ${view_00050.category} ;;
  }

  access_filter: {
    field: view_00046.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00046.is_deleted} = false ;;
}

# Explore: explore_0235
# Auto-generated LookML Explore File

include: "/views/domain_06/view_00706.view.lkml"
include: "/views/domain_08/view_00708.view.lkml"
include: "/views/domain_09/view_00709.view.lkml"
include: "/views/domain_10/view_00710.view.lkml"

explore: explore_0235 {
  label: "Explore Explore 0235"
  description: "Comprehensive analytics explore joining base view_00706 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_00706
  
  always_filter: {
    filters: [view_00706.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00706.created_at_date: "7 days"]
    unless: [view_00706.id, view_00706.status]
  }

  join: view_00708 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00706.user_id} = ${view_00708.id} ;;
    required_joins: []
  }

  join: view_00709 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00706.account_id} = ${view_00709.account_id} ;;
    required_joins: [view_00708]
  }

  join: view_00710 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00706.category} = ${view_00710.category} ;;
  }

  access_filter: {
    field: view_00706.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00706.is_deleted} = false ;;
}

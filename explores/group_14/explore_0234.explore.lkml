# Explore: explore_0234
# Auto-generated LookML Explore File

include: "/views/domain_03/view_00703.view.lkml"
include: "/views/domain_05/view_00705.view.lkml"
include: "/views/domain_06/view_00706.view.lkml"
include: "/views/domain_07/view_00707.view.lkml"

explore: explore_0234 {
  label: "Explore Explore 0234"
  description: "Comprehensive analytics explore joining base view_00703 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_00703
  
  always_filter: {
    filters: [view_00703.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00703.created_at_date: "7 days"]
    unless: [view_00703.id, view_00703.status]
  }

  join: view_00705 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00703.user_id} = ${view_00705.id} ;;
    required_joins: []
  }

  join: view_00706 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00703.account_id} = ${view_00706.account_id} ;;
    required_joins: [view_00705]
  }

  join: view_00707 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00703.category} = ${view_00707.category} ;;
  }

  access_filter: {
    field: view_00703.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00703.is_deleted} = false ;;
}
